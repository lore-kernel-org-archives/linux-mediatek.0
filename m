Return-Path: <SRS0=YIXp=5T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8580C43331
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 09:51:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F7F020737
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 09:51:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lxqZ+heW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bEAaiwlp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F7F020737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yasa9DUrVk6nunnaGWLtZnFUw2CpsFbSSjC7h3HZAI4=; b=lxqZ+heWNkhAkW
	SvtJPcdTCZVL5gYcCl6yMwMbafXxrc/nBTGeSHDaNLu+fJ6NdxNJWWqmi52oM0NpePROG+v5pTdWB
	jKht/sAkk0n6ipGD8pYtn/wglL79JpnG78q9VANKQXFsQIwlMWgndRT0xo9+0uL6aGHkgtDsb5k+Q
	sF/WHf0YgE9t8zvH516uJgVLRsKrfmfSUrIDzh/60/TkjKZoW8wLcztVBb+zDO3rrW4MNyu2t+7cd
	mkbdKeDaE6SYvTpsBf/03XtaxPJxyK0rnVfKdyNNn2FJjT5rMou11hLEemWkTYnQLp8q4tzK+mc+c
	AwistY60/2h3oxqRwbcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKIyr-0000os-1h; Fri, 03 Apr 2020 09:51:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKIyH-0000Eq-3W; Fri, 03 Apr 2020 09:50:42 +0000
X-UUID: 72e4cbbe0f354afe967cdaae3fa9cc95-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vO4wXhYXcSep7KxHBBCGWP+a7KpWpW4JjdTA/LnljvQ=; 
 b=bEAaiwlp3XT7S+11IAEzsQcU8oeJ6hnACAbxfVQw/Jm78aA/sVk6qJPDavnoeVsjWsjZ1y4SmM6gG5y/MdwGwmfN3BJf8EoSI9GAQZP1PdGvhAKF2rqdXIg9YX1w0S6rbuun6yu97Ep8WBYRzGaRR0tJD/ZpsDSkuodHFRk8dNE=;
X-UUID: 72e4cbbe0f354afe967cdaae3fa9cc95-20200403
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2009886834; Fri, 03 Apr 2020 01:50:33 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Apr 2020 02:40:49 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Apr 2020 17:40:46 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Apr 2020 17:40:45 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v8 12/14] arm: dts: Add jpeg enc device tree node
Date: Fri, 3 Apr 2020 17:40:31 +0800
Message-ID: <20200403094033.8288-13-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200403094033.8288-1-xia.jiang@mediatek.com>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_025041_147189_556C10B6 
X-CRM114-Status: UNSURE (   7.81  )
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
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, sj.huang@mediatek.com, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, Xia Jiang <xia.jiang@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add jpeg enc device tree node

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v8: no changes

v7: no changes

v6: no changes

v5: no changes

v4: no changes

v3: change compatible to SoC specific compatible

v2: no changes
---
 arch/arm/boot/dts/mt2701.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 51e1305c6471..f2f92150b3fb 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -569,6 +569,19 @@
 			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
 	};
 
+	jpegenc: jpegenc@1500a000 {
+		compatible = "mediatek,mt2701-jpgenc",
+			     "mediatek,mtk-jpgenc";
+		reg = <0 0x1500a000 0 0x1000>;
+		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
+		clocks =  <&imgsys CLK_IMG_VENC>;
+		clock-names = "jpgenc";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
+		mediatek,larb = <&larb2>;
+		iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
+			 <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
+	};
+
 	vdecsys: syscon@16000000 {
 		compatible = "mediatek,mt2701-vdecsys", "syscon";
 		reg = <0 0x16000000 0 0x1000>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
