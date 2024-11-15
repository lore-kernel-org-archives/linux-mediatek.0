Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207A2D6DDD5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Nov 2024 05:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FCEL5cvn/DmJs+eCH4aavMuPmImiCDAr4Q8vsptoYs=; b=r3ePnf9HOn2nlPprDS73YnrwMf
	ENGVGewls2CsDINVl0jaml9hTPXG8VRq4EFjs+2ryUFeCIStdwWcRTnGtFS0dfL8n1H8P/IvgyrGw
	JWwZr92IrANS3eBhtigjj/NMx6yQBZ5mc40rt+qMY2vzNpPWIeFVONzun4T+F6Sp2CQSs2ZDox5Ox
	lCLnWmDNK1UA2Xwi3MIoReWeLKbdmGzB7ONLhSNRIoVkXd6XgG4OhtWm148MEG6a5vhxCDg+pdOkA
	vBawph1eav2skLlxkINeXkfEaVOac8ovkKwnczRtftfg9dBRI2U31LXtbZzhUX3NKGLaIBlQ7F5Cf
	jRB/yo5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBpLN-00000001j62-1NPy;
	Fri, 15 Nov 2024 05:58:09 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBpLL-00000001j4W-0OIu
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Nov 2024 05:58:08 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-288fec398f8so184604fac.3
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Nov 2024 21:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731650286; x=1732255086; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FCEL5cvn/DmJs+eCH4aavMuPmImiCDAr4Q8vsptoYs=;
        b=g5zxSRCdQIyGNmw1V7/bcpA50+out18XP7C/b8944WwyNJH2tRbQ+L4r5zgIVAw4br
         OCsle4eQXj28g+4Ai77Wur2jLng0CvIkFBueD97mPXUKF/14vz2bgLv2gUOxDsolaLwc
         9pXVftrE/E9StPTdg1tjN/sGB7VpYJenTKGJKr/tjyyS3Nb/oZfNlzfuyqwpnkEoGwu5
         EMpVTxnTCJun3ThuXAFDRw8UHAO+TvCDAHHTlCKg6cg3QfqO2cAIJyfNPQ750nlgV/lQ
         F4T5PCagpjLOG/qtnyQaZv8cvb4uZGEVGe4G+Q4osY8iVwr2waKTJ60sy4MRChU40mlq
         om0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731650286; x=1732255086;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FCEL5cvn/DmJs+eCH4aavMuPmImiCDAr4Q8vsptoYs=;
        b=kgbhB8LQ+V66cnMBaa34WTGDbmUYffDxZBJUbtOqP42mVqkw7/+2ENK6IBq3H8+eyw
         LQ9drDhXSJCdszm/8TvK8gWn6FYfBIxhca0YQtcswvjanJrUznPGdZyzIcDDOtbk0Q2/
         fj8idwNE0+zmFq4bAekNf2UF+K2rfy2WWb7oN3yGi4Y8OqnLmcYnM2PQQvZmoTFaRpzD
         QGi5rhzWvwNfd+34RpDw3rbrGkARsaDL8EfhS6FXMwLaOU+pxoQEv/5U60PK7X9oW+bE
         4UwsErn9y0LGTPzvMtUJ5TxhciLrPPaGhjQFuRu4sTD66YKp0U7BIf1/Drn6LPWRvj/g
         8QQw==
X-Forwarded-Encrypted: i=1; AJvYcCV5hlFhyf+d61k2qYfrqMJDxHcMPoGAnmkdLpHkOV5khvsONnSosFMJouIfZ8LYB8wrlnggZBLW/l8xp4r7VA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBNDDLGkHCKl/x+iGWuXbQ3RBneo2yuQjCZtnNw01r3idqzICU
	cqRNDHPcZQkFdBQeYem5dHvdnOO9dglcY/ToY4xIz5c4Q/e0Kz0ggLHbAtqJ/tPdfE1I2HBEapb
	h3Fes3yPSliule3mr2aWzFNdoH1lj5zpCc6Fa3g==
X-Google-Smtp-Source: AGHT+IH08LKZaT/MNLlQJFmAnCHMH+5h4dFmcwDILxNxHwbbhWEamUPv8K0yf2DWpwhOv7gBw7hRU0rNhv2SZ1Q9U8g=
X-Received: by 2002:a05:6871:aa01:b0:260:ccfd:1efe with SMTP id
 586e51a60fabf-2962dd0882fmr263152fac.6.1731650284569; Thu, 14 Nov 2024
 21:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20241021072626.15102-5-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20241021072626.15102-5-xiazhengqiao@huaqin.corp-partner.google.com>
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Date: Fri, 15 Nov 2024 13:57:53 +0800
Message-ID: <CADYyEwSjV=YQ2dJ7+RwQFif7WHU7PCDPxbh4OwuBNULsoQ7bkQ@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 4/4] arm64: dts: mediatek: Modify audio codec
 name for pmic
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	wenst@chromium.org, hsinyi@chromium.org, sean.wang@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.or, 
	Doug Anderson <dianders@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_215807_129177_C9AFA543 
X-CRM114-Status: GOOD (  11.97  )
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

Hi

No one has responded to this patch for two weeks. Please help to review it.

thanks

Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
=E4=BA=8E2024=E5=B9=B410=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=80 15:27=E5=86=
=99=E9=81=93=EF=BC=9A
>
> change `codec` in pmic (in mt8186-corsola.dtsi) to `audio-codec`
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> ---
>  arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8186-corsola.dtsi
> index 943837f20377..13e464dac1be 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> @@ -1276,7 +1276,7 @@
>                 interrupts-extended =3D <&pio 201 IRQ_TYPE_LEVEL_HIGH>;
>                 #interrupt-cells =3D <2>;
>
> -               mt6366codec: codec {
> +               mt6366codec: audio-codec {
>                         compatible =3D "mediatek,mt6366-sound", "mediatek=
,mt6358-sound";
>                         Avdd-supply =3D <&mt6366_vaud28_reg>;
>                         mediatek,dmic-mode =3D <1>; /* one-wire */
> --
> 2.17.1
>

