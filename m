Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80CBC5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 04:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDuyynkQJjhNuDv7Y3RcwbZVUcM2IlduXLPOC7/Q8To=; b=VynSpodHuzZWJjyroYuKODxvNb
	NQthmshMSyDGpAgOasbGqqUExy1KHoUTGL1Qp/hUbvHa/bvFQwxYVeRzoOaX8kNGO+uvZeBfNUTFd
	FkmpM3pbxajH5UHo9P3Jqy57d3s/rjpVHkRoKEUYpsH03mYRXsPIrwbDZRC3+AaJ/HstXP83x5HzK
	WQW4FJAmKgNAJDmwvg6N1QR1fPWJkaGdW2QBVEJ7voBB6WOCznabDuKXRlw+k7x1UObqLs1nMU+mp
	AYsRxkeS5sjJWG1LwSbHtp75GtvEpRNtMgosCROGKWTNRHa50uABkskNU674EpUkbXawWERyLtFFd
	CsCZ+Zuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r60xs-003hGR-1T;
	Thu, 23 Nov 2023 04:05:20 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r60xq-003hFR-00
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Nov 2023 04:05:19 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-4ac10aacd27so169150e0c.0
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Nov 2023 20:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700712316; x=1701317116; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDuyynkQJjhNuDv7Y3RcwbZVUcM2IlduXLPOC7/Q8To=;
        b=Yv2uN0hVbsWpcBgj06wLUs2e4++xyvXycJOWpffb5oG2nklMWNktaqjhmiVM+2e2i2
         LhIev04yRxJ9Ir8Gh4MeQhllc3lGzYdWF7v82CeaOUnqoCbiGEx5M+Gz6uuUc2YOMrD0
         iVmhIY/qSTdEj908P1Has0q/bYZMIZkS1e4eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700712316; x=1701317116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDuyynkQJjhNuDv7Y3RcwbZVUcM2IlduXLPOC7/Q8To=;
        b=mRI5wBmmDXHuDzdYSc5uFy8mK2qu4hVWH86l/iv0TMoj4LwqXXvO2adLFkipoE9aB0
         V8ive3hxsMQCmJmkqotD6N7BmWCcsSUTLpdkYqna13uK0WpiTojt0Piw8nSbe4ld40TD
         Twa4hTwmz0oacVmZZ8+lCeVzP/0wLjhlftWjbvhl9U4gHEiL6yhyXmXrp1ziEMMosPus
         RnjXuSWOpy4/XFgKoz5ZD0NQBCCpu7y5GuB5mvQoXnnyLfABhaB/qz6IRpn1Jcqlqs/o
         PzmVO82pUs+rZnd6JRL1oVDFLsH9hwc9hrd9wBtZl6PKNoGLdLsibo/Pzj2h8lQq6GgP
         cDrw==
X-Gm-Message-State: AOJu0YyQQKGa+9Tlhonn9EthbjeTaAU7jVWsCUPTcicj/78qx/vbGns2
	30zzLfo5BCp3UVV7nufdGoKwYi2F7X/oW5I6QKt3OQ==
X-Google-Smtp-Source: AGHT+IFEbSE9sZZPF1ibR2weV10ESQm5ttMzB4FY7LU9iqGQ02zbc8/IhndvMe0MsZIsH2Z6LWYRvQ==
X-Received: by 2002:a1f:d747:0:b0:49a:466c:199e with SMTP id o68-20020a1fd747000000b0049a466c199emr5504226vkg.2.1700712316360;
        Wed, 22 Nov 2023 20:05:16 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id h10-20020a9f3f0a000000b007c442a209d0sm76120uaj.35.2023.11.22.20.05.15
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 20:05:15 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4ac89e8e964so164675e0c.3
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Nov 2023 20:05:15 -0800 (PST)
X-Received: by 2002:a1f:dac4:0:b0:496:2282:5c2f with SMTP id
 r187-20020a1fdac4000000b0049622825c2fmr4788680vkg.6.1700712315456; Wed, 22
 Nov 2023 20:05:15 -0800 (PST)
MIME-Version: 1.0
References: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com> <20231103102533.69280-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231103102533.69280-3-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 23 Nov 2023 12:04:39 +0800
X-Gmail-Original-Message-ID: <CAC=S1nimsor1k+sRXw67OrM8U_kANgLdnn6E++gR_O6S_tisLQ@mail.gmail.com>
Message-ID: <CAC=S1nimsor1k+sRXw67OrM8U_kANgLdnn6E++gR_O6S_tisLQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: mediatek: mt8195-topckgen: Refactor parents
 for top_dp/edp muxes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	wenst@chromium.org, msp@baylibre.com, amergnat@baylibre.com, 
	yangyingliang@huawei.com, u.kleine-koenig@pengutronix.de, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_200518_040434_06267187 
X-CRM114-Status: GOOD (  13.50  )
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

On Fri, Nov 3, 2023 at 6:25=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The top_dp and top_edp muxes can be both parented to either TVDPLL1
> or TVDPLL2, two identically specced PLLs for the specific purpose of
> giving out pixel clock: this becomes a problem when the MediaTek
> DisplayPort Interface (DPI) driver tries to set the pixel clock rate.
>
> In the usecase of two simultaneous outputs (using two controllers),
> it was seen that one of the displays would sometimes display garbled
> output (if any at all) and this was because:
>  - top_edp was set to TVDPLL1, outputting X GHz
>  - top_dp was set to TVDPLL2, outputting Y GHz
>    - mtk_dpi calls clk_set_rate(top_edp, Z GHz)
>      - top_dp is switched to TVDPLL1
>      - TVDPLL1 changes its rate, top_edp outputs the wrong rate.
>      - eDP display is garbled
>
> To solve this issue, remove all TVDPLL1 parents from `top_dp` and
> all TVDPLL2 parents from `top_edp`, plus, necessarily switch both
> clocks to use the new MUX_GATE_CLR_SET_UPD_INDEXED() macro to be
> able to use the right bit index for the new parents list.
>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

