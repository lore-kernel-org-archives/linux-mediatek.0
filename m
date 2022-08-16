Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB275C2BB41
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 07:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbMDJXoS9x8FpYW6Y68J+/9gNIBvbIu8BeEES1UgWL0=; b=0hoQxEjfVE8ASyCKnIb2vPXBbp
	GXP9ZsdhHwSLWcFS62ATS5gFC+G8PohCcko4wxwG4UwaTaiNLfvdhhsqg9NDCvZTr+Ae5xz+5mTlb
	cDSftYsFUYTUJ5WJgu2A3RzMe3fDcEGqr4VkCJFcaGhZd/C484JBm3zUwVPA1H5wo+8iMkJEempuv
	SAr7w42vfVgGo5JH6SSyi7VmDBqXVhw74zRCoOP1/6wlsIRc8wPYE7DOi6q/OxlOl43nSXA19GV/v
	g8mDoePFb5xjKDVyO7H8Q5xnFld32S8+e5FTXRwBddjh8qFlueLLFIIUBJjHyu5PuX2Q8FU+Sj//F
	jJeDhC8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNqn3-00ElPK-Ee; Tue, 16 Aug 2022 07:15:05 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNqmz-00ElBL-V6
	for linux-mediatek@lists.infradead.org; Tue, 16 Aug 2022 07:15:03 +0000
Received: by mail-lj1-x233.google.com with SMTP id x10so9781346ljq.4
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Aug 2022 00:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=LbMDJXoS9x8FpYW6Y68J+/9gNIBvbIu8BeEES1UgWL0=;
        b=Lit+hPTJkMv/nc3d5jswLDaYKakT9vO0wN4wfwHnePRwFwPHCeqsVIMTTJbAM6Mx+G
         QhXJsYBnl9jtPOPEu9+s9v9F5RQ/Dc5lZEPO1yR3UsPD5jEvB1+ctVH0s5imKLsu51Tg
         zt0YK0Vqwz3FBmWw1h+HxBYEaKFreVkp0nUDLUmi9Aw0XeXOui6UOc8RxGar7x7GLZPM
         1CJ+suebgiU2dpXN6T5rVpJ8aiFLqThTAWuh34P6FPWY6oHBaBDBVBMttb1bp/80pZ95
         VZ5d9uYJtlIPVD++6X5wSUPm2HxUW/ySnRSQ82NR8Q8TLH4lq5E4n5CN0wk9O41abqA0
         sjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=LbMDJXoS9x8FpYW6Y68J+/9gNIBvbIu8BeEES1UgWL0=;
        b=v+LeOAmIQ5jyXAJY+ZQuVDRawnrv4/ishPU8/oJYSFIc36GlSNO0PEZBUSlpUeDgOd
         ySf5V70KGhZkKBDr+KkqF81u8PYUwI/SiKWzxsTnjMfNMaiRWh9J2pL5GFyP76/O+kzr
         fCCR9r6fzf7CMqCz74aMH4VH6gWuMQtguWrFa9cR1EHPnUvuL3BzMZgAFD6NRlo+HxFt
         Voh/og35owz0rrp4b71WWDGHOUwBK90p1YW7NPnHfw2YhcXhImnLdAt1WpaCHs6HWAqa
         LlunZhCx3SPrWDKmL75XI68tkKQyYIyKtSrWNsHJ04YpHLn7q1dX1bXQOElJH90acJ/Y
         /ulg==
X-Gm-Message-State: ACgBeo17q9Egwgttoe6SKmcG26RqtF3kgtAxrkSTKc9WRS9jBsizxdWb
	gRYLWNmA6qz2OhNO9/vjggfpmQ==
X-Google-Smtp-Source: AA6agR7r6LX7onIecIEwrZ1MFUwbK40aVSeFO4I1RAeHNwRERE+rCTKnJJNtq9s/rXjWpnTCNslVEw==
X-Received: by 2002:a2e:bf29:0:b0:25f:fbd5:b693 with SMTP id c41-20020a2ebf29000000b0025ffbd5b693mr6292721ljr.372.1660634097606;
        Tue, 16 Aug 2022 00:14:57 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id z4-20020a056512370400b0048b06f34566sm1299951lfr.76.2022.08.16.00.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 00:14:57 -0700 (PDT)
Message-ID: <c411c5c5-0a8b-c85c-2d57-1a387eb0d28f@linaro.org>
Date: Tue, 16 Aug 2022 10:14:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8186: Fix 'reg-names' for pinctrl
 nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Guodong Liu <guodong.liu@mediatek.com>
References: <20220815122503.2768-1-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815122503.2768-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_001502_061085_87132549 
X-CRM114-Status: GOOD (  12.15  )
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

On 15/08/2022 15:25, Allen-KH Cheng wrote:
> There are 8 GPIO physical address bases in mt8186, corresponding to the
> items of 'reg-names' with the pinctrl driver. but the order of

New sentences start with capital letter.

> 'reg-names' is not correct. The mt8186 pinctrl driver would get the
> wrong address, causing the system to restart when regulator initializes
> . we 

^^^ Something is missing. Sentence looks unfinished, full stop is in new
line, next sentence does not start with capital letter.


> fix 'reg-names' for pinctrl nodes and the pinctrl-mt8186 example
> in bindings.
> 
> Fixes: 338e953f1bd1 ("dt-bindings: pinctrl: mt8186: add pinctrl file and binding document")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> ---
Best regards,
Krzysztof

