Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FDAC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 03:43:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AD0C2081A
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 03:43:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lkqezrnG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ji6Jjpqh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AD0C2081A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aV69kNf+CQs2JkgSDKy2obru/viVzTurNPFYS/NTcx4=; b=lkqezrnG65cdEo
	itxtSsRVvHt3Per9hC3SWS3Z9xHppaXmGjjMUOq/ykfBO9l6TuI1AEcgccQyABORXcTOP4404l0OW
	tS1Uu4yXCStB2aL2/KQ/zB5m/2SE1XpGbzbmUlQH89ValtH1i9TBMxTfJ8LCJ21Okh9SZQTZo+tYl
	EhHliag13KJ/nJxBU5bRubiGx4fnRAsqO3DgVsmrYDVufVKkpkgA3mKmGVuJlQDBYObPZgLxxWY8K
	zSOCUV4ZzW7bd3zuYaC7c7jj8Ryo77rmJl6p55H6WpCbgeqhX/99U27cUheeqj+wWLtL7AdjQ6Yzq
	oGgEM8ub1L4xxL6dwPUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbFdg-0001Np-T5; Wed, 20 May 2020 03:43:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbFdd-0001NJ-Jb; Wed, 20 May 2020 03:43:27 +0000
X-UUID: cc7dd3d1cd784e40a521d0dae226d53c-20200519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=I/ipTuLZZN+lNS6Vkk1QJ+iIXyt0Ii1/ZmMGHZu52U8=; 
 b=Ji6Jjpqh/AjiYHMXsVNFqviXJSSgFlfeSUUm5ekJCvFfISHyVLglPZd3+Ot3Fx0pqttTIWpDXUNCssVJyEOPkxCI0CxQHczDL6rwM+4Cx606OKvhnXNQbLsoWt9V+waQyQqW69MI801hPaSJEEsZIa2RPo0iFTOVsrHvht36lbA=;
X-UUID: cc7dd3d1cd784e40a521d0dae226d53c-20200519
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 196550989; Tue, 19 May 2020 19:43:21 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 May 2020 20:43:18 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 May 2020 11:43:16 +0800
Received: from mtkslt209.mediatek.inc (10.21.15.96) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 May 2020 11:43:10 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH 00/12] Add cpufreq and cci devfreq for mt8183, and SVS support
Date: Wed, 20 May 2020 11:42:55 +0800
Message-ID: <20200520034307.20435-1-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_204325_651518_7152B8D8 
X-CRM114-Status: GOOD (  11.08  )
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

MT8183 supports CPU DVFS and CCI DVFS, and LITTLE cpus and CCI are in the same voltage domain.
So, this series is to add drivers to handle the voltage coupling between CPU and CCI DVFS.

For SVS support, need OPP_EVENT_ADJUST_VOLTAGE and corresponding reaction.

Change since v5:
	- Changing dt-binding format to yaml.
	- Extending current devfreq passive_governor instead of create a new one.
	- Resend depending patches of Sravana Kannan base on kernel-5.7


Andrew-sh.Cheng (6):
  cpufreq: mediatek: add clock and regulator enable for intermediate
    clock
  dt-bindings: devfreq: add compatible for mt8183 cci devfreq
  devfreq: add mediatek cci devfreq
  opp: Modify opp API, dev_pm_opp_get_freq(), find freq in opp, even it
    is disabled
  cpufreq: mediatek: add opp notification for SVS support
  devfreq: mediatek: cci devfreq register opp notification for SVS
    support

Saravana Kannan (6):
  OPP: Allow required-opps even if the device doesn't have power-domains
  OPP: Add function to look up required OPP's for a given OPP
  OPP: Improve required-opps linking
  PM / devfreq: Cache OPP table reference in devfreq
  PM / devfreq: Add required OPPs support to passive governor
  PM / devfreq: Add cpu based scaling support to passive_governor

 .../devicetree/bindings/devfreq/mt8183-cci.yaml    |  51 ++++
 drivers/cpufreq/mediatek-cpufreq.c                 | 122 ++++++++-
 drivers/devfreq/Kconfig                            |  12 +
 drivers/devfreq/Makefile                           |   1 +
 drivers/devfreq/devfreq.c                          |   6 +
 drivers/devfreq/governor_passive.c                 | 298 +++++++++++++++++++--
 drivers/devfreq/mt8183-cci-devfreq.c               | 233 ++++++++++++++++
 drivers/opp/core.c                                 |  85 +++++-
 drivers/opp/of.c                                   | 108 ++++----
 drivers/opp/opp.h                                  |   5 +
 include/linux/devfreq.h                            |  42 ++-
 include/linux/pm_opp.h                             |  11 +
 12 files changed, 874 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml
 create mode 100644 drivers/devfreq/mt8183-cci-devfreq.c

-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
