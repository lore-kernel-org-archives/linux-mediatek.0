Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5FBC00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 18:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2lJJE7hfrkayt0qzi/fmG2izz2GLSD8nOH7tC1AeLo=; b=tEmR/YAh2Rj/VRo03Pigq3Ehh4
	q5RGziMDHQHL9CYiRIvL94ffkp9aIDJxN1MMHGFkyEGDG4g1yR3kdcIVW8ajSElQws+VPyLOf09x0
	km76W/LaQKpY7W3HVpp3AYWdtWTgz5IaWfcmBvd7CkSHwj2l9GAIFvMN9s2q3ns7LmrY64AtFA7ud
	FLQ/em7bQN5CYLiAKqZW19CNzFZeZpk5JG1zNHt0p/+2liS7r6Cwbm+W2RNxhuv3BrGWPq4FUz92/
	7byqeMwVsUDj/4FRDdxMl9nNt7R+z6fn/5fh9IWKNbrA/T5cXATSFSL8zbfJUXAN9867XWFXhafTS
	abmZ7PGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNf3I-003NAj-DU; Mon, 15 Aug 2022 18:43:04 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNepm-003D5j-H8
	for linux-mediatek@lists.infradead.org; Mon, 15 Aug 2022 18:29:08 +0000
Received: by mail-ot1-x329.google.com with SMTP id h9-20020a9d5549000000b0063727299bb4so5977922oti.9
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Aug 2022 11:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=+2lJJE7hfrkayt0qzi/fmG2izz2GLSD8nOH7tC1AeLo=;
        b=Lc4mNTi56/32O+lgEowursl3S1QdLAWj1FpOC5XA+F8Rx3hlrgkYOxG1d54XP1PQRd
         mRXvLbXoAcxba3284ULxJIFBNCvTT393HISNfqbcZuOLFtg+LqNpWh6FTFFT1Kn55/rk
         zAZXdzx4ceCx8rckPOQCS1eQ62LLF9XQdJtL4mfhlygbh3m8UIe1cBmEMwyCyVggoqQ5
         0AQrM/A7lyijOyzdtN6eZC5x/J5rIMS+uFtUFMAl/SWgdp5wlh8OC3/0n6nNp5sceRpk
         UgecbFyp9AiB0Vs0GSuanHfZWxpaVLDqfOE02iJGWyO2aUyx6mnP3+zKwWw4DwnIGAqg
         KVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+2lJJE7hfrkayt0qzi/fmG2izz2GLSD8nOH7tC1AeLo=;
        b=ldMJ7rRWO12yZl/DWfTYKJhC2ZrpJ4P4LM2eBydrQALgA6kUsllSvsrz7ZZunav7qG
         j6gELhz2+uXu7F6hzBaTjOu9g+zaIMaww4jrBaoaD11QN4B52mCWPED/dBS/V7ccooQ+
         ergd13Ux2K9JugrQ0aF5q9zhMlLxTyboVD9DoOQ5ZiF7UokuYRYCAR+emM3wolx98Wkv
         LbmiVbbVfORC84XX0zkH2FltLIDF+ZCpXyy2LWf+yAheJWXQnOJsVe1fxs6/sYe2Kl5B
         u90LRGIeLYbANw1Gi7ny1F9ZMj3G7AHOw+A88MtenSFvYgNQVXEFGD3USi0Ng39QLgbn
         yhmg==
X-Gm-Message-State: ACgBeo2yOYryKHMlSI2wqllsW57nte496JQK3tsHXlavO7tXGSBDnQ9w
	ODWXXpU4LcHpz9PZzRkr/61Yjtbr8K84+cHZY4eT6w==
X-Google-Smtp-Source: AA6agR76AJA44USeULweUjdFYUfN/+GbzCosXIK/UxZ4AEkVDK/VEN27cHeW+w+gAM3CyEeE2422VPU3VsRAqluGTjk=
X-Received: by 2002:a9d:490:0:b0:636:825e:3b6 with SMTP id 16-20020a9d0490000000b00636825e03b6mr6661546otm.91.1660588143705;
 Mon, 15 Aug 2022 11:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com> <20220729104441.39177-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220729104441.39177-3-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Aug 2022 20:28:07 +0200
Message-ID: <CAPDyKFqqb=FC85PAMPtrfp=vn5HWB2tXqUCY4Yjd_twxL8sY=w@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: mmc: Add compatible for MT6795 Helio X10 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org, 
	chaotian.jing@mediatek.com, matthias.bgg@gmail.com, hsinyi@chromium.org, 
	nfraprado@collabora.com, allen-kh.cheng@mediatek.com, fparent@baylibre.com, 
	sam.shih@mediatek.com, sean.wang@mediatek.com, long.cheng@mediatek.com, 
	wenbin.mei@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_112906_679174_B7F35E41 
X-CRM114-Status: GOOD (  11.80  )
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

On Fri, 29 Jul 2022 at 12:44, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a compatible string for the MT6795 SoC's mtk-sd mmc controllers.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index be366cefffc2..e1ceefe0ae48 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -20,6 +20,7 @@ properties:
>            - mediatek,mt2701-mmc
>            - mediatek,mt2712-mmc
>            - mediatek,mt6779-mmc
> +          - mediatek,mt6795-mmc
>            - mediatek,mt7620-mmc
>            - mediatek,mt7622-mmc
>            - mediatek,mt8135-mmc
> --
> 2.35.1
>

