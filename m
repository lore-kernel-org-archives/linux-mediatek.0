Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F1CC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 15:35:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52A0F6109F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 15:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52A0F6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzymPVbg29GOdJ61TV8EsM94Utg7rBFASuQOBAtkgqw=; b=M3uHFbh2B5+r77
	rf5xPApNdFHtmIJV2JYnmpfWxpsM2KelGxDq+Da5Jb+ZtBpY2eACLliPmgC+Psi4YWkUglGjboOsw
	/Jxc/byqCKu2l7Ss9uFVyiIPxWutCw/bidyIQ2jnp9BNkeBQNIC3MV/7G3WLMqJCp7nwQqaZYcleN
	NDJZeLbKcYlt1FJ9UCh9+dZGfSN2eUhhbIdDkwxbfi40aCibE17lVQ/SUgm3J5eAI59HltQgeh3FY
	G63G0Te3xl6exDi45X3T3uz2wrrhFgof0+O3VUHkxixp50gl4HrkklDvDjTuq36zHYr7hlBz20vm6
	+MKgrN0v6D56vb7zAOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGNap-0063nK-EP; Wed, 18 Aug 2021 15:35:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGNaZ-0063jt-Fp; Wed, 18 Aug 2021 15:34:51 +0000
X-UUID: e48577d693d342fdacd44f3ff51a32e0-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mY2xlANhzGaCwEJ+ZS0j92R3ALD9b0W3vexQNRdZJa0=; 
 b=bMpaxsYMZx+pIZKti/S/wobNBmj+Zdujb/WKq/JsHSumaUE3OE8EjuSuh728LBxheR8SFAnytHuOtSbymPO+EJPf3a6za1bWU4Me94OJSsM/mPQNW7POh0UI9I6iFUeOCC9u9exayq5Ezi9VFH680HPA3u7h2vqVpM+GorzHAGA=;
X-UUID: e48577d693d342fdacd44f3ff51a32e0-20210818
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 335577384; Wed, 18 Aug 2021 08:34:40 -0700
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 08:34:38 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 18 Aug 2021 23:34:31 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Aug 2021 23:34:31 +0800
Message-ID: <ea8c8373fbf6a9895276f098cfa2cf3f7761a4b5.camel@mediatek.com>
Subject: Re: [PATCH v6 7/9] media: mtk-mdp: use mdp-rdma0 alias to point to
 MDP master
From: houlong wei <houlong.wei@mediatek.com>
To: Eizan Miyamoto <eizan@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wenst@chromium.org" <wenst@chromium.org>, Yong Wu
 =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?= <Yong.Wu@mediatek.com>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, Andrew-CT Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= <Andrew-CT.Chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Minghsiu Tsai
 =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= <Minghsiu.Tsai@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date: Wed, 18 Aug 2021 23:34:32 +0800
In-Reply-To: <CAOak1e-oyzxbvHimMReQpZCAPyCtAsaGixjwmoa0EzMjqaUxVg@mail.gmail.com>
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
 <bf98c5ee749bca755bd46832f858536dbf51a2a4.camel@mediatek.com>
 <CAOak1e-oyzxbvHimMReQpZCAPyCtAsaGixjwmoa0EzMjqaUxVg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 52578409B4DD15A61C9794237D2C83A9C988EF0D0F591ADDCF1BB92849887C712000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_083447_560701_9CA9E42F 
X-CRM114-Status: GOOD (  27.46  )
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

Hi Eizan,

Firstly, about how to determine the master mdp driver, we also can
judge the component type. The component type can be gotten by calling
of_device_get_match_data(dev). If the component is MTK_MDP_RDMA, it is
the master driver. No matter it is mdp_rdma0 or mdp_rdma1.

Secondly, about supporting the multiple MDP master device nodes, you
can try my advice in my previous comment after the completion of this
series of patches.

Thanks a lot.

Regards,
Houlong

On Wed, 2021-08-18 at 15:43 +0800, Eizan Miyamoto wrote:
> Hi Houlong,
> 
> On Mon, Aug 16, 2021 at 1:00 PM houlong wei <houlong.wei@mediatek.com
> > wrote:
> > Hi Eizan,
> > 
> > "mdp-rdma0" may be not the only one master device node. In fact,
> > there
> > are 2 "mdp-rdma" in mt8173. You can see "mdp_rdma1" via below link.
> > 
> > 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/dts/mediatek/mt8173.dtsi?h=v5.13.11#n1016
> > If we add "mediatek,mt8173-mdp" to "mdp_rdma1" like below, we will
> > have
> > one more V4L2 video devie node.
> > 
> >                 mdp_rdma1: rdma@14002000 {
> >                         compatible = "mediatek,mt8173-mdp-rdma",
> >                                      "mediatek,mt8173-mdp";
> >                         ...
> >                 }
> > 
> > We should consider the case that there are more than one "MDP_RDMA"
> > components.
> 
> Would it be okay with you if we added support for multiple MDP master
> device nodes in follow-up changes? My rationale is this:
> - As far as I can tell, the mediatek integration with V4L2 currently
> only handles a single MDP master device node. It's not clear to me
> the
> scope of changes that will be needed to make things work properly
> with
> multiple nodes.
> - The patch series makes video decode work (admittedly, in light of
> your comments not optimally) upstream, which is better than not
> landing these changes at all.
> 
> I'd like to say that I'm very open to (and excited about) discussing
> further work to support multiple MDP master nodes, perhaps we can
> work together on this so I can understand what needs to be done.
> 
> Please let me know your thoughts,
> 
> Eizan
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
