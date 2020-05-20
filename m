Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EBEC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 07:10:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A73F206BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 07:10:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LrUlkam9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pbvbwY2W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A73F206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWv/ZQhm7P7p5/VF/C3fbfWBN9IIiP0C/el2JgT1RVA=; b=LrUlkam9A8L/r4
	f2P94QKR3p+Dr/FPohtnMI2exKsfDZe0kAAX0J8w8DifnVaUUlGubtm7KzXlWjWFnX7VjOUfJxa76
	WLoZ9zLgEd+H5kR5wBMaWXQiccD1KJuwt5UUHw+n4oMtnd3WTYy2x/zM2So0UUrVfZX8iPrjOGnEO
	aIN4RfmBxaOp1uIKSFC53tVp2GUhxJ5KXDtC7FEqhHXfZQlIf4DWx9u4lTIiChWnFYvr/ovnjTf5F
	H999MfOpvAeo8rfs6mR0pfmMBtdEn5Q8+Cl7SI5fVx0NQbhox+a2gjyX/Gjp++nCN/yNnQvH0wPEg
	TdTUOXsqllgE1mGOXFvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbIs9-0005Ok-Oi; Wed, 20 May 2020 07:10:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbIs5-0005OE-SA; Wed, 20 May 2020 07:10:35 +0000
X-UUID: c6f3b4e383334f729c3e4de2ddc0b851-20200519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mbtn5fuKa4bWOQT8SvU1VXhNMWlU6te7V37umvmkBQE=; 
 b=pbvbwY2W9OgqOcducM3HLsxsVJxcGh8iXYI+2Tolo3VKTtxHRtITJON6mSgNlrzCjLH1PFsRLaCHyFcQdEHFzAzyryiLcupwMKmyfXFyHNF83uG4K7bouJG3qhYPMutlKtQcWgLXGykKeIQ6FBCsizk3Mij0igKmpVNNotQDHbA=;
X-UUID: c6f3b4e383334f729c3e4de2ddc0b851-20200519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1054746970; Tue, 19 May 2020 23:10:30 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 May 2020 00:10:25 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 May 2020 15:10:24 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 May 2020 15:10:24 +0800
Message-ID: <1589958625.23971.2.camel@mtksdaap41>
Subject: Re: [PATCH 00/12] Add cpufreq and cci devfreq for mt8183, and SVS
 support
From: andrew-sh.cheng <andrew-sh.cheng@mediatek.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
Date: Wed, 20 May 2020 15:10:25 +0800
In-Reply-To: <852af745-dfb7-6bb5-da7e-798d166a3370@samsung.com>
References: <CGME20200520034324epcas1p3affbd24bd1f3fe40d51baade07c1abba@epcas1p3.samsung.com>
 <20200520034307.20435-1-andrew-sh.cheng@mediatek.com>
 <d08c0dc0-5573-6ba0-1d9f-18857c7f6fb6@samsung.com>
 <1589953015.8243.2.camel@mtksdaap41>
 <852af745-dfb7-6bb5-da7e-798d166a3370@samsung.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_001033_919999_CC968879 
