Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061F5C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 11:29:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE6FE2076D
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 11:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE6FE2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1PxDaXfhJk+jNY9WVScvk7U6LLZ03oqGh/yJ/FQKB3I=; b=xvMQ0tXwfPme9++SQa9zWmc1U
	QqFLZ7bhZO5bBxFFtjpCq9vtcYHcqznF2M4iZb5DMc6YpACo/lfItdazajBCkHqn2P+6gGk1rWY+L
	n3c7+BlK/ZvR23nLFUz29MLUmp+skhLwpRnMQ3bl9viWhB+3GHfveYeuoWV2yEc0K267Lj/F9tNd9
	I+6V8EaGRc8UFZpvBGs4gGfvEGyBqMcSzgAiOsBxXlyyz/jn/RTOv2SJs3dfSYehqHdhKFy/kFfiv
	v95k1t8rtEuyOeAIKhqMr6hd+8QMdo43fGKzrTNtWwdyePlJwHaXz4f6ngtyvr1FVWi3EUrU7WQoz
	1gI0uBZQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4j0V-0007ND-H6; Wed, 27 Jan 2021 11:29:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4j0S-0007JN-42; Wed, 27 Jan 2021 11:29:05 +0000
X-UUID: ffe91ee017904c59af834e9136dad2f5-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Z2D5Jx9uHvZi85W2+rxka1Kpt+qXmLajmzt3iryc/Lk=; 
 b=rza/fx5TD2zdl5jE8Tqg0loNqgyJAcQlGrqqRpfuaJSLd6IZZqMFL+fD2exp0zq8j36kJ+XDNQb8b6tnCvcMy9FBFMXFroB7r9/aNksAZwcUEYIeCc+15n7hQB5hfL8UV6im35PtiCYGSm6mqZj0ff3xGKjwLGWbyH9KAZBoyjs=;
X-UUID: ffe91ee017904c59af834e9136dad2f5-20210127
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <eastl.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 687807188; Wed, 27 Jan 2021 03:28:54 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 03:28:52 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 19:28:50 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Jan 2021 19:28:50 +0800
From: EastL Lee <EastL.Lee@mediatek.com>
To: Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v1 2/3] arm64: dts: mt6779: add emi node
Date: Wed, 27 Jan 2021 19:28:43 +0800
Message-ID: <1611746924-12287-3-git-send-email-EastL.Lee@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1611746924-12287-1-git-send-email-EastL.Lee@mediatek.com>
References: <1611746924-12287-1-git-send-email-EastL.Lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C8BF7FB8F1D466F43B7C63376E1CD6C4A3A421856A34155B634B138D7946A9032000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_062904_806109_17C52ED2 
X-CRM114-Status: GOOD (  10.38  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, cc.hwang@mediatek.com,
 wsd_upstream@mediatek.com, adrian-cj.hung@mediatek.com,
 linux-kernel@vger.kernel.org, joane.wang@mediatek.com,
 EastL Lee <EastL.Lee@mediatek.com>, dmaengine@vger.kernel.org,
 vkoul@kernel.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add emicen & emichn & emimpu node

Signed-off-by: EastL Lee <EastL.Lee@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index 370f309..bb34537 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -267,5 +267,39 @@
 			#clock-cells = <1>;
 		};
 
+		emichn: emichn@10235000 {
+			compatible = "mediatek,mt6779-emichn",
+				"mediatek,common-emichn";
+			reg = <0 0x10235000 0 0x1000>,
+				<0 0x10245000 0 0x1000>;
+		};
+
+		emicen: emicen@10219000 {
+			compatible = "mediatek,mt6779-emicen",
+				"mediatek,common-emicen";
+			reg = <0 0x10219000 0 0x1000>;
+			mediatek,emi-reg = <&emichn>;
+		};
+
+		emimpu:emimpu@10226000 {
+			compatible = "mediatek,mt6779-emimpu",
+				"mediatek,common-emimpu";
+			reg = <0 0x10226000 0 0x1000>;
+			mediatek,emi-reg = <&emicen>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH 0>;
+			region_cnt = <32>;
+			domain_cnt = <16>;
+			addr_align = <16>;
+			ap_region = <31>;
+			ap_apc = <0 5 5 5 0 0 6 5>,
+				<0 0 5 0 0 1 5 5>;
+			dump = <0x1f0 0x1f8 0x1fc>;
+			clear = <0x160 0xffffffff 16>,
+				<0x200 0x00000003 16>,
+				<0x1f0 0x80000000 1>;
+			clear_md = <0x1fc 0x80000000 1>;
+			ctrl_intf = <1>;
+			slverr = <0>;
+		};
 	};
 };
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
