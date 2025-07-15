Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F78C83F1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jul 2025 04:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gqg4UcH4HOCD8WdGE4+ik0rgx/yjtc/u1ELlwLDaNkk=; b=Ua5ND0qm8gEmZpFBdPF3vTtL9K
	ZTU3Sx2sFim9O7b1sdmb+75Pyft6k8MxoziAKkD/WDBOVW0t9SehkOv5IyBqE2V+NQxn4kB6lF7A5
	VUuwffhlaWJ/z/O/p2Aq3VC6/frqlFcXkQoss/VNiiPtwTVzmruPJifhVDjnJmY0Z1Ke418V+MoQC
	3+PW9AC7wT5l68yCsOBwxaqBSlyoJw36eB4qRsYV+6/DiwMst/Vwn37qC8BtYr9faRcos6c97qw9k
	qwGVxaLSCb7pt4snB6hgh0QwXQuoaRD873ZAsum68BSS6IOCuylPbk6MVFgbGR0i7V9taR5tmzATz
	fP8p//CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXbd-000000042mx-3bc8;
	Tue, 15 Jul 2025 04:49:29 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXPe-000000041cR-2vUz
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Jul 2025 04:37:08 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-313a188174fso4966965a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Jul 2025 21:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752554226; x=1753159026; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gqg4UcH4HOCD8WdGE4+ik0rgx/yjtc/u1ELlwLDaNkk=;
        b=oE/ng87CYhOgky9jzs+JqG7+L77LnKzvq8NiZAA7OUvdHjRrCX2Lt43H3qfhBmdoeg
         HOOKL6H1eIUfgd65ZrRqWLKTvAIIKhjpCWOsL2WwzQEyvEn3kaeTBIui6OSpOGpPI6RQ
         vXbFZaFrxMJ421PEV4PIpV0a99Mrlpgz2k+9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752554226; x=1753159026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gqg4UcH4HOCD8WdGE4+ik0rgx/yjtc/u1ELlwLDaNkk=;
        b=ez9xHGZ32O+ih0gWapQrdcZ72u7TeUoWdKaEiWQVfoXliSeqosqXvTWwxTmSnlZ7CZ
         Dw+sLc2YBf0J0DnncdEs+Qre+0sdXqdt7xrN0D/HCuv3baGnNhBQXmgX7k2KalsXWiC9
         E5hPMqg44b5SqU3PB6scIRoGds536DW8MFfIlSASr4MlTZZJcycbU4ifzxEfy/thR/a3
         MgQ+sNeJyWcKTqAIZkgjIFPummHGO2NaesEnMEvaB4soazX7KzmHwcHOc7PVSOwZxMSz
         EEVw0tp2ervax8PRoOCLK7+NslujVG3fdJJZw7Lj8M4C60+fYkF3eehri8xkyWJPl8se
         RXBA==
X-Forwarded-Encrypted: i=1; AJvYcCWBHR0qn2ByZJ6WwMA+AuRgjwSh42Sxii+Rt0j3giCMAW9l2lMjATcqdqVLPDTzqy/z36rQ2h3R0sgyYy2Txg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkN5JMNIRWU53yx81pwKTvp4DJiT7mI3+upGYIwVwb3QHO8/FD
	sf8PeS+kMkUoCP+GA2bzA68X01o4lFyowa2tIeFvLeT4VamdQfN9bV6TXg6GoRClmzVj0P1fAKt
	aCiItC/G4Qcxt6aM62KghxDl+b0LzofKI8QQPycmW
X-Gm-Gg: ASbGncvUQE48iTHqfvZKeRZrDMj/08xCNC1HCrzX/VDDgg5AGo88ARTYr85R8mbz3bh
	ls1q9EWypO5OCeIq+eg9Q4dzFkphrIjgKwmI59h79JDogIFyrSCuK9TYd4RxcehGwc24NEDV9Ff
	xiIcNtw6+tT/5rwW8UVTg+nEm+vWl95YmO/u+uFuzGPyfn4pJyR/v4wnunlzXFVgSzbJIEfF5HN
	T86YGCMl/0wphFCZjnu8d2udpMe92sdPUj1IG69360+qw==
X-Google-Smtp-Source: AGHT+IHf1xc3dLDnNYF/fDC0d2YbPGxvPK9FwAjwgXDKEU1kkJL2K+WT5K+79jl9PQ6eV0yj7I0MMHxdLoUbmyObj2Y=
X-Received: by 2002:a17:90b:57ef:b0:30e:6a9d:d78b with SMTP id
 98e67ed59e1d1-31c8f88d387mr3132859a91.12.1752554225889; Mon, 14 Jul 2025
 21:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250624143220.244549-1-laura.nao@collabora.com> <20250624143220.244549-19-laura.nao@collabora.com>
In-Reply-To: <20250624143220.244549-19-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Jul 2025 12:36:52 +0800
X-Gm-Features: Ac12FXyo_hm6-LevP76Ht3AHw10mSGdmwELcsNXs6PZZNLb0jYOFlkoLp35KGco
Message-ID: <CAGXv+5ERCTTJVfgfY=LLTKasz7RpTdpPfHJDKtKiUfcYyrS8uQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/29] clk: mediatek: Add MT8196 adsp clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_213706_792945_FE7DDCE7 
X-CRM114-Status: GOOD (  18.02  )
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

Hi,

On Tue, Jun 24, 2025 at 10:33=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> Add support for the MT8196 adsp clock controller, which provides clock
> gate control for Audio DSP.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig           |   7 +
>  drivers/clk/mediatek/Makefile          |   1 +
>  drivers/clk/mediatek/clk-mt8196-adsp.c | 193 +++++++++++++++++++++++++
>  3 files changed, 201 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8196-adsp.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index cd12e7ff3e12..d4c97f64b42a 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -1068,6 +1068,13 @@ config COMMON_CLK_MT8196
>         help
>           This driver supports MediaTek MT8196 basic clocks.
>
> +config COMMON_CLK_MT8196_ADSP
> +       tristate "Clock driver for MediaTek MT8196 adsp"
> +       depends on COMMON_CLK_MT8196
> +       default m
> +       help
> +         This driver supports MediaTek MT8196 adsp clocks
> +

This is part of the AFE block, and really should not be a separate
device node nor driver. The AFE driver should internalize all these
controls and ideally model some of them as ASoC widgets so that DAPM
can handle sequencing altogether.

So please drop this patch, and also drop the entry from the binding.

I've mentioned this to MediaTek's audio and clock owners, though I
assume this request was somehow lost in the process.

ChenYu

