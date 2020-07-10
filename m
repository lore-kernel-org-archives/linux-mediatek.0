Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67E5C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 02:41:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9825720663
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 02:41:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HkTcwfBF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="o6HLAPPI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9825720663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M6lpTOcGTFx6g0sMnA3lfgqPYxslxz2CveVYsX/g47k=; b=HkTcwfBFD9ezAY2z1SNCsCBBG9
	DhsaZazjvFV7SeySI4wnq3o2e4N87bcnQzv0Y66IDPJCRebQ60LO38/xEkcoJ8N+7zP3TUw0YxTSa
	jtwpub4FNXCVAOCj9q1S3dLa6HYXfWH2Wg1821ae2VyqrzRX4OFPcONTaS2RK58gJWPMLEK6QTWog
	/Ammjsu1Xpaa1WboBrnb4N59p3jRSneiH1d/pT0x6NzisasYj2VOrFwpH5TLwaOgqwfrT1fPt6iOr
	/f/rK/EZYMVORGBI2sPkor98YAt6LbpxVvGx49ANk5lBqESpVPIx9N98JXPndz3Pmlo/Fh5Kp3VeX
	mjT4YE7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtiyo-0005k1-9A; Fri, 10 Jul 2020 02:41:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtiyk-0005hm-72; Fri, 10 Jul 2020 02:41:35 +0000
X-UUID: fa882ebb30154ce48c76eb438d4849cd-20200709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=v+xsmrXQuI/gFHoMrOV/tHEg28bpwssmoyL7Rl7mIoQ=; 
 b=o6HLAPPINmJ1tpnPqRj1gT9UtJp+Lnmpu2p1ZcBYw+jP2I9nRhynvRvRDGoLhWWgqK1WHCMGzjwdMCqsRRBJQ2Qy+zv/keSTYISSsTdHizrIPjBLDy1WGBb0+eo70qG4e0ROkuFhm0rMvNdc5WVTtdQelNBDnRvOEcFMQnVIw/g=;
X-UUID: fa882ebb30154ce48c76eb438d4849cd-20200709
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 489842140; Thu, 09 Jul 2020 18:41:27 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 19:31:27 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 10:31:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Jul 2020 10:31:26 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH v7 0/8] Add cpufreq and cci devfreq for mt8183, and SVS support
Date: Fri, 10 Jul 2020 10:31:16 +0800
Message-ID: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_224134_470985_69EC478D 
X-CRM114-Status: GOOD (  15.85  )
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

MT8183 supports CPU DVFS and CCI DVFS, and LITTLE cpus and CCI are in the same voltage domain.
So, this series is to add drivers to handle the voltage coupling between CPU and CCI DVFS.

For SVS support, need OPP_EVENT_ADJUST_VOLTAGE and corresponding reaction.

Change since v6:
	- Don't resend the patch set "Add required-opps support to devfreq passive gov"
		- https://patchwork.kernel.org/cover/11055499/
	- For modification of governor_passive.c
		- Using dev_pm_qos_read_value() to replace directly accessing.
		- Modify the usage of register_parent_dev_notifier()
	- For modification of mt8183-cci-devfreq.c
		- Using devfreq_recommended_opp() to get devfreq opp item.
	- Add dts of mt8183 cpufreq/cci_devfreq nodes patch into this patch set,
	  which depends on compatible="mediatek,mt8183-cci"

Depend on regulator node patch:
	https://patchwork.kernel.org/cover/11055499/



Andrew-sh.Cheng (7):
  cpufreq: mediatek: Enable clock and regulator
  dt-bindings: devfreq: add compatible for mt8183 cci devfreq
  devfreq: add mediatek cci devfreq
  opp: Modify opp API, dev_pm_opp_get_freq(), find freq in opp, even it
    is disabled
  cpufreq: mediatek: add opp notification for SVS support
  devfreq: mediatek: cci devfreq register opp notification for SVS
    support
  arm64: dts: mediatek: add cpufreq and cci devfreq nodes for mt8183

Saravana Kannan (1):
  PM / devfreq: Add cpu based scaling support to passive_governor

 .../devicetree/bindings/devfreq/mt8183-cci.yaml    |  51 ++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |  36 +++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 245 +++++++++++++++
 drivers/cpufreq/mediatek-cpufreq.c                 | 122 +++++++-
 drivers/devfreq/Kconfig                            |  12 +
 drivers/devfreq/Makefile                           |   1 +
 drivers/devfreq/governor_passive.c                 | 332 +++++++++++++++++++--
 drivers/devfreq/mt8183-cci-devfreq.c               | 225 ++++++++++++++
 drivers/opp/core.c                                 |   2 +-
 include/linux/devfreq.h                            |  29 +-
 10 files changed, 1026 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml
 create mode 100644 drivers/devfreq/mt8183-cci-devfreq.c

-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
