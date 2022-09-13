Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1582ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 16:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feABSJN9jpizOdnxJqE+tP/2w15qPXg0lbOz999CO18=; b=v3aGPgm+f3A4NVf9iWypbFlA/X
	iEyCx9zXXMESGg6+XKbnJSYkLdfqtWnppcBmf9otqljMcLNql9lFXqXt28yWuW647mKpgWgcsRXqo
	EHjsPIi2AJnHW6elhw+8yBdXX94z9CK5QAODveXFjFykdcKaMKZ5T0wKDUlaeSpnvjBR0TreOhZ3S
	yV2ry9LdM1dXJAruIsD7Z5+JqIorr00h+Sx/mnLXbDiE6VCnPWJuWNB6S8Nw+RNqnlRcW7nZKQaFK
	Zns0jabfh3xCqb+hA2W3nreJBIkRUqmkMMwW7emgiSzt0nM8Xok+j95NauJoyU/0BhishxFs7DGQR
	yO2Mhvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8mt-00DKNh-Bk; Tue, 13 Sep 2022 16:29:27 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8mP-00DJsj-Ap; Tue, 13 Sep 2022 16:28:58 +0000
Received: by mail-wr1-x436.google.com with SMTP id e16so21679000wrx.7;
        Tue, 13 Sep 2022 09:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=feABSJN9jpizOdnxJqE+tP/2w15qPXg0lbOz999CO18=;
        b=XGKT34MSDxeBpVcSFtMIZtXOTkr3LqymTjtxWqRpgA1FnKflx9nfgU24xXIxJbPTan
         KTDSeo0I+gKbLPN/iPMwbWBWVk2SDsRXvzFRXePtDNmixbNf8Yt30dvvIKpgoA0aBvxq
         UNT4uQer7wSvzhu/WQoLab3MtzMaJ1wDvQf1HVX9xoS+C62K+xbZALou004TJTbh1my/
         uUhcDwm7DJUhqcWdPJpee8miIyQiawJdSUSEf/hAHbcBAjAR+JGb/2sagjislWbyuiW4
         /ikSpmAldYljm6CohArw06FXMDdMWGgD1cjGbU8oLSOOX78Zaqe5nSc/FcZUBKZUZRDS
         UGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=feABSJN9jpizOdnxJqE+tP/2w15qPXg0lbOz999CO18=;
        b=YVpMnStatuEkgJ129Q2kz2Tk5T593GAulLqdOJM5nx5NAuzQwlTRM85kc3lQd+INl1
         H8IA/+p+2MzSOXzurc4pWaXHhhNbVdFwbPUY6FBGxphDI0DMRDok+VbJSSihIStzfaoY
         HVTu84lu9tYD/BvEmevMnty/y4ctVeurtS/9yybkuVte7HATzz+DHEDxvYy+rIqsa0tD
         PQDV+subTv2OeNHaTJm7GRNjyTdwSfudPFeE2yvD7+yedMHPV9j/4qeVo8c27nD2Fku0
         +nfsK0nDEJL2qr5ZKlS3WDUPQh2aKKGiG8uzlElqIjfuxf0efmVkgxjjeKeWkkc1Nv1c
         E/Kg==
X-Gm-Message-State: ACgBeo2Oo0SLgoST/JFZEbSXBch9vlBYkoFEn8pvubRgcr7xd6GQXs6g
	uVzkNVTOAdcdNufqOUij3YE=
X-Google-Smtp-Source: AA6agR6l4NvWXOFt/iyhGaqbS5S4G5XjDHsBhqS+mN041t/T9rGzhMiNbnnD9Lmg/uKdn4P+PReJMg==
X-Received: by 2002:a5d:6dac:0:b0:227:41e9:e00d with SMTP id u12-20020a5d6dac000000b0022741e9e00dmr18356009wrs.643.1663086534923;
        Tue, 13 Sep 2022 09:28:54 -0700 (PDT)
Received: from [192.168.0.30] ([47.62.125.55])
        by smtp.gmail.com with ESMTPSA id x14-20020a5d60ce000000b0022862fd933asm10853505wrt.96.2022.09.13.09.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 09:28:53 -0700 (PDT)
Message-ID: <d9f08c83-6742-ed89-3963-f518f33e4df7@gmail.com>
Date: Tue, 13 Sep 2022 18:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 0/7] MT8195 Acer Tomato - devicetrees Part 2
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, wenst@chromium.org
References: <20220902081156.38526-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220902081156.38526-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_092857_611000_B24F2721 
X-CRM114-Status: GOOD (  17.17  )
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



On 02/09/2022 10:11, AngeloGioacchino Del Regno wrote:
> This series enables more functionality on the MT8195 Tomato Chromebooks,
> bringing it to an almost usable state.
> 
> With this series, the device is able to boot from the MicroSD card
> and is able to communicate with the EC for various functions,
> including the enablement of the Chromebook's keyboard, battery
> charging, fuel gauge and other standard ChromeOS EC functionality.
> 
> This also enables the Audio DSP, codec and sound card and adds support
> for the regulators found on the SPMI bus.
> 

Whole series applied.

Thanks!

> What's missing (coming in the next part)?
> 
> * Format:    feature  (location)
> *
> * MediaTek vcodec enc/dec (mt8195.dtsi only)
> * PCI-Express WiFi card (mt8195 and mt8195-cherry)
> * VDOSYS1 (mt8195.dtsi and mediatek-drm/mmsys drivers)
> * DP/eDP outputs for external/internal display (mt8195 and mt8195-cherry)
> * LVTS Thermal Sensors (mt8195.dtsi, driver is missing)
> * GPU support (comes later, clocks implementation is in the works)
> * Audio/ADSP support (waiting on SOF OF commits)
> 
> Changes in v3:
>   - Commonized pin definitions for secondary SD/MMC controller
>   - Added firmware-name for SCP
>   - Changed keyboard backlight to google,cros-kbd-led-backlight
> 
> AngeloGioacchino Del Regno (7):
>    arm64: dts: mediatek: cherry: Enable the System Companion Processor
>    arm64: dts: mediatek: cherry: Wire up the ChromeOS Embedded Controller
>    arm64: dts: mediatek: cherry: Add Google Security Chip (GSC) TPM
>    arm64: dts: mediatek: cherry: Add keyboard mapping for the top row
>    arm64: dts: mediatek: cherry: Enable secondary SD/MMC controller
>    arm64: dts: mediatek: cherry: Enable Elantech eKTH3000 i2c trackpad
>    arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus
> 
>   .../boot/dts/mediatek/mt8195-cherry.dtsi      | 256 ++++++++++++++++++
>   1 file changed, 256 insertions(+)
> 

