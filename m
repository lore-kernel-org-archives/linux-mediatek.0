Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA27C38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 18:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciAUyFR+42a1vYSLsFy+yot8yqPlPhT53zC6CUWjbC4=; b=szdjf/Xisf9Tvt9xFmbd9Ktnut
	yvD85LVhHYBFpCmH2bkMXIktT3C1D5bCi/gkDZWOBRU3fq65OekS5w9vPjm2KV6esKttzjDhdDX63
	rJZ5VqT50Ib3MbVWaXl9m39bzSYNh8jqaEfvl/Rm0+uHcZaDa5GZttr8vwY4d+M1G4hdOB2eQxrwG
	bXlC1Vl219osGVq7pbN6L2AV+H+LDm4nxg+M45To1JigU6Wphg8eGQBpAJjwL3rjTyur3mpMbf2+z
	ZyNbXqB5Zc/x4T7JtIjL0WZmDrdGfc5XkjLefbM2gtLU1O2cRRrHwAZ5nqNTpTTC3XIEyd4SCrwJk
	z3RTnAQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on2L9-002gRP-V3; Mon, 24 Oct 2022 18:38:23 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on2L5-002gQK-Ui; Mon, 24 Oct 2022 18:38:21 +0000
Received: by mail-oi1-f175.google.com with SMTP id n83so11728694oif.11;
        Mon, 24 Oct 2022 11:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciAUyFR+42a1vYSLsFy+yot8yqPlPhT53zC6CUWjbC4=;
        b=nhMtxNJzXiXqFFiMJqPN8s4Ag/CvHDjSvmH5Cvi9E9hW4fn2D7tTqM0EfgaWSW/KK+
         uUTHzeFFMUj7CObRVdrjsxJdOusCRwZvgTOi5SR2Ri05BkygS0TDyviwT2J/ZjWF1NZF
         lepXVFV2A6TabnmQruVb4S23sx38+1qs6ZmQ7PPtxcW5Q+K1q/ihYY/ln+RZCvdK0BQQ
         Gi0D7OAC3aWoAAwnYeIr3jRQA5kEYFJZbfXdUTFYZjdBFWtpRaL+13uUGPtjKfwzRIWR
         4354/fIVifmcKYAvBsWfcfnfiAxG/62D1MgzprnRpOJV86pEYIEwyE4QyPgKURebY09p
         AIAQ==
X-Gm-Message-State: ACrzQf13DN+ZZw66b3MQ0+8vf/xGGTQDmdtgeCN9odIas94ojc74O4pN
	r4B8UQrKmPsKO2rZbtI5lA==
X-Google-Smtp-Source: AMsMyM7TPrZafIdws9bZJlUf5Wc3/2fjYb4Lmh/WsftciJEci6PPdMXQKHLrxishbgh6ZRsM1v4DMQ==
X-Received: by 2002:aca:aa8f:0:b0:354:fc38:aeb6 with SMTP id t137-20020acaaa8f000000b00354fc38aeb6mr27714978oie.224.1666636696900;
        Mon, 24 Oct 2022 11:38:16 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x52-20020a9d37b7000000b00661c3846b4csm89315otb.27.2022.10.24.11.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 11:38:16 -0700 (PDT)
Received: (nullmailer pid 2023578 invoked by uid 1000);
	Mon, 24 Oct 2022 18:38:17 -0000
Date: Mon, 24 Oct 2022 13:38:17 -0500
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com, p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, Project_Global_Chrome_Upstream_Group@mediatek.com, alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 12/12] dt-bindings: mediatek: mt8188: add
 mt8188-mt6359 document
Message-ID: <20221024183817.GA2019162-robh@kernel.org>
References: <20221021082719.18325-1-trevor.wu@mediatek.com>
 <20221021082719.18325-13-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021082719.18325-13-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_113820_015321_C3DF9D80 
X-CRM114-Status: GOOD (  18.61  )
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

On Fri, Oct 21, 2022 at 04:27:19PM +0800, Trevor Wu wrote:
> Add document for mt8188 board with mt6359.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8188-mt6359.yaml         | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
> new file mode 100644
> index 000000000000..9c493a6101ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8188-mt6359.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8188 ASoC sound card driver

Drop 'driver'

> +
> +maintainers:
> +  - Trevor Wu <trevor.wu@mediatek.com>
> +
> +description:
> +  This binding describes the MT8188 sound card.

Drop, the description doesn't add anything the title didn't say.

> +
> +properties:
> +  compatible:
> +    enum:

Only 1 entry, use 'const'

> +      - mediatek,mt8188_mt6359_evb

s/_/-/

> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      sink/source pair of strings. Valid names could be the input or output
> +      widgets of audio components, power supplies, MicBias of codec and the
> +      software switch.
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8188 ASoC platform.
> +
> +  mediatek,dptx-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8188 Display Port Tx codec node.
> +
> +  mediatek,hdmi-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8188 HDMI codec node.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +
> +examples:
> +  - |
> +
> +    sound: mt8188-sound {
> +        compatible = "mediatek,mt8188_mt6359_evb";
> +        mediatek,platform = <&afe>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&aud_pins_default>;
> +        audio-routing =
> +            "Headphone", "Headphone L",
> +            "Headphone", "Headphone R",
> +            "AIN1", "Headset Mic";
> +    };
> +
> +...
> -- 
> 2.18.0
> 
> 

