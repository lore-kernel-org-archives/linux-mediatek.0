Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA47C38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 13:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkN5lSEGT0XqyIIogV66h42SfZYhfXdkQkWQQNDRmT8=; b=XtKjlkjBtPLYhWVCWC5ZfI1AVG
	O8OhEZSO20tvH/EUvazUR56+UHnHpyrM6rAHD9Umbvv/jlHsJV3WFgiXQq0rYH7DC3l4hMJn9QX5s
	6V7lvro37HKHaJdGyRQn3nFQbpNPSUY6YPejSJXd98MbClAE9m2j/kIard+csQQQUr9fE955qi/B7
	KEdVX1buv+6OIJP+fzAd2WDNZNsVvv6yrEcsLlUZ3jV9QnKcn4Mx//NdMr5QZkHz7YLE3dTP8S5HA
	EvW6TRXAhCn7RWLw3rBS0tuxamjoLXnkvsvg4O0Frdahs5HHvFhcHaGHr0+GfCwXo+Zu/mH9kR7KX
	YL7YNG7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHFs-003Zsx-QU; Thu, 08 Sep 2022 13:07:40 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHFn-003Zpq-6I
	for linux-mediatek@lists.infradead.org; Thu, 08 Sep 2022 13:07:38 +0000
Received: by mail-lf1-x130.google.com with SMTP id u18so15321334lfo.8
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Sep 2022 06:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=hkN5lSEGT0XqyIIogV66h42SfZYhfXdkQkWQQNDRmT8=;
        b=OnaGsfvOCLtQSBc0ze/XDCrjMs3fvJ8z2lVuT/jXY3Zah6Btqr6O8o+Y/xzaDCsGFQ
         aNTn+Tad04itVfSFKUheRnqoKDIPvs74oU2qn5UXwtbVp9MdLGGK6UrfiaX6oPKzYM8L
         iYiuJO/B/2FMpIuTMicaPRvUzM4uu8CFTorze+v9/JExL4YuwKOPfuy6SmY9LzTKN3CC
         pOusfnV2vFIqyVn2EG9BhUNURJE49a21kmlxwOCnqQMWVvSI4x43iNTbzaWm6ldSo8Ko
         WQZV7wfAXQ5YPo0rxq7Unw5lA+FF7KNsezgXrt5Tt4RBUggcRZQtMFdwwyg+X23ERZoC
         FFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=hkN5lSEGT0XqyIIogV66h42SfZYhfXdkQkWQQNDRmT8=;
        b=hNuZbRKyMEn1MeYenyBEPz/9aKbVF0MTA1ApjlcfpLtbIT+/MODo1x6F4sT8fvJjrV
         ITz+CRio/hQS68oyASmYrDNRZPYnscFPDDvAwLHVlzm59mM0YT+Xf9JwT3L/tMPah5ls
         81v93Yi8nuu9IgsI15d2xmQJ+M0W7H9FO1MczvOg66D5WRyDkTmF3vSBUssTv5A+2dEX
         sPZZAl3QXhseASPWVyDmbR03x9ei1xFrHDi6iKP0IHftrIHNYCSLs1DxFutTPcn8hYBV
         jhqnBw+CumyYgFSLH5CSGqZCe7eEAwOfbYFayh4Irb1Ny84wph/e8oWXiAugL3IqneQu
         Zm0g==
X-Gm-Message-State: ACgBeo0ZrCyG2ZW0bymtWR1RRIz24NGSsD7ZmVl6JT1u23iEWpPULm78
	xTq+SP0vpxS6wxrKUdA0Fe9SCw==
X-Google-Smtp-Source: AA6agR57T3t8+MMpI2KHy8mvLQohvoJxFPM7ZK6FI697GqmZFiRdAtbnPNIFqulD/7k9bQHxePp8gA==
X-Received: by 2002:ac2:5107:0:b0:497:adac:7305 with SMTP id q7-20020ac25107000000b00497adac7305mr1643133lfb.32.1662642451447;
        Thu, 08 Sep 2022 06:07:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o10-20020ac25e2a000000b004976809d6a7sm1697850lfg.283.2022.09.08.06.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 06:07:30 -0700 (PDT)
Message-ID: <55f76b33-fa27-d8bd-8fe2-9aaeacf2c9f9@linaro.org>
Date: Thu, 8 Sep 2022 15:07:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/6] dt-bindings: mediatek: modify VDOSYS0 mutex device
 tree Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com,
 lancelot.wu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
 <20220906084449.20124-4-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906084449.20124-4-nathan.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_060735_283064_C1EC031B 
X-CRM114-Status: UNSURE (   8.06  )
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

On 06/09/2022 10:44, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 mutex device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

