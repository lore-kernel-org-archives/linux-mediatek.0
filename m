Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5D8C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYfJz5DR0sarRMEimOcvYMZLh47D2UkV2Jy+IyrrQOQ=; b=yV/ePv3TQ2zsqVhI5Q3N9iSRv5
	fMPmc0/hVsV+bou+HSxjU/XJp1Ao8A+Z+zJU0ZwYuhPDejqWNlLIXtoIFfO9Y6I27hegU10kVfaAe
	fUE7bYQ+WG5Ga97mFh5NUAw06qNGHftCuFItJ791LTKQJH4bexpmJymWj78Ruv+NqsswMdZpp5JLG
	sqBPOGSjp0CvWM8yt7XSbkZFwt3fNZ0khxAqK7tpQQ4c2iH5vmocu8z0ZSse4XxCZzus29Jm298SD
	xQDxdmq/BwQZOy3hF5qhhOuVCc/+tZbGio7WEURzbkVvUXTWNeQrlmgDKUJDJKZWgHudfeFrtNzFV
	y8XnrlBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklvN-00AHHO-1L;
	Fri, 07 Apr 2023 13:14:41 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklvJ-00AHEJ-2r
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 13:14:39 +0000
Received: by mail-yb1-xb30.google.com with SMTP id f188so30493827ybb.3
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 06:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680873276; x=1683465276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYfJz5DR0sarRMEimOcvYMZLh47D2UkV2Jy+IyrrQOQ=;
        b=afYShcwaWCRKxQfWVC6A3UR9s7WsYh/m45lh7dvhXtRB16e21H+vEI88O/1n9pP8I4
         2biUZIldSXj1UlxNMnKldwyioUX0rXkQ8q9t93u3HTfhmuy9m1zMO9pme+sLax1EPkCJ
         g/1HP/SlmfpmPCsMjbbIYuuW3UZB1iCBAeWDEqrR6I/5QiBmYqlRlH7m2o6blm935sP4
         +rh/mTZ6T2ieURwovpfl6ay3Qc5CDtgNGd/WsZSgg1EL1jWOuNz6qBxeci4IJwFs/KJh
         Z+XRLogC5gdLXNlFuAUkHjWFCucZxRZ8Xpc7swDcbtI3+U0rfFuyCzLFRwtClMgorn2r
         9Yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680873276; x=1683465276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYfJz5DR0sarRMEimOcvYMZLh47D2UkV2Jy+IyrrQOQ=;
        b=zRA2SwKcqlE6J59pf2Fafq1IAoaTdCVQ09u4Lcv2kbh6bGZ/3Lxj0/MiVSQ1oOm6aN
         NSp8Vtdy+dbqmQ3QkZWo5uF31/oFJxhu9peOSLOVGqSsqHZB04eRhV/s//+snnQZh0QA
         3ppt/750ESAFHbShwRLb+IWoDDiJqLRMBf8kOJLIerBGmURwbb9Frm/cax1Yp4kN/afC
         yPEIpYMKh1IZhIuDmg08QEw6G1JcvVpPHhx5eLm4JFADVH0s6l9c/v35LsLZieMu3ih1
         4s3zckNQ+GoqYHMGBTQaSF3YhP7y2NCoPENI7KYSh48KnQzAgpnkQ3ncbgbNZvke6vl3
         5amw==
X-Gm-Message-State: AAQBX9erXNaCVA7aBTFrGec2aCdRqi1vZ0uDoKPArZxBbENzcz3uD7An
	S2Xu193JMnYfDQVtlxGIOtIT2WoHWaDRTZ0Siw7pdw==
X-Google-Smtp-Source: AKy350bjb0HMJWJBzAnomlx9pGRYUzANSN19TtSNZ11GKBKtXGW/aXrzLpx8tgmRFVv06JMuSLYzMOruSpo5bx91W2o=
X-Received: by 2002:a25:d28b:0:b0:b6c:2224:8a77 with SMTP id
 j133-20020a25d28b000000b00b6c22248a77mr1788606ybg.1.1680873275845; Fri, 07
 Apr 2023 06:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com> <20230203-evk-board-support-v5-11-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-11-1883c1b405ad@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 7 Apr 2023 15:14:25 +0200
Message-ID: <CAFGrd9pu+t1K_4B-oCoRVq_rZfWZN=XWVARpTC5dS7HydZQFKg@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] arm64: dts: mediatek: add cpufreq support for mt8365-evk
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	catalin.marinas@arm.com, Will Deacon <will@kernel.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_061437_937585_54BA9CE3 
X-CRM114-Status: GOOD (  13.22  )
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

+ To: Catalin Marinas <catalin.marinas@arm.com>
+ To: Will Deacon <will@kernel.org>

Sorry for the noise.

Regards,
Alexandre

Le ven. 7 avr. 2023 =C3=A0 14:59, Alexandre Mergnat <amergnat@baylibre.com>=
 a =C3=A9crit :
>
> In order to have cpufreq support, this patch adds proc-supply and
> sram-supply for each CPU.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boo=
t/dts/mediatek/mt8365-evk.dts
> index 431078f8670e..d723838ed49b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -88,6 +88,26 @@ optee_reserved: optee@43200000 {
>         };
>  };
>
> +&cpu0 {
> +       proc-supply =3D <&mt6357_vproc_reg>;
> +       sram-supply =3D <&mt6357_vsram_proc_reg>;
> +};
> +
> +&cpu1 {
> +       proc-supply =3D <&mt6357_vproc_reg>;
> +       sram-supply =3D <&mt6357_vsram_proc_reg>;
> +};
> +
> +&cpu2 {
> +       proc-supply =3D <&mt6357_vproc_reg>;
> +       sram-supply =3D <&mt6357_vsram_proc_reg>;
> +};
> +
> +&cpu3 {
> +       proc-supply =3D <&mt6357_vproc_reg>;
> +       sram-supply =3D <&mt6357_vsram_proc_reg>;
> +};
> +
>  &ethernet {
>         pinctrl-0 =3D <&ethernet_pins>;
>         pinctrl-names =3D "default";
>
> --
> 2.25.1
>

