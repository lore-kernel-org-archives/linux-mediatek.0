Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6424DC54E58
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 09:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67mIt70RA651hiRrdK60hZHecYixcfjG1H+3EdtMaw8=; b=V1TmtuNp8lyv5hmbtxfg3CRFRa
	seRJSqzKjA4Od2DXpQw38dMUX20oRktOSwff5ulalsVg+B2yeYwM1Pf4FbIOFHDnBB1+Xnpz4M27w
	fxFnf/E61TlKvStE9SAkzcn4EX2zaClsLQM5GjDnurXYG1Nzw7HqDYyPiXXF+zq0IU35FQ8MM/dSZ
	qOJJZjQc/iMShvrQ5dvyW8uOOKmyszA3mu03GHodzUhthZsbnZwE29SeF9zAFW33Bh8QL8miEFxi/
	A8/BOdzZ1Y3fCv8yAE10Tr8fqVdup4VwFdNXAJDc3D9lBQ8xC6zGwLsy3aQNdztriCJetBMXUtpEN
	VwRPwkUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjyXr-000000058LY-30LX;
	Tue, 12 Mar 2024 09:35:39 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjyXp-000000058KZ-2iVD
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Mar 2024 09:35:39 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1dbd32cff0bso39910825ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Mar 2024 02:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710236134; x=1710840934; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67mIt70RA651hiRrdK60hZHecYixcfjG1H+3EdtMaw8=;
        b=jOjI+grMiFPHku4q4pJQpMxZmhMmmVAee4omripBV20RPNwtNM5ILcDjIDKdwcir72
         HoQjPdNeUNMUCiMh1h6nGIpTCpSFjDpB3ip2zTcAjZepafqnXIYwiOCRkG62rDTEbquw
         TpjWfkH7WsBI3GSLsrGpTU04oYc6b7Aw1NAbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710236134; x=1710840934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67mIt70RA651hiRrdK60hZHecYixcfjG1H+3EdtMaw8=;
        b=UlGAZ/X6c3QVqO63lauUC2fEWIfPeIuAJ7xSAhfpXdXJLEW3GetrQSlRpsnkoEOqC2
         kYkjcVxKjTi/9Hn3yK9ygbDE6rI/trsznJa3PK0a/ti3fAA2YWq2r75jnPDembLHDe6a
         gL55Vlfv+Iwzp/XcE1PLOYDhUXv2FQP0Db6r8QTAxlGglJCb3aT4R4IEdRi1IWBANcFD
         PyJinnojWOiuSpQdXE17VnRvmimWjo2HF1Skr3BQ0vY+A5mmdIef860gpURDILyXcEnu
         bFZZSFFjehCns7aE2mjRn7rVWo8ILXxNmrPH7i6PMKatVkYyVEItlmusnnR7sbAZ0f+W
         Objg==
X-Forwarded-Encrypted: i=1; AJvYcCV8V5hUDbTO6bcJXFMN4mXmXTQoyethK6X0V+s9SPMjcXfs23eocYuebvu0tcHVlxTT2doR2TZgeBfZGAXQzif2rLE2FPU43IkK2DTW5+I4nISO
X-Gm-Message-State: AOJu0YySpXeQlXvVlHGE3XSXw1t/PcwPM8sRR89zkN3s0vWtx3zH+q9I
	bsbLok50LoDA127RdB4EmU2hI07FTCw7jooJZvC49ED53LpEJFkOmL+uZj/wTfPIPq/AUdZ25Up
	XKxaYn4j/fp4y2hLYTBsABGS/Ac6FH/ObbYP1
X-Google-Smtp-Source: AGHT+IFRheMB1JX4C3nOS5cWFzeoNd2uuovpqIFb3L8pxJPZAaYrzJBEw63ZBZYqsASkGhEl0MxTaaKQrIOJs3DVsdo=
X-Received: by 2002:a17:902:ef8d:b0:1dc:adad:f54b with SMTP id
 iz13-20020a170902ef8d00b001dcadadf54bmr8379096plb.44.1710236134159; Tue, 12
 Mar 2024 02:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240108081834.408403-1-treapking@chromium.org>
 <CAGXv+5EnBt+7WrNb-QyziEaCihvjhFVf2tpzk=XyAoeELqucaw@mail.gmail.com>
 <e0e6febf-1045-49f8-a200-8bc095b0fa50@collabora.com> <CAGXv+5F5YFRKjaXu_XbXrUhqKL0NSRyt6tniQYfhRh+fsaxqmg@mail.gmail.com>
 <cc74422d-962f-4da5-867b-158a71db1a7b@collabora.com> <CAGXv+5EyRROsh_=J1Fg4K+ZgfkERF4dh4R6WoGw9MnTBMNUCgQ@mail.gmail.com>
 <dfdc6a65-3ccf-463c-95df-093f3c2fefd3@collabora.com> <CAEXTbpcPfWQr4iuD2U0zgJUi+BF-rLfyF4iDDiQYBrrv9U=6Xg@mail.gmail.com>
 <90f3f4e2-ced5-4fae-b765-5b802f4895c8@collabora.com>
