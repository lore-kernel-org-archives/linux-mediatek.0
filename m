Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4443CC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 15:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5lptyW3ie5pClcDGn5r9fNjFpkWHmTzbf2OcN0VuAU=; b=D1gryhzQ6QnZULUe1PVAIqsbVw
	h7hPZ50Mp2w4Qt2r4mEIBiNAm8mw8UJTJZcvKYtpjq519W4GyLJ8z1tSxMcZSskrB/cHQy4amAb4G
	+RVHCSkscNLhhfrZhip6ERXVk/ESc6p/pWhhTUwtiOBmgrzcPd/cXgSm/DsFdW54+G1cWv4p/y882
	bX/3lxYlAmeoX7xVZIhYQSgj3Zv8eu9kwoA2ny+AN/LPI/CM+r6m2CeO8Ib0SU4qSh5FJiI8MAl3+
	vm6QaD/2MbodddyTYzlj5jsKaVS/c2y85K0FwbCTplgQ2hrT6OxLGPUUE7iwOHyFtXgj89Ab0HrNx
	iv51iOxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidmf-008ZTW-Br; Wed, 12 Oct 2022 15:36:37 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidmd-008ZSo-0d; Wed, 12 Oct 2022 15:36:36 +0000
Received: by mail-oi1-f178.google.com with SMTP id y72so12761954oia.3;
        Wed, 12 Oct 2022 08:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5lptyW3ie5pClcDGn5r9fNjFpkWHmTzbf2OcN0VuAU=;
        b=nUa4x/7+UWiwr3pGxGU55A9qF8exYa51JfJWN5e7Q8RJ7et94KBiEcqMtcWRIUZW8i
         WNlK6WZSJTtpi3DS1Ez+Hd4jmsDdSzXCQOwrtJjyDFqG0TOK5g2yWl5AGUBBAVzQ6oge
         IFiL5lVeWjXpl0CVN0/V5n5yk7EnXT8PHGQiaeC30S0FeyZmcvtNr++TqHq/LqdWwG+Q
         ZT6lXNaFjkyO2uZc0bLMI1ltZWEeecRMRkkiw0zRleH1+zzLzA6uxGiKmSA6wcOTQA4w
         URb5sMJHGLSpyfdQc6ikmVafyGvD0FtZyEGJR5yz+562vz8b63b23Fv/budTFu4EIjzI
         DIvg==
X-Gm-Message-State: ACrzQf3c2UZb2wZe0Rwywoy/b7tDfR/87bzErzaLi8oU4x4WxHG6c8ZV
	XfhVmYzLiTCTXRbsevS4Fw==
X-Google-Smtp-Source: AMsMyM7YihuyUnIzLG6/okwQkls3Kbv8bMnGi6YmV46cxfr/5CDfSMZlI0ueMUzM8VQx2RPDXUmARA==
X-Received: by 2002:a05:6808:1487:b0:354:923c:bc7a with SMTP id e7-20020a056808148700b00354923cbc7amr2454582oiw.145.1665588993393;
        Wed, 12 Oct 2022 08:36:33 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a28-20020a544e1c000000b00339befdfad0sm6746011oiy.50.2022.10.12.08.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 08:36:32 -0700 (PDT)
Received: (nullmailer pid 2164100 invoked by uid 1000);
	Wed, 12 Oct 2022 15:36:34 -0000
Date: Wed, 12 Oct 2022 10:36:34 -0500
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, lee@kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, chiaen_wu@richtek.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, krzysztof.kozlowski+dt@linaro.org, cy_huang@richtek.com, sre@kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: mt6370: fix the interrupt order of
 the charger in the example
Message-ID: <166558333754.1988433.10175192101178879616.robh@kernel.org>
References: <fcf4e7e7594070a8698dc0d4b96e031bcaa9b3a3.1665585952.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcf4e7e7594070a8698dc0d4b96e031bcaa9b3a3.1665585952.git.chiaen_wu@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_083635_077461_B2BD4184 
X-CRM114-Status: GOOD (  15.76  )
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

On Wed, 12 Oct 2022 15:08:14 +0800, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Fix the interrupt order of the charger in the binding example.
> 
> Fixes: 76f52f815f1a ("dt-bindings: mfd: Add MediaTek MT6370")
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> v3
> - Add a 'Reviewed-by' tag.
> 
> v2
> - Revise the commit syntax.
> 
> v1
> - Due to this patch modifiacation
>   (https://lore.kernel.org/all/20221001202918.me7z2qzm7cmrkzsg@mercury.elektranox.org/),
>   there will get some warnings in linux-next when compiling the dts.
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applying to go into rc1 along with the other mt6370 fix, thanks!

