Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D067FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 13:13:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A073E60F14
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 13:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A073E60F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9cd2VAHUVJ9JTl1UsF8jMRKJX5cwABPG7RGidhCetw=; b=dINGNw/797TOdi
	O4UervABzo0ESPe+fjn9HLhBG2QTS433wvAuIjwN6pej8TCfEsAZz66EQK/mp75He/QYNL2Rblwlo
	qWEEVqDnTABo1+W2pxEaDWwool6ZV3WFNu+nKJhO57HJIWNEc9OlR1mSoKwjg/4Jb9u2Bvkz5PA+k
	gBDLo1mjbufva2QxHb4miezuLVU2dpe02w31ONH4Wmkpa5EZVN90EmDrjnCJ4Nby4E+SypqpV7eDb
	JRaAHs3c4dk/ZtXj+gIlg6+Dq8XHWfPpGrVsVFL/IxINxsaoja5VARwXpU1I5uzTelV+2y85P/a9P
	T7N78r7nKbuCApLWm4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNERK-000tlr-Mf; Mon, 06 Sep 2021 13:13:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNERH-000tib-KV; Mon, 06 Sep 2021 13:13:33 +0000
X-UUID: e3b984d0177d46efa8f9c14b994d959b-20210906
X-UUID: e3b984d0177d46efa8f9c14b994d959b-20210906
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1729952453; Mon, 06 Sep 2021 06:13:26 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Sep 2021 06:11:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Sep 2021 21:11:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Sep 2021 21:11:56 +0800
Message-ID: <6d178fd86ea5874ddcac7515d461d00c441cfadc.camel@mediatek.com>
Subject: Re: [PATCH v15 2/3] cpufreq: Add of_perf_domain_get_sharing_cpumask
From: Hector Yuan <hector.yuan@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <wsd_upstream@mediatek.com>
Date: Mon, 6 Sep 2021 21:11:56 +0800
In-Reply-To: <20210906094309.rcacbme27zpvdd4a@vireshk-i7>
References: <1630658364-6192-1-git-send-email-hector.yuan@mediatek.com>
 <1630658364-6192-3-git-send-email-hector.yuan@mediatek.com>
 <20210906094309.rcacbme27zpvdd4a@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_061331_734573_B23FDE1D 
X-CRM114-Status: GOOD (  12.72  )
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

On Mon, 2021-09-06 at 15:13 +0530, Viresh Kumar wrote:
> On 03-09-21, 16:39, Hector Yuan wrote:
> > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > 
> > Add of_perf_domain_get_sharing_cpumask function to group cpu
> > to specific performance domain.
> > 
> > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > ---
> >  include/linux/cpufreq.h |   46
> > +++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> To speed things up, I have applied this with following changes.
> Please
> test my branch and see if something breaks:
> 
> 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/log/?h=cpufreq*arm*linux-next__;Ly8!!CTRNKA9wMg0ARbw!1FkaXVRm8cyf4CDTMMNDmFZ3X8eLd3gf1jK92brq9m-OryGK_peVZW963ettt0DF588$
>  
> 
Hi, Viresh:

I've tested the code in your branch and its okay. Thanks for the review
and your guideness. Thanks.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
