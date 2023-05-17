Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBD2C77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtCtewUzVRW8uKYzP1Tao4nr54dZXagWaGdfoHN7tnw=; b=dMv2nIQ/fEcAnepW/nxG/E2+jM
	YJSD+qSJ/mTiTju2txV+b33X44Z9CtnPiv/6uJBEeR5l6p6aXrfdIv8tvYkPi1jNIeSqac1ARehRL
	LEbCa+tyq/P4keBC/iu+GsukXnfEuhmcraUY7Cjbo40hGIkQpiUZgrc+32yqBv5SYRf/VIC7jCR+7
	gv/rsuw/qioDWd23DgH9/vNWKObxGpSnl4u4b79vbWNdEBOWEHaWffsRkePb4DeugdDEVaLFG6iDN
	EHmUJTC4plkeVwasVLFHdWqCd3auZNb0joC0IDbs81VnDOv0tvF1GQKzFLZGSS31kVlGcur6jaoXY
	i5fBRh3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzBmX-008i0B-3D;
	Wed, 17 May 2023 07:41:10 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzBmQ-008hxR-0d
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 07:41:04 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-965e4be7541so66801766b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 00:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684309258; x=1686901258;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JtCtewUzVRW8uKYzP1Tao4nr54dZXagWaGdfoHN7tnw=;
        b=uuLpv0TPdGVb78xn7vF4u2Gz6XP+nbkReTYJC1oFYxpS9C67JYwewj58bcRDPj6f6w
         yY186AVWeCvpyGINXsyl1m7LR8qRSiu/2nyifyOXxOLOpAB2ANnEDzgOf6ks0j8BvTBA
         9R8lRY//6mD3X1ZCYBUV4X+mQUHy6O6zs2SsjGKF/4XCa53+GI6aaqnIGJDwKNl5Fiv0
         SMG4dVXlBw3mFbWqWSze4O9Y/MljNz955fCP6Nwl66okuWOZzjnCyAuvA/pF2zlyCBj3
         dwWCHQH+aVSWG6Y03Dkd0qlsk02Epn1Cwkaj6OScVpjkmVMRNm+XZQbUWEduc8S5bN3r
         JQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684309258; x=1686901258;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JtCtewUzVRW8uKYzP1Tao4nr54dZXagWaGdfoHN7tnw=;
        b=hCNsDyoaxMvdnSMv69OPBQUfCUALiYmdosik4KPiYW+CbOXw/7nTbScF/vEvwk/gEp
         VNCj9WzXV2dIqM+KoTREHVg2BB6UspHAwbJJG7F+l0BbUR/UygjaSohIIvfpLWLtnQlG
         29GBzsuzWZGT2n5YruVsX80A29ccBHeMUdRME+2t9TqZ74+DxadkTxk4oYycnTktQG6p
         g1REzTR6joV6L5kuwGV9pqVVrdJv3Vi2uJPt0Hy+snLwxmOSop8wr2N9X4Zd6j8mtbQE
         Ni60/INHhv4o/POlWE5/j6v7Vgw99OtOJl0dVoBFuPKtUfAYGS4nopemYGr6wh3XfB+X
         xWOA==
X-Gm-Message-State: AC+VfDwDkeURftD7nf4QxGiDc7iBdNEZw+uEvU4P0DER+d799PxBXIIB
	nCASWMoW4nqUIiU+EK96kIWgQg==
X-Google-Smtp-Source: ACHHUZ5MX40hBHEYvpaGYmdcpfpkfWBCMgkl6rhA0Lvr/VDGhzhQbEuS3/WdyLTzslok+rOrR9UchA==
X-Received: by 2002:a17:907:724d:b0:96a:53e6:eab5 with SMTP id ds13-20020a170907724d00b0096a53e6eab5mr19711718ejc.41.1684309258349;
        Wed, 17 May 2023 00:40:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id my14-20020a1709065a4e00b0096643397aeesm11823975ejc.184.2023.05.17.00.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 00:40:57 -0700 (PDT)