In-Reply-To: <90f3f4e2-ced5-4fae-b765-5b802f4895c8@collabora.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 12 Mar 2024 17:35:23 +0800
Message-ID: <CAEXTbpeSyh1YfKsM8cqRjOFA7Ww4ooRxgCxMwXw2F4uCyX=OBg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: mediatek: Introduce need_pm_runtime to mtk_clk_desc
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Weiyi Lu <weiyi.lu@mediatek.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_023537_702302_138E0A12 
X-CRM114-Status: GOOD (  68.32  )
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

Hi Angelo

On Thu, Mar 7, 2024 at 7:22=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/03/24 12:10, Pin-yen Lin ha scritto:
> > Hi Angelo and Chen-yu,
> >
> > I tried enabling the runtime PM regardless of the .need_pm_runtime
> > flag, and my MT8183 device works well with that with no obvious boot
> > regression.
> >
> > Should I send out another patch that always enables runtime PM in
> > __mtk_clk_simple_probe()? Or is there anything I should test?
> >
>
> Hello Pin-yen,
>
> as I discussed with Chen-Yu - yes, we must make sure that this does not
> create any regression on machines running on other SoC models.
>
> I think it's unlikely that it does, but since the HW is available, being
> extremely careful with validating this change is a good idea :-)
>
> If you can/want to test before we do, sure, please send the new patch and=
,
> when you do, please say that you tested it and on which SoCs; as long as
> it's not just one SoC, that'll be good enough for me.
>
> P.S.: Please don't top-post!
>
> Cheers,
> Angelo

I just tried this on MT8192 and the system looks healthy as well. I'll
send out a patch to enable the runtime PM for all mediatek clock
controllers.

Thanks for your time on reviewing this, and sorry for the top-posting.

Regards,
Pin-yen

>
> > Regards,
> > Pin-yen
> >
> > On Thu, Feb 29, 2024 at 6:36=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 29/02/24 11:34, Chen-Yu Tsai ha scritto:
> >>> On Thu, Feb 29, 2024 at 5:45=E2=80=AFPM AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>
> >>>> Il 29/02/24 08:17, Chen-Yu Tsai ha scritto:
> >>>>> On Mon, Feb 26, 2024 at 7:16=E2=80=AFPM AngeloGioacchino Del Regno
> >>>>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>>>
> >>>>>> Il 23/02/24 05:27, Chen-Yu Tsai ha scritto:
> >>>>>>> On Mon, Jan 8, 2024 at 4:18=E2=80=AFPM Pin-yen Lin <treapking@chr=
omium.org> wrote:
> >>>>>>>>
> >>>>>>>> Introduce a new need_pm_runtime variable to mtk_clk_desc to indi=
cate
> >>>>>>>> this clock controller needs runtime PM for its operations.
> >>>>>>>> Also do a runtime PM get on the clock controller during the
> >>>>>>>> probing stage to workaround a possible deadlock.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >>>>>>>
> >>>>>>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >>>>>>>
> >>>>>>> The patch itself looks fine.
> >>>>>>>
> >>>>>>> Besides the MT8183 MFG clock issues, we do actually need this for=
 the
> >>>>>>> MT8192 ADSP clock. Its power domain is not enabled by default.
> >>>>>>>
> >>>>>>
> >>>>>> ...but on MT8195 the ADSP clock works - because the ADSP node exis=
ts.
> >>>>>
> >>>>> That's an indirect dependency that should not be relied on. Say the=
 clock
