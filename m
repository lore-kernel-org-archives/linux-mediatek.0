Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2828C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 05:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGJMWLnnw1TNjAcH5jejTOIieThYiOC+fZDvfBG4mz8=; b=wNDFgjLEKWve16J/NhuZGJD4eK
	s22gp39bY0bCsKVCzmHxqKmIG9KRa6ap1hww+ctWGhjfRMx6uITWTrmTegFP7B8fGcN9CH+UYz9Oo
	qUa2zuRGNM4Jm0v2P9AikrZDkjfhoMuMkA2dlA0FQoob66WqRyX85AwhL41FL1TfSEkcRsIfwGplL
	V+96E/axPmvdfVJD87J1gmPA9DdwFChjY5Zf/fH3kKOsr/pnJXAvoiC3ii1nzHS1y3ERZ/Fr52e1K
	nSI9n/1Nf0io2KXfKvuc5QiauebLL1zVuXeZWbY7Sh861Ks9F6QcZt2vBZJ9jlrJYUGFX7AGw/umc
	E643Ybzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm6wL-00GW5I-0m;
	Tue, 11 Apr 2023 05:53:13 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm6wH-00GW4R-37
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Apr 2023 05:53:11 +0000
Received: by mail-ej1-x629.google.com with SMTP id sh8so17411361ejc.10
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Apr 2023 22:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681192388;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGJMWLnnw1TNjAcH5jejTOIieThYiOC+fZDvfBG4mz8=;
        b=s3zZhrocrIy2rTP4h8m2drsdqMkByiIOLURPKhB8XqC2agb3wLtUWKxaNuv/9seJxi
         DfbbjnS+IG10sGQCXlsTftEgAglP3Het6I054hYHRQMqYlsjBXvl+R+UMqxVbL0LXD80
         G08+R9xzdaQpdIxgi+Jyotr8onstNUYs60vuKQniHNzOk4jyckv+TiZHl7AyP+DX6ATH
         SfeJFsLy8lx+tjVvoLamTSEQS8jkPtanPmdgHV1gbmZf55AAVgKQkWry4TBdH2tx1WJx
         NTOos6qbuZp5oDj2kDVURMbIkCFHbpnA3ix4NG+WV48ceQJd1oKniIN8T1v/5daMuz57
         01Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681192388;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGJMWLnnw1TNjAcH5jejTOIieThYiOC+fZDvfBG4mz8=;
        b=AyQt1HCipHgCSt56rJEiu+NOCCkZye3CKvEvNzjKsC952kCybyaZpNbLXUEhRqjn4R
         bYAoWfqGTUq2eopXtptgqiUpQ11RZbESbA4z4v9n0ud4ISpZjApCRJ9oUECQCK6TxxF7
         Al3GtP3K/qGjddgY/MrJFtwWEMbTZHD7b7qjh3lNm/xXqpTBLwv6HNzlmCt2wR/PxMok
         DbZFpmCMMPIFiZjNrLsvuFX+xm9BoBdAj/bfEVYxBSMo2rTqJiPXC1gSH6sn49TkKwfi
         pMGahzKqDfeYnQzrLDhkbcmKm/IKxIAd2SGoWj8Z9p/ar0TzFgPrbGZzDxI1r2aBeiIT
         vucA==
X-Gm-Message-State: AAQBX9da715vw8xtZ5n0AJflEQiWfXUXuhJ7yXKFbIJvFeSOxQyv03Y2
	05fP6PD5CABDHvyBTCghDYT12w==
X-Google-Smtp-Source: AKy350ZWHQo+x68Mgme9ibvo2YSW6hSWdaYSmIIyZ5VsnI+E/RGiFgntU3XgfudiE8WlsKWYJ8BENg==
X-Received: by 2002:a17:907:3201:b0:947:c7f4:2342 with SMTP id xg1-20020a170907320100b00947c7f42342mr9794316ejb.4.1681192388337;
        Mon, 10 Apr 2023 22:53:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:dad2:72b7:3626:af61? ([2a02:810d:15c0:828:dad2:72b7:3626:af61])
        by smtp.gmail.com with ESMTPSA id d19-20020a1709067f1300b0094a671c2298sm2359644ejr.62.2023.04.10.22.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 22:53:07 -0700 (PDT)
Message-ID: <604f8aaf-2dbb-2703-c4dc-960a820ee961@linaro.org>
Date: Tue, 11 Apr 2023 07:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: i2c-mt65xx: add MediaTek MT7981
 SoC
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-i2c@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Shih <sam.shih@mediatek.com>
References: <cover.1680857025.git.daniel@makrotopia.org>
 <4ad55cb4248db60111c20d833631a65854fa1d02.1680857025.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4ad55cb4248db60111c20d833631a65854fa1d02.1680857025.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_225310_006063_C79DF588 
X-CRM114-Status: UNSURE (   8.30  )
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

On 10/04/2023 18:19, Daniel Golle wrote:
> Add compatible string for the I2C controllers found in the MediaTek
> MT7981 SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


