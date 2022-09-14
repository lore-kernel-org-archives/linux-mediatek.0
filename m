Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CE9ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 16:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZD8tJ7NCtrHJsbCaNSP87Y3qe7OynbxFKCss/jxB3I=; b=4s8dvwgawkkWzdaa38j/N4IZXT
	I/Ze+MNV9577XgahZkfv5izA9fyGoMQCtmPot3sG9y5lQBg740lJfHnPjAj+CneSjRtIzDvB2CKuB
	2TSaw5p4u66Uw2Ebis1ZLg9uHyNeQt8G5T1KBUzOi+pCvNi4Q9gW/2t9Jqtds/5Zdp/GC6Ew6VXCl
	eLuRt1GR+seCw1u2Fzh39m+ur57Uljms+nhUY4PYM2lypERhstD/6NiuEnKdYDN8P3osRgn6HSH4I
	opE3Q7J4vIh2Hg2maIIwQpsNcJse7L7KOSNJF2ySvOo53gR0OYh8xTawvVdeHJCT5TPh50gY8ki1N
	NqrTyz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYVEq-00567q-1X; Wed, 14 Sep 2022 16:27:48 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYVEX-0055Q9-1H; Wed, 14 Sep 2022 16:27:30 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-127ba06d03fso42456427fac.3;
        Wed, 14 Sep 2022 09:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=zZD8tJ7NCtrHJsbCaNSP87Y3qe7OynbxFKCss/jxB3I=;
        b=QqSiQ5jDA47rzRUR15uhgc8Jzer9QJLu8DArgbEsyRnjAdRVK6VWzFO5/MDWTfRGSr
         p78PNi2+6RNxPIwXN+ShTGDoxvolPzVb+6EjK4wb0Z7mIGEfnLzIcdTQA1WemrNYqO2c
         c0oK0DvskJZBN0OQixIyueTdbpQBwv/Og+oL6GnnV8Ag95SHB3VW39Uqgomlku7qD5wq
         Q1oPEp8KdnprhUQdXl1sG7RVHWt/2P25ZkPK8wvVcpPMSsdghWtEPALriK+hdiN9BFHX
         5nfE9gMbNCfQ9Etdbe1EloRRZ9Yx1FFn4GUqgT89rKf0WMz19dcER2QMFlYMBh7KLQR8
         R7zg==
X-Gm-Message-State: ACgBeo2Hkl6bgQRFmLNENVJEQ4TmM5iK7IyzrrwJ10oQHSMgmlOKtQhO
	N4fc9oJkJs/uQOi/MPz23w==
X-Google-Smtp-Source: AA6agR508A59RRasBqGG0pg5H5/FqMmo9DiIAClotXDA1a4zQTOyhkP1kMxVLkm7CrmxQf7x66/I2A==
X-Received: by 2002:a05:6870:34d:b0:127:cb87:a169 with SMTP id n13-20020a056870034d00b00127cb87a169mr2787895oaf.87.1663172845636;
        Wed, 14 Sep 2022 09:27:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g9-20020a056830160900b00655d9ea896bsm5587940otr.47.2022.09.14.09.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 09:27:25 -0700 (PDT)
Received: (nullmailer pid 2501100 invoked by uid 1000);
	Wed, 14 Sep 2022 16:27:24 -0000
Date: Wed, 14 Sep 2022 11:27:24 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, chen.zhong@mediatek.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Convert mtk-pmic-keys to DT
 schema
Message-ID: <20220914162724.GA2500989-robh@kernel.org>
References: <20220914103021.43593-1-angelogioacchino.delregno@collabora.com>
 <20220914103021.43593-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914103021.43593-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_092729_108406_A3E70B0F 
X-CRM114-Status: GOOD (  11.74  )
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

On Wed, 14 Sep 2022 12:30:20 +0200, AngeloGioacchino Del Regno wrote:
> Convert the mtk-pmic-keys to DT schema format.
> 
> The old binding was missing documentation for key press/release
> interrupts, even though it was supported in hardware and driver,
> so support for the same was added during the conversion.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/input/mediatek,pmic-keys.yaml    | 113 ++++++++++++++++++
>  .../bindings/input/mtk-pmic-keys.txt          |  46 -------
>  2 files changed, 113 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

