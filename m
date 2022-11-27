Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A4AC4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 21:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2oVo+43zmeK6HbNWh8c2mpz+ay7hEaecDlku06A02M=; b=COtYIVJZyzxNbJdyY4YwvXHgCT
	csyCO2emBWKjqYlMhDGBWo1J0+9zfAsL5b8lcYSwzJWTHMg/9M8DzqdoQ0hycWLTBob6+L+JAl4F+
	ejCv7gbkGRdlevZPmS+Ilny5aeTxZKVPAW0h7iBH9fuvzKjisCoi/aw1j9nwVhOWIrjHrVz1UMWiq
	XxJdodWzU9S4THtmNX9KQC9HjH8NvWcTQBrSKm+vi58RVeBX7oviLGTZO1IBqmBagUf3xWRkN8O/f
	r5H9keT9ukMLZ3MS2Pded06JY6IccjZ3LzJlphALNZlC0OgETBroZ2l/mXgbxF9y5soaDcVHkh5ee
	Toi/rLKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozP6u-00Diql-OJ; Sun, 27 Nov 2022 21:22:48 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozP6r-00Dipr-S8
	for linux-mediatek@lists.infradead.org; Sun, 27 Nov 2022 21:22:47 +0000
Received: by mail-lj1-x22e.google.com with SMTP id h5so6892788ljk.11
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Nov 2022 13:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v2oVo+43zmeK6HbNWh8c2mpz+ay7hEaecDlku06A02M=;
        b=Q3RJCMgSoPY0hWhrSjRoOLAAYMadkTwIXQd5vosuyq/Jb9tLYnaBsinLUnJ3aFypBu
         0dThMOONCKHd43pP0Z9GSEdsktriZ9OWgEJkyJ9p4Txqop6QFFMVrb4Q/csothrjhHOX
         /CLlad8GNU5SVf0cpbazh+VHlP69SoT8ojUW1Fox93PABPtmUVaP+zSE+ADbJETuoLGi
         6D4cTzlsUI1Ey48Ku35lVqhUyqbYqfX7tPCKwZgBf8OuUOsMPp9GZM0Oi7RCFExon6BZ
         3aev6CV9AJ0E46lKF7Yr8tp5gs7qsmSNjWjY6i6+OL3Vj/6Xy8Z3QMqhR5F22i/ojiG6
         U+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2oVo+43zmeK6HbNWh8c2mpz+ay7hEaecDlku06A02M=;
        b=17S52aYA5MP2mgH6eZ5zHNhwCxcaugdtazL9O/rIr7MAldEgia7W7vtV379W8VFWbS
         WIDXoBe+tkBe6kTXDVBa2XgKDj1RJ9b+jWBCrxxdQ+iIwu6FTCw+Jml64jMIRGwWnpMC
         Puxb3Givh8qct2mPGasfO3rueAiSFCTTTDUoEbI4BdYhXB6MGTs+IQGDIbSZlHYde5cl
         fHqGEjANEKWw96/TQ0DI0aS6OHh/0wnEKnmUBiwWZ3dZ9Dho+9iid0aoz15Je1iF4GjZ
         V1j8MlbXidTRZA9XF+MkNtxmP90fJtxNvRDlIN5+qTBIq1CIYJx4++XEHByMaG0eYPYx
         n+qA==
X-Gm-Message-State: ANoB5pkbJKQ7vOFyuIFXKBwJt3d6lodA1Z4SwH6QHXFmNGMC1x4Tol0E
	jA+SqS2XMxzs+iOJgYNPPn4Skmn2w3u131FL
X-Google-Smtp-Source: AA0mqf4RNzyaBDUFlxhGZ8/JLSvugK+xDQYNI8xd8Qios8WyzPg9FVP0avj/TuKFjR356WkfQ2WEeA==
X-Received: by 2002:a2e:b8d3:0:b0:277:388:3fa5 with SMTP id s19-20020a2eb8d3000000b0027703883fa5mr10820217ljp.41.1669584164133;
        Sun, 27 Nov 2022 13:22:44 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w11-20020a05651c118b00b0027758f0619fsm1067182ljo.132.2022.11.27.13.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 13:22:43 -0800 (PST)
Message-ID: <d58e3488-110f-cae0-6f44-c9bc54d301fe@linaro.org>
Date: Sun, 27 Nov 2022 22:22:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/2] dt-bindings: gce: add gce header file for mt8188
Content-Language: en-US
To: "Elvis.Wang" <Elvis.Wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221124075516.1669-1-Elvis.Wang@mediatek.com>
 <20221124075516.1669-2-Elvis.Wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124075516.1669-2-Elvis.Wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_132245_965867_6B7B7B13 
X-CRM114-Status: GOOD (  10.50  )
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

On 24/11/2022 08:55, Elvis.Wang wrote:
> From: Elvis Wang <Elvis.Wang@mediatek.com>

Subject: dt-bindings: mailbox: .......


> 
> add gce header file to define the gce thread priority, gce subsys id,

Start with capital letter. gce->GCE, right? So use capitals for acronym
and also explain what that acronym mean.

> event and constant for mt8188.>
> Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>
> ---
>  .../dt-bindings/mailbox/mediatek,mt8188-gce.h | 966 ++++++++++++++++++
>  1 file changed, 966 insertions(+)
>  create mode 100644 include/dt-bindings/mailbox/mediatek,mt8188-gce.h
> 

(...)

> +#define CMDQ_SYNC_TOKEN_DISP_VA_START			1012
> +#define CMDQ_SYNC_TOKEN_DISP_VA_END			1013

One blank line here.

> +#endif

With all above changes:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


