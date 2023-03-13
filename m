Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EA6C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 18:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zExCwPnErlKajEOP0iCBdbzhLSrwamo47isrOodA8E=; b=o55KMRHeiYvUEjojitbS3hWjol
	ZNjH79c/zf4Q0QPmCIi9ogk7wFcH24RTR6GqpXeInyYQbRNoJJuUJB6aLEkgvx4DcfVG7K/NoF4GX
	MDknIFeOPBW966ffk5r2ClszJb1eLpK2vSFD/VIZEIJ/OMA2GgwkRV8YcLy1K2nqZzaRpGnpxsoRa
	gn7/xt643KzkK8byczeZ461shiZDSbYXlTpgq1LEWfYEjHVcSZJtbQfiiHpBvw/9LyiBQc/NgYbCX
	Yb8oEc8SFfvKXKh+Ek+Elf1rzPbuZXkgGeVIo3r/1cKHlQc9iPSwDNM78aE5PDE9WhJFOgoCHV90s
	tA55khsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbn5T-007Kks-3W; Mon, 13 Mar 2023 18:39:59 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbn5O-007KhD-Qk
	for linux-mediatek@lists.infradead.org; Mon, 13 Mar 2023 18:39:56 +0000
Received: by mail-ed1-x52f.google.com with SMTP id h8so8800782ede.8
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Mar 2023 11:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678732787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9zExCwPnErlKajEOP0iCBdbzhLSrwamo47isrOodA8E=;
        b=uIeD7q3LNKkRWYZ9x8e/DAt+K6iRlUftQBydBEx4UHpvBDJR0suSy6kKS6TldE9c34
         SmKeIpWFcWo2C4Q8oCZBpXd9MrPJICfDSlUXHnSWoW9QBQCzXO5kW1+Rc0/OzP7YdHjr
         YpKt/FL3vDjk59/IKcM3Hjl0tBFQXWnZfqUBKEkQplyCg9nu7co6+ODh1oOaxYAjiqhu
         oVN62b79jjOSFMcBGMCdjJVHqf4qucXnYktTu9HEOlEs5cv3IKf2DHByIFn2kf4CFeMG
         rqUkBqFdPK7U7r5Tw10fD7v2Zb+cJdcd3N7no0lHMaGkFh8m+9+A3aLpKVdabeeaNxqM
         ZFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678732787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9zExCwPnErlKajEOP0iCBdbzhLSrwamo47isrOodA8E=;
        b=L/fd23qfAvwJYitpN/1f+ctyCMU5gsZvg2ydkiWTbvryIuuU12OzyzPKULaUUdyzaw
         RH8FGAkHWqBeIS9NdWGScAkOCLqqrI2ZSWzsX8tjDo59tGBWPDZm4wbciiO3nEJEZik/
         yJ7jyyVRyvXIX0yyic6KE5HsUQNkUbQvV7KHLAe+sabuoz55jQNKtPQaei9hF2hZzrZy
         hM7y48NFKroM1QcFgJy6GVO2pUqG9wnVLRCqyaAjlNJlz68nDUkZ2LWsvawduH6Az6VP
         SP2aN/9J1/uw5VxBZLD64KyT0KWE+XdWiqkGvJT8y+uWNNiJPIsWpS+ZvZX9CDhX/glP
         2A7A==
X-Gm-Message-State: AO0yUKUwqcROW2/2rf1NEHX/6/bEdY0E7zsJfrG23GLmLJ3lpgwoskif
	098gijYcQPNvpqWlemLxGgrxiA==
X-Google-Smtp-Source: AK7set81xBbnSqYRHnX0F1ox3kM2TNm7ygVSDDdDqZIaM3C2UJ2RgnK9MzZ5m7B9CkB5dN74bv4LDw==
X-Received: by 2002:a17:906:178f:b0:878:72d0:2817 with SMTP id t15-20020a170906178f00b0087872d02817mr33528937eje.29.1678732787544;
        Mon, 13 Mar 2023 11:39:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:69db:4882:d071:27c4? ([2a02:810d:15c0:828:69db:4882:d071:27c4])
        by smtp.gmail.com with ESMTPSA id c37-20020a509fa8000000b004fb17f10326sm133916edf.10.2023.03.13.11.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 11:39:47 -0700 (PDT)
Message-ID: <08e98d1d-e79b-fe7e-0d59-827f72277fc5@linaro.org>
Date: Mon, 13 Mar 2023 19:39:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/16] spi: armada-3700: Drop of_match_ptr for ID table
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>,
 Andi Shyti <andi@etezian.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
 <7a65d775-cf07-4393-8b10-2cef4d5266ab@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7a65d775-cf07-4393-8b10-2cef4d5266ab@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_113954_968158_7145222D 
X-CRM114-Status: GOOD (  13.51  )
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

On 13/03/2023 14:55, Mark Brown wrote:
> On Fri, Mar 10, 2023 at 11:28:42PM +0100, Krzysztof Kozlowski wrote:
>> The driver can match only via the DT table so the table should be always
>> used and the of_match_ptr does not have any sense (this also allows ACPI
>> matching via PRP0001, even though it is not relevant here).
>>
>>   drivers/spi/spi-armada-3700.c:807:34: error: ‘a3700_spi_dt_ids’ defined but not used [-Werror=unused-const-variable=]
> 
> It would be much better to fix of_match_ptr() and/or the module stuff
> that also references the match table here.

Why? The recommendation is in general not to use of_match_ptr, because
there are little benefits but it disables matching via PRP0001. Jonathan
in parallel thread explicitly said of_match_ptr should disappear and he
is not accepting any new code with it. And in general he is right.

https://lore.kernel.org/all/20230311183534.1d0dfd64@jic23-huawei/

and earlier:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=444f5f854b35

Best regards,
Krzysztof


