Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988A9C369D1
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Apr 2025 19:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BgYWZLFi0BzqpeykX3IbiFarxM1CV0Y1YZ98qOBQX4=; b=zWYPUrrV0K2njR3nQymJhv1oXZ
	sZFrPgoDJ/m0cAcmI+WHl+VL9EoO0r/70t3jX5mk/IEpv/l3kq76hWwxizHYVSePANTDqTkq02VHs
	dMvkZNcTCdlP/XBxcDBifl2jCR/E3IERDc6R++k39J6u7+30B2kttrxUsnvhKx6/Np9x6aoq9SNdk
	XE8qZuVh6DcETeu2VpTkorlapdV61XksRIKaCrEmovlQ0DEjaZ9aDYRv1JXlk3fLimTc5NtjU6qnV
	nqmnrYHeL2CgaBdTNrkh5yfWsQCOtOD+C5DWfmXtjiuCL0ZwuiYingnxkqbXO5vqRmUTRqF41AC39
	v82QF9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JYV-00000008L5e-1zeW;
	Tue, 22 Apr 2025 19:45:19 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Fns-00000007mDI-1ur9
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Apr 2025 15:44:58 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-700b17551cdso41079317b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Apr 2025 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745336695; x=1745941495; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2BgYWZLFi0BzqpeykX3IbiFarxM1CV0Y1YZ98qOBQX4=;
        b=KSFT9iQC3GqLNfOhYYkelhF1oF7ajk2zQrkYQ+FrlQeTkqS1f69/uaORablUrdfmqc
         ON/KfiHcFMFwPXmytk0mQ1KyoV5FLwkcw4VdEmlweM7HHwjPuYiHcVoafdw9sw/OXjxs
         3QGN1VmESvgwjeAl17MGHtCJAtE8sc676OyKeEK1KckWcQRoQ+pEFjMzYQ+8qQ/MQ0/l
         F1ff6E0aUospj1cA1kOI+zk46I5L4bpkbjPK3lrGK0aViGHRSdVGsDriBfUPu8TANXcn
         s65JDmcVTTsXcxy1RoRu0nnjAwD7gAE8rnP8UQQqiv9rYzATYtVQt4D3kgEflHKlzRbC
         G5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336695; x=1745941495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BgYWZLFi0BzqpeykX3IbiFarxM1CV0Y1YZ98qOBQX4=;
        b=QgX9wcLAmL9LzUwQ7JRfuH/4CfEynZhdkWM1h716v5RcPlukNtaVay9MzJhmW4LgOS
         GjdqTSbC9r+3iUOHCSMlzaf3wX0z7kKweoLylkInHbK3y5A29ASXqPneiLwQ7wvtSO07
         Z0Q6OZoJzqHgM425vPn7gWzTSiw9TiPJDh344ewZt4EV3342lg+/QYzOAqhMwXvEoKm9
         QqBsDo0i5N6JNE6yPYWSUPsxeuQAVPcKUuX2Kj/pmPbwMo8Xk8SqdyK3Ga18vJwMwtGZ
         rZOYynM7Mo6t48p115CXrJEnYTkns3ncvP43iENcTGjvUn/cq0G4ez0YqRa1qJn5aWD3
         yhoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW7WxurgOnTWcPHvFgb0VorTE8CeQe4Q4xFCeYxyOjI7mcygRI1VLtQDmlyNa1/ZyafPaZ5yYo15GgHdooSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyP6niaYPVSw9jQRlTQxRo2WzzX5zJNXzZaPe1gpiMjqEB+P25o
	koqM5r3h1QLZeMTaRk5nAqDHW6UqXrjzMDD5uwzG6rMWd4wrDcrhVk+BKXQ35VuR4OfS0QQOxhP
	Bar8i4HsHXVgH2FYSXPG1xl33QuHliEv9Mjngkw==
X-Gm-Gg: ASbGncvcDYxqOs3+4WnrX10BUQpaEcyakajNombY9mtZE44gpBMvl0jjoO0XDnKnZFY
	SXCBQEbOePOAJiWXK8IPlqgkUTURYtCtXOjS93UoqNvFD/RgbnRMyScQBymDUbWVODXh5jnNRlu
	B3s1zmqalI9/rSwdPgFRreK5A=
