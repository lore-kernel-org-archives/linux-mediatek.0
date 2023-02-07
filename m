Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270E4C636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 07:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCNAF49cUJ7MluixE59CxJOTxjhSyJFzlB7p666SLz0=; b=fMMaSZ1P7KD4DvTRqTy5+j7p1/
	NWDHeWr1wFOzn0MeptdUzw8yVxNX4PlQR1aEY+VIOR+MaJF55uyKfjSFesa/byDeajLJOEvUH0plT
	4U3ZXEDNVPhclpdqZRpm+DroPInI4fcCC7kmi5B4R8Gg89yTweUj+mOFsWhTtWmeCpSSDSalGPyvo
	Ptuto2qljzZZpcZUyCEdvUvZbmEEP5CAHd8YixdwDuU5UvtHIrPEDyz5sj+7JaMuRrSTRlrtjnqQb
	oBWdBfaw+H1HIGL5GhtBiHc+hb/xJpJDUt4Dp3Wj0V77wbfZQGrkdX0BmlePR/zwv77s4lroSe+ru
	dQsR3AvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIRN-00B9Lo-U6; Tue, 07 Feb 2023 07:30:57 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIRL-00B9Kk-7X
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 07:30:56 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id g8so63099vso.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 23:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gCNAF49cUJ7MluixE59CxJOTxjhSyJFzlB7p666SLz0=;
        b=SpsTbPrXlrn0BMOnnB5WAx1mT3fGSu2PJ8hSRfX5+MeynLpKHjBMp2WYTFYXzfUlyU
         t84xSFlVt36uQYH+euKczCPs/6PfnGOfgLpX97MxI5jtyqfO/xLoDBUeaSWL7GPQQYot
         lK9C6fL7vDus9ucgKna/MVkAR98Rvu/GkBtyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCNAF49cUJ7MluixE59CxJOTxjhSyJFzlB7p666SLz0=;
        b=Cr5h98xh6/zAmx8IDG5T2bmloMgWEBM9seTuUFnjy8mQYPV6rLqKD0YFTMWiFPO/9x
         1rTiGk09OMNaT68x51u1uEM10mm91Eg5CFD6c0rbD6CQflAEf296rpgIY9M4oo3+sNW+
         0hjCtPTZPRlBkdFOSL2L2L+2Pm5HXE1SllQPkfFBqiFuvGbjzpzzfgBBj76S1swLgY7D
         TcEYKi/soWf0tbw2nhofXv/6RFl4r+6voDCIo1vQ332jusoQ2SDfY1c+qYyIke703+7X
         /VccCE6O7a5Krj81u18wKvi96owUxMp6Wa8nYJYVznTsiV9arsUlzmepg2cGjjDGBvtv
         HFEQ==
X-Gm-Message-State: AO0yUKV3iCs6l2ZVZ0sRoAGP1UghD+mYcE7YwkeheT8b4KE0+Mo7h/wL
	g5UKGTd9qWuInk2ptUTmSo8dVjwkqTyDRBKzr+6aaA==
X-Google-Smtp-Source: AK7set91DMXJxIvga9meSVc/G34kt/Sh+4idj85b3F2q+xpEyp8Wc9TZUP2+DE7MZ2Dt5/Fy22cI/k24gJN79sKGzIw=
X-Received: by 2002:a05:6102:2445:b0:411:a162:c432 with SMTP id
 g5-20020a056102244500b00411a162c432mr278129vss.26.1675755053286; Mon, 06 Feb
 2023 23:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-14-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-14-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 15:30:42 +0800
Message-ID: <CAGXv+5E8FoVN7HoOpawMhhsKab7qs2F5NcRrpTf5TQiti7XUVA@mail.gmail.com>
Subject: Re: [PATCH v1 13/45] clk: mediatek: mt8167: Compress GATE_TOPx macros
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_233055_288455_F8F22935 
X-CRM114-Status: GOOD (  12.60  )
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

On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Use the GATE_MTK macro to compress the GATE_TOP{0..5} macros.
> No functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt8167.c | 88 +++++++++----------------------
>  1 file changed, 24 insertions(+), 64 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
> index 91669ebafaf9..97a443fdfc77 100644
> --- a/drivers/clk/mediatek/clk-mt8167.c
> +++ b/drivers/clk/mediatek/clk-mt8167.c
> @@ -736,77 +736,37 @@ static const struct mtk_gate_regs top5_cg_regs = {
>         .sta_ofs = 0x44,
>  };
>
> -#define GATE_TOP0(_id, _name, _parent, _shift) {       \
> -               .id = _id,                              \
> -               .name = _name,                          \
> -               .parent_name = _parent,                 \
> -               .regs = &top0_cg_regs,                  \
> -               .shift = _shift,                        \
> -               .ops = &mtk_clk_gate_ops_setclr,        \
> -       }
> +#define GATE_TOP0(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &top0_cg_regs,            \
> +                _shift, &mtk_clk_gate_ops_setclr)

Nit: 100 characters should be enough to fit the whole GATE_MTK part in one
line.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

