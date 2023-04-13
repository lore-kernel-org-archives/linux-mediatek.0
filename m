Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75A8C77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 09:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hePEpcTr4MAQXnMqmGvunBUBaXlfTQunP3G36DUCNCs=; b=u76+Ipy92Iu01in9TTpWhqr8Ja
	pgFCNxuTg+K9hXe4mNf4UkCUE2HaPThhOqcfuxAkcna9hcFwaeLhji3KpRn606o5g7ZWwCH2M0FMJ
	0iDiD6xRk9b+2pidwMrRerGnipnqJtNditaTNa/twP53bK2GQGUQERsVq7b0vTI/aZWkaYzoqzIes
	H8lCowZwCzozL1Raw6QFRRenWgM7ThGJ+gHLs3z8MEUbaB80yMMJHKBLbImGHnRJFeww2Vc8/IKC9
	LBcvA5JderAgfE05TiWtMtpen++Mikwc2qOpq1mvMoVMskMB33YiebyzTu8RXio4OQ51OQzqvjfhM
	DIcK8YcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsqW-005V8C-2z;
	Thu, 13 Apr 2023 09:02:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsqS-005V54-27;
	Thu, 13 Apr 2023 09:02:23 +0000
Received: by mail-wm1-x330.google.com with SMTP id i8-20020a05600c354800b003ee93d2c914so9307036wmq.2;
        Thu, 13 Apr 2023 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681376537; x=1683968537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hePEpcTr4MAQXnMqmGvunBUBaXlfTQunP3G36DUCNCs=;
        b=i384PkJRVYCYGBvDYMZG66hIP7oQMpQ+MeQp/fPjllVefZwhzkl3kDUOGFu/vypz8T
         D6tL+cedlOpEaUDl2/IgVaOdz7L8MEpodY9vNHfqICdYqG8q7ChwsFNgjN7fZtv3mDSW
         gJPmjsKow89Ry8rWAXCZGQao+/+nYq7MLq6ne7d2RLTRxdBNxPufaWEPyI38RV8QShp/
         qlKh7Oq95ZAXhbB+RFkVTwXyyKtwMH/zm3QUHdzXfM3TxZAWK0FXb+dVTv1NMJzdjfTa
         +IMnx+ov+3BB/U97k1VQNoHS0DRz6SXfXLtn1HBSl0R/hCTO3meFsJhRVNi3SSLWq6JN
         XYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681376537; x=1683968537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hePEpcTr4MAQXnMqmGvunBUBaXlfTQunP3G36DUCNCs=;
        b=ZzZPE01wnACjjtbL+hpeFU/8xzTiYbLVYx7Acatl7ASq19V2TX4h77jQ/rmhpqf99R
         wUkex2VN4xyS8xrvIQdnG+yHkAAKjLI7eq++5tEU9FJuakPKHkinGqk/tpsfQs3eLH0r
         umxdT+PVByZN2qF2kDp4mNK4pzLULoIxF7/EHCThkhr70vL+Fgf3btzZgkemasUIQ98g
         zObPhIXvVnBQ2Cptv9SCccnXBjloInVS/ZWA+GYfTHDMI4xK2sJFw9wsRAZBiVtcRR6d
         YfCzteKCVvXfNMPMN7fqpo5Jb4Z7lxtXgSocBUy4LYHytLJdH9fq4KYt8LvsJk0tci7C
         PCaw==
X-Gm-Message-State: AAQBX9ca1McZFPahPignS1cLTWn0Nqv1G+4rgv8o7PVT0ARd6PR4m6Cj
	kOKeVHn8jXFqP2euo7spFxk=
X-Google-Smtp-Source: AKy350aPIkSil2eNqxWa6pty/dkpEVy0N3KQzirw3H6p8KpaxSec/NGQXd6t3JGm8Dit1W6dKyunfA==
X-Received: by 2002:a7b:cd0b:0:b0:3f0:310c:e3cf with SMTP id f11-20020a7bcd0b000000b003f0310ce3cfmr1204986wmj.37.1681376536720;
        Thu, 13 Apr 2023 02:02:16 -0700 (PDT)
Received: from [192.168.0.32] ([37.222.243.26])
        by smtp.gmail.com with ESMTPSA id x19-20020a1c7c13000000b003ef5b011b30sm1267080wmc.8.2023.04.13.02.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 02:02:15 -0700 (PDT)
Message-ID: <83323c24-304c-b129-88fa-f001c0d9e04d@gmail.com>
Date: Thu, 13 Apr 2023 11:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: dsi: Add compatible
 for MediaTek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jitao.shi@mediatek.com,
 shuijing.li@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1681366162-4949-1-git-send-email-xinlei.lee@mediatek.com>
 <1681366162-4949-2-git-send-email-xinlei.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1681366162-4949-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_020220_702525_7DFE295F 
X-CRM114-Status: GOOD (  12.20  )
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



On 13/04/2023 08:09, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dsi for MediaTek MT8188 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> index 4707b60238b0..13fa76299254 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> @@ -29,6 +29,7 @@ properties:
>         - mediatek,mt8173-dsi
>         - mediatek,mt8183-dsi
>         - mediatek,mt8186-dsi
> +      - mediatek,mt8188-dsi
>   
>     reg:
>       maxItems: 1

