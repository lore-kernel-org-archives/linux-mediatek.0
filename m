Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F0CC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 11:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrWurgVPG0qiJRdgja9LzVOWApxDh/34f9DQdb0kA74=; b=NQr1Co+iz2LZkdg9mCzuK4Sosy
	HL56ZoYXwQMQLt83g9EDqtmrMgRFL8Ni6ZXNALN0G1sINVhFhInRliHMMAdQqrp4CUfWddB1aCblm
	/a4pYLuI8Bab0JvgEP3ZU0M+CMfLffhDpGME6NpZhtd+x6tJYmmVslPbSUZTBOsXmFN4EcQ1qXOW5
	j/vBDJUl+BWoW6ISH1MuGnfl1j3JWmXo46+L886SCNiggbv9SZoKv5dxIPtX0VVIpwpaPXGaKssVJ
	jMrxoacLPj65K4N67ws/qbByn17PkmutwnwnYzmaUYEBTEaOOhI0GL/KvjRb6ovbZAFPLf17OEeDs
	5+U3w2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRXe-008PS3-0F; Tue, 22 Nov 2022 11:34:18 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRXc-008PQA-0j
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 11:34:17 +0000
Received: by mail-lj1-x22e.google.com with SMTP id l8so17589626ljh.13
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Nov 2022 03:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrWurgVPG0qiJRdgja9LzVOWApxDh/34f9DQdb0kA74=;
        b=LEavIb6Cr3MwjkDB1t0fvas3S+72QNinSDFT6rgfsMKvF/CXIiTzz0Dz9U5UyGqzy9
         RxsOTc1SDY2B3YTXCCgm1T0p4oek+xE6mF6p1tnFli+ubpLd9+9Im4gDVD/AqB4/P9B7
         aB4IAwfCKFgoDFdqwXF1eoA8OHQndRSy8l1dl7+nsk5nBqNJhi+gVBWrM49GrGWhkZ8A
         GPJxOCDmbzwi51peGdfiu0R3egwiCVd58YnzviS8RM4jz+s9KuFj3NRMMCG5tP70+iWe
         3zu/fyslqrwc9pic7Gs7ZPaq5oeZkTFZppY1uCjzMK0Jh4jusrvr8inuXdxJ47NjW7S3
         QZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrWurgVPG0qiJRdgja9LzVOWApxDh/34f9DQdb0kA74=;
        b=THCTNXf8qe7OhJb4HhXpZzLqgeuEthHt3Zt9DSW73nteFYVL+GGGcAab+ThOU6EvwY
         MN4c1y3WsMwTXhBJRjqCYGrjvgqu1Z3RiqCoBrJSy+1wzuuyVdJb7jbvTeE6r0qaUEKP
         LIDedj+CB9sU5lGaTCTA1Y59ytlp/Jrr21ExEb5Dzge8M3dWAtjTyKva8o53jhQ11PUf
         d8YRGpBeCWVM7xp/W2KVZ1wLyZqpCLsoGWEUIPuYRoHdmdlS6wjYpc6geFK3RmAAkot7
         CmYSA9ZBGjW8hs3nsuNuglzQ5PhqDbNpFEKDqPgHhvWBfE4p2oXnFOmqxf28rDm+jaeM
         AwQw==
X-Gm-Message-State: ANoB5pkHRMDfIgqNQLLldxVa0M/cdUWCj96wHTQUkYKxtRt2L+DRlCBk
	kso5l/IyN3GkCiAoWFfzJZNvoQ==
X-Google-Smtp-Source: AA0mqf7jtaOr8BZ3KmN4i+bmugta3iqpOTAuQ4ZfTx78W9UZe2k0Mz1ZKNiJ0JTGWruWdzgUMe1NVQ==
X-Received: by 2002:a2e:8250:0:b0:279:744e:108d with SMTP id j16-20020a2e8250000000b00279744e108dmr24536ljh.94.1669116854410;
        Tue, 22 Nov 2022 03:34:14 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a24-20020ac25e78000000b0049adf925d00sm2459530lfr.1.2022.11.22.03.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 03:34:13 -0800 (PST)
Message-ID: <8fcec473-ba8a-0ba5-84df-dd42829f3894@linaro.org>
Date: Tue, 22 Nov 2022 12:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 2/4] dt-bindings: interrupt-controller: mediatek,cirq:
 Document MT8192
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 tglx@linutronix.de
Cc: maz@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, youlin.pei@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221118100639.33704-1-angelogioacchino.delregno@collabora.com>
 <20221118100639.33704-3-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118100639.33704-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_033416_088941_F1DC94BB 
X-CRM114-Status: UNSURE (   6.00  )
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

On 18/11/2022 11:06, AngeloGioacchino Del Regno wrote:
> Add compatible to support the SYS_CIRQ controller found on MT8192.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


