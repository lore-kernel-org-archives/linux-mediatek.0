Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8964C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 09:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DbNzE6S16pm4OYvkc5oVwcgIxIJqhJ2Qi5eYrHX/AWw=; b=V1x0UmoViNxxpa
	GCW+iaBqFgWE0AK5SfJgVOEKgp4SRisQ11+LblM4SlYDxwNfD/1wUY9RYblZaW2PVNd/mi/T/vL2Q
	1lsxrTbz6zDIPqp0n+E2dmrn4LP4iawGVGt/1y6cOmCwJPIGESUvN9KMBSj/dP+v02DZB27me9bDw
	dk1I6VaIRNnmY6lSWXEMvTjwDJzMZpOKDBclltuxd6yFVNRhooyAyJHNIdFV/I5jXh9NSZyH6Ynhm
	U4Z8bE4V8qDYJshge8hWLb4iIcPNQKxZsf8hlQMp/Li3m0zbyTHASc2P2B2DIBCZEWwl3boHB9LY6
	7L3aaWCrTfNaBDPbfqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nryX5-00BRDM-Te; Fri, 20 May 2022 09:02:51 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nryWr-00BR85-I9
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 09:02:38 +0000
Received: by mail-ej1-x631.google.com with SMTP id kq17so14417359ejb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 20 May 2022 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QKmUJF1anHWjOfPQl6wU+ROhTyxsa1Rv/nGtZdce0GY=;
 b=YUHoJjWZPLdgkjzdP8yFhlkh/fh/W2URfrIKZyDrXfA1Bbwfb3Vkeydu7AHkve/yZM
 K2TPKdjupVnpwoirGeGJtiabsY6Jrq3mcqM3sngTxRG62LujWuPRdYQACiNgcg6YuTK0
 eZ29ANkx/HQ/SyIt0dGah38NRE5SQbWbaD6Wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QKmUJF1anHWjOfPQl6wU+ROhTyxsa1Rv/nGtZdce0GY=;
 b=znw4naxk49scTmhcrq7YeQ5tTwsausuHCYmpUkhrUjud8drFfR0HWoRVvKDlW3ru79
 mcGCI3ePEzgkW+gdsnK/umFO/qWWZvjbj25Ec8g4XAzVUEzfda15Ffs8dVkrRs0DGZI1
 fkaILwDUxt8egbfQ8Cc4iRwOvZnWYDoAwb5m4W8MuEg27WnduX7PBpBIcw+GzCfmLgwk
 QkQqKyJMiua1TkaCvdP5qeGA0QuHTQSIsIodNu5a0k8yru1Olk/RWDLnojFaijD3kIxX
 apNPKzQgWQ+kqy2mYFJ4yzd7BFGoVzPRLuKkHuTVbu2ZEUY84HRrGz703uDQqukbmZ/S
 5RDQ==
X-Gm-Message-State: AOAM530xW4RiEe7xyqjYHm0jcbn2VmHwBV/Ag5xjMbtS/EhGff4J1/8a
 sI2RDMZa4+7b3OrPrfLFjzXa4XoLNIGNJOrs44wjUw==
X-Google-Smtp-Source: ABdhPJy95aZ+LA7wg0UbIA4EUwveKTOJRq5Oon3TiS6zl/rD/L/kL0uHtmwU2QuvyiPu4lRoZ8ho7gdJeThP+nOnQz8=
X-Received: by 2002:a17:906:a10e:b0:6f3:e70b:b572 with SMTP id
 t14-20020a170906a10e00b006f3e70bb572mr7549904ejy.546.1653037353979; Fri, 20
 May 2022 02:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
 <20220519134728.456643-4-y.oudjana@protonmail.com>
 <5b5f6656-8694-dc78-ef42-7ce301849aa4@collabora.com>
In-Reply-To: <5b5f6656-8694-dc78-ef42-7ce301849aa4@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 20 May 2022 17:02:22 +0800
Message-ID: <CAGXv+5HDA1QACKrzgWFFboCtK1pz7UeaE7XK4o_tMofy68EyVQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: mediatek: reset: Return reset data pointer on
 register
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 Miles Chen <miles.chen@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_020237_631545_B0FB7B09 
X-CRM114-Status: GOOD (  29.46  )
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

On Fri, May 20, 2022 at 4:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 19/05/22 15:47, Yassine Oudjana ha scritto:
> > From: Yassine Oudjana <y.oudjana@protonmail.com>
> >
> > Return a struct mtk_clk_rst_data * when registering a reset
> > controller in preparation for adding an unregister helper
> > that will take it as an argument. Make the necessary changes
> > in drivers that do not currently discard the return value
> > of register functions.
> >
> > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>
> Hello Yassine,
>
> Thanks for your efforts on helping to make the MediaTek clocks better - I agree
> (and I'm not the only one..) that there's a lot of work to do on this side.
>
> Though... I don't think that this is the right direction: you're right about
> properly unregistering (in patch 4/6) the reset controllers on rmmod/failure
> but I'm not sure that this kind of noise brings any benefit.

Since Rex is working on cleaning up the reset bits, maybe also coordinate
with him?

> Explaining:
> You definitely saw that there's a new register _with_dev, which uses devm ops
> and that's going to automatically cleanup in case of removal/failure.

I don't think they use devres at the moment. They should, but I haven't
gotten that far with my improvements. *wink*

> This is what we should do.
>
> Hence, my proposal is to drop patch 3/6, 4/6, 5/6 and (slowly, steadily) migrate
> all of the MediaTek clocks from CLK_OF_DECLARE() to platform drivers (which also
> means that we can eventually change them to tristate!), so that we slowly remove
> all users of all functions that are not "_with_dev", and that we finally remove
> all of these then-unused functions as well.

I agree with moving all the drivers off of CLK_OF_DECLARE() if possible.
There are definitely going to be a few ARM32 ones that can't be converted,
likely because they don't have the ARM arch timer, and need a clock
registered before the timers. Been there.

And there's a whole lot of work to be done for all the old drivers so that
they clean up after themselves.

My desire is to clean up the API (the naming and the parameters) so that
they more closely match up with the underlying CCF APIs they call. We can
then add devres variants (and of_ ones for the unfortunate platforms that
need them).

> Making sure that I don't get misunderstood:
>       I'm not implying that this huge migration work is on your shoulders!

Yeah. I'll likely take up quite a bit of it after all my currently planned
cleanup work is done. Unless of course someone beats me to it.

> P.S.: Chen-Yu, Miles: do you also agree? :-)

Yes.


Regards
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
