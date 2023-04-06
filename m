Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7246EC76196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 07:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acsxKS8JAme3fiaY0A/7VQXARsXOyYhuyHtw99/eJzY=; b=aUaBtYWb2gkJkJMpM3jbchjor2
	LDz/Dsmcx1apyFiLrCueGm+tbNBZ9ftH0tiBFmBbcbIM1q03HVqm0/dmcrC1eipgykQDr+AKbXpDm
	26k5xTRVIU+AavsB0LcSHTH6lm0JCAap5f0EQN774hfrahgk9HYcEJzAIUox/jkDATAM/BCw/jcrz
	algNtc0SLsDVJmNvXpPD9hwSDbCVpODstCFUCtIBM8rs3uIcuzj9aZUE3x26YBC+praBxwiKUWRDt
	TzlTrQIELApsKSAXpOyLA5nx3mN9nsgyQ+fDvi6A6aEeCx2NtIVad+qlPod/8XwnQqiOd6Cw7k3HD
	bls4pWsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKOQ-006fcW-0w;
	Thu, 06 Apr 2023 07:50:50 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKOO-006fbE-0Z
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Apr 2023 07:50:49 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-94748e41044so83067966b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Apr 2023 00:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680767438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=acsxKS8JAme3fiaY0A/7VQXARsXOyYhuyHtw99/eJzY=;
        b=D+LRcXAPgAjQF1qELH9IoHjo2uLJb20Wlrd57lGAmRpIlD2R2Se2wMyXR42G7HkzRc
         kQryQxhjcW+8oCmhOGDwNH+AfqyuzWruS/ETU6cOXOB30qSeFWZ/gwFJ4MzbSiOIMKDM
         o+W+ZQzFZ9ttDVSd7q3KxWZ9kCyDy5KxHg+FX6d3P1dUbuPXPTsa0ij5p4qhY7mkgkv6
         AChXS1krfUsDa2HxNhgYUo0TMnwbMgw9rA7tnAEVt6KQkDJ0U/yskXzO8CS8M8c/jpE5
         xhiLmR0NTxzRLcRPLUm0FHcHzKlUzUQdkherUy+82rDZVS8Bnbpfgw11v7NcE/QY3sf9
         6pIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680767438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=acsxKS8JAme3fiaY0A/7VQXARsXOyYhuyHtw99/eJzY=;
        b=ECtu4aQj/Z5fCHZFUz0SYfpaQcLwcVlJ0t+/sX/bS1UP015w5ccmWc5VQIuZ360+AL
         eD2VJNCHH7bPA+R8SKKeQjXH1QerY4cBtGeDI69rzdLLuMfhOgRokVOx44FeVINdkRJ9
         QytkwOHKhkpGnf9BDrC0j/bLXnRvFvJ1Bk8kVZzbSDurEcHel17VWLjHt+SZ50OBMA6+
         px5twGHSsE7F1jHxXiorZugAJ+p3lSwuV3DdTWfyj7BTerZ8PHd9iMH7ZtmUagl3m9xR
         X25GLuzmY4/9+AqtQAg/VgE5DxBI8xJdOWoZoXHlEdNlCeQzDm/72wFPXuQ8ikAHCHUr
         8oag==
X-Gm-Message-State: AAQBX9evrzmSPUqDcxk17lE0sYBFbMGEUm9DQwbHOLIPIoFfqYCAwwJu
	8kL9w/QWiOPpRXdQuspINHKmqXrpRG7Mqs76eYw=
X-Google-Smtp-Source: AKy350Z74im14UBTpQDaKfczphvzBZhLrAWZc+1VzpVIGSWgdepzgVVxlleeas6+L/T8lRwePIcQQg==
X-Received: by 2002:a05:6402:1001:b0:502:4862:d453 with SMTP id c1-20020a056402100100b005024862d453mr3727333edu.3.1680767438661;
        Thu, 06 Apr 2023 00:50:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id gg4-20020a170906e28400b0092a3b199db8sm442654ejb.186.2023.04.06.00.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 00:50:38 -0700 (PDT)
Message-ID: <d25081e4-69bc-74db-bdf1-5f1f2d2c794d@linaro.org>
Date: Thu, 6 Apr 2023 09:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 10/10] memory: mtk-smi: mt8365: Add SMI Support
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
 <20230207-iommu-support-v2-10-60d5fa00e4e5@baylibre.com>
 <9847bc48-c96c-3599-e876-bcf9ebf1522e@linaro.org>
 <CAFGrd9pBdaHLGUZHkaz2_XKafyX=dxu9UckQxrphg52EG=A1SQ@mail.gmail.com>
 <8fc3dd22-79df-32cb-c219-896eda8fa986@linaro.org>
 <fd24877a-5fae-5434-dc56-61ab35ccd820@baylibre.com>
 <e38658be-1a2a-bccb-3f30-18f1b031f71d@linaro.org>
 <25bcaa84-fb29-4343-d046-26e210fc81f4@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <25bcaa84-fb29-4343-d046-26e210fc81f4@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_005048_217600_D8B4766B 
X-CRM114-Status: GOOD (  19.88  )
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

On 05/04/2023 16:34, Alexandre Mergnat wrote:
> 
> On 05/04/2023 15:54, Krzysztof Kozlowski wrote:
>> On 05/04/2023 15:06, Alexandre Mergnat wrote:
>>> On 05/04/2023 13:45, Krzysztof Kozlowski wrote:
>>>> On 05/04/2023 11:53, Alexandre Mergnat wrote:
>>>>> Ok, I will move the driver patch before the DTS patches in the next version.
>>>>>
>>>> Or do not send it together at all, which might solve your dependency
>>>> problem. According to your cover letter I cannot take the memory
>>>> controller bits, so I am waiting for dependencies to hit the mainline.
>>>> Alternatively I will need pull request with stable tag.
>>>>
>>> Ok, I prefer send the driver patch in another serie. That will solve the
>>> dependency with the DTS a least.
>> What dependency? Why do you have dependencies between drivers and DTS?
>> That's a no-go.
> I probably do something wrong but, that start with this comment [1]:
> 
>> I guess we should add a independent "mediatek,mt8365-smi-common".
> 
> Then I have added the mt8365 compatible support in the driver instead of using the mt8186 which already supported and used in the v1.
> I change the binding and DTS to use "mediatek,mt8365-smi-common" only (no more "mediatek,mt8186-smi-common").
> Maybe "dependency isn't the good word to use in that case.

I do not see patch changing existing compatible. Which one is it?

I don't know what is your meaning of dependency then. For all of us,
dependency means one patch must be applied after another patch. So is
this the case here? If yes, then why?

> Except for the patch order in the serie (or send the driver in another one), everything is fine or there are others wrong things ?

If this is the question to me, then I am not the maintainer of your
platform. I am taking only memory controller bits, which look fine and I
would have already apply them if not the dependency trouble. Soon the
window for applying will close, BTW. We are almost at RC6.


Best regards,
Krzysztof


