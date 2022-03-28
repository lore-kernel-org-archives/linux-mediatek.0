Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D68C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 08:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4bWO3fLtHR2ElURG9tKonj+M7GVuVSO4WRG5jWaEjo=; b=Ii5FPXewMGIm1i
	05ZXZQVJ9mw4hYO6pOJ0MaFpUCU+npH2eo9lRXItzSQNZn+2T0THB+o81023acO8xkmbvm+Y3Zvkd
	fxmHwb/7k8wGbcnhCc5Yt+VZ4k6GROiNp1tdbRUs7DNFbMxsvpmDcNz+dDR00S0AVBYnfVMaJEOt2
	UVPGlsAeVSYK+hdHv6Qdldf+VISA2ujrjac+N23F/PILW+RWEsweHSy5z4XxVrZBG1VaznzjiCFg+
	azdSAoPu+KCLh7LjcHs/BBZFeoD3VQseYHXMYqBDsOY91X9S/Rn9mK6sWbzOGq5HRI2RR8HFTuWOr
	wjzdm+NDzHA1+ZtyTYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYl9h-007w8D-BX; Mon, 28 Mar 2022 08:55:17 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYl9d-007w49-Aa
 for linux-mediatek@lists.infradead.org; Mon, 28 Mar 2022 08:55:14 +0000
Received: by mail-ua1-x92f.google.com with SMTP id u65so643521uau.5
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Mar 2022 01:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XVsPS/VhdyaBsd9atLVudcFUKqEC9P8EvF6rDaB8yFU=;
 b=OSqpQCrlKuq1ygWxipYT3Of9HBAb88KQ9TOJlYuLb2/hGVpSDprsgb6uWgqbh3hh98
 vsxGCoSmwwbiMb/1jrmEDn1hHoeY6N21aXGTFcL6mzAPwPSpbGdasPKMR7/lx8tM8Dcu
 zDqMOBhm8ZczDMkDasuHpB7m/C5XBna2TilwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XVsPS/VhdyaBsd9atLVudcFUKqEC9P8EvF6rDaB8yFU=;
 b=p5zsPDVjXdlIKpvQNvbddlBoqvFkkpckOivS7PyJZ67JoEUHOa2uYipSChSHGNZgkt
 Mpl9Yh2NyrEMW3eYS9RWhx7blHkOA2wgExyGVCXR95yLbLwKXklXm9pOTI7QjF6d+9cZ
 Iroas7TGM23N7sXTAuEJv97k3BTcrjyc2Ebp8Pu9f1PkyYtVn+CRoHPzs3J91IO3JLBc
 6IP/dyyb22LdmmZRgBWZ8i4dZ2eU9ovghKKOETRDEgiZrM74Q/n6ZjNAGMOltHMxItrO
 N7u+H9RhfbRR876dmLtkpJeRsxJSXpiM89Nc6r1klRkpTNhtz/uO8LwO0eZhSp5Or0D5
 lacQ==
X-Gm-Message-State: AOAM531hd0p7RsW5S9ShOCNjhAU4aV5maIBgE6GBsYGmUVgR12XIF3pm
 0PrTISRznlfxA63E2q9YGsDAPLLuMU4cgnrFr7eNTQ==
X-Google-Smtp-Source: ABdhPJyfvYib4PeBvldMr45WaNJUn9d0szw+m4r3gQvhxDYWf7h78gUBTUR4Tz9aV7SCUvVQadsOTy78MLEja6PP/v4=
X-Received: by 2002:ab0:2695:0:b0:352:5fc9:4132 with SMTP id
 t21-20020ab02695000000b003525fc94132mr9194787uao.29.1648457711122; Mon, 28
 Mar 2022 01:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
In-Reply-To: <20220328000915.15041-1-ansuelsmth@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 28 Mar 2022 17:55:00 +0900
Message-ID: <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-actions@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
 chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 kernel@dh-electronics.com, linux-mediatek@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org, linux-oxnas@groups.io, 
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_015513_518825_EDA1510E 
X-CRM114-Status: GOOD (  10.58  )
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

Hi Ansuel

On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>
> Hi,
> as the title say, the intention of this ""series"" is to finally categorize
> the ARM dts directory in subdirectory for each oem.

While I agree with this change and think it's for the good (browsing
the ARM dts directory at the moment is frustrating..) I think
buildroot and others need to be told about this as it'll potentially
break their kernel build scripting for ARM and probably messes up the
configs they have for existing boards.

>  arch/arm/boot/dts/mstart/Makefile             |   10 +
>  .../mstar-infinity-breadbee-common.dtsi       |    0
>  .../mstar-infinity-msc313-breadbee_crust.dts  |    0
>  .../{ => mstart}/mstar-infinity-msc313.dtsi   |    0
>  .../boot/dts/{ => mstart}/mstar-infinity.dtsi |    0
>  .../mstar-infinity2m-ssd201-som2d01.dtsi      |    0
>  ...nfinity2m-ssd202d-100ask-dongshanpione.dts |    0
>  .../mstar-infinity2m-ssd202d-miyoo-mini.dts   |    0
>  .../mstar-infinity2m-ssd202d-ssd201htv2.dts   |    0
>  .../mstar-infinity2m-ssd202d-unitv2.dts       |    0
>  ...sd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts |    0
>  ...ity2m-ssd202d-wirelesstag-ido-som2d01.dtsi |    0
>  .../mstar-infinity2m-ssd202d.dtsi             |    0
>  .../mstar-infinity2m-ssd20xd.dtsi             |    0
>  .../dts/{ => mstart}/mstar-infinity2m.dtsi    |    0
>  .../mstar-infinity3-msc313e-breadbee.dts      |    0
>  .../{ => mstart}/mstar-infinity3-msc313e.dtsi |    0
>  .../dts/{ => mstart}/mstar-infinity3.dtsi     |    0
>  .../mstar-mercury5-ssc8336n-midrived08.dts    |    0
>  .../{ => mstart}/mstar-mercury5-ssc8336n.dtsi |    0
>  .../boot/dts/{ => mstart}/mstar-mercury5.dtsi |    0
>  arch/arm/boot/dts/{ => mstart}/mstar-v7.dtsi  |    0

s/mstart/mstar/

Cheers,

Daniel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