Message-ID: <c63ebd7e-8658-9cdd-4fc4-ade9c94dfa64@linaro.org>
Date: Wed, 17 May 2023 09:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: add mediatek mipi csi driver v
 0.5
Content-Language: en-US
To: Kevin Hilman <khilman@baylibre.com>,
 Julien Stephan <jstephan@baylibre.com>
Cc: robh@kernel.org, chunkuang.hu@kernel.org,
 linux-mediatek@lists.infradead.org,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-2-jstephan@baylibre.com>
 <ab9aa30f-82d7-1d14-5561-e19ff10af0b0@linaro.org>
 <4yppinkucchwnwtnnpbqdn4bejmntjq3q6mx6es55f2pwyce3c@qdhdks47lpyt>
 <1853f049-4f00-b7f0-973a-2c4e7b0b2634@linaro.org>
 <7h353w2oug.fsf@baylibre.com>
 <fbf1b0a6-f45d-69a0-5de6-8269567e15b3@linaro.org>
 <7hwn18yndq.fsf@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7hwn18yndq.fsf@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_004102_251065_2786938B 
X-CRM114-Status: GOOD (  29.53  )
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

On 16/05/2023 23:31, Kevin Hilman wrote:

>> Third is to use versioned IP blocks.
>>
>> The second case also would work, if it is applicable to you (you really
>> have fallback matching all devices). Third solution depends on your
>> versioning and Rob expressed dislike about it many times.
>>
>> We had many discussions on mailing lists, thus simplifying the review -
>> I recommend the first choice. For a better recommendation you should say
>> a bit more about the block in different SoCs.
> 
> I'll try to say a bit more about the PHY block, but in fact, it's not
> just about differences between SoCs. On the same SoC, 2 different PHYs
> may have different features/capabilities.
> 
> For example, on MT8365, There are 2 PHYs: CSI0 and CSI1.  CSI0 can
> function as a C-PHY or a D-PHY, but CSI1 can only function as D-PHY
> (used as the example in the binding patch[1].)  On another related SoC,
> there are 3 PHYs, where CSI0 is C-D but CSI1 & CSI2 are only D.
> 
> So that's why it seems (at least to me) that while we need SoC
> compatible, it's not enough.  We also need properties to describe
> PHY-specific features (e.g. C-D PHY)

I recall the same or very similar case... It bugs me now, but
unfortunately I cannot find it.

> 
> Of course, we could rely only on SoC-specific compatibles describe this.
> But then driver will need an SoC-specific table with the number of PHYs
> and per-PHY features for each SoC encoded in the driver.  Since the
> driver otherwise doesn't (and shouldn't, IMHO) need to know how many
> PHYs are on each SoC, I suggested to Julien that perhaps the additional
> propery was the better solution.

Phys were modeled as separate device instances, so you would need
difference in compatible to figure out which phy is it.

Other way could be to create device for all phys and use phy-cells=1.
Whether it makes sense, depends on the actual datasheet - maybe the
split phy per device is artificial? There is one PHY block with two
address ranges for each PHY - CSI0 and CSI1 - but it is actually one
block? You should carefully check this because once design is chosen,
you won't be able to go back to other and it might be a problem (e.g.
there is some top-level block for powering on all CSI instances).


> 
> To me it seems redundant to have the driver encode PHYs-per-SoC info,
> when the per-SoC DT is going to have the same info, so my suggestion was
> to simplify the driver and have this kind of hardware description in the
> DT, and keep the driver simple, but we are definitely open to learning
> the "right way" of doing this.

The property then is reasonable. It should not be bool, though, because
it does not scale. There can be next block which supports only D-PHY on
CSI0 and C-PHY on CSI1? Maybe some enum or list, depending on possible
configurations.

Best regards,
Krzysztof