X-CRM114-Status: GOOD (  22.20  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Mark Brown <broonie@kernel.org>, "Rafael J
 . Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-05-20 at 15:24 +0900, Chanwoo Choi wrote:
> Hi,
> 
> On 5/20/20 2:36 PM, andrew-sh.cheng wrote:
> > On Wed, 2020-05-20 at 13:10 +0900, Chanwoo Choi wrote:
> >> Hi Andrew,
> >>
> >> Could you explain the base commit of these patches?
> >> When I tried to apply them to v5.7-rc1 for testing,
> >> the merge conflict occurs.
> >>
> >> Thanks,
> 
> >> Chanwoo Choi
> > 
> > Hi Chanwoo Choi,
> > 
> > My base commit is
> > commit 8f3d9f354286745c751374f5f1fcafee6b3f3136
> > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > Date:   Sun Apr 12 12:35:55 2020 -0700
> > 
> >     Linux 5.7-rc1
> > 
> > Could you show me the conflict error?
> 
> 
> When I tried to apply first patch with 'git am',
> the merge conflict occurred.
> 
> git am \[PATCH\ 01_12\]\ OPP\:\ Allow\ required-opps\ even\ if\ the\ device\ doesn\'t\ have\ power-domains.eml
> Applying: OPP: Allow required-opps even if the device doesn't have power-domains
> error: patch failed: drivers/opp/core.c:755
> error: drivers/opp/core.c: patch does not apply
> error: patch failed: drivers/opp/of.c:195																																																																												
> error: drivers/opp/of.c: patch does not apply
> Patch failed at 0001 OPP: Allow required-opps even if the device doesn't have power-domains
> Use 'git am --show-current-patch' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 
> Regards,
> Chanwoo Choi

Hi Chanwoo,

I just make a new folder to get code and check.
Below is my command list.
Please help check the different with you.
  505  repo init -u http://gerrit.mediatek.inc:8080/cros-kernel/manifest
-b upstream
  506  repo sync -j8
  507  repo start kern-dev --all
  508   git remote add main
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  509  git remote add main
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  510  ls
  511  cd kernel/mediatek/
  512   git remote add main
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  513  git fetch main
  514  git checkout v5.7-rc1
  515  git am
Add-cpufreq-and-cci-devfreq-for-mt8183-and-SVS-support.patch
  516  history


BR,
Andrew-sh.Cheng
> 
> > 
> > BR,
> > Andrew-sh.Cheng
> >>
> >> On 5/20/20 12:42 PM, Andrew-sh.Cheng wrote:
> >>> MT8183 supports CPU DVFS and CCI DVFS, and LITTLE cpus and CCI are in the same voltage domain.
> >>> So, this series is to add drivers to handle the voltage coupling between CPU and CCI DVFS.
> >>>
> >>> For SVS support, need OPP_EVENT_ADJUST_VOLTAGE and corresponding reaction.
> >>>
> >>> Change since v5:
> >>> 	- Changing dt-binding format to yaml.
> >>> 	- Extending current devfreq passive_governor instead of create a new one.
> >>> 	- Resend depending patches of Sravana Kannan base on kernel-5.7
> >>>
> >>>
> >>> Andrew-sh.Cheng (6):
> >>>   cpufreq: mediatek: add clock and regulator enable for intermediate
> >>>     clock
> >>>   dt-bindings: devfreq: add compatible for mt8183 cci devfreq
> >>>   devfreq: add mediatek cci devfreq
> >>>   opp: Modify opp API, dev_pm_opp_get_freq(), find freq in opp, even it
> >>>     is disabled
> >>>   cpufreq: mediatek: add opp notification for SVS support
> >>>   devfreq: mediatek: cci devfreq register opp notification for SVS
> >>>     support
> >>>
> >>> Saravana Kannan (6):
> >>>   OPP: Allow required-opps even if the device doesn't have power-domains
> >>>   OPP: Add function to look up required OPP's for a given OPP
> >>>   OPP: Improve required-opps linking
> >>>   PM / devfreq: Cache OPP table reference in devfreq
> >>>   PM / devfreq: Add required OPPs support to passive governor
> >>>   PM / devfreq: Add cpu based scaling support to passive_governor
> >>>
> >>>  .../devicetree/bindings/devfreq/mt8183-cci.yaml    |  51 ++++
> >>>  drivers/cpufreq/mediatek-cpufreq.c                 | 122 ++++++++-
> >>>  drivers/devfreq/Kconfig                            |  12 +
> >>>  drivers/devfreq/Makefile                           |   1 +
> >>>  drivers/devfreq/devfreq.c                          |   6 +
> >>>  drivers/devfreq/governor_passive.c                 | 298 +++++++++++++++++++--
> >>>  drivers/devfreq/mt8183-cci-devfreq.c               | 233 ++++++++++++++++
> >>>  drivers/opp/core.c                                 |  85 +++++-
> >>>  drivers/opp/of.c                                   | 108 ++++----
> >>>  drivers/opp/opp.h                                  |   5 +
> >>>  include/linux/devfreq.h                            |  42 ++-
> >>>  include/linux/pm_opp.h                             |  11 +
> >>>  12 files changed, 874 insertions(+), 100 deletions(-)
> >>>  create mode 100644 Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml
> >>>  create mode 100644 drivers/devfreq/mt8183-cci-devfreq.c
> >>>
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
