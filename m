Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D26AC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 06:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGIlqhxSlWfDFHRJ6mC4b3eFYcIQYybstvvJnU9esOQ=; b=dlUZeUPL8lFq9WGCS1Ovd11vrz
	b/bQN9RVtv45uS6/+hA/4Bw9n1aDYC27cz+VVdo3EUSECgfs2UCZN6Rzv6GW6DJl/uSXicKfNcMCT
	uRlwljHQC22Ghx549Q2/q+/OvbdzHX6wdl/pplJN+EcasYetm6V+jAITCbvt7igNlr0+M2KgCxxNh
	Avl4mda9rAlh+OZxTmIXoHPRhoeuNrSRFhIMSTRxBTEG23vlhrdP2oEefT2G33MX+5eGT57sRP/Sf
	+OhV9WwjeDYH+M2wPRCujRksbxYqzv2ayMpeT5ecXtmEnbl9nQuduvGzr07e+iywfqupko6IBLD8C
	zxJkmSfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE3CC-001JFA-HR; Wed, 20 Jul 2022 06:28:32 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE3C8-001J8z-RI
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 06:28:30 +0000
Received: by mail-lj1-x230.google.com with SMTP id by8so16368861ljb.13
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Jul 2022 23:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iGIlqhxSlWfDFHRJ6mC4b3eFYcIQYybstvvJnU9esOQ=;
        b=UhRYFA7/LdF7XYBnvxrhbtAKNgFbmStp01s9LorBnZT9P/gNWlUpzMtDsJ7V13Hj94
         2KBIksodqZwwgXfk90DaKlYpfP/fkforCFjRfcCGg1PzzBuHUbe4UC8KjHDw7pc7Fdvq
         AHaRWe4HyuvuPcviYulWebVolSWtE73diELmsBeyJ/dM0Kz2uKD4ETpcA4/tcPaaIKJV
         VVrhWEbLg5rhyZ1yL2KXRNcwL1TtB9XOnWKktJMRsMcOxJs6leb8iSwnfDGFiuTuqMii
         Q8ejJfNCFQtwUyMlokGb7Q+4yH18Dx/RpNeRrhS6lMOBU+rBxDf6r7FNeZhRAWqoI4RG
         oTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iGIlqhxSlWfDFHRJ6mC4b3eFYcIQYybstvvJnU9esOQ=;
        b=UM6O4gof5AsdL3ZL/iA5NMhLvnhvRPUKx0dL5D7Ya/a+RFafWx9K/pt4TP7ib1KRCT
         dzzQcpSW4+M4XefpEf/dWZArXZNxQpsz5Pk2hreGrZjCHHIlOnE8x4UvFqP7erA+bNpM
         7G4Eb+lMHMmpa3Utq2kuzyrmr3668BuY/VibSu9rey/KzF2XlcXdAwJD57TRPDorxFol
         +u+ng3DFTGoL/DVZu+dAjHL1z4L7KlB2wkAKBz2ckZK/DjxLnsIPwKvOPjN+L8pPzO+i
         eFb74RNqpFlnImbMOzwY5K+c5iHsHUt/kspiCGrMCtQKC12zLl9grzyOf1OyLzJxogWe
         4DQg==
X-Gm-Message-State: AJIora+NOQ/vobftBI9R7VJmf5M8ONvabezYDzMQYMEQZMEly6iQQ/HS
	w11qxVNIGpkgsa2j2/JGS9hUeg==
X-Google-Smtp-Source: AGRyM1siG1a6lGXNfYqKnVxqm2uEHALLXWVQNvG6wDpmJgK0FropWIFYWjsRsqncZiQDfr78WgDjoQ==
X-Received: by 2002:a05:651c:4c9:b0:25d:8599:5637 with SMTP id e9-20020a05651c04c900b0025d85995637mr16842827lji.163.1658298506308;
        Tue, 19 Jul 2022 23:28:26 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id j28-20020ac2551c000000b0048329aa6c92sm3607514lfk.139.2022.07.19.23.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 23:28:25 -0700 (PDT)
Message-ID: <2a19c8ec-ee4e-5a6d-b2ac-a25ef080cd09@linaro.org>
Date: Wed, 20 Jul 2022 08:28:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] dt-bindings: media: mediatek-jpeg-decoder: Add MT8188
 compatible string
Content-Language: en-US
To: Jianhua Lin <jianhua.lin@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220719100214.2096-1-jianhua.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220719100214.2096-1-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_232828_918319_4AE89A1F 
X-CRM114-Status: UNSURE (   9.56  )
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

On 19/07/2022 12:02, Jianhua Lin wrote:
> Add compatible for MT8188 jpeg decoder.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../devicetree/bindings/media/mediatek-jpeg-decoder.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

