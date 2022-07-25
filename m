Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F50C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ceuq/AzPg/qUxtBubik4O9aoJrDB6xjdeG8Gtrb2V5w=; b=HeCW6QdcFUSsU21U1yEYAmU/fm
	1q6Nn3d13itgFewABJbPTk7t3fOPkOzPWpXDY69yvrxfkdsBTB3NOMBb5Hvs7eH+qrTENPutW+rkZ
	6Ju8Efn5x9uK+ybV5nPCXqntyybxo53kQpIweYFCJERUFNwMwG3PZl745m4d4zRNY/Scr3FQuVtNf
	Qry6rLaTrf4OV+HUPZzx6G/8c/oSu+Pju4K/W7g5hOa/sP+EO58wBA4xDexElbFPAnnT8WKEKZX02
	PEkMerZywiZ+NPHnGnABjT6F1fozs0HESfHlxD5j92Tty2E5K5J65mSbeJJXEgJyApaw54DDHv4iv
	WsgGQfVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtQO-006piB-KJ; Mon, 25 Jul 2022 08:26:48 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtPa-006p0m-Su
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 08:26:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id b6so6300399wmq.5
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 01:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ceuq/AzPg/qUxtBubik4O9aoJrDB6xjdeG8Gtrb2V5w=;
        b=koHSa2/e68gxUBwHaKIv/T+VgRXYhm6nTGulLOakkCCOE3DfSjy/jKicIZSwZly4Gl
         wE35M0cF7FAo++9H0jaYmoQgMsVsJbpfBtGzPXR+V8ILT17HJZRMh8TG7RLMy0F6dbSy
         ydTLi3g65CfN762l5ImSuNY9WBmK9GT0028MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ceuq/AzPg/qUxtBubik4O9aoJrDB6xjdeG8Gtrb2V5w=;
        b=nswzpzRQVkMOYkTjD4B2ZmIFugb5E0uBhcquVsDdIqXMlDI6YTN60oiIv1reVq+hKe
         +jhFH8iaI5xPSmbXS0TwMDvEruxK5ErDH8hTBnXZCStWSlSicsRF+lyoGrTroFwVTZyL
         7vFGA3fnELYXPfRw3uk+KxGZCwPOhcAptbGXWFXpnMfiU9bytw7WrMi2BtjDuJempI4D
         4M8HLJTKB7rZ/4zVmD/tolmVUJZPH0BuR9MwqHdi1iRfj7DdYifa7C6kCDJuB2bg9vOz
         UjNFd7DEXROv3IKzgkLKKDFlgw4rtHSBAQavHeIBuCE8wS2+7dyS3ATjUqS8W4vvVf1v
         kN/w==
X-Gm-Message-State: AJIora9cdJM5qdiJKlQCe7jWaR9EkDBbgDjY/o1xYX635ezxJQML5gZn
	vo73CLybirNeRdeLwcogvHF8Qtwk642SMMX+eiyZig==
X-Google-Smtp-Source: AGRyM1ubRVgEsXGa9zbOVrrkfxXmODf9Q0J/xrQzonmleWJncuypb6dFrCLUbX8RhQT5mxmU4ko0X/lK5cO8MAvSCrA=
X-Received: by 2002:a1c:4c0d:0:b0:3a2:fc6e:f8c7 with SMTP id
 z13-20020a1c4c0d000000b003a2fc6ef8c7mr7506641wmf.102.1658737555523; Mon, 25
 Jul 2022 01:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220621091854.1904372-1-treapking@chromium.org>
 <de6412d4-732c-79cf-ac00-e0fccee44270@gmail.com> <CAEXTbpf=w6qB1X3dYSR=kdJgqNAFW-pRYuiOGuv9WWEtuY47Cw@mail.gmail.com>
In-Reply-To: <CAEXTbpf=w6qB1X3dYSR=kdJgqNAFW-pRYuiOGuv9WWEtuY47Cw@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 25 Jul 2022 16:25:44 +0800
Message-ID: <CAEXTbpdxj3Yd3dbyAd0Yc+8adCtK1bi=UXt+j7Fbtx6q8xd0RQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: mt8173: Fix elm panel DT node
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_012559_022848_11CD6336 
X-CRM114-Status: GOOD (  28.06  )
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

Hi Matthias.

Gentle ping on this thread. Any feedback or suggestions?

Regards,
Pin-yen

On Mon, Jul 11, 2022 at 11:09 AM Pin-yen Lin <treapking@chromium.org> wrote:
>
> All we know is that the functions mentioned in the commit message were
> working in 4.19 kernel, but not in the latest kernel tree.
>
> Unfortunately, we don't know which patch breaks the driver.
>
> Best regards,
> Pin-yen
>
> On Thu, Jul 7, 2022 at 10:50 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >
> >
> >
> > On 21/06/2022 11:18, Pin-Yen Lin wrote:
> > > Move the panel DT node under `aux-bus` node, so it won't use the buggy
> > > `ps8640_bridge_get_edid` to get the display modes. Also, change the
> > > compatible string from "lg,lp120up1" to "edp-panel", so the panel-edp
> > > driver gets the displays modes from the EDID instead of using the
> > > predefined display mode (`lg_lp129qe_mode`) in the driver, which is
> > > actually not working.
> > >
> >
> > Do we need a fixes tag here? I'm not quite sure if we fix an upstream bug here,
> > to be honest.
> >
> > Regards,
> > Matthias
> >
> > > Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> > > ---
> > >
> > > Changes in v3:
> > > - Include more details in the commit message.
> > >
> > > Changes in v2:
> > > - Remove the Fixes tag because this change is not compatible with the
> > >    old kernel versions.
> > >
> > >   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 +++++++++++---------
> > >   1 file changed, 14 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > > index 9c75fbb31f98..1e0802a6f6d2 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > > @@ -90,18 +90,6 @@ volume_up {
> > >               };
> > >       };
> > >
> > > -     panel: panel {
> > > -             compatible = "lg,lp120up1";
> > > -             power-supply = <&panel_fixed_3v3>;
> > > -             backlight = <&backlight>;
> > > -
> > > -             port {
> > > -                     panel_in: endpoint {
> > > -                             remote-endpoint = <&ps8640_out>;
> > > -                     };
> > > -             };
> > > -     };
> > > -
> > >       panel_fixed_3v3: regulator1 {
> > >               compatible = "regulator-fixed";
> > >               regulator-name = "PANEL_3V3";
> > > @@ -282,6 +270,20 @@ ps8640_out: endpoint {
> > >                               };
> > >                       };
> > >               };
> > > +
> > > +             aux-bus {
> > > +                     panel {
> > > +                             compatible = "edp-panel";
> > > +                             power-supply = <&panel_fixed_3v3>;
> > > +                             backlight = <&backlight>;
> > > +
> > > +                             port {
> > > +                                     panel_in: endpoint {
> > > +                                             remote-endpoint = <&ps8640_out>;
> > > +                                     };
> > > +                             };
> > > +                     };
> > > +             };
> > >       };
> > >   };
> > >

