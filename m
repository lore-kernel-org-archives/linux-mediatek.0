Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB12C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 13:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26/RiG7veCsIo5UW8unW/JrBuu/9/Qm7nt/snpV37/s=; b=x/w3Y6qzpLvllf
	63Gx4DhqS41Vfbab6Bv+PqYuW6hMcw8RkeEwWCgb4I1+BNNpJojpUNQFSzG8JatnbGjiHSXGH0myD
	c4+6D/gs3TldmBOSfrobDH0yiivxe6/yfo0HDa5NST73O6Mka/uoOKTggjzZ0fMK2D5AiQrXNmGg0
	y39jacMm79BptlqnuSQcixhzgLxEaQTm9qSqBM97nwVNCrD00/M24eNni7CbH6VnHxPH81kBrcYSg
	53u6o3ZeHmlgTh43avSkNulI7j1alHHOKxBqoA6RT1dMixfxmCFfueAidPcxzpOby1vTbsH6rQLNE
	cD7QPfN0n6rZdqwYU+9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrK0L-002M7g-Nu; Wed, 18 May 2022 13:46:21 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrK0H-002M66-Or; Wed, 18 May 2022 13:46:19 +0000
Received: by mail-oi1-f176.google.com with SMTP id e189so2667973oia.8;
 Wed, 18 May 2022 06:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=8zKhwIJo0gXsAIWGyUaFPT+x1Z1JcWrSNyRipuSmgqs=;
 b=jpS1BCHMt0qHSc8RFJBfyrKbdH/kPLs/VaK9Ty1fZ+lrJAl2FiCckqOZYVZ84WoAcS
 ybr70ZMFHNEnTXmn1PC2Ym+lbseUHuie0V0jR9Lz3dpNjXvX4E5uj1ZXl9IVdxDXRBpu
 roIjb1LIaiZ2xb1/fvLY+2piEoCR6Z2MOICySPmA1K7IRnKLvlKyMftA0m+C4M9u4tVW
 Yy9CaqCfpD7VMQSNJqDuuWjaE+Dd5uguzzf5nsHgU+NZYKXIIddMiqvb79NbnJq4QSus
 26qpDPQlH1N4fdNyeD1wSkqoJD1wFrejyr8NxDOZ71tqT5LDoCR0PY5KHXLRHTMvMsJx
 5nGg==
X-Gm-Message-State: AOAM533S1DvbIDMGyhiH2Ktrfus/EmHLUuJocPieGDYn9LYH3BdoYHOX
 7B4qX+MZSPz1mqw5jlzLxw==
X-Google-Smtp-Source: ABdhPJyDA0UeGAJChEEw2/YIUdPOq9UuLN/6prgGz2LmxT7diCMuhTs+SznglSjuWfgpvESbht/lYg==
X-Received: by 2002:a05:6808:1287:b0:326:d23f:f251 with SMTP id
 a7-20020a056808128700b00326d23ff251mr16746oiw.155.1652881573534; 
 Wed, 18 May 2022 06:46:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i3-20020a9d53c3000000b0060603221239sm776619oth.9.2022.05.18.06.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 06:46:12 -0700 (PDT)
Received: (nullmailer pid 3186179 invoked by uid 1000);
 Wed, 18 May 2022 13:46:11 -0000
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: marijn.suijten@somainline.org, jason-jh.lin@mediatek.com,
 konrad.dybcio@somainline.org, linux-kernel@vger.kernel.org,
 paul.bouchara@somainline.org, krzysztof.kozlowski+dt@linaro.org,
 phone-devel@vger.kernel.org, y.oudjana@protonmail.com,
 chun-jie.chen@mediatek.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 ~postmarketos/upstreaming@lists.sr.ht, matthias.bgg@gmail.com,
 rex-bc.chen@mediatek.com, mturquette@baylibre.com, kernel@collabora.com,
 linux-clk@vger.kernel.org, tinghan.shen@mediatek.com, sam.shih@mediatek.com,
 robh+dt@kernel.org, fparent@baylibre.com, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, miles.chen@mediatek.com,
 ck.hu@mediatek.com, ikjn@chromium.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, martin.botka@somainline.org,
 weiyi.lu@mediatek.com, bgolaszewski@baylibre.com
In-Reply-To: <20220518111652.223727-5-angelogioacchino.delregno@collabora.com>
References: <20220518111652.223727-1-angelogioacchino.delregno@collabora.com>
 <20220518111652.223727-5-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 4/7] dt-bindings: clock: mediatek: Add clock driver
 bindings for MT6795
Date: Wed, 18 May 2022 08:46:11 -0500
Message-Id: <1652881571.539429.3186178.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_064617_855049_3F3E5B87 
X-CRM114-Status: GOOD (  12.06  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 18 May 2022 13:16:49 +0200, AngeloGioacchino Del Regno wrote:
> Add the bindings for the clock drivers of the MediaTek Helio X10
> MT6795 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/clock/mediatek,mt6795-clock.yaml | 66 +++++++++++++++++
>  .../clock/mediatek,mt6795-sys-clock.yaml      | 74 +++++++++++++++++++
>  2 files changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.example.dts:35.13-21 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
