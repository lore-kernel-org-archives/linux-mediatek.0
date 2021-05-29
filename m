Return-Path: <SRS0=GPQD=KY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB24FC47082
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 May 2021 17:03:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E8BC61107
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 May 2021 17:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E8BC61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W8v0lXsTO8oqZ8jqjrHuhl+gQl4j4dn6LNtEsy81Xcs=; b=b0+CHR4Zu4gcQa
	NFs4NOd0uo94/hPWaIKGNdLpvUrIiSf59+yP2XxKzW8QAcWOXhBhN1ei0KObpR72Kv24fLBHmCH+K
	5bOvo2D63wMSjyllhgqP5HCRG343hm2b/MalkqIq4NQ+Z0mSVPLK7Dev3g1Sdy3tQYLzakfW45pYa
	pDzM29q+MJNB0PX6SN4YlaMBrRc4EU+RdJvKsEfZw2acyxfmSB0bzZUr/DwcfqKQ+us184MLg3Ftp
	TXFCV0n+4xqHqf8zQTadq5zj+aOiCzaRkWwUCV27zJXuEwhshuaioEPc+dVGXBTivulyktHbixH/f
	wAuhN19TbvSYbaoTn8dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln2MW-007rxG-OY; Sat, 29 May 2021 17:03:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln2MJ-007rqP-C5; Sat, 29 May 2021 17:02:48 +0000
X-UUID: 4d2019b4e3274b13afab31e45ea6cd61-20210529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=yiFJNPFz/EDnVttOfoAkNZFXPPrgUKHOEKeYPS89cB0=; 
 b=NJsaL3y+4rHqW6HtT0+kn4HQwFEKPqihnhfx3uEMcUq6uknyjdxYwkts+7s5qBGbJlbvgu/sqKm/wCTwopy/VTOOJR5CedYbl2iVTrEv3D5pkBdYoJSbrTZ18vVzpys7WbG20Nkkeq5KkkGy5NNlx81wEct0LEsJKPZOH9llJl8=;
X-UUID: 4d2019b4e3274b13afab31e45ea6cd61-20210529
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1526904620; Sat, 29 May 2021 10:02:44 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 29 May 2021 09:52:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 30 May 2021 00:52:40 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 30 May 2021 00:52:40 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <wsd_upstream@mediatek.com>, <hector.yuan@mediatek.com>
Subject: [PATCH v12] cpufreq: mediatek-hw: Add support for Mediatek cpufreq HW
 driver
Date: Sun, 30 May 2021 00:52:31 +0800
Message-ID: <1622307153-3639-1-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_100247_445032_EF3FF715 
X-CRM114-Status: GOOD (  14.41  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The CPUfreq HW present in some Mediatek chipsets offloads the steps necessary for changing the frequency of CPUs. 
The driver implements the cpufreq driver interface for this hardware engine. 

From v11 to v12, there are two modifications.
1. Based on patchset[1], align binding with scmi for performance domain(latest version).
2. Shrink binding example wording. 

From v8 to v9, there are three more modifications.
1. Based on patchset[2], align binding with scmi for performance domain.
2. Add the CPUFREQ fast switch function support and define DVFS latency.
3. Based on patchser[3], add energy model API parameter for mW.

From v7 to v8, there are three more patches based on patchset v8[4].
This patchset is about to register power table to Energy model for EAS and thermal usage.
1. EM CPU power table
- Register energy model table for EAS and thermal cooling device usage.
- Read the coresponding LUT for power table.
2. SVS initialization
- The SVS(Smart Voltage Scaling) engine is a hardware which is
  used to calculate optimized voltage values for CPU power domain.
  DVFS driver could apply those optimized voltage values to reduce power consumption.
- Driver will polling if HW engine is done for SVS initialization.
  After that, driver will read power table and register it to EAS.
- CPUs must be in power on state when doing SVS. Use pm_qos to block cpu-idle state for SVS initializing.
3. Cooling device flag
- Add cooling device flag for thermal
[1]  https://lore.kernel.org/linux-devicetree/20210517155458.1016707-1-sudeep.holla@arm.com/
[2]  https://lore.kernel.org/lkml/20201116181356.804590-1-sudeep.holla@arm.com/
[3]  https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=c250d50fe2ce627ca9805d9c8ac11cbbf922a4a6
[4]  https://lkml.org/lkml/2020/9/23/384


Hector.Yuan (2):
  cpufreq: mediatek-hw: Add support for CPUFREQ HW
  dt-bindings: cpufreq: add bindings for MediaTek cpufreq HW

 .../bindings/cpufreq/cpufreq-mediatek-hw.yaml      |   71 ++++
 drivers/cpufreq/Kconfig.arm                        |   12 +
 drivers/cpufreq/Makefile                           |    1 +
 drivers/cpufreq/mediatek-cpufreq-hw.c              |  370 ++++++++++++++++++++
 4 files changed, 454 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
 create mode 100644 drivers/cpufreq/mediatek-cpufreq-hw.c
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
