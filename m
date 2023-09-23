Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0090BCE7A8C
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 16:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwXDdCQptEP/nw6d5R5qSVoajNpgD48V9SGyZsJIHbo=; b=Ae/da/XneNhEHLf2EbnnGZ+AZB
	sHuqUb1zFxgKmycWPb5bd7g3onXD4WUM/jb8fFVcJIS7aZMnRAM6y7hxaozxK7/OooqnurCFdWdY4
	h+y61ygLio+FHMZWupBRe7dHFyx+jUR1+8WDigCzUciCdxQuIt+kJFdsX+42qfJV92hFIjsaV5ykT
	7wSEISvgJYA3jWTRpBcgC9ZrECyU7fyc01h4Mqp4g+511mL2ty6UGAaXCSyMKTN9nsEfZgH1Zv3nZ
	him1UVtn/JVUNfzXpeo5bYlns4GRGMexu+zoN0GGzJ5XLmyCyNxVtfjgltGOzfljfzzcW5PCkh6Rm
	/2z81Umw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk5jk-00BDdY-2E;
	Sat, 23 Sep 2023 16:44:08 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk5jg-00BDca-3C
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Sep 2023 16:44:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3231df054c4so136604f8f.0
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Sep 2023 09:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695487442; x=1696092242; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rwXDdCQptEP/nw6d5R5qSVoajNpgD48V9SGyZsJIHbo=;
        b=q8MAhRsKyoeCIiMzrgcPKdRSpQN2sCyVShy98YiZY3YTLiMpNLAEvAOBL80+DJSheT
         AF3AmStTz3OYMiHcD3OTfA/V/Iye+U6/pR3l14nnbvWgQSQS5nAE/QQO3bRRfS6yL1/O
         ZFDqXuyCHlFi41lRnGPrFg1m7kibCS3Mnm5bm0XbkDOT3oa7oiXD4YB+0TwEN81XbWlN
         gOLz+H5JQv+q/76UtcZjxz1Korxw0FPBSyOY9BoBW4uOlKSMv30pgruy//jCz361GhG3
         M4krFE27Ywe+m/y9yU0Tp2gPxmb8U0ts3DVP0aT2ngwaskgALHi/2OxfuZrJ8YTKdfnL
         sswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695487442; x=1696092242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwXDdCQptEP/nw6d5R5qSVoajNpgD48V9SGyZsJIHbo=;
        b=iTsWLehjuQh1GZOl0HuoiW42UXV92aV6s2tGgeVY7mXQGuGIotstn0LJlqQZHV7r4f
         m/D8M8ManxoOtjQqUfq12BIvNYy7hzG2uBzHu/V4+kgEkU6Dx6qaF6tsRO/wEMK4/rar
         THKxfhqylTFANE7ZsXhwBxXlDQjdK/5CGPDAm51FNnCf53dHaEL834BwQg7MYpS/SzSW
         ho2ltYi7JDCwMEnHCj+0KfBnoF8PjfP811K+kPgUBrd60YbMk1oOcgz6Dcb0eDcfxkaO
         huHxGFRQf4fHTskO2mTneIayjmUAaRreCGlOea1GyZwqFLBwl8Sk4QRBzOykj8aoT7wC
         wwiA==
X-Gm-Message-State: AOJu0YwoN3bcZ5MlDiCy9t+tNwLsUKMv1VaOFOLQkF/SGnxNIKEuN3iQ
	VAzcgfn8M8R3W/jTxquc8GGxKQ==
X-Google-Smtp-Source: AGHT+IGUp9vWURoqWCtTYN6CKaYvUBZmRKeL0YoxcxOlYDVcQJOgyOxbi3Pq3R8mE4CSABKxCOgFMg==
X-Received: by 2002:adf:fcc5:0:b0:320:b2a:4ea6 with SMTP id f5-20020adffcc5000000b003200b2a4ea6mr2618848wrs.9.1695487442674;
        Sat, 23 Sep 2023 09:44:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id s7-20020adfea87000000b0030ada01ca78sm7299990wrm.10.2023.09.23.09.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 09:44:02 -0700 (PDT)
Message-ID: <4e21d965-b7b6-8b2a-5e78-37b9da69b2f1@linaro.org>
Date: Sat, 23 Sep 2023 18:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 03/16] dt-bindings: media: mediatek: mdp3: include
 common properties
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-4-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230922072116.11009-4-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_094405_030279_89757657 
X-CRM114-Status: GOOD (  13.51  )
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

On 22/09/2023 09:21, Moudy Ho wrote:
> To minimize duplication and standardize the document style,
> include the common properties for MT8183 RDMA.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 43 ++-----------------
>  1 file changed, 4 insertions(+), 39 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index 3e128733ef53..0539badc9821 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: MediaTek Read Direct Memory Access
> +title: MediaTek MT8183 Read Direct Memory Access

How is this related to patch? Why rename is separate? This is poor way
to split your work.

Best regards,
Krzysztof


