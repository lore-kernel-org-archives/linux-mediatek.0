Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8433AE70704
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 10:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/uxubhSOYRKOBgFVb2nJokjnsajJqcWLd3vDjsGmIJY=; b=4MTIl20ICfEfHd
	RjVVt6UZryjjZGiRXYBh8R55zV71dvGBVdY0H+njNRcbyAOEBZs3jC+lAjm6AvUbAo6JB1ksNRUnK
	+86z+S8vpH5NmcKeWJzpjDmf4opC4I684UKCaZM34D2P5mzM9mpsthIMNSp9PszACe5E3PUnB0ddK
	iE/zEDJIte8dqMb5hHcYob0mL2AVJHwCfxJkSgt0/JdoU1L11UiVam4PNmCie1ZQbnx6vf5AP1Uye
	rAsIg7r1YtB+sUcqVcGtXxJBQNCCvZAzfSc3L2cJ4f61Nw/XQR1Klw9KQ0yjSYPEbNPj3Buk5e7yz
	nDzTRqhLr4VUi26skhMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGZt-005fgf-12;
	Thu, 21 Sep 2023 10:06:33 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGZq-005ffz-1L
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 10:06:31 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c93638322so150452966b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Sep 2023 03:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695290789; x=1695895589; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/uxubhSOYRKOBgFVb2nJokjnsajJqcWLd3vDjsGmIJY=;
        b=PxTT4+olV7mX3SjGt20xw22gWB8gc8awhpck3A8HoBLrVoLdtKYshA+j0ETkM82YXC
         UpsGFP2Om0UI4eJFqJ9+HRxUGTD/49gob1QaF4nKLGvCm1lMTzXVVYAxRqvn3UG5rahZ
         QFI3HE0uzZi8SwGT0meekTRiZF/Vzd0L//SMgoRMhOdoG0Zmf3Wx9kqLq8ucQRJVtVjD
         U+57R7enBzA2xvYy101LxOuGUJpKE2Ri9Ui7vtFg6C49CxZqQ+zqoK3j7vHf5OemAU3q
         HFYj71zY4jacCpjkKd/cdq41NHLlCllRSLb5zC1XbOcPCQpC5v834WQzojrIg73p0X/S
         ACXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695290789; x=1695895589;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/uxubhSOYRKOBgFVb2nJokjnsajJqcWLd3vDjsGmIJY=;
        b=AcdWtLmTWrfdQWGvG0rqHHFCbBwGJIqkfGeAJBs9dqiFDp675Zd1duY/jrCyly3Ykb
         4zhABmOEKmRaqY5IMtmh9Y7lBKwSW1rWbpWPaj+giq4S3QXdCKIwC3cvZqoX8GIFSglQ
         gS0MyD+MbpwkZH/tvsfZwT/Aq3hQ64WzNsCmFBWqXc2PAllXhSKWQIgWwj3wX9utRZuO
         skHlK8I2Z67NlYZWxUlhfTqlUmg2CA/0B0lQ1UPUkEV3WihAy4EhS3E2eD0HFiq+LT9X
         rT9AC78dnD+SuRuBdlKUxFf+67YAFwF4Apjdnb7+Fiz/W3zpvKVKnzbacBGhLv3laM9e
         ycQQ==
X-Gm-Message-State: AOJu0Yz/95dpcjvyn0rVGHPIU0AWKxzBQuBQYFEHsobsrEzySb6ODy/M
	qr1u54mV7X0EBPYY74pGAc0zcQ==
X-Google-Smtp-Source: AGHT+IGPVfoflUP3NlCWwDzwylQtmI+2m3tAC7GFYclWCJd5Ehn+hZ+GXl/jM794pw9McnRpGwN/BQ==
X-Received: by 2002:a17:906:31da:b0:9ad:f60c:7287 with SMTP id f26-20020a17090631da00b009adf60c7287mr7118902ejf.28.1695290788801;
        Thu, 21 Sep 2023 03:06:28 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id cb25-20020a170906a45900b009ad778a68c5sm812501ejb.60.2023.09.21.03.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 03:06:28 -0700 (PDT)
Message-ID: <4ac45fc9-1583-a71f-7c75-76ae6c882e67@linaro.org>
Date: Thu, 21 Sep 2023 12:06:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/4] dt-bindings: thermal: mediatek: add mt7988 lvts
 compatible
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230920175001.47563-1-linux@fw-web.de>
 <20230920175001.47563-2-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230920175001.47563-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_030630_460898_933C2821 
X-CRM114-Status: UNSURE (   7.42  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20/09/2023 19:49, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string for mt7988 lvts application processor.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


