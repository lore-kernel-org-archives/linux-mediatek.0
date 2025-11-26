Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FFBD10379
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 04:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/L63BGVmUoxfC9mhB1sInYRCLt0v56Vg11CaEOmoPkE=; b=u+kI1a4crXeXMN7Qukj5GBYFKD
	tRmZgcyFvjP6f8jNYenkXTlC0Hd65GnOTd1xuBgJD6oqvNpHea2mbRc7laUucNZwi8MWQEnZxADeW
	4iz5wjs3KxU9aVtRw9VpjZKhim2jVK0u0jwfoJ2bWmUosaPVzeA/TVKD05C2cj26HIAOe+Ows4z1J
	X/3vEJABwAkakKrYqHfjsiFwzJ28EN7aiKuIQukTWRc2nJZyjME9ygT0oR+gE2QDWOoNeOhteX2O7
	hJUb++IKLX//aKYUw4EgW9UqjRBN//+HUJXXgNerf4NzlM2WkJVOd1a2lyEeAAF+hjdohmPSWiFnl
	nRApDQsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO7Pd-0000000EM2g-2Zsq;
	Wed, 26 Nov 2025 04:45:57 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO7Pa-0000000EM1p-3TjQ
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 04:45:52 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5957db5bdedso6520472e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Nov 2025 20:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764132349; x=1764737149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/L63BGVmUoxfC9mhB1sInYRCLt0v56Vg11CaEOmoPkE=;
        b=CQLabVHRtHISf+DVE2sDzOwKrdj8cvGYp68jNvlewEde4/C/zdSxsEv4ofkkzaOABZ
         iNlZAoYQ+Z6j5XWPWJHFSHRfpmUhSJBV2sXn4FFz9nVzWtpCihMjUJ3oCUqu7MBWqbDk
         Xkdruq0TUuPEMlC78MWzWjK19lY93CWsz1LCefeGWu+9bXkystFW7IdFJSJwQZFNY0er
         ZRXsDBwgfNIwMXWzP4MW56CxkpLZpBwf5Nag+hckVpo10IKlMn3GQe2YAzEOOhSoSTu4
         JaxcY6yww02VovKA841a6t9Xya/zj/iMpOx4y3Dic0e4Q1f97aGjG+xaF34W0ohDpsVA
         uWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764132349; x=1764737149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/L63BGVmUoxfC9mhB1sInYRCLt0v56Vg11CaEOmoPkE=;
        b=p3FyBLyLtw/Yq++UTGtcMjvCPFwzVpC6NoPadtei4ie51YpdCSKgCG/LkXxXroy9CD
         i/5DKeGfChfoFCLpBOVLJIjYTJQtl7u/h+cjAY7V2eorTxlAbF7IPWlIZHU8YCTILyNM
         ujw60EkjYFcs9CMhACnDnM/C7qWelIeBFbzeD2PUuoUkB6q8aY99t/s3Dc/MqxwpvY1A
         fDPAmdKvnzfjXWhrBsRXMYDrfHwZOfCs9KsCejA0BxAZdpyBcsOcX1y6oaoTVWBVMXMm
         SuG1ScAcB/FYd8FT2OxOGVDQaTGNPWdRa5IG/s2ciD1lAStXxl0f0KDrC2SP08l8b4hF
         C7IQ==
X-Gm-Message-State: AOJu0Yx7ONRXGzPsv3ZkHs36bF5sOzGsLLrXo6vRN5Z2QrDeGqB7HWhf
	Ve6YMNAKKG2cls63vf/7x8/txJYg0FOou5Ay78qbG3AVp4USkiR6s0xBxjQP5UN8DOXHyJuaEhR
	LvralLsrvyOU2QTzcn2qdu6U87N9Il7ChlWsu
X-Gm-Gg: ASbGncusBlFo4bqe8J6aB95wpODZFMfWeuLbyZn2WTdFJ7fngRW0D5zFiF076JIcFcO
	cSbWDYGqGUhvNlEV49SsoY9UNzoY/6rVuvFIP6x1S0JuKFmUW0juGnroIDrJO0saQoBmDpgadvM
	CfIqOpRMwwEdkKhi+HX+nPKLnZOiJFXkugKRD3+CNpz5jcV+Uxzhn4cj9Qf9SuzEBDmiBMGv+BK
	8W1X4zWL3o0WBbTF07J0pKPjrpVbgcwATbJenPPxBKYjAVqG2iYpmT2Z3pU12W/G6vaZVw=
