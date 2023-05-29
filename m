Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE356C77B7E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 16:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fl5UqcVglx/Zk4w3uBA6m2BcPMsFBjrRyQ7G0qcJSnw=; b=CKAX6CZuWZ8GbJjvP/jlzh9x0J
	5J8MdHUBouRdQLkArpsNVRCFhws3nYRAZIEQY/FAOmNedOLBxDV4GkmsY0itsrVjIGSspBAls8OSa
	HIA6DhGAy7h7b1iy69Q/EiR6eMTZCWDBYkj61AygINNnMUu0zY8fJlDnMjZGZDuLQpE11gUyvcpVL
	HMLwACLbQ1DbhNBiR64pvoNpBP1Awi2CuoNNDedIbiqeFWeqPI7Q0WLIPUmnUxQeLv4wQFZKVMjtr
	eXiqeFNjNxWtWnir4dXk7vCMu7qTbKnnxi29FUWANvcEJgqC2BsoFC7hDNei5RbP3G6LNPhvWG/mD
	sG4+PR5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3flz-00B7h7-0k;
	Mon, 29 May 2023 16:31:07 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3flv-00B7fl-1o;
	Mon, 29 May 2023 16:31:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f6042d605dso22800935e9.2;
        Mon, 29 May 2023 09:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685377861; x=1687969861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fl5UqcVglx/Zk4w3uBA6m2BcPMsFBjrRyQ7G0qcJSnw=;
        b=czU8EWyfqVVWum0f9XkGKu0jfiJKyRLWAWQTbnM9PgfeGqVvCD7Xx3pMDXFXcZOkL3
         fMbb+fve6pNR01Vg00VBv5ZdB5F54WDGgndSixL18EAfFd9wdotJ6Nohc2FhtDsv4T0w
         /hm8/erKDe/oDQzgeJ9lAEcsZrSvsY81H60DrUsdwH8EfWbep9f/RBjkxxmkifWOhxW/
         oC5+foF5Aaek7VmjZbihB1HMuSBqgoGlrxCapUDDp5kSyaZt/M0MbU87AP1yp2Bb266E
         Zd4lmkZWHYUb7/ZXmISXbeYtQBYf+QLJckDj1BcynPKtdDbj2Z9Me3w+k5TanXj2foqn
         NhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685377861; x=1687969861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fl5UqcVglx/Zk4w3uBA6m2BcPMsFBjrRyQ7G0qcJSnw=;
        b=l+yacQSfpleIDVZIKfDuLcZZ8NaXycFhnzXT5COFfnoPdcLILZM/8DaBXH0igsxZzF
         TKFjKhVSqq/6bF0oFL388duEXofVEztYjBCk3sbuRnXv2K813FB8iE43UaU0rjCzatr7
         ZeW1iKgQgdsGtRvcJX/8UZRBOOXwmgdXd3YVwW5k6MlKRD7fos9GQWWTK535RLrDgSts
         KhkLBcz8RuCp1tayRo1YjvtLei8BJrIvUynWa6vUA+Y+naTtygesbu58CMERGT99lbpm
         xNr87xCVeiyzRI7q1/RmD0zwB6zLeCGSh6yHld5Zj8bvnhE3rQW72bv1rM4JykomwcQF
         fr2A==
X-Gm-Message-State: AC+VfDzTKwEKlDorSZ+DeCHQ5Ws0NybHhAh0CE6mqirKafEm0ZaRABnK
	4QYuYo/X9dN8kSCIGz8bEvg=
X-Google-Smtp-Source: ACHHUZ68EkX8uWUYLnaeTCPg9KW76zCSKxPbjesOhvm3Uf4e0jK8An2oGQJJJQ2gVB6MRWG8RERtRA==
X-Received: by 2002:a1c:f704:0:b0:3f1:74bd:bc22 with SMTP id v4-20020a1cf704000000b003f174bdbc22mr8535282wmh.6.1685377860857;
        Mon, 29 May 2023 09:31:00 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id x15-20020a1c7c0f000000b003f4266965fbsm18306579wmc.5.2023.05.29.09.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 09:30:59 -0700 (PDT)
Message-ID: <634c155d-6c04-00a3-2e5b-618c36ec706f@gmail.com>
Date: Mon, 29 May 2023 18:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/5]
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 robh+dt@kernel.org, krzystof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pangutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wenst@chromium.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com, nfraprado@collabora.com, abailon@baylibre.com,
 amergnat@baylibre.com, khilman@baylibre.com
References: <20230529153532.3541327-1-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230529153532.3541327-1-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_093103_622751_85ED0489 
X-CRM114-Status: GOOD (  16.95  )
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

Hi Bernhard,

Please resend with a subject line for the cover letter.

Regards,
Matthias

On 29/05/2023 17:35, Bernhard Rosenkränzer wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add full LVTS support (MCU thermal domain + AP thermal domain) to MediaTek MT8192 SoC.
> Also, add Suspend and Resume support to LVTS Driver (all SoCs),
> and update the documentation that describes the Calibration Data Offsets.
> 
> Changelog:
>      v3 :
>          - Rebased :
>              base-commit: 6a3d37b4d885129561e1cef361216f00472f7d2e
>          - Fix issues in v2 pointed out by Nícolas F. R. A. Prado <nfraprado@collabora.com>:
>            Use filtered mode to make sure threshold interrupts are triggered,
>            protocol documentation, cosmetics
>          - I (bero@baylibre.com) will be taking care of this patchset
>            from now on, since Balsam has left BayLibre. Thanks for
>            getting it almost ready, Balsam!
> 
>      v2 :
>          - Based on top of thermal/linux-next :
>              base-commit: 7ac82227ee046f8234471de4c12a40b8c2d3ddcc
>          - Squash "add thermal zones and thermal nodes" and
>              "add temperature mitigation threshold" commits together to form
>              "arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones" commit.
>          - Add Suspend and Resume support to LVTS Driver.
>          - Update Calibration Data documentation.
>          - Fix calibration data offsets for mt8192
>              (Thanks to "Chen-Yu Tsai" and "Nícolas F. R. A. Prado").
>          https://lore.kernel.org/all/20230425133052.199767-1-bchihi@baylibre.com/
>          Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> 
>      v1 :
>          - The initial series "Add LVTS support for mt8192" :
>              "https://lore.kernel.org/all/20230307163413.143334-1-bchihi@baylibre.com/".
> 
> Balsam CHIHI (5):
>    dt-bindings: thermal: mediatek: Add LVTS thermal controller definition
>      for mt8192
>    thermal/drivers/mediatek/lvts_thermal: Add suspend and resume
>    thermal/drivers/mediatek/lvts_thermal: Add mt8192 support
>    arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones
>    thermal/drivers/mediatek/lvts_thermal: Update calibration data
>      documentation
> 
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 454 ++++++++++++++++++
>   drivers/thermal/mediatek/lvts_thermal.c       | 160 +++++-
>   .../thermal/mediatek,lvts-thermal.h           |  19 +
>   3 files changed, 631 insertions(+), 2 deletions(-)
> 
> base-commit: 6a3d37b4d885129561e1cef361216f00472f7d2e

