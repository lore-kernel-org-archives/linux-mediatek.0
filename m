Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E74C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 02:59:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A490F64F68
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 02:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A490F64F68
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QeFkFBkcGf+I1J0VqOQQsVi3KGDY1XEahdgrm2lEsFE=; b=VWFITNTP8BX5TAsAVZ82tSvNw
	LbR1Tt/6clS0mN7u2UrsZeoLvoMhXphDBYZ/6Sb9xIZ9MxpQVlk+1xWCJAO7GyipmU22ytE6s7JiQ
	OmMx9QkmQ243sU1iKr0wLbnuYWFrvM7prkEORxktjLSFQ184M9MWEBgpMMCa36yYmSLyBixCeOhB/
	5Nd8hBDrJFL/wbGpmMVAY7wKDw8GUWQTpfQDodahL9A2OJT4yFRZRbZfJ4GkvgolT2jWl/a9NLmZ8
	89ovm/wspqV47W6dipIIPVCMGlO7hM7sm3vujEzSoeFNN8X+IjVVpMsTKJeBYm7tfAnrOqVgHtiyD
	73S1XxUOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l78O5-0007Tk-3O; Wed, 03 Feb 2021 02:59:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l78O1-0007SB-CQ; Wed, 03 Feb 2021 02:59:22 +0000
X-UUID: d3f26c37f9fa49059f70042f26663d98-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Ldg+WJfiBxLpOZOmBTzxIUxbp/n9ynp0dQL6JSwVCkk=; 
 b=soLoCFY0Qn4y5VVutLNfUv7g+CfDYeNS0Y2o6uNT6LBY5Yjh9nP3u4SQEAhe/fQUXZ1kjVCm1Pl+jBoOZVNV7AFf96/xetpJy2ZFAE7SmtjzFP8/yBkqmzpjFwz+0wibJvDj37VMMMzP+JHkxk62WMMwyTU1hu1oSRRPIl5phEs=;
X-UUID: d3f26c37f9fa49059f70042f26663d98-20210202
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 693231046; Tue, 02 Feb 2021 18:59:15 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 18:59:14 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 10:59:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Feb 2021 10:59:12 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rob
 Herring" <robh+dt@kernel.org>
Subject: [PATCH 1/2] arm64: perf: add support for Cortex-A78
Date: Wed, 3 Feb 2021 10:58:01 +0800
Message-ID: <20210203025802.30201-2-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210203025802.30201-1-seiya.wang@mediatek.com>
References: <20210203025802.30201-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_215921_656116_046F0E0F 
X-CRM114-Status: GOOD (  13.60  )
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

Add support for Cortex-A78 using generic PMUv3 for now.

Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
---
 arch/arm64/kernel/perf_event.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
index 38bb07eff872..62ec2b4ea403 100644
--- a/arch/arm64/kernel/perf_event.c
+++ b/arch/arm64/kernel/perf_event.c
@@ -1190,6 +1190,12 @@ static int armv8_a77_pmu_init(struct arm_pmu *cpu_pmu)
 				       armv8_pmuv3_map_event);
 }
 
+static int armv8_a78_pmu_init(struct arm_pmu *cpu_pmu)
+{
+	return armv8_pmu_init_nogroups(cpu_pmu, "armv8_cortex_a78",
+				       armv8_pmuv3_map_event);
+}
+
 static int armv8_e1_pmu_init(struct arm_pmu *cpu_pmu)
 {
 	return armv8_pmu_init_nogroups(cpu_pmu, "armv8_neoverse_e1",
@@ -1227,6 +1233,7 @@ static const struct of_device_id armv8_pmu_of_device_ids[] = {
 	{.compatible = "arm,cortex-a75-pmu",	.data = armv8_a75_pmu_init},
 	{.compatible = "arm,cortex-a76-pmu",	.data = armv8_a76_pmu_init},
 	{.compatible = "arm,cortex-a77-pmu",	.data = armv8_a77_pmu_init},
+	{.compatible = "arm,cortex-a78-pmu",	.data = armv8_a78_pmu_init},
 	{.compatible = "arm,neoverse-e1-pmu",	.data = armv8_e1_pmu_init},
 	{.compatible = "arm,neoverse-n1-pmu",	.data = armv8_n1_pmu_init},
 	{.compatible = "cavium,thunder-pmu",	.data = armv8_thunder_pmu_init},
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
