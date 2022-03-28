Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15568C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mty6/Ptta+E7gFRB47yoRX4f08ypE2kjMG/cS+n5TkA=; b=FFd4ip427OfmtC
	+ll3/Fb8nr6sQMsibY5ydIbXyRhlIFGe3tMr/0/eO9EsUdaJ5ouPN7UyeYSYndJUaBBkvXgzoy/K7
	yKKi+xcm8XHfhOu+afmedXjsB9PW4EjVPmJJ6C/jT1NHGFuBHM0SOR+NHAF1QvzsiIIEF+OQcHucd
	KnpXEX2ZwgQZ8UtrlqWa+jr/IX2aZNiBEkUQl/ZkidSAdmXtvF89mqIzSwwUrlUYkFfJQZo0tiWA7
	QTius8GkWICDn3yfUlP2yRA5FZXeibCJbTjaVqHfUSNubC/CWe62Z60lyEZ5+waLmd/lKeeyccDFD
	ubDkJ3mdEy2fXNI1kpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYqoy-009BNt-3G; Mon, 28 Mar 2022 14:58:16 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYqol-009BJy-Ta
 for linux-mediatek@lists.infradead.org; Mon, 28 Mar 2022 14:58:06 +0000
Received: by mail-wr1-x42f.google.com with SMTP id i4so1965654wrb.5
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Mar 2022 07:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7it7nWrxUCI0Qv2Lqtc/Tbf+JLAGcefs/bHK1LyDZJI=;
 b=fbwnZjOHQnljc13VEvxcbjuH3175Wbr+RmxQnH+Xqemb6P2ueDbwLqe6DJwS14Otvy
 oMGmV9+E+6KUDg6gn832tUiQ/RokB/TDY16cIN+z+BHnHW7j+g4H/HiW1TF8FryaMFZv
 RGqUYQhEDSUKe234IYYn827QNv/pPS4+l7LInt9e7o3e/UOXBnYafJgu4EvvXotklboJ
 B+0IsQsI6AiytNerl/zalOeaXoojP2n/Tku2ruzuRbZO9jbWmhLk2Kog2nJOcnA/0VyX
 Aq+MIco6r/v5Vn46BWAhY5MZdFMQ0CmdmOcfjiOk6iS1tlnVGsDO8wSEq/P9SqWrcqsE
 A4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7it7nWrxUCI0Qv2Lqtc/Tbf+JLAGcefs/bHK1LyDZJI=;
 b=KQvCoPUtOACgEmDB3cQvfY0ewxc5rtOt/S5jGYgCo9Shu1jAYGXDRLuhH9LKO6Pp7R
 7qmh5oaPcL9iI4EzD9fDtm6prFKkrwieuG15aEjkk42S4AwmmpWW7U706FSn+iBBalyJ
 bRucD8ZSkeDkT5Gf/uyoGlP2al6jKwrqTkpdM8Gkq+pnblqMRL35iSAX4VWOf7B8JOPf
 5YEOHV9aFygZ0p3+eENuTvlKkCDpDUTKRwFsx65unD+0kOGTLZtflwzGdF+8cFdSHVPq
 tKWQ5xWVYrdsnCHtNomIqUnXaAF2eaD4RZRLdPIe1pHCE/b2EMQvbYcWrEOZQWZz5HO3
 dqOQ==
X-Gm-Message-State: AOAM531ygIgeKK4QV6YGTrfTIdKac4s+jScdmcTmuNIMQy151EBbIA1d
 71tXLm9FWJ0EfOzPKkDb+k1fGg==
X-Google-Smtp-Source: ABdhPJxDRBZSnakVm9V5mdFns3aK835p2QU77pO1+SVKkhMh+amBCAX1GxI92vtJXr1OkcB2lwjAHQ==
X-Received: by 2002:adf:ab09:0:b0:203:f9ce:cc1d with SMTP id
 q9-20020adfab09000000b00203f9cecc1dmr24122187wrc.269.1648479481303; 
 Mon, 28 Mar 2022 07:58:01 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 y6-20020a05600015c600b00203fa70b4ebsm15878962wry.53.2022.03.28.07.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 07:58:00 -0700 (PDT)
Message-ID: <e9f23a89-864f-e7a4-db89-0dc4499a5864@linaro.org>
Date: Mon, 28 Mar 2022 16:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] dt-bindings: arm64: dts: mediatek: Add mt8195-demo
 board
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220327200312.3090515-1-fparent@baylibre.com>
 <20220327200312.3090515-2-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220327200312.3090515-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_075803_977174_101E6D85 
X-CRM114-Status: GOOD (  10.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 27/03/2022 22:03, Fabien Parent wrote:
> Add bindings for the MediaTek mt8195-demo board.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> v2:
>  * move compatible next to the MT8195-EVB compatible
> 
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
