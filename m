Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E68FC77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSYib968TlNgbrZtfYcfjByTNtcgxfB28BPrF3X4daM=; b=x3+ys8tmnp7sr5vqljuAwpZ3yq
	2y1l4fuxF+1ZzrUfaqY1DvZIKZl7yJRv7cUm5ZnczPENl0af2/jJC+JG3ipMnx01adCHiSvP1K4O+
	pwGQ7YR1lChGVSRTapNIGTZFOlk6yG6fVmH/+wb7g42INcwJmLtQQ+46RlOUJQ1GpkWyzcJUleC78
	Oktr3NuF/hF8KZixoxJhpJILuDV3iXpl1tFXm/IU0mW5QtpccZfgOaNAbirokdo25WPUIXYXJc5Q0
	nm4oq9HF7vRUWjABXKQX7NM0cFqjZTCE8bg5rdlht0Qq/tZGVsD1apJ0OyoE00xxWWo4P19SfKmF6
	4XSTsgXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZqH-003CGI-1G;
	Wed, 12 Apr 2023 12:44:53 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZqE-003CE2-2i;
	Wed, 12 Apr 2023 12:44:52 +0000
Received: by mail-wr1-x42c.google.com with SMTP id v27so1545923wra.13;
        Wed, 12 Apr 2023 05:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681303489; x=1683895489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KSYib968TlNgbrZtfYcfjByTNtcgxfB28BPrF3X4daM=;
        b=MY99ceA8wW7QbNZeJ/UhL0jrqb2PDV0XkIO8PiE1B8pXUXYSBVMcBHlchVBx3ZlKSI
         Trcl3JgQqyu1U7HJ74gMZWDscs3HoXaHyMQ735SDo9Fn5itRQ8EvLCVif5RzSRLu5zQ2
         O/6M7+H/ztv7xPbiwep43pFqwS3TIdB4EEzdGvVvqiLYbT6MXYWNQnITM8CmTbtX/okK
         Apf2oxWNTsasGFbHib6t1eqVM72eAnh0mbZ7vd68+8/MGhhAeJdPTebocQUPaTZOuYVu
         fEb4EO7BCR4mny4FfkJKgcvkUyaRXqDHu0Kcc33XmjHrkPBTPJCA9MC4hEmmkp3RJydb
         gBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681303489; x=1683895489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KSYib968TlNgbrZtfYcfjByTNtcgxfB28BPrF3X4daM=;
        b=25Jv/UwwEosbpoh/Bd0B7atjTpKLB0JHHjTOkPZL32xaNSi/QQcQRKqLzdu4vXPat+
         BpRQrV2+zyv+YMz5KpdyTVlfI3rAvZdne8y9PxPxo6YZcDUcLIjGDmgaXu+TtTQo1/jo
         QE4yre3Lvj/B13czJbeWIjwXWEsFMpP92udfOcD2RjdEMMEF7SQiBOT76H8uPaDWqHvI
         21d52H+wAOdWDpi+hjE/5fLonvY7KSERwatVqIAghGFtiCJIW/xUGV02s2zFrP/951ds
         hUxlF/e7JLTnZrkYS1Kf3uSFbXe9G3uPTZk4PdK+mQPxGH1cUk7mtPOQJgSXBQfRtIIs
         PuuQ==
X-Gm-Message-State: AAQBX9cKHVan0mwrct+NjuvboXtwbTqeVDL33m8tm/gin+wo6tXcM8gc
	Uk5hkrOs/+KwKuYGtTa2dfs=
X-Google-Smtp-Source: AKy350bqiWDrholWxeMJXdmA/F5ClDwfMvEqM4y0TIzuUBHgXU6/D61FCV64IYa31nkjoJetKcYdxQ==
X-Received: by 2002:adf:dc07:0:b0:2e2:730a:c7de with SMTP id t7-20020adfdc07000000b002e2730ac7demr10112945wri.24.1681303488999;
        Wed, 12 Apr 2023 05:44:48 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f13-20020a5d50cd000000b002c71b4d476asm17054089wrt.106.2023.04.12.05.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 05:44:48 -0700 (PDT)
Message-ID: <17cd35c1-aaa2-26d1-e372-06774e78514f@gmail.com>
Date: Wed, 12 Apr 2023 14:44:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 27/27] arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch
 BMM050 Magnetometer
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-28-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-28-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_054450_875579_A147C6D1 
X-CRM114-Status: GOOD (  14.18  )
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



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> This smartphone features a Bosch BMM050 Magnetometer on I2C3: enable
> it with the BMM150 binding, as that driver supports BMM050 as well.
> For this sensor, there is no interrupt pin;
> readings were validated in sysfs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied :)

> ---
>   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> index 0b0519f6b2f1..b5746e6d0b15 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> @@ -75,6 +75,11 @@ accelerometer@10 {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&accel_pins>;
>   	};
> +
> +	magnetometer@12 {
> +		compatible = "bosch,bmm150";
> +		reg = <0x12>;
> +	};
>   };
>   
>   &i2c2 {

