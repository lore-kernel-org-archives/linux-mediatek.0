Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C946C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 03:14:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2FB3208C7
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 03:14:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aWL9f6qz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ngZem2Tu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2FB3208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m6ruRNv7zsKFy46ixrSFOWES94Yun7AG95Y0xxVdI5A=; b=aWL9f6qzvrLFapWMAVv+ErB+/
	tdyrOlt23blDBQ01Vj5p6hBsBxreoctDP6Z+ZOHcJRRV2EsF6IMggVAaPBuXIQ+TZtbiZ/XynKa8E
	DcHwvgyTxYzzx8cKVGPqUX/3JHhGUZi3HEGQCX9Yvjx2iii5SQiNnq/g3BLB6Rqsb1E4fU9f+lzry
	H++mnB4JXsgXqzesfMvNtyt2VCSrpAUii17xwLgbA++KMk9t5ItxqEqQOzMDJidPIPgXeoqDuEgyZ
	gM+zF2fSzJMlNZwHCkhQ6SACN2S9aBzmbXXCrBwt7RPkLLiGfqgbLMjU+M0QbTnUEQTKXF19aJR5g
	5N5eLuqeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHewW-0004CO-Pa; Mon, 14 Sep 2020 03:14:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHeug-00033k-QM; Mon, 14 Sep 2020 03:12:19 +0000
X-UUID: 203b39dd47224eeaad7c04cc4e9444b9-20200913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kIXkw28ypeSGlrofrHlotskDcpcv49IInPwVf49Lb8I=; 
 b=ngZem2TuPv1S1IfcLVrk2WYZ0IdSXDuPH3YTxywmf/cTxKlqVeabyAqQyOfxLstfhR2OlZlgUKBm7G4SWSLtfH74Cu0Pxe9ofbkQoTTm6+1VvvaEJ83PkI3zMaGC8RQ5PqidSnDnjkZFAYEKVXdMP3HcLJuoaURRXsZrU3YhUAU=;
X-UUID: 203b39dd47224eeaad7c04cc4e9444b9-20200913
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 811806074; Sun, 13 Sep 2020 19:11:53 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Sep 2020 20:04:58 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 11:04:51 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 14 Sep 2020 11:04:50 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar
 <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Ryan Case
 <ryandcase@chromium.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH V5 17/17] arm64: dts: mt8192: add dvfsrc regulator nodes
Date: Mon, 14 Sep 2020 11:04:44 +0800
Message-ID: <1600052684-21198-18-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
References: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E8B3BCFADA3E14EE772850CEBCED82DCA301B421797C3B3E5383680409F1D8C02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_231219_052388_628EA6C6 
X-CRM114-Status: GOOD (  11.23  )
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

Add dvfsrc regulator nodes which is for MT8192-based platforms

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 647c57a..9006670 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -422,6 +422,12 @@
 			compatible = "mediatek,mt8192-dvfsrc";
 			reg = <0 0x10012000 0 0x1000>;
 			#interconnect-cells = <1>;
+			dvfsrc_vcore: dvfsrc-vcore {
+				regulator-name = "dvfsrc-vcore";
+				regulator-min-microvolt = <575000>;
+				regulator-max-microvolt = <725000>;
+				regulator-always-on;
+			};
 		};
 
 		systimer: timer@10017000 {
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
