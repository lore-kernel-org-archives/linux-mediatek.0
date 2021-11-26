Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23A4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 11:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYdByDZJX3KnuEqaEhP5Y+Tju/DYJZjQL+zrtnJ2xXU=; b=v112L4o5OAOIY2ywqWWWEtsJV3
	pdTkXq+y/W3nWfZf79MHzqihEGJp+jdr5tvGLKA3hvPQDYTqi97dHp7Og+b9I/qJu2G5B40tJBSLT
	HU/ZB8XKnAS12M8qg65czN8s+LkxZBOhFMvp8tmKtipO3GFJw7VN5r8S3bjCWnj63oQMgaYTjYh1f
	iCSt9LJsqSMUwlZ9xufDgjJ5apCUasPXqoJdA/7ERZY1UH0rSzKIAswdZZUdRjynkq90Qcezhj+2K
	WHeUh1pEczfNee15KJ1F30IW2f+Y928zFn2AL+uaWHt6ZSbjx9u5Io8wjcWtSmr9x0PgFkAGaVAmO
	WotOD+9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqZWe-00AAU5-Iv; Fri, 26 Nov 2021 11:36:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqZWQ-00AAQA-QS; Fri, 26 Nov 2021 11:36:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8C3911F46833
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637926565; bh=GIN8NoFGOSznfLIa1UX7Cx0wpd48djpTS3XTrBwxP9Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lZK3eP0ZA/iBWLFpQoU5OPkTE18dCbYBdQ1mKszmuTulvkifopnqeZp8OsEiv7GAu
 RCLdmKj/fK+LVGYjHBz2bPbpRyE/ZwiSjLnqbQQ7i9dVX6+Fd51wThoFc7zVOspUyP
 JO3+KR/f5O6qTgVzDQZZK5nmlcSCuncVTz/86w99gOT+sr+G/tScpGIJG1+81z5DFq
 lvz//6jrIxmZx6zGp5gMs2cUVe1nrcpemkjLq+qZ09/EQGyd5+RBPOnLJ/AlnILeBZ
 kmpbUnkcZfAkpR/wrRkFXllVKynfJplCP7ERDwfclm3DFRoVTmE+LVUIenUy4vpLiY
 x4i9nW99BwfMw==
Subject: Re: [PATCH v6 1/3] dt-bindings: mediatek: add adsp-mbox document
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, tzungbi@google.com,
 cujomalainey@google.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
References: <20211126093021.25462-1-allen-kh.cheng@mediatek.com>
 <20211126093021.25462-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <56c862fd-2fc3-4cbb-97a8-154a9faabd6f@collabora.com>
Date: Fri, 26 Nov 2021 12:36:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211126093021.25462-2-allen-kh.cheng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_033607_044259_646793B2 
X-CRM114-Status: GOOD (  19.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 26/11/21 10:30, allen-kh.cheng ha scritto:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This patch adds document for mediatek adsp mbox
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> ---
>   .../bindings/mailbox/mtk,adsp-mbox.yaml       | 52 +++++++++++++++++++
>   1 file changed, 52 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> new file mode 100644
> index 000000000000..a0149566ae56
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
> +      Physical address base for dsp mbox base registers.
> +
> +  interrupts:
> +    description:
> +      adsp mbox interrupt
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
> +    adsp_mailbox0:adsp_mailbox0@10816000 {

This should be:

adsp_mailbox0: mailbox@10816000 {

> +        compatible = "mediatek,mt8195-adsp-mbox";
> +        #mbox-cells = <0>;
> +        reg = <0x10816000 0x1000>;
> +        interrupts = <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH 0>;
> +    };
> 

Regards,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
