Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4ACC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 12:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vns1Z0z48dQgA2D3HQ7fLP/vWjruRjGCVc79RuBXdqo=; b=fj6lCDtDMjqkms
	4BYoIAXBBicJf5jhSR71ktmLpyDcmLDbkNzsgCZ7fQBhyZwux1j+qEHEVpVYbQ6OayM1zgG3JwtrT
	73cwjEG0lWWtCwf4G4Oq8SBmRKSEWPBIK8bJhlMkQ/KtE7VEQavpoH7Srg7gbBz7wiPkfSk1FE2lX
	QCpd1NErHT+8HuvrN6BtJravws4WM1CuaLAzPFlX0J2wDwow8J2t6MBpaXKIInPQXW5zmser5RbWo
	7QpHY/Jb7TPkRAWza1jUJ5QxDrzYr2Q5no8sIn2ui4n23z+mBnKnhAlkkk2aeGb5xwtyZVCkQi/Ty
	s4i/5iALnD6mpb2rf5xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUpTd-00G6rF-OG; Thu, 17 Mar 2022 12:43:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUpTO-00G6nV-Vz; Thu, 17 Mar 2022 12:43:24 +0000
X-UUID: a09ab7ec85ef4a7f86a5bcc727cb5861-20220317
X-UUID: a09ab7ec85ef4a7f86a5bcc727cb5861-20220317
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 839403634; Thu, 17 Mar 2022 05:43:15 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 05:43:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 20:43:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 20:43:11 +0800
Message-ID: <931bba40511f9912a5bdc199d30f2ff06e08fd1c.camel@mediatek.com>
Subject: Re: [PATCH v13 1/6] soc: mediatek: mutex: add common interface to
 accommodate multiple modules operationg MUTEX
From: moudy.ho <moudy.ho@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Rob Landley <rob@landley.net>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, Jernej Skrabec
 <jernej.skrabec@siol.net>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexandre Courbot
 <acourbot@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
 <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>, Hsin-Yi Wang
 <hsinyi@google.com>, Maoguang Meng <maoguang.meng@mediatek.com>, "daoyuan
 huang" <daoyuan.huang@mediatek.com>, Ping-Hsun Wu
 <ping-hsun.wu@mediatek.com>, <menghui.lin@mediatek.com>,
 <sj.huang@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 17 Mar 2022 20:43:11 +0800
In-Reply-To: <cdcf08d4-8b77-a94c-7906-073155b9865f@collabora.com>
References: <20220315061031.21642-1-moudy.ho@mediatek.com>
 <20220315061031.21642-2-moudy.ho@mediatek.com>
 <ed5418b4-e353-d879-f9b0-7a9de8fed862@collabora.com>
 <4fa1dd33-adeb-a8ae-0ded-51a813347252@landley.net>
 <CAMuHMdXA=Wo2mW_N9GGDY_NBgyhK3fDBpUO=mJb-CdoYvKU70w@mail.gmail.com>
 <cdcf08d4-8b77-a94c-7906-073155b9865f@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_054323_074844_7DC5ED31 
X-CRM114-Status: GOOD (  34.51  )
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

On Tue, 2022-03-15 at 15:58 +0100, AngeloGioacchino Del Regno wrote:
> Il 15/03/22 15:50, Geert Uytterhoeven ha scritto:
> > Hi Rob,
> > 
> > On Tue, Mar 15, 2022 at 3:37 PM Rob Landley <rob@landley.net>
> > wrote:
> > > On 3/15/22 4:10 AM, AngeloGioacchino Del Regno wrote:
> > > > Il 15/03/22 07:10, Moudy Ho ha scritto:
> > > > > In order to allow multiple modules to operate MUTEX hardware
> > > > > through
> > > > > a common interfrace, a flexible index "mtk_mutex_table_index"
> > > > > needs to
> > > > > be added to replace original component ID so that like DDP
> > > > > and MDP
> > > > > can add their own MUTEX table settings independently.
> > > > > 
> > > > > In addition, 4 generic interface "mtk_mutex_set_mod",
> > > > > "mtk_mutex_set_sof",
> > > > > "mtk_mutex_clear_mod" and "mtk_mutex_clear_sof" have been
> > > > > added, which is
> > > > > expected to replace the "mtk_mutex_add_comp" and
> > > > > "mtk_mutex_remove_comp"
> > > > > pair originally dedicated to DDP in the future.
> > > > > 
> > > > > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > > > > --- a/drivers/soc/mediatek/mtk-mutex.c
> > > > > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > > > > @@ -156,6 +156,7 @@ struct mtk_mutex_data {
> > > > >       const unsigned int *mutex_sof;
> > > > >       const unsigned int mutex_mod_reg;
> > > > >       const unsigned int mutex_sof_reg;
> > > > > +    const unsigned long long *mutex_table_mod;
> > > > 
> > > > Can we change this to u64 instead?
> > > 
> > > Linux is still LP64, correct?
> > 
> > On 64-bit platforms, yes.
> > 
> > Note that this is about "long long", which is 64-bit on all Linux
> > platforms.
> > But as the table seems to be used to store 2 32-bit values, it
> > doesn't hurt
> > to be explicit and use "u64"? Or a struct with 2 "u32" values?
> > 
> 
> Exactly. I wanted this to be a hint of what's happening in the
> background,
> without using unions to describe this.
> 
> Geert, thanks for immediately understanding my intention.
> 
> Cheers,
> Angelo
> 
> > Gr{oetje,eeting}s,
> > 
> >                          Geert
> > 
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
> > geert@linux-m68k.org
> > 
> > In personal conversations with technical people, I call myself a
> > hacker. But
> > when I'm talking to journalists I just say "programmer" or
> > something like that.
> >                                  -- Linus Torvalds
> 
> 
Hi,

Thanks for all suggestions, I will adjust this confusing settings, and
change to a more efficient space-using way to achieve same purpose.

Thanks,
Moudy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
