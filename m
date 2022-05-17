Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6096BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DG95wNWt0MhUW0at6rbDyHVwWCgq0F+IgYZu35D9QwI=; b=avKl+FB6rcD0ah
	Orhn4RD2Bf7AWtJqhnCW+OF8mXZkhRGxWUc3T8kxau4L7XNkKd7rI8fPh9CNwXi5krfwXrmMAmdC4
	13Y8Rbj0mFvTHiBTjgERELYE5BF4mpuCbv5j0Y1XM99JV60FdorILJlhk5yKZlYQii8bSKaCmgLzY
	/EWDjlBqnQDYBpEWm/GYWDadKGo2BR97IVWraaaF6Z4kZcKD9rf7qTxn16qaKEK55gBWBCCKX1ajn
	RNgh6N4sDTR49wBML5gOxUEaJ91zVrLiICaYkCWVRaSOpNeJYmxIBYOg00YQ1wr2Dx9RndOMih8Rl
	ErtR0WrOH6FeHVvPf5gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqyDt-00EQQb-5E; Tue, 17 May 2022 14:30:53 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqyDH-00EPpt-E5
 for linux-mediatek@lists.infradead.org; Tue, 17 May 2022 14:30:16 +0000
Received: by mail-lf1-x12b.google.com with SMTP id bq30so31694541lfb.3
 for <linux-mediatek@lists.infradead.org>; Tue, 17 May 2022 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MwRo3rFibChV4O65q8eXjp101W+2zLrCGSrd/xmpC7M=;
 b=SvO/C1fUqmnr64ihkaFXtCYLUItLInkrgOLwfRO07OyNF+am/v6RV4hFMu8TUxKgsD
 es3SI5z1pxH665t48wNjeSMnHzYktwzjuYr3UdxNOwJuaPQt+SIXkxZhR8hocfZ9o3J/
 leWLxo0HSkdHYNq681L6EqQ4uwW5SmJqkW7gMTgYVICD4yoreUDwp/Lw8LD8mqZRqGM3
 Pixb7e6u9UL1qxI+ci7ku8qbSwO49JHBV72fRgzX3pdEARBHnXNw+eihCU/D9Rd6HwDE
 Oa6ll7OPAegL7sIki8QrvBV9TvBDA9Wy7FmtfrPcUbOikiHfo9fpHilxO0SnoCC2Ygu0
 kQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MwRo3rFibChV4O65q8eXjp101W+2zLrCGSrd/xmpC7M=;
 b=sLHINCEo27A5a4bG6ULYqDnb3CDOGUYNsYb812pWJZDC7oVVloKWH29nFvrNWVJnbO
 e8j+A0C5YHe2AKCWhLn1oGmqE/LFXr6O6v7y7uofE1ObCiHPH3JFLfDm2M9qh5nCVJ0B
 mknlonMXcD6s/fka9fhmtzP96uNRiHXUalQ+MoT9RZWNl2tf9fHS6AOhSQSkrYIkT9rp
 +9O700fNJDlmJW/ev9byuWQji2pzf8NjjnMTUT0OlwAHmKIx+8NzSQtRtZdLQOK70Fh0
 CQA2WEHUsUnl0246J5gx2lsPh4MSo8oZjY6tgKxykEsJxShjJwzOzd/RbSgjsfjePRPY
 yi0A==
X-Gm-Message-State: AOAM530BgIJapC9ibnLxt4I9sv5hdUNCDpSdLewJDzLy7jXVlAgdqJKW
 wpSVtkntxxus5rORR5z+OYWlxA==
X-Google-Smtp-Source: ABdhPJzzI1cy4wLl0DIOkPpDOw7qoQ8fui0WGqjeuo2pp5rjDj30k+XU38Y64hEoyl+kbNEnkf+CVA==
X-Received: by 2002:a05:6512:10d0:b0:477:8ce3:ccd5 with SMTP id
 k16-20020a05651210d000b004778ce3ccd5mr10560371lfg.203.1652797811545; 
 Tue, 17 May 2022 07:30:11 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 u12-20020ac2518c000000b00477a97cb50bsm142157lfi.32.2022.05.17.07.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:30:11 -0700 (PDT)
Message-ID: <b3c835fc-3b9a-8207-a99c-4c289a6ee7ed@linaro.org>
Date: Tue, 17 May 2022 16:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/6] dt-bindings: arm: mt8186-clock: Remove unnecessary
 'items' and fix formatting
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 sboyd@kernel.org, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
 wenst@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
 <20220517101514.21639-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517101514.21639-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_073015_512136_28CCB08B 
X-CRM114-Status: GOOD (  11.26  )
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
> There's no need for 'items' when there's only one item; while at it,
> also fix formatting by adding a blank line before specifying 'reg'.
> 
> Fixes: f113a51aa2cf ("dt-bindings: ARM: MediaTek: Add new document bindings of MT8186 clock")

The original code was not buggy, so it is not a fix. There is no single
reason to backport this patch (which you will cause with Fixes tag).

For the rest:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> Signed-off-by: AngeloGioacchino	Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../arm/mediatek/mediatek,mt8186-clock.yaml   | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
