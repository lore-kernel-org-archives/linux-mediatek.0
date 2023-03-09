Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9743C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nfkr47uMkCiXVxXdwdLHVRDx52SBPipOfF4MJ+yNxeQ=; b=T95AFlCqWPTEmDMCuXnciT8Y4p
	1iz7twIAEUO/CvPTANXOg4I2ziKraRKkhNZzDj+OJfz2pZ8hkRJKkqCdOXMKX0gNAA+RpvSMAqnda
	Pge9F3wEPvnO51PVUIl7GpRH/TUl1//fOuucX/x+3CytyV4eO09wrKxUXjHNcJBFzpQtJFXX3+59N
	Ob3IvY7aia8UfOOpn++NwFQHg8cuzLQhNQzGSFrP9amPheqcWwLj4kCUiYGDyo2xxNzrhaOBlQQDQ
	YyzvIN4M4/PV7oXYQVVWLhKH7r+dZoSzeP8I4uwAAyPvSGfWXxY+FD6NX/pQh/rDfLEg/x60Xjp95
	G0gCS9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paIxM-00BEQG-No; Thu, 09 Mar 2023 16:17:28 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paIxK-00BENf-3h
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 16:17:27 +0000
Received: by mail-ed1-x52b.google.com with SMTP id x3so9102233edb.10
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678378639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nfkr47uMkCiXVxXdwdLHVRDx52SBPipOfF4MJ+yNxeQ=;
        b=f2GNQOaSEYn2K875iDD1m+O+ehA0xtEb0yn0Y3GjyxfPFIVnmb4tThLnnJKqnSaMj8
         zDHzpMR77KKioLJkBdpLg/PaYCp7Ws33K4MsmI2FEGrvDP3tsZokVnZk5WApoMrNXE7M
         yPggHYe+D7cqElZgjppZi2/tpChF2SOt7Jd4bMjQ/D5m9zbVC464kiwTsblIXJjsBn6X
         WPqhPaKdcPtxHoUGn0o+fDAIB+RZwBKO0dphMGn7MybHHohoqL06AXkS9nNmBDGgD+MU
         QV0pEAaMKMlvDL1d7aLYKg4eHzthZ+X21YrEGjI353q3yfZuOanAv+wYH/TBDb871Zf2
         Z0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678378639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nfkr47uMkCiXVxXdwdLHVRDx52SBPipOfF4MJ+yNxeQ=;
        b=JsXsEkIXCIswYMHt//sAYPxlvz2hDP0WJmMRmqtVjz7/1ep5TBGowOFFWPA70feljq
         Ve32BSojhS811cDkhtMG5pvxUfJ0uWU15DK5DGNPGUrJIeLAQYTQRMgmHwqKbGqRZJ4N
         Ot8X7DEI0Q9slqTEqrSZffCriqWuwFOL2Db2bh8Q2rJYeL26dJbPiofaDGsfph0X/Jvf
         7cXQLo83Z3okS9uqwLzjOLH64TuEiv8bKDaAy+QzsTSL6UYctcqlQU384z9MHnZPurAn
         7wxjZidkKgXG1+6X7aJMeKV2u5TMxRcMLVeCSGGDGYGPMf1Xk75ySdKYYdD7tqSLt0hO
         JC5w==
X-Gm-Message-State: AO0yUKVVpF9hpGslhUi6DL5VcbE7GUz1ljTfGXErDF2P/wsux1pMRbGE
	V245yThNo1rTnMGT/c5sby2nwg==
X-Google-Smtp-Source: AK7set9tLG7OqxL36Iw+EQSmEvEdnsYuLYCe5O2o6Pafsa9Ob3uXQyp15aFbfmwbSFuiC7AoVMAwgA==
X-Received: by 2002:a17:907:1c1f:b0:884:930:b014 with SMTP id nc31-20020a1709071c1f00b008840930b014mr28489263ejc.6.1678378638898;
        Thu, 09 Mar 2023 08:17:18 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id dc23-20020a170906c7d700b008b17e55e8f7sm8977100ejb.186.2023.03.09.08.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 08:17:18 -0800 (PST)
Message-ID: <1d7f051b-761b-df8d-4407-9c6c3d95cf51@linaro.org>
Date: Thu, 9 Mar 2023 17:17:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] dt-bindings: thermal: mediatek: Add LVTS thermal
 controller definition for mt8192
Content-Language: en-US
To: bchihi@baylibre.com, daniel.lezcano@linaro.org,
 angelogioacchino.delregno@collabora.com, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230307163413.143334-1-bchihi@baylibre.com>
 <20230307163413.143334-2-bchihi@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230307163413.143334-2-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_081726_188709_245FEB98 
X-CRM114-Status: UNSURE (   6.74  )
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

On 07/03/2023 17:34, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add LVTS thermal controller definition for MT8192.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


