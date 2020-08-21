Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4E3C433E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:51:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A93920656
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:51:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cgWYp8aP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tE/Sfakk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A93920656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UT0E1mi7lqJX4jeZ7ZwU2T4VjLKBo2vZJQY3DBe0mjE=; b=cgWYp8aP24LM9KZTqHALopLyH
	a0Ttedv/XbowGr9HhwL1pQxxnGkydiFianZmZGuETP138HCaKX7teoVonEkZjRSo5GerJBcukzXBs
	xfU5rB9LUcQmHAShcOMtzkleNFt3VDxoX8MnyqQNvVDhu5th6/+ZsPo7sothmDWqPsEPqQM3ziAzr
	/5TpPZfDHCXrbpH/EQ9R12X+H5AYYPbRSzInDAwBT6B7cSJPlL01qa+tVcwZna2NyEezgj2tOO+4R
	/1Eq0WLa2/x3594RwXqfR5VhQ7aRnfXzoZUbLDBpQDA/RxVRH2A967s7lf8P683tvsAxApwZJiYsq
	nT+aW+EKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k94dp-0003hX-Qj; Fri, 21 Aug 2020 10:51:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k94dm-0003gb-5k; Fri, 21 Aug 2020 10:51:23 +0000
X-UUID: caa446f3fe124d75a88c839e910688cf-20200821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CzHYYkmPwpQ2AhKcg65BgQbtfesFRKYUwxvX0kNJpAM=; 
 b=tE/SfakkFr3DT9psp9GrOiUj/fdAcgK5OR/S8jbEJ6yIKIodoweDSxmB/OiXf0j313wjRyaauHQhHOVuNVEMMa6MaJetlMfvIw8zbAueXCk/EeW04SyPNaabgyZaZi2Oklnd86l7lm57zFrvz9Y/raXqiE3OaHCrLW3sdM9W/ZY=;
X-UUID: caa446f3fe124d75a88c839e910688cf-20200821
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1519499397; Fri, 21 Aug 2020 02:51:15 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 Aug 2020 03:44:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 Aug 2020 18:44:37 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 21 Aug 2020 18:44:39 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: spmi: document binding for the Mediatek
 SPMI controller
Date: Fri, 21 Aug 2020 18:44:36 +0800
Message-ID: <1598006677-7953-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1598006677-7953-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1598006677-7953-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_065122_391428_73B673D5 
X-CRM114-Status: GOOD (  15.25  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds documentation for the SPMI controller found on Mediatek SoCs.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 .../devicetree/bindings/spmi/spmi-mtk-pmif.txt     | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.txt

diff --git a/Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.txt b/Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.txt
new file mode 100644
index 0000000..75a0eeb
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/spmi-mtk-pmif.txt
@@ -0,0 +1,33 @@
+Mediatek SPMI Controller
+
+This document describes the binding for the MediaTek SPMI controller.
+
+On MediaTek SoCs the PMIC is connected via SPMI and the controller allows
+for multiple SoCs to control a single SPMI master.
+
+Required properties:
+- compatible : "mediatek,mt6873-spmi".
+- reg-names  : must contain:
+     "pmif" - pmif registers
+     "spmimst" - spmi controller registers
+- reg: Must contain an entry for each entry in reg-names.
+- clock-names: Must include the following entries:
+  "pmif_sys_ck": pmif system clock
+  "pmif_tmr_ck": pmif timer clock
+  "spmimst_clk_mux": spmi master clk mux
+- clocks: Must contain an entry for each entry in clock-names.
+
+Example:
+
+	spmi: spmi@10027000 {
+		compatible = "mediatek,mt6873-spmi";
+		reg = <0 0x10027000 0 0x000e00>,
+		      <0 0x10029000 0 0x000100>;
+		reg-names = "pmif", "spmimst";
+		clocks = <&infracfg CLK_INFRA_PMIC_AP>,
+			 <&infracfg CLK_INFRA_PMIC_TMR>,
+			 <&topckgen CLK_TOP_SPMI_MST_SEL>;
+		clock-names = "pmif_sys_ck",
+			      "pmif_tmr_ck",
+			      "spmimst_clk_mux";
+	};
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
