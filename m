Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584F1C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jun 2022 20:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHG9vYe2+hEIeP66IB+CeZnBwWHvaVXCoSe7QCvQNhU=; b=ZdPgckQafwdFAIrWmc/Y86z9+C
	noGoKFVpiaTuvdQMUN9HVHJZxDmPX5THnECUPy1ifVOUM829kXUkJmFCGkBs5erHFnA9++NMFTRrB
	46rDgOZL4ZR4yG+Chf/sjLaQlprWZjxEiSotEQiX8eYmjy5uYDQ0o4f3EM0YgKbuM8Q1Mr5WQykM9
	HEr2y9rETATaz3XtAoMc7ZSrwPQXz7Qv0CffhYGtEn3KMKENDnaMscGB7F1UIFAPNq1CYmxTjVTdR
	9XGvGREmqQ1PZoVfY7ta+e/n6ly/U619fEQZMVtxv9LR1xkh0wckKUr8vGRUvsStlcjsMjE8Q/5sE
	ulahF/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5CQM-007hla-5q; Sat, 25 Jun 2022 20:30:34 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5CQ7-007hew-A3
	for linux-mediatek@lists.infradead.org; Sat, 25 Jun 2022 20:30:22 +0000
Received: by mail-ed1-x52f.google.com with SMTP id eo8so7949224edb.0
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Jun 2022 13:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PHG9vYe2+hEIeP66IB+CeZnBwWHvaVXCoSe7QCvQNhU=;
        b=xSpJ6XbSd0A7dLt1FY+JUOG/cm/CKtjXEIFSby2R4jI0UjMkpOlGppnN29cACTsGaw
         sz19dgQdZqYcm6kexLNZDhBNGKeuw4IHI/mdiCemWqY8omrh/akAvMFtoPlmlzMrNmKT
         97cxcHtvQ4E6UKwbkCZ1K47JD+i3agmvrw125GPneZ74GXXGpbPMP7EYqX5Oxunrdm8U
         tluliXhTH7TD0ISez1OaWMau5YiJPZkqmV/4p1aTDn6VuxtNhIi9rmdTAqRxEhI72+sC
         EK4fB9yl74Cv04yEn+jkwAv7k77qr4IxDosmiV4Jv13kSaoK58EafOZNH2XqKcleWkks
         09hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PHG9vYe2+hEIeP66IB+CeZnBwWHvaVXCoSe7QCvQNhU=;
        b=IJ4iW2BuLueHbCNaK9OQHgr4SQ+fyLd2auNJjGdCPjFbRYGQXJCsmL9eA8s8jyw83q
         uKp7j9xsThpABpjdA5Q4DSI/vgBQMYp5mMc5q0rK+2k8QAYR09sjgRJMNydHw6vLNHl9
         c49da0EYlUr7PEfTuNO+z8DgZRwa1lp8okRRvXR9ALvd3i35dF7H8mYpIdGJrvL90tRd
         iD7qYHh5Re0FfyY4jEOJntVkaCtxvJNkP44TZraIyO0e/U6AHbAVRr0z539nG3Be+U4o
         AdO2jivw1qGRaIBRRXrBIKay3NTIGsOdxgLArtm3cf2Z9P4KDU1J6EzS7FF8ABKrLus3
         2bYQ==
X-Gm-Message-State: AJIora97TEWmuu65IZQeUt53j0U4Fd5Ocldsm1QC0w4CkG5w144fTJ+9
	B6y5qx4/0zjUw5lMpnDlZtFpyFwd3wfdew==
X-Google-Smtp-Source: AGRyM1u2IoPVRmbzjGQPCytqxD5DC+9n1JnhWsNu7nFxeSHqqkgpsfArHMNCP7TFUZFu4aG1BuusKA==
X-Received: by 2002:a50:fc15:0:b0:435:7897:e8ab with SMTP id i21-20020a50fc15000000b004357897e8abmr6969427edr.17.1656189016908;
        Sat, 25 Jun 2022 13:30:16 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id oz20-20020a170906cd1400b006f3ef214dc7sm2960987ejb.45.2022.06.25.13.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jun 2022 13:30:16 -0700 (PDT)
Message-ID: <1c3d3e0a-5598-be8d-fc48-04529e7fecb0@linaro.org>
Date: Sat, 25 Jun 2022 22:30:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/7] dt-bindings: reset: Add bindings for MT6795 Helio
 X10 reset controllers
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, jason-jh.lin@mediatek.com, ck.hu@mediatek.com,
 fparent@baylibre.com, rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>
References: <20220624093525.243077-1-angelogioacchino.delregno@collabora.com>
 <20220624093525.243077-4-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624093525.243077-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_133019_379076_961246E6 
X-CRM114-Status: GOOD (  10.94  )
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

On 24/06/2022 11:35, AngeloGioacchino Del Regno wrote:
> Add the reset controller bindings for MT6795.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  include/dt-bindings/reset/mt6795-resets.h | 50 +++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mt6795-resets.h
> 
> diff --git a/include/dt-bindings/reset/mt6795-resets.h b/include/dt-bindings/reset/mt6795-resets.h
> new file mode 100644
> index 000000000000..0a6514884eae
> --- /dev/null
> +++ b/include/dt-bindings/reset/mt6795-resets.h

Like bindings, so vendor prefix is needed.

Best regards,
Krzysztof

