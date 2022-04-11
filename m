Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46631C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 12:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZjs0jE2pGoglATc0rQ0hAFulLoimXS0F+G39y9cgb0=; b=LOVddqh0M+mqWq
	Vwrmy64l7sE3oFnep8Z4OTkntSeMUg1R1FQZrZ1zglrw42OwMt/+UrCTa87UMN8xmTZB4qhzHASbY
	tHiAtEyisIzlKbi6ByFxHAXgI9lu1saw5FUd3u/ilZ08iWEC7KC1yCmXVyGTrq+WA15TQFRo46Whs
	74ynpK0MN2PMIOxAABfXclBcXSN1r/ShfS7/1mHSG1fOlsQ6w6Jy1a9tdPZUJ3hqweD05ePG+E74f
	+2xAH0zfUedUJZmIuizZbruza7od6wcFCRuBDpXdSsMfIyRBfKyHEYl2B1A3pot7bAxfOZdIazV3A
	GEedKCSXPIYGUxYZABRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndsjx-008plB-7m; Mon, 11 Apr 2022 12:01:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndsjV-008pXv-6t; Mon, 11 Apr 2022 12:01:26 +0000
X-UUID: a2e7f0c888784938a8edce935b028afc-20220411
X-UUID: a2e7f0c888784938a8edce935b028afc-20220411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1128842304; Mon, 11 Apr 2022 05:01:22 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 04:51:19 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 11 Apr 2022 19:51:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 19:51:18 +0800
Message-ID: <f4c5177fe99cc62b78083d3e8192d97065b2dad2.camel@mediatek.com>
Subject: Re: [PATCH V2 13/15] cpufreq: mediatek: Link CCI device to CPU
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Kevin Hilman <khilman@baylibre.com>, <rafael@kernel.org>,
 <viresh.kumar@linaro.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 11 Apr 2022 19:51:18 +0800
In-Reply-To: <7hfsmn5m9f.fsf@baylibre.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-14-rex-bc.chen@mediatek.com>
 <7hfsmn5m9f.fsf@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_050125_278129_B007CD5A 
X-CRM114-Status: GOOD (  24.04  )
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

On Fri, 2022-04-08 at 13:54 -0700, Kevin Hilman wrote:
> Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
> 
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > In some MediaTek SoCs, like MT8183, CPU and CCI share the same
> > power
> > supplies. Cpufreq needs to check if CCI devfreq exists and wait
> > until
> > CCI devfreq ready before scaling frequency.
> > 
> > - Add is_ccifreq_ready() to link CCI device to CPI, and CPU will
> > start
> >   DVFS when CCI is ready.
> > - Add platform data for MT8183.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> The checks here are not enough, and will lead to unexpected behavior.
> IIUC, before doing DVFS, you're checking:
> 
> 1) if the "cci" DT node is present and
> 2) if the driver for that device is bound
> 
> If both those conditions are not met, you don't actually fail, you
> just
> silently do nothing in ->set_target().  As Angelo pointed out also,
> this
> is not a good idea, and will be rather confusing to users.
> 
> The same thing would happen if the cci DT node was present, but the
> CCI
> devfreq driver was disabled.  Silent failure would also be quite
> unexpected behavior.  Similarily, if the cci DT node is not present
> at
> all (like it is in current upstream DT), this CPUfreq driver will
> silently do nothing.  Not good.
> 
> So, this patch needs to handle several scenarios:
> 
> 1) CCI DT node not present
> 
> In this case, the driver should still operate normally.  With no CCI
> node, or driver there's no conflict.
> 
> 2) CCI DT present/enabled but not yet bound
> 
> In this case, you could return -EAGAIN as suggested by Angelo, or
> maybe
> better, it should do a deferred probe.
> 
> 3) CCI DT present, but driver disabled
> 
> This case is similar to (1), this driver should continue to work.
> 
> Kevin

Hello Kevin,

Thanks for your review.
I will review these three situations and do some modification.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
