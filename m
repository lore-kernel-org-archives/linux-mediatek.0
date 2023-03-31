Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B83C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 08:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCqsrf+amCp61+uBfIcb9Bn5gptsOotapM1kFsMUp4M=; b=2fDjwkcy4Z9vwRgeJmtM//NyU9
	0QT1Z3XtveG+jtksPLFNaR0eGA0+RlA+uXz+WoMB1WR6lOTcba/zJQX1vaDDuPqyVY9kpIVdranBq
	TIw+pG+cL5qZhk5laXvy3PZ8grZtKE7egJBFBhY7LOt3ZRG80pWkUmbgBsdd5qDUDC4aTbPoHhgjl
	EI60Vh0jV9P/vf6stzfCN0rFX2MHyMjyEtYE8jTaePCcm1ecgf6CbWj5jwJFNXGJNlQ/JcucicWV5
	3HJJwLB1nfwPDyGzN8YHs3qf7CHdpZdqX1myT01SOjLCcNQbUCQy8xQvZ70eZszkRycsgaFWR93tA
	JFG6Y6hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piA4h-006Mu2-2d;
	Fri, 31 Mar 2023 08:25:31 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piA45-006MQP-1f
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 08:24:55 +0000
Received: by mail-lf1-x12f.google.com with SMTP id c29so27919632lfv.3
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 01:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251091;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OCqsrf+amCp61+uBfIcb9Bn5gptsOotapM1kFsMUp4M=;
        b=O3LU+DDztntRytZGyI/5nUXmnSu9TL87HBVJgd/WC9Uaxd8GklpM5kHcNNlG0hzyZb
         9BRY2YU9Vr7lZBocH5ZMwzaUHJpJNantPTXVzj/uR6Y8fC4xToVc4BOB8CsuChFxiAW1
         kfFAjsBTIQIk+RId5nXjJqqHGz3V57mIc2VM334wcmurLqpRWoAUStmE4i/CpAoWEBR0
         Y5WLHbcV11TeR+PnvqLptz4LjZ30k00gqpq7UARRm0VSWl7YhilUcxj230i1ubT+iJhy
         jDIfgAPQ7D+4F6T239Uip48XvaLaYT3Kfgp93wbJc8bGwtKVVJxM8T4KG7sHF9fqzmXq
         7Fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251091;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OCqsrf+amCp61+uBfIcb9Bn5gptsOotapM1kFsMUp4M=;
        b=pjZcw+bQblcu6NqqeD827/oBbMs6SOmfl1mGhm2Z7VS21AfdLV083f8aJjMw9bALqc
         0rZmiW8snjjSzvoyR43gv+21stKMba0/Ha2ucWFilin/Na8Jd9WUnsYSNEdvUK/eXPHX
         A996KXVAnuxIVyzv5ndYGFUg5eDeUeuaIXHfwcWelUBsxJXpfspiyvSPwN7jtJrKTz8N
         3Zi2YbxP89mAjJSQvV/3cVohkov2wbTG9k9MVj3hZuYfi7tYO1+bEDCHoXu48mzRuTt1
         I0+WEHYzR193STWQ7QMoBjXcQsYAJJlwtTf01+tOyP2G/zZMV53pSqlLHWHFwehLF61i
         xkIg==
X-Gm-Message-State: AAQBX9fjvBo2xlMNk5eR6Izftp4vwkfTjXvnuILD7OLQ3FZVBkIb2HdM
	Pj8tK7EXcttLA5MKRHL8MhRYzw==
X-Google-Smtp-Source: AKy350YN5Az0Bf5VilwIcM/jIg8J8ELErE9rowIgMHsZO2KQTkzjldPypIETiy8hY/yze5M8dQlwTA==
X-Received: by 2002:a19:f007:0:b0:4dc:8215:5531 with SMTP id p7-20020a19f007000000b004dc82155531mr7233300lfc.6.1680251090849;
        Fri, 31 Mar 2023 01:24:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v5-20020ac25605000000b004e845954a81sm277501lfd.296.2023.03.31.01.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 01:24:50 -0700 (PDT)
Message-ID: <8ba254ac-4df2-c17e-bf14-4cec4debcf36@linaro.org>
Date: Fri, 31 Mar 2023 10:24:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 02/17] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-2-0003e80e0095@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203-evk-board-support-v3-2-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_012453_689420_A828A7A0 
X-CRM114-Status: UNSURE (   8.66  )
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

On 29/03/2023 10:54, Alexandre Mergnat wrote:
> This SoC is able to drive the following output current:
> - 2 mA
> - 4 mA
> - 6 mA
> - 8 mA
> - 10 mA
> - 12 mA
> - 14 mA
> - 16 mA
> 
> Then drive-strength property is set with enum to reflect its HW capability.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


