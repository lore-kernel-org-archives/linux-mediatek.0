Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFFEC5ACB3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 07:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmiocgWVUHJm0ZVecWFSig6IiGg3Msxyl8SKRRupJjA=; b=x/mAr8U+hHvEvt648Xqdankj9y
	pa2vSRLiFPw7H6b5MWDnP4bGRqE0ZXY98segNaIm5AzrUF2MJL13pRU9HlUTNHnluKyBojrIzSa4v
	EObV3FI4LaVE2lhQzvtR6TnrD18MONlhTGlXsXyk9GgiLbtbOgHmifPyUXRvIPE7VifC5n5YXn3ps
	aslj9kdRSFKE2XgGfSnJYikVDDEJig6IpxRVGwQ8Acu/8syYkhy8sT+gxI4DCzFJuZgi8a608n0c0
	BvkWe8VuBWQbpNZPfDoGjRTAOp1yFi82DKdXigOQ2ZBRH9GB7/LXwqRQqJEtDNd5yTMA9imzgm3mb
	gIdWJhGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5LUB-00Fw46-18;
	Tue, 21 Nov 2023 07:47:55 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5LU6-00Fw0N-0T
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Nov 2023 07:47:51 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9fcfd2a069aso283064566b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Nov 2023 23:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700552868; x=1701157668; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TmiocgWVUHJm0ZVecWFSig6IiGg3Msxyl8SKRRupJjA=;
        b=gkd/Vj72qgCV8scyehtyYSqCjGMComE8YF3oG92NCXwvsAf5jL3nQMYWZinQQZH8+F
         3JnTujLlhKFSMuDAeyc1fqa83EOY761p9p5P4tnwA7ELhW6EnvqBF0kMeoKK1zSEHVY0
         OwWxRmjKGeZ7owEjEccFyubpLISCvnotRxYUVLMyDDyEmFGLTw9YIahVw5pthgfmRvOE
         wjRUP0wFHy5+NPLBq7IF4BQ1yEaONNnyCWGx84BxijM7uauIj13gaf5NHJ32C/FDvv02
         Va3R0TILJSJqjRi+lVWG5nFdR+wiRIGFZtFt341eayYp77oEynwxoDQj4AO+aLMXni66
         6lMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700552868; x=1701157668;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmiocgWVUHJm0ZVecWFSig6IiGg3Msxyl8SKRRupJjA=;
        b=m2h81yXRje7HLT2ZCu8pAPE/kM/KdcdklXCiJEfJjpf82hlyEQt6Bs71D332gbRCmS
         jAujazIraHAgztd/2NNPOJ1bfSgaD2QpXdRbhNSWzXH/IRPz5+uMFpHKOzJB62uoTg/k
         Z61q+i5HiX0f+sGyRtX9qBgoMdYrTJq00+cv2mxN6TulRG0k+ms27sRxpMVUhJSgLgBg
         sCQWD5RMCitJf+PnJkJ9aVxH9LtlacbX+ZXsEFnQVBkW1jyFXR6C7LO+W9ge5HBnHoyy
         Ks/A2Dd820fxSXNQ54yX3hAViIjvgre0meH41xfg86AD3nhTG+mOcCyySBxr6PTEvvO5
         o2nQ==
X-Gm-Message-State: AOJu0Yx/ipZ2tXM2j/gC80Lc0wz2Z1YQGM+B/SsZwTRyfeI7StkZAfzp
	J9WrY4Uz73ATVamlPG2oERhz0w==
X-Google-Smtp-Source: AGHT+IE/ryIFFXRtcdPlnGO+HGiheve5UvNwXGz0AUkcFXfXA0zX6H0fGrp/KbgbJj9M5p0o6Usniw==
X-Received: by 2002:a17:906:51d8:b0:a02:abc1:1911 with SMTP id v24-20020a17090651d800b00a02abc11911mr170546ejk.7.1700552868117;
        Mon, 20 Nov 2023 23:47:48 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id n21-20020a1709062bd500b00a015eac52dcsm752988ejg.108.2023.11.20.23.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 23:47:47 -0800 (PST)
Message-ID: <16cba31d-534a-4658-868a-c1ff3165cf11@linaro.org>
Date: Tue, 21 Nov 2023 08:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Andrew Davis <afd@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>,
 Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <14c3900f-8f2e-4614-8317-f85763d1d953@lunn.ch>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <14c3900f-8f2e-4614-8317-f85763d1d953@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_234750_213027_A55C19A0 
X-CRM114-Status: GOOD (  13.63  )
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

On 20/11/2023 21:15, Andrew Lunn wrote:
>> +Naming and Valid Characters
>> +---------------------------
>> +
>> +1. Node and property names are allowed to use only:
>> +
>> +   * lowercase characters: [a-z]
>> +   * digits: [0-9]
>> +   * dash: -
>> +
>> +2. Labels are allowed to use only:
>> +
>> +   * lowercase characters: [a-z]
>> +   * digits: [0-9]
>> +   * underscore: _
>> +
>> +3. Unit addresses should use lowercase hex, without leading zeros (padding).
>> +
>> +4. Hex values in properties, e.g. "reg", should use lowercase hex.  The address
>> +   part can be padded with leading zeros.
>> +
>> +Example::
>> +
>> +	gpi_dma2: dma-controller@800000 {
>> +		compatible = "qcom,sm8550-gpi-dma", "qcom,sm6350-gpi-dma";
>> +		reg = <0x0 0x00800000 0x0 0x60000>;
>> +	}
> 
> Hi Krzysztof
> 
> What i like about the Linux Coding Style is that most sections have a
> Rationale. I like the way it explains the 'Why?'. It makes it feel
> less arbitrary. When it does not seem arbitrary, but reasoned, i find
> it easier to follow.
> 
> Could you add rationale like the Coding Style?

I did not do it on purpose because it would grow too much.

Best regards,
Krzysztof


