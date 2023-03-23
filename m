Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E1CC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwWlt/KOKKTZV5IfSjGfyeDxmoG3w+1dWejJirL87Kc=; b=CgK1Jg6BfEuQci3zX9TWlHauHw
	iuQIlxYe04dtewoZljrpWecS7ZvN27fwwV3bJMR9CmClzod14nKYN6NIMQ9V76xyArl7G6zDWyUy1
	mLBOsMVX97T6/0V9qRYeF4voyHWg1nHCExkwhiKgT1PgrO2/7QOVHGxrnIXKfUSwbUABFXuSELHQZ
	6CDAaDHYLZPv6mZc2drP5O9rzXtMnUudVtsEB8Wu3Mf/ptjw9HKhT49cxIFjPjprjsfuH0NgJUTAZ
	4Hpnttd9pHZMTw89LZlk1ZUHM7e1ANVZjGLLrpOISxe1olLhfUFbi8c7GaaVBWJxadWdRv5DJsPvp
	PEKlt3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLlN-0029Mf-2R;
	Thu, 23 Mar 2023 14:17:57 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLlJ-0029Kj-2f;
	Thu, 23 Mar 2023 14:17:55 +0000
Received: by mail-pj1-x1029.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso2205060pjb.3;
        Thu, 23 Mar 2023 07:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679581070;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KwWlt/KOKKTZV5IfSjGfyeDxmoG3w+1dWejJirL87Kc=;
        b=ShXIgySZUj17n8AichZ6BuKTikQIsXDd6ZVTquByVrE6Vbrd5xJvxmzFeGybkzJQw+
         2dvPVykT31PVMXZkQI4/V1PrLosJ8/G81+bLf7guHi0hoaBYJbF4P4oFsacqNyGOGzl0
         KWAIfcfULvOuAvq54WwijhDLokXsbuMfLjGNKadLpchF8Xh1u2lk9enjxA9BLLWIOWEu
         sNxTYRawdnA2VypiKSGiKAadBU691K9veJ+xX+PPKmFrf9bhOcFw5otLG9wahtG3Sl1x
         1QbMXbM+gOxUpC+3yWS7L272rcBPzaRxoZNn6I4m1UlenvHfLy+sDQLGpknXl3R0oztV
         pQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679581070;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KwWlt/KOKKTZV5IfSjGfyeDxmoG3w+1dWejJirL87Kc=;
        b=OoKJ6rubf501GPxZoMkj/Z7yRXuihxkm7CTa5445B0l/5bgPvDGh/EK4+EwwyaVTMp
         P5Q4jgDAlh3bOHAgHQxHB2SX0T+AA9K++ctmn3NHo+3KZkhkgFwHcLjvmxLBIC4NvqtR
         wCuz5cVd99zjaMkO6CQvjO/h30q/0HqGW86ERKeJT8IBV0T8ggCLjuQQQG9JP36ZPFyJ
         R4J/VhUpw/+NPUajxeaFXOdJS/Llyj0nA46aJnICRDRE8yQ0dFltaGheDzE2bOhsc2b2
         TD67cuky5hwY/+Et1/0EJbAV6uk8iLRtpZAoQYhk0H/PL8u1SJsBPRl+UgpU8HUQ1SrE
         BqGw==
X-Gm-Message-State: AO0yUKXf3sSy8ey9humjq+KACtdGkx076QIRSxJ90/GME8vlPaa39/G6
	Us0hcwkDUYqPswRBjqHtQUE=
X-Google-Smtp-Source: AK7set8s8aOBz3BhSS+2TpYUEhRf2Zwajb86+z7vpmqctX+tEU+jGLlvaa7kumROlD7GK1yDG+Y7Ag==
X-Received: by 2002:a05:6a20:a914:b0:d7:6b87:94b8 with SMTP id cd20-20020a056a20a91400b000d76b8794b8mr2981901pzb.18.1679581069864;
        Thu, 23 Mar 2023 07:17:49 -0700 (PDT)
Received: from [172.30.1.36] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id d18-20020aa78692000000b0062a515874b4sm1237790pfo.32.2023.03.23.07.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 07:17:49 -0700 (PDT)
Message-ID: <81425aaa-8c41-8d9d-ddc4-f951039bc516@gmail.com>
Date: Thu, 23 Mar 2023 23:17:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: clock: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230322173549.3972106-1-robh@kernel.org>
From: Chanwoo Choi <cwchoi00@gmail.com>
Content-Language: en-US
In-Reply-To: <20230322173549.3972106-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_071753_886567_AF6F74CC 
X-CRM114-Status: GOOD (  10.84  )
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

On 23. 3. 23. 02:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml  | 4 ++--
>  .../devicetree/bindings/clock/mediatek,apmixedsys.yaml        | 4 ++--
>  .../devicetree/bindings/clock/mediatek,topckgen.yaml          | 4 ++--
>  Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml | 4 ++--
>  .../bindings/clock/renesas,rcar-usb2-clock-sel.yaml           | 4 ++--
>  .../devicetree/bindings/clock/renesas,rzg2l-cpg.yaml          | 4 ++--
>  .../devicetree/bindings/clock/samsung,exynos850-clock.yaml    | 2 +-
>  Documentation/devicetree/bindings/clock/sprd,sc9863a-clk.yaml | 4 ++--
>  Documentation/devicetree/bindings/clock/sprd,ums512-clk.yaml  | 4 ++--
>  .../devicetree/bindings/clock/xlnx,clocking-wizard.yaml       | 4 ++--
>  10 files changed, 19 insertions(+), 19 deletions(-)
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi


