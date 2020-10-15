Return-Path: <SRS0=+2Q0=DW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C34C433E7
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 12:34:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6208222255
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 12:34:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FXjtB25H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tVO+S55d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6208222255
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ibCGAEtQ30aCFtaRhsIehepuzH4uYBmT67tiI9tA/ZY=; b=FXjtB25HoV0+ZktZM+TH3BlON2
	JlZz4GwVmiweMWAUQsv4AlHmaCEMO4rdGskKWUPtTIH2fTUQ92u5LtfxnhuF3RU+8tSMolv9gZrnA
	CZ4Cg5XmOqyzRvFNzAaJas4ewTEv8/a41FUuqRPt2+2zZdXC0EZfDsi6Lk5KjD3NSoGAz5jsG/cbt
	QoFjmKT63rJ6SZOaP56RWK8aSV1ojpJQ3ve+cSA4KkA7Osu8i0YAK1Pyv5S790ZjpwsYdZaSn5VPA
	uyjC/hK39+8618/4E1mZtzbWzonahuTJTGrJC1oBq1CpoUk3/ZMUAj4EPmnZQTd1lxglf5fPQsjyQ
	zf0h18jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT2T2-0006mS-T5; Thu, 15 Oct 2020 12:34:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT2Sz-0006lT-QZ; Thu, 15 Oct 2020 12:34:47 +0000
X-UUID: 166dad392abb4302bae41fd90f4904d9-20201015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=wdjBNkijPYMMZHKUrWNsISffoBU51QFiBWSakN5H1mc=; 
 b=tVO+S55dG4hdO3aOS5+rUpKx6oUoYjMG3xiE9gCuK2jAn5n0UslefEEm0yYd9+RdpqPP5oJ8uQwvIpr3RM3JWDlChJzoZ/LSMhmF5BRkNpmJYR9yDnOl4JB3pIKSmRQr3Sc8JWU9poYRLVqV6Sm6tT8MPiv1DLRGilr2NSzmHRs=;
X-UUID: 166dad392abb4302bae41fd90f4904d9-20201015
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 91279766; Thu, 15 Oct 2020 04:34:43 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Oct 2020 05:24:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Oct 2020 20:24:31 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Oct 2020 20:24:31 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v2] cpufreq: mediatek-hw: Register EM power table
Date: Thu, 15 Oct 2020 20:24:26 +0800
Message-ID: <1602764667-29009-1-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 455D77DD171CE2BE108867FEFF583B5EC63FE1669ABAE732CA84722084A09EAA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_083446_049325_FA8C6D37 
X-CRM114-Status: UNSURE (   6.71  )
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
Cc: hector.yuan@mediatek.com, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Register to energy model framework with CPU power efficiency table.

This patch depends on Mediatek cpufreq HW driver patch submitted by Hector Yuan.
 https://lkml.org/lkml/2020/9/10/13


Hector.Yuan (1):
  cpufreq: mediatek-hw: Register EM power table

 drivers/cpufreq/mediatek-cpufreq-hw.c |   58 ++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 12 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
