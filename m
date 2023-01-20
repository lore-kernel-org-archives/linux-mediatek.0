Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAD8C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 08:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04cr3oM77vtN8LfGWpfaCYtk7vDm8eozzkmdIql1hhs=; b=bqHkWIEcN3Pj5LjxIxTBuroXhx
	BFFQq26n7ZjujZW0J2FUavfDTTdWnOyFDNCLFLgl9auydb7i3gUmiIDioJ29bn7q1D8Xa/Al6rEPA
	y/GDtQJ7GEL0XHS8+9fbwdZH7zqEsis9wBFf1QzsJ063XQ2qkdCpn7NQfJoE15O8jwHvwku+h4BhE
	YIsImPOf+UEXoDvK5/E3uFpfWaqtXE1nNrdtmePCi2c/8c1nk+ZVabOc/ozZoaWtoKJ4/u1IiY8FQ
	LDb3o4CkDZtOjB1OT/+hhpLjXImb8zI+dFUlJgfzlWy7xFRGuI51MePqy4bO12XLevE36hrvFRumV
	OJ6qvNbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImbc-0090bG-Et; Fri, 20 Jan 2023 08:18:36 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImbZ-0090Zl-Kn
	for linux-mediatek@lists.infradead.org; Fri, 20 Jan 2023 08:18:34 +0000
Received: by mail-wr1-x42c.google.com with SMTP id b5so4169631wrn.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Jan 2023 00:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=04cr3oM77vtN8LfGWpfaCYtk7vDm8eozzkmdIql1hhs=;
        b=h5U1ItDyBVg5MkRF35lpFx4g3kTNsCUg80glYG5X1vv6D4cXwIkXMA6qri2t90+Tbx
         ra+JDdqw6RH6zDBf/RQohRtBx4eGXSyapN7FZiltRhXU+xzRrmGknYNrMLBeXQh6ywIP
         6go0CV7QQAVuqCSKRQJhUUINsSOUDFYL4ecjsPFAQt4aG9bp9CCgVHuPS0vA4hLpRhVh
         +Xpfyt+LBbtqxYKTgYUyFTd6yCKKUAUECrJL1HbH4sGBR5R0dgZelw9s5ir2PIYYoQ2k
         sfHmSrfmMcnAaE1B1zc3MtW+F8sofSjNxt7a3J6a/zIPdZR1sjPSs/Mep64QQLH4bYfx
         4aBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=04cr3oM77vtN8LfGWpfaCYtk7vDm8eozzkmdIql1hhs=;
        b=e9LxSi5vFqm7kXMZyW3L16ue7XQf2FXVaavC15ztv3r8XJrN9Pdhv+sFyBnMAo5t+a
         oo9OjR2tGlySn3Z0YFkX42OdpCsb7+y1WoFXtWUsWe08k5hzD3C8l1SRJls+wfse7bPz
         +ja2yTi1y0YZcm8RMJXKiUMbiHl6XRBo1iRm7UWs5cvsOGuoPHfbisg07hAaGYX3Zm/k
         TelsT1/G6zPTqxQonavSNdrzgd14dr/h2JX+WwxAPI0JWKYy+ZHz+pkxhyPvkh0D5xso
         y9LKkafaiWpTIksB4jOi4Nx1e1SyPc+RwkFn7Ke5bqTXI8TvM9UudHbHy35Ibn/tWzGu
         HoIA==
X-Gm-Message-State: AFqh2kpzOK6V1/0FWm9BYGD3YCLglhQ8ImszqViVZ3Z3IUJi/llM04U2
	ihI/PDsNGLDclSXH8mW3uxjrig==
X-Google-Smtp-Source: AMrXdXtTB7C5TqJJt0iSVIDXrkSwRPe5tbKe9Mtkw56Xr6RYqWyp/++OsQ1xifYMqHgGBgoDr6bJPQ==
X-Received: by 2002:adf:ef4f:0:b0:2bc:7ff8:fb83 with SMTP id c15-20020adfef4f000000b002bc7ff8fb83mr11997475wrp.47.1674202711681;
        Fri, 20 Jan 2023 00:18:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bt19-20020a056000081300b002bdc3f5945dsm23285543wrb.89.2023.01.20.00.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 00:18:31 -0800 (PST)
Message-ID: <78f963ca-8cd7-ff02-f651-28ade8b7537e@linaro.org>
Date: Fri, 20 Jan 2023 09:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/3] dt-bindings: clk: Add apmixedsys/topckgen
 compatibles for MT7981
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-armkernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
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
References: <cover.1674152610.git.daniel@makrotopia.org>
 <ac08655ce45fa60fc0f510c72dce18fd4807b345.1674152610.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ac08655ce45fa60fc0f510c72dce18fd4807b345.1674152610.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_001833_737336_C8E5CF87 
X-CRM114-Status: UNSURE (   9.55  )
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

On 20/01/2023 02:25, Daniel Golle wrote:
> Add compatible string for MT7981 to existing binding documenation
> at mediatek,apmixedsys.yaml and mediatek,topckgen.yaml.
> 
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

You got comment to fix it with nice example, so why using something else?



Best regards,
Krzysztof


