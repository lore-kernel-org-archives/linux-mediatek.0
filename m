Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB0EC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 03:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/RnWDHakvB3xqyl8HlC7PmuXWjiVUyJfu/0aj+YTdo=; b=43aQ6b8TP4VCffIuclhcTpyVPC
	u5q1FDWtKvJEAN1wgni9QaVRmGkgcASW0CTFQgb6XM3zPYOYmdkDr8Be0ScCePV9HBqHNhzCznBIs
	o3QpRI+cXApQqkLiOHFbTDNipWmcwlFOWE+fXEc6F+laXUtlcDlAM9JWwKr5huzRpEVVz5yEzj93L
	poPFVry7wG2dClijYsPD+x87xjvt4/JASOHSaeWyaLMXaSIhkj3XBdOsGBsOLZgpxubJKyansiuW8
	dtPN10JZl7+LSjIgJWBnURXKM8D4e4sasDP2SOLM7Zqtui4uaqKetMzhBuxL+xnnl20uNNKC8ZhBZ
	qrRU8+sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oip0t-00ATIj-Ns; Thu, 13 Oct 2022 03:36:03 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oip0j-00ATHK-Rv
	for linux-mediatek@lists.infradead.org; Thu, 13 Oct 2022 03:35:55 +0000
Received: by mail-ed1-x52f.google.com with SMTP id m15so858529edb.13
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Oct 2022 20:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e/RnWDHakvB3xqyl8HlC7PmuXWjiVUyJfu/0aj+YTdo=;
        b=aGBoVakhLLIHUk8QdHR4T57YVtaIBGYYB3kdNqKVJ3NCk1ZufQbWtDd9840Nm4KnhB
         BGnqR0QsDGr3nGgJZ8Ph68uTcpBtfQ3a3pApKGfn4/mzYzJB6fyYtx47fppOq+cINLpA
         l7BRUmKDNgjm3wqgCRXsmbhNnkfgVDTufbcp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/RnWDHakvB3xqyl8HlC7PmuXWjiVUyJfu/0aj+YTdo=;
        b=nrtWsZIwCcFbVuTf9rgR7uMM6wyEGixqc2d57ePGaEDp7v6nbYkk/WZk+4By163ERm
         05qP7cD9Vs1C6qQWHQwu50GeQFkQPwVMuOHlMK3MnFZhxkCTNmHnJYGbMgMqOn6VRcNA
         mmtOfXR9gDZ80uub30kpCbeivWJZrQ3AxpdycgT9m4eTTkxIjZbUtlnbETDXakeyKs3C
         KBgnf3eRhkXhUiFhDPEeh/n25UlGBWAIjdqy6BJ5rDIfpnRo0X1EBuuttrrswYSZBGaS
         JnDoMyoAhW0xZvFV/DUB0PTOtwRBQax1Cdcy/9aMjRZXmw76dERJkqVwAzwh7SwVjhae
         yv/Q==
X-Gm-Message-State: ACrzQf0Aq2yTOsyfzGRXys4hdhqtXotC77lNlrJ8/8lkzfhyiR2xLqTj
	Ct+tGCAtdy0b35agYT1PrLOCKFXk5k3bU9CcCU8q8g==
X-Google-Smtp-Source: AMsMyM5vH6zf1A6cPcPxyCBpJslErrSoPJQuSdL3BNZHZ2RrgtwxqgI5k8R3y5zXlRd+rqDyNqGwET0nhN21GDKrGYw=
X-Received: by 2002:a05:6402:1604:b0:458:b2b7:bd5a with SMTP id
 f4-20020a056402160400b00458b2b7bd5amr29067970edv.73.1665632149352; Wed, 12
 Oct 2022 20:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220621091854.1904372-1-treapking@chromium.org>
 <de6412d4-732c-79cf-ac00-e0fccee44270@gmail.com> <CAEXTbpf=w6qB1X3dYSR=kdJgqNAFW-pRYuiOGuv9WWEtuY47Cw@mail.gmail.com>
 <CAEXTbpdxj3Yd3dbyAd0Yc+8adCtK1bi=UXt+j7Fbtx6q8xd0RQ@mail.gmail.com>
