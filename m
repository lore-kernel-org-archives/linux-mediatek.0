Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A5FC04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 10:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K04i3J9QKasLVBVCxLEb/1ZPje207syI142n4RiLLx4=; b=K3cnR4m2LkKvAfxzoQ7dI3g7Yq
	TKNsB+JPZ2rOVwOQWjQcmmCM8riOLIZokpAur/HVMvvRaxq8iHmZi1DVBhE0Pllu/Ti3Tbt2A+SM/
	eU4FjxSvEi/tE/OOuJjisoqdaS+j2JqVMBD8KFY84gqjjNoZy34JbH6Zr8hq0He2ZQrVSlYFs/+RP
	RlWK1qB559/gWQdZ7f9iGc+7JVPuAVg4MioIO8hCuxAkBdrSAR7viG7Zim82dnanP0xSYB8s0JlWs
	kAwGSPv9MJftk6GYeIWNCe5wfszCz51Gc2bE9JNVuw31LF7HhSOfd1Prz31J1xJDjQMxNzK3x9XD8
	Z+RqPlxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeFT-00CLf1-Cg; Wed, 27 Jul 2022 10:26:39 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeFH-00CLWG-IV
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 10:26:28 +0000
Received: by mail-lf1-x132.google.com with SMTP id w15so18420868lft.11
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Jul 2022 03:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=K04i3J9QKasLVBVCxLEb/1ZPje207syI142n4RiLLx4=;
        b=apyyy1Uz5oB0j3rdRFaB+GtFHqttB0ZsK0QRaYKkflr6f90+2uKYeKbTFH4OX80TyC
         0wb4sADGXRC/cD6S8FWY3ljlX6OnY0iPxRfVEDoYfqXaMLwNMhS8dFY5yBSIPrKSQIjM
         2D1Urr/e2D9l7xYBxpLtMzXuoTz7lBBR87/4Mx7skUQtH4zYlbTaUtfM1ZCU+h8gbcGn
         i9b/LeQ038L/NQGMQl2guVEq24SR+SETm6bqMuM/8sSV/4XKhdNysNHHSOIBQ1bHuFJi
         Y9qjiKFyj+OT3wRyJ8o8MgEgqWU9V5X9cQUyP12JEFd1q5WbotbJcleh4EFN2Jf4PRZa
         /3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=K04i3J9QKasLVBVCxLEb/1ZPje207syI142n4RiLLx4=;
        b=7YtmhEUgjg0mYjDNT3ZBwQtJ5OG6x+MiqhH1DJejPM9OBBeV3ykHURHqNA6t1e/wWr
         0C1UEUcOJ0KAXmcS3Jzle3uMW/KaH7SecuKXbs56kKrOcCD7evfOuChP9ZOXAWIeOCXp
         UzTuPnw1kdqJts/d9kRa1UyrwBqUMD0HjTyM3BWDrssTUWN0Y7wHMU72PTIwamgiJuXd
         m7cjSwJuptjTJQi+oZQObeOxVOvyjcsN6N2EWRpV/1TjYUTvQqzjT317puoE29DRMes1
         J/jU3oLpcFfx8waJc9Oa4f0nLPg0ZFsS0xAcQojcLqCLfqWEN1fyZytlEPE/sTdyz6WR
         rqIQ==
X-Gm-Message-State: AJIora8g2DopBGx0fbyq6Jn6tB3ai+S128JXFn5NrNA4YA9HQu4iiznV
	iwClgoqV/iAVVTem+A3wgkJpJw==
X-Google-Smtp-Source: AGRyM1ub6aWYl88ATON1HqYQTnyfdKRKpDm+LE6MAHOZrjagndoPzh3zBhysAkmu6+tSJjT33WerxA==
X-Received: by 2002:a05:6512:34c6:b0:48a:8464:cc53 with SMTP id w6-20020a05651234c600b0048a8464cc53mr6866460lfr.275.1658917580917;
        Wed, 27 Jul 2022 03:26:20 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id t16-20020a19dc10000000b00478a8b7ab1csm3697977lfg.150.2022.07.27.03.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 03:26:20 -0700 (PDT)
Message-ID: <87b3ccac-ebde-1a7f-d48b-571a6f925ea2@linaro.org>
Date: Wed, 27 Jul 2022 12:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: soc: mediatek: pwrap: add compatible for
 mt8188
Content-Language: en-US
To: Sen Chu <sen.chu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hui Liu <hui.liu@mediatek.com>
References: <20220726104242.24839-1-sen.chu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726104242.24839-1-sen.chu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_032627_668944_ACE73F11 
X-CRM114-Status: UNSURE (   7.73  )
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

On 26/07/2022 12:42, Sen Chu wrote:
> Add dt-binding documentation of pwrap for Mediatek MT8188
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

