Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B03C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:34:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06051619B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06051619B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XHdIzRU5pbUodtsOPGxuE6KDLzGS3kqIpIUdCLJqhZU=; b=FBvCagrhcXSdscl/A4sv/evext
	YdWEWs4QJThkfgMjGXNlpd0LVuzX4VxnYOZTF8BUGgaSyEX7Exz2kDmtALEQY59H+XizM7LPdDK49
	ujkRJcJZg8rjUAOmY/rh43BTMrRpVoQamj7pjWKcK3tq1lPhvjKQXfbJQbgD8d4WGMVnuDD5ZcSPO
	hvyyoL1z+bR/gM3gbo+Uj9lRBymIHAtT+zXAvSeB+cJfFD1SxdzRvK1+b935ue/9OTX2OhNv+k/cl
	phznC2Wmjg+tk6Y09I6jl0rPJHt7gigKnHcMqKhA0Azf7b8b3bZ5DIkIZ9oluCUp4NnPPpP5WptLK
	IJbt9O8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOfIj-00EiZs-G5; Tue, 23 Mar 2021 11:34:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOfId-00EiXl-8p; Tue, 23 Mar 2021 11:34:19 +0000
X-UUID: 70a73df5e0b74c908048b5106ad2111f-20210323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Tv5v56LWBYbW7dJZj2UEP/U8nrP0oPKHC9w2QsvR3iA=; 
 b=pKhb8qi1M4T8UzFXQBph7sT4ruAOuG1cl6pwJdo7kqltnOG/Lvt/lQsoy5vh8tyNNrBSetN79poryMAKG2xCWnkGJabuob+aPIxmTp78P/OJWag4+NNY8a/g+/WLsACKT77Kq+CMtZio7VniHi2dtg1xmyA7I+u4+tltQ2XLmSo=;
X-UUID: 70a73df5e0b74c908048b5106ad2111f-20210323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1257930023; Tue, 23 Mar 2021 03:34:06 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 04:34:04 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 19:34:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 23 Mar 2021 19:34:03 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
Subject: [PATCH V8 0/8] Add cpufreq and cci devfreq for mt8183, and SVS support
Date: Tue, 23 Mar 2021 19:33:53 +0800
Message-ID: <1616499241-4906-1-git-send-email-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_113416_226893_FAB135C7 
X-CRM114-Status: GOOD (  15.96  )
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

From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>

MT8183 supports CPU DVFS and CCI DVFS, and LITTLE cpus and CCI are in the same voltage domain.
So, this series is to add drivers to handle the voltage coupling between CPU and CCI DVFS.

For SVS support, need OPP_EVENT_ADJUST_VOLTAGE and corresponding reaction.

Change since v7:
	- Separate part of "[v7,6/8] cpufreq: mediatek: add opp notification for SVS support" into another patch.
		- "cpufreq: mediatek: Add record of previous desired vproc value"
		- This is for case of there are multiple users on Vproc.
		- cpufreq will record desired voltage.
	- For "[v7,8/8] arm64: dts: mediatek: add cpufreq and cci devfreq nodes for mt8183"
		- Add "required-opps" for cci to make cpufreq based passive governor work.
	- Depend on patches have already in K-5.12

Andrew-sh.Cheng (7):
  cpufreq: mediatek: Enable clock and regulator
  dt-bindings: devfreq: add compatible for mt8183 cci devfreq
  devfreq: add mediatek cci devfreq
  cpufreq: mediatek: Add record of previous desired vproc value
  cpufreq: mediatek: add opp notification for SVS support
  devfreq: mediatek: cci devfreq register opp notification for SVS
    support
  arm64: dts: mediatek: add cpufreq and cci devfreq nodes for mt8183

Saravana Kannan (1):
  PM / devfreq: Add cpu based scaling support to passive_governor

 .../devicetree/bindings/devfreq/mt8183-cci.yaml    |  51 ++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |  36 +++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |   4 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 277 +++++++++++++++++
 drivers/cpufreq/mediatek-cpufreq.c                 | 122 +++++++-
 drivers/devfreq/Kconfig                            |  12 +
 drivers/devfreq/Makefile                           |   1 +
 drivers/devfreq/governor_passive.c                 | 329 ++++++++++++++++++++-
 drivers/devfreq/mt8183-cci-devfreq.c               | 225 ++++++++++++++
 include/linux/devfreq.h                            |  29 +-
 10 files changed, 1060 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml
 create mode 100644 drivers/devfreq/mt8183-cci-devfreq.c

-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
