Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C1AC74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 07:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjz4YY6475MDr5O8cC77sTPGv7vBqMb5/BBOLn/SVfo=; b=xxrTDHDMPYYjJ0QBu0FGixzDPg
	ItTn5235EdzvOvDi01yyTKEAb9BW8My5MQ7/j1uDEwMlast+Aumt0W1mUgc94Zqmxz9J6Gz/362sc
	jQR2b6Q9vLXQLRqPYv694ixJ/VTTJQjJ/cztaPIZgVW4vM2WQvR+WZBDNOSajjSWK+zwykcfdU30W
	dxDJESjwD/xxbolddZuQ4x/9GyUVV5K60U1+9Bm7TM644e8L9gsSEKp1LJm1F/himCormFXHqXeeM
	64ITnM60v37+Q7dWRIiPkuvp3UWKZLMRa/RivXlMNIvO91uAX7q6uvXEEaSRonmUyX641en5NMf5o
	cz7ESDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phPzn-00GseN-14;
	Wed, 29 Mar 2023 07:13:23 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phPzj-00Gscb-0G
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 07:13:21 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 20so15097299lju.0
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 00:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680073997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjz4YY6475MDr5O8cC77sTPGv7vBqMb5/BBOLn/SVfo=;
        b=MRtmY6Sh0Urs9hIQEFX25PAVvlSXcMe+uCuWyT0FSHfRII2WE6jEemrt3H/G97TI8g
         UaO0l6ZMoo4Dw0W8Bu2wDUhT68ebAGzQn5ud84/RJC26Q5aHkW443xy9ifd/mJ22N7Ex
         vkRgCmSLtUp+BKq/Jo78BLRkrH2a77RS4aD/NOWUkBeAQ6RXWQTWqxIoJewmPI8+mjuo
         B07ke0nHNqkz99Lw+Z5uVD2NkIxAH8CgjxW21q3pDMuXgofb9yox5n5IkvSHPTUvqdzO
         T4ypTATDANkBPDFLxe0SzFMnsOOrl/ZEp0Ud0aiJGqas5o3aHapXgjglf5kpIn2/Ex+o
         YI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680073997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjz4YY6475MDr5O8cC77sTPGv7vBqMb5/BBOLn/SVfo=;
        b=Tb2dXXKK4CxOZJ4nfKrNMcpcNm0VBK7K64ldJX1aQYNbdqB8E1vAeJXz5mDYC/l6PX
         N5o4PjBdjLgUVfKAyvTtjVBMKyboOKtc647Io/cF4jnIe53gfNsmpZZDOymBI1W3EIvO
         /rhfDuI5Yo9k3pYUGmO4yPdK8gEVwQcYlJiuptnYGq3Xv2FMwZ98aiseOi//n0w+wZu9
         /DYHNWPescVjqWs28u3Bkwq1ZWgPvJiZ8Ia0VoPjGhy+o7nUQZ9sku50b+vHIGG+7T7l
         +NFc3hJNu8MtIsEC2cLlTiSI35x2cIWhYfeJyOkoMgk96+WJeut22/KXS4UIPpoPp2/w
         GJGA==
X-Gm-Message-State: AAQBX9d3R5bjG4B6IceNRIafWsRHEzPmrlM0NuJMC37Fw94Ra7XsqZq1
	6Gxtlgo0zMikjzI4/CJoz6emSw==
X-Google-Smtp-Source: AKy350Z3U5ebYnTlRO47AoMVt8i3K/fuetG/Bfiu2U0Js/vspmuVMfQmnKLBM1VvfiYcYbjVFKhcKw==
X-Received: by 2002:a2e:9d0c:0:b0:29e:4fa5:1708 with SMTP id t12-20020a2e9d0c000000b0029e4fa51708mr5731177lji.3.1680073996921;
        Wed, 29 Mar 2023 00:13:16 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x26-20020a2e9dda000000b0029bd4365c95sm4697519ljj.87.2023.03.29.00.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 00:13:16 -0700 (PDT)
Message-ID: <6e1f4885-e8b9-8031-c25f-a9b18c187e56@linaro.org>
Date: Wed, 29 Mar 2023 09:13:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/16] spi: mtk-pmif: Drop of_match_ptr for ID table
To: Stephen Boyd <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Andi Shyti <andi@etezian.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
 <20230310222857.315629-2-krzysztof.kozlowski@linaro.org>
 <7e58e5c86bd602932b762f9364209e31.sboyd@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7e58e5c86bd602932b762f9364209e31.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_001319_121301_67323FE9 
X-CRM114-Status: GOOD (  11.46  )
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

On 29/03/2023 06:17, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2023-03-10 14:28:43)
>> The driver can match only via the DT table so the table should be always
>> used and the of_match_ptr does not have any sense (this also allows ACPI
>> matching via PRP0001, even though it is not relevant here).
>>
>>   drivers/spmi/spmi-mtk-pmif.c:517:34: error: ‘mtk_spmi_match_table’ defined but not used [-Werror=unused-const-variable=]
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> I'll fix the subject.
> 
> Applied to spmi-next

Thanks. Apologies for the typo in the subject.

Best regards,
Krzysztof


