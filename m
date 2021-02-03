Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC19BC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 05:54:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58D1264F2C
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 05:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58D1264F2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hAdOi7EjKn3eXp95aInmjaG+mfr8j7XwECkpa/nC1pA=; b=Hu86yhYZIVJiYg8q3d6E48dCe
	BQ9mxzOt/aYPYGDt10AK6FRxaFE6e6oqbS1e5Sn3T3EEtprDgZy8mq58jeG1GEb5I+ou6SwuAQ9wr
	cbcqNP6imBhSjyW9cCEyewawT4VREkt9CNCcv/xTrJiNfdW3aHDXA8D/kRQ0DBErSdzqwYT6D2Y87
	1nukwKdvy0NwF8jB4IbqqK+zdIe+6wLLdDMoVTIPd6LmlSx5qOl5DXPStdqzmWY6SMBowkRKMPdpR
	HK6D7FDL3SaOxAdIQ/cbiL2aFp5tr2C7auO3msIBjCnt0DfMiwUFAmcy2LMyXn0/9w3AgPQe/THzd
	oAh1w9bKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7B7E-0008EE-3x; Wed, 03 Feb 2021 05:54:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7B78-0008D8-1L; Wed, 03 Feb 2021 05:54:08 +0000
X-UUID: 1247eb57d3cb4a13809a8086baa61517-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vR61YcFr6aPhIShf3Nvc0RENs1R4dk1krZQsiOXkvPY=; 
 b=Z/e3SlLg9Ozm5Yj4Xlt4OSe8K4TZElAEZ288cyj69/s1t2I8dtsxfQVmwPzU1rNpEt64Iw6JORTkkCKk4qDkp+R8dMZIODePzMNtjcQXFhRC95PDjPcfB8pxPaDsFCpKFxtczyP0M2Jhq++IcFvxTXkna9xyUo/lwlq0jprbJBA=;
X-UUID: 1247eb57d3cb4a13809a8086baa61517-20210202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1595548175; Tue, 02 Feb 2021 21:54:03 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 21:54:02 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 13:54:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Feb 2021 13:54:00 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rob
 Herring" <robh+dt@kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: arm: add Cortex-A78 binding
Date: Wed, 3 Feb 2021 13:53:48 +0800
Message-ID: <20210203055348.4935-3-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210203055348.4935-1-seiya.wang@mediatek.com>
References: <20210203055348.4935-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_005406_244159_D5EF6B49 
X-CRM114-Status: GOOD (  12.74  )
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
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Seiya Wang <seiya.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Namhyung
 Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible for Cortex-A78 PMU

Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 693ef3f185a8..e17ac049e890 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -43,6 +43,7 @@ properties:
           - arm,cortex-a75-pmu
           - arm,cortex-a76-pmu
           - arm,cortex-a77-pmu
+          - arm,cortex-a78-pmu
           - arm,neoverse-e1-pmu
           - arm,neoverse-n1-pmu
           - brcm,vulcan-pmu
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
