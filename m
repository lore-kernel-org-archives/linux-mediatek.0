Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA36C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 16:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=geXSbCG6niMyOKEJrdBZX6zFp+izpEP+FAlHQRn77Uo=; b=zfYz9rSbqu/nYP
	y2ABknriTkwHhS16BPq9URRgunT9R/o90qpTmlIdcbyis0iARLrflGtSD2+PAKE3R1Ve6T0G4s+D5
	E9oVfaz+qaBOXcRJgZ+TO7gj3SB7jNl0cERkm7raiqJPnMCydT3lq+Zy+FArHTEU6HWYZwGoSUKVx
	KG+TgvuMM73hR/4PdWx6hX7yItRFBlNoM789zW7xNkcbWp7nkdP9DHR0T8CA8654aJDHmprDtbLoF
	LyvycXOsMC1z78HYlGkd46F6GQQ1X98/vCv23Rexx1xU4TGdydfPxquVEZhO2kl4XAPRCCoJErw7e
	hjar7ztLzJCUO6jiHAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNGmd-001WRy-Ht; Thu, 24 Feb 2022 16:15:59 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNGjf-001VDv-3O; Thu, 24 Feb 2022 16:12:57 +0000
Received: by mail-oi1-f177.google.com with SMTP id j2so3123223oie.7;
 Thu, 24 Feb 2022 08:12:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zbkQNmRMiKw/pcrFZH62eSxRpSbb/s9oDkkz3K5wBJ4=;
 b=WS1U9w71vkZ50ypzMlJ1W4CzMiFrhrWZi4HOuvSqZf9Co3Q7MME25AmRokTHZ1NKjw
 qT0McGNjM9qOFMR90qkaQtaJm0r8DwTpGhquGac758+UaQC8gNK/ZlP6oPEUDfBPoQx7
 LMgmj0vRXVm1b/AQyP0+v5ykvr4GucQuJsZQnpCyuQFRzu365ThRXx7VP7OQm87rietI
 pYnad7eanjXIxxnJ8VXYimviQax6Dszo5kjO/D6s2d4hwLxBNZlDlTIp2NqlVlbU1haD
 eRRcq7zzlfgRu9DNgI3YBV+zLjp3EGGGJOHy3Qp14J2isHX0/seiaUYST82dRxGsri4O
 Gy1w==
X-Gm-Message-State: AOAM532HZPJXw7PL75Rn/c2kkhHCCbmBQLtPjil4iAbldWAhUkG5aXDV
 LeQfDbmlOLkX8fSA6981/A==
X-Google-Smtp-Source: ABdhPJxUdvQQ74bDVPACbU46SgRLAo662OysqMgqfjKUa3F3TgTNZydiCsoVlSxthTdtiIVIFdbrsg==
X-Received: by 2002:aca:5c89:0:b0:2d5:18eb:9e6 with SMTP id
 q131-20020aca5c89000000b002d518eb09e6mr1735362oib.58.1645719172925; 
 Thu, 24 Feb 2022 08:12:52 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bc16sm1650906oib.26.2022.02.24.08.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 08:12:52 -0800 (PST)
Received: (nullmailer pid 3173677 invoked by uid 1000);
 Thu, 24 Feb 2022 16:12:50 -0000
Date: Thu, 24 Feb 2022 10:12:50 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, tzungbi@google.com,
 cujomalainey@google.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Kevin Hilman <khilman@baylibre.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v17 1/2] dt-bindings: mailbox: mtk,adsp-mbox: add mtk
 adsp-mbox document
Message-ID: <YheugpFub9ArHDyT@robh.at.kernel.org>
References: <20220224133045.23903-1-allen-kh.cheng@mediatek.com>
 <20220224133045.23903-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220224133045.23903-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_081255_222169_00DFA08C 
X-CRM114-Status: GOOD (  19.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 24, 2022 at 09:30:44PM +0800, Allen-KH Cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This patch adds document for mediatek adsp mbox
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mailbox/mtk,adsp-mbox.yaml       | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> new file mode 100644
> index 000000000000..25756837797f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek ADSP mailbox
> +
> +maintainers:
> +  - Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> +
> +description: |
> +  The MTK ADSP mailbox Inter-Processor Communication (IPC) enables the SoC
> +  to ommunicate with ADSP by passing messages through two mailbox channels.
> +  The MTK ADSP mailbox IPC also provides the ability for one processor to
> +  signal the other processor using interrupts.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt8195-adsp-mbox
> +
> +  "#mbox-cells":
> +    const: 0
> +
> +  reg:
> +    description:
> +      Physical address base for dsp mbox registers.

That's fairly obvious. Drop.

You need to define how many: 'maxItems: 1'

> +
> +  interrupts:
> +    description:
> +      adsp mbox interrupt

Same here.

> +
> +required:
> +  - compatible
> +  - "#mbox-cells"
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    adsp_mailbox0:mailbox@10816000 {
> +        compatible = "mediatek,mt8195-adsp-mbox";
> +        #mbox-cells = <0>;
> +        reg = <0x10816000 0x1000>;
> +        interrupts = <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH 0>;
> +    };
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
