Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EB2C77B70
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtGg6EdeR1iWsnKc8ccT9EWwvpg7Ri/EQo7i3jzR82I=; b=zdtetu/+pSPh0bMBM9jJjlEb/F
	nVPA1ZxaQpmgqn77pLbOb3GfhHqjBDjykk2tSqh8TVkdpr6Sy/L4Tgv4N/adwxjfkUmmoGTgJoyzG
	UfsjRTLIWbK+cAL3LWl5+6sz4KqVoozDbYgOc3w2A1hzKtqVpNo9s84wB2lPolWOX5ZWRb6LaFmh1
	ZNdjUOVpdfZeprmwtSWDR60wY1SaMMXxSrej8DVFh+ZVlxCkULSoPcdqlijRYzCCWi3tmtB4m7fX3
	lk73eEL3MvB0h1GGdEGnu+FMedFG4pSibIabJSergZ7R1KTAPurCqjT+b61hb6CkIbMhRCxJgBNTm
	FKYYcCAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnF3C-008lYX-1d;
	Fri, 14 Apr 2023 08:44:58 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnF39-008lXN-2g
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:44:57 +0000
Received: by mail-ej1-x633.google.com with SMTP id xi5so43810331ejb.13
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681461894; x=1684053894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WtGg6EdeR1iWsnKc8ccT9EWwvpg7Ri/EQo7i3jzR82I=;
        b=GM+UDgoKcnPK8SHmTatJJx43LucAVS7eKRP+/RJCszUCg+G+h0XPrpc2YD5/twU/OS
         XB1UYwwnW70pmmAfHfR28SphT/wfRQ15XUOjkDUCPTAp6gyEtMu5S/EjTk4CgRnkwJNg
         1orOetsMl8CDhec+QN1Ho6A8xMz1nKy0gKiLvOqsZeV1mWHRbVxeesSYjRt/x0whfHu5
         OtPxCJPuSujQnoEwZHS3o8T8ta9Ed2TNsgcK6oYRzdVnHpfqGO8EkrKdVoxFNYWyNlHd
         lNo19R0QHQKXkt1D5C9xjSjGMOgzKAUmVLJuxXt3oP8V3JBDXx0XzWCso9gFimPT4yhA
         2ZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681461894; x=1684053894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WtGg6EdeR1iWsnKc8ccT9EWwvpg7Ri/EQo7i3jzR82I=;
        b=D+EDVd6AuwkhVWTn7xNerzvlIQ7OEp1oH36wsDPwpO85wJE2r6OSbVsyZfkBWyKnG9
         TYdJxR6BwTb4rWmGVK1RBh3aN8y6S/sqYyZdvZOBlX5wCBMRq8FvWbDt4ddZsJISp7BM
         kR4qSL+WgfjMd0VLyhCmHmkKofBRNXC6akY0MYUflG67D0sVs/xZKkNQeXDtO+wiV0ud
         eqxToz/mpGFzpA+VSw3c0VdjZMqMJEkDa+R7WJWS86d4nP3pmYvGP6T/RMqUlZoQupKX
         u88M76CM2eIW5qn4vKsiewp7KtQlzy3DqnxOw/T4ki9TP2Fd8R4jenhWfEMJJqWpoUeq
         +cIw==
X-Gm-Message-State: AAQBX9cclba9I+4wsf39/uIFLsdyWwwqRvT79mmFhnsowitvEDV7P/Yt
	sYvq9dgS/b6n9cJEekJxrZjFmg==
X-Google-Smtp-Source: AKy350bppkIKeZhMXxNfJXXhoU40HL1EErpbeLF0AASH4hRQhWNhkTORoqb1Eg5v87PLoc5nZR1Nnw==
X-Received: by 2002:a17:906:3e86:b0:94a:8ead:c7f with SMTP id a6-20020a1709063e8600b0094a8ead0c7fmr5983777ejj.23.1681461894550;
        Fri, 14 Apr 2023 01:44:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id y15-20020a170906524f00b0094e1026bc66sm2146939ejm.140.2023.04.14.01.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:44:54 -0700 (PDT)
Message-ID: <d3846ac0-973e-e96f-7bb3-dec0237b795a@linaro.org>
Date: Fri, 14 Apr 2023 10:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 13/27] dt-bindings: display: mediatek: ufoe: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-14-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-14-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_014455_915500_1C0E3F05 
X-CRM114-Status: UNSURE (   8.75  )
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

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's UFOE block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ufoe.yaml    | 3 +++
>  1 file changed, 3 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


