Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD53C4321E
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Dec 2022 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s73rXHrAxMtPGwi99sqcpRgefCBmkZ6Y/H/iMaBpQ54=; b=eVbzgbkuy3YrD4VCPeVmFGrmLs
	uZpXGIGkJzLBj7UHt1U0/UzMOCU6CR1JFEapwNKzMOLyhdSrJY28/HABFyvz/L1UibjVgQVOMpm89
	MUBVmZE2ysXOqWSifwv7LosikU1XATEICYeq0ZAvWOzqzTTMv9s37P4prBhb9s5Idz/34hZlsP109
	b1FqwPG0HB1GcfeQHVmpoJicbK1JkjpJqnpzNpZ8ABdLPSn469CRE/fCSjNElzXVyUdevQAZ7voao
	mpNp04l39xNf3GtOyLB0v/Ggt4re13ndPMmmTcKj09cnAzGe2/D1IIm0GhLvfATW1c7Hr1ApZ5+Ai
	3Ap+Mhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1rxr-009mk9-5s; Sun, 04 Dec 2022 16:35:39 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1rw4-009loq-Dk
	for linux-mediatek@lists.infradead.org; Sun, 04 Dec 2022 16:33:49 +0000
Received: by mail-wr1-x42a.google.com with SMTP id d1so15263122wrs.12
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Dec 2022 08:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s73rXHrAxMtPGwi99sqcpRgefCBmkZ6Y/H/iMaBpQ54=;
        b=VliLnHpQFPE4eTiC/g9R2V8fggkR7Urm96PGlq5uxnjmmudbCGbG+4VrsfGEr6DLJT
         mGztrPDB0LTXJDXEB/1ZQat9oijOqk9KZVtxhXvunbZsrCacO6IjQWCjPAwyf0LieES3
         v7K4z5yZry6jJ6GX8bj1EtM78z629aL7r4WdGrTu3EcD5MG7xpwFS7AmitiGkljykrL+
         rWSDc8sMYsxGrI66yL7ywBnffSPz7da0YKS+Ob7VoshG4MryemHfyu7C1yo/dYuH/+xg
         knXfyhBu06+PxM34s2nj4j2HLopB1HTGOIPnujpKhOtq1i8Wz8FkvqiduwkCEA72Q86p
         qw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s73rXHrAxMtPGwi99sqcpRgefCBmkZ6Y/H/iMaBpQ54=;
        b=CciySjUvPlky5a0dIgOsspJA3rd0eCVANwF4W38xRb3DufrvTkKZEz6WqSzirvdSDh
         yUTnFuo8jcDmb6YamGqBIRc1zOQo8+lV2uAfDiv2R7RDSWmeMstJFEanIkIrLimg3lUa
         JJ5uoLCMuqgzJ+3PqjVoFkqBnHRQlh1mrdpxDvvD6N0XV9HQnJibKI2nuxHD5TdzK7o7
         0s6bbbV/PxwekHGs2DdgV1aW0JxLsPTB5ewKn/DfJmOXFSYiRrTRrkmQX8pGgB1kCscU
         HkISesxZiLrkR2fWCqKyMnzyefhLaqqA1oZFYA15lvGu5eNbvW2OW8g4mNaN/oJPoVN6
         HzNQ==
X-Gm-Message-State: ANoB5pkEdgEV1WnpOr+3tqQ+6ZdhD9cKw5hv581T/MTwdGJdbWcrdHoO
	r26A6uE/rN+dfvK/ob8mCUbYdA==
X-Google-Smtp-Source: AA0mqf5e3/VxCpvgJ7AtNfqqg/dDz6G+esrs6P1IJNGNclRmlGo8zfq6HOayTGeXqwkxJZAIM4EyBw==
X-Received: by 2002:a5d:5712:0:b0:242:4bac:a100 with SMTP id a18-20020a5d5712000000b002424baca100mr5182569wrv.117.1670171626706;
        Sun, 04 Dec 2022 08:33:46 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id h20-20020a05600c351400b003c6cd82596esm21828797wmq.43.2022.12.04.08.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 08:33:46 -0800 (PST)
Message-ID: <b31c5497-2f14-8a5b-0980-72fb6a87e227@linaro.org>
Date: Sun, 4 Dec 2022 17:33:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] dt-bindings: thermal: mediatek: add compatible
 string for MT7986 and MT7981 SoC
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Steven Liu <steven.liu@mediatek.com>, Henry Yen <Henry.Yen@mediatek.com>
References: <Y4dYpoVBmKZSaX2q@makrotopia.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Y4dYpoVBmKZSaX2q@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_083348_493325_1BBA9980 
X-CRM114-Status: UNSURE (   8.57  )
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

On 30/11/2022 14:20, Daniel Golle wrote:
> Document compatible string 'mediatek,mt7986-thermal' for V3 thermal
> unit found in MT7986 SoCs.
> 'mediatek,mt7981-thermal' is also added as it is identical with the
> thermal unit of MT7986.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


