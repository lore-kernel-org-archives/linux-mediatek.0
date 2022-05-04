Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69980C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 12:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FIUORnJ8UVnRRoTdWYVu6YbFjMfE90PzD58Qaacu+s=; b=G7KTSSocnwxkK5
	5/BbRORP1RuobVvvLcO/0rmx2gKvVt2qBB2xcxJLQeXu0hBDmp6CKbjqTw1vJrsBRM1pnHpsBsKME
	6+zB28t2tl0KMbzDereEuY0doAn9Kd8IifA+KSYDcd+P855jt/CIFOoD5y2LnrSlqlj8JMBFMbshk
	3AqVqh28i3KJJbkouoxbja6JzqjJpe++yZk/cO8H0eUUNIsVtu8DB5gFg9m5fuvidkiuHi5S3/5GQ
	8laNTltikuEEBts3JwCQMPw2FSwjnbcHlm40OWH6B3ePiQ5nThjARbUlsfshX5CKrEy+vTbm+9ggW
	zMoobIA0aAVOqQj1J6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmDl4-00Actk-SI; Wed, 04 May 2022 12:05:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmDkq-00AcpJ-Rm; Wed, 04 May 2022 12:05:21 +0000
X-UUID: 84a3b89297a145b2bfbbfafbc7d8432b-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:e64f06bc-005d-439b-9799-5f901b37eaf7, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:8b228bb2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 84a3b89297a145b2bfbbfafbc7d8432b-20220504
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 379342253; Wed, 04 May 2022 05:05:07 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 04:57:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 19:57:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 4 May 2022 19:57:09 +0800
Message-ID: <332f8adec6601f97ab2814d06330883a251e41ec.camel@mediatek.com>
Subject: Re: [PATCH V4 07/14] cpufreq: mediatek: Add .get function
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <rafael@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 4 May 2022 19:57:09 +0800
In-Reply-To: <20220504082249.anrvkf2ssbxyzz5m@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-8-rex-bc.chen@mediatek.com>
 <20220425053548.72w2jh2g6lpzgz6g@vireshk-i7>
 <64c690e8edf493ec0a4a14e0fdaad2d8e88e6da7.camel@mediatek.com>
 <20220425100058.4kbvmpi63ygni6k5@vireshk-i7>
 <078b1f9b39690da98cbd3c4528ba28374a097083.camel@mediatek.com>
 <20220427031141.or2owu5wrh2cadfo@vireshk-i7>
 <346736a339bed576817179ded3795d61f71fa06a.camel@mediatek.com>
 <20220428114835.3ktimyz2tzzqdcbg@vireshk-i7>
 <27a5dddd91b3dcbd69f08c10108cdec808237ace.camel@mediatek.com>
 <20220504082249.anrvkf2ssbxyzz5m@vireshk-i7>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_050516_950330_C78DA39A 
X-CRM114-Status: GOOD (  14.60  )
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

On Wed, 2022-05-04 at 13:52 +0530, Viresh Kumar wrote:
> On 03-05-22, 19:33, Rex-BC Chen wrote:
> > Our observation tells us cpufreq_online is setting only once at
> > boot
> > for one cpu cluster.
> > But we can see the problem repeatly occurs once cpufreq_get is
> > invoked.
> > 
> > e.g.
> > [ 71.154560] cpufreq: Warning: CPU frequency out of sync: cpufreq
> > and
> > timing core thinks of 500000, is 499999 kHz
> > [ 71.155880] cpufreq: notification 0 of frequency transition to
> > 499999
> > kHz
> > [ 71.156777] cpufreq: notification 1 of frequency transition to
> > 499999
> > kHz
> > [ 71.187241] cpufreq: target for CPU 0: 500000 kHz, relation 0,
> > requested 500000 kHz
> > [ 71.188246] cpufreq: target_freq/policy->cur: 500000/499999 kHz
> 
> Lemme know if this helps:
> 
> 
https://lore.kernel.org/lkml/39e39a7d30c8ee6af81fb64670a330abeb87402e.1651652493.git.viresh.kumar@linaro.org/
> 

Hello Viresh,

Thanks a lot! It helps to fix this issue.
And I will drop this patch in the next version.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
