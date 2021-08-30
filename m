Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8265BC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 09:18:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 414146101C
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 09:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 414146101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXBfXceRjbOooIQEhRb7Y36lWv8V+P0a45PABXNLzsA=; b=n/wgb1MSwRKa88
	Ij1s1ZmXIhmJ4rTitXaBSvUsj0Jjd2siR6Szj0jACZ3b/MErT6EHTJz+ZA+Yzn+0nMsW+tbz/fiuj
	2K1C9VXEBL9t5EVX16dGIUfK3UqHji9nTUUOf5b5uHUf6mvE5R3Cx3c9earhG1uES6jb7LwFUJLxj
	6fUKgIlNb4ViAq90POosO/MXBVnwIZOJIzys2PokBQTYd4uSUuLQmZXuQzr1TBE1HEBTZ1jwwj+bt
	/uXxrylM08SjHqhuKU89zc929neiJFYqhT2Cl4fBxyPAvnxhH6eMoToWj+6omVuixEFHvQ06R9Fhc
	0+BYbfpgz3phSlYjjCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKdQz-00GqH4-EX; Mon, 30 Aug 2021 09:18:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKdQt-00GqGL-DW; Mon, 30 Aug 2021 09:18:27 +0000
X-UUID: d990f9f7ffe54fffba4253cb32210efe-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VLGRimzrdkfwchdwq+WzNLO96kLZ0J37codVtOuAFwA=; 
 b=uSWwx+t/BtrU0SEx/x3WRD7gL38zmSPcum/+Okj6+57aH7j8/SoBxTxWddh4Xz3d/XWyM+2f63Ghza+ewGSyJpyyLr4aGzaRSlSZwm+RMgmkMZTdJR3mj280sW3wkGppD8oPv/3ctOY40leCocYo5DapBL5PBhdhDseP9swKDfM=;
X-UUID: d990f9f7ffe54fffba4253cb32210efe-20210830
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2016155601; Mon, 30 Aug 2021 02:18:19 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 02:08:29 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 17:08:28 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 Aug 2021 17:08:28 +0800
Message-ID: <964ef8cae3e1eb276da4d891a6daac6ed05bb734.camel@mediatek.com>
Subject: Re: [PATCH v14 2/3] cpufreq: Add of_perf_domain_get_sharing_cpumask
From: Hector Yuan <hector.yuan@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <wsd_upstream@mediatek.com>
Date: Mon, 30 Aug 2021 17:08:27 +0800
In-Reply-To: <20210830050450.r4kfv72bsxsttnli@vireshk-i7>
References: <1630162872-25452-1-git-send-email-hector.yuan@mediatek.com>
 <1630162872-25452-3-git-send-email-hector.yuan@mediatek.com>
 <20210830050450.r4kfv72bsxsttnli@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_021823_665016_4E07B53B 
X-CRM114-Status: GOOD (  17.64  )
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

On Mon, 2021-08-30 at 10:34 +0530, Viresh Kumar wrote:
> On 28-08-21, 23:01, Hector Yuan wrote:
> > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > 
> > Add of_perf_domain_get_sharing_cpumask function to group cpu
> > to specific performance domain.
> > 
> > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > ---
> >  include/linux/cpufreq.h |   39
> > +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> > index 9fd7194..4916d70 100644
> > --- a/include/linux/cpufreq.h
> > +++ b/include/linux/cpufreq.h
> > @@ -13,6 +13,8 @@
> >  #include <linux/completion.h>
> >  #include <linux/kobject.h>
> >  #include <linux/notifier.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> >  #include <linux/pm_qos.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/sysfs.h>
> > @@ -1036,6 +1038,43 @@ void arch_set_freq_scale(const struct
> > cpumask *cpus,
> >  }
> >  #endif
> >  
> > +#ifdef CONFIG_CPU_FREQ
> > +static inline int of_perf_domain_get_sharing_cpumask(int index,
> > const char *list_name,
> > +						     const char
> > *cell_name,
> > +						     struct cpumask
> > *cpumask)
> 
> What happened with the discussion we had about returning index and
> passing CPU
> there ?
> 
Hi, Viresh, sorry for this, I didn't upload the correct version of
cpufreq.h. Should I just go v15 or you want to do some review for other
part of my patches? Thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
