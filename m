Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B269C624D3
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 13:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=; b=iLOurpzQl+lS1d21i4c2A+jZNU
	5CYfGIxUcnmj8SEfHBzDQFK/9CL5WeOXpm4TGdZ4F3JzVwzjSZBapkFC/E+EKJnGo6Y3G9YNwByhk
	CtJJcU+FOMRggD6HxiIMaQ5IXaGN1kvtRdydMrIRLQOWxPMXGLFc6Ryx6EAWSsc10yV3h+Tldcsqd
	vRrCtSPiDgYe/DO9FHuG+3PDFLqkMyA9SLM6mjgl2vLnMniJonYiAxweenV1m6AJW0hN982J1MvP4
	cuC3UQRMsL2Eydpx+UTQbhIwccjXUzaSr9PCAWOoMBdqNaL1v6i3IhLj9HXKuj6pZH1t4lcQneqFZ
	/9ds8ZRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UOJ-00000002IVZ-0QLu;
	Fri, 04 Sep 2026 13:55:39 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UOG-00000002IUh-2dLK
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 13:55:38 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so934903a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 06:55:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788530134; cv=none;
        d=google.com; s=arc-20260327;
        b=mG5hHziuoruDKIukMfFjuDMXnWPTyycutW6GWjwrnCrY8LgzCgwzWby7aguqzXsPEW
         nIiiqFD9K/LEEvpsqeVmWFaDztksNxytGEJlPPSyGRNIsdrzbR51E6xMCzVEjcA9594L
         fC6zjIdUmh/clo/SHd2515RixBhKq1cahFuNeir53V0qcr05DnEKq9YZdPsiBTA4gSbB
         WMfa02i9zhyvpbI+EKyJ5GI34oebNohcdSzqTWjbIu8jNHE74do76NuyWC7J6/TChVnJ
         jJGgQDRr2gRBo9HUnE63BJTqcitU92NWS4gxgBnUfGgcUsDtWKgUyDvNmZNUSE4KHIJZ
         CeNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=;
        fh=lM+1LAKE5w8FmVd0rx6ji1SZDvhhtnlULqGwLuahID0=;
        b=GpDLkecARYXZOKHvJudGxtILJAK3r5hlj6/MOG/3oWqcjtThdBvVFcYg8U4W/3kPuD
         WwcI+Asu8sR6cNTpCLXnFn7pxkgxzeABB3RAGlCywYMuZ6FzptxFQ1YYDBUEZFmGNDvf
         8PLg4nGLpkG5yEZxIJM44ZTu9PLRUb5EO3MjSp9TuSWI3DirO5kMXAn+F5Ax9xEUxyiB
         QxO3EmPS9eiUfO1S/B0L34fGFnt/Pr9clvXfAsCzt0ckhwoAiNoc0ihLiZz1AJpnCZ+v
         KyGIEJfMrbVay4PMdCGJkp1xuKkcNqo1m9rjsWoCUQ4V2i5sIARVIV3gCM/d+1kjdXGA
         8nPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788530134; x=1789134934; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=;
        b=AlEXy+FJQ/YC0ggrCCOYwjOC7k7SFksnwlMu263Zp+RDqhdxs7FNnIKGEWnwLYE/2o
         9YjU8+nGPTwLywrRZ5elfGvhnjndWkfdyzykHSAxgtYjnEtM1qb5myUMNtvQFgVLLcYa
         zkPOrDBIfGm2DcADcp81uYcObNhUbdhBcV4nrHD8qC8arZY3TARuOv41Ko6m9KA7U6SR
         5gNcGdCIDnz+zOZRvWA1PpDo5Ij08gwn737D82rxPtttIg2Rf1bdttzaLK2aTO5FT/3e
         M3FlqLhps0cE5OB9C9T2V0fnTC7MDnm4KRNlwHJ3i6m0FwezYbSsCb+1OCMZDH+catiM
         QN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530134; x=1789134934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkjDjgzDaw86AXoG1909ddrRynkL4ufeKlwmjCrQJhQ=;
        b=gB/qV4ry/kLI74qSIrd+J06B2182Se8/A4wQJkOkfAhglvOKt5JE0cdOCO3EkcRz8U
         4kP/EMQKrHml9l4xQTgH986jDOiPO97erahDuIobc12eo24FWgOG0F1N8+H743TTiEVS
         4eNpNrDGAyZiuH+TwGWKckxlUkkc/2C6uGWtNcsSBwUoVfQORyTGdgJeRD8NKUYyl05D
         VDNi2r+htyf9fGr5fHK93eO12sKHygcCMmMo7GSR7LIQyMSnFwfZgAwIyHHl211MyQc1
         2uzmVRZrPHdAos+oY17IaW29asB8rRWFYPQPWyBEBVwO/3llcCwK7ZGUBjtLk/bVmId6
         X/0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxO9sH4lYRYdgGsAo263ijsxoJ0jMnOYUBgFVAcOJcbx2Bft7EfkGs+9c4fEf40W6tx52kYhN356PLyTxHUCQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mZeAvICOYPnqFnrVpIraxSLSGs5ZHqwkAOz16l+nEMM1ga6lbu
	+5c++EtOvaiSHuQirttqrcUUO+452suhqXXvsIHH27RCngTOhIwCecTs2Fu5Mg8sj7NPa1XCmfP
	hgi8o/enPDIU5RdrbYsQgvNFFTFGt2Cc=
