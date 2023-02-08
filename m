Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31808C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 08:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4fNY1QmPgc1eDxWIcVEmeoLEE0WYG7olhyPqNb4FPA=; b=eyQhRQSfme+yaCdPxnfkqCywtG
	Kdg04BQAToEeQtVy0er9zW7KoFJ6xY2x5vCRlUlblI5QBNY8Y//s4I5sHe0tUuS7RU0UOOKPljMaQ
	Evz8bgmDlen6UzaXbP9Lv7tURBNofIkL7Uzxw3C5Hk2S8nXGAFYmZrfbjUPD6cyjFZYe/0mY1AQ2L
	sKDQrMPEJraIcGc3nNj6SxZectE7+TdnGlatfUd4W/0YBAxK2AAEp7c2p+b6EZNqgCDdxzp9PkLSq
	FkZGf8RXVLD4X8+UX8B4cDNQZQdp6pvVLnuR+HIB3oYj2iQ4PBQCYArvzj7bIxCFaGInrtNMv/Fbh
	pFeYoDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfkf-00EaeZ-DX; Wed, 08 Feb 2023 08:24:25 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfkU-00EacA-Dt
	for linux-mediatek@lists.infradead.org; Wed, 08 Feb 2023 08:24:17 +0000
Received: by mail-vs1-xe36.google.com with SMTP id cz15so9431584vsb.6
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Feb 2023 00:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l4fNY1QmPgc1eDxWIcVEmeoLEE0WYG7olhyPqNb4FPA=;
        b=IcMXQ/M2g9B25Yan+ex4qiEFyvr/DLfBMCj/Ps2VNy2dCwYBQ8Xfk5ckQTCPWYjnZ+
         0vwnnzDsnYI7MmW8ZWVOG1pOMYWyOiGsaI+QbFoeaMrIbwbMn73ti2t67wtyWy8RguGT
         XSkdYHbsbxZYebvANHSkqQvDkevan1O/BFD+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4fNY1QmPgc1eDxWIcVEmeoLEE0WYG7olhyPqNb4FPA=;
        b=v2vUKIpbjAm3BgrVb7wABzZml7l4S646ico9axZaxJHMJpckkPJiofQhlCTimLnXZC
         ZEiI7Se5VSLZNYCq1arfOXJshHeYz8xl3kEQismaXH9t0XcLoJPvd0AQbEz1WZVYvh0o
         u8L4/V+50PiKB5YpDd51CaV3JDVgr+LM6OBQw1om7MMIlFer8xkdjgiwHNUPY4IbdUaj
         +IGc0IaFRFSyT+Rw2p2Rzg7W3Sa9gTU0rbnaIQxxuRRwGnQTzQ3cRnn460Jw9jHuZnnF
         NmAeHBFDpGXXjObvJz6TzpRpnupWLu8lRzela/BJSegzMO4tTy6tpKUu+Hin26umEnWn
         bP+A==
X-Gm-Message-State: AO0yUKWUlx7mKlI42IOl0/HKA3eeNsg+O8sBXh2016ujLQ8sP0OevunN
	3nq4AqjEmm8ilClU2vmINo5joFpKbj9bBZM+ips0cA==
X-Google-Smtp-Source: AK7set/lc8VtASNtxb17NapmM4msjQBcz/1VBanIWZdAGanrOgaYsuc2JpxRWYXCQehO9HTtrZ7t92NrGgP+qsH8+PI=
X-Received: by 2002:a05:6102:4b8:b0:3fe:ae88:d22 with SMTP id
 r24-20020a05610204b800b003feae880d22mr1519662vsa.65.1675844652747; Wed, 08
 Feb 2023 00:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-10-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GfwY2+55UupTUNYVudg3-YDQtkkfhT=M53CJwdqG=ERg@mail.gmail.com>
 <b7b35901-59aa-5342-1bd1-5ed591a0469c@collabora.com> <CAGXv+5HNs-74COE_5V4O_ykLJN=K4YVR-5SNwcPTBcxFMoRm5g@mail.gmail.com>
 <d07156bd-95e6-5c7d-b88e-1c4a5dfc3a07@collabora.com>
