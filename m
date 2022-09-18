Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3FDC54EE9
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bymflm0cWcyCTcdpDuivzckUWs78vF1VXtEIBmc274U=; b=HQDiqmm8I6ryopg0XI7hBlGhcc
	QAxg8epGlcBHvRTSWvURG8+uHWXxMmaRaobLBL7MJnNeTZRqeBjc/Q2draR7q8/W9xZwifQ9fY27D
	Y4QMIbm2v2SXWfGJREcXBViDPosISoe0wciqb34+HXj5VuqbtZX3+FiAkwNSdSG1/246VJA1VZ227
	a0VTeYY+qFfl5zWuNPlRY/o7/VmSNvU4r3ts839MLy/ijTMONbRi/kEeaJAUEA1IiBsiVQt7dVXcf
	mW0CQyiMLPpCEXiXaVGVAPCXXPEJ0Dbng2SbGQ+br3rc+r/AikB7k4zrrIhX7SxXwO2QrGZXwvh7q
	OBOKmoDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZqpW-00ES8e-EX; Sun, 18 Sep 2022 09:43:14 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZqpL-00ES0f-Tt
	for linux-mediatek@lists.infradead.org; Sun, 18 Sep 2022 09:43:05 +0000
Received: by mail-lj1-x22c.google.com with SMTP id s10so29968915ljp.5
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Sep 2022 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bymflm0cWcyCTcdpDuivzckUWs78vF1VXtEIBmc274U=;
        b=TI0J/rsC/B5GyVft25Qvkb3DYyVwMDmddjhpplWK+hlHUTclerDLmDiCsjcmUzSTjq
         WDZa7usVHWlBmPh+0lAUg6l8VMWF1fib95uSb+FJyS/sq7R66K/2fq0BVLERFkYVs7CM
         Fc5avno0PhJKEaw9xoUMVhNMb+CZF2J6Dr/4nV2OCegSKH8vafgCy18voZtuyq0wTKvc
         YVaV3p0gDQHoEsxP4Z6Z+DPuoE2Cv6wX8WWojV4ni2kNJmSGbBXeXE4x3ZFzQ7FhXrdO
         3TFC0XTKG6pVompPgIugtC8kChWJ+hb16XieXjhEm2qRQBOihMeRohAgq56bHQEABvMv
         Mghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bymflm0cWcyCTcdpDuivzckUWs78vF1VXtEIBmc274U=;
        b=60tyxtKq3Rl0nzAKgLc2uCFwK5Dak8dMAQYGUMpt5rGFdFM1D/2bWw2OeL/5unZOG2
         +9Gb73tKEJQ5EG6fjlzJ2p2tswmP9wmhdWZEYAX245RhsTIDK7dVcJ5vOf5ADU8Mt+53
         1cy0E06d6wzsozgXItm5/28f4Y+5ZODqFjQPrImQEvTVDxY0gvqimNgaR8BHIcB8iGDE
         U8ffxU+QNmywCWIVvCx4+1URfKHcLdjKzw5c3zEwwIwJnfRMW8jeUmttH27EcKHHZVna
         tsqF9hcHrB5fakpLhmo6iLdVjCi7V8p0oYArC2kKWLtaIIGHLY8XH5qRXK2R412oeP5C
         b9lw==
X-Gm-Message-State: ACrzQf1fOcCdOf3rXGXpV94nqFtk52CivFFNdDkTziNafaG7ubXsla6X
	PI44JMgKjGBX/dxgKMQPjG/new==
X-Google-Smtp-Source: AMsMyM5oa1+BlsQvoBLSHJ7qg8UbLPA6SYwqWrNJ6NOOwZcdHftell11JoXnHhdlBiSB7vRm2amj0g==
X-Received: by 2002:a2e:9cda:0:b0:26b:e930:6f7d with SMTP id g26-20020a2e9cda000000b0026be9306f7dmr3860677ljj.436.1663494181646;
        Sun, 18 Sep 2022 02:43:01 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v17-20020a056512349100b0049d3614463dsm2805245lfr.77.2022.09.18.02.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 02:43:01 -0700 (PDT)
Message-ID: <46046974-78a5-1aa5-6d39-d6e41645148b@linaro.org>
Date: Sun, 18 Sep 2022 10:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 1/2] dt-bindings: power: Add MT8188 power domains
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220916055216.20139-1-Garmin.Chang@mediatek.com>
 <20220916055216.20139-2-Garmin.Chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220916055216.20139-2-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_024304_033440_74B858F8 
X-CRM114-Status: UNSURE (   7.17  )
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

On 16/09/2022 06:52, Garmin.Chang wrote:
> Add power domains dt-bindings for MT8188.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Change-Id: I62dff8af2bd74d6148712bfaa1caafc0b49e4b0c

Run chechpatch before sending any patch.


Best regards,
Krzysztof

