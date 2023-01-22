Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D838C25B4E
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Jan 2023 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4HC6qouSeVZQItRIxIIESZp16atoc5adtJd1Q2QlF4=; b=EOluBhfEEKzOIiaEkWgU49YjCB
	CepbpmqIsXvkM5aPSF+OcUKQI+xpxDQjk39ls4iuRM+DlZbDJSoN5oERkNywGrAS6nU7DzO7reZRQ
	/pt5uwICAmPF9L2NMYlR9f7WP8/nYx5XLhNBQITbnsTJa5BjWxvp9nE3KD8SQcanxYbi/6QfADlUv
	d0Jdz1kQBzaDK9AYZrrHOv8Fuv5PmD5ctbNCkPDdq63ENppzn1Coi7UDwGHjXFm2P5yqQxOya7zpF
	4cwtrmrmCH9uXiiTXxXEZ55/9Nk/naD7fBnnEj8lgpOx2YwrMNlAy8TI7JFu+f5lotN8gr4TCtbDX
	ZqkAnfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJajS-00FMvj-Na; Sun, 22 Jan 2023 13:50:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJajC-00FMrz-Ar
	for linux-mediatek@lists.infradead.org; Sun, 22 Jan 2023 13:49:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so8848515wml.3
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Jan 2023 05:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n4HC6qouSeVZQItRIxIIESZp16atoc5adtJd1Q2QlF4=;
        b=qt075DMCqQcWv5lP/Xxgv/hcseDrBbg4U34aA9gISFu1+SS3LcRFB8hXYMFh9ypZJl
         rTMG8CPT4091NvRdr+mXFgP0ysUKBy264h0a+bGcsXMdJ556LaB9F/ilC0rzPs3Rbj5e
         xFPu498zf2ZIFr5B6FPeuNurawFk9/s61rUNj1FNIJeuv46YfZSAujb84SL8vcTOGR0T
         rhyGZt69TPFalqeowYPKCsLCAkzptu2HlnFJV8KzoZz5i96qrLK9b58m411uLK9CPmBA
         PgsyZ25xFan4dcbH63A6hbnglAIxnEhxCkr5TftyVFOfxTA5jGnuWz9125yYnTCHNK/+
         Kgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n4HC6qouSeVZQItRIxIIESZp16atoc5adtJd1Q2QlF4=;
        b=1am3v9C1teVAT6kyqeE21ol8a7rdCAvy8r8PjnB7HJty4Kwm+0XqqkOcXH33KoUauE
         OvZ0iqKO00Tub4h4PSMWLxONT/5cKi5Swvre9a2Z+XW0SppT4Xpz5kA2I9g5fexUqh5I
         CI51f22/Q1n2R+3my4DHlDNEJvtTg2r9MTcfQXCiZZMYZe7XEgsWT05n5iQ+kphrCWd8
         MrQMGW5GL89UYeeu8FvUb/3CObvlhDLF8cdPFgDKjkVtrpZp6/p2dCpBl9/ZufLVRVpG
         ZJuKnPEqUp7U6kIasJHuHf50SWG/fI+BD8eWbAJnx0kLDsx2LR6YttgGjakUOXlELOJh
         /Ubw==
X-Gm-Message-State: AFqh2krf0CBCeveqDp3Z3wyO7qurRKRIGDw25P2kD1yGDMfYnr7Ds5m+
	QmU9lbk4kB41TcldHFRvBh574A==
X-Google-Smtp-Source: AMrXdXtWzk4h7L0/T2hQcONOtPAv9+Zq8uAXQpraPYwgNWCeiMl3ld1ZvI9Y0ZWGaO3EmBiDSjkd5Q==
X-Received: by 2002:a05:600c:539a:b0:3d9:ef72:190d with SMTP id hg26-20020a05600c539a00b003d9ef72190dmr20265304wmb.19.1674395384068;
        Sun, 22 Jan 2023 05:49:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c2-20020a05600c0a4200b003daf6e3bc2fsm18894274wmq.1.2023.01.22.05.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 05:49:43 -0800 (PST)
Message-ID: <25410783-17e5-35de-3be9-930f50584196@linaro.org>
Date: Sun, 22 Jan 2023 14:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 2/3] dt-bindings: clock: mediatek: add mt7981 clock IDs
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Sam Shih
 <sam.shih@mediatek.com>, Jianhui Zhao <zhaojh329@gmail.com>
References: <cover.1674233728.git.daniel@makrotopia.org>
 <367c21c111458abf35170b37d51d023a04a04510.1674233728.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <367c21c111458abf35170b37d51d023a04a04510.1674233728.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_054946_443315_B2CC0212 
X-CRM114-Status: UNSURE (   6.76  )
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

On 20/01/2023 18:24, Daniel Golle wrote:
> Add MT7981 clock dt-bindings, include topckgen, apmixedsys,
> infracfg, and ethernet subsystem clocks.
> 
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


