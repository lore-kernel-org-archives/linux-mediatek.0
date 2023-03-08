Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273FCC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 10:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4h2FY+X2SHJL5D/w63hFPZQVBBm0zbY0tUXPSa+dEU=; b=B3HXL4cL5c1DGVkn0Xg3MeILhF
	W4MmY8ENOX0eTgQbOeTQ9Z1g9y6uHORetkq94fMPe0bwLkDlIPl+XOq9AcNKG4sIab2pX+sR8kKz2
	2Zf4fqDWWYEQ1vmNoGY798TU7njHAavd3ZDL5Jwnvy0QmNQjvGXWjH7608Tr36wn6c559S8e3m/w3
	+kUnxMz93/ONRJGWY6YyJmw6VJGsd0Rec4lgtg0ac+eR5iqKM/24V9dbJ9VvdjFTZaIFS46JiLCFD
	stmrnoJIObpCu7OfuoGQtkDjpPe8IDw2HCVz99eP6KkEWZ0HzRcXVcjjLITGcCPBXFU24ptksmAbI
	/ePg59pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZrSV-004Tnq-Qk; Wed, 08 Mar 2023 10:55:47 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZrSL-004Tld-FA
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 10:55:38 +0000
Received: by mail-ed1-x52c.google.com with SMTP id o12so63944673edb.9
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 02:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678272935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4h2FY+X2SHJL5D/w63hFPZQVBBm0zbY0tUXPSa+dEU=;
        b=J+dLbTIne4bumfpOBr7e9LqYt+Wa+Z9T0zBInXT0GSS0qlSmlpiUYrmb9lHXgkj1BB
         ULUVqNV86biaEGn0lEdoahVFuHrqTyHZ6uIWcP1Se+iMJRIwWxB/TRZ05Yizj0GWM7np
         ICOGLEhdjgIFHHhdWVFGBEa31/z0C2RFBRZutfST+r5l7n8ckq6SBauls1hVD24sg6IE
         khUr+D/zpRwXVLum7KxqdJHoP+ISB3nVXd8bXCPRqnR8rrbxqA/8ea6Tq3LBxDS0FqhY
         5lBThWrCO3i+XlD98BL971vYS41YaECzX3vk0O/VBEkGvPofNT0wFiAYjzZ36RahNcM4
         dg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678272935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4h2FY+X2SHJL5D/w63hFPZQVBBm0zbY0tUXPSa+dEU=;
        b=1nr6JBOFdDG5O8ywohVgxbY0cEDWwir1zJQpxl6d13x3isE5bdKWbKtEKnIh7K2ncw
         A9+emdGSjwTBWcqylqx+WGPbZYiixrsS6i2e2NnWtQXEEzqshwdfjspiJy19hqSpUs7l
         pndi5PwO4fLSfU/APOR1UWiAiVBYUkD/wICz6fIWVKwvoxJeuLG0mCvBqSrNYzyiuAKb
         lX3RmJ3I6qT9l2YBXaLOZBewbxA49EbGvCH/gk0vPnuKUYz+y/3uhZqHEBquKacxm3A6
         XaSIcp9oJ/Gqtvlo0GXuehWYcrFEQR726H90RhyUEtHd+oxv82QsSdpMSpIWCageuufA
         YJ6w==
X-Gm-Message-State: AO0yUKVqlqPoINJujWrof+ZeVEUkBVKGjbvbwjdR+Up/j7Eh/ex+MbJM
	Yy7eguMrZLtV4cYjEU0fzqaszQ==
X-Google-Smtp-Source: AK7set/jz2AnF63tB8p00z47gnyjjREBhBa4nYjrJe4txxjqSyfWR9lCxSiLVcOC6zjDw4RWTaQ/Hw==
X-Received: by 2002:a17:906:af67:b0:8b1:2ebf:386c with SMTP id os7-20020a170906af6700b008b12ebf386cmr16593671ejb.11.1678272935154;
        Wed, 08 Mar 2023 02:55:35 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id p12-20020a17090628cc00b008b1797b77b2sm7340991ejd.221.2023.03.08.02.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:55:34 -0800 (PST)
Message-ID: <c3080319-b8c4-ab9d-334b-c0ce776b59a9@linaro.org>
Date: Wed, 8 Mar 2023 11:55:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: reset: Add binding for MediaTek MT6735
 TOPRGU/WDT
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
 <20230302124015.75546-2-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302124015.75546-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_025537_556422_D57BE32D 
X-CRM114-Status: UNSURE (   8.07  )
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

On 02/03/2023 13:40, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add a DT binding for the MT6735 top reset generation unit/watchdog timer.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


