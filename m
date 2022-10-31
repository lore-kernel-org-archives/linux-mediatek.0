Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C923C38A02
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 12:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIgEds2lsUEazFDcLqiFcBouG6saS9AagLSYOnXJFgM=; b=UVNn9tE4ugxta1ZniGBhAKAnln
	zoGUwO2bGz0iWRVKFQ6oyLMvnhhwarIEY1yd2MetwB5l3czBXBcebc8onZ40jK4s5m1x9UcGfO3S0
	1+5W2EUWQA+TVZ4cN/0QiU+IHwmb2/l5c0qxLv72VhTOGrfrgCdQIRDAY9Tsfksm62H68jddpQJjD
	9ANJF8AN8y2e2jhFgEpSQr7zM1WmRnlAtQjKk4VNlDBmHZgJS7JmA+hsTKEW7A24yRELwPHY22Lvq
	x4UE++Sjk/6aLdR64mkgQ/odBLJpkoqO9QB976jOsWqg76zpbqmg/ZFaCQEe8S7x1UShxp3isi8ii
	FA114Jgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTad-00BXOw-2g; Mon, 31 Oct 2022 12:08:27 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTaO-00BXFU-HY
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 12:08:15 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-369426664f9so105404337b3.12
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Oct 2022 05:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uIgEds2lsUEazFDcLqiFcBouG6saS9AagLSYOnXJFgM=;
        b=pBJsJOAmF+05N3+3hZfjF1ZtP+2ryz6assxcuDYfI5liFd25pwJmh3ip1CYl0NQ5b7
         Q/R1ZzvhOAmZwRIKXL0/Rd3vJlSMqBQhKbXmeRKtrHVvCXgJCl68xaX2G9UwK4VfPkcr
         DbST64ziRaWJXYFPDvxm+67zOVzWRldT5mqtqIjB0pQbk0KOFdLZlVOkbQIgegc/M26f
         HCwZRlL2uhDTlN69oODCR8mTGCI+bqk6NyYip7jNywRSyby2dLOxUeqKKCeTF+bQdwb8
         uIj5xO9FWyVJFdKEt7rZYqlLXCtjHoHoxBURZ+9i2kIIC/npgwSi00nnFKPe6hjb2lW6
         BjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIgEds2lsUEazFDcLqiFcBouG6saS9AagLSYOnXJFgM=;
        b=wLfucLXBNmtJlxgGt2lyrilvKthwAeV7aPXbZiKfccjq5r+M4dSFedJBYWDXbNbK1s
         fY6dU6G8huHuBNDuO59xVmB5TgzewGRfzLsgt84NvpCGmY8vEwBT+Di8WdrMJRYsE1Lk
         2khtGs4n3CiKCqK/2Qz+c1mF2Y3DPTgtrOsHmL1UlGp6lZUZIePBKSdDcvx3otb6dXb/
         VrhSeRdNRNoK8YEGL120AKkj8lb9Ts4r9MzBRsoFHkz/21s4M5XJZwzrLpBxDVNy6VIH
         qwkJ/Gx9TwftnNozzGPo2l3Wa4eLMQwuqkPpZ486dyWikXU9AMn3Av+fy5sCbrscH2K8
         ggHw==
X-Gm-Message-State: ACrzQf3/mITTlsGRWoHvxb54Gn32EJMnQLDaV08UGobHMTdfsMa25EHk
	ssOJxG56ns4Lwa71UbQVr6xQm9pV7ZfG7b+bKVbuMw==
X-Google-Smtp-Source: AMsMyM6Rk+z9XSkM0gx0kUZjmUPDqfeBWgYp5+03gj8tpxxxciSK6Ab/X9mTjfczx5v4JFxVOh/jbjlcTd0zGQEaMuA=
X-Received: by 2002:a81:4f89:0:b0:36a:f09f:73fc with SMTP id
 d131-20020a814f89000000b0036af09f73fcmr12513606ywb.487.1667218078610; Mon, 31
 Oct 2022 05:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221030172609.1635096-1-ajye_huang@compal.corp-partner.google.com>
 <20221030172609.1635096-2-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20221030172609.1635096-2-ajye_huang@compal.corp-partner.google.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Mon, 31 Oct 2022 20:07:47 +0800
Message-ID: <CALprXBY3S5N-g6N=q4DgF3ngq-eTxc_+LjGJQp2QjVz+Fi4pRg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-mediatek@lists.infradead.org, "chunxu . li" <chunxu.li@mediatek.com>, 
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_050812_623554_6D87750F 
X-CRM114-Status: UNSURE (   9.71  )
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

Hi Rob Herring,


On Mon, Oct 31, 2022 at 1:26 AM Ajye Huang
<ajye_huang@compal.corp-partner.google.com> wrote:
>
> +
> +        dmic-gpios = <&pio 23 0>;
>
>          headset-codec {
>              sound-dai = <&rt5682s>;
> --
> 2.25.1
>

I think the modification will be better, I will send v5 again, thanks
@@ -63,14 +70,19 @@ required:

 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>

     sound: mt8186-sound {
         compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound";
         mediatek,platform = <&afe>;
         pinctrl-names = "aud_clk_mosi_off",
-                        "aud_clk_mosi_on";
+                        "aud_clk_mosi_on",
+                        "aud_gpio_dmic_sec";
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
+        pinctrl-2 = <&aud_gpio_dmic_sec>;
+
+        dmic-gpios = <&pio 23 GPIO_ACTIVE_HIGH>;

         headset-codec {
             sound-dai = <&rt5682s>;

