Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9B1C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 15:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25PwxIH+CB97dQc4eYwSt0zvL+9wdm4R+OmiPZ9+hOg=; b=pDL31ryVgk4Ra2
	5zLVpBhWScT2oHGs7G+qHlFJCv5wXyGT5vs6EYHPVWJfZtmO8dPzeWGLMJTpqNDgUMw+Q9HFXs1dN
	JIjtKXo8D1GFX//OG8jJb+XbH738lmtgFgriT6piMBAQzEmI5XU36zuerPcfl0dPKg1efsOfw9Br/
	xZcvoH+mQrYAJQfCq7E4jQlwGf6zT9ArB4XM3jfJMy9AxAi4lu1aWfyI5gKJmDu9aK9WzLiIWMPEn
	GtAfFJrgTPu65KAzhW5cvgI25uIaHEO84P8PAc3kZNmuc3AfTvoOpRSAnGHYopyXB9bFCKy29WB/m
	ARL2iLkAAFK3P/eP4ymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okoek-007mSP-RY; Tue, 18 Oct 2022 15:37:26 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okocf-007kdX-5w
	for linux-mediatek@lists.infradead.org; Tue, 18 Oct 2022 15:35:18 +0000
Received: by mail-qk1-x735.google.com with SMTP id b25so8857382qkk.7
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Oct 2022 08:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=25PwxIH+CB97dQc4eYwSt0zvL+9wdm4R+OmiPZ9+hOg=;
        b=hVhI1Eey5dbcwXydi3lYE9Lk8I43h3vFLe18BDCO/eubcZW6NpK14BxeXXlYY24QQP
         jLXacQR8VA9cx4wf53RdYtFWA2HP7a1sxIwM//md8ko0L9eN0grEIBZeWWH/K6JC7fpB
         fSFHco9vH0HpVhOLqCIoE/rxvD2PR6YIi3i6I8Zuf5INLvcxlLCGjZ3uVrlL4588Hpak
         32JicqOg2kBcQIQPa74qAV6G3dhcnMfVpKjeP0v/AkMrMgoUDP002w1J7az84XYNEbAA
         guhDgjOZN58eFXlbt4V+VsK6J7oF2H7He0PIvkI47IoQo7WiXl1zosLxCoQtu9j1HCJI
         YgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=25PwxIH+CB97dQc4eYwSt0zvL+9wdm4R+OmiPZ9+hOg=;
        b=1IUCmeS1wSUL+8mn9+adBbM8tmLtJgqJGQIEPr70Tpr68Xdn+wbyIG8rkKax3WhUqY
         Kfi6PIIeVg8JItHUHBeO9E1Ds1htJYc0H4m3rsf4MyirVDJ80brOPdHtHO3aokLVWbvv
         ARpt0Ag+bw/epiYbOB60M2+MD4+Npm3lr5sbEVop/UQb8Jy/dH8ZcWNNTP2luDMMhVBF
         uYY7XMT//9Ng2ltoW2EH2v0T6hHprI94+fBFZBIn2SIyw/UneldJY4/L5BrAbOpZ4bfI
         6qUoCCXUF9NSoMAPk+6lZRG2wcHWojlqXUlOZ7wxR6xS6E75gmp3a369+WFb49Y+YLVA
         Wuhg==
X-Gm-Message-State: ACrzQf27dTIw62DgJd5/6rFAWyfXV3qDTielPoa8alVz319nlUXaCI19
	pbKXSsnqF9knHGvbDubtlRfj+A==
X-Google-Smtp-Source: AMsMyM7Ec+2NOvmVhPeq1YdxqxGi+TsLMp/yC5NqZd87LleGwgSDvVjH29TgEQ1RAAmO1f7eeUg+bg==
X-Received: by 2002:a37:8003:0:b0:6ec:5699:1c8f with SMTP id b3-20020a378003000000b006ec56991c8fmr2230338qkd.671.1666107316086;
        Tue, 18 Oct 2022 08:35:16 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id s7-20020a05620a254700b006af0ce13499sm2617929qko.115.2022.10.18.08.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 08:35:15 -0700 (PDT)
Message-ID: <c0fa08c2-d20a-72f6-29e5-42f592a2124a@linaro.org>
Date: Tue, 18 Oct 2022 11:35:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [RFC v1 03/12] dt-bindings: usb: mtk-xhci: add support for mt7986
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221017104141.7338-1-linux@fw-web.de>
 <20221017104141.7338-4-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221017104141.7338-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_083517_260756_726DB084 
X-CRM114-Status: UNSURE (   7.56  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17/10/2022 06:41, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string for mt7986.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


