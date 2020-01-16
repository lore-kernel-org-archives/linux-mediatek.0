Return-Path: <SRS0=rC0f=3F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEF0C33CB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 17:12:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDED22469B
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 17:12:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kwd4GpbX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zggOnGeC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDED22469B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EXo4g58ENhFacN58wtDvhWWe5r6g/CGPSkEajZwiEf8=; b=Kwd4GpbXreSEAo
	koxtaLS+Whsoyu5051dGvveKFPtFogfCrESpw6JglXJFUylcwUwEJ24Q/cJ3QuyWKo6Wa13LAv04V
	URudoAi58Iw1/DW9cGYc1h6NeNkYtY9+TILgSKf+kjobm2+iFwEa0OIDE+iLJLiAdC88LPlVMeA7f
	7d+PWAg1OKhUga8bbpt4K9DwoqSvd3cfKp1klShkmI4PTrxLc/BJlKj9VINprwMcNLXGrspNX+rhF
	93Y+E6t3YoPa9AAIr8DKyqHF24rf1UwwPJnWVIoQh4QyzQ7RNOZDRCP30Nw4Djo8pfmuMGQMf5kSw
	6V6kyqXgGn9luIekNlpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is8gs-0005r7-Mu; Thu, 16 Jan 2020 17:12:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8WI-0001X7-Tf; Thu, 16 Jan 2020 17:01:27 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35AE520730;
 Thu, 16 Jan 2020 17:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194082;
 bh=hyqnidKUhr5IO7828ua1HHV6ukySUvw9Gad4wTAK1DE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zggOnGeCZI/EA26jG4oEv6sh3FOEnUmDJdbScRBHtN81CbU0F7jAhANQARL5d0hSU
 +ZJC6X6/o00Eu/RuspxeEGruweQl0VKLA+mkCA1DzmI27VpDhNI28YFv7XCBsyH/vp
 6C1oqoQU9pH/YW2cVmemwzQ6BGPk7wNsKLKCFJa0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 187/671] mt76: usb: fix possible memory leak in
 mt76u_buf_free
Date: Thu, 16 Jan 2020 11:51:36 -0500
Message-Id: <20200116165940.10720-70-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116165940.10720-1-sashal@kernel.org>
References: <20200116165940.10720-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_090123_020420_1A0399C9 
X-CRM114-Status: GOOD (  11.59  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>

[ Upstream commit cb83585e1121bd6d6c039cf09fa32380bf8b6258 ]

Move q->ndesc initialization before the for loop in mt76u_alloc_rx
since otherwise allocated urbs will not be freed in mt76u_buf_free
Double-check scatterlist pointer in mt76u_buf_free

Fixes: b40b15e1521f ("mt76: add usb support to mt76 layer")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/usb.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 8d40e92fb6f2..dcf927de65f3 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -273,10 +273,16 @@ EXPORT_SYMBOL_GPL(mt76u_buf_alloc);
 void mt76u_buf_free(struct mt76u_buf *buf)
 {
 	struct urb *urb = buf->urb;
+	struct scatterlist *sg;
 	int i;
 
-	for (i = 0; i < urb->num_sgs; i++)
-		skb_free_frag(sg_virt(&urb->sg[i]));
+	for (i = 0; i < urb->num_sgs; i++) {
+		sg = &urb->sg[i];
+		if (!sg)
+			continue;
+
+		skb_free_frag(sg_virt(sg));
+	}
 	usb_free_urb(buf->urb);
 }
 EXPORT_SYMBOL_GPL(mt76u_buf_free);
@@ -478,7 +484,8 @@ static int mt76u_alloc_rx(struct mt76_dev *dev)
 		nsgs = 1;
 	}
 
-	for (i = 0; i < MT_NUM_RX_ENTRIES; i++) {
+	q->ndesc = MT_NUM_RX_ENTRIES;
+	for (i = 0; i < q->ndesc; i++) {
 		err = mt76u_buf_alloc(dev, &q->entry[i].ubuf,
 				      nsgs, q->buf_size,
 				      SKB_WITH_OVERHEAD(q->buf_size),
@@ -486,7 +493,6 @@ static int mt76u_alloc_rx(struct mt76_dev *dev)
 		if (err < 0)
 			return err;
 	}
-	q->ndesc = MT_NUM_RX_ENTRIES;
 
 	return mt76u_submit_rx_buffers(dev);
 }
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
