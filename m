Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAFFC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 23:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjKDBui3XbMvdfBvZRSNvz4Y50HGiS8SdRV7n9Sisvk=; b=xhovLwc4DghsYBA1E7yiiz15yy
	bjmOecmglKIvhMRvjYFL36YNQJ8l0zoCsKDysMhodzAPJdQyb4oeHkpbrO3U2rEOtIB6tcTdckgLN
	B7ROdFYLwhnXhYFLYA7USRjBv0ABHZUf742pYcQCuITYLh/+wE/LI6fW77nrXHhBXTgmvXsk+duTe
	RF4+vQHK/mH8Zf1HjcAXeTM77yW1i/n/xNiDxyga97C8oqM82sw8GBzFD1lmaXv2qqKtlQVc+Onff
	iBIShVI+Yq0nbQaKxgE8e2ls9i59MoNZg5NOW+OiY3gSKVlXFdyB7edxCKRWpRjYnGfec8e6sbDqw
	fGIbPumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHZ3a-00Ddnh-L2; Fri, 29 Jul 2022 23:06:10 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHZ3I-00DdLF-M4; Fri, 29 Jul 2022 23:05:53 +0000
Received: by mail-io1-f46.google.com with SMTP id q14so4679367iod.3;
        Fri, 29 Jul 2022 16:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=hjKDBui3XbMvdfBvZRSNvz4Y50HGiS8SdRV7n9Sisvk=;
        b=35AhWpia5hqcrlWt5CgPDdVW6OIDu1mzbtqr0l50Q0W4zTDvbq52LC/IqsjPBEBP7B
         ldxbY+w1bVs5OI4ea0bqodi0N6uZUdshXlnxzMtgEl9hnLWkuvNwu9+4Hl0tI7+xRlIE
         jELJmm8dnvNi2uCaitfGXv/YGcb9wYbKYC6aIXuLtrKVpSxYYa9eyMhMhbp4tWhlAgPL
         KAzIHSii9bMkgGPnSEoeqRu/ugO+VEZMWCmCEjqneJm5j0lLfCstXg8oSQ+tclVXc6SF
         mMFXk9PD7MLoDAPpcW3pS6nB977NQVVt+GrT1UVYCCTf65MDYeo8DxaAhbQoP3/TKBa7
         C7gg==
X-Gm-Message-State: AJIora+y3bkjE1EKhhSCVp5jbtT8shLBih55NZh54/S/HUL56XIj6B8r
	3A8Ct0DrzUdkxVBo51YCig==
X-Google-Smtp-Source: AGRyM1t9O8iQe6oGeaMvWKzV15vZwYX2sfVSpSzsAO1ojnDOjg2jhLPWpDG1bIaXNx1V4sYolB/0Gg==
X-Received: by 2002:a6b:4019:0:b0:669:3314:ebcb with SMTP id k25-20020a6b4019000000b006693314ebcbmr1870454ioa.197.1659135951515;
        Fri, 29 Jul 2022 16:05:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id bs19-20020a056638451300b0033ec45fb044sm2227216jab.47.2022.07.29.16.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 16:05:50 -0700 (PDT)
Received: (nullmailer pid 105414 invoked by uid 1000);
	Fri, 29 Jul 2022 23:05:46 -0000
Date: Fri, 29 Jul 2022 17:05:46 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: long.cheng@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, nfraprado@collabora.com, ~postmarketos/upstreaming@lists.sr.ht, hsinyi@chromium.org, matthias.bgg@gmail.com, robh+dt@kernel.org, fparent@baylibre.com, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, linux-mmc@vger.kernel.org, vkoul@kernel.org, sam.shih@mediatek.com, allen-kh.cheng@mediatek.com, dmaengine@vger.kernel.org, ulf.hansson@linaro.org, wenbin.mei@mediatek.com, sean.wang@mediatek.com, krzysztof.kozlowski+dt@linaro.org, chaotian.jing@mediatek.com
Subject: Re: [PATCH 7/8] dt-bindings: arm: mediatek: Add compatible for
 MT6795 Sony Xperia M5
Message-ID: <20220729230546.GA105364-robh@kernel.org>
References: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
 <20220729104441.39177-9-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729104441.39177-9-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_160552_748898_3F3D12D8 
X-CRM114-Status: UNSURE (   9.16  )
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

On Fri, 29 Jul 2022 12:44:40 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the Sony Xperia M5 smartphone.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

