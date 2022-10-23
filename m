Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D76CC433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2x0RIkIHNiV/gD5lKUt6DCU7+N1In5bYegvTHa5mAM=; b=A99KCLdV0EVRVn
	FQ8n5ERzyP7USJgOaJdcpbMyL1oK0gFGlmDCIDZlZuueDcV8FSiCFs3ItUY5y072TIwHJpRaohVDv
	1EA7aCMdNkGYeiRMBMIRInvmGmH3P17z7L6vk1IxXC/Ux4bYCYJT+47xzXEAwwjcbpwJun4rF7PrI
	vxv80807cW4d4XH9tpGYyomGw1CgKyH6HormujnCgPD28O64BlFU7IVUxt6tNpyMhbCbuT1n2twko
	wllx+388weLKr+iMgJTy1+1Wc4OyIGAW36to//Gx483w8O9J2k1HGUaBviIhLd7bXFVPfjGEd/jas
	KFjQZT6FY2oQ18SiE0Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omaXP-00FFFN-Vq; Sun, 23 Oct 2022 12:57:12 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omaWx-00FF3a-MC
	for linux-mediatek@lists.infradead.org; Sun, 23 Oct 2022 12:56:45 +0000
Received: by mail-qt1-x834.google.com with SMTP id hh9so4312714qtb.13
        for <linux-mediatek@lists.infradead.org>; Sun, 23 Oct 2022 05:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u2x0RIkIHNiV/gD5lKUt6DCU7+N1In5bYegvTHa5mAM=;
        b=A4x544bGTTDOcgE8nKEE3MPvp/JBN680vHeInD0kJprNfQZ8sL8qfwY8KI74pU0G/T
         Tc4nKvEI04AJ/deay6IzjcJRSQhMHGM4l5EcGihgupMnmruZKxYhi/tHKFyhNiPsrxCO
         wtFerP6eMc2hA6Ndwni/jmnaF6lD85pHQr2uqVly7CvAqo3YaC6Rn++3MVZzJI1EFI7j
         Fd17l/fe6rsspqnvp6sKMhlFy9Q0XExlEndelznx90JonIaWvFR0mwJbuF7sTJfJav/q
         OQP+2+PqJNANV/a17hjyykQeigMQYMZrmOUacnqfShbiGnzyy0FQzsmDieJ0IDdrHDeI
         XYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u2x0RIkIHNiV/gD5lKUt6DCU7+N1In5bYegvTHa5mAM=;
        b=mfuLEriHGbGwShOPxFHnP3YEjwkOiSCIhmsCG4FmL8by8G7hrdyHqvpr1Q8gNED/1o
         x1FwnpE4wai/0j5EgQQecfcJOfmauF+aPKEQxs/8+II9Ikl+4/5cIlxQVrT8qg3QUeaD
         7+oqxIhe6a20MUk5mDvqUtPqxulwNYQKu+YFIR/1hSe2FaJwsux8tNpZbAxWTIpBe55c
         cu+pn5ybAxHpRgE6A5aRcDOxe+ngs6Is6KWsmxFL9gXj6u1t0fXBlPX2nHaY+mczqJX8
         hBZ/SvpxQ5EbjBlcToIexLZEEamuvDrsVSt21U+q56qyGhQqm4TuEtkNNuqu+B9FarbA
         QRxw==
X-Gm-Message-State: ACrzQf3l+NzUtMuU29VkvBYTro3Huo6QHxn/OprtfieP7D9WcJ6nTIGC
	5wkUMh888DAAPOzYNMK9MmDA7g==
X-Google-Smtp-Source: AMsMyM5U3MnebxKoLpSHWCnTtqElsimiMyLPyhSCwRSsoqBLRKgmnqhuogrgQU5icn5w2Ue61NKG0A==
X-Received: by 2002:a05:622a:241:b0:39c:e637:48f0 with SMTP id c1-20020a05622a024100b0039ce63748f0mr23486386qtx.323.1666529800542;
        Sun, 23 Oct 2022 05:56:40 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id i23-20020ac84897000000b0039853b7b771sm11162189qtq.80.2022.10.23.05.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 05:56:39 -0700 (PDT)
Message-ID: <67e4c08c-f03c-fcaf-60d2-fffb87a69a9d@linaro.org>
Date: Sun, 23 Oct 2022 08:56:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 2/7] dt-bindings: mmc: mtk-sd: Set clocks based on
 compatible
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221023091247.70586-1-linux@fw-web.de>
 <20221023091247.70586-3-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221023091247.70586-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_055643_744123_C4FABF56 
X-CRM114-Status: GOOD (  12.52  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 23/10/2022 05:12, Frank Wunderlich wrote:
> From: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> The binding was describing a single clock list for all platforms, but
> that's not really suitable:
> 
> Most platforms using at least 2 clocks (source, hclk), some of them
> a third "source_cg". Mt2712 requires an extra 'bus_clk' on some of
> its controllers, while mt8192 requires 8 clocks.
> 
> Move the clock definitions inside if blocks that match on the
> compatibles.
> 
> I used Patch from Nícolas F. R. A. Prado and modified it to not using
> "not" statement.
> 
> Fixes: 59a23395d8aa ("dt-bindings: mmc: Add support for MT8192 SoC")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


