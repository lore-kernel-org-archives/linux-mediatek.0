Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF187CA0EED
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GPy/kVr5xy7hBpohKijiQplg8+R4/OMAuZ4Oz2BeiQ=; b=2yQHbQfv1Zso5VyPFFk/W86a5c
	ThtkcBlrudD8CItrDpYrm/xf/khW69LT2fTjw0hDiaK0jFGqtYPZG3vS8jHxO7KQVN9rxy4kANuKM
	rHpHMqeydMcLGYLUr9ndd+tOkRJpC5gdyUpdjJnJH1RRZdOhrqO5c3Ea3OOMcFiEhK6uR954ZeYxm
	ABfrmCvuuodB6f61ZTVoOQKOXZXLqxrNQuft5/ImaqYSxgIr6wxph1J0kzalf3IHE7VrnxiIPxzKT
	Tvf0ot0R90BI19tI/wBlVZIeOY1024nYr6UQn+rWAOsZDqDnXtvWhfI738oTfApmkclhsbOpkta4e
	pmwRgCOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSam-00000002kBx-1uMT;
	Fri, 22 Aug 2025 14:18:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKYr-00000001c7U-1vff
	for linux-mediatek@bombadil.infradead.org;
	Fri, 22 Aug 2025 05:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+GPy/kVr5xy7hBpohKijiQplg8+R4/OMAuZ4Oz2BeiQ=; b=OhRQ+6OAETip8i/FuESjFk4sq9
	yhs2dpc2gLGj+m/8nSfZ7IL/gtibASckiKoFAXpUC8SMPVvBO0SuTFCvzZRbwFsyGqZkzIYqRZGx/
	eWQphE9kWdDJ7rH4KrJ3CY2/lD8scZPlIvGFv6seaQPtYg91NSEEk6ZX/9Z9VkjCpWl7rvEqITldt
	1MxbykC0ej1ZnNF0trsV4aScHpjcyz2tsKF4ejpLL6uomT1JkCNSDOvz9GNqs+XdhtTRZ7Su6zMiH
	40M2R3AufRDRhoCkOLeQ1mKz0DZHEC26e3DWmjsX/+JyrF04/ru1RX2Ag4017CtxaUXKoRUH6J7Xf
	M8AiKOgw==;
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKYm-00000000qcE-3ncX
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Aug 2025 05:43:36 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55ce509127bso1550988e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Aug 2025 22:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755841410; x=1756446210; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GPy/kVr5xy7hBpohKijiQplg8+R4/OMAuZ4Oz2BeiQ=;
        b=BoGKoTPA6/JVhCJHgSotHeEf5tujl+r2bxEfAQYQVgfGdUXB9QzDz0Wxlqx6khGMkd
         jUk93xwjU2HDp4GEP0C0Q7v+zORIpawuMwt5hmf32ycU7JHHEqF7Aet3zbAVIlQlxueV
         Ev0CGGotjWm0Gl0CSe/0dDq+15ve8YQSTOmak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755841410; x=1756446210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GPy/kVr5xy7hBpohKijiQplg8+R4/OMAuZ4Oz2BeiQ=;
        b=OWbEL7ZnCehd4vNIO7N7fKMEj4ty2Bk+bP5KyWw5DrcPnxcxs21AMwY/vT6BBlezyr
         V/j1GcL1+OWt3z4An3iBlIgYDJAexXGEpmTT4Oka5BQE3AuhVNRZdUpCxw5UsE2qmSvx
         2JhKT3Khmui3ZxumNT7rSwz+p+s2nY6mMHzV97KCcpzHlXBYMta69guRzaJkH90npjTQ
         QEI5EqPkMu83k3XMozlb8X4kMkpFfuzyMxs8oihfQmT5QdtcNqzG4np5KP0fRLQuCjw0
         qPO11ynAg6pAlwlUdSoVr1iZbyEG3lZ0paKdUqPGmyQneHR7N97TY/QaUidtYQVNPSnV
         Lfsw==
