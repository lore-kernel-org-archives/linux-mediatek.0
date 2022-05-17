Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A39C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 14:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kT2HR1puDtQo3A/CTUl+wtRA6/80jssdIXE1+MzMXyQ=; b=YROGaN5hMx6de1
	2UJTz8XkvwdADBOJgIhYVt+vcKhI/nApiyRDY5Yc+nk+f/gwW1SNW3Fe4MV9pwC2NeppfW3xNXFsk
	AyR6jmwoP+LZJLNahHi9PvRqAWPRUpXyGt4ohEzS5xU93i2fkAPmAJdi1s1Zk/qi79u9GeM+RVlNZ
	Ycz5IqPM+F4nm+/ZVd/tPyPUVHQm0ArvPouaIvcJZq+7MNag9XpHFILP3GE6YbivkeL1GKu+G05lY
	oRenmF5xJjM/3n9kqKLld7QT54fwxGWqkMbQm8ldHXvjjbgTrYRgifWr0n+sQytTwO0wAHLM4Djrf
	kcnRdHPDFWDI8jqwIkkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqyIG-00ETSo-UD; Tue, 17 May 2022 14:35:24 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqyHT-00ESvo-Js
 for linux-mediatek@lists.infradead.org; Tue, 17 May 2022 14:34:36 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 4so21981709ljw.11
 for <linux-mediatek@lists.infradead.org>; Tue, 17 May 2022 07:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BKEEIeJk9pyimkOwL771ve8zRGUvSRERiQLufVuk7FQ=;
 b=B9fOsmEcSjoHKTTzN+vwzSwM+wiYNXRp3MzXSbowWqT7alwNRgnZRyDUTBJtLsQU+w
 JZnX/6GOOiB+HyQTVVZIZxs9y1jXptk6aFz+R6OIPMVdiXkhW0GQUNW6qbuCNbrWNFQQ
 hK1qARpFVkTE7OOCeSEKn7pL6T+GL5hZY7ycmR9EKHjMBY+8IJ72TCIcrfcUuz2prdol
 meb05JUTHO2vVQ97IdeCTadCfpgx+cm7Wv2qP1MxaTgDDBDdl4oHoFXz1O7zWGbTMRfo
 FIFmPsNiO+tBa4fRBfb8r0IRZXoa7/2ESWsrOfRDvfc+5PdNUAC9p8dnOHfRaoWyhRYo
 UTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BKEEIeJk9pyimkOwL771ve8zRGUvSRERiQLufVuk7FQ=;
 b=W7nH0UTI7/sj0NSQgiZFF0eg8lpTC6T267hREBmQgkYzOJ5+PcWyDE8wKxCCuJdbOS
 +WnCTa72ljqHUtdlYGEn4LAyBnKuwxKP3EQtUmqYfUIaZSSjo67bC3+BsL2LDLJAEH0r
 GdH7g/mKCKRXtPX7EQi51+i8f13dW9ds1FKUVht07r9FAgWR38acoM30JoTNCOr3mcJE
 06f4qh+NPjuVpKX7wu2rFcbQ5XK0Mf7+FXNvkMnxlEmdYkrAw29337HU/fGeORliK/Yx
 7mx047QO7PBj9WyaD7Nn7yjQwQiSUdVETUW8WiossMj/F7WDvYA+9SCcWorcvNQ/vqm/
 q7sA==
X-Gm-Message-State: AOAM533seV9I1vtImP7i5pbyDBP0PhcvnMBJWG5AW5Oq/3ZawwlGrol7
 pYBc4Lk2lqhnVOeYMUlsSD6ACw==
X-Google-Smtp-Source: ABdhPJxTbEck3uE8gmC09mqS32JpeRDUp/hAOTqTyVf3mpKHQovSsQyfUmD92szkmQkxjE/azPNPEg==
X-Received: by 2002:a2e:7502:0:b0:250:9c00:b973 with SMTP id
 q2-20020a2e7502000000b002509c00b973mr14283382ljc.23.1652798074190; 
 Tue, 17 May 2022 07:34:34 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 g15-20020a2ea4af000000b0024f4bb33c50sm1847960ljm.100.2022.05.17.07.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:34:33 -0700 (PDT)
Message-ID: <912f9756-e0b6-01da-27f7-2956558d327e@linaro.org>
Date: Tue, 17 May 2022 16:34:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 4/6] dt-bindings: arm: mt8195: Set #clock-cells as
 required property
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 sboyd@kernel.org, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
 wenst@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
 <20220517101514.21639-5-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517101514.21639-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_073435_699111_DA40EFDA 
X-CRM114-Status: UNSURE (   8.19  )
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

On 17/05/2022 12:15, AngeloGioacchino Del Regno wrote:
> This is a clock-controller binding, so it needs #clock-cells, or
> it would be of no use: add that to the list of required properties.
> 
> Fixes: 34d3ed3b9a00 ("dt-bindings: ARM: Mediatek: Add new document bindings of MT8195 clock")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
