Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D71E95A91
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 07:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhLRpwsuxmOsvcZ8fYOZy3OVA1IUIC5Nv3spoy9OsQY=; b=tcBxeeiSOKix9CeCGLM6NlNfQu
	Kcrj+U7v3ewPTKu9uq1oJGAf4NDPWZKGBvRIfVZlGVALg2rkqMzNqKQFteig8NxbVs2WgG899FD63
	2J64/0LZ02TVTrFikf9RwJDGrChtQOdqKYJpa73Q2OsZxOMgVdwyAcstF91gS+7fs3JkuABoEPTEv
	/8St9LG6w50a81V/9Ha7jhzwgeE1vK0mAnTxxa1QjxoHn5uxlcur+x+IJLwrz+TbJpmKw7395n2EI
	pPHwRL407q0d/noZvJe94sb7QgFWiNBlv3zEYb9iL/0y60k2E1lcN+SyO9xD9BskexuWmB+RCYuEc
	7uE/o40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpkOm-009slr-0d;
	Mon, 09 Oct 2023 07:09:52 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpkOj-009sl8-1D
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Oct 2023 07:09:51 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-4526a936dcaso1698814137.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Oct 2023 00:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696835388; x=1697440188; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhLRpwsuxmOsvcZ8fYOZy3OVA1IUIC5Nv3spoy9OsQY=;
        b=CWOcVHCRomK5OlK7f9sv0wqVYmINmq5TKZdBxwyvhdqOfmAZ3JK30g1Rrt6vrJIbGf
         FWb9enQwM7c8xKymik5zllPRNqhhg1ah8Yw4lAuWXayU1aRsVNTRtiroYQ4MSPMWx90q
         m4iLnJvQ5nsZ8xNRA/WLrFVP8IP0RwGv+IOwi6lLApM2bQZNOWnKI57hLxWtgpPveuSL
         ryQpfk1JShT29w55RSFU9mtaCmPNaHfH4uV9RND7imVKA/60oK/Fx+6MdL9ejdjmcBn2
         prNSpwS6e123uxoxGpZT/JV8yggPk5T52vk6T2u6i61+Ta8KK8tMhSlnJhrOszqtQEKV
         k+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696835388; x=1697440188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhLRpwsuxmOsvcZ8fYOZy3OVA1IUIC5Nv3spoy9OsQY=;
        b=og4fNovpGHvfm8T/W2cbLVVottmXprQuBHsnBISf2DMkLmvsQDKK2cLn9MtuNMv2lF
         72/1CQfJYVgFtZtgczJ5Lhud1VJ824YIZiPO+QblAosIntt64jKphOUy0F5OqoeQmpJd
         4NJ5vJSsNWsiB/zetPxBlmJ7Q98Sr+h3uUzjm4TbmyasbytwCod9MkPuDNVWQetIBQvN
         Iw+EGjjHfRbTCj1sMRsHA1erW01dpiIMLKqLVvebqafKllOtD5pxIWH6W1H12USPB5PV
         XySAAKmpeTWK5eogmuxrCwl72siGVK5dCFScxysv0yl1qwe1oq49Bcjy2JW3EBj7FtQO
         XNPA==
X-Gm-Message-State: AOJu0YyCZJ5b5TendbAwiqIwvW0WA04qTpgsmKvOISEk7GdlTJQORyrT
	JewDhnIAq3eMVbzB3lW50dgU0t3Eti3Nt8F5ZKXniQ==
X-Google-Smtp-Source: AGHT+IFVM96RtaqXDXXuEbO13aoAbWj6cTZzjGKLV4l0Aye+LflqahSU0J82oWNmTnQq4Qz8tRzJ+5XZbtX86Rgify4=
X-Received: by 2002:a05:6102:f09:b0:457:79e5:50df with SMTP id
 v9-20020a0561020f0900b0045779e550dfmr2089711vss.33.1696835387451; Mon, 09 Oct
 2023 00:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org> <20231006-descriptors-asoc-mediatek-v1-1-07fe79f337f5@linaro.org>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-1-07fe79f337f5@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Oct 2023 09:09:36 +0200
Message-ID: <CAMRc=MdY2DU1R5_Ntkhw6UP0Vp+uhyUvti72KChBQqSF1ruWPw@mail.gmail.com>
Subject: Re: [PATCH 1/8] gpiolib: of: Add quirk for mt2701-cs42448 ASoC sound
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_000949_441784_D79AFFBC 
X-CRM114-Status: GOOD (  16.13  )
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

On Fri, Oct 6, 2023 at 3:46=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> These gpio names are due to old DT bindings not following the
> "-gpio"/"-gpios" conventions. Handle it using a quirk so the
> driver can just look up the GPIOs.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib-of.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 531faabead0f..d9525d95e818 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -512,6 +512,10 @@ static struct gpio_desc *of_find_gpio_rename(struct =
device_node *np,
>  #if IS_ENABLED(CONFIG_SND_SOC_CS42L56)
>                 { "reset",      "cirrus,gpio-nreset",   "cirrus,cs42l56" =
},
>  #endif
> +#if IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448)
> +               { "i2s1-in-sel-gpio1",  NULL,   "mediatek,mt2701-cs42448-=
machine" },
> +               { "i2s1-in-sel-gpio2",  NULL,   "mediatek,mt2701-cs42448-=
machine" },
> +#endif
>  #if IS_ENABLED(CONFIG_SND_SOC_TLV320AIC3X)
>                 { "reset",      "gpio-reset",   "ti,tlv320aic3x" },
>                 { "reset",      "gpio-reset",   "ti,tlv320aic33" },
>
> --
> 2.34.1
>

I suppose this is a run-time dependency only for the other patches?
Can I just pick it up into my tree?

Bart

