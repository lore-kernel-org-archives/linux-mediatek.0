Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE131C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEWocC+tj2xcNali2Qbyk/V9ZjXxIkXbOm3FYNklfEI=; b=D1mlHSw1eDsj4W6iOtEB9bzjnd
	+TNcjN4eVNBH003f+A6xld+Yh7laQ0JhvzmC41/rHVrEPN9eI3WQJS/Ua7hB6x6eb5OBqxI+x7jwu
	EPJg502NXIx6plHJWCD9O4ZM0vhxrBiv/Z664JZITl71gR6/TnkxGiFguwJWHDNSNqPAu04002QC1
	UE9obUZRk7UbWCw9D7BivaxQUqfT/C6C+p0g3f5RsE0Z9JNRmlNphTy39L2HmWMStz2i69ce/HCzP
	AjPsjsFoxD+gQm67PtsZQW9ZGLt2rNIF4d+bnTQ9SxqRhDl1xRrDlp0lj4Ecnzx/WwAmxGIImNq8q
	nqDGy/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTuW-00FShb-Iu; Wed, 28 Sep 2022 10:03:24 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTuG-00FSaz-FU
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 10:03:11 +0000
Received: by mail-lf1-x134.google.com with SMTP id j16so19623846lfg.1
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Sep 2022 03:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=TEWocC+tj2xcNali2Qbyk/V9ZjXxIkXbOm3FYNklfEI=;
        b=MN7B4mhCX859zT/yrmW+I1P9YgX/2MvgTcKT6SecWc+1imbNDTGRve09i0MuR4oevc
         cI8l+h5qOuatF4/dRIsTqPm/BgWRGJbXqs7jMZfcIPkI0StPbr6M9XK37zGcbuntY8qy
         MLWJYOr/AS3VpdB3H26M27uNLPUf63hUW3D8PAk3y4k6HKoEMCW6PIZpknnaGjeYLJef
         YbdiIde8LEdL+eZm0wdg+pIsID4vYjBRsizdI7dQUv9Dsf4Ye6JJilTF9ZOIbjecsQXy
         qNCVt+n/rmypBrjTVUXA5k83uDd5w2EqOyANAcTk+qP/gkbW5AUV5YlM/tFJ44f0w/w3
         ZjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=TEWocC+tj2xcNali2Qbyk/V9ZjXxIkXbOm3FYNklfEI=;
        b=7PE/5ToB4hVfczG0/vUOLUYQT03GF8FsO0NA8qeOH6XSM0jBvjdkT1y0SNnpAhg6KQ
         azedTOHonEnnHSq0qwa862em529NqycGfgd9X+mGchHAhMIClF2XFVHTUQzvZtJ9x0Bw
         B8fMIFHL/NAHM1W5rbJ3rC2NqC4KJ4nleXEHADM5CKf/vAYTBRYd44f7T6hVPRABh/1d
         tXBzphd3aVGD9U5KhDkWiGX//9ooXiMDhYdemi68aZrUXKU6zfa38iWKJy9pZzVjSBDl
         I0sqzLYxV0quX8RLRdeJTWf/K68j71lqtaTYlajWDik3WUu3li6dDmH8ru6Ka0jDefzo
         c8tQ==
X-Gm-Message-State: ACrzQf2ef6Qbk8Wh+0o+1+D4EVAycNxNWfE1n2pT/Nj4cNxZjQAontDc
	0caHFdbf0D0KD2nfOTrxwzSFsg==
X-Google-Smtp-Source: AMsMyM4qczTLCl0p3QuHE8hFtHN+/tWlnQd2LvIsyAM1sgbKXEwkDRSutNAUKQ0fuIftOov8+87scw==
X-Received: by 2002:ac2:5a49:0:b0:49f:f620:b81b with SMTP id r9-20020ac25a49000000b0049ff620b81bmr12383716lfn.307.1664359384789;
        Wed, 28 Sep 2022 03:03:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b28-20020a05651c033c00b00261ccf566e3sm386431ljp.65.2022.09.28.03.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 03:03:03 -0700 (PDT)
Message-ID: <df396303-aa88-04ee-54fa-fe971409737c@linaro.org>
Date: Wed, 28 Sep 2022 12:03:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [V16,01/15] dt-bindings: mediatek: Add mediatek, mt8195-jpgenc
 compatible
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 angelogioacchino.delregno@collabora.com, nicolas.dufresne@collabora.com,
 wenst@chromium.org, kyrie wu <kyrie.wu@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>,
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com,
 Rob Herring <robh@kernel.org>
References: <20220928093258.32384-1-irui.wang@mediatek.com>
 <20220928093258.32384-2-irui.wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928093258.32384-2-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_030308_527832_ADAC7549 
X-CRM114-Status: GOOD (  16.33  )
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

On 28/09/2022 11:32, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> Add mediatek,mt8195-jpgenc compatible to binding document.
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> Signed-off-by: irui wang <irui.wang@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../media/mediatek,mt8195-jpegenc.yaml        | 146 ++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> new file mode 100644
> index 000000000000..5c7ba5c7e598
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> @@ -0,0 +1,146 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek JPEG Encoder Device Tree Bindings

Drop "Device Tree Bindings"

> +
> +maintainers:
> +  - kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>
> +
> +description:
> +  MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8195-jpgenc
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 4
> +    description:
> +      Points to the respective IOMMU block with master port as argument, see
> +      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +      Ports are according to the HW.

Missing blank line.

> +  dma-ranges:
> +    maxItems: 1

Best regards,
Krzysztof


