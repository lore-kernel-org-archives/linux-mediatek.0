Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617AEC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 12:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBKSjgXVgAfyfSqv9ig9DK6qGbLQNmXs5urv4GT2+6g=; b=YdYwBTwm0Rpoe96tWUVxpyQ91S
	TdTYSG4AM4vH5Kf9MYNlCOuwjbRFT9kPtdowDr58PpBrh0d5vEi6pPKTC8SdAtqp9VJCWA7lKm6f8
	XeM349iAcPNwLtGr30ve7AWLu3E5xdHfNesLCrlWJ50NfLG5fbyS4MKwlahr5r8CvVVb+T/AjBurQ
	uzxL1We9oEhbuUsBd/0f9I4dhHyTWPty3RUPRzTglUV1oG0n5KTi+ycsinoSmIXeQfPpelaecP+1W
	DbDqo/HgD7zuMcGmMH0ZQpSmhGyx1rdPaWJdEaiMWx4KnoS5UDBmvdsKK00f8QtaAGZRngek4teVW
	raQcxiEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5q2-00DUYq-6n; Mon, 21 Nov 2022 12:23:50 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5pm-00DUTT-Ot; Mon, 21 Nov 2022 12:23:36 +0000
Received: by mail-wr1-x42a.google.com with SMTP id d1so7479641wrs.12;
        Mon, 21 Nov 2022 04:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gBKSjgXVgAfyfSqv9ig9DK6qGbLQNmXs5urv4GT2+6g=;
        b=J/Sca2kE3k5m8yIPrthxBcgITbLLG/8fmqa+LA7QMXbI3xbGYNuiQ8wezyHS8SRJ7y
         m0FJWSaizHVPINK67Iqnp9USQHwkmnTErBmMh/dtMJ2Zm8xVgGsrgVqj9AzdcZk2rPRQ
         57SA2APFmDLlPnG85/TuAQgD7w9f6Oy2A/ZyVy7NM0z81I6vfnzD8P4DoO1LrAflXOV5
         zjYF3StwNPKyVeZpOKjqVUsrciTuhbZ/R9X/Bw0AsnukZk5N63hQkJGDxbICD6zxCE+S
         i10kr389LXJmLOVdSzaxs6avmgo3P4ubLhf+pzVJdVu5crjI9pfrK+Icy1wNf01iVX1L
         5Pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gBKSjgXVgAfyfSqv9ig9DK6qGbLQNmXs5urv4GT2+6g=;
        b=GrpH3cdrVJMtFMt9vGb23oCk+R3d2wbN3AcCac5HMF4v0fQrep05cGnOjyWrzQYUp8
         eI3R+lAm3xtSAFrw5HCp/u1f5bZ36Sh4qtUcIaK4o4Kb8gPndR6HSfe8HG+rBH4cVqPE
         gL2gwy/70Of+Bl7b2Q5rWv0pm8OueVO941iRgvepnjRbDHQM8JvgkkVfUAsXUYtA3/dj
         R9TXdv88iNnbZzz05zV9pjIgKQjsM9DsQg41ALXfFU/cUouqmRAFrM/ybGW0CNuCp313
         MqKQWxztXtVGBLgMlIvPT6L/wSn3b8kobgR8T+HJeKGXuX4qJ/oEr71/D9VVgGk0Y3Ya
         ZOyQ==
X-Gm-Message-State: ANoB5pkIvuZ/yHV9NxFAyTI9vaWIoSPWarYebAlwZrruJbPlhMpXv2Wo
	gJfUgdPuT+maBpZAhVhqFAU=
X-Google-Smtp-Source: AA0mqf72QBRoDc3I5EhLZJT0doyO5vmLUZc7y7AAQ15N7BcLk2YreywlR/36zKH4kUDk33W90Z9CDg==
X-Received: by 2002:adf:cd91:0:b0:230:1a1:ac8 with SMTP id q17-20020adfcd91000000b0023001a10ac8mr11180849wrj.530.1669033412004;
        Mon, 21 Nov 2022 04:23:32 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id t13-20020a05600c198d00b003cf75f56105sm17076739wmq.41.2022.11.21.04.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:23:30 -0800 (PST)
Message-ID: <9aebaf57-e461-b71f-a707-8edbfe8f97be@gmail.com>
Date: Mon, 21 Nov 2022 13:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 0/6] MT6795 Devicetrees and Sony Xperia M5
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 hsinyi@chromium.org, nfraprado@collabora.com, allen-kh.cheng@mediatek.com,
 sam.shih@mediatek.com, andrew@lunn.ch, sean.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221027095504.37432-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221027095504.37432-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_042334_853484_9180E2C8 
X-CRM114-Status: GOOD (  16.73  )
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



On 27/10/2022 11:54, AngeloGioacchino Del Regno wrote:
> This series brings some more support for the MT6795 SoC, as it
> adds support for basic clock controllers (and resets) and all
> of the mtk-sd mmc controllers.
> 
> While at it, since now it's possible to get the "first signs of
> life" out of a MT6795 smartphone platform, add a basic devicetree
> for the Sony Xperia M5 (codename "Holly") device as to start
> preparing the ground for a gradual bringup.
> 
> This series depends on [1] my mt6795 clocks series.
> 
> P.S.: Thumbs up for the first MediaTek-powered ARM64 smartphone
>        going upstream! :-) :-) :-)
> 
> Changes in v2:
>   - Rebased over next-20221026
>   - Removed "mediatek,mt8173-mmc" from mmc compatible strings
>   - Added clock and reset dt-bindings headers inclusions
> 
> AngeloGioacchino Del Regno (6):
>    arm64: dts: mediatek: mt6795: Add topckgen, infra, peri clocks/resets
>    arm64: dts: mediatek: mt6795: Replace UART dummy clocks with pericfg
>    arm64: dts: mediatek: mt6795: Add support for APDMA and wire up UART
>      DMAs
>    arm64: dts: mediatek: mt6795: Add support for eMMC/SD/SDIO controllers
>    dt-bindings: arm: mediatek: Add compatible for MT6795 Sony Xperia M5
>    arm64: dts: mediatek: Add support for MT6795 Sony Xperia M5 smartphone
> 

Whole series applied, thanks!

>   .../devicetree/bindings/arm/mediatek.yaml     |   1 +
>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>   .../dts/mediatek/mt6795-sony-xperia-m5.dts    |  88 ++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 109 +++++++++++++++++-
>   4 files changed, 195 insertions(+), 4 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> 