In-Reply-To: <CAEXTbpdxj3Yd3dbyAd0Yc+8adCtK1bi=UXt+j7Fbtx6q8xd0RQ@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 13 Oct 2022 11:35:38 +0800
Message-ID: <CAEXTbpchG0=ofGnzT=nTud24apND1qN6dabBN3z=CVw0oSb2_A@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: mt8173: Fix elm panel DT node
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_203553_908416_EC15FDCA 
X-CRM114-Status: GOOD (  29.16  )
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

Friendly ping again on this thread.

On Mon, Jul 25, 2022 at 4:25 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
> Hi Matthias.
>
> Gentle ping on this thread. Any feedback or suggestions?
>
> Regards,
> Pin-yen
>
> On Mon, Jul 11, 2022 at 11:09 AM Pin-yen Lin <treapking@chromium.org> wrote:
> >
> > All we know is that the functions mentioned in the commit message were
> > working in 4.19 kernel, but not in the latest kernel tree.
> >
> > Unfortunately, we don't know which patch breaks the driver.
> >
> > Best regards,
> > Pin-yen
> >
> > On Thu, Jul 7, 2022 at 10:50 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> > >
> > >
> > >
> > > On 21/06/2022 11:18, Pin-Yen Lin wrote:
> > > > Move the panel DT node under `aux-bus` node, so it won't use the buggy
> > > > `ps8640_bridge_get_edid` to get the display modes. Also, change the
> > > > compatible string from "lg,lp120up1" to "edp-panel", so the panel-edp
> > > > driver gets the displays modes from the EDID instead of using the
> > > > predefined display mode (`lg_lp129qe_mode`) in the driver, which is
> > > > actually not working.
> > > >
> > >
> > > Do we need a fixes tag here? I'm not quite sure if we fix an upstream bug here,
> > > to be honest.
> > >
> > > Regards,
> > > Matthias
> > >
> > > > Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> > > > ---
> > > >
> > > > Changes in v3:
> > > > - Include more details in the commit message.
> > > >
> > > > Changes in v2:
> > > > - Remove the Fixes tag because this change is not compatible with the
> > > >    old kernel versions.
> > > >
> > > >   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 +++++++++++---------
> > > >   1 file changed, 14 insertions(+), 12 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > > > index 9c75fbb31f98..1e0802a6f6d2 100644
> > > > --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > > > +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > > > @@ -90,18 +90,6 @@ volume_up {
> > > >               };
> > > >       };
> > > >
> > > > -     panel: panel {
> > > > -             compatible = "lg,lp120up1";
> > > > -             power-supply = <&panel_fixed_3v3>;
> > > > -             backlight = <&backlight>;
> > > > -
> > > > -             port {
> > > > -                     panel_in: endpoint {
> > > > -                             remote-endpoint = <&ps8640_out>;
> > > > -                     };
> > > > -             };
> > > > -     };
> > > > -
> > > >       panel_fixed_3v3: regulator1 {
> > > >               compatible = "regulator-fixed";
> > > >               regulator-name = "PANEL_3V3";
> > > > @@ -282,6 +270,20 @@ ps8640_out: endpoint {
> > > >                               };
> > > >                       };
> > > >               };
> > > > +
> > > > +             aux-bus {
> > > > +                     panel {
> > > > +                             compatible = "edp-panel";
> > > > +                             power-supply = <&panel_fixed_3v3>;
> > > > +                             backlight = <&backlight>;
> > > > +
> > > > +                             port {
> > > > +                                     panel_in: endpoint {
> > > > +                                             remote-endpoint = <&ps8640_out>;
> > > > +                                     };
> > > > +                             };
> > > > +                     };
> > > > +             };
> > > >       };
> > > >   };
> > > >

