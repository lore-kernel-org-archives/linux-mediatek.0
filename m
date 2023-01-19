Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D11C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 11:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWQf2TFUhuWnAtSN5Oiw58HXBV+drD5QeE/qkk75i94=; b=lH/PhNmHFDawcMIlPE6kxlXKAf
	RvfR4e096uRuHc0Yttv35kOhXXGJSvmpIRzuFMRZ+KC9ieabpWmhfyiVRSiM1WdR5GpfXO+tvDb+X
	6n5rWr+bHgNrL1iM/ADLdCN2wtWJj+z14NpxlBaouE55jKwKWixM2KRLYKMXtROxn+N6pY0lTZTnN
	g1Y6vclZiACVCYDMzt9W5wIWsPE3IitVqUnNSz7vOBhH9mdKOg2WTZ+8afz9ifYyV0XyoqvPLhwNI
	VysXJubT7g/u96GsZq4dbFCTfw6R63R2udmMlxY2GoIqOXEsPYmt3WFco9BzCAqkxjNLal48hlv/X
	o0Yft25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pISs2-004YXW-SP; Thu, 19 Jan 2023 11:14:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pISrz-004YWd-Tu
	for linux-mediatek@lists.infradead.org; Thu, 19 Jan 2023 11:14:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id r9so1508154wrw.4
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jan 2023 03:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rWQf2TFUhuWnAtSN5Oiw58HXBV+drD5QeE/qkk75i94=;
        b=bgtbWPjfqqb4T0zb5meTH1JYPl8eLqoBSihVQ5iSIOAKMzopmezZSow2cG5cE4ZgSB
         Ev5XtwXhdtFF9rLE9C3MYQIWjGqf7lsJ4M4is+xTEKi6ixR/nQuJmM5Uw7XxUJY9AU/3
         G6Z+cH5x1dcuPAa/mxyTMYdq4/o49D1sy0XRQ3b4Tngf4FPNyjpbO/95U7i3tOWr9mmh
         bQaPx5b8SepR89e2yMMVBbqn2L9LJ5D/X0VZ0hHeSodPVd5cBMpVRFf0HeX6dR/FIOiS
         2R3hE0lhcYlaAYBLLUw+kg7chc9SdkQ6tifD0ZVC33uZmp3JPi5Keco335II17q7VAs0
         fxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWQf2TFUhuWnAtSN5Oiw58HXBV+drD5QeE/qkk75i94=;
        b=nj/0IDfSMK7wGa1CEcR1F+P3IMckkZCym5oHGHGswFaMGN6KdakFTC6u79pue+55CT
         Hb5c2+ioM4/ANagYWAviXfwXTkBK1ga4VIHoZvkRVUhdxTwQpxX0g8w1RJBYYpAD01ew
         MxbZ7WceNDZRl3LLOj116tln4A0UxICvODKqIOrhi+PnsqdoJ5tsUBXhtAAP9SACR6fH
         NGN/YYnOfqmBtwcsTUhFWrN+rvwcTFEw0Hc7K+Ji2YQKTHq4nYLz9s0f4DTImqpZi401
         RWvB5YsTv5AmzMEUsoFV4UatIqYfE2iyNb9scJETyN8u9PqvdVzDzdFpxv7LsEiWYD61
         F1mw==
X-Gm-Message-State: AFqh2kqC03UidjYBIjyMPoEnvlk5EPFg1sAmsMj0rAviHe6w9lxXwT0n
	eIBGTICNqM67vOyI6FeHCUf0sw==
X-Google-Smtp-Source: AMrXdXuxD3W/9db9SL+yOUMNCb+67nqBttWmQ6K8aQb2t9v/o0u90zsQZIAoaID3CgFIaX5A/KgbTg==
X-Received: by 2002:a5d:4e04:0:b0:2bb:31dc:2d62 with SMTP id p4-20020a5d4e04000000b002bb31dc2d62mr8497695wrt.67.1674126846711;
        Thu, 19 Jan 2023 03:14:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m5-20020adfe0c5000000b002bdfe3aca17sm11143937wri.51.2023.01.19.03.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 03:14:05 -0800 (PST)
Message-ID: <821fc151-260b-f248-8d68-40e85ae5e031@linaro.org>
Date: Thu, 19 Jan 2023 12:14:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v6 1/4] dt-bindings: arm: mediatek: migrate MT8195
 vppsys0/1 to mtk-mmsys driver
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230118031509.29834-1-moudy.ho@mediatek.com>
 <20230118031509.29834-2-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118031509.29834-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_031412_051139_7E9189AB 
X-CRM114-Status: GOOD (  10.02  )
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

On 18/01/2023 04:15, Moudy Ho wrote:
> MT8195 VPPSYS 0/1 should be probed from mtk-mmsys driver to
> populate device by platform_device_register_data then start
> its own clock driver.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,mt8195-clock.yaml      | 16 ----------------
>  1 file changed, 16 deletions(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


