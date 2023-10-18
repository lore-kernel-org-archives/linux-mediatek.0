Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC39CDB474
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 00:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yL5IHSgiOPCaseF8jxFxoTKSJkLG4FnIxMof3Q5FawM=; b=r2E1wRZkCc0bpPsQKHE4eh5Y2V
	avSgTKdheXlSv++dSJHvTiq9QkzdLnmS2t5deIsPFyzBSyZcxuRO4sjHVf8TY/JYOi5tShmZzRFpR
	2alQv+giRKt1cJGRNSGBES8o3qBolcDQY0gHw4qeVVB9CE/tDXYlvRRhrX4cuyJg928isynUikp4g
	uo2i6EzLRwg7bBoUy5XUjVF2S1etNEufaGq4nNkBBtHUwPsTuV/YBgoGWH017Jv7MnHpe++Pypqc4
	xGZEqa2k8hcg8esSZvpP3I+4l75OdbhTVcSBTJ3sgvzkMKe38hOxXvein5BGaEoFkCFdZ3AFg7rFR
	UVH/Npuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsu5z-00DSzW-0a;
	Wed, 18 Oct 2023 00:07:31 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsu5v-00DSyV-25
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Oct 2023 00:07:29 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c17de836fbso76669451fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Oct 2023 17:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697587642; x=1698192442; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yL5IHSgiOPCaseF8jxFxoTKSJkLG4FnIxMof3Q5FawM=;
        b=Bu6ki5+mccv3ywxQ022Mv3cpAHmSDs03BIO6oChx12/+Gtn1CNr6P2/wYxEJ4LVkJ5
         WwK4CdnWXpihrotqMHnAwwLxmMWwPglHegHvbT+Qc0hSbmnKFolDvQQCO3gvtnOQES6a
         IA5ogLQTGwXNgbpWbZSP9sYCQAnSVE45l9h08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697587642; x=1698192442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yL5IHSgiOPCaseF8jxFxoTKSJkLG4FnIxMof3Q5FawM=;
        b=n6YmP758Sz27CAAAirpW2kg8z++BUuRlUPYj9ZwCRfJfugmuqHqMyKkVV4hmF4PlyG
         lRGOxuplw77arhNtnqhaA7KLXH6IeVRHyC0GcfvAv/pjpXA3Ly/kbrP6WAipH0efXV7r
         N9ileyfGFR8crctYuJZdQl57hTifoVw491FrzkNH4gH3Z0PLcY952c2K1WDIEO3fdlqZ
         zQj236i/4EJgsk5KC1Md3yFu0Ry+JePDQjJoX8HmY6R5oY6Ohiu9irfApFqaiSybraNu
         KEO0Lbj5qTAIXLW4+Oe7I/Y7UsfY3M6MQpJO7EbH18wr4V+ghrOS/weMQLsJFEryfVp9
         +jqg==
X-Gm-Message-State: AOJu0YypcxEapZrFkWrCRxJJ6hsIdD5yqzOw9OznyEGn3cM+QG3ykZNb
	SG/hn3xYrxM10GIZox4D7KD0zmeexEu1GU9sJhNb8g==
X-Google-Smtp-Source: AGHT+IHdYpQ7b2GTg0pg2e6yXIg3WUzgg6FphjxIscthWaEOsQp4Vnpo/InQm+NVk8R54x4Et7gna/2lIz01hIOxMHE=
X-Received: by 2002:ac2:598c:0:b0:507:a33f:135d with SMTP id
 w12-20020ac2598c000000b00507a33f135dmr2672443lfn.4.1697587641970; Tue, 17 Oct
 2023 17:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231017190545.157282-1-bero@baylibre.com>
In-Reply-To: <20231017190545.157282-1-bero@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 17 Oct 2023 17:07:10 -0700
Message-ID: <CAGXv+5FwkBU3wfyZWWaiOgzLACfMVs4Bnu2KM4oSCUa28SzXVw@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Add LVTS support for mt8192
To: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	dunlap@infradead.org, e.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, ames.lo@mediatek.com, rex-bc.chen@mediatek.com, 
	nfraprado@collabora.com, abailon@baylibre.com, amergnat@baylibre.com, 
	khilman@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_170727_716404_FF63E085 
X-CRM114-Status: GOOD (  19.79  )
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

On Tue, Oct 17, 2023 at 12:05=E2=80=AFPM Bernhard Rosenkr=C3=A4nzer
<bero@baylibre.com> wrote:
>
> Add full LVTS support (MCU thermal domain + AP thermal domain) to MediaTe=
k MT8192 SoC.
> Also, add Suspend and Resume support to LVTS Driver (all SoCs),
> and update the documentation that describes the Calibration Data Offsets.
>
> v5 changes are a lot smaller than originally assumed -- commit
> 185673ca71d3f7e9c7d62ee5084348e084352e56 fixed the issue I
> was originally planning to work around in this patchset,
> so what remains for v5 is noirq and cosmetics.

I see two series in my inbox and on the mailing list. Which one is the
correct one?

Thanks
ChenYu

> Changelog:
>    v5 :
>         - Suspend/Resume in noirq stage
>         - Reorder chipset specific functions
>         - Rebased :
>             base-commit: 4d5ab2376ec576af173e5eac3887ed0b51bd8566
>
>    v4 :
>         - Shrink the lvts_ap thermal sensor I/O range to 0xc00 to make
>           room for SVS support, pointed out by
>           AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
>
>     v3 :
>         - Rebased :
>             base-commit: 6a3d37b4d885129561e1cef361216f00472f7d2e
>         - Fix issues in v2 pointed out by N=C3=ADcolas F. R. A. Prado <nf=
raprado@collabora.com>:
>           Use filtered mode to make sure threshold interrupts are trigger=
ed,
>           protocol documentation, cosmetics
>         - I (bero@baylibre.com) will be taking care of this patchset
>           from now on, since Balsam has left BayLibre. Thanks for
>           getting it almost ready, Balsam!
>
>     v2 :
>         - Based on top of thermal/linux-next :
>             base-commit: 7ac82227ee046f8234471de4c12a40b8c2d3ddcc
>         - Squash "add thermal zones and thermal nodes" and
>             "add temperature mitigation threshold" commits together to fo=
rm
>             "arm64: dts: mediatek: mt8192: Add thermal nodes and thermal =
zones" commit.
>         - Add Suspend and Resume support to LVTS Driver.
>         - Update Calibration Data documentation.
>         - Fix calibration data offsets for mt8192
>             (Thanks to "Chen-Yu Tsai" and "N=C3=ADcolas F. R. A. Prado").
>         https://lore.kernel.org/all/20230425133052.199767-1-bchihi@baylib=
re.com/
>         Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>
>     v1 :
>         - The initial series "Add LVTS support for mt8192" :
>             "https://lore.kernel.org/all/20230307163413.143334-1-bchihi@b=
aylibre.com/".
>
> Balsam CHIHI (5):
>   dt-bindings: thermal: mediatek: Add LVTS thermal controller definition
>     for mt8192
>   thermal/drivers/mediatek/lvts_thermal: Add suspend and resume
>   thermal/drivers/mediatek/lvts_thermal: Add mt8192 support
>   arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones
>   thermal/drivers/mediatek/lvts_thermal: Update calibration data
>     documentation
>
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 454 ++++++++++++++++++
>  drivers/thermal/mediatek/lvts_thermal.c       | 163 ++++++-
>  .../thermal/mediatek,lvts-thermal.h           |  19 +
>  3 files changed, 634 insertions(+), 2 deletions(-)
>
> --
> 2.42.0

