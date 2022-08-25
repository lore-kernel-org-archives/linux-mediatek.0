Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65FAC64991
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 13:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16mUpezxm80YWlJHrT1/vR/sK7zihBb/9bIY1O88uf0=; b=3i7w5PdK1iTXYVDLbmUe7siaS+
	RLxtXWRBASN8JgUmJImNKwl1/pFj45eLqxsHK9UghlfCBKbokZi02nvDJwzEO7WKLQIVA/khnbfzx
	tZ7SECwcgThg7ihU7pLHhIn2sj5mj5ngydrpWBuKIiW+3578yLXcyoR3p3q9R8qE0hgbU86JDWTwQ
	zI9xWCXnx3glM1mLvrcY8Ukaxv53B+Lk9JBTRCVD8roe13KZTJCz/Oi/CL1Z8hPeSVuGUxxpYQgYc
	Oy2Aq7/VIcV27sX30pnCfU6dRDqO5sBzrU6ty1RPXpp/k6GDbFHkgPsJfOfVAd+j2U3cHlpRhlfpP
	XC0prXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRD0d-00ErDQ-EZ; Thu, 25 Aug 2022 13:34:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRD0a-00Er9t-Ga; Thu, 25 Aug 2022 13:34:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id m10-20020a05600c3b0a00b003a603fc3f81so2544078wms.0;
        Thu, 25 Aug 2022 06:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=16mUpezxm80YWlJHrT1/vR/sK7zihBb/9bIY1O88uf0=;
        b=gZx8lYB9Id3gDBCjd8qFEkRWURnqOANH7rQGtZTj89Hy7ty6ajUb1in5wb4EUFylyK
         bjdEA9O7JJVOdwj/mg2wPm0K8/CF/RFgjCL5vlGHiuDSp3rtOe8jDQ5wzAMySvz+PWrk
         OYf3ICmgXmkkgFn1cw+8kUFs7710jpphO7H2ja7OjFywIzItHn8CHC2IEeSiDMKh+Zux
         iUn/ZFs8V0wQWiqkpVTDQ1w0Fs2tN72nQ5suXHZCRymcg222syTNp9ode82zSeHjs8wT
         22GrHi+qQ4Er/n9erGPOJpDZlS2G0y+HgecmU2fj1zY2Q35VcUqUk89mg1hHn7mmp4AA
         1o4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=16mUpezxm80YWlJHrT1/vR/sK7zihBb/9bIY1O88uf0=;
        b=zE71zTp5fHjImhYn24b2mPXkGC+DjeFEBaCEfL+qzwT1Xq94n9BtAPXqSRxZnZDdLf
         fADJVhZZnsYfEGZQGyAqw3L+hZEhhb8Bf/u07Z8IQJeErHb5L4wR9/iU5gGZs0VPltg+
         XGcO3YVaaibKu5i8cR37w1eiBhbwj4xtJWiLoNZbDK75PgEOfngEtIzseoijKRHmh7GP
         v39JqR2NHA1DWLQUP/egdXD+kLPFftA2HVSCTpzhAR01FnAATeETqfuecOiWzeRAXtHM
         /ZSxCtKZIOarrt8omsir2mbWAryVkV0ZhkUPYFxjqdtt9sv0xN4cCuaIwaunpCZOurcj
         EivA==
X-Gm-Message-State: ACgBeo02YYhesNmkmtFXfqxgX8grcEv6bzL2THIR5XrjNhaXdMgTRx5V
	cja2By0S0txuKOs9K3d3NrEk77ypiW4=
X-Google-Smtp-Source: AA6agR5gHErvZPlnKGEvLXNiDwqGaydgJbZyT1M6n8zJ+OwyS+zQQCpAfBNjhqu25JRp5UCiEWpxXA==
X-Received: by 2002:a05:600c:3b0c:b0:3a6:aa0:5966 with SMTP id m12-20020a05600c3b0c00b003a60aa05966mr2367508wms.183.1661434494909;
        Thu, 25 Aug 2022 06:34:54 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j4-20020a5d6044000000b002254a7f4b9csm14356230wrt.48.2022.08.25.06.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:34:53 -0700 (PDT)
Message-ID: <24116d0a-38ec-8868-8b9c-1adbe98250f6@gmail.com>
Date: Thu, 25 Aug 2022 15:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v4 03/20] dt-bindings: power: mediatek: Refine multiple
 level power domain nodes
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>, MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220729063208.16799-1-tinghan.shen@mediatek.com>
 <20220729063208.16799-4-tinghan.shen@mediatek.com>
 <0bcc1575-2c43-8843-8edd-8b73ddc4d0fb@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <0bcc1575-2c43-8843-8edd-8b73ddc4d0fb@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_063456_584163_A1A1AA0A 
X-CRM114-Status: UNSURE (   9.55  )
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



On 29/07/2022 10:06, AngeloGioacchino Del Regno wrote:
> Il 29/07/22 08:31, Tinghan Shen ha scritto:
>> Extract duplicated properties and support more levels of power
>> domain nodes.
>>
>> This change fix following error when do dtbs_check,
>>      arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: power-controller: 
>> power-domain@15:power-domain@16:power-domain@18: 'power-domain@19', 
>> 'power-domain@20', 'power-domain@21' do not match any of the regexes: 
>> 'pinctrl-[0-9]+'
>>      From schema: 
>> Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>>
>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Applied, thanks

