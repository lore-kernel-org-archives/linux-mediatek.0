Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC4AC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 12:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XQKcVJbCKdPNL3r284+FMGZ1NmD17SxEaB1YH/7mOI=; b=UaNxQQb6lW004Y7nSbAWx3u2Fr
	ivw7pL+kOwTGIKIOt2zOLRlmhUKK2XW4RxPb2rqPVGS8YyT/RxN7JRLrazaphRC+HcooufOagx3+J
	UhgQIbbESRegC0EMHqfrSyMawyXeWweY30QHOHGFIoboG0fXR4ABetmbAjFXxv4WtO14nje0l0YJQ
	C8vVOCIULHzq3WRJg2EXewRpohNLF+AENAyzgWHcCJ7nt/uFYcY3A3s9xFjEM8n1oefk3IuxBhupd
	vDYz60E9J2Sgtv2Y1PhySX3oIiqvH67ahv3nDoOhrr+pH3E9vdMasuWsx6w2jCkBStvYZCTGoUdcd
	N1tVIEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5Wb-00DBQI-Re; Mon, 21 Nov 2022 12:03:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5WQ-00DBLB-1V; Mon, 21 Nov 2022 12:03:35 +0000
Received: by mail-wr1-x433.google.com with SMTP id z4so4928671wrr.3;
        Mon, 21 Nov 2022 04:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5XQKcVJbCKdPNL3r284+FMGZ1NmD17SxEaB1YH/7mOI=;
        b=HS4vlJyCkWEfvsMOQSvAWS+nanJLMMyJYUkeOp9QiSi5pcTW25aPdUB4POvsIUg42S
         U2pw9eI2yOW3OJ0EDFEnKkYe3whh+ZB3hEdVMCoOg7gB+HkjsWWlcaNmC4emBztTdWMH
         Fs6yFRbnD1oeutuPcrsEa0gQeC41VuSb9lMiuBe4qH8iwnCnvVYXik3aOtGdKGEnpqyC
         HIma+9c42zoh9IyN7ATszGdxjlHsMqod7Vw/BIX9D8eKrL+h4xO3ucJqEYSPGaVubbV3
         3EHcHVkaTf57RWC20Zz/AeNtQGoX6LFcmsgVkxHBMIAg8c+oiXqsYk0I3Nvo2c9Z+/H9
         mlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5XQKcVJbCKdPNL3r284+FMGZ1NmD17SxEaB1YH/7mOI=;
        b=QjJqhjEogfBArKIoH9fOl6Dq1XFDVDC740jUP1LTd73UNRTCHeSXWFsXxzxxud5ux4
         KRM8aMIOWzvzGd4RopXF/oJ4SFmwjarMGSpP50aNKKywHUOk5J03u7SpanV9F0Ob4tkl
         hoK9e4iD8Iq7uCn/NMkXNm68tH3OFJcGvE0adwKd7p2MoCnYYYHqesELdrGSBKVJ7MHH
         gi0jPynEf61ZB18cgq9vbN3Ayl9qa05p48DEsBTKukGOoj+uAp6xRunvAouVzThqsBUO
         8xVxY6xLNIKS0yjSn6AlZ1gOi84Se+JuA96TYt9tvkuamNymOYTHd+J80uhrRDbmfks/
         y5SA==
X-Gm-Message-State: ANoB5plt1oikOuWkhGzrp5+Z70+4lkChF0QUOCoXsHQPxXxslR4zRn9L
	/HucpQyyK4h4Bbhwxdmv66M=
X-Google-Smtp-Source: AA0mqf47dsNMrYKK7mFgXn4kWq2UQ8QtuBdL10SrDfVoUPuHM0hhxm2Q3t5E/IRwQgQzWf+z0J0ydQ==
X-Received: by 2002:a05:6000:1181:b0:22e:53c0:ead8 with SMTP id g1-20020a056000118100b0022e53c0ead8mr10898826wrx.210.1669032210282;
        Mon, 21 Nov 2022 04:03:30 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z2-20020a1c4c02000000b003cfe1376f68sm13335036wmf.9.2022.11.21.04.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:03:28 -0800 (PST)
Message-ID: <89ceb49a-edfc-2d55-ebf5-cc5ff6d2d52f@gmail.com>
Date: Mon, 21 Nov 2022 13:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/8] ARM64 MediaTek devicetree fixes - Part 1
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sam.shih@mediatek.com, hanks.chen@mediatek.com, weiyi.lu@mediatek.com,
 zhiyong.tao@mediatek.com, andrew-sh.cheng@mediatek.com,
 viresh.kumar@linaro.org, chunfeng.yun@mediatek.com, fparent@baylibre.com,
 mars.cheng@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_040334_133526_FF4CBEC4 
X-CRM114-Status: GOOD (  11.84  )
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



On 13/10/2022 17:22, AngeloGioacchino Del Regno wrote:
> This series fixes devicetree warnings for some MediaTek DTs.
> 
> Since there's a lot to be done and since not all fixes are trivial,
> I decided to do this in more than one step, as to ease work for
> reviewers, maintainers and for .. me.
> This being part 1 means that there's more to come... a bit later :-)
> 
> AngeloGioacchino Del Regno (8):
>    arm64: dts: mt7896a: Fix unit_address_vs_reg warning for oscillator
>    arm64: dts: mt6779: Fix devicetree build warnings
>    arm64: dts: mt2712e: Fix unit_address_vs_reg warning for oscillators
>    arm64: dts: mt2712e: Fix unit address for pinctrl node
>    arm64: dts: mt2712-evb: Fix vproc fixed regulators unit names
>    arm64: dts: mt2712-evb: Fix usb vbus regulators unit names
>    arm64: dts: mediatek: pumpkin-common: Fix devicetree warnings
>    arm64: dts: mediatek: mt6797: Fix 26M oscillator unit name
> 

Whole series applied, thanks!


>   arch/arm64/boot/dts/mediatek/mt2712-evb.dts   | 12 +++++-----
>   arch/arm64/boot/dts/mediatek/mt2712e.dtsi     | 22 +++++++++----------
>   arch/arm64/boot/dts/mediatek/mt6779.dtsi      |  8 +++----
>   arch/arm64/boot/dts/mediatek/mt6797.dtsi      |  2 +-
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  2 +-
>   .../boot/dts/mediatek/pumpkin-common.dtsi     |  6 ++---
>   6 files changed, 26 insertions(+), 26 deletions(-)
> 

