Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A94C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 09:03:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CC36208E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 09:03:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WjhpUvZM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DvpUj11L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CC36208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+w6YvvrWRFJDASmr9gTAi3ZVRUl7yv+E8fcP7zinnG4=; b=WjhpUvZM3LJ0GgTyYxyk1Xqmkr
	kjAKmzS5mOf3DRZ1wX9gFThSz2j4wbLX1Z6L91cN4vCWcJGupDV1pm+cGwXUkOa5yobcdQHyRnjDI
	f7bTrfjJVhWHFmhlnfSWBXYyDEf+5v40RtvRQ18V4oXiXs4TP6rqWBkF1SUwiL9GE130XS0O5Y+wz
	nWdsCl0Y7sbaBRK+v1OHsM4zmD5ut4whzrOlQAj+zu9KYSLCA7UapgzF5IrorgKRZCxIfo+I4i7xb
	YH0bIjybtf4sttvM+TY4tPa8224b6PCsLlW5OYfmc1rSlROXieMrq3+MYmY+L50xcgT3fIUikODIv
	fhBVvaBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxRhV-0001sB-Fh; Mon, 20 Jul 2020 09:03:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxRhH-0001ki-Ir; Mon, 20 Jul 2020 09:03:07 +0000
X-UUID: 6db75a21f6db41828f220b18c1bcb0b0-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=TSHLjC4mQdLckwje8+VW5lp9F9dLArVZIednfBFkdXY=; 
 b=DvpUj11LFTHg1NpoP+7/9iZmawACij33Ju58SQYEsT0/D+xrVSnjK5sj52++xCtVBXhh57gRsylje6klAEsvjn2/7QSQ9MVFUteMJOw2bDEe/ZUiAUlHC9oxrwBnSf1aaVTIOLeGYDK0SO7xI7yBIrOf7TSz8qNKt61wCUz/0dU=;
X-UUID: 6db75a21f6db41828f220b18c1bcb0b0-20200720
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 340928749; Mon, 20 Jul 2020 01:03:23 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 01:55:28 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 16:55:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 20 Jul 2020 16:55:27 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: opp: Modify opp API, dev_pm_opp_get_freq(), find freq in opp,
 even it is disabled
Date: Mon, 20 Jul 2020 16:55:26 +0800
Message-ID: <1595235326-6333-1-git-send-email-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_050255_868731_63262110 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>,
 srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>

Modify dev_pm_opp_get_freq() to return freqeuncy
even this opp item is not available.
So that we can get the information of disable opp items.

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
