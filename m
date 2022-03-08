Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC23C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 03:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOyIp2mA8p+HLK3OOuNr1dAJgkgKEgz1ErJt0m8jSDo=; b=NDjEC6pO52ibiy
	GaqKMPmqUlHUi4F/sQgvBebfnCFd0LFUxb7sDy/JX+cS1BGq7CN/FchxtoMIuZvdTHFWl5ZTE2VBk
	jFbjA6+sXZVpBx7fwl5Ke0Qkofx8HvaKYJAa5V+GDOpS/ufz6FOMQ60rfbIT/DTpSyCkJY3Tf3/SF
	y/mq4mrDcfbgY3NXxfr0PJPtlBehTh1pxXHc0os5aCeBFtjz+GEyAN5xgk5DdBQ5DUUVh482Ml7uz
	Nz0KjRJhHMgX9qH8XfFXHFRv1l2YPLPlwxxcbGMRWcicd5PAH15Ez8DEhMNKQc8T2QjbJuRv9tdS3
	O/zQ7Ocl/aWK4A+C4mnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRQpf-002ZCK-DR; Tue, 08 Mar 2022 03:48:19 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRQpT-002Z9Z-F5
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 03:48:08 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id u10so15375288ybd.9
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 19:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SB1pR6R36cG/5vqUJ9L1OYX7dRask2g/0weyNuOkOYQ=;
 b=Aqt++puDVTDcltryRW77a9cwhFd1XciMKNs9AsjManml5e4eEQPtDOB/5nEXjsn+P9
 GkEs/gI5+4vK3gNMFYbQocu8XMlxE9wCZPPoS8OfoPNDIE6avBWb/hU6LMu1/Cf2whCu
 FFb8lEOczvnEeE5kzWcvCMw/ecWn+5SZxlX2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SB1pR6R36cG/5vqUJ9L1OYX7dRask2g/0weyNuOkOYQ=;
 b=Hg9a3jsPBrqPf+0ObKCyukMqIwQl19rZri9GJxuXhp5qTgz4Lpp1srVScsNYl5WG7B
 hnGuMtEmSGh6ndUYji0l+rY6bozlhXeIH3x+Ipj8nErVAhv1PZZCAtwGg8v3LqEmv7u7
 h5ZXUlKNbRhmCNRbFNExMXJ1eFXkdPEY/Qpeb9U4PTdTVW0KugATRq6s/24gd2ws3A67
 NrAvzGUk4Teah7sCo4YZ5E+k3wKrBeFG+fEv4NhSq097XyEfORnhSlWhyR4JwrMllhvZ
 YNYb8oGIQ0/6/F4vkacjPxSpUSzOWGjtbF8YkKFm0ZvbcNiUEZ8U/Q3NJTFf27HL+PHN
 iy4w==
X-Gm-Message-State: AOAM532S+5OLfAhZ9ji2VjKZ4fQCfY/BrbEye0hBltlzhJ2MrnoQwDJD
 dh+ybHnAmTP7v+gHUQKZ9oKQn4delNjis9Gwsr1dfQ==
X-Google-Smtp-Source: ABdhPJyuGeWIUlb3utDkOR1PhipoTjIrNi/Cf0gmscf2NmU/0KOasS7EzcBrtPdNSmwisXmV8F84klzvCTpKGd/lH2w=
X-Received: by 2002:a25:d449:0:b0:628:945d:713c with SMTP id
 m70-20020a25d449000000b00628945d713cmr11205541ybf.164.1646711284731; Mon, 07
 Mar 2022 19:48:04 -0800 (PST)
MIME-Version: 1.0
References: <20220307154558.2505734-1-robert.foss@linaro.org>
 <20220307154558.2505734-3-robert.foss@linaro.org>
 <CAG3jFytGV3NNfkEPqx_rZX9O9aZjTjzo2tpeSK8mFimOrYt9zw@mail.gmail.com>
In-Reply-To: <CAG3jFytGV3NNfkEPqx_rZX9O9aZjTjzo2tpeSK8mFimOrYt9zw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Mar 2022 11:47:53 +0800
Message-ID: <CAGXv+5H7RvczEeAyLEmJ-RNAwqV1G71FhsG3Kpi0r+qPkXVaeQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] Revert "arm64: dts: mt8183: jacuzzi: Fix bus
 properties in anx's DSI endpoint"
To: Robert Foss <robert.foss@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>
Cc: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, 
 matthias.bgg@gmail.com, xji@analogixsemi.com, hsinyi@chromium.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_194807_545777_CB55D621 
X-CRM114-Status: GOOD (  14.65  )
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

On Tue, Mar 8, 2022 at 12:20 AM Robert Foss <robert.foss@linaro.org> wrote:
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

I think we need to send this directly to the soc maintainers to get it
picked up before the final 5.17 release?

>
> On Mon, 7 Mar 2022 at 16:46, Robert Foss <robert.foss@linaro.org> wrote:
> >
> > This reverts commit 32568ae37596b529628ac09b875f4874e614f63f.
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> > index e8f133dc96b95..8f7bf33f607da 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> > @@ -171,8 +171,6 @@ port@0 {
> >
> >                         anx7625_in: endpoint {
> >                                 remote-endpoint = <&dsi_out>;
> > -                               bus-type = <5>;
> > -                               data-lanes = <0 1 2 3>;
> >                         };
> >                 };
> >
> > --
> > 2.32.0
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
