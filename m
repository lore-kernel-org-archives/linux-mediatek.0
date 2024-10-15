Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91970D1D87B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8q7MgnvGlQX6akYRxirKYZTLEprABkBbW76qdniZOI=; b=r9stFmvVCh3XQoBxKcEYL2vc0U
	aarv/w5G/099YmhDvPTLEnDXXqLvuOtr5ARvf8/Cj1S0yI1tn2ylbHPk+zXEHV2HJ1xWdkFCEEd5V
	aYGiAkDwZV8CMbdJ1cd+bdm3RB6/OopwE5aTxEN1xYfmBO0drwkCrsOzpcb8b3ImN3XA1KeWVwQxi
	pUf5/5jJuq5dHjB7zAiVMBEjcTg6jtZH8FrCZ7yqUdByR5KwsgRtJqmIdiYqDK+yXIGWpEk+Jx0JV
	xlMbxI7NaC1YqcSC1qnuxOLA/eXwb4F+OLEle1JhijrcUTuYx+3Hvr00U9wwj7A8RipCSrogJgT62
	A2A0SuVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0jyF-00000008oQw-1hzd;
	Tue, 15 Oct 2024 16:00:27 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0jwo-00000008o2O-3h98
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 15:59:00 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so3152447e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 08:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729007934; x=1729612734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8q7MgnvGlQX6akYRxirKYZTLEprABkBbW76qdniZOI=;
        b=oPUuuLz81Lc0kDRDNo5ROkcYyBTV5gRUo0Aq2AiZWq1VQKj+7IlI01gGTFQLPz4yB8
         gmv+eR+yIGKBtFsVYAeuznKY//w7uu68M8yWpHSBkDl3lam7VjtkScC/VaJLTCavm69S
         e6eir0LNAEhue4yLjnLXDKcXqEg2/7BeituLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729007934; x=1729612734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8q7MgnvGlQX6akYRxirKYZTLEprABkBbW76qdniZOI=;
        b=MdqWtxNMYRzrGiCKxtKJA5KutHT9GsgWg9W23NhkvS6yqocoi6xNwnjrgdTOCmdKZv
         gecQ5t4WdlV23DDeA8gN56bMcdwPMntE2LKtYCLiKykCeMPehLUqene16Vp5V8Il3KXi
         g6JXWKN2lJw1y+D69xOeghKTuBbyBMTv/IcSu+PVrn9T24PpJaO1DOAF2NL/r0gxStNG
         hxsj4EgccMkMEcbdZPCHqY+5a5rcv89CKNgq637A2w9yRTA4dvcpA5+Y6DgOb0ZgmE3M
         7UM7I66nDZHKO1TtiFqoW2MgTjMa29BRmdbliV3elqhBTKZRP+c5LstzUnHE2KRxwiW3
         Erdg==
X-Forwarded-Encrypted: i=1; AJvYcCU15VXlFlb3i9KC3btbPxm8YTimLiS1kjnYEzXLovc/KNP0uPdDT/Ujhohk8+rGexsOrsWU2L/AcnlV2h3qPw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlri28Ot2nbcgxN4R/lAnaspOwdZ8L/FRzVWIqLthreGSDp9vD
	UN0c+zZdTIKVFcog0PY310iIZKcGNAD337qdJvSzbkicRH1w3T8XkfKmOQds8PbTccqc5gTz5Df
	RRQ==
X-Google-Smtp-Source: AGHT+IHxfd47WukJ8hwoD6UdIZiPcH/PDQhC6Ob1FIs+qZ/LNHT5aWQ6gZ8i28NLJQwDtHcCgXipcw==
X-Received: by 2002:a05:6512:3b98:b0:539:ed36:eb8f with SMTP id 2adb3069b0e04-53a03f2f0eemr573281e87.24.1729007934122;
        Tue, 15 Oct 2024 08:58:54 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa89f1sm202048e87.62.2024.10.15.08.58.53
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 08:58:53 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f6e1f756so2605404e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 08:58:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEpukcsjUgIPzGWEc/dBjIiewrdKNMCKn0LzizCeDRHS5Y7xj0nt8exsWaW2OCiAnXAXQsh93nUOAkjzqk5A==@lists.infradead.org
X-Received: by 2002:a05:6512:692:b0:530:c212:4a5a with SMTP id
 2adb3069b0e04-53a03f1af4amr688286e87.22.1729007932572; Tue, 15 Oct 2024
 08:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241015-color-v1-1-35b01fa0a826@chromium.org>
In-Reply-To: <20241015-color-v1-1-35b01fa0a826@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 08:58:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XrrhUoB9=JuPY2erLMA7S-EREqvP5t8NNuBuUiA4rZjQ@mail.gmail.com>
Message-ID: <CAD=FV=XrrhUoB9=JuPY2erLMA7S-EREqvP5t8NNuBuUiA4rZjQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix color format MACROs in OVL
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_085858_968861_533D98EB 
X-CRM114-Status: GOOD (  20.30  )
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

On Tue, Oct 15, 2024 at 3:30=E2=80=AFAM Hsin-Te Yuan <yuanhsinte@chromium.o=
rg> wrote:
>
> In commit 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in
> OVL"), some new color formats are defined in the MACROs to make the
> switch statement more concise. However, there are typos in these
> formats MACROs, which cause the return value to be incorrect. Fix the
> typos to ensure the return value remains unchanged.

Right. I had a little bit of time figuring it out from the commit
message of the original CL, but I think the commit you're fixing was
_intended_ to be a noop and just a cleanup. ...but after resolving the
#defines before and after I can see that it wasn't.


> Fix: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")

The above syntax isn't quite right. It should be:

Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")

See `Documentation/process/submitting-patches.rst` which talks about
how to get `git` to format it for you.


> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index 89b439dcf3a6af9f5799487fdc0f128a9b5cbe4a..1632ac5c23d87e1cdc41013a9=
cf7864728dcb63b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -65,8 +65,8 @@
>  #define OVL_CON_CLRFMT_RGB     (1 << 12)
>  #define OVL_CON_CLRFMT_ARGB8888        (2 << 12)
>  #define OVL_CON_CLRFMT_RGBA8888        (3 << 12)
> -#define OVL_CON_CLRFMT_ABGR8888        (OVL_CON_CLRFMT_RGBA8888 | OVL_CO=
N_BYTE_SWAP)
> -#define OVL_CON_CLRFMT_BGRA8888        (OVL_CON_CLRFMT_ARGB8888 | OVL_CO=
N_BYTE_SWAP)
> +#define OVL_CON_CLRFMT_ABGR8888        (OVL_CON_CLRFMT_ARGB8888 | OVL_CO=
N_BYTE_SWAP)
> +#define OVL_CON_CLRFMT_BGRA8888        (OVL_CON_CLRFMT_RGBA8888 | OVL_CO=
N_BYTE_SWAP)

Other than the slightly broken "Fixes" tag, the above looks right to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

