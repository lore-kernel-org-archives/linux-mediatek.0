Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1288CC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 08:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2u5OrUHUpOMO5fEyAlLsIDOLs93NcMBXwRg6aSJD9DA=; b=JrTTqc8yntSda2XsituUe9brbY
	1gE+MFwZQZh1mT5a2idRAWkaBvJHEsRKgSGvRE9uE5uAaqnPWOwROq5Tm11rguei4qDdXRsJF8O78
	Tyopt7S0TfbETM0ebMuqVtvOLqMGjkqEtIOcccThpC49WIz6NtaV6TrNj32TcWekfj6NvV9MCOHTJ
	gewUDfZfD8kIaQPzw9U8065Z/tmjWMg+IbTpr+tNWeL9+OIvUGw8USoNUKw+UA5IGSWWuLBqP5PqT
	UKhi7AHhbUkwF5uf221UQvGinR/rJBV4I/kVCOOj2I4EOcHqLF5mDxxNAvjDYHRRO3348wRemyQ2W
	QQqK3kZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLWH-003N9Q-LA; Fri, 29 Jul 2022 08:38:53 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLKc-003E5k-M8
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 08:26:53 +0000
Received: by mail-wr1-x433.google.com with SMTP id b26so5128540wrc.2
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Jul 2022 01:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2u5OrUHUpOMO5fEyAlLsIDOLs93NcMBXwRg6aSJD9DA=;
        b=IRfHBuNRCPf3dfAa/Oe7k94E+8lxZitlK7DOyEhPW7X/zOUQk6SxKaid/iofF3vADw
         NtfIUq06xahkXxOKmIY2MXoaEeNzbBDh2fZ551x/yKuxVezuHgrj5KEgbXK5aOyzZx5g
         t48eXZsjmqkNVR8sRdkKD5Yj9Q6KE863bfutg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2u5OrUHUpOMO5fEyAlLsIDOLs93NcMBXwRg6aSJD9DA=;
        b=GXwqTGkVL/GBTsbetVwcWZKJRQT9bZCuBshOuTfAVtYXYWj2yIIINvW1vCuiKOaEdk
         kfGBw0lYysB0bNMjPeCGKU6pccscc5GFeRR4/wL80ME5GbaxtbrD/G+R/Dy0BhPNRRac
         QdVMF407hrA++TAvlK6XZilu9a9L1OWLuef3eS3hEE0BDjQtAeToAcaPj+iLDF1kRrcO
         XQThNsLWfEMRG1lHRbmO6H+DrARbL3K39QmeX1j9VRHFt8r3JLh2EWO+b0nyApWabHWt
         bf8GN9AmUMgTmi70K5t/GHpYf/h08Ig5rkGG2Q8ootnS6h3qmYd4l3HFYXQz42qGVPS8
         J8Nw==
X-Gm-Message-State: ACgBeo2dvfMl4bKNoMZ1flxtNK3nawaH3LACvPS9kR1qdNTdFASTA/ve
	8Aw2x7LGD+fcAZIGbAfuHUC7Y7JGxj8Wi/6k372OvA==
X-Google-Smtp-Source: AA6agR5FXdxHYMSCOAf3XvPso/HOt+pVRXDTIBRgpFGW9U0fv50u3omwYjhK7izsNPIcvrt0bqrPsE1OPlpLIy8gEnk=
X-Received: by 2002:a5d:4d0b:0:b0:21e:c456:e565 with SMTP id
 z11-20020a5d4d0b000000b0021ec456e565mr1582022wrt.3.1659083206728; Fri, 29 Jul
 2022 01:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220729032423.157144-1-treapking@chromium.org> <2719519a-4690-4cc8-42c3-f6089d888cce@collabora.com>
In-Reply-To: <2719519a-4690-4cc8-42c3-f6089d888cce@collabora.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 29 Jul 2022 16:26:35 +0800
Message-ID: <CAEXTbpfRWX_RfR6DU31NweLrGTOZTi_hCs-515xaW6x_McnJ5Q@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: mt8173-elm: Switch to SMC watchdog
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Evan Benn <evanbenn@chromium.org>, 
	Eizan Miyamoto <eizan@chromium.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_012650_779170_4E460812 
X-CRM114-Status: GOOD (  20.72  )
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

On Fri, Jul 29, 2022 at 4:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/07/22 05:24, Pin-yen Lin ha scritto:
> > Switch to SMC watchdog because we need direct control of HW watchdog
> > registers from kernel. The corresponding firmware was uploaded in
> > https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > ---
> >
> > Changes in v4:
> > - Rename the watchdog node (smc_watchdog -> watchdog)
> > - Correct the patch summary (mt8173-oak -> mt8173-elm)
> >
> > Changes in v3:
> > - Remove /delete-node/ and create a new node for SMC watchdog.
> >
> > Changes in v2:
> > - Move the modifications to mt8173-elm.dtsi and add some comments.
> >
> >   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > index e21feb85d822..421bb2945135 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > @@ -161,6 +161,19 @@ hdmi_connector_in: endpoint {
> >                       };
> >               };
> >       };
> > +
> > +
>
> You don't need two blank lines, just one is enough (please fix).

This is already addressed in v5. Thanks for the review though.
>
> After which:
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> > +     watchdog {
> > +             compatible = "arm,smc-wdt";
> > +     };
> > +};
> > +
> > +/*
> > + * Disable the original MMIO watch dog and switch to the SMC watchdog, which
> > + * operates on the same MMIO.
> > + */
> > +&watchdog {
> > +     status = "disabled";
> >   };
> >
> >   &mfg_async {
> >
>
>

