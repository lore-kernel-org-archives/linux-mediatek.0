Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE67C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywYOZ5xavYpSTwwK3MKmIMTU02VHQ/B9GtHWgy6KTX8=; b=ytkbPaPwfM0AqcijiUkwhQHKf1
	sqDD89a4s9GVUoClS44aNh7Z2RdcyP/Pg3uJjAwJXMQ0OlmlEA9aHE9C60yJNIBxj/VSpYp5pmMWb
	Rm9YsAWEbh6/WNL93CldXzz0KUYmaKahTWPaAqWF+AEfjBRcPAQSc2d3spyvQX0nZ1r2MX47WW0Cr
	j08SfAFNA6BqVfJIjlgzbADJD4fZu8svgZlawTeI7Y27Vi/1XQri29zkFChbEemx33L4zpY9XLs6R
	FQBJl666PpksT//DKVzs3oQMvu995QlrjmRGm/lFnN5efTbzq5RgzrIss67xkmQuqWkA0zcf/rt0P
	t0VS9c4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbyOP-009Div-S1; Tue, 14 Mar 2023 06:44:18 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbyOI-009Dei-4U
	for linux-mediatek@lists.infradead.org; Tue, 14 Mar 2023 06:44:11 +0000
Received: by mail-ed1-x536.google.com with SMTP id da10so57900640edb.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Mar 2023 23:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678776246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ywYOZ5xavYpSTwwK3MKmIMTU02VHQ/B9GtHWgy6KTX8=;
        b=uXHuxUk4Ph5GaJtGImjU5sOLPpUpmyg+IeXbihQoUaQvNqXPZZ/sm4Q2Vxj6ib+3/2
         1fva5zlyckAvafDJSuPIDw4St4PqkNptcTg4nFNZi2/UoQNCCQ3lMykAClp4djHY2/Fi
         1lp4qsiP44ansKGJjjON4ooAibBFH027xwBgnU9EDCPCSg9Hb8br9zVPx+TGJ6iUAhf5
         quMWLMl3P+NGzQqETsicJKBo70LvQBFTp5zVUhG9laNfPWbwxob1W68n3PMaSpgZFXNJ
         M0D4UIbfYpYe0HKOe3RZTPpme1zJ5nmlfKF6tFr83YteoKtKE2W2hkMDiE676jPR9iN4
         qY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678776246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ywYOZ5xavYpSTwwK3MKmIMTU02VHQ/B9GtHWgy6KTX8=;
        b=m2Kms5f7xIUpWcKiLZjlDssSB58tImjZvo6hRUH2iTdwiAZhqD4CG55ZZ6l2TWYQ3E
         AdmAWrhqYOvMJ9RUq9mdeKMGFRQkY5M6FoVjZTMsVyOrHU2gk0AXtziD42pixiwvY9z/
         Iw0xoB0jYmL2QE0cypoi6nQsos8u6v+5f5JKZ5Rspcpm5e0zu4f/vxEH7we2+3bYGIqT
         jPVO5i7qDt/48ByiVj50qlP4IPRHXYAxCiiUeKzB8S6fQ1MGCGc41hyIdhYQFqxD6+mz
         MLL6zJDRSRzDtCchkpI1t9WkUJ3S1bf9UHo4/iEkvMPJyAyPM51C3wUUNI134NQ3hpvs
         mB3Q==
X-Gm-Message-State: AO0yUKWVYPuhGuZSWEw4ahtlm3yWrVZoEMnDSwr6TA3gmcnCVnRjp+05
	4BOyh0RcEftLHGrePK06lfZsNQ==
X-Google-Smtp-Source: AK7set/lGrzwqGMnZcc9hOtrqzElAVLxHouwR7z35GXn+LIVsVf8yT4Tu11j95hcquGFYNTL6/qGJQ==
X-Received: by 2002:aa7:dbca:0:b0:4af:7bdc:188e with SMTP id v10-20020aa7dbca000000b004af7bdc188emr14135915edt.16.1678776246217;
        Mon, 13 Mar 2023 23:44:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6932:5570:6254:9edd? ([2a02:810d:15c0:828:6932:5570:6254:9edd])
        by smtp.gmail.com with ESMTPSA id y97-20020a50bb6a000000b004c19f1891fasm521575ede.59.2023.03.13.23.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 23:44:05 -0700 (PDT)
Message-ID: <ed293caf-e787-a29e-f1c5-bdcaf1aa483a@linaro.org>
Date: Tue, 14 Mar 2023 07:44:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/16] spi: armada-3700: Drop of_match_ptr for ID table
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
 <08e98d1d-e79b-fe7e-0d59-827f72277fc5@linaro.org>
 <9bf3dd37-71c2-4118-a8da-40e656b42d10@sirena.org.uk>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9bf3dd37-71c2-4118-a8da-40e656b42d10@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_234410_279064_AD664294 
X-CRM114-Status: GOOD (  22.72  )
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

On 13/03/2023 20:22, Mark Brown wrote:
> On Mon, Mar 13, 2023 at 07:39:45PM +0100, Krzysztof Kozlowski wrote:
>> On 13/03/2023 14:55, Mark Brown wrote:
>>> On Fri, Mar 10, 2023 at 11:28:42PM +0100, Krzysztof Kozlowski wrote:
> 
>>>>   drivers/spi/spi-armada-3700.c:807:34: error: ‘a3700_spi_dt_ids’ defined but not used [-Werror=unused-const-variable=]
> 
>>> It would be much better to fix of_match_ptr() and/or the module stuff
>>> that also references the match table here.
> 
>> Why? The recommendation is in general not to use of_match_ptr, because
>> there are little benefits but it disables matching via PRP0001. Jonathan
>> in parallel thread explicitly said of_match_ptr should disappear and he
>> is not accepting any new code with it. And in general he is right.
> 
> If that's the case then why are you adding maybe unused annotations for
> half the drivers rather than removing their of_match_ptr() usages?
> There doesn't seem to be any logic here, it's just randomly making
> changes as far as I can tell.

These are not random but depend on whether OF is the only matching
method or one of few. Although for IIO all of my patches would be
dropping the of_match_ptr... For some cases in other patchsets I added
__maybe_unused also because of_match_node(), when the table is not used
in driver of_match_table.

> 
> The PRP0001 stuff isn't an issue, of_match_ptr() can just be changed to
> do the right thing for CONFIG_ACPI.

That's actually interesting idea, kind of obvious so I wonder why it
wasn't done like this in the first place in 886ca88be6b3 ("ACPI / bus:
Respect PRP0001 when retrieving device match data"). Maybe not to
populate OF device ID tables for the ACPI systems which do not care
about PRP0001?


>  It doesn't buy us huge amounts but
> it also costs us very little and may be useful in future.  When there's
> missing annotations it's not causing issues for practical configurations
> as far as I can tell, and if the macro were updated for CONFIG_ACPI it'd
> be even less of an issue.

Best regards,
Krzysztof


