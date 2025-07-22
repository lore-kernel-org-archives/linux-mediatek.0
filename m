Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3F9C83F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 08:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41B/ekEx4m/gKNRr2HYhyza2JcZwd1YnIux2XMK+KqY=; b=3yGrPt1N5ej44KcEXA3t1o12cX
	DnKwMFmTVZcd95xSXTckBJkcvUGmmZ+NRKrZhe6TxWc/48/G+kXesq0efO5zm9AShnc18Xrd4+fm5
	r1p8dhD8rq1BcRD/jPL2YYg59Y5eYxHeElsPiZwf80CQMqagCEKmwCQZ579KaStB0eB2VXdSxgsD0
	rBRmqgbhadIdkRar+2Hx+lPPgpB9WbcdfLXxPKGVkgvXTJaveOhIvU/2n2c6M23RjNuJaxghMJGUm
	CAHoRqeQLhz3cM8ERy98rkljp3oKPzzlWWj5XpPcso48QDB4AnQUZ0QvSsKGMGDeqHMRRfLefyFaz
	3875HROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8gd-00000001t2A-1VDN;
	Tue, 22 Jul 2025 08:49:23 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7c1-00000001hkp-3C11
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Jul 2025 07:40:34 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-32b43846e8cso38299441fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Jul 2025 00:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753170032; x=1753774832; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41B/ekEx4m/gKNRr2HYhyza2JcZwd1YnIux2XMK+KqY=;
        b=M+8YFF1q6Xbv0h7CaTemFK1vMOubxWGY+2QFNGfwfA97XGsqSA98iA6XZNm4WuTaQA
         8weI7pZEn1lK3VEbmjgoPwBvV2cjH0vVHLFvI1inWUr7I+0LXB4e3U/Jyujh6O/DNSqi
         sx87M5zvwoB9zHjWqj7jf1RAldZh74SGBNS7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753170032; x=1753774832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41B/ekEx4m/gKNRr2HYhyza2JcZwd1YnIux2XMK+KqY=;
        b=ntaNEyj4lfsrQXskXwWvRutSGhWfcomB5ii+dUYmxdGKaJus+5jydtzBeMbaDIwgdH
         V7eQXL+4PzWnd4EOlmYp1Ye94jZBkK6xCB2dqP/DeTDZHjpe/b2zhNyn3d1PCXC2cGBQ
         O9Q1HHR2IPKrH1Tlep7oMZrlniIA7S7YbRBiiTWTRn/+2hmZRKXsQi0ExAIbO5AlUqhM
         m12GkQfkKPH2W4apXbCHamG3D2P4mAXfddL6IlndapspQZNk3Olk7proMprXhSW2zOee
         1dDHU2/C6nHoJV2ArFWulE8JpT6OJ/y95AtP8wVrk3KsfHMZ+Z2oXsx5N9m1FOfh+PIF
         9Hyw==
X-Forwarded-Encrypted: i=1; AJvYcCXzyD969W3HKqxq9qpUjSjAQNtew1NQFj9aIL9roO+UYuwJFGMh3fLNF9rvlW/GITb6QqNdd1C3FhUgbd/zDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/5xdL440U3FcIPn/nn3pY7X9zoJ8urjGpfEus/kN6Srimz2cz
	OEkavhVE2QksDg1JiOmrz0mjlpKNgPE78Ftpk6Dv4AqNfS8uPMTmJ4cvbXXciSY1WHGPkqIKrLC
	LLfoEJk14bw9ao3iO0G66dcjwhJN32i1tKlJqq47E
X-Gm-Gg: ASbGncsHlLQWJC0wDQEFc8pL5Om8MjT8EtIIKFHxCyQGyaBGioYK18e4uX5Iv6mRngh
	6atq2iBEUXdMugK3NMXEK3L/SyG+aQcdGRVozlZvE+0W73S5DRUqVpU3dQsZv/qglMN7uNgOJ9z
	eXIafObwsQM1xTyc6eY1TPRBbj+SKkySGYlnflIWhlx2ozC0NyDjrtLH3B5kK4ZAakWn/PGJvDy
	cReoNp68XGV9YMw5V8VnkA3PLT/cK9tA68=
X-Google-Smtp-Source: AGHT+IEQ22SyB/ySXRKt1KC3gl7QbzYcQMLoMwBK32ZhmBBhXQtJp8OUPSRF0MOxntL5QFsaUhmhC/a9dY2DEPGCwaM=
X-Received: by 2002:a2e:a58f:0:b0:32b:34c5:225d with SMTP id
 38308e7fff4ca-330a7ae1057mr36760231fa.1.1753170031911; Tue, 22 Jul 2025
 00:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250721081459.16278-1-laura.nao@collabora.com>
In-Reply-To: <20250721081459.16278-1-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Jul 2025 15:40:21 +0800
X-Gm-Features: Ac12FXwHVu2xheACj_ug47v0VGmRzFUiGV73WGs8r_Guigs_NEMfWXqCZqRQckQ
Message-ID: <CAGXv+5EmigF=m1zDZ71AMv02XwyYWQxpiRpiwc7YMg=8vc2FZA@mail.gmail.com>
Subject: Re: [PATCH 0/9] Add thermal sensor driver support for Mediatek MT8196
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, 
	lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nfraprado@collabora.com, 
	devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_004033_800300_74B43820 
X-CRM114-Status: GOOD (  16.92  )
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

On Mon, Jul 21, 2025 at 4:18=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> This patch series extends the MediaTek LVTS thermal driver to support the
> MT8196 SoC.
>
> MT8196 uses a positive temp_factor for temperature conversion, requiring
> slight adjustments in the conversion logic.
>
> To support this, the series introduces:
>
> - A new struct lvts_platform_ops to allow platform-specific
>   conversion logic between raw sensor values and temperature
> - A variant of the lvts_temp_to_raw() implementation for SoCs with positi=
ve
>   temp_factor values
> - Platform data and controller definitions for MT8196

I see the GPU and APU thermal sensors were left out. Was there a reason
for this?

Thanks
ChenYu

> Laura Nao (9):
>   dt-bindings: thermal: mediatek: Add LVTS thermal controller support
>     for MT8196
>   thermal/drivers/mediatek/lvts: Make number of calibration offsets
>     configurable
>   thermal/drivers/mediatek/lvts: Guard against zero temp_factor in
>     lvts_raw_to_temp
>   thermal: mediatek: lvts: Add platform ops to support alternative
>     conversion logic
>   thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw variant for
>     positive temp_factor
>   thermal/drivers/mediatek/lvts: Add support for ATP mode
>   thermal/drivers/mediatek/lvts: Support MSR offset for 16-bit
>     calibration data
>   thermal/drivers/mediatek/lvts_thermal: Add MT8196 support
>   dt-bindings: nvmem: mediatek: efuse: Add support for MT8196
>
>  .../bindings/nvmem/mediatek,efuse.yaml        |   1 +
>  .../thermal/mediatek,lvts-thermal.yaml        |   2 +
>  drivers/thermal/mediatek/lvts_thermal.c       | 315 ++++++++++++++++--
>  .../thermal/mediatek,lvts-thermal.h           |  26 ++
>  4 files changed, 325 insertions(+), 19 deletions(-)
>
> --
> 2.39.5
>
>

