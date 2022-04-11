Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35716C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 11:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KK98lV6D0+0kgAUXI7ogO8Ka7ivbXUYhYVn+zGvxO6c=; b=GOtCFizbu4LaYD
	ho2soIWkX+gPtwC66VJs0SPAzvwZrQ11sahAahnM+VhZrQft5NyIvOo6TORB1MeA0Hw3YMn5pY+6m
	Ebv7QqWk/V2UXhbJnNSGCku54MdP35pn04+lxxYmhoTks/Gg8NoOf0R/r5AX4PkD5M3OmzCqxsOLH
	RIVV9XsbrDjRoF8d8TunAVmzx16P2a0aJBk4Lglu0ALzIpv8GmVRLuRvb0OnG3Ge0wNHKBGBJl/Ig
	BT5FPkLRq09ydNS82yhYZsn+VIHPqOpKFqKmPTaKqWyA6gRWGcqK+50Zt7DWU2OqGmPPF597B0Svt
	TZzmuEi1io4Yq/t7PXbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndsWI-008ljE-0r; Mon, 11 Apr 2022 11:47:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndsW7-008lhc-I2; Mon, 11 Apr 2022 11:47:37 +0000
X-UUID: d0270541bc1a49cf9e34c6e912875b99-20220411
X-UUID: d0270541bc1a49cf9e34c6e912875b99-20220411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 371813905; Mon, 11 Apr 2022 04:47:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 04:37:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 11 Apr 2022 19:37:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 19:37:54 +0800
Message-ID: <664e31f0449533b41cd50f9d2fc68ec79ca9dfa3.camel@mediatek.com>
Subject: Re: [PATCH V2 00/15] cpufreq: mediatek: Cleanup and support MT8183
 and MT8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Hsin-Yi Wang <hsinyi@google.com>, Kevin Hilman <khilman@baylibre.com>
CC: <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, <krzk+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tim Chang <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 11 Apr 2022 19:37:54 +0800
In-Reply-To: <CACb=7PVu6Rt3giBW78LWtkM=9xV6JzZgFSKOmUNx_26O0Wvowg@mail.gmail.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <7h5ynj5lhc.fsf@baylibre.com>
 <CACb=7PVu6Rt3giBW78LWtkM=9xV6JzZgFSKOmUNx_26O0Wvowg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_044735_629176_5A1B7A5D 
X-CRM114-Status: GOOD (  23.06  )
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

On Sat, 2022-04-09 at 09:05 +0800, Hsin-Yi Wang wrote:
> On Sat, Apr 9, 2022 at 5:11 AM Kevin Hilman <khilman@baylibre.com>
> wrote:
> > 
> > Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
> > 
> > > Cpufreq is a DVFS driver used for power saving to scale the clock
> > > frequency
> > > and supply the voltage for CPUs. This series do some cleanup for
> > > MediaTek
> > > cpufreq drivers and add support for MediaTek SVS[2] and MediaTek
> > > CCI
> > > devfreq[3] which are supported in MT8183 and MT8186.
> > 
> > There's no upstream DT for MT8186 and there are no OPPs defined in
> > the
> > upstream DT for MT8183.
> > 
> > In order to test this on mainline, could you provide a patch for
> > MT8183
> > that adds OPPs to the DT so this can be tested with mainline?
> > 
> 
> The DT change used in the downstream kernel is from here:
> 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/1616499241-4906-9-git-send-email-andrew-sh.cheng@mediatek.com/__;!!CTRNKA9wMg0ARbw!ykRlVJPl8TZWMCfnAzLnqhtn3iqXeHh8f6tMBWpneZuJPPmJTGEDIiEgv-R_Q4gVunnp$
>  
> Might need some update (eg. add the cci property in cpu) though.
> Rex, you can also include the 8183 DT change in the next version
> since
> most of the mt8183 dts are in the mainline.
> 
> Thanks
> 
> > Thanks,
> > 
> > Kevin

Hello Kevin and Hsinyi,

OK I will add dts part of cpufreq for MT8183 in next version.
And I think the cci part will be upstreamed in cci seriues.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
