Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D95C77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfcXdohjvKRQy+EOUZJ4rpmUL6tZkFjY6y4oH8PwkNI=; b=a0zenO8mcwNt2k+ysmBXls+LqK
	0Mr8SVJ69sEe84Wkl0Lrv+YESxZwmn4RCdS5cILD+Drp6Mq/m8XhFyzk8kWzQhsmRV1E8bqjuQRog
	8B+w7v+MKrKZRCGWtPd2nHCgbsKzCm1cCxTuEDeWblzXojGUo2tWHdh0BddMHVmJe2ftAzgi0S3KX
	aMAs1D/O3AmpjDKu5CjmIT5C3eyh49g4/m8EY3WWbjloHgvaz1J5iOa1PqxGICMkyv7ND+OCyhRva
	XFJ9MQdR+lmxFIDfRYes2oixBDUcwAQUv7610RZoMbHu+NU0LcuRU535kEv4mjbIKqGRTlyY64v2q
	ZXT1GHpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZV-007USi-01;
	Fri, 31 Mar 2023 13:13:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZS-007URl-2P
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 13:13:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3DC05628C8;
	Fri, 31 Mar 2023 13:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B86C433EF;
	Fri, 31 Mar 2023 13:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680268412;
	bh=0Z0VSc/Pdg8WAOtxQIuNbiILq7OdgMdHZPAiZ/hleNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RMS0Vb5+vEa1g/Kqfrg1KNSBMoPz2kc0O+kTypYgZCOxjBFIAls+i+VyuJwXgDn/d
	 M1ar0Bw8m8qRBLSWeokN8yKUg2yOL1Mme+RwjvuMrpgwekcASFCbImWa6/mbXJnVVR
	 FlVTc3kQew36Kw6RWdiJ1aACzV6TL7LGng4TKFSpHZzzOwCweQAbtNu55g9CRbURuz
	 VwQ93LFugK3eaCdVP5jcm7x+ayu41FgVlfJAIdkWj6fmPIn6cNTNCJ5DkXeTetoNz0
	 +FV4mfuE8a5tYkeedfjwKUNy2ZiW/2aC0GFK2UGx3VUoecbY5uREpVdlVW6huE7f0R
	 55tnNUpbIxpqA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	kuba@kernel.org,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo.bianconi@redhat.com,
	daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 net-next 01/10] net: ethernet: mtk_wed: rename mtk_wed_get_memory_region in mtk_wed_get_reserved_memory_region
Date: Fri, 31 Mar 2023 15:12:37 +0200
Message-Id: <2915976b78fddb4b918c071d7409efa832201f3e.1680268101.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680268101.git.lorenzo@kernel.org>
References: <cover.1680268101.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_061334_821232_DE23B7AA 
X-CRM114-Status: GOOD (  11.30  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is a preliminary patch to move Wireless Ethernet Dispatch (WED)
ilm/dlm and cpuboot properties in dedicated dts nodes.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
index 6bad0d262f28..6624f6d6abdd 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
@@ -215,8 +215,8 @@ int mtk_wed_mcu_msg_update(struct mtk_wed_device *dev, int id, void *data,
 }
 
 static int
-mtk_wed_get_memory_region(struct mtk_wed_wo *wo,
-			  struct mtk_wed_wo_memory_region *region)
+mtk_wed_get_reserved_memory_region(struct mtk_wed_wo *wo,
+				   struct mtk_wed_wo_memory_region *region)
 {
 	struct reserved_mem *rmem;
 	struct device_node *np;
@@ -311,13 +311,13 @@ mtk_wed_mcu_load_firmware(struct mtk_wed_wo *wo)
 
 	/* load firmware region metadata */
 	for (i = 0; i < ARRAY_SIZE(mem_region); i++) {
-		ret = mtk_wed_get_memory_region(wo, &mem_region[i]);
+		ret = mtk_wed_get_reserved_memory_region(wo, &mem_region[i]);
 		if (ret)
 			return ret;
 	}
 
 	wo->boot.name = "wo-boot";
-	ret = mtk_wed_get_memory_region(wo, &wo->boot);
+	ret = mtk_wed_get_reserved_memory_region(wo, &wo->boot);
 	if (ret)
 		return ret;
 
-- 
2.39.2


