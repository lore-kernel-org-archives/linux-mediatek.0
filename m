Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F49AC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 03:15:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24C97207EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 03:15:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r5AQ93vo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tiT6Owgv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24C97207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=shDdgtXhdzPEU/XceFGy+7aGo/0tItZ4Vy2hiwQKycE=; b=r5AQ93vorIdnkZ5OfwjrXdSEn
	tFVd0wzFuspIgioNxmColkzfxYtx5ULQeo3PO482LP0Ni3BwyL+XoD0mJPszigZhs8TBpNlvH/Xhy
	mwQ6+hzOwC3MrhqYD+MKQGLSX41YGcetyxf8ndOt817C3Uetbh7FUUGHpzy315KJBgKxYCrRxkAqt
	27BpGegBQ3TltrJHcNdhxt3xzH4esvZv/U/4zkeC2F/SpoP/mRA7Q1FhUg5QN0hUVfW16ijnOZl0l
	0+bYrinu3sIZXUMSCuxaMliDMUNZ0Wcubl9dpZtYFFoVSfCsA+MkpsevxLd07zM91jcdZ8YThVUg/
	XEcSZlOdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHexV-0004pO-4S; Mon, 14 Sep 2020 03:15:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHewL-00041x-Bj; Mon, 14 Sep 2020 03:14:02 +0000
X-UUID: a9e93f917662420d9e985a5e649662c2-20200913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VJt82+igvYrwp6Gjiq46dh2V0M4tXeJ2ZUsueEFI9Oo=; 
 b=tiT6Owgv0e3/tWiVpL2HiqbL/fRLoPpW9zNayKRx2pKPSR7NKoykYH55Q3fRHacdc1MtHEAyI+BbEUQRbtuN5XW11CDJ8q0oEVWQIvJCTbIRAlMtU0LXvUhb2JPP3mYcaVJU+akp8VO0/gw2qX0Fnauj/4u2bZKkVeZ8cfZsC2s=;
X-UUID: a9e93f917662420d9e985a5e649662c2-20200913
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 976619546; Sun, 13 Sep 2020 19:13:54 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Sep 2020 20:04:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 11:04:49 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 14 Sep 2020 11:04:49 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar
 <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Ryan Case
 <ryandcase@chromium.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH V5 14/17] dt-bindings: regulator: add DVFSRC regulator
 dt-bindings
Date: Mon, 14 Sep 2020 11:04:41 +0800
Message-ID: <1600052684-21198-15-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
References: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_231401_603394_D0322D5E 
X-CRM114-Status: GOOD (  11.85  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Mike
 Turquette <mturquette@linaro.org>, James Liao <jamesjj.liao@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 "henryc.chen" <henryc.chen@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Arvin Wang <arvin.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "henryc.chen" <henryc.chen@mediatek.com>

Add a regulator as sub device into dvfsrc dt-bindings for MT8183.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
index 76ca61d..f88a72d 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
@@ -15,6 +15,11 @@ Required Properties:
 	"dvfsrc": DVFSRC module clock
 - clocks: Must contain an entry for each entry in clock-names.
 - #interconnect-cells : should contain 1
+- regulator : The DVFSRC regulator is modelled as a subdevice of the DVFSRC.
+	Because DVFSRC can request power directly via register read/write, likes
+	vcore which is a core power of mt8183. As such, the DVFSRC regulator
+	requires that DVFSRC nodes be present. shall contain only one of the
+	following: "mediatek,mt8183-dvfsrc-regulator"
 
 Example:
 
@@ -24,4 +29,13 @@ Example:
 		clocks = <&infracfg CLK_INFRA_DVFSRC>;
 		clock-names = "dvfsrc";
 		#interconnect-cells = <1>;
+		dvfsrc-regulator {
+			compatible = "mediatek,mt8183-dvfsrc-regulator";
+			dvfsrc_vcore: dvfsrc-vcore {
+				regulator-name = "dvfsrc-vcore";
+				regulator-min-microvolt = <725000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+		};
 	};
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