X-Google-Smtp-Source: AGHT+IHR8+RxPejLSWNVMuUBZDDbu7aUkwFpZPZips0a48xke/Y9sdxWTTKROk0mL/D0q8H/RGL+YmHUjRgD4JMKIqA=
X-Received: by 2002:a05:6512:2211:b0:593:83c:b5f4 with SMTP id
 2adb3069b0e04-596a3ee5979mr6277303e87.41.1764132348360; Tue, 25 Nov 2025
 20:45:48 -0800 (PST)
MIME-Version: 1.0
References: <CAAq5pW8q6V7x6qpYnE3xB99nVwE363keGiu+Jax0_zqPjogULw@mail.gmail.com>
 <CAAq5pW_saBZ+52zz2FYTt9SuWXj2KwX2Ld7AggVKAzca2m0Oow@mail.gmail.com>
In-Reply-To: <CAAq5pW_saBZ+52zz2FYTt9SuWXj2KwX2Ld7AggVKAzca2m0Oow@mail.gmail.com>
From: Evans Jahja <evansjahja13@gmail.com>
Date: Wed, 26 Nov 2025 14:06:50 +0900
X-Gm-Features: AWmQ_bnOkZq8FiEdG1jv7WRKD9e5CRW0Isddp59em9ItRna_BldN3md6pjm48TU
Message-ID: <CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com>
Subject: Re: mt8183-kukui: drm/mediatek: dts: Invalid display hw pipeline when
 probing mediatek-drm
To: "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_204550_887597_B375E5ED 
X-CRM114-Status: GOOD (  21.86  )
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

Hi Angelo, I was able to isolate the problem further to the dts. After
bisecting the arch/arm64/boot/dts/mediatek/ and building the dts, it
seems like this is the first commit that introduced the issue on my
device.

commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com=
>
Date:   Thu Jul 24 10:39:08 2025 +0200

    arm64: dts: mediatek: mt8183: Migrate to display controller OF graph

I am linking my full bisect log here:

https://bugzilla.kernel.org/attachment.cgi?id=3D308962&action=3Dedit

Thank you,

Evans Jahja

On Wed, Nov 26, 2025 at 3:01=E2=80=AFAM Evans Jahja <evansjahja13@gmail.com=
> wrote:
>
> Hi,
>
> I have a Lenovo IdeaPad Duet Chromebook CT-X636F, detected as Mediatek
> krane sku176 board. (mt8183-kukui-krane)
>
> The display failed to initialize on the mainline kernel (linux
> 6.18-rc7). Using the same config, on stable (linux 6.17.9) the display
> works fine.
>
> config: https://bugzilla.kernel.org/show_bug.cgi?id=3D220803
>
> With the system on mainline kernel, I was able to check the serial
> console, the error on dmesg looks like this:
>
> [    6.513400] mediatek-drm mediatek-drm.18.auto: Building display
> pipeline for MMSYS 0
> [    6.514983] mediatek-drm mediatek-drm.18.auto: Display HW Pipeline
> built with 9 components.
> [    6.515009] mediatek-drm mediatek-drm.18.auto: Invalid display hw
> pipeline. Last component: 38 (ret=3D-2)
> [    6.524422] mediatek-drm mediatek-drm.18.auto: probe with driver
> mediatek-drm failed with error -22
>
> Temporarily modifying mtk_drm_drv.c by commenting calls to
> mtk_drm_of_ddp_path_build_one CRTC_EXT and CRTC_THIRD allows the
> display to function even on mainline. I was also able to add some
> logging and determine that building the HW pipeline for CRTC_MAIN
> works, but because building CRTC_EXT fails, the entire display would
> not initialize.
>
> I am on ArchLinuxARM, its prebuilt kernel was based on linux 6.17.8
> with distro-specific patches, also failed to init display. I have not
> checked why that failed, I am currently focusing on a clean upstream
> kernel.
>
> Please let me know how I can help. My apologies but I am rather new
> and may confuse terminologies. I will update as I learn more about the
> issue.
>
> Best regards,
>
> Evans Jahja

