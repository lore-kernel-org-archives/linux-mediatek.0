Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAF4C83F17
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jul 2025 05:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EriOcw6Ti5BC4myF5JQ02kFXKB9Pwigas67q+yAyzZY=; b=B2MBXJ28fNax01EoEFNaTmtmQf
	haU6MVgE19x9bIxiN5jFcZmC1Qcpa4owIyxAaR32Fzu3qrCysOqBAois+sNUmdasNn0WEFtq4GHGB
	VNuBMJylYY6cIgP4nX+twG2t34dRs/HG8k4GIBitCxKEDTXqLHNMVSeFkane5cSQyZ8FYVJoCrsiH
	JbuZK3zROERRgIzYSda1slmfkLly5JyXObhT7DWyC/jOw4qPA1BUYuoo4qv8ijuQqY8zXGsFtm8CI
	uRo0r+F/XyuiQLjiVEhMHbbpXHvp6+j4Jn7S5SPvQOFo1GxELtH66S9lA6n4+k0FSOAz1F7OLS/MK
	East98YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYBh-000000046HV-3ICV;
	Tue, 15 Jul 2025 05:26:45 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYBf-000000046Gk-0AK8
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Jul 2025 05:26:44 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-556fd896c99so4360262e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Jul 2025 22:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752557201; x=1753162001; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EriOcw6Ti5BC4myF5JQ02kFXKB9Pwigas67q+yAyzZY=;
        b=kam0cDcqiCOFFv1dC0j9X80Hg+eHk5+OD31gtjI2fY6yjJgQyMcCktzX8lJh/N/g3y
         t923rnULTSqa/AD5IUHXuVi0AIDSSSJRwg08+sHRQdplE+WxLWsNg8EchDGWK1iReoR1
         sBXnThAcEq1TMgGtijQcB/2PhFr6wSBu8pi2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752557201; x=1753162001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EriOcw6Ti5BC4myF5JQ02kFXKB9Pwigas67q+yAyzZY=;
        b=HdM1TZKlvo6BXS321gP7kNVvTynvjYHTvy5TrLft5V2fppSkkMmb+SHbdw1bRuoJrh
         KP/89KSkPE3kPs6JQ3F5CKiVQCus0dmBnr2hgYlc7NGPT3CnIU9YIMHnmqhk9pPvdkMI
         5TOgw6MvhbmP2+w7Usqgbk6WX4oNKqFcnz7aGTVT9QASVX9NouJjOW82x0vOQAuF/wKb
         tZFsweJKdVQKO1X5AMl6I+k//nz/zhCg8cIS+BS0In0LXGeZoW5ERZOQo1wn75Nf6Zir
         PtX5UE+ASV4m7arjQhOjeGzO9Lywax0Pc6+OJU5VNhW8isOEwOXqJoZLGDuPyuwbi2KZ
         HJgw==
X-Forwarded-Encrypted: i=1; AJvYcCVydrXf9gfQ6rqfAmPhyC2Xlpg55nhK1Liun/ZDRr5kGFaLpEwfTr6oN9sAOfqo62JfL1/QCaSzV9a6+9QTUA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwif4Dzjaf/V472NXgANDW3DI9aYmu5TxXmS3pGSSTwvM5nmLb
	izoI+CPCWoXQPg7QvC6iN5CXM8+hwkx1Jf2Kf1rXYh1+Ejdimic3B9s44G9WjonhhbnwbHXFFqb
	WIc5W6UpDwAVkFFwrGNv/B7lEHb1ceveZnyljdlR/
X-Gm-Gg: ASbGncu8xDtzNhEfSjbUv+usE2XE/5+58puQniKLpmPrTM0AnPwxB+aS0G+LxmG4W8o
	hEyeTvDYC76VTKf36TEnlfcRB3279I+YOHqlsGSh6iKSNeq69LzHxfrfwSSPn7KiLU5tOtaZLJw
	5owto+XTx3o75MYgt1P4TWD0CmzaL6lBwd+kDkw7bUx5tsgWWKpUJkOhUm+8Opdn05+/A02cz1b
	+dyRSGELgf66xAIQyyDZg8bv0j4ZTcP6KA=
X-Google-Smtp-Source: AGHT+IEQf0W1yeQYNRbpUyAxFlgjb3kYw5Q0BNqfDsziWw7aP+1TqaYvLMXYRwQa9tomb76nSKuU56uoGnkXehDyLpc=
X-Received: by 2002:a05:6512:3b9c:b0:556:341b:fb0a with SMTP id
 2adb3069b0e04-55a044ca226mr6271614e87.15.1752557201192; Mon, 14 Jul 2025
 22:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250624143220.244549-1-laura.nao@collabora.com> <20250624143220.244549-13-laura.nao@collabora.com>
In-Reply-To: <20250624143220.244549-13-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Jul 2025 13:26:30 +0800
X-Gm-Features: Ac12FXx0XfJFXA_DIIE4IblGQiwtiWyeXBGiD295gCS64kpCUO8jzl3QeCZ10ZM
Message-ID: <CAGXv+5EWEsLBS86G828ezpnD3x-MaC3F-AtyGFyzKxPvZ0GcAw@mail.gmail.com>
Subject: Re: [PATCH v2 12/29] clk: mediatek: Add MT8196 topckgen clock support
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
X-CRM114-CacheID: sfid-20250714_222643_122194_4B659F8D 
X-CRM114-Status: GOOD (  16.16  )
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

Another thing,

On Tue, Jun 24, 2025 at 10:33=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> Add support for the MT8196 topckgen clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |    2 +-
>  drivers/clk/mediatek/clk-mt8196-topckgen.c | 1257 ++++++++++++++++++++
>  2 files changed, 1258 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8196-topckgen.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefil=
e
> index b1773d2bcb3d..bc0e86e20074 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -160,7 +160,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS) +=3D clk-mt819=
5-vdo0.o clk-mt8195-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) +=3D clk-mt8195-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) +=3D clk-mt8195-vpp0.o clk-mt8195=
-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) +=3D clk-mt8195-wpe.o
> -obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o
> +obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o clk-mt8196-=
topckgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8365) +=3D clk-mt8365-apmixedsys.o clk-mt8365.=
o
>  obj-$(CONFIG_COMMON_CLK_MT8365_APU) +=3D clk-mt8365-apu.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_CAM) +=3D clk-mt8365-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8196-topckgen.c b/drivers/clk/med=
iatek/clk-mt8196-topckgen.c
> new file mode 100644
> index 000000000000..fc0c1227dd8d
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8196-topckgen.c

[...]

> +       FACTOR(CLK_TOP_APLL1_D4, "apll1_d4", "vlp_apll1", 1, 4),
> +       FACTOR(CLK_TOP_APLL1_D8, "apll1_d8", "vlp_apll1", 1, 8),
> +       FACTOR(CLK_TOP_APLL2_D4, "apll2_d4", "vlp_apll2", 1, 4),
> +       FACTOR(CLK_TOP_APLL2_D8, "apll2_d8", "vlp_apll2", 1, 8),

These aren't used anywhere in this driver, but they are referenced
directly in the vlpckgen driver. Maybe these should be moved over
to that driver instead? Otherwise we end up with some weird circular
link between the two clock controllers which doesn't seem correct
to me.

[...]

