Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FDCC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 08:19:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 304BA20878
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 08:19:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O3l3Phzu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="A2j6Z9u0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 304BA20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dkdPy8/1ZVpONAzITH1GKPyNA0BBakSH/nqs1ShUUDU=; b=O3l3PhzuDldzwKxKni/vjshd3
	WG3lVY4Vzmh+uqm2uoF51LU8VFTStL0qPIkWE6hg4M2ZsmtGkeeZoQ5K9F8Gd7+XRi1ffPvV+wdWJ
	2Ia4w1zmjDm31BEEdUOBf8NAEEaf1iW2YDSWVmewbbOP8mjWSQAznBX3UsQ18PAxB2PHm3fULgbH5
	qU24GwqaJGvtbzN5lcQ4vgznSSTeKIO5W2oavZ2PHRpZ9FKEe1VYrYRIF46TMD/Bka/MXXjQf2DR0
	Bb9DhTGaWRY93hHNOHDlCWEYiDEdLf1kvoiS+mhlN/m6ahOc6wvllS995bRrYIdPmwRMH0DKmGMmK
	i+yt2fDTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWxiv-0006jU-2Y; Mon, 26 Oct 2020 08:19:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWxir-0006gi-6E; Mon, 26 Oct 2020 08:19:23 +0000
X-UUID: 6c29ee56691b400b85ef531264b7edf1-20201026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=OorCNuODuPaiqUDoyfpo5/p6Zg42Hars9OJsK2xA+SI=; 
 b=A2j6Z9u0ZFx/ck4ElEV54dYvk8VrSZ0nuYAUCyda4jitHgVQLwz2+IkZ+/wh/+D0aeTWxPBmjqNmBjjNf8tIAFY08TKIr2L8s3eo/2dTyIdYeZsMAr0dc9+FuWIAUkf4q9NTkUO3fZy6ZvcLrYwRHlYjl1WAccoO1vaFi4RFyNE=;
X-UUID: 6c29ee56691b400b85ef531264b7edf1-20201026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1159559641; Mon, 26 Oct 2020 00:19:17 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Oct 2020 01:19:16 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Oct 2020 16:19:14 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 26 Oct 2020 16:19:14 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 "Maxime Ripard" <mripard@kernel.org>, Santosh Shilimkar
 <ssantosh@kernel.org>, "Amit Kucheria" <amit.kucheria@linaro.org>, Stephen
 Boyd <sboyd@kernel.org>, "Ulf Hansson" <ulf.hansson@linaro.org>, Dave Gerlach
 <d-gerlach@ti.com>, "Florian Fainelli" <f.fainelli@gmail.com>, Robin Murphy
 <robin.murphy@arm.com>, "Lorenzo Pieralisi" <lorenzo.pieralisi@arm.com>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v8 2/3] dt-bindings: arm: cpus: Document 'mediatek,
 freq-domain' property
Date: Mon, 26 Oct 2020 16:19:08 +0800
Message-ID: <1603700349-5922-3-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1603700349-5922-1-git-send-email-hector.yuan@mediatek.com>
References: <1603700349-5922-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_041921_492486_97E88C0D 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: hector.yuan@mediatek.com, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Hector.Yuan" <hector.yuan@mediatek.com>

Add devicetree documentation for 'mediatek,freq-domain' property specific
to Mediatek CPUs. This property is used to reference the CPUFREQ node
along with the domain id.

Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 1222bf1..e995b26 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -255,6 +255,12 @@ properties:
 
       where voltage is in V, frequency is in MHz.
 
+  mediatek,freq-domain:
+    $ref: '/schemas/types.yaml#/definitions/phandle-array'
+    description:
+      CPUs supporting freq-domain must set their "mediatek,freq-domain" property
+      with phandle to a cpufreq_hw node followed by the domain id.
+
   power-domains:
     $ref: '/schemas/types.yaml#/definitions/phandle-array'
     description:
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
