Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09293C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 11:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tGHe5KVossrihs7S0u7+t4t4cKWE79QDKcoQSqL2qok=; b=JltUkvgixaUdl7
	9EhKINurJDWtDDkDUV/bQanc/lX9Fhs+p4g7S0FN7348UIoOJaw85R4CKbMkGIYdba1b+VEzMqnqz
	b3+tzlerS9A8LEmcwLbkNvurTuRXZ/8SJAT5BhA17lmH3cBIsggs+WTTU27HInrZ2VCW2/pYePHu1
	uSUGE9sJJAiM4kQU9c2j7XT2yy1c//KW967v3024ScfDyRAChvmP+HZHVE1YhvuBBZA/lkepE/z1m
	vp6C4Ix8O8/2ILPDTr3R+xP3ZuJNISnne/b+BDHOmxKQkSMxMpDcdFiwmSYfmIIPBmXdPhHnp1lYd
	1vgV0j1lGEvIqHEFxf5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nds6K-008dA9-9H; Mon, 11 Apr 2022 11:20:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nds5L-008cak-PI; Mon, 11 Apr 2022 11:19:58 +0000
X-UUID: a58651e643cc48ab9c211acee15cdd93-20220411
X-UUID: a58651e643cc48ab9c211acee15cdd93-20220411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1276037476; Mon, 11 Apr 2022 04:19:49 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 04:09:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 19:09:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 19:09:44 +0800
Message-ID: <5c6dc5ed28c64f62b66e7b68b54c342b63e42d42.camel@mediatek.com>
Subject: Re: [PATCH V2 15/15] cpufreq: mediatek: Use device print to show logs
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <rafael@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 11 Apr 2022 19:09:44 +0800
In-Reply-To: <20220411032922.yj4p42is5ky6bgau@vireshk-i7>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-16-rex-bc.chen@mediatek.com>
 <20220411032922.yj4p42is5ky6bgau@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_041955_855846_EC029C35 
X-CRM114-Status: GOOD (  13.66  )
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

On Mon, 2022-04-11 at 08:59 +0530, Viresh Kumar wrote:
> On 08-04-22, 12:59, Rex-BC Chen wrote:
> > Replace pr_* with dev_* to show logs.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/cpufreq/mediatek-cpufreq.c | 41 +++++++++++++++++---------
> > ----
> >  1 file changed, 23 insertions(+), 18 deletions(-)
> 
> One should always arrange the patches in this form:
> 
> - Fix bugs first (since they need to be applied first and need to go
>   to stable kernels too).
> 
> - Trivial fixes next, like this one which you chose to be present at
>   15/15. I would have applied this one right away, if it wasn't he
>   last one, because of which we have conflicts now.
> 
> - Non-trivial patches later, so reviews on them don't affect other
>   patches.
> 
Hello Viresh,

Thanks for your review and suggestions.
I will put this patch to first in next version.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
