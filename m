Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA78C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jun 2022 01:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kccO1sMt4IVQr6gw8NGeYzykFCi2kqGNpB812cIxBxQ=; b=43mAHDpo91eM4LQuwksP1UWfX9
	cHJXv+ZtAcuoBApXbR+gUHJWh5CtAE8wWQBchhCvjO1SVU7S9Y+74Mw+MLiuazzAqyBHi8W/KygeR
	tdagjKH/1fNSQgwWU4WksLrisZR4pivn7Ry5ckTBc+486oj5NqK6qJg0EDvEZGqbVLsQd11Xf5W0V
	tsXlHzVLwjspK0QhpgO+7UODdXIb93SMGJ5ADJ0bW+bTkZmP6N+OZx8ROLQJcTJMGBNGZDVWj7m/d
	U+MHcUunxppPr6nI7PgN7QGl3wSdx9L4lZtwTaCTLXfTmGN2mIKkNiU/FbuNa5lQ6TSfV2uH3izSy
	tKRSg0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2NIG-009v6a-OF; Sat, 18 Jun 2022 01:30:32 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2NI6-009v1o-G9
	for linux-mediatek@lists.infradead.org; Sat, 18 Jun 2022 01:30:23 +0000
Received: by mail-pl1-x635.google.com with SMTP id t2so5202291pld.4
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 18:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kccO1sMt4IVQr6gw8NGeYzykFCi2kqGNpB812cIxBxQ=;
        b=Ioe5DkyWJUeiwfoMr7ODaDKGOesLncavP6wtKSksJhHVKrDVOXesQ0nqm3M2VNRMTX
         HCzrQOQHFlgjq9HVLmGOcyH8Ofc5weCssmQqWl3CvELT8LuSt6N3O/a48rBLHG1l+Q1V
         rRHG+2hYR5g+QlL2bCVnFPVsWVNTUAs40w6Edon0+xyj/NfoMbnSvNYUeqLEifMUySa8
         u4c6DSZBK76Vxw8Vcj7Hp1ucf4yVYNl5JQQopScaE8cB8cxp13rMev5/L2vH/1B64sMa
         l5boefw0GopANX4I/3v8I4Vb+9wmJAtL1BXYvIumfUZVCmKzZ4AKqYSaqiNgxj2KYr8h
         2WxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kccO1sMt4IVQr6gw8NGeYzykFCi2kqGNpB812cIxBxQ=;
        b=QruDJAHOD2PVD1HjnPHR3kFeEBHU2Rf2eYn02tsrtMJ2vch/DCIOwbAos95hEgxUl5
         SBP/sFI28aBFmmXWCGc/nhtEkvyzmkzQxk7jqZdw3q2fUv6AYvXwSsxzJb0ZGJasoav2
         NbaaS3VyJd4QB89KhujeSW0clLSzyf0cQjgZ6a7Wi3bsapmvT/sKosGhnPx+wFdlFgZv
         8TrxPodBSi9buCs2nEJISco904v4aUz4IuyHJWNwhbsGL9EmolCxAKmgU2XC7RLajUfP
         x1c4+CS8z/H7omz+WDTS0M8obmeMpaCMadqUXuhYY9oX3Ofhx9kA1huhN+5HScXqGD47
         jEbA==
X-Gm-Message-State: AJIora9ATWYLlwLIoR6l0Us5uJ4gESlfuLTcJCFEzKrHwUXUvDBSAnhE
	DqyQT9/l4MJgtGuWTAPNG36P8g==
X-Google-Smtp-Source: AGRyM1sBVJ08gwwl+dJAYTd5lGbcy+Oefegkj+zaP8dzefkur/3JBpSgRNNzTpRceEfMuwaL/ag7og==
X-Received: by 2002:a17:90a:17a6:b0:1ec:74e4:d7a3 with SMTP id q35-20020a17090a17a600b001ec74e4d7a3mr6495840pja.115.1655515819514;
        Fri, 17 Jun 2022 18:30:19 -0700 (PDT)
Received: from [172.31.235.92] ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id j3-20020a170903024300b0016378bfeb90sm4157527plh.227.2022.06.17.18.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 18:30:19 -0700 (PDT)
Message-ID: <8959f1ae-22e4-7a21-2fe3-4b668d83ee97@linaro.org>
Date: Fri, 17 Jun 2022 18:30:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] dt-bindings: usb: mtk-xhci: Allow wakeup
 interrupt-names to be optional
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org
References: <20220617222916.2435618-1-nfraprado@collabora.com>
 <20220617222916.2435618-2-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220617222916.2435618-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_183022_599952_FC7F1387 
X-CRM114-Status: UNSURE (   7.57  )
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

On 17/06/2022 15:29, Nícolas F. R. A. Prado wrote:
> Add missing "minItems: 1" to the interrupt-names property to allow the
> second interrupt-names, "wakeup", to be optional.
> 
> Fixes: fe8e488058c4 ("dt-bindings: usb: mtk-xhci: add wakeup interrupt")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

