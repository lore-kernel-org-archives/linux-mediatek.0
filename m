Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527C5C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 04:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uB5imdoPod8S9hEhNPZ14DUI1/eZZtU6LRuwv6Kh2nc=; b=pTKBzmkwv1Z/3Vurmxn/ts5Tbd
	xlBuntlndFrZlwEM3SihNCUUowrnsCaaXztJEqWdLJIwnCIFbQ0uYouRT96Z3/9HTCYNBseMJRTRv
	R5yNjf3aheXncnk4RHP/0KpJ89XgY0DzvhNzKaIPvMX88+GE/fNxUQYzrFDJY6tDG0k6QqEA0DE9m
	ltNLda+pk99REw5oCis6rOU1DAIllyh8YUvJkAeeKerUCnhz2AYYpDLLzjEBkWXZcI765SACRRyd4
	ZEQlpRcKNl3WOth5a0wVd8EYsk6rOova734EeCgyXxe/DAMXizZHos30RfAeqilFFVukf0/LJXo45
	4vvLOi0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r60yR-003hNB-0q;
	Thu, 23 Nov 2023 04:05:55 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r60yO-003hM4-1g
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Nov 2023 04:05:53 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7ba7b361b22so159496241.1
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Nov 2023 20:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700712351; x=1701317151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uB5imdoPod8S9hEhNPZ14DUI1/eZZtU6LRuwv6Kh2nc=;
        b=iDTtskHulOY++8Ry0fScA8vnWjjtSKESuofVSTc/rUdNkPFzl8a0lG3pQ3NgJgPnnQ
         HDPD+iVnXhOziB7+Husc/DnNrL2pgpu5lQe1gbdRiOOejFPB7lya2u15Wy7TTtCX+zp2
         vQuj0wTmJAEB6og8trrlgUZw/TUZJ0sESNAKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700712351; x=1701317151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uB5imdoPod8S9hEhNPZ14DUI1/eZZtU6LRuwv6Kh2nc=;
        b=lfk9PENS+9BU9AomoFY3vKjkMrL+LFi2ioGJCKaW/Arh05IjUmkNeJ0mRMXHK2MZZL
         +WBtzsas00BQ2cB7wLnZorkQ0BqFSGJycS3u4H5Dmer+ElxPfuQHrLJcXZln5r8fHuT3
         Q9Y1CjnGH7DD7norG7wRE3esotYk3xkf97BDDjQC+YV3AeeMHFlXoR2BeSxOx5U1u8LX
         WXowxFoZ6u7skUhubgBz/0yHkkf43uelUMU1372PdleB5w56JAXT0xGBt/qbXlG5SE9j
         2LnOgxQIMymRoizBmvDrh3rD2em6M4/g7TewQxZTjbPIXalC3JWstLx95UFANjaQ8Oj0
         achQ==
X-Gm-Message-State: AOJu0Yz4swTXdl5xYndVp8gR+0CXNRwFXb7hNYskXxdf1smVrgww1JSi
	0mDOCxrA+kTWlLXYiSV65SmSxX4DKvWaiJ78rqC1hg==
X-Google-Smtp-Source: AGHT+IExA7wm5lBPSqpZ1t6baxJvPlwIEgD5Gcd+6yoGkDus4GvoY4r5pDmF12eAh4zKqzIbpEtXLg==
X-Received: by 2002:a1f:6601:0:b0:4ab:eb72:967f with SMTP id a1-20020a1f6601000000b004abeb72967fmr4824288vkc.4.1700712351139;
        Wed, 22 Nov 2023 20:05:51 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id m125-20020a1f2683000000b004b008fb62c3sm130976vkm.41.2023.11.22.20.05.49
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 20:05:49 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-46263d50b29so144235137.0
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Nov 2023 20:05:49 -0800 (PST)
X-Received: by 2002:a05:6102:1285:b0:462:a479:79fd with SMTP id
 jc5-20020a056102128500b00462a47979fdmr4441694vsb.23.1700712349221; Wed, 22
 Nov 2023 20:05:49 -0800 (PST)
MIME-Version: 1.0
References: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com> <20231103102533.69280-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231103102533.69280-4-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 23 Nov 2023 12:05:13 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhL-i7GhP=qRwf+Z_=K2Ee42ZceiPHAuQznsmP2ENXp9g@mail.gmail.com>
Message-ID: <CAC=S1nhL-i7GhP=qRwf+Z_=K2Ee42ZceiPHAuQznsmP2ENXp9g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: mediatek: mt8188-topckgen: Refactor parents
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
X-CRM114-CacheID: sfid-20231122_200552_557909_99FB6BFA 
X-CRM114-Status: GOOD (  13.41  )
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
>  - top_dp is switched to TVDPLL1
>  - TVDPLL1 changes its rate, top_edp outputs the wrong rate.
>  - eDP display is garbled
>
> To solve this issue, remove all TVDPLL1 parents from `top_dp` and
> all TVDPLL2 parents from `top_edp`, plus, necessarily switch both
> clocks to use the new MUX_GATE_CLR_SET_UPD_INDEXED() macro to be
> able to use the right bit index for the new parents list.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Tested on MT8188 with a Type-C -> DP adapter to an extended display
Gigabyte M32U.
The DP output reacts smoothly to resolution switch and refresh rate
change, and the internal eDP output also never freezes.

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>

