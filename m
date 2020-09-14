Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D71DC43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 09:48:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0946206C9
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 09:48:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VmyOYEYq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gJHGt4La"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0946206C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UBm05CaP3rwj3vFJzLm3m1weahUYM8z3bB5kkpPLLcg=; b=VmyOYEYqyDpvnch5kbGafzisu9
	awt9iFATsWn34gK1ueRZbTyZFiHUgX37NayHClBMuuIEsOR5I9voJ5zHWOm/5HwYv3oq+yh9B0exD
	7wMWQTMmMcNeFLqmN9eA3YYbAdwi9U/khfIOu5oSvxEBPv5D2McNCOVsNO9U0xfL3OXddwlRic5bS
	NrTCS5O2qS5VzDgvYMvUpfJ/QN3jXsG52/DAnTtsm19xSajzzDWKLTFuQtAtaFcMQwfwnQcfzD3HU
	okfwW44PkdnoTEjnzZPfb9UjqfbvmnN4Y5vHAztRNaGCCJQw6cxo0tHNFhXFsIO8y1chipXUg1hv+
	1KB2fOJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHl5W-0007g0-Mu; Mon, 14 Sep 2020 09:47:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHl5U-0007el-8H; Mon, 14 Sep 2020 09:47:53 +0000
X-UUID: 210d6af812de4db995aa3c23a2226964-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=bQUXUzbFriOSQ+r1Po0//r4PBP6F9rJZE9cWHJ8VvZM=; 
 b=gJHGt4LaCju5NNB6YbRj+x8Zgc9Pl/jRH6LAfCy+XTy4H1UWTgRoQYyBvE4MdL6ud87oCtn1Bu1Pag8SipaL9yyJH6dbkUmpWO6Twy90DmNdljIy7U1Ia+LQzfsDuk0MG75fetNq+O/cULYehF+3xBbw5eHPUYGXilHxLF+4Awg=;
X-UUID: 210d6af812de4db995aa3c23a2226964-20200914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <maoguang.meng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1866752262; Mon, 14 Sep 2020 01:47:27 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 02:42:24 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 17:42:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Sep 2020 17:42:16 +0800
From: <maoguang.meng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <tfiga@chromium.org>, <yong.wu@mediatek.com>, 
 <sj.huang@mediatek.com>
Subject: [PATCH] arm64: dts: add jpeg enc node for mt8183
Date: Mon, 14 Sep 2020 17:40:12 +0800
Message-ID: <20200914094012.5817-1-maoguang.meng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_054752_430816_7B0E3FB9 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, xia.jiang@mediatek.com,
 maoguang.meng@mediatek.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Maoguang Meng <maoguang.meng@mediatek.com>

add jpeg enc device tree node

Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
---
Rebase on v5.9-rc1.
   [1] https://lore.kernel.org/patchwork/patch/1164746/
   [2] https://patchwork.kernel.org/patch/11703299/
   [3] https://patchwork.kernel.org/patch/11283773/
---

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 8d8f427db030..1e72625f1615 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -961,6 +961,17 @@
 			power-domains = <&scpsys MT8183_POWER_DOMAIN_VENC>;
 		};
 
+		venc_jpg@17030000 {
+			compatible = "mediatek,mt8183-jpgenc", "mediatek,mtk-jpgenc";
+			reg = <0 0x17030000 0 0x1000>;
+			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_JPGENC_RDMA>,
+				 <&iommu M4U_PORT_JPGENC_BSDMA>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_VENC>;
+			clocks = <&vencsys CLK_VENC_JPGENC>;
+			clock-names = "jpgenc";
+		};
+
 		ipu_conn: syscon@19000000 {
 			compatible = "mediatek,mt8183-ipu_conn", "syscon";
 			reg = <0 0x19000000 0 0x1000>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
