Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73756C76195
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 07:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjdPO/oq4IIE0hFyHigrECYsxChLPPYgESz7B/pDYOI=; b=Z09SkHLT+6PQfsefGTMg35PJR6
	hTXObtisM5/O/ifgVo8IPLL0FepxtIe/nkoJr+UUVePaQ7ZoCVwA0zog9ZAzOZOgz2x06DPWj/ELB
	F1NLBSGMdl8z+KF4ddViwlqubtiaxaH1JZ/jLgED3haXTTRvEjVDIdtVh/3qHZD2FulZVKJHlA9E1
	ERvC4VSuGW/haTyX8zTT/K0OCUvkJhf+He8R2wrge1rEFGSXmLijFtuUWs4q1r1CtLuzw3YgUvgOS
	cJQmVfowwW6AaKsdwtvTYf89k03f6gi2fyDmWXCdHDC727jZnuJDKrOznM3ZEJmSe/YWwyZMt4Mjh
	XAuqelAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pghCy-00A3u3-0d;
	Mon, 27 Mar 2023 07:24:00 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pghCv-00A3tE-2P
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Mar 2023 07:23:58 +0000
Received: by mail-ed1-x52e.google.com with SMTP id ew6so31726669edb.7
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Mar 2023 00:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679901834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjdPO/oq4IIE0hFyHigrECYsxChLPPYgESz7B/pDYOI=;
        b=kEhpgaB0+FpNDi/WR7iPM+81mqXbh4tx5ISPPA1oSU6dY97FK8aUp9yDlZvoyl8xjD
         tbdmmIazwmIue7n7Z8EYtw58KkMRx0qDa81z+PvmsVGpNRhcouOmJqWi4qYkFwjKe1L1
         R22JIaoaRhQJkEPtmehBpE/5AwLPEKjjn8ujez8CuBIIZIzl1ZmStzbFDGkjnTDz4DEj
         vaZFbfYZDgrhO5gntDqIGjcXjYHKW9JAjiIGLDxQTsFvCtgo3y8KGSGp5R86QE8Z8Qef
         /5/Bn+BLqvmjVTwhEn6yMIRRu7AqxkXU764qg25bs7Ndn+IcHxJ75/McKUoPxReqhmUa
         qZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679901834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjdPO/oq4IIE0hFyHigrECYsxChLPPYgESz7B/pDYOI=;
        b=HoBMACNHMwtNbLIlMlGajgcVjqZ4MwbOQe/PUkW9bLydQJHL8PrCdTolOqc5p0W9J7
         90eY142axjyO+FhxveASyOvXSH7Z9TX9gTk7WO/sbD/h24SlqtAJ6c4AP83PKOypCvV1
         OEcpq+DSxYYWIOIGJLrdweHh2Y/bngoLrXuPSJA7Yr+rBW7VaXTBfVUuKlGt3XVt3/X1
         XH/xyl0fxwW2A61is/49o7PT8DBqc4tlRt+KZUsVbFRR9grifDEukuO21u9Do1d22zAV
         5LQD0uZSI3mazP5h7LvuBeYyEzFbFZtAsACce8jE1mkqtkpyGcqAdIIfFq4Qki6oSeGN
         pMLw==
X-Gm-Message-State: AAQBX9c3JPvTzNQEEFNOuufP3TxcAjLfu70C3nONiKTGRA8HKL5FRUFZ
	nCzQnBgg5tvLJEQCw77mbaMstg==
X-Google-Smtp-Source: AKy350azTNMcDvP3N7zgcsBq8oWHYm5j1ZDrSetdKr7bGj0XWY8nqN78nx3uN23pI6zOfMxTy1BUQw==
X-Received: by 2002:a17:906:6dd7:b0:931:c99c:480 with SMTP id j23-20020a1709066dd700b00931c99c0480mr11619450ejt.69.1679901834032;
        Mon, 27 Mar 2023 00:23:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:198e:c1a5:309b:d678? ([2a02:810d:15c0:828:198e:c1a5:309b:d678])
        by smtp.gmail.com with ESMTPSA id hy14-20020a1709068a6e00b009351546fb54sm10151855ejc.28.2023.03.27.00.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 00:23:53 -0700 (PDT)
Message-ID: <8d5cefae-e10e-52c1-b070-4a1d15a5ef93@linaro.org>
Date: Mon, 27 Mar 2023 09:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/6] dt-bindings: soc: mediatek: pwrap: Add compatible
 for MT6795 Helio X10
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 amergnat@baylibre.com, flora.fu@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230324094205.33266-1-angelogioacchino.delregno@collabora.com>
 <20230324094205.33266-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324094205.33266-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_002357_795555_B6CE097F 
X-CRM114-Status: UNSURE (   7.94  )
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

On 24/03/2023 10:42, AngeloGioacchino Del Regno wrote:
> Add a compatible for the PMIC Wrapper found on the MT6795 Helio X10 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml         | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