In-Reply-To: <d07156bd-95e6-5c7d-b88e-1c4a5dfc3a07@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 8 Feb 2023 16:24:01 +0800
Message-ID: <CAGXv+5H07KEOhk_4BPU6Su5f2WmGygLEGSeCD9bqgdH3ix+=Rw@mail.gmail.com>
Subject: Re: [PATCH v1 09/45] clk: mediatek: mt2712: Change to use
 module_platform_driver macro
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_002414_515139_17F0C9A8 
X-CRM114-Status: GOOD (  58.17  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 7, 2023 at 6:50 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/02/23 10:30, Chen-Yu Tsai ha scritto:
> > On Tue, Feb 7, 2023 at 5:00 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 07/02/23 07:33, Chen-Yu Tsai ha scritto:
> >>> On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>
> >>>> Now that all of the clocks in clk-mt2712.c are using the common
> >>>> mtk_clk_simple_{probe,remove}() callbacks we can safely migrate
> >>>> to module_platform_driver.
> >>>
> >>> Instead of splitting the conversion into a module among many patches,
> >>> I'd do it in one go. With one patch we get a working module instead
> >>> of a half-baked one half way through the series.
> >>>
> >>
> >> If you really want I can eventually do that in one go - in any case, the
> >> sense of having this split in multiple commits is:
> >>    - Bisectability: topckgen/mcucfg migration being faulty would point at
> >>                     one commit doing just that, making it easier for whoever
> >>                     is trying to debug that to find what could've gone wrong;
> >
> > This part I agree with.
> >
> >>    - Slow changes:  A driver being a platform_driver doesn't mean that it *has*
> >>                     to be compiled as a module: infact, we can use the .remove()
> >>                     callback even with built-in drivers (as you can remove one
> >>                     and re-add it during runtime from sysfs)
> >
> > I think the part that tripped me up was that in this patch's case it
> > was already a platform driver, just a builtin one (without the
> > builtin_platform_driver sugar).
> >
> >>    - Signaling completion:
> >>                     Saying "this is complete" in this case is performed in the
> >>                     last patches of the series, where only the Kconfig is being
> >>                     changed to allow the module build for (most)all.
> >
> > I'm concerned about people randomly cherry-picking patches. Unfortunately
> > not everyone lives on mainline, us included. (I'm sure Android has it
> > worse.) Many won't see the complete patch series, doubly so if we merge
> > it in stages. Better we give one complete patch that converts the
> > boilerplate code from "can't work as module" to "can work as module".
> > I do agree we should keep all the other cleanups and migration to
> > simple/pdev_probe separate for bisectability.
> >
>
> One complete patch meaning that migrating to mtk_clk_simple_probe() should be
> squashed with moving apmixedsys away?
>
> So one patch doing the *big* change, and then one changing the driver to use
> the module_platform_driver() macro and tristate in Kconfig?

I'd also add MOD_DEVICE_TABLE. Module autoloading doesn't work otherwise.

The rest of the MODULE_INFO stuff I don't really have a preference on,
but I don't know if there would be any issues with loading a module
that doesn't have MODULE_LICENSE. Maybe the default is "GPL"?

> I would be more comfortable changing the order of commits at this point,
> apmixedsys error handling Fixes -> apmixedsys moved in its own file ->
> migrate others to mtk_clk_simple_probe() *and* Kconfig changes
>
> What do you think?

Sounds good. That way a) apmixed sys error handling could be cleanly
backported if anyone cares, and b) code movement is contained in one patch.

> Thing is, apmixedsys is not a simple_probe driver and will never be, so
> it feels wrong to move that inside of a commit that converts to simple_probe()...

Agreed.

Thanks
ChenYu

> >>> The subject could say "Convert X driver from builtin to module". And
> >>> instead of "migrate to module_platform_driver", the body could say
> >>> "convert to module by switching to module_platform_driver, and adding
> >>> missing MODULE_* statements". I believe this constitutes one logical
> >>> change. Maybe the accompanying Kconfig change should be included as
> >>> well?
> >>>
> >>
> >> But again, I don't have *really strong* opinions on this, if not preferences
> >> for how I'd like to see the changes getting in: this series brings big changes
> >> that would be done in many more commits if they were scattered in more series.
> >> Another point about having this conversion performed in multiple commits is
> >> showing how it was done and how to replicate it for a different driver...
> >
> > In the past I've seen some comments from other maintainers about keeping
> > (module|builtin)_X_driver consistent with its Kconfig entry. That sort of
> > plays into my argument that this bit should be kept atomic.
> >
> > There are a couple patches where you convert directly from CLK_OF_DECLARE
> > to module_platform_driver. We could work those out case by case?
> >
> >>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >>>> ---
> >>>>    drivers/clk/mediatek/clk-mt2712.c | 10 ++--------
> >>>>    1 file changed, 2 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
> >>>> index c5fd76d1b9df..65c1cbcbd54e 100644
> >>>> --- a/drivers/clk/mediatek/clk-mt2712.c
> >>>> +++ b/drivers/clk/mediatek/clk-mt2712.c
> >>>> @@ -1028,7 +1028,7 @@ static const struct of_device_id of_match_clk_mt2712_simple[] = {
> >>>>           { /* sentinel */ }
> >>>>    };
> >>>>
> >>>> -static struct platform_driver clk_mt2712_simple_drv = {
> >>>> +static struct platform_driver clk_mt2712_drv = {
> >>>
> >>> Why the name change? If you do change the name, could you also change
> >>> the of match table's name as well to be consistent, and also mention
> >>> the change in the commit log?
> >>
> >> It simply looked like being a good idea, as "simple" made sense when we had two
> >> platform_driver in one file, one using simple_probe, one using a custom probe
> >> function.
> >> The latter going away forever means that there's no more distinction to do
> >> between the two, hence my rename here...
> >>
> >> Regarding the of_match_table name change... I'm sorry, I genuinely forgot to
> >> change it, my intention was infact to actually be consistent... :-)
> >>
> >>>
> >>> I'd just leave it alone though.
> >>
> >> I had to explain my reasoning about all of the above, so I'll just wait for
> >> your opinion again before going for a v2! :-)
> >
> > Thanks again for working on this.
> >
> > ChenYu
>
>
>

