Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A99FC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 02:31:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B76B20725
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 02:31:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gJp+9U/9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QY0pp9ip"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B76B20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KG8DyP9kgXqEeOtPICAVHwV1BRA7GhJQ/tGZfRW5Weg=; b=gJp+9U/9cGbfY+wZgYU+YrqQC
	+ZAgxLJcGE6lkb9EsemdtvVgz4b4wW09JMZhre5kpQOIu/6UrmqQkba63KgVPBkOWiQ8prSfNup4V
	OPQM/Q2JfQKnlnbCcf40pUCXg+m2Rky0TFw6fCd9qfrfe43Uxgk5QGWqJVpWHYbwryMBkgPi601sr
	ZhZ4/eWDOrL9iNK8r5JlhKek0gHTPIubSho8w3MnDxn2Y87cVqSu1xOHPx8dZ2kxIcMucti9vy31S
	6goXV84LAv2aav0h0KW0XNfqHdyCmYWpu8kLZAdOEDAr2/PRbrv0rBIWyEivsoG9jpG+FPDksj/GE
	eeRkNNrSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtipL-0004OC-1K; Fri, 10 Jul 2020 02:31:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtipH-0004LL-0H; Fri, 10 Jul 2020 02:31:48 +0000
X-UUID: b6d06254a8b348ada5b9f90431d1c2f7-20200709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PcXK8edytdyjKDSUZo+ulaZKdQtRcIF+nTtqbVTRau4=; 
 b=QY0pp9ip+rjelEUUc/N8nLamSPx3BNJci34uaMIamfgh8vAc3x26IKjkX8CXfR6MujN8520qzcKOoPQhLqjbTKF9ETCAJbeXNzmHxPd2ghTD9ShWnkGvGAHZV+HGMmFxjr8LVg7UUMWhGWRf54GERWCobsFbCEtfzR3DjB6IphY=;
X-UUID: b6d06254a8b348ada5b9f90431d1c2f7-20200709
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1510124889; Thu, 09 Jul 2020 18:31:32 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 19:31:33 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 10:31:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Jul 2020 10:31:33 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH v7 5/8] opp: Modify opp API, dev_pm_opp_get_freq(),
 find freq in opp, even it is disabled
Date: Fri, 10 Jul 2020 10:31:21 +0800
Message-ID: <1594348284-14199-6-git-send-email-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
References: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_223147_283492_8546487E 
X-CRM114-Status: GOOD (  13.57  )
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
Cc: devicetree@vger.kernel.org,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>, srv_heupstream@mediatek.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>

Modify dev_pm_opp_get_freq() to return freqeuncy
even this opp item is not available.
So that we can get the information of disable opp items.

Change-Id: I54dacf13050397f5080ccdb8b07d6220e7461e4e
CR-Id:
Feature:
Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 drivers/opp/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index eed42d6b2e6b..5213e0462382 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -118,7 +118,7 @@ EXPORT_SYMBOL_GPL(dev_pm_opp_get_voltage);
  */
 unsigned long dev_pm_opp_get_freq(struct dev_pm_opp *opp)
 {
-	if (IS_ERR_OR_NULL(opp) || !opp->available) {
+	if (IS_ERR_OR_NULL(opp)) {
 		pr_err("%s: Invalid parameters\n", __func__);
 		return 0;
 	}
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
