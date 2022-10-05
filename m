Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD0DC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 07:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUsLX/hWASy12r6kYppLjzYWaxoDQvN3XOBwDMKiNOs=; b=QtJz1frKn6OMGvTQPATjTkc4oB
	B5qIPsM54hVI+HJzkmA8BAc904eyqMDHnIRnHSaWCihV1Gszfb3mM7hpZLdoTcX0j1lQPSUtmZQh0
	+wAKeDDDcE3LAUG6cgJOgGm0LcHrfE1vvzEWq2nHcojHkvxXFIUkZteN5+NFFn2WVYJfqyRoyqmSm
	McjNRlb8t0SIW85UJEQbzju0MlQweZRGp08FfPEfafI2JE6+St9qknlF5lACmr0deXmQzasHQw4+d
	hcVuys2FxuD2P14u6fGBwBZx3f9K8qCx4hqN8+2agbB5wFKAOnc7y88nrPV3rYzdwk64UdxywK9or
	Nh+hIwMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofzIf-00CwDW-By; Wed, 05 Oct 2022 07:58:41 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofzIV-00Cw91-HX
	for linux-mediatek@lists.infradead.org; Wed, 05 Oct 2022 07:58:32 +0000
Received: by mail-lf1-x133.google.com with SMTP id s20so8764286lfi.11
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Oct 2022 00:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=KUsLX/hWASy12r6kYppLjzYWaxoDQvN3XOBwDMKiNOs=;
        b=XoO3jDPWWS4/Pndkc6qxbPbxflHYBqq8Xtdl+9T3JA7WXPzxf9Xr8qAN3L+ExOlG6l
         vB2OJB7h6jxQXiZwug0EhespStT9RcAFVPOKOGo6QT7v7LKes9sqjaSRzxKd3f2jq2DF
         L8wiBEpFJaztuO8faVSGNcev5Rb5rz0WmPia5PoyqXOjHsAitcLCex+Qu5XQo2yH+GvA
         vIN53mRFYyJ3mmdEhh0SbMQ0avzgdPLiMPl4LgPLrLmmP1GmJkoa8Z5lUKE76VtVEtKx
         4yEWuy0QrUpdTCHB2F6I4Wh/As+oj8ZlWkEEg49sXfzQwzSeBoHYmjpJuHUnyVRMaouD
         nngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KUsLX/hWASy12r6kYppLjzYWaxoDQvN3XOBwDMKiNOs=;
        b=EQYrgJrKyShGiTClLCQ+90X/fMGEnP2avXDIKfnkbBjjy+qRsvEw+c4L96elChMWyh
         V1wB3JZEZapCUrKvIlMFrDot++5HhyyGqL/R8oc4c5/2heCo1vWwuHX+7tEidgGkb845
         5E8ocPZPvrB9vA+O9dWJNwYDvieF4rbvGC3OTkGlrOuNN+F3YMHD8iV0hzCiJjW+GAT0
         D1nhCON4cFL/Es4i353rOINDUwx53EXMp0S+ITnAZvn/7tRUK03BR4tw4brGU7Jo6yS0
         b6kKneBprz5caX2VKsvVikGUmiM52TxwgUdzfA7EiTmutZ+Rmtw0FO5r7+jzsOWyRKV9
         AUFQ==
X-Gm-Message-State: ACrzQf25QImItW4jf0EhqlYUIRLdraMP9PfAzLdhXoxHwOotfqZAoLEk
	Pu4cVbhrlncv5OMC1SMAWRK0yw==
X-Google-Smtp-Source: AMsMyM4+3dxfgnnUtl02AminNqeaOjFbPBjmac3Mhxv8glQtFW/MU/jdxOlIiFf6p4bAoKKNG5KGpQ==
X-Received: by 2002:ac2:4d28:0:b0:4a2:40ef:2996 with SMTP id h8-20020ac24d28000000b004a240ef2996mr4025845lfk.425.1664956708094;
        Wed, 05 Oct 2022 00:58:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 13-20020a05651c128d00b0026befa96249sm1527520ljc.8.2022.10.05.00.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 00:58:27 -0700 (PDT)
Message-ID: <c352896a-0e12-a946-d018-764fa0f2a95d@linaro.org>
Date: Wed, 5 Oct 2022 09:58:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 1/6] dt-bindings: soc: mediatek: Add support for MT8195
 VPPSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
References: <20221004093319.5069-1-moudy.ho@mediatek.com>
 <20221004093319.5069-2-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221004093319.5069-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_005831_587584_C334072A 
X-CRM114-Status: UNSURE (   7.80  )
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

On 04/10/2022 11:33, Moudy Ho wrote:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add compatible for MT8195 VPPSYS.
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>

Missing SoB.

Best regards,
Krzysztof


