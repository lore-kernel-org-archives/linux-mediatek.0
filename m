Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0F8C77B62
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 13:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CO0pQDMp5I0AV3BjTtxDDlMUrQBt4c30rrUmdLkhQxQ=; b=S6dyrCntZUnTzQ93aTBHWc7ocF
	X2BBM0Q1VKzynf+pOQPTOd842+ELfFWrkfyKfci5aBzqx3c4Vlz0rSlccp7rJcG4SZDP6enOBy9cs
	T32+ma2+a7Oh/8QphV6P7iPqsWnpC0p00upYQz23uTEOnslWaHuxPAOjUBAfQutLHVPbkNUL0FR/v
	5kHfhpPydhQ5lKzVClV2v3VwBep/r0oqinarPZT0xj1Zj/alm+wqdgG9Z7/FkKDo7ZS0E+QIZagyx
	J7Pa7s1z10T8m0eErZp1jtdI1LHsSt5iE27WcnLCwM4SDT/LzFFsgAR3xnzeZsf4dthnPHGYM3zXv
	AaZ11EIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZy-007Ugi-0d;
	Fri, 31 Mar 2023 13:14:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZt-007Udz-1i
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 13:14:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 22607B82F6D;
	Fri, 31 Mar 2023 13:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8137FC433EF;
	Fri, 31 Mar 2023 13:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680268438;
	bh=N4DT9nDSliiFONQaT3jUyRHewbKeqGxRRHMjesy9rxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jNYohSc0UcD9cddo/U7K31IbDSvz89gZSLvZUWkQXOqF/wvHNss9OWZIWy0Rq7ujh
	 asHIMyuS2EWDoGW5Q27wlCkiRcb+erpnHE0iB8GXLwfA20nfmsRrrqmVwXsP04/DpG
	 DrItq8R/XuQzqr2j/RlAbTeuWjl0h2trtxpfX//x3fqbgjfnpzhKrs8phEm4gT1yxZ
	 4IwlTQA4lbC35RVkD10iAi6Qh6CYRipo6KIrP/10HcGB9EHiiJnVeG68ePOmMhlchC
	 2d5sGpxfxMw7zDbNYuXhIsDpPGZ8wAaJtJZmNEllw+dYoHlAZNSUBDWwNRTzjJ470W
	 xA9wjZNMTyuKw==
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
Subject: [PATCH v2 net-next 08/10] net: ethernet: mtk_wed: move dlm a dedicated dts node
Date: Fri, 31 Mar 2023 15:12:44 +0200
Message-Id: <ba52543d377b0be558175ab4aaa9b6761e3760a4.1680268101.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680268101.git.lorenzo@kernel.org>
References: <cover.1680268101.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_061401_779117_DDB0EBD0 
X-CRM114-Status: GOOD (  11.56  )
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

Since the dlm memory region is not part of the MT7986 RAM SoC, move dlm
in a deidicated syscon node.
Keep backward-compatibility with older dts version where dlm was defined
as reserved-memory child node.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 95d890870984..e479ff924ed6 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -799,6 +799,24 @@ mtk_wed_rro_alloc(struct mtk_wed_device *dev)
 	struct device_node *np;
 	int index;
 
+	np = of_parse_phandle(dev->hw->node, "mediatek,wo-dlm", 0);
+	if (np) {
+		struct resource res;
+		int ret;
+
+		ret = of_address_to_resource(np, 0, &res);
+		of_node_put(np);
+
+		if (ret < 0)
+			return ret;
+
+		dev->rro.miod_phys = res.start;
+		goto out;
+	}
+
+	/* For backward compatibility, we need to check if DLM
+	 * node is defined through reserved memory property.
+	 */
 	index = of_property_match_string(dev->hw->node, "memory-region-names",
 					 "wo-dlm");
 	if (index < 0)
@@ -815,6 +833,7 @@ mtk_wed_rro_alloc(struct mtk_wed_device *dev)
 		return -ENODEV;
 
 	dev->rro.miod_phys = rmem->base;
+out:
 	dev->rro.fdbk_phys = MTK_WED_MIOD_COUNT + dev->rro.miod_phys;
 
 	return mtk_wed_rro_ring_alloc(dev, &dev->rro.ring,
-- 
2.39.2


