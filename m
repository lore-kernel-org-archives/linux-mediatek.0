Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363D6C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 09:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Au11CpDwn/UURJjwp0rA3AGArUSenl9oJW8Wm3b2MRI=; b=1ifzZHVO52YgaLhs/Zm9s+TvyW
	Rp3g1n06s0FZ16o9hJ1MkFV8yHWJhXRKFDlSQddta2ArEDNP25t4Loo/EpmgwAHEYi/azR/d3fJQU
	9jWgCPF8K1wTGZi5cQBDq4jS6sQ6ngFHP/tWEbyVPU4agpVxAbj/DuGqUPBbRYNEOGqr+HokO2ky8
	ERvrTTTofqLx3ra+OLTb7FYCWK7eH0p8Ry5Sj3U/m6aflbim08ifxAdfeGAANcx5nW0wvlqqQqiWP
	uMU0cyx4EnXYRTmsa5CnG4U6/WuS2uSkLlHhfzy/CTGe4vwE/6PzZQ0JrOs3b7XmSjniKSxc9+IZs
	I22EshlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DWg-00BDXD-JK; Thu, 08 Dec 2022 09:49:10 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DSN-00B8z1-9a
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 09:44:45 +0000
Received: by mail-lf1-x129.google.com with SMTP id s8so1196149lfc.8
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Dec 2022 01:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Au11CpDwn/UURJjwp0rA3AGArUSenl9oJW8Wm3b2MRI=;
        b=oQVy6g6ftbqQnTmQTVvMb8OUxjzE6cI+OwClMDRYtJL4J7shXtdgl9dnIFESMg6CXE
         sqwdeTvpk+qjGrsm+NgWkouPci01Y2frsw5t7yX1DRHmgqOunKOtK3ff8qRUg8Bt6A84
         Lz01eBaKYwHp2SPGwO0/kHZYYcALchNo1wb9OaGkV2K3RFNjkOos7mwrjM3fwYhaH5Cl
         Tv06SYsr8e41IzLg1ZKClIDbCOinFFZwWjxbVSTs+84VG3IA7Je/PalFrAQL584XFyZ6
         hgnxUFkMqlfRGGUHzu+jDTev1aojSSEBZ2qbJY49MFOf1CiPoBozUAiK5YI4c/XvKlwo
         h2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Au11CpDwn/UURJjwp0rA3AGArUSenl9oJW8Wm3b2MRI=;
        b=tBku/zjW0TwEJtGr/ybX/paZPk9XcLH8YGawrO4iLEdQ4wZLYxHbcGVLYIkfebYnw+
         mwDtxrfETIHvFNRjI1LGi/ogxDRGN/lF/uI6aNfmvoF9zMqfm6lgkQ4HfLLxgal3CYFK
         qSbLe/KSquJN5CwVfIc2uNGVqrp9TXMY/BzkNgAndq5TY1DpWpK4V6oS6zZRgroqd/aC
         Y6ZDqZf/bTrZbPzX9Ca+36R67Ee2CJMeZaOfZnWb0xgp4r5YCq4tKc+qak50Fk8RIhFr
         2napkeWK6NzbZhqZTuATulREzlfgerW06UjGfNZy76YQik+5ykrEZbK/IsJro6x8sM8Q
         ktmQ==
X-Gm-Message-State: ANoB5pkdApqBCTG4N7LXS1m/yT6hWODjCzjDKNUwZfN1yGhPODN8AhW9
	G0iKU4yCYDahZtH6DZ3F/g5PAEnOJPu4/p0ETno=
X-Google-Smtp-Source: AA0mqf7iPq8OR3W99hPV0n9RoC8HsGux0XFBkldIaraeJ45vK01ol6MYOTxEh2bE5pnb0/WQaoLOKA==
X-Received: by 2002:a05:6512:3f0b:b0:4b5:22:7fbc with SMTP id y11-20020a0565123f0b00b004b500227fbcmr19179516lfa.183.1670492681820;
        Thu, 08 Dec 2022 01:44:41 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p21-20020a05651212d500b00497b198987bsm3273986lfg.26.2022.12.08.01.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 01:44:41 -0800 (PST)
Message-ID: <4dd69cca-3ae1-7fda-b1ad-01087449afa0@linaro.org>
Date: Thu, 8 Dec 2022 10:44:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 9/9] dt-bindings: mtd: mediatek,nand-ecc-engine: Add
 compatible for MT7986
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221208062955.2546-1-xiangsheng.hou@mediatek.com>
 <20221208062955.2546-10-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208062955.2546-10-xiangsheng.hou@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_014443_369441_04902D26 
X-CRM114-Status: UNSURE (   7.35  )
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

On 08/12/2022 07:29, Xiangsheng Hou wrote:
> Add dt-bindings documentation of ECC for MediaTek MT7986 SoC
> platform.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


