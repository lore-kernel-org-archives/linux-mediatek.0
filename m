Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881C3C6FA89
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 12:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BuVt6lsnNIf1f5TsO09+qDlO9fUb7IxQ9OktWX9FRPo=; b=r42nkd+DEp6sjJjpkVwNyR5ou8
	EAWlD0p3m4g8H0H4jUbKFDCdgLC/imiCWs//5mKiXffMuwuf42ol0Et2nH9aG7ioKxYbqdqerEVxq
	3ez02UGi1o9Z3cQ/VZeUJybnipUnQ0WQXPYQdpdFLzMxnm7ITcgjPthsV7zxsZrb8+meVG4th5ikm
	D+VV6h1/UHRxpSYJ0Z0yF0jyxHahJwwL1C1+e9s0xdVLpQpG66UcMZMv/QU0g6tgxMIA7UF7O1Dyi
	ZAVw6SvKNpDJIsx3SQV6bIunOtYoJB+aULd+2dpWXw2wDW13FAC72WTGsX8gh9R+LnCoUsC8pqRfq
	wffJ2Thw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYnvn-008V7h-Hk; Thu, 15 Sep 2022 12:25:23 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYlWv-005keG-DU
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 09:51:35 +0000
Received: by mail-wr1-x42e.google.com with SMTP id k9so30039190wri.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Sep 2022 02:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date;
        bh=BuVt6lsnNIf1f5TsO09+qDlO9fUb7IxQ9OktWX9FRPo=;
        b=J43ABlIU+n6HtC3dmwfywMBb5ekaNd6DmIxl7ztGahSXRW3Bev0Zu3iEf3jgs7O6Xl
         2CnUOvS2Y5rQaYDzvc5L6MBnFaT244sTb9j7EJvIQX5bkooV56kDD5q0ymPU+Cc0wUmt
         td3bKjiaCkD6uo5sGlvXvWUrfJrwfBxbpEro11ovHH+18vxP1fMCL5z/LqmuzbXnWNmA
         5LwxiZiY2i7ftmBK4AxytbcS4/mboAEuyx/putDy7uW8CjDn8Q4yCxtKc0oxP7WkrfGO
         sd8fQJahBX+YlhWySteORUgZnjvMqD+XUMB04QsaiBwPJ0jkS+IW2JZZ2CU3hXvYmZuG
         1aKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BuVt6lsnNIf1f5TsO09+qDlO9fUb7IxQ9OktWX9FRPo=;
        b=rfcLc7eFzniZGH8mqJ6yEUw4PTSu/nMg3NUTs3dIMJeJN2UlEB9nFKI26uHqkyrdtP
         g4Gz2IY09/HVrGCWc8LB/vp58UyjRmigU2DyWGKvCr+RBS8ALWABjDHqpPFZ8MeEI1c8
         XrOEG/v/8sOxJ3hR2ZIuuUuTRcHpD6B1eOqz8RHhMIU0gQqw6i1Bbx0TEUj1rFDCKadt
         7bZnbIr3Ptlc3AiiWYveUF8C31swWjgKbi8ZolWOm5VHAHv1CB4Dld5LPQY1SI+cH22Q
         aGQj9FjzYPrBA1bBYmconH93EbcA5l7dZFMlJU8T8aXHsBhERDizLQQkySOMJDoShPef
         3cPQ==
X-Gm-Message-State: ACgBeo3CcoF5Th08lEvB7YjpMEJgd/SDL2xDTEzyKkBvf5MQlfzIOjM/
	1etbLnM2uLYkL0oguATCqlpDrw==
X-Google-Smtp-Source: AA6agR4gSNPSrOb9RZbxLv6QZek2yV2JCZ8disP3/BeBxy6YxG5eFRUi5nb6BWCaqq6thusFF9Q7Qw==
X-Received: by 2002:a5d:4f12:0:b0:22a:47ee:7378 with SMTP id c18-20020a5d4f12000000b0022a47ee7378mr15590926wru.672.1663235491853;
        Thu, 15 Sep 2022 02:51:31 -0700 (PDT)
Received: from krzk-bin ([89.101.193.73])
        by smtp.gmail.com with ESMTPSA id n4-20020a1ca404000000b003b47ff3807fsm2240950wme.5.2022.09.15.02.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 02:51:31 -0700 (PDT)
Date: Thu, 15 Sep 2022 10:51:29 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com,
	Tzung-Bi Shih <tzungbi@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	nicolas.dufresne@collabora.com,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Longfei Wang <longfei.wang@mediatek.com>,
	Tomasz Figa <tfiga@google.com>, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maoguang Meng <maoguang.meng@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org,
	Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH v5, 1/8] dt-bindings: media: mediatek: vcodec: Adds
 encoder cores dt-bindings for mt8195
Message-ID: <20220915095129.ubzwarmglgbvqpdn@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_025133_511026_09987997 
X-CRM114-Status: GOOD (  16.32  )
X-Mailman-Approved-At: Thu, 15 Sep 2022 05:25:22 -0700
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

On Fri, 29 Jul 2022 11:51:22 +0800, Irui Wang wrote:
> mt8195 has two H264 encoder hardware, which are named core0 and core1.
> The two encoder cores are independent, we can just enable one core to
> do encoding or enable both of them to achieve higher performance. We
> pick core0 as main device and core1 as its subdevice, it just a way to
> to manage the two encoder hardware, because they are two equal encoder
> hardware with the same function.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../media/mediatek,vcodec-encoder-core.yaml   | 218 ++++++++++++++++++
>  .../media/mediatek,vcodec-encoder.yaml        |   1 -
>  2 files changed, 218 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/spi-rockchip.example.dtb: spi@ff110000: Unevaluated properties are not allowed ('pinctrl-0', 'pinctrl-1' were unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/spi-rockchip.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

