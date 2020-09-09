Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7571C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 10:01:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36A2821973
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 10:01:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A9qkSM77";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mkv+UhtB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36A2821973
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/vyQoaW7fj5AU+/gcZulJAY5CvD+NHbZPw/dV9ACUYs=; b=A9qkSM77/gHcRlhxb9Rx8c1Awq
	bIO6eHJcg8Ms1x5bZcz1rN2INmYd0p+S0XeLVVM2vVq8GgeumbA+sxY3QmrqybbzRposeUYx+34mr
	misnjfQxnha01AQCckciS+v044HXQFOEKup6oJWQOL9Zjes3b1AAY4zfT1o673n2Y+1013lDZU5Bl
	Gy1GtcM+ET7H0OxgF8bsbmUWEHbluvJfb75FbZGtI5CZyJX+OVF5b1sF1lT2qE0v9PDTvKJZp3xCO
	G+BcTtvhz0vyhFm1Rs8jFhH0JdmUau45LZdkxXl0uIBWfHoYoi4HoQBgb2au5GkhZ2fRhI5Dry7OE
	98A3SDrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFwvA-00053R-Rf; Wed, 09 Sep 2020 10:01:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFwv5-00051y-SM; Wed, 09 Sep 2020 10:01:40 +0000
X-UUID: 4c8f4557d47d4405901736617178ad98-20200909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=MYJuj1+7OUVwOQfGJtUfdsku/gKAE0aqgHgFLGUEUgc=; 
 b=mkv+UhtBv9ckcOSAII+FDo49xKp6ZPCFkr2/ScB8+e49ZeW79YDxfDw75rPq3QI8t0tunayg7isjdwk6nxyD8g7TTYGuKGYRXkaBmRgy3gf7xwpSM5GpwuOS6dtNwR8rPI0mdGUzISYB2tnKch49FD+j2cwCu2kZ4tGs0sToIpo=;
X-UUID: 4c8f4557d47d4405901736617178ad98-20200909
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1111703417; Wed, 09 Sep 2020 02:01:35 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 02:51:32 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 17:51:30 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Sep 2020 17:51:31 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5] cpufreq: mediatek-hw: Add support for Mediatek cpufreq HW
 driver
Date: Wed, 9 Sep 2020 17:51:24 +0800
Message-ID: <1599645086-10169-1-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_060140_108280_DEE3DCB1 
X-CRM114-Status: GOOD (  11.46  )
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

The CPUfreq HW present in some Mediatek chipsets offloads the steps necessary for changing the frequency of CPUs. 
The driver implements the cpufreq driver interface for this hardware engine. 

This patch depends on the MT6799 DTS patch submitted by Hanks Chen
 https://lkml.org/lkml/2020/8/4/1094
 

Hector.Yuan (2):
  cpufreq: mediatek-hw: Add support for Mediatek cpufreq HW driver
  dt-bindings: cpufreq: add bindings for MediaTek cpufreq HW

 .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |  141 ++++++++++
 drivers/cpufreq/Kconfig.arm                        |   12 +
 drivers/cpufreq/Makefile                           |    1 +
 drivers/cpufreq/mediatek-cpufreq-hw.c              |  289 ++++++++++++++++++++
 4 files changed, 443 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
 create mode 100644 drivers/cpufreq/mediatek-cpufreq-hw.c
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
