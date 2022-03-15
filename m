Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDC6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 14:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MT0dM0fHFidduAacqzgA1GAC0nuNVhkypISzRI502N4=; b=DK+ucunwGNS43W
	CSvAfWd4kesNlsP58HuCjL+yl2KJXGoohLcPiPbNg+9l1GjWx0t9/4LSfBhfLbfegBEbx5JuaVoB7
	HSVpNT1B8orRr6J4w8oA4rO4w/ko94luLNBHc6WygIq9+jS3wnuAOHweR2lecQuWrilx6VEpwCKJb
	o0zlrHpwN7WvtApz/+Pnb9evq+/261iW7y4Ywfj5NTeuDxzLuyCS1RBETd+IKf/Ctve1l7XL5UvgW
	l4OtHnpbUB4v7pE1jNUPHaDVOWWzU/W8ptVPNsSmRu9DLsQFeaWklmblYGA5l3RdB7aZ4E1GRFqX5
	tP1uELHVXsyVLMIUsHtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8dS-009b9U-I5; Tue, 15 Mar 2022 14:58:54 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8d1-009b0e-H8; Tue, 15 Mar 2022 14:58:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E624A1F4304F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647356306;
 bh=W9WWZDCyjKEZgWKToHqeZGf4O53uVfpYv5D8zJtmRDo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gHPADtLHCuVqGguDHAaJ1a2jKzV9eCmr8++OqcQ3bFBpYkoApAALnlRUaXDI4e4fa
 slN2Le3XPPHQmDS9ekVrOowehTsP22iwQlPf9ZQwp5qTCCjzWzd04jwZQcNoL2tcOD
 FLtNnMsgNkJZge5v9hS3KuiGVy2M9n3m2w8wUToO1cooZfl2ITl3bjFc8QEaC3An8N
 3dfgaEJ5qGMd5jUBbWbRFAcUeuAeXAxA+vMH922vNIHy1ERMSPfTguw/0jd23XdjL4
 10VzQYAy6/B0lbj+EhMJdyT2i7XAxxg8z6357u4AC9MqCoJu9U744kSbGHveQcWWXg
 TQvpyEsWA/ouA==
Message-ID: <cdcf08d4-8b77-a94c-7906-073155b9865f@collabora.com>
Date: Tue, 15 Mar 2022 15:58:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v13 1/6] soc: mediatek: mutex: add common interface to
 accommodate multiple modules operationg MUTEX
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Landley <rob@landley.net>
Cc: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
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
 Alexandre Courbot <acourbot@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
 drinkcat@chromium.org, Pi-Hsun Shih <pihsun@chromium.org>,
 Hsin-Yi Wang <hsinyi@google.com>, Maoguang Meng
 <maoguang.meng@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, allen-kh.cheng@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220315061031.21642-1-moudy.ho@mediatek.com>
 <20220315061031.21642-2-moudy.ho@mediatek.com>
 <ed5418b4-e353-d879-f9b0-7a9de8fed862@collabora.com>
 <4fa1dd33-adeb-a8ae-0ded-51a813347252@landley.net>
 <CAMuHMdXA=Wo2mW_N9GGDY_NBgyhK3fDBpUO=mJb-CdoYvKU70w@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAMuHMdXA=Wo2mW_N9GGDY_NBgyhK3fDBpUO=mJb-CdoYvKU70w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_075827_757960_FDB58ADD 
X-CRM114-Status: GOOD (  24.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 15/03/22 15:50, Geert Uytterhoeven ha scritto:
> Hi Rob,
> 
> On Tue, Mar 15, 2022 at 3:37 PM Rob Landley <rob@landley.net> wrote:
>> On 3/15/22 4:10 AM, AngeloGioacchino Del Regno wrote:
>>> Il 15/03/22 07:10, Moudy Ho ha scritto:
>>>> In order to allow multiple modules to operate MUTEX hardware through
>>>> a common interfrace, a flexible index "mtk_mutex_table_index" needs to
>>>> be added to replace original component ID so that like DDP and MDP
>>>> can add their own MUTEX table settings independently.
>>>>
>>>> In addition, 4 generic interface "mtk_mutex_set_mod", "mtk_mutex_set_sof",
>>>> "mtk_mutex_clear_mod" and "mtk_mutex_clear_sof" have been added, which is
>>>> expected to replace the "mtk_mutex_add_comp" and "mtk_mutex_remove_comp"
>>>> pair originally dedicated to DDP in the future.
>>>>
>>>> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> 
>>>> --- a/drivers/soc/mediatek/mtk-mutex.c
>>>> +++ b/drivers/soc/mediatek/mtk-mutex.c
>>>> @@ -156,6 +156,7 @@ struct mtk_mutex_data {
>>>>       const unsigned int *mutex_sof;
>>>>       const unsigned int mutex_mod_reg;
>>>>       const unsigned int mutex_sof_reg;
>>>> +    const unsigned long long *mutex_table_mod;
>>>
>>> Can we change this to u64 instead?
>>
>> Linux is still LP64, correct?
> 
> On 64-bit platforms, yes.
> 
> Note that this is about "long long", which is 64-bit on all Linux platforms.
> But as the table seems to be used to store 2 32-bit values, it doesn't hurt
> to be explicit and use "u64"? Or a struct with 2 "u32" values?
> 

Exactly. I wanted this to be a hint of what's happening in the background,
without using unions to describe this.

Geert, thanks for immediately understanding my intention.

Cheers,
Angelo

> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
