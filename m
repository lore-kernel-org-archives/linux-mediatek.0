Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FFBC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 14:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEZwnz161LpKwClsC08bmQjAaH21irGJtu9yvmF3Ets=; b=1D7qOBj3EhaIkT
	mSrx2Sx6lOK2vwOQWuIOpwWSI/5nEyZPsXx9m+03uqedhDFU94229JWweKywcMSifzM9+YqmZby14
	Gq6CDTt6h1vwCd6AiEZTgwO7wXAC5Ewau7lp6ezBZwjdQwYtF2kxzs/9Rn39vCm48L+MNvFppCs6a
	ytUcG/fZyh2sQZvJQl6DC+1MEHpMVegbYFDCcoKTrPn8oQV67fTzw9xjL4GI54XuYpKVczbcGjDVu
	0jGYCYA3f66MLbNJDsTpbNHE6fvZikFjSEmCx31ZTT6C4rKKp8cI6rte5rkIHTCP92OTe8nHe4t2q
	Z7N3o4Z1PV/vk3Rt9yQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8W8-009YO4-LU; Tue, 15 Mar 2022 14:51:20 +0000
Received: from mail-qt1-f181.google.com ([209.85.160.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8Vv-009YKN-A0; Tue, 15 Mar 2022 14:51:08 +0000
Received: by mail-qt1-f181.google.com with SMTP id c4so616309qtx.1;
 Tue, 15 Mar 2022 07:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TqRiDtRTyctY9EOBnjU+68Czy+r+PuJUhYm8YFFF+dU=;
 b=p9XpZdtAWkmoEJl7Jja0Iq8SU0EOzdUmOFBgr09QOe9I7Tb/QQYOUrGirKtK0q8ft2
 2WyecgUSO22saKwFDiCdoHfJV6Ze9ahdxNN4SF4KXGxXWj17uxyf6m+VsC0oxB8fBLFP
 xZHBLU2RZNsCdItjVQaDkPVOwpHRIl77lc6uqca97riRoW6+yCPHfe/ool8AIJnpCSMZ
 VmMfmWy2kDSVrAiMXB8XDlLI1UE6WJC5t3BLztbyrvj2c5rDzvVdOWrZCLDq75qXlW/2
 1EQhYVCQNLFpgt5lhJT6XKlXMW7anKXg5XWf7xoI4UkRyLoXQtfb6hDCfVZxzU7RIiSq
 44Fw==
X-Gm-Message-State: AOAM531e4W7LP8inWCWGcB1xOZiPdPTBIcqUf1q+6XybIxcg9opTHxE8
 RbG+oeGBin1sLqOiwSZyVML4jR+fbFaePg==
X-Google-Smtp-Source: ABdhPJwZhohuK8ED8+KqBvPh+WCN3Y9yX77F6yspKUzMLeCWuT97QYbVPA2MJfYw/oCWkgPOcbMfhw==
X-Received: by 2002:a05:622a:138c:b0:2e1:d525:969 with SMTP id
 o12-20020a05622a138c00b002e1d5250969mr7435650qtk.154.1647355864263; 
 Tue, 15 Mar 2022 07:51:04 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 k1-20020ac85fc1000000b002e1c6420790sm8167083qta.40.2022.03.15.07.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 07:51:03 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id u103so2414280ybi.9;
 Tue, 15 Mar 2022 07:51:03 -0700 (PDT)
X-Received: by 2002:a25:dfd3:0:b0:629:24ff:eab0 with SMTP id
 w202-20020a25dfd3000000b0062924ffeab0mr22936647ybg.613.1647355863067; Tue, 15
 Mar 2022 07:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220315061031.21642-1-moudy.ho@mediatek.com>
 <20220315061031.21642-2-moudy.ho@mediatek.com>
 <ed5418b4-e353-d879-f9b0-7a9de8fed862@collabora.com>
 <4fa1dd33-adeb-a8ae-0ded-51a813347252@landley.net>
In-Reply-To: <4fa1dd33-adeb-a8ae-0ded-51a813347252@landley.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Mar 2022 15:50:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXA=Wo2mW_N9GGDY_NBgyhK3fDBpUO=mJb-CdoYvKU70w@mail.gmail.com>
Message-ID: <CAMuHMdXA=Wo2mW_N9GGDY_NBgyhK3fDBpUO=mJb-CdoYvKU70w@mail.gmail.com>
Subject: Re: [PATCH v13 1/6] soc: mediatek: mutex: add common interface to
 accommodate multiple modules operationg MUTEX
To: Rob Landley <rob@landley.net>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Moudy Ho <moudy.ho@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Tomasz Figa <tfiga@chromium.org>, drinkcat@chromium.org, 
 Pi-Hsun Shih <pihsun@chromium.org>, Hsin-Yi Wang <hsinyi@google.com>, 
 Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, 
 allen-kh.cheng@mediatek.com, randy.wu@mediatek.com, jason-jh.lin@mediatek.com, 
 roy-cw.yeh@mediatek.com, river.cheng@mediatek.com, 
 srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_075107_368965_1FA15DAA 
X-CRM114-Status: GOOD (  27.47  )
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

Hi Rob,

On Tue, Mar 15, 2022 at 3:37 PM Rob Landley <rob@landley.net> wrote:
> On 3/15/22 4:10 AM, AngeloGioacchino Del Regno wrote:
> > Il 15/03/22 07:10, Moudy Ho ha scritto:
> >> In order to allow multiple modules to operate MUTEX hardware through
> >> a common interfrace, a flexible index "mtk_mutex_table_index" needs to
> >> be added to replace original component ID so that like DDP and MDP
> >> can add their own MUTEX table settings independently.
> >>
> >> In addition, 4 generic interface "mtk_mutex_set_mod", "mtk_mutex_set_sof",
> >> "mtk_mutex_clear_mod" and "mtk_mutex_clear_sof" have been added, which is
> >> expected to replace the "mtk_mutex_add_comp" and "mtk_mutex_remove_comp"
> >> pair originally dedicated to DDP in the future.
> >>
> >> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

> >> --- a/drivers/soc/mediatek/mtk-mutex.c
> >> +++ b/drivers/soc/mediatek/mtk-mutex.c
> >> @@ -156,6 +156,7 @@ struct mtk_mutex_data {
> >>      const unsigned int *mutex_sof;
> >>      const unsigned int mutex_mod_reg;
> >>      const unsigned int mutex_sof_reg;
> >> +    const unsigned long long *mutex_table_mod;
> >
> > Can we change this to u64 instead?
>
> Linux is still LP64, correct?

On 64-bit platforms, yes.

Note that this is about "long long", which is 64-bit on all Linux platforms.
But as the table seems to be used to store 2 32-bit values, it doesn't hurt
to be explicit and use "u64"? Or a struct with 2 "u32" values?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
