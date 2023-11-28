Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76E3C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 07:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4Ty/mc3A4dG4z2IpAQDxL6wASTKN0l3PuXuZz1XJ+c=; b=TzCU1Akpp74VSrmCcLO91BeH1R
	/StKo3SKJJta5dBvHCELDOFbXIs19P/izBdett1kBMoz8wTMyk51PCIKaul5mKLyxwIY31IPd9nPK
	XHMHxhnfWuD6aynfFIloOho0HhpQiYaXLToDQeQlqTliIYTpOzFpDZmIrlTTeHXibSgKwyoZo55Ii
	0ocJELl6Wi1GZkEl3UHeUO/ygTrPoJP63XkCB/lI/99NiJYnNydRAMODhzDEoWiGZG1GekcoB21kj
	CgrS0tmeLLQ9F0yigL8JE1Ee43duoYuPoqoaPTBl85SxxuD2riw9nuqYgmhW+RcaDqkx5oGF7x0cD
	n9Tqnhag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7seX-004Pbw-2G;
	Tue, 28 Nov 2023 07:37:05 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7seV-004Paz-28
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Nov 2023 07:37:04 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50bbef0e5d5so92364e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Nov 2023 23:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701157021; x=1701761821; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q4Ty/mc3A4dG4z2IpAQDxL6wASTKN0l3PuXuZz1XJ+c=;
        b=pCGsYfORx0ANu8HG2i+0a9saiemFKDhemujkW96XZ5NnHhJf3O6HjL2olwr6qeMwYv
         sByvS3Dt7elPT5IX7u/rI6amBNiGxZYw9zSAZ9iCvHb5/iD5PYkT66T2Qrv5ZKm0wjwJ
         x4yUFQ6Q7uRZTmbSJ64E/0SKmzJqXfgqAUiAouHSiMGMn3om43B5h5ztJq3cu74y2eMR
         gLm0giiICZm7N5YgJwEqGabvZlBgIxaqhXhNodniE9V74v0jCt7uwSC3Y9RtR5ccNR1M
         TT8BuZUiqFrYSiSRDmQKD/ILlV6hgolkBAbLUXDHq2q1S3nM5BHvePD9Yo3xNpWNfXkB
         CHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701157021; x=1701761821;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q4Ty/mc3A4dG4z2IpAQDxL6wASTKN0l3PuXuZz1XJ+c=;
        b=lvomLVIHSEA67+iXb9lwVL1WuBdlb+w34ANUK1y5Q1XYzhoTRwT9mTfDg101ZytUqA
         RyN1fI9royer9ujRZExnSLBkXh545G8deId6HW3DUzGnPBTyjrO7VBtpBVs4hbIyBvV3
         AhJZ8D0CGypWQehfcwXZsr5gTUoTYLv345DOPBNhDkESRk850JRoP3/5YJGW81jPy1sg
         xNaGKjqMooRxI8f2v1a8Lb+4LHpmGm4x/0F7kULfDov+T2LRYLgS4GPeHepvDjYestib
         4Y9B5H9eldBz/QSK0GKJJj5/Xc0JR/wNMXfoeA2IBn/dwAqOnAXAi97i0MIJNSuAF25y
         HkQA==
X-Gm-Message-State: AOJu0Yy9dBcCllDjsRUcL/6DMV361ENk/DjZTy6/jvLMIYRgkwiwpp9K
	p3gVnwyJY7TX0kdhqq5VcStxWw==
X-Google-Smtp-Source: AGHT+IHCg4GpPpTE+clk6c1JZ8ms9g4d9Zj/QYHanq7kDauwzXvkjZZgy28czyyUOTYCzI9IzN6YZg==
X-Received: by 2002:a05:6512:746:b0:509:8da4:93da with SMTP id c6-20020a056512074600b005098da493damr8472890lfs.18.1701157021339;
        Mon, 27 Nov 2023 23:37:01 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id q23-20020a17090676d700b00a017da998bdsm6473249ejn.32.2023.11.27.23.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 23:37:00 -0800 (PST)
Message-ID: <5f4cf393-5c6c-4eed-b116-b65adf133d19@linaro.org>
Date: Tue, 28 Nov 2023 08:36:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: add tuning steps related
 property
Content-Language: en-US
To: Axe Yang <axe.yang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231128070127.27442-1-axe.yang@mediatek.com>
 <20231128070127.27442-2-axe.yang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231128070127.27442-2-axe.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_233703_702248_6F417C48 
X-CRM114-Status: UNSURE (   7.01  )
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

On 28/11/2023 08:01, Axe Yang wrote:
> Add 'mediatek,tuning-steps' setting. This property will give MSDC
> a chance to extend tuning steps up to 64. With more tuning steps,
> MSDC may achieve a more optimal calibration result, thus avoiding
> potential CRC issues.
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