X-Google-Smtp-Source: AGHT+IFSpOs8RAYN+sIgp07pZ/zas3zROHM0EL+kdxewAnv20qaOE/aRuCgf16SXsDNXFuvyxiQZthMFR3MfKhf0i8Y=
X-Received: by 2002:a05:690c:9a93:b0:6fe:aa66:5d82 with SMTP id
 00721157ae682-706ccd391e4mr206503327b3.19.1745336695245; Tue, 22 Apr 2025
 08:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250411054134.31822-1-axe.yang@mediatek.com>
In-Reply-To: <20250411054134.31822-1-axe.yang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Apr 2025 17:44:19 +0200
X-Gm-Features: ATxdqUFCHfbNl6lm_6jR4t8XeT2NGUGpC0QBxnoaIFI_lKX3UJ03xh81cx0l_ZI
Message-ID: <CAPDyKFrWJBswaAE2_ydswWa9EUw8Lsd_=mCN7gm8ou1_XAcMfQ@mail.gmail.com>
Subject: Re: [RESEND v2] mmc: mtk-sd: Add condition to enable 'single' burst type
To: Axe Yang <axe.yang@mediatek.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, yong.mao@mediatek.com, 
	qingliang.li@mediatek.com, andy-ld.lu@mediatek.com, 
	Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_084456_511866_88F9040B 
X-CRM114-Status: GOOD (  18.03  )
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

On Fri, 11 Apr 2025 at 07:41, Axe Yang <axe.yang@mediatek.com> wrote:
>
> This change add a condition for 'single' burst type selection.
>
> Read AXI_LEN field from EMMC50_CFG2(AHB2AXI wrapper) register, if the
> value is not 0, it means the HWIP is using AXI as AMBA bus, which do
> not support 'single' burst type.
>
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> This change dependents on 'mmc: mtk-sd: Cleanups for register R/W':
>
> https://patchwork.kernel.org/project/linux-mediatek/cover/20250325110701.52623-1-angelogioacchino.delregno@collabora.com/
> ---
>  drivers/mmc/host/mtk-sd.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index ceeae1aeac94..2e4bd5166c17 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -84,6 +84,7 @@
>  #define EMMC51_CFG0     0x204
>  #define EMMC50_CFG0      0x208
>  #define EMMC50_CFG1      0x20c
> +#define EMMC50_CFG2      0x21c
>  #define EMMC50_CFG3      0x220
>  #define SDC_FIFO_CFG     0x228
>  #define CQHCI_SETTING   0x7fc
> @@ -306,7 +307,10 @@
>  /* EMMC50_CFG1 mask */
>  #define EMMC50_CFG1_DS_CFG        BIT(28)  /* RW */
>
> -#define EMMC50_CFG3_OUTS_WR       GENMASK(4, 0)  /* RW */
> +/* EMMC50_CFG2 mask */
> +#define EMMC50_CFG2_AXI_SET_LEN   GENMASK(27, 24) /* RW */
> +
> +#define EMMC50_CFG3_OUTS_WR       GENMASK(4, 0)   /* RW */
>
>  #define SDC_FIFO_CFG_WRVALIDSEL   BIT(24)  /* RW */
>  #define SDC_FIFO_CFG_RDVALIDSEL   BIT(25)  /* RW */
> @@ -1917,9 +1921,13 @@ static void msdc_init_hw(struct msdc_host *host)
>         pb1_val |= FIELD_PREP(MSDC_PATCH_BIT1_CMDTA, 1);
>         pb1_val |= MSDC_PB1_DDR_CMD_FIX_SEL;
>
> -       /* Set single burst mode, auto sync state clear, block gap stop clk */
> -       pb1_val |= MSDC_PB1_SINGLE_BURST | MSDC_PB1_RSVD20 |
> -                  MSDC_PB1_AUTO_SYNCST_CLR | MSDC_PB1_MARK_POP_WATER;
> +       /* Support 'single' burst type only when AXI_LEN is 0 */
> +       sdr_get_field(host->base + EMMC50_CFG2, EMMC50_CFG2_AXI_SET_LEN, &val);
> +       if (!val)
> +               pb1_val |= MSDC_PB1_SINGLE_BURST;
> +
> +       /* Set auto sync state clear, block gap stop clk */
> +       pb1_val |= MSDC_PB1_RSVD20 | MSDC_PB1_AUTO_SYNCST_CLR | MSDC_PB1_MARK_POP_WATER;
>
>         /* Set low power DCM, use HCLK for GDMA, use MSDC CLK for everything else */
>         pb1_val |= MSDC_PB1_LP_DCM_EN | MSDC_PB1_RSVD3 |
> --
> 2.46.0
>

