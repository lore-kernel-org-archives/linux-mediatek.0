Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715CFC4CECE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 474CF2073E
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C1465F2a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xkst6e8J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 474CF2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0aUlJZxZLc1WmRdgPAyooBKnNIaz2vU4r7JGeisE1o=; b=C1465F2aX0y8AA
	f23OCUDhDbeDYBU7A78uwB/UOtgma4ew780wfdzXBB2xU/TqqZk1IkXNATq6TngEtfXs4G3nWri5L
	wL8KWPuWjZqWtji+TRCQgRLXe2zIOj6EAH95TmGtOplHrdbVe1N8LBmmLVj0tsvFhB1+0NJ22rMIi
	47Fs+1uUEavtTLFXDRPRpht4rtIVxdnQ+WXPix9CJ9Bbe4E8sxwiZrQBW4PNXuJK1PiZJAZkAGEjS
	9+75xjxX51PSIdFFD6tGKHZ5QXx86bt0zrMSAX9g01BYv3/Np+Fl3jA6etMI4lUeDM7rvfH2xZXpT
	4dW5bNN6lvj7NAEB1fmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFI3-0006S6-3f; Tue, 17 Mar 2020 16:42:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFHy-0006OO-AD
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:41:59 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8FFE20735;
 Tue, 17 Mar 2020 16:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463318;
 bh=PhYzXMiu6M/ihPmkaCf5OUWz81gXLI8wvw1mMIUhZlU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xkst6e8J8nC9eeX1avzqa0F9wdUkCXTyEV5EHKGs0cVSbzhcEphrX+xSlSqU6l7fp
 KdkR/sjahexQNhDaWrgv5hfZD9AJOzMDyRDa4Lb3es0po3+h6J9/ps1H3t6LZhoP6L
 96NyzubnkKST9gaSP91+tAnYmMbCkdAguGyq/96k=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 03/25] mt76: mt7615: cleanup fw queue just for mmio devices
Date: Tue, 17 Mar 2020 17:41:10 +0100
Message-Id: <829a462548170c6ef027a2062c68d7af5e064187.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094158_377378_0DC30E17 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In order to reuse mt7615_mcu_send_firmware routine adding support for
usb devices, clean fw hw queue just for mmio devices

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index a4e971d7f6a7..b24240f90a7d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -321,7 +321,9 @@ static int mt7615_mcu_send_firmware(struct mt7615_dev *dev, const void *data,
 
 		data += cur_len;
 		len -= cur_len;
-		mt76_queue_tx_cleanup(dev, MT_TXQ_FWDL, false);
+
+		if (mt76_is_mmio(&dev->mt76))
+			mt76_queue_tx_cleanup(dev, MT_TXQ_FWDL, false);
 	}
 
 	return ret;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
