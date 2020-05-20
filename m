Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DCFC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 05:44:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0A742075F
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 05:44:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fDf74D3K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EDvzEM8x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0A742075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6FR55uUDyuWSrbAWZmUmBB1On1Ch9YOFxPWtaN/Ijo=; b=fDf74D3K01U6Il
	OE+JKVY6NnLfEVsyLExFSsk/lc0FiSmUX/mqPb3Uq9umduJBhbET3zqiURJ6+uW0qfo+wRTs1dZD7
	MMrzR4aMPCgiWTAAcQKyIVJPY6pdH6wFygOmRXcNtGX2mf1+rPN7X5ToQlYcaZuq+uSOb1gsiLIeA
	W2Hi6xqgjSbNZOHkFSqzTuYCDs/hA+4MXU+MWbOPApbYu6aNRkp0RZLCl6fyHC7vJxb1BLVeheR/z
	AolN3JcTPi8N5fifQ9n+Pr1cU5KKO9qNgvyvRFZ4/ti5j3040r3BTQJRDZmFFidxu5ljBHbCJCIwf
	n0MHdC2zLTX3ULcCxfSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbHWN-0002Uy-1T; Wed, 20 May 2020 05:44:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbHWK-0002UK-2C; Wed, 20 May 2020 05:44:01 +0000
X-UUID: a1c940d97fcb40c99b3a5e0bd1099e42-20200519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nYc+pSkNQ//KAuNKNyF6D7XuOmlKnUTkhWcw97R/H5Y=; 
 b=EDvzEM8xOVwS4geJ0qGiDxjs2wNpallE0+VU9YqJp1YoPVdWhH5NxgHVzGlVUEAkSvB+xxjuHntkvk3iG/b0MWnfzU0IGHB5fkTqpxUhooYY8DsrvLzK/7EWZ5+AsoN6PU6IhCmpgmQNVqWkzPonUvyKV8L0ZJePHfqImYLun4w=;
X-UUID: a1c940d97fcb40c99b3a5e0bd1099e42-20200519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1447562701; Tue, 19 May 2020 21:43:57 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 May 2020 22:36:56 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 May 2020 13:36:54 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 May 2020 13:36:54 +0800
Message-ID: <1589953015.8243.2.camel@mtksdaap41>
Subject: Re: [PATCH 00/12] Add cpufreq and cci devfreq for mt8183, and SVS
 support
From: andrew-sh.cheng <andrew-sh.cheng@mediatek.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
Date: Wed, 20 May 2020 13:36:55 +0800
In-Reply-To: <d08c0dc0-5573-6ba0-1d9f-18857c7f6fb6@samsung.com>
References: <CGME20200520034324epcas1p3affbd24bd1f3fe40d51baade07c1abba@epcas1p3.samsung.com>
 <20200520034307.20435-1-andrew-sh.cheng@mediatek.com>
 <d08c0dc0-5573-6ba0-1d9f-18857c7f6fb6@samsung.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_224400_110254_09CE73B2 
X-CRM114-Status: GOOD (  17.55  )
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

On Wed, 2020-05-20 at 13:10 +0900, Chanwoo Choi wrote:
> Hi Andrew,
> 
> Could you explain the base commit of these patches?
> When I tried to apply them to v5.7-rc1 for testing,
> the merge conflict occurs.
> 
> Thanks,
> Chanwoo Choi

Hi Chanwoo Choi,

My base commit is
commit 8f3d9f354286745c751374f5f1fcafee6b3f3136
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Apr 12 12:35:55 2020 -0700

    Linux 5.7-rc1

Could you show me the conflict error?

BR,
Andrew-sh.Cheng
> 
> On 5/20/20 12:42 PM, Andrew-sh.Cheng wrote:
> > MT8183 supports CPU DVFS and CCI DVFS, and LITTLE cpus and CCI are in the same voltage domain.
> > So, this series is to add drivers to handle the voltage coupling between CPU and CCI DVFS.
> > 
> > For SVS support, need OPP_EVENT_ADJUST_VOLTAGE and corresponding reaction.
> > 
> > Change since v5:
> > 	- Changing dt-binding format to yaml.
> > 	- Extending current devfreq passive_governor instead of create a new one.
> > 	- Resend depending patches of Sravana Kannan base on kernel-5.7
> > 
> > 
> > Andrew-sh.Cheng (6):
> >   cpufreq: mediatek: add clock and regulator enable for intermediate
> >     clock
> >   dt-bindings: devfreq: add compatible for mt8183 cci devfreq
> >   devfreq: add mediatek cci devfreq
> >   opp: Modify opp API, dev_pm_opp_get_freq(), find freq in opp, even it
> >     is disabled
> >   cpufreq: mediatek: add opp notification for SVS support
> >   devfreq: mediatek: cci devfreq register opp notification for SVS
> >     support
> > 
> > Saravana Kannan (6):
> >   OPP: Allow required-opps even if the device doesn't have power-domains
> >   OPP: Add function to look up required OPP's for a given OPP
> >   OPP: Improve required-opps linking
> >   PM / devfreq: Cache OPP table reference in devfreq
> >   PM / devfreq: Add required OPPs support to passive governor
> >   PM / devfreq: Add cpu based scaling support to passive_governor
> > 
> >  .../devicetree/bindings/devfreq/mt8183-cci.yaml    |  51 ++++
> >  drivers/cpufreq/mediatek-cpufreq.c                 | 122 ++++++++-
> >  drivers/devfreq/Kconfig                            |  12 +
> >  drivers/devfreq/Makefile                           |   1 +
> >  drivers/devfreq/devfreq.c                          |   6 +
> >  drivers/devfreq/governor_passive.c                 | 298 +++++++++++++++++++--
> >  drivers/devfreq/mt8183-cci-devfreq.c               | 233 ++++++++++++++++
> >  drivers/opp/core.c                                 |  85 +++++-
> >  drivers/opp/of.c                                   | 108 ++++----
> >  drivers/opp/opp.h                                  |   5 +
> >  include/linux/devfreq.h                            |  42 ++-
> >  include/linux/pm_opp.h                             |  11 +
> >  12 files changed, 874 insertions(+), 100 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml
> >  create mode 100644 drivers/devfreq/mt8183-cci-devfreq.c
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
