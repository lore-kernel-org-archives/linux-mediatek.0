Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C98C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 07:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJAXrDTd/Nz/J5muH2M5Mg9/zWBy269fM8uuL6rXc60=; b=Rgx8CVeXfovKNQPY7lS9s5aNqU
	SSkdy3TgbRjYLMbx3K1av5R0ohwte5bz++hqItcJ8YtOeVHH8YKc6f/0xPKR5Y/waqqGH326Ij9ur
	vTnP5YTV8dqnF/OygZNYVJvY1JdnBPBuxiTWR8qZOY/nXEu7PbYWWpGYM5klWs5dVgzYO4U5TC5op
	ROYVTnAaTAVmBbyd2MB2ePtLD/eP/t9RpHjubS3n+MWCRD7NBe9ljRN2EgjWiGVGOMZA1HDHJFDQU
	slnSkTuD2UnamnOA/8eSN1Ts9wbja1QDsQDtGqS2nRCd8KBERWhq5E3TlT7cOG86+PXjltimCrKLr
	P10Iu/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7AJF-008QyX-1p;
	Thu, 08 Jun 2023 07:43:53 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7AJC-008QxY-0M
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jun 2023 07:43:51 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-43dc17feb22so60482137.3
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jun 2023 00:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686210227; x=1688802227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJAXrDTd/Nz/J5muH2M5Mg9/zWBy269fM8uuL6rXc60=;
        b=DNPvf1GpogmxzgQvbWz98Sw8cq32qUMrFI5mTw675XCXzXY808txVThkEsqsrADeel
         F9nHLSSzDUyCasRGlwJSX1tNIXVd+1YibbRWCEnNHcT1edFxru9LzT0SLrcjT0XqJhgq
         2uuPMP/rkP/DseGIkYrv0+Ucp9yJhSlN8zNb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686210227; x=1688802227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJAXrDTd/Nz/J5muH2M5Mg9/zWBy269fM8uuL6rXc60=;
        b=l4M+yOgoNDbWmNCscpoq2/qRWMaDnqvcKZu8+pLo+jxoyC3sWUtK12KMT+JTYMtGOp
         nWOjWvGnh3nxCuSZw7oayUDq7/BUmhq9faatZnR+jH1rq9VDKQ2wML+L6c9PBoQssFJ5
         NiQchIJvv5byWqPZMzm2sI1rE5OPFcCF5HWmCOpOABrRwA4Vp2yTCropjF208JEC+dF2
         oDpWg4NGKxLp4jZqKSuyFEXxzG6ef6SGU+RAKmb0T/hVHZ5YE0nuWlKm+BIL09sGK6zz
         zV9kfJmkk+UC5JpdMvaEJRUac3TRqez5bVoa2Zi9GcixQ0xvz9WyWuTMPBBLq0KEHmSO
         REWQ==
X-Gm-Message-State: AC+VfDz2LRvrGDt7r+Qg1PA63aoqAUPqwDkZU3IJUp2o83xqEJLTcfkH
	9nr+ZvgS5Buna8t1hZS110Y8/QivzYn7oR8VDmwhXg==
X-Google-Smtp-Source: ACHHUZ79ixQwfkYC9Zf7mdwRzABuK9h59tn/Zx8kcIDizpuVdiBvKBT6XWtWmV7VyQiZhvuYHK304MUdsNJzyBFAobA=
X-Received: by 2002:a05:6102:104:b0:43b:2a58:8eb5 with SMTP id
 z4-20020a056102010400b0043b2a588eb5mr1781203vsq.20.1686210227541; Thu, 08 Jun
 2023 00:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230607205714.510012-1-nfraprado@collabora.com> <20230607205714.510012-5-nfraprado@collabora.com>
In-Reply-To: <20230607205714.510012-5-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 8 Jun 2023 15:43:36 +0800
Message-ID: <CAGXv+5EgP+0fTDhdpnYDCVQAWtWqwKp=Xxh-pHc1137wHoywRQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clk: mediatek: mt8183: Add CLK_VDEC_ACTIVE to vdec
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	kernel@collabora.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Miles Chen <miles.chen@mediatek.com>, 
	Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_004350_202016_6785A6EF 
X-CRM114-Status: GOOD (  15.36  )
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

On Thu, Jun 8, 2023 at 4:57=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Add the CLK_VDEC_ACTIVE clock to the vdec clock driver. This clock is
> enabled by the VPU once it starts decoding.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> ---
>
> Changes in v2:
> - Added CLK_IGNORE_UNUSED flag
>
>  drivers/clk/mediatek/clk-mt8183-vdec.c | 5 +++++
>  include/dt-bindings/clock/mt8183-clk.h | 3 ++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8183-vdec.c b/drivers/clk/mediate=
k/clk-mt8183-vdec.c
> index 513b7956cbea..03c4f1acfdb8 100644
> --- a/drivers/clk/mediatek/clk-mt8183-vdec.c
> +++ b/drivers/clk/mediatek/clk-mt8183-vdec.c
> @@ -27,6 +27,10 @@ static const struct mtk_gate_regs vdec1_cg_regs =3D {
>         GATE_MTK(_id, _name, _parent, &vdec0_cg_regs, _shift,   \
>                 &mtk_clk_gate_ops_setclr_inv)
>
> +#define GATE_VDEC0(_id, _name, _parent, _shift)                \
> +       GATE_MTK_FLAGS(_id, _name, _parent, &vdec0_cg_regs, _shift,     \
> +               &mtk_clk_gate_ops_setclr, CLK_IGNORE_UNUSED)

I think what you want is a read-only gate clock only used for reading back
the status. The ops would only have .is_enabled.

ChenYu

