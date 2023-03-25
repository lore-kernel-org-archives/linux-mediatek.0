Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D01C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Mar 2023 11:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lV1rN1wo2nRvAaYZdkTrOyIvGW+U6VCRJq/I81taaAs=; b=hg0v0VJitu/LIOwdNK4QODSWA6
	4yMbHR3AqrpGqr0NP4X5aUD2CmVgJ561O2KeZ9ga90xtTR0rzOWZWTCKcXtiA95lnRczeDv2YHa2q
	GwUgg3g+5NS1h/5SrDEyznTnotdAjJModQQymHFwH3yufInfHslgeSUvjMlq0vCcuXLcsJMwIOLtI
	33s1ssuTBnDkfVuTavXUIY9nStIj1AYBMwxN34aru7KhTChvDA3X3iTb3lcbZh5hdLb5kJRx7eT+3
	c86L3mtRdqQQmL4IgYKvFNkFD+QfpxSjiJuBPKPiwMnEIEyU6owBraeJKOcOG0jk9ZPOT6tf52BvA
	DoOiibQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg1ns-006a20-0I;
	Sat, 25 Mar 2023 11:11:20 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pg1no-006a14-2k
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Mar 2023 11:11:18 +0000
Received: by mail-ed1-x530.google.com with SMTP id h8so17334769ede.8
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Mar 2023 04:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679742674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lV1rN1wo2nRvAaYZdkTrOyIvGW+U6VCRJq/I81taaAs=;
        b=u8pAzvSNyQOfu/k+Wa7LHyQPVT2Db4PS1oVigeauzeXlkidjTWyuJMR5qGv7CdnL9L
         T6e6kOVVbXuKNRtbG3DqdEthhneYNCrORCPZBP4Hn8iCiz+5w0Xo70VxcuXbc+1A8aO8
         NyBYo5W1AR1xUMhh/oXNc2iRAZEtSdLqoZKg9qpLE7uSv7YipYMq0VQ3TuOadJCIQczf
         BshrbnzxWSMy3+THqWRstUa8++0b0nTbOp7LtmSr8u2ZkQEhlC63tNWccUd7NazsLdRz
         q64/MD3SsWU/kb+6rTSbvvKgz0p8XF8ekvxVlsEcQ9k2ZTAKxu1DXhTC7EXp9HI63h2M
         8R0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lV1rN1wo2nRvAaYZdkTrOyIvGW+U6VCRJq/I81taaAs=;
        b=AC+/gnWN8Kobo1vPuuzArxai6w1DyXYjyKUQLiMKNzMk8KnxKpPwlnB/DHnIRYiySz
         98LfTvw17fvxi9u3rxH9lOdBwEyggkugHa1mafNNpcza0klq8w5/3haxHOiPrst6yjK4
         qW3nOVoXtdUcJXBuoL6MenB6Kl33f/HouXE3h0sdcd45t3CsvWN3SdiVn58ixrHGDvV8
         PPAYgROFgG+75wjzrWlI89Q5QaY5NBN52b5B8k5lmFNlDX4fL3OTqbncjr1WgICZDFrG
         FbOe64PvjqHPjgjqP8wTQHgUjYhKTXyezWekeMAbVpRB+LU0z9RLNeG8B20TnKLHq72M
         YMMA==
X-Gm-Message-State: AAQBX9dqHfgPE0RKwYI9kL2rtHiaWnymH+VATbZcuHmdbEdb+lf/F8ms
	EVorOn5E4b7LaDYv6CPQOD+NLA==
X-Google-Smtp-Source: AKy350ZYdSBcRBYiIJQzjnskMU+XdPaRhHfBGxv/yx5cWwiqBHUiNFoQLxPIHqYNeUu4uxUxNT2A8Q==
X-Received: by 2002:aa7:d658:0:b0:4bc:f925:5dbe with SMTP id v24-20020aa7d658000000b004bcf9255dbemr5679118edr.42.1679742674721;
        Sat, 25 Mar 2023 04:11:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id a13-20020a509e8d000000b00501d73cfc86sm7043075edf.9.2023.03.25.04.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:11:14 -0700 (PDT)
Message-ID: <9b2280fc-4619-d748-cb79-eae11a767549@linaro.org>
Date: Sat, 25 Mar 2023 12:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 04/18] dt-bindings: i2c: i2c-mt65xx: Add compatible for
 MT6795 Helio X10
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
 houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
 <20230324175456.219954-5-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324175456.219954-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_041116_909655_C4307F92 
X-CRM114-Status: UNSURE (   7.63  )
X-CRM114-Notice: Please train this message.
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

On 24/03/2023 18:54, AngeloGioacchino Del Regno wrote:
> The MT6795 SoC uses the same I2C controller parameters as MT8173:
> add a new compatible string for it.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


