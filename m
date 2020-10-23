Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DC8C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:35:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C71CE2168B
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S/hlw6BM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iac/UnmP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C71CE2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8oR5jR+MIAWWFOEPFbaKbj9zbq9uR1MbKnye43KqrII=; b=S/hlw6BM24EKZtt3QSX89NL2Q
	THsZJiMSZFN/zaK9l5nZR2tBvGFa3RqwORSmGrgvoMxbODAHDBkzPbuF7snpnoQoZVWkKMBThb8fj
	6TIKa7oV7fUhpsy7U/6Xe8pFR96nPY2DUCsbO0S+RONVze2TkN+ISNbqZhteCopI1SKlZY0D6WMwB
	iJswFiM/58Xx92Hag9uve6qiay3kEZdluYIC3IiQ5azezhjk+LpmMT+HfoOajmysWMwXf6rxgCTB7
	mUre/cj8KImm9EirHGvb7QsTwkamUeB1E7ukrqKdxi09U/oIaAXrpt8/hecltBB8UjSMvN87kJC0Q
	bxpdk4LyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVsXY-0001lz-JK; Fri, 23 Oct 2020 08:35:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVsXS-0001id-Cw; Fri, 23 Oct 2020 08:35:07 +0000
X-UUID: 50fa82c4f4ab4ae78b4915215209fc6a-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UBtQH+OlTScmb/PO4fc+5+GucCo+qd6V6KQVG2XIAsg=; 
 b=iac/UnmPm2U7W78kkiQzf7KOMBXrncGU4yjQzmVVyU4aX76+pUoIrRG/GB9Yk/3NGKfwJbdCdPLJ2do83foCKNww+xO+GsGIaVPvOAKn+fN6UoypeU8Ov9zFhYskOfho/ngFb2XsjyxMe6oBIyJfJvgcsvdTP0FCUj0yslRJD+w=;
X-UUID: 50fa82c4f4ab4ae78b4915215209fc6a-20201023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2049457234; Fri, 23 Oct 2020 00:35:02 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 01:25:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 16:24:59 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 23 Oct 2020 16:24:59 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
 "Santosh Shilimkar" <ssantosh@kernel.org>, Amit Kucheria
 <amit.kucheria@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>, "Dave Gerlach" <d-gerlach@ti.com>, Florian Fainelli
 <f.fainelli@gmail.com>, "Robin Murphy" <robin.murphy@arm.com>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 6/6] cpufreq: mediatek-hw: Add cooling dev flag
Date: Fri, 23 Oct 2020 16:24:53 +0800
Message-ID: <1603441493-18554-7-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
References: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_043506_598551_9A5BF5ED 
X-CRM114-Status: GOOD (  12.96  )
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

Add cooling device flag for thermal throttle

Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq-hw.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 15fba20..665f220f 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -165,7 +165,8 @@ static int mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 
 static struct cpufreq_driver cpufreq_mtk_hw_driver = {
 	.flags		= CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK |
-			  CPUFREQ_HAVE_GOVERNOR_PER_POLICY,
+			  CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
+			  CPUFREQ_IS_COOLING_DEV,
 	.verify		= cpufreq_generic_frequency_table_verify,
 	.target_index	= mtk_cpufreq_hw_target_index,
 	.get		= mtk_cpufreq_hw_get,
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
