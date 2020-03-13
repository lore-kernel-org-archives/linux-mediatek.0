Return-Path: <SRS0=2fV0=46=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2F8C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 09:45:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A25EB206EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 09:45:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Boetw+Rv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IpAqdIN1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A25EB206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvpHWuBrxGTssRHOxeVNXCzuFqrHZgtDRqh0w/6pXeg=; b=Boetw+RvfQSH7d
	yrBJPBvBLarmkZSzz8bwBQxZYfh8o7CX/g25jdcNEGUENDS8RV47zpgrZrfpbo6vkUxrgpfbHcZrk
	OBDCFFkGWrIzlG2z+CSaT6cNitH7z/Fc/afcN6IrA70RynzHvzWAUlIha4b9BucTCjHAQy2QzMyQQ
	mVZDMy2wt3hcVDMISB9tfC422GP188qu5wQSSkE6pXk4pjdRkI2kVnX8SOTqiDNnBjWWWjeYUFQuO
	3OXoskV68OioXH5gTo3E4hCLU/4RPEgzFO54m7rI0paicFPUh9TuJmiQJlPaefAfFnhHGjYzStmxW
	a6vUIirimlWHdFrLo7YQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCgsA-0004hk-GW; Fri, 13 Mar 2020 09:44:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCgs8-0004g9-AK; Fri, 13 Mar 2020 09:44:53 +0000
X-UUID: be486bb6dddf4d909e1c5166a077d53f-20200313
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=G8lNEfow1SE1PgE3YZ61+NeyQaP2RA/pMRTQGXC1FJk=; 
 b=IpAqdIN1yyhDRRVIuvHca70cO6oQiTKaepFBTWvU78KXt+5UXXzMulpNMUqidKq26ZTsfcY/C5LtbypkgTpmPL4AKGrkDqasv1ItoInk+DIEPbVGiWtQFr5i47Xh8sqfQ04TwANeZGsuSocsVVWeYdpa2AQ0Eac0fyVsei11se4=;
X-UUID: be486bb6dddf4d909e1c5166a077d53f-20200313
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1642951110; Fri, 13 Mar 2020 01:44:44 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Mar 2020 02:34:44 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Mar 2020 17:32:18 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 13 Mar 2020 17:33:42 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar
 <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Ryan Case
 <ryandcase@chromium.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH V4 11/13] dt-bindings: regulator: add DVFSRC regulator
 dt-bindings
Date: Fri, 13 Mar 2020 17:34:24 +0800
Message-ID: <1584092066-24425-12-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1584092066-24425-1-git-send-email-henryc.chen@mediatek.com>
References: <1584092066-24425-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_024452_372269_E5E997EF 
X-CRM114-Status: UNSURE (   8.63  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Mike Turquette <mturquette@linaro.org>, srv_heupstream@mediatek.com,
 James Liao <jamesjj.liao@mediatek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, "henryc.chen" <henryc.chen@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Arvin Wang <arvin.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
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
index da98ec9..80f09c0 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
@@ -17,6 +17,11 @@ Required Properties:
 	The provider is able to communicate with the DVFSRC and send the dram
 	bandwidth to it. shall contain only one of the following:
 	"mediatek,mt8183-emi"
+- regulator : The DVFSRC regulator is modelled as a subdevice of the DVFSRC.
+	Because DVFSRC can request power directly via register read/write, likes
+	vcore which is a core power of mt8183. As such, the DVFSRC regulator
+	requires that DVFSRC nodes be present. shall contain only one of the
+	following: "mediatek,mt8183-dvfsrc-regulator"
 
 Example:
 
@@ -29,4 +34,13 @@ Example:
 			compatible = "mediatek,mt8183-emi";
 			#interconnect-cells = <1>;
 		};
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