X-Gm-Gg: AYBFou1nAfoFPzj+M84NLTdYA2gIE1xD8nQlGf6T0GQUQyhvU7YhuQS+DnShB7YIPtl
	q2nYUSzsFWQ7T91lDpF0Rx1KOk7dEtoKTXGhoWP/m1dULO84IbpMIKEHZkWowUfLjD3U/rJElpm
	IwiYzXXdZiau5NH9RifXKus3YEK4oIiqKo3+Qbnby2YRCb/29h12mN7mb9Xvxgnaw+uTFP3SxDd
	PTjy+Q4he6FJtyvWMTNHN7f6mnYGvwzHUF5eUiJuxrL7EQGI2/JFWL6YH3karmHOjNjaz62U2od
	LSo/ODoVAxfiaGSzwelhU6WQQLF4L9h64/lLjUrl56DqncD1FKQxEL6nbaoz
X-Received: by 2002:a17:907:720f:b0:c25:5d2:acf0 with SMTP id
 a640c23a62f3a-c260c8c21d3mr311924666b.8.1788530134042; Fri, 04 Sep 2026
 06:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-21-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-21-s-vadapalli@ti.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 4 Sep 2026 10:55:19 -0300
X-Gm-Features: AcwNN1WkMLBcSKjjx-549nVRZ1ZETkJHm5sDyQYa7o61EdbIDExabOintEMeFfo
Message-ID: <CAJq09z44PfcEKsoH9eP+c5rxmzQ52hQO33k8sO-e6po1bpE6rQ@mail.gmail.com>
Subject: Re: [PATCH net-next 20/33] net: dsa: realtek: rtl8365mb: Remove comma
 after sentinel-entry in match-table
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: dario.binacchi@amarulasolutions.com, mkl@pengutronix.de, 
	mailhol@kernel.org, msp@baylibre.com, florian.fainelli@broadcom.com, 
	jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	kurt@linutronix.de, hauke@hauke-m.de, chester.a.unal@arinc9.com, 
	daniel@makrotopia.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
	linusw@kernel.org, alvin.sipraga@analog.com, clement.leger@bootlin.com, 
	justin.chen@broadcom.com, dlan@kernel.org, rogerq@kernel.org, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, rjui@broadcom.com, 
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	opendmb@gmail.com, andrei.botila@oss.nxp.com, wangruikang@iscas.ac.cn, 
	amadeus@jmu.edu.cn, kees@kernel.org, tmshlvck@gmail.com, c-vankar@ti.com, 
	horms@kernel.org, vadim.fedorenko@linux.dev, daniel.zahka@gmail.com, 
	nora.schiffer@ew.tq-group.com, v-singh1@ti.com, oss@vassilevski.com, 
	haokexin@gmail.com, alex@sverdlin.org, aleksandr.loktionov@intel.com, 
	lgs201920130244@gmail.com, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_065536_707763_BD192ED8 
X-CRM114-Status: GOOD (  14.24  )
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

Em sex., 4 de set. de 2026 =C3=A0s 01:39, Siddharth Vadapalli
<s-vadapalli@ti.com> escreveu:
>
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  drivers/net/dsa/realtek/rtl8365mb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/r=
ealtek/rtl8365mb_main.c
> index 4c305756116c..f8220d832e46 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
> @@ -3352,7 +3352,7 @@ const struct realtek_variant rtl8365mb_variant =3D =
{
>
>  static const struct of_device_id rtl8365mb_of_match[] =3D {
>         { .compatible =3D "realtek,rtl8365mb", .data =3D &rtl8365mb_varia=
nt, },
> -       { /* sentinel */ },
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, rtl8365mb_of_match);
>
> --
> 2.51.1
>

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

