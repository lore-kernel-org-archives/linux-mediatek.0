Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047EEC07E96
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 01:03:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C72246100A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 01:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C72246100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FYA6LRjuR5EBDqN18xF3aoWe6Kbc4opwACH+8DjPPQ=; b=o5CENj8dpQqfVJ
	tNu2sgLedYmLWbVVSLdIHLlNxkWTrPWBVgPGCLe4m+FN/6Qo5m7+X/mKovEDu+euCwBhf1sI9+G0l
	+z4Fzi6hoR4iwiWExjlIXHIL/pd3dFiwmGwrMOs+1YaZ0OegtCnwFRIWimWzFXcYj+00PzcYEDj3+
	1eiMXTgTCivvUuC8/hP6l5zvjdtCS7AZGH39mAJc7ywH5s8qutfEuZNKsw9F8GnNR5ZvKriik5D9t
	SMV/cAaM+H7oKDIXcwRRR5RghgPBfB9ZT/aJkNT38AZkpdMRb4FHoHlaw0tFOzsTgWXorgu0sSoyn
	iX2L/vWjh0+ypEfMzf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2kML-005eE6-Rg; Mon, 12 Jul 2021 01:03:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2kLt-005e73-WC; Mon, 12 Jul 2021 01:03:20 +0000
X-UUID: 92173e3a25ca413bad0dea944e20b32f-20210711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=N8V7w3QbeAdL+nWpPALzC5cgI2S9BtXkeTkHS0Li5XI=; 
 b=h5zOdH5w9mkLc/OGNfU8nx3rUQQRZ+r7WjNIqv4M0JJ9K+4jdlCTkcTX8zKtXJju+nfMnjRqNBCfH09tUVdZSqJcePwYHCZL/scFG75zU462lza+ACodBly1ZhMv1aBe0DTdGHA/QpZfY6w+hX2r8FxaZmqsnOpp8npvFsN7yCo=;
X-UUID: 92173e3a25ca413bad0dea944e20b32f-20210711
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 346227360; Sun, 11 Jul 2021 18:03:11 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Jul 2021 18:03:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Jul 2021 09:03:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Jul 2021 09:03:03 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>
Subject: [PATCH v2, 3/3] arm64: dts: mt8183: refine aal compatible name
Date: Mon, 12 Jul 2021 09:02:58 +0800
Message-ID: <1626051778-13577-4-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1626051778-13577-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1626051778-13577-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_180318_103575_5A8751F8 
X-CRM114-Status: GOOD (  11.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt8183 aal is different with mt8173
remove mt8173 compatible name for mt8183 aal

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c5e822b..1ca5f9b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1204,8 +1204,7 @@
 		};
 
 		aal0: aal@14010000 {
-			compatible = "mediatek,mt8183-disp-aal",
-				     "mediatek,mt8173-disp-aal";
+			compatible = "mediatek,mt8183-disp-aal";
 			reg = <0 0x14010000 0 0x1000>;
 			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
