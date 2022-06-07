Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1678C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 09:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrKCvn9m6kUVp2ZiVQeK/sYRmEwzHa3UFWYISrc3QHQ=; b=YbvVOnpFocBMq7
	7y85SupLCc3HFCTyljdlypxjub8BaE/zCEoTpd79S/cU1LMk9teH71ewjmlcmjm2Yk4zBMQgBIasf
	7RYG/VxUK6ki6G1TtJuFfGoHUZdUOVslf2yBkCfb7dKb5mn+4gGm3tb7JoXZc6/gxb0QGrMIzaf+Q
	2P82OxM4Hv1fIOmttTFkJ5SSWr8Ib1wsJGcnaTaclWvYOH0gwqPA46K4EDGGIBnzX6VvcqbEpiou7
	JmRMzPwqRqvFAdY87GOtWXEb4fkOEW9GzsgkDY0dpo1eihhJgeO0CqLknO1S3HKF8qzj/3PtUsrPH
	JDmvfuJ62a8gS2/m5Lpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVl9-006LuG-Ov; Tue, 07 Jun 2022 09:44:23 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVUW-006Cuw-1Z
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 09:27:13 +0000
Received: by mail-lf1-x12e.google.com with SMTP id u26so26624411lfd.8
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jun 2022 02:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bycnujn+C+TNXArQgDaRYNKXnzzQ5tOqUsTDh+BoVXc=;
        b=t8p26q3E/L/TgZvfOS55JAOsz9xPuki8ovvsGEs+DFidMo0+nC5q87KialHMbXXUx2
         NZBSPLKbAm5cIgCaNWSfYwSt4fnlLecR64L71ARiiI5CPS1aqqzrxJvXB6IKLY3WXNuu
         5SHFPVTF0HSOWo8rE6sQ/WkS4a9ZCwX0/c1KlNkUzxFzcQXCYtwlIQpkRlh9O9h7hD2c
         lzKWKa/el8B4Cs+eVSyH6vN291VP71o6gwb8Ctk7TpGDvbmiVIQea1yApDwP5aGLX40A
         Z49d4wqGHGA6mOLOnxNUVdf0Mj1739Iv+QtyQf++UoZ8BECNUCN8dDbnFukVMBX5uYds
         kbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bycnujn+C+TNXArQgDaRYNKXnzzQ5tOqUsTDh+BoVXc=;
        b=UuohTxSnDCMDP1ovbuNE1MymAjMQbRRUW90x+KvQm6wDxBmKgFh5ah6y/Iqkowykr4
         ks2AokUBNMtY7GIp7HLEhkAkMeYqc4WBXw7F6bST3u5PTrd6dFUZIAgsWqzIXVUqqsOT
         VLWoVQLFHZ8JwTTNKbD7JE0Ysz0YsFru9NXQYk+tH1s+feekqVM8lv2hOz+b0+26EyQb
         BVkBHfPD33hpWOZ9D5SO3gjJaeT/hDN6oUv6gKyO7Lvt2oYwZPvVHQDEq+OUcDfquJ7A
         Zd2WKMq9GXJ0f7UmrWSu5lRP/vrjHohKIcTSIih1/Uxj2OmYF7fdI6X++rRqjjzW57pt
         2eXw==
X-Gm-Message-State: AOAM530PE0z6SAbPtgw5INSHg/l+ospP0kTXVD2NOWovS4oKGqdnSk8x
	mvLVkmmAIzuGLbinp3fdJa38SSBaivU/a/aazLp1LQ==
X-Google-Smtp-Source: ABdhPJxQISkP4fpMf2Tx4GQZOz5bRQyTzJ8vaUdWMeVJt9giKQNrG2uqpo97Sb9v8bOTq0hPO8Lyk67AS9Huf+RLHh4=
X-Received: by 2002:a05:6512:403:b0:479:1627:a9b7 with SMTP id
 u3-20020a056512040300b004791627a9b7mr15454828lfk.233.1654594027813; Tue, 07
 Jun 2022 02:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220525015140.384-1-axe.yang@mediatek.com> <20220525015140.384-2-axe.yang@mediatek.com>
 <CAPDyKFr25qbAb9DdCpu6Cp9NyK35YAv745Duw_ht7BQc+pQF=A@mail.gmail.com> <c46ef886f908067d10b1cb9f37b3e41e6157c71d.camel@mediatek.com>
