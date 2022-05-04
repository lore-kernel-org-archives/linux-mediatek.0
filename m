Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FE6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 06:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KdMYYvnWUmX+e/MmRc+p6EJ8MQTbx+Qdh4Em8xHeSeI=; b=PuVRR4kFPVqpg8
	3idF8Bz+NF5vcyGBCwzEju4uWJHGS2yuEDxJvGpV9l/ijf+ohxR21eETya+UKz9opiuCghQerH/vT
	sGJImSifwJK4JqalXdLdWTdT/9wtA4mszKt66OEVnWwrFEQh92gDNpFUZrxgyhW3y16Fyy3YU8JS1
	XbFeyYeeXZNbkdAvEJjPsxwSw8pgswWzAT3jR+ZflJaRplhUcC+aAuxrwo0b5fCuBbLYKSvmGGcoP
	dtoxvVZJ4jWf3km1xLYaLtIIhbQCU/GRSY+GKdyvJvK8pVt4mq+0qrWvQIkBnVJ5O7bSakEZN4iww
	OOWqbVMh8BkDbDJBe0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm8Pr-008y3M-HR; Wed, 04 May 2022 06:23:15 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm8Pg-008xzY-Bg
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 06:23:06 +0000
Received: by mail-ed1-x52f.google.com with SMTP id t5so557122edw.11
 for <linux-mediatek@lists.infradead.org>; Tue, 03 May 2022 23:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/ICd+RLy/KAw7d3EVe6ay1LDqzY/81IaixYgq9AcSbY=;
 b=rpwOrbkET0kIgwT7jgjkT9abeD7MXV7F16sWCFY0XYvqrnO9XNOO9/DhkjGKo5fEC8
 LQVGsydxJeUsHsjGtYloSsO5mOjhiWjLOVsbTG1TaixjN+bAoacL2iw/GxBj0zkBodx4
 vLA3Gp05nHYroPmKMrYUDf/Nh0BvwS9USecPBZLzVJNf+qSRjLPvxsitLcIao/AyGxT4
 fXJ9HGJKtPlmfBh31lgK0Vrzphy55k/UPpusjkV28x0tlBwd+8/woFCDU6lsFOjHjx7D
 rcX8BYTVfgpq1QmhxC401z58fYWnlv2HQ112BoTHSgFA6fNMgw+zWPgMxqcMKXF/EE+5
 2bjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/ICd+RLy/KAw7d3EVe6ay1LDqzY/81IaixYgq9AcSbY=;
 b=mE0YjtD4d2Wz/4XlmtABWYpzg65MLOSk+q5zg2ec64fJYVRCnmJPe9MIHuJpf2l5cc
 +p/NLqH2K/Qa2in19kteN2g/9b67GNSWcowZy5yxyQiYQ+qsXq4+ujI2gRWCaRJnpaO7
 zIoRjWaLioKDwdSv96amofNHmo73gzpauPdpkfABJjVgBQF1dtWvCaFao5+37b4yRh3T
 aw9rDDuEKiHENapT9ss8GtiS69EUeOiul4Yjiaxkum2P202X6fzw5cI64obNYQCOlSEN
 +0UEO/ShizLs6Z3qxJViDuBcyDDISfSgDAD1ND3aub4lJ+eGbM8Pp0HkA8+GzS4P91qQ
 YgnQ==
X-Gm-Message-State: AOAM530NcIfmO8yzbfeMFNnm4qqNoCOlaPomwKAZ2YnWYOd7lpU8W8/p
 kLj4JYXrdaAw/sdxxAqxlIje0g==
X-Google-Smtp-Source: ABdhPJxFJJFSk1xLxRDDUo6zVnxtiMbpr2Qusve+SaBXHlAci0YLKutD2xiWzzJnWIPhl2fkSQ8riA==
X-Received: by 2002:a05:6402:154:b0:423:dba8:c7fc with SMTP id
 s20-20020a056402015400b00423dba8c7fcmr21473341edu.346.1651645379646; 
 Tue, 03 May 2022 23:22:59 -0700 (PDT)
Received: from [192.168.0.207] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 gz25-20020a170907a05900b006f3ef214e63sm5351504ejc.201.2022.05.03.23.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 23:22:59 -0700 (PDT)
Message-ID: <a86ead7c-4bea-c4f3-b53f-38fa33e74942@linaro.org>
Date: Wed, 4 May 2022 08:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Fix optional
 reg-names for mtk,scp
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20220429211111.2214119-1-nfraprado@collabora.com>
 <20220429211111.2214119-2-nfraprado@collabora.com>
 <a95fc4a9-af6b-e2c2-ef41-df9742d393de@linaro.org>
 <4bf2343b-3760-6ebf-7463-0b25fe9d942e@collabora.com>
 <20220503204125.a4xwd7a5e3fxf7et@notapiano>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503204125.a4xwd7a5e3fxf7et@notapiano>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_232304_451409_91B37293 
X-CRM114-Status: UNSURE (   9.65  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMDMvMDUvMjAyMiAyMjo0MSwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6Cj4gCj4g
VGhpcyB3YXMgYWxzbyBzdXBwb3NlZCB0byBmaXggdGhlIHdhcm5pbmcgZm9yIG10ODE5Miwgd2hl
cmUgdGhlIG9yZGVyIGlzCj4gZGlmZmVyZW50OiAic3JhbSIsICJsMXRjbSIsICJjZmciLiBCdXQg
c2luY2UgS3J6eXN6dG9mIHNhaWQgdGhhdCB3ZSB3YW50IGEgZml4ZWQKPiBvcmRlciwgdGhlbiB0
aGUgbXQ4MTkyIERUIHdpbGwgbmVlZCB0byBiZSB1cGRhdGVkLgoKWWVzLCBwbGVhc2UgdXBkYXRl
IERUUy4KCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
