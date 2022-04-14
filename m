Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 11:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TmWTI6c47JBMtZ0egvl7vOvQdvKnnrGu+ljt8YLxgI=; b=U51syle3OBGx0c
	NlrprUcNYEIA9rDplHfSKhaU47ZedeTQlMO9SmRJwyVahL4x7t2XgX3ND6S/Pzbb/7wDyrq/jRFzB
	pQrrNVd4W987VGwE84Rf7ssr0+MJQJF3LBxr1jFQFa2+2LdzPmv+/1fnRz73V4tsOPtwZrwxy2t+t
	9KOho+58EWsbw+0CDOkmwvosb4a0UQfF+Z5h2nlyD1lFlJOYSe0F1E6MvTnnwWCLiC96aE0J2aKQ2
	/4s3sNBAKrWufmQml0GeJF7I1OWCNMP1uhCvGo1CU20ZwQ7HeoqHlbKxvOYHd44ZLIx5LKQcEOODe
	4Ct8dHtGdah+fJ7fkjvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nexgO-005Hs0-Jy; Thu, 14 Apr 2022 11:30:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nexgL-005HqF-Mp; Thu, 14 Apr 2022 11:30:39 +0000
X-UUID: 0645922bc4424e7a9feec6ee0740c34e-20220414
X-UUID: 0645922bc4424e7a9feec6ee0740c34e-20220414
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 459399611; Thu, 14 Apr 2022 04:30:29 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 04:30:27 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 14 Apr 2022 19:30:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Apr 2022 19:30:20 +0800
Message-ID: <4374e31115bbcbd783003cd5c648163a1f4ff0d1.camel@mediatek.com>
Subject: Re: [PATCH V2 11/15] cpufreq: mediatek: Update logic of
 voltage_tracking()
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Kevin Hilman <khilman@baylibre.com>, <rafael@kernel.org>,
 <viresh.kumar@linaro.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 14 Apr 2022 19:30:20 +0800
In-Reply-To: <7hczhr5lm3.fsf@baylibre.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-12-rex-bc.chen@mediatek.com>
 <7hczhr5lm3.fsf@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_043037_774653_F9919D80 
X-CRM114-Status: GOOD (  15.66  )
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

On Fri, 2022-04-08 at 14:08 -0700, Kevin Hilman wrote:
> Rex-BC Chen <rex-bc.chen@mediatek.com> writes:
> 
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > - Remove VOLT_TOL because CCI may share the same sram and vproc
> >   regulators with CPU. Therefore, set the max voltage in
> >   regulator_set_voltage() to the proc{sram}_max_volt.
> 
> This could you a bit more detailed explanation.  Why does VOLT_TOL
> get
> in the way when regulators are shared between CPU & CCI?

Hello Kevin,

Here we use 'sram_min_volt' and 'sram_max_volt' to determine the
voltage boundary of sram regulator.
And use (sram_min_volt - min_volt_shift) and 'proc_max_volt' to
determine the voltage boundary of vproc regulator.
We use them as platform data to replace VOLT_TOL (voltage tolerance)
when determing the voltage boundary and invoking regulator_set_voltage.

I will add this to commit message in next version.

> 
> > - Move comparison of new and old voltages to
> >   mtk_cpufreq_voltage_tracking().
> 
> Why?  And how is this related to the above change?  Seems to me that
> it
> belongs in a separate patch.
> 
> Kevin

I think there are some mistake for this.
I will remove this commit message in next version.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