> >>>>> driver probed but the ADSP hasn't, and you try to read out the curr=
ent
> >>>>> status. What would happen?
> >>>>>
> >>>>> - Read out works fine, because the power domain is default on, and =
hasn't
> >>>>>      been turned off by late cleanup
> >>>>> - Read out is bogus (but you can't tell)
> >>>>> - Read out hangs.
> >>>>>
> >>>>> The third is what happens on MT8192. There's still some issues on t=
hat
> >>>>> front, as even after I applied the ADSP power domain patches from M=
ediaTek,
> >>>>> the readout was still hanging.
> >>>>>
> >>>>
> >>>> That MT8192 lockup story is getting crazy in my head... anyway, besi=
des that,
> >>>> I get the point - I was somehow ignoring the fact that kernel module=
s do exist.
> >>>>
> >>>> Eh, sorry about that :-)
> >>>>
> >>>>>> This poses a question: should we make clock controllers depend on =
power domains,
> >>>>>> or should we keep everything powered off (hence clocks down - no p=
ower consumption)
> >>>>>> *unless* the user exists?
> >>>>>
> >>>>> That's a policy discussion separate from actual hardware dependenci=
es.
> >>>>> *If* the clock controller needs the power domain to be active for t=
he
> >>>>> registers to be accessed, the clock controller *must* have a direct
> >>>>> dependency on the power domain.
> >>>>>
> >>>>
> >>>> I admit I should've worded that better.
> >>>>
> >>>> "should we make clock controllers depend on power domains" was actua=
lly implying
> >>>> "IF those need one" :-)
> >>>>
> >>>> I really wonder if - at this point - it's simply a better idea to no=
t restrict
> >>>> the call to devm_pm_runtime_enable/resume_and_get to `need_runtime_p=
m =3D=3D true`.
> >>>>
> >>>> Do we really need to exclude that on other clock controllers that do=
n't have
> >>>> any power domain dependency? Any side effect?
> >>>>
> >>>> Saying this because if we can avoid yet another per-SoC flag I'm rea=
lly happy,
> >>>> as readability is also impacted and besides - if we ever find out th=
at one of
> >>>> those need a power domain in the future, we'll need just one commit =
and just
> >>>> only in the devicetree, instead of enabling a flag in driver X as we=
ll as that,
> >>>> avoiding some (potentially unnecessary) noise... I guess.
> >>>>
> >>>> P.S.: I just noticed that the return value for the devm_pm_runtime_e=
nable() call
> >>>>          is not being checked!
> >>>>
> >>>> .......
> >>>>
> >>>> In short....
> >>>>
> >>>> Chen-Yu, at this point, do you have any reason why we wouldn't be ab=
le and/or it
> >>>> wouldn't be a good idea to just avoid adding the `need_runtime_pm` f=
lag (meaning
> >>>> that we perform pm_runtime calls for all clock drivers unconditional=
ly)?
> >>>>
> >>>> If this is about longer boot time, I don't think that it's going to =
be more than
> >>>> a millisecond or two, so that should be completely ignorable.
> >>>
> >>> I think it's just more of a "don't enable features you don't need" th=
ing.
> >>> We already ran into a weird deadlock, which is why the devm_pm_runtim=
e_enable()
> >>> call has that comment.
> >>>
> >>> I don't think anyone has actually looked at it. As you said it should=
n't be
> >>> much, at least during boot time. It's one call per clock controller.
> >>>
> >>>> Can you please do a test for that, or should I?
> >>>
> >>> The earliest I can work on it would be some time next week. Does that=
 work
> >>> for you?
> >>>
> >>
> >> The earliest I'd be able to work on this myself would be at the end of=
 next
