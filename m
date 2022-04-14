Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599B8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 03:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pl+LZIb8qu4G6A7sQgZK5sbA1cba4oonxatBuqiSCoc=; b=1weKKZ6aEGOVfs
	RC/QMKiusdak55Il38KYpi1T0GtyTVHQLXFAhgNSQOH7wCh8q4gPxKKgmFU4ig1vBwqSsTim2os4R
	Po5YPV/aIqiZlq75/BlKTKRV+uRA7AdnyW/HvXR8kZyRKvu91pgdYNaC7yb1z3uldnQsuPLQhRBl9
	tj2q/hh0XOo/qv8Ia7jccnkDejyxZoMqEnX2JdXptEtIOO7p9XewR9vYLon3MMAdQKps5BL5dU8xa
	PieMhd5OiIwkr9I4pvZuu7xNu7O/2LxeO0VIcJhPqlrFOpL5R+AGNENMk8EZP27ll33+KfgWFu1+1
	FAwlkrnWlZ5YMwbmRzWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neqLn-003klP-VO; Thu, 14 Apr 2022 03:40:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neqLk-003kkN-BQ; Thu, 14 Apr 2022 03:40:54 +0000
X-UUID: e509ab194bf34f57aa1b2380588ec556-20220413
X-UUID: e509ab194bf34f57aa1b2380588ec556-20220413
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 514414935; Wed, 13 Apr 2022 20:40:46 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 20:40:45 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 14 Apr 2022 11:40:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Apr 2022 11:40:37 +0800
Message-ID: <fc1e157470d7ad68efd823f38fe4a360ba3dfbde.camel@mediatek.com>
Subject: Re: [PATCH V2 12/15] cpufreq: mediatek: Use maximum voltage in init
 stage
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 14 Apr 2022 11:40:37 +0800
In-Reply-To: <5f788a8f-7092-19ca-8499-d3626c4a386d@collabora.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-13-rex-bc.chen@mediatek.com>
 <5f788a8f-7092-19ca-8499-d3626c4a386d@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_204052_419421_A402BC8F 
X-CRM114-Status: GOOD (  13.43  )
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

On Fri, 2022-04-08 at 15:37 +0200, AngeloGioacchino Del Regno wrote:
> Il 08/04/22 06:59, Rex-BC Chen ha scritto:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > Two or more clients may use the same regulator, and it could cause
> > the
> > issue of high-freqeuncy-low-voltage.
> > To prevent this, we use maximum voltage in
> > mtk_cpu_dvfs_info_init().
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Is this happening for proc-supply (proc_reg)?
> ...because it looks like it is, so you should send this commit
> separately
> and with an appropriate Fixes: tag.

Hello all,

If we use the value of max(booting voltage, target cpufreq voltage)
when cci is not ready, I think we don't need this patch to prevent high
frequenc low voltage issue.
(mentioned in [1])

I will drop this patch in next version.

Thanks.

[1]:https://patchwork.kernel.org/comment/24816091/

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
