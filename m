Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521B4C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 10:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpn6WJWzcTGFFGEo65ASyMAjPz97l4Ugbru8JYWT6j0=; b=jK/ok5xkMtRciV
	aFKM/uilkwYVGO/JC49dxuEAOkqvYIS3S+hAktt0CP6h0aL0zImAXxkgyxbLzRse9vseQES56MoVC
	7OkspYHCWYUlQVWA0lg6uHT7zAnx4k0b5v0qUwPMiEo2VCoKfh9II2/tN5QU7qtfNCMniAaGr1Fo4
	0mjDgioTPGoggrYMiOQ0wsS50PSlX54b1O2+AfQ+GIVDKjGUyfDZo9zNVtVdNnh0SWc690UeWUS9P
	QTfxB+RcF1nQ22ODkOXUGHKBcbR0o/i+LEF+nUHUZrW24e8YgmTMj61wefU20HcPbGOYehMtbzQdw
	snJKmHhTKCN4Z6pmsaVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLbs-00FJCV-Rd; Wed, 01 Jun 2022 10:29:52 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLLp-00FC0E-4i
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 10:13:18 +0000
Received: by mail-ej1-x62b.google.com with SMTP id rq11so2737153ejc.4
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Z9kPEnmi8rJKpB3/e/9VBnwIHSYiTOXGx6udirKdD3M=;
        b=AgWZPwEKZaFLn8RqKLc2KNNc5Ox5awSlJ1Eo3iFQUpbH54qkNKGdSA/oYmRwN7jNeK
         UHHTIWONRqxe62sbo+bKj8ofX1yCVF+sZoXI2RmEEHsHeACpURK0tSI7rJrAfo3nvkCu
         1hzevQKrNh/cy4d+o9QNlxatZi8oxvhsb5M/pZ9wTacDiFLJ0w8w/do6y29F0n3ezP7f
         PusoBRPPTModJOvPw79D0hlUfXJ8/xbQXLFE15SzI/+az0xO7/RPWMItwnxXktCevnSx
         OLNaLpn5TqbBhnQUYchiuK2sM+9xl0TOHE2TOnTJxsHBl/jlsI1TsEGmERigH774u85v
         /Szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z9kPEnmi8rJKpB3/e/9VBnwIHSYiTOXGx6udirKdD3M=;
        b=JlwUuF9+Hd7asLVvqc7qZmWq2eBCzPbXR1i+P99Jb65l8ywx+UbLAO8PfgkJPrrJr3
         BKtq8s/1ACO4IQfnkSBhbChT2rfpNvk4Kua58PH502lBuhUkaB+olLV1A03nXyESrK/0
         H5xaJiKlC4XC+hO1yqNN2eJ4Mn7NCsQkHTc07tNfL+HlrPqN1b6uACZ7sJCMHbkkASDS
         Km3gYVAkmaQSG5r/HSLTgOz77XCVsjIVPvLKIokSmx8Hx3O1YLMySKg7PvqZH7UeoL85
         lByk1Kdoh6RONXYLRH5E3wu9/0ZkRPHlt8TZXqIqQLEG1uDgIttNz+oCiEZKwEDBvlW4
         U7kg==
X-Gm-Message-State: AOAM532PdO5WfVCq3S/j7rQ4/d9BL9GwEFss+omkbRtiJReJjKOg+z1I
	aAMN/EZp/nZ222ZyBfd9iru8EQ==
X-Google-Smtp-Source: ABdhPJwTzfmxEZcB2H8kpKINmFdrBQHA4UJBWrYbb8yNl9INvi7rhzKhj+8nTc3PJwiLlFid6G5pUQ==
X-Received: by 2002:a17:907:a0c8:b0:6f6:d3e4:49a5 with SMTP id hw8-20020a170907a0c800b006f6d3e449a5mr57330364ejc.644.1654078391803;
        Wed, 01 Jun 2022 03:13:11 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bk2-20020a170906b0c200b006fef557bb7asm523130ejb.80.2022.06.01.03.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 03:13:10 -0700 (PDT)
Message-ID: <b7eb2f9f-9604-3f05-59c3-e4c790068967@linaro.org>
Date: Wed, 1 Jun 2022 12:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 11/17] dt-bindings: phy: mediatek,dsi-phy: Add MT8365 SoC
 bindings
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org, qii.wang@mediatek.com,
 matthias.bgg@gmail.com, jic23@kernel.org, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
 chunfeng.yun@mediatek.com, broonie@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, Kishon Vijay Abraham I <kishon@ti.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-12-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531135026.238475-12-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_031317_202650_CF7A0270 
X-CRM114-Status: UNSURE (   8.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 31/05/2022 15:50, Fabien Parent wrote:
> Add binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 4 ++++
>  1 file changed, 4 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