X-Forwarded-Encrypted: i=1; AJvYcCWGA64p4nkxosWie7kR7ouAD6WeS5EZXPVIH5w+Ol6iKUsy1qBFZn92tYGvOvnSArEsYdXmNcSsWr8w7fYHdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuVonSUQWwaftwElzkZ9jBQypKxPgQzs6PlmzDxVnXlr8xuUsR
	9ZJoPRzPzqusTOgt8O+BfMKIZt/EUOt5Bj+XdMRplaLfr6/iv61Y0laZf5mYeWlyYDU1QMEvf3A
	NKD5uiQkp1BGOLlcSv1g23CmDBVpB6mtk+HTuj18b
X-Gm-Gg: ASbGnctGUuhFQLHKRH/rD9EyHFLMz7pdleTxE/BiTWnVFxB3BZ/BjYxi/kqa7OSkfk0
	sUuGRj118+9x3ckNn4YSCs86jzfuXWW9URqSkhuaOpZG3Qr6QAjMo+CeSR9cnkekZTChfk8dUQO
	wDZdsPOZ3u/Xf8nrDd9L2LsA2xpKJt+taK6XJk/Pg4z7qlXPDIgV+hjx+z9INun/DlhOG5/2tbD
	JxeLaCZT/KmShpUkAc3ypD0PaKpVnjPDjMa1yCipBoa6g==
X-Google-Smtp-Source: AGHT+IFh5F3sidBrknoS9iUxLce5fNJWzSFlFRbwYLI9hnCBtdEdWgKvCBxO6tc3R2KJHkeILhOZP6kccNtfJIF4ra4=
X-Received: by 2002:a05:6512:2399:b0:55b:7683:110e with SMTP id
 2adb3069b0e04-55f0d38200cmr562995e87.46.1755841410309; Thu, 21 Aug 2025
 22:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250822021217.1598-1-jjian.zhou@mediatek.com> <20250822021217.1598-2-jjian.zhou@mediatek.com>
In-Reply-To: <20250822021217.1598-2-jjian.zhou@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 22 Aug 2025 13:43:18 +0800
X-Gm-Features: Ac12FXzfrL5PN_m3940D8QUKJ9xD917EzZ80ftFHhvgwSSGeG17u4a187tR07YY
Message-ID: <CAGXv+5GaJdWPFigVs-XyDZms_0Yvo+58p7N5e+-jwnyAhsO7bQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: mediatek,mt8196-vcp-mbox:
 add mtk vcp-mbox document
To: Jjian Zhou <jjian.zhou@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_064333_107607_9CAC318A 
X-CRM114-Status: GOOD (  15.65  )
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

On Fri, Aug 22, 2025 at 10:12=E2=80=AFAM Jjian Zhou <jjian.zhou@mediatek.co=
m> wrote:
>
> The MTK VCP mailbox enables the SoC to communicate with the VCP by passin=
g
> messages through 64 32-bit wide registers. It has 32 interrupt vectors in
> either direction for signalling purposes.
>
> This adds a binding for Mediatek VCP mailbox.
>
> Signed-off-by: Jjian Zhou <jjian.zhou@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  .../mailbox/mediatek,mt8196-vcp-mbox.yaml     | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,mt=
8196-vcp-mbox.yaml
>
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vc=
p-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp=
-mbox.yaml
> new file mode 100644
> index 000000000000..7b1c5165e64e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.=
yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mediatek,mt8196-vcp-mbox.yaml=
#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Video Companion Processor (VCP) mailbox
> +
> +maintainers:
> +  - Jjian Zhou <Jjian.Zhou@mediatek.com>
> +
> +description:
> +  The MTK VCP mailbox enables the SoC to communicate with the VCP by pas=
sing
> +  messages through 64 32-bit wide registers. It has 32 interrupt vectors=
 in
> +  either direction for signalling purposes.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8196-vcp-mbox
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#mbox-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    mailbox@31b80000 {
> +        compatible =3D "mediatek,mt8196-vcp-mbox";
> +        reg =3D <0x31b80000 0x1000>;
> +        interrupts =3D <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #mbox-cells =3D <0>;
> +    };
> --
> 2.46.0
>