> >> week if not later.. so yes, please take your time, no worries.
> >>
> >> Thank you!
> >>
> >>> ChenYu
> >>>
> >>>> Cheers
> >>>> Angelo
> >>>>
> >>>>>> For the second one, this means that the *device* gets the power do=
main (adsp), and
> >>>>>> not the clock controller (which clocks are effectively useless if =
there's no user).
> >>>>>
> >>>>> No. See my previous paragraph.
> >>>>>
> >>>>> ChenYu
> >>>>>
> >>>>>> Angelo
> >>>>>>
> >>>>>>>> ---
> >>>>>>>>
> >>>>>>>> Changes in v3:
> >>>>>>>> - Update the commit message and the comments before runtime PM c=
all
> >>>>>>>>
> >>>>>>>> Changes in v2:
> >>>>>>>> - Fix the order of error handling
> >>>>>>>> - Update the commit message and add a comment before the runtime=
 PM call
> >>>>>>>>
> >>>>>>>>      drivers/clk/mediatek/clk-mtk.c | 19 +++++++++++++++++++
> >>>>>>>>      drivers/clk/mediatek/clk-mtk.h |  2 ++
> >>>>>>>>      2 files changed, 21 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediat=
ek/clk-mtk.c
> >>>>>>>> index 2e55368dc4d8..ba1d1c495bc2 100644
> >>>>>>>> --- a/drivers/clk/mediatek/clk-mtk.c
> >>>>>>>> +++ b/drivers/clk/mediatek/clk-mtk.c
> >>>>>>>> @@ -13,6 +13,7 @@
> >>>>>>>>      #include <linux/of.h>
> >>>>>>>>      #include <linux/of_address.h>
> >>>>>>>>      #include <linux/platform_device.h>
> >>>>>>>> +#include <linux/pm_runtime.h>
> >>>>>>>>      #include <linux/slab.h>
> >>>>>>>>
> >>>>>>>>      #include "clk-mtk.h"
> >>>>>>>> @@ -494,6 +495,18 @@ static int __mtk_clk_simple_probe(struct pl=
atform_device *pdev,
> >>>>>>>>                             return IS_ERR(base) ? PTR_ERR(base) =
: -ENOMEM;
> >>>>>>>>             }
> >>>>>>>>
> >>>>>>>> +
> >>>>>>>> +       if (mcd->need_runtime_pm) {
> >>>>>>>> +               devm_pm_runtime_enable(&pdev->dev);
> >>>>>>>> +               /*
> >>>>>>>> +                * Do a pm_runtime_resume_and_get() to workaroun=
d a possible
> >>>>>>>> +                * deadlock between clk_register() and the genpd=
 framework.
> >>>>>>>> +                */
> >>>>>>>> +               r =3D pm_runtime_resume_and_get(&pdev->dev);
> >>>>>>>> +               if (r)
> >>>>>>>> +                       return r;
> >>>>>>>> +       }
> >>>>>>>> +
> >>>>>>>>             /* Calculate how many clk_hw_onecell_data entries to=
 allocate */
> >>>>>>>>             num_clks =3D mcd->num_clks + mcd->num_composite_clks=
;
> >>>>>>>>             num_clks +=3D mcd->num_fixed_clks + mcd->num_factor_=
clks;
> >>>>>>>> @@ -574,6 +587,9 @@ static int __mtk_clk_simple_probe(struct pla=
tform_device *pdev,
> >>>>>>>>                             goto unregister_clks;
> >>>>>>>>             }
> >>>>>>>>
> >>>>>>>> +       if (mcd->need_runtime_pm)
> >>>>>>>> +               pm_runtime_put(&pdev->dev);
> >>>>>>>> +
> >>>>>>>>             return r;
> >>>>>>>>
> >>>>>>>>      unregister_clks:
> >>>>>>>> @@ -604,6 +620,9 @@ static int __mtk_clk_simple_probe(struct pla=
tform_device *pdev,
> >>>>>>>>      free_base:
> >>>>>>>>             if (mcd->shared_io && base)
> >>>>>>>>                     iounmap(base);
> >>>>>>>> +
> >>>>>>>> +       if (mcd->need_runtime_pm)
> >>>>>>>> +               pm_runtime_put(&pdev->dev);
> >>>>>>>>             return r;
> >>>>>>>>      }
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediat=
ek/clk-mtk.h
> >>>>>>>> index 22096501a60a..c17fe1c2d732 100644
> >>>>>>>> --- a/drivers/clk/mediatek/clk-mtk.h
> >>>>>>>> +++ b/drivers/clk/mediatek/clk-mtk.h
> >>>>>>>> @@ -237,6 +237,8 @@ struct mtk_clk_desc {
> >>>>>>>>
> >>>>>>>>             int (*clk_notifier_func)(struct device *dev, struct =
clk *clk);
> >>>>>>>>             unsigned int mfg_clk_idx;
> >>>>>>>> +
> >>>>>>>> +       bool need_runtime_pm;
> >>>>>>>>      };
> >>>>>>>>
> >>>>>>>>      int mtk_clk_pdev_probe(struct platform_device *pdev);
> >>>>>>>> --
> >>>>>>>> 2.43.0.472.g3155946c3a-goog
> >>>>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>
> >>>>
> >>>>
> >>
>
>
>