In-Reply-To: <c46ef886f908067d10b1cb9f37b3e41e6157c71d.camel@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 7 Jun 2022 11:26:31 +0200
Message-ID: <CAPDyKFp1ibzg2FO9m_m9quqPRew9jOtLJRSF80VTi0cesjhBqw@mail.gmail.com>
Subject: Re: [RESEND v12 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
To: Axe Yang <axe.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chaotian Jing <chaotian.jing@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala <satyat@google.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, 
	Eric Biggers <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, 
	Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>, 
	Tian Tao <tiantao6@hisilicon.com>, angelogioacchino.delregno@collabora.com, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_022712_160672_F372D518 
X-CRM114-Status: GOOD (  28.86  )
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

On Tue, 7 Jun 2022 at 10:24, Axe Yang <axe.yang@mediatek.com> wrote:
>
> On Fri, 2022-06-03 at 09:28 +0200, Ulf Hansson wrote:
> > On Wed, 25 May 2022 at 03:51, Axe Yang <axe.yang@mediatek.com> wrote:
> > >
> > > Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> > > This feature allow SDIO devices alarm asynchronous interrupt to
> > > host
> > > even when host stop providing clock to SDIO card. An extra wakeup
> > > interrupt and pinctrl states for SDIO DAT1 pin state switching are
> > > required in this scenario.
> > >
> > > Reviewed-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > > ---
> > >  .../devicetree/bindings/mmc/mtk-sd.yaml       | 50
> > > ++++++++++++++++++-
> > >  1 file changed, 49 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > index 2a2e9fa8c188..e83bf10281d6 100644
> > > --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> > > @@ -72,12 +72,27 @@ properties:
> > >        - const: ahb_cg
> > >
> > >    interrupts:
> > > -    maxItems: 1
> > > +    description:
> > > +      Should at least contain MSDC GIC interrupt. To support SDIO
> > > in-band wakeup, an extended
> > > +      interrupt is required and be configured as wakeup source
> > > irq.
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  interrupt-names:
> > > +    items:
> > > +      - const: msdc
> > > +      - const: sdio_wakeup
> > >
> > >    pinctrl-names:
> > > +    description:
> > > +      Should at least contain default and state_uhs. To support
> > > SDIO in-band wakeup, dat1 pin
> > > +      will be switched between GPIO mode and SDIO DAT1 mode,
> > > state_eint and state_dat1 are
> > > +      mandatory in this scenarios.
> > > +    minItems: 2
> > >      items:
> > >        - const: default
> > >        - const: state_uhs
> > > +      - const: state_eint
> >
> > Don't you need something along the lines of the below instead? I mean
> > the "state_eint" isn't always needed, right?
> >
> > oneOf:
> >   - items:
> >       - const: default
> >       - const: state_uhs
> >     - items:
> >         - const: default
> >         - const: state_uhs
> >         - const: state_eint
> >
> No, it is not always needed.
> As Rob said, the 'minItems: 2' makes the 3rd item optional.
> Combine 'minItems' and 'description' fields, it is easy for others to
> understand how to set pinctrl related properities.

Yes, I agree.

>
> Anyway, If you insist 'oneOf' is the better way, I can update that in
> next version. What do you think?

I am fine with it as is, sorry for the noise.

>
> And thanks to your comment, I found a mistake in 'description', I
> should remove descriptions related to 'state_dat1', and I will update
> that in next version.

Okay.

>
> And do you have any comment on patch 2/3 and 3/3?

Sorry for the delay, I will have a look asap.

>
>
> Regards,
> Axe
>
>

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
