Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05C5C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 14:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83FZWiL0crF525APjinz8Kw//Gs5G6caFf4d0M9B9Ak=; b=Ot58hBHsphZDoJFwwxfJB9Cify
	2/9N00QGf0J1U7BeF0TbHAy1pDTPL0vp5gT6Q8rsyA2V28atXribFyQBveu3mzzdx8adtIeXZIgXM
	v0JtCXPIIk/29HuTUoI44RRt256TUqwNbGILgKBRxFUUe0aN9lbSQQJ4WitDWVZxngH+AWbvPvDad
	TI+L6pi9wKGHnF/QRoOHFJgX1cbJ3tEaTCdHwuMtyc9pmxyiWSBD00zyhknK4Jcdoepkn5ORorU+v
	DB/0Rh9ssXqNZQ2cTmdcnxT/Ic65bs3+40ZwnHl+XZmfveMiR2ZoQTv7G4cL/mUlsOaAVyoHcqc9G
	lrAwTqLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2CvA-007zFM-Fu; Fri, 17 Jun 2022 14:26:00 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Cv2-007z74-TN
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 14:25:54 +0000
Received: by mail-ej1-x631.google.com with SMTP id g25so9080320ejh.9
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=83FZWiL0crF525APjinz8Kw//Gs5G6caFf4d0M9B9Ak=;
        b=GHJIHuMigTU+g9hI8iabwpQIuDSL7XyuMpSYvmlYhgfC1CIFWEIm1BQ+hSd4bjDOG5
         Rskzt+EOb8aIo94mQFzPQAjullV8lRQ1JR2nEa9GsHHd/BrpeGa8jCWJ9d2l0VXwLBgm
         ZSXjCJoEKsrynHrhheJbBED0jjesuT6+bcpTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=83FZWiL0crF525APjinz8Kw//Gs5G6caFf4d0M9B9Ak=;
        b=s7Z1VN12Qe/Fl6soIvmeA97V63fQPGwNnapsf8oKL5fs5bWA1sp8qedEcqK+UIBpPO
         wUnD6DI+8ITuOvupWz4dFYbh2ft27R7aGAijp2QMbrfOthLmy7qdXei9betsk6xyP7v5
         aAqwnk5RB3EKrcFRBYT7JIWyM2lhK/5S00Y70/wodYu4/aACruARj8/gCwotB1UYCY8o
         vN+iJsBMxitXF3d8O5XT/Il3XTq+tYesnrt/pHzrhLXcWO5VL1QIfzcX0IbXtkieWFH0
         VW1GrtX/RlHhTv/Zn+BYGDe9wQQ2PsKPSWwZP1+03cFWQzLlwnmiyHizs/PzZ1dPrGOL
         1Wsw==
X-Gm-Message-State: AJIora9YR+Q4zrZwDuhKjKM9ihfU2IIXkhYCvE0RtTVtofFWPFQ3ckj5
	pE76exqJFwe1YWiLLePl5nuO62PLyV8iu/h/33QWPg==
X-Google-Smtp-Source: AGRyM1sHQWP15zLPj2yCwvO447y117lYiVJu4mAWBp6EFASZb6mVwG/jc+KGYlyL13Wi6k2yq/6HTYn7xjYL2VjVjco=
X-Received: by 2002:a17:906:ced1:b0:710:f654:87ef with SMTP id
 si17-20020a170906ced100b00710f65487efmr9824783ejb.194.1655475937079; Fri, 17
 Jun 2022 07:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220530113033.124072-1-hsinyi@chromium.org> <20220530113033.124072-2-hsinyi@chromium.org>
 <CAJMQK-jw+sgunEwgEQAw-V8DAbybZ7WVnZJ6vwOdzQ+-SX_bQg@mail.gmail.com> <c3286fc9-06ed-d1e1-a731-94cdefdf7fab@gmail.com>
In-Reply-To: <c3286fc9-06ed-d1e1-a731-94cdefdf7fab@gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 17 Jun 2022 22:25:11 +0800
Message-ID: <CAJMQK-gJ4AoNQtLeKoOO=GLLtjDRhCdVnYuPJSBD4ZnFWJ5qrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mt8183: Add panel rotation
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, Rob Clark <robdclark@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_072552_988647_B04AC0E7 
X-CRM114-Status: GOOD (  22.14  )
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

On Fri, Jun 17, 2022 at 10:10 PM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
> Hi Hsin-Yi Wang,
>
> On 06/06/2022 17:29, Hsin-Yi Wang wrote:
> > On Mon, May 30, 2022 at 7:30 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >>
> >> krane, kakadu, and kodama boards have a default panel rotation.
> >>
> >> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> >> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> ---
> >
> > Hi Matthias,
> >
> > The series ("Add a panel API to return panel orientation") might land
> > in drm-misc. With this series applied, we can add this patch to give
> > the correct default orientation for mt8183 kukui devices.
> > I didn't send this patch again with the series, since they might land
> > in different trees.
> >
>
> I had a look on Linux next (next-20220617) and wasn't able to find the mtk_dsi.c
> changes. What is the status of this?
>
The mtk_dsi change got dropped. The latest is this series:
https://lore.kernel.org/lkml/20220609072722.3488207-1-hsinyi@chromium.org/,
still waiting to be picked or others' comments.

If the dts patch is picked without the drm series, there will be a
WARN, but won't affect boot or display up.


> Regards,
> Matthias
>
> > Thanks.
> >
> >>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> >> index 8d5bf73a9099..f0dd5a06629d 100644
> >> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> >> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> >> @@ -276,6 +276,7 @@ panel: panel@0 {
> >>                  avee-supply = <&ppvarp_lcd>;
> >>                  pp1800-supply = <&pp1800_lcd>;
> >>                  backlight = <&backlight_lcd0>;
> >> +               rotation = <270>;
> >>                  port {
> >>                          panel_in: endpoint {
> >>                                  remote-endpoint = <&dsi_out>;
> >> --
> >> 2.36.1.124.g0e6072fb45-goog
> >>

