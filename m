Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997F1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 01:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pI7dsDZuXjlhdDlOZ319kKE53VAwRKbkcljXFrhle8s=; b=xPaVOHP/ocRGIJ
	xcFbEBHkudnwuXhsdg3PJtaYb1w/u7QSWRygFtXtwbffg7r137ghxhtnwOdPMM92K4h2gbdABBeki
	fnH/O+DRaVKlbVRXOB99Mv5RXOw5d+rsGb6TgtqPxQfkZJ2zg4ymcBsNrhJRUobAznnH2w+C23IZw
	dj0BRDbwUtm8+bA7K+NwDNLswNTlDb/1C/gwWzTced0EbDOzBWTzBQ5BHD0K20rDSgZA6VChL0gqf
	OWSNCLzOyQl+WGUkdFdyBSfGjwtf+DExluXHWjj48uVnN/zezwxvQob3PxH3yzFeQ8YEqdR3WXRDH
	BqGpLmm6vEW35L+K+VPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngGUo-00FGOc-E2; Mon, 18 Apr 2022 01:48:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngGUc-00FGMW-UV; Mon, 18 Apr 2022 01:47:56 +0000
X-UUID: 716308dbf31e4a5990f0ad89ad4eb593-20220417
X-UUID: 716308dbf31e4a5990f0ad89ad4eb593-20220417
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1396091753; Sun, 17 Apr 2022 18:47:49 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 17 Apr 2022 18:38:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 18 Apr 2022 09:38:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 Apr 2022 09:38:52 +0800
Message-ID: <566255dd130a718f1e27f91bfff07597246e0168.camel@mediatek.com>
Subject: Re: [PATCH V3 05/15] cpufreq: mediatek: Add opp notification support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Andrew-sh.Cheng
 <andrew-sh.cheng@mediatek.com>
Date: Mon, 18 Apr 2022 09:38:51 +0800
In-Reply-To: <6f5e44e3-c690-5e39-bbb6-fb6bd0091099@collabora.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-6-rex-bc.chen@mediatek.com>
 <6f5e44e3-c690-5e39-bbb6-fb6bd0091099@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_184755_033792_869C861F 
X-CRM114-Status: GOOD (  19.24  )
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

On Fri, 2022-04-15 at 14:24 +0200, AngeloGioacchino Del Regno wrote:
> Il 15/04/22 07:59, Rex-BC Chen ha scritto:
> > From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> > 
> >  From this opp notifier, cpufreq should listen to opp notification
> > and do
> > proper actions when receiving events of disable and voltage
> > adjustment.
> > 
> > One of the user for this opp notifier is MediaTek SVS.
> > The MediaTek Smart Voltage Scaling (SVS) is a hardware which
> > calculates
> > suitable SVS bank voltages to OPP voltage table.
> > 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/cpufreq/mediatek-cpufreq.c | 93
> > +++++++++++++++++++++++++++---
> >   1 file changed, 85 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> > b/drivers/cpufreq/mediatek-cpufreq.c
> > index fa8b193bf27b..221f249f8d21 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > @@ -41,6 +41,11 @@ struct mtk_cpu_dvfs_info {
> >   	int intermediate_voltage;
> >   	bool need_voltage_tracking;
> >   	int pre_vproc;
> > +	/* Avoid race condition for regulators between notify and
> > policy */
> > +	struct mutex reg_lock;
> > +	struct notifier_block opp_nb;
> > +	int opp_cpu;
> 
> This should be unsigned int because:
> 1. A negative CPU number is impossible;
> 2. The only usage is as a parameter of cpufreq_cpu_get(unsigned int
> cpu).
> 
> Please change this to unsigned int, after which:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Hello Angelo, 

OK, I will do this in next version.
Thanks!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
