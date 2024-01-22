Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973B6C4725D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 03:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kE8ms7ryFZW9Ht/e6NRcvd7QnzuOU18cg/pk9kEcOj4=; b=Bi4VHHrmhQY9k0sOQTz31ZtSyr
	SFskImxWnGdk+d6QsrEt3DkSPw1zOLmTt7zA1t/jPB6xi7HvAKWR4XKiuWHmSy6BUSiFpLgYUrmpT
	lRAz0Gw9nz04qDXB8/mm3nKrR1vj9t2GAvygekFCxsPcz0w5UGirNrvv5wadJbmD9N6x1toktg/HB
	UkWKDmeHy571ukEnN020AsqqfFtO0YYiAStJoevgSYyFMvrcK/ilYxekUqXVc7h7BKk4xWZCGmckl
	tss7hbFOZIuJ/6yDjgf9uIqWHrXc6H9itA1QhqYrAQHMZ2rCWY8gErjLizS0965fYgwp19THZ0yTD
	nD6kuX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRlFh-00ATtO-0P;
	Mon, 22 Jan 2024 03:45:37 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRlFb-00ATse-0N
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jan 2024 03:45:35 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-4b9302191a2so403280e0c.1
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Jan 2024 19:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705895128; x=1706499928; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kE8ms7ryFZW9Ht/e6NRcvd7QnzuOU18cg/pk9kEcOj4=;
        b=eEXzURjrwXZBp+HWjx9MybBUqZUXE1EJw0ZO0oEfccPUTgbR/9jbEH5jS6pJAIxniY
         /RclIwqRR6LQzOcXBWYfJ40ZWmxG1zpKXMXedcNvRclz3y4XJFevVINgnYZfv7t8DGHY
         B/1Q5n+8RPG1vPZ4wshv8NyHd2gX72n+lMwuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705895128; x=1706499928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kE8ms7ryFZW9Ht/e6NRcvd7QnzuOU18cg/pk9kEcOj4=;
        b=OVLdq2qw+h3hZro3FaKYosZMVmQ0ZZ4Dwl00XnjxvqG5hf/+tfo14BdQWgwV/bv5ls
         mnRQRX9WmUOLEuIBnOROEgt6V18HIxtJETGfmT1/pgu7XwfKx1E50+9frK07F4DDIOHH
         /T2z6Mr8Wz2bd+bJxsuMTK1a2fgZgtCeWP+OZqkSfJgYko4kl8i2cIHfx6bVUEefjFqN
         jCpQs8S4NOEhx8XQarHzc1gwTClmExY2CpcAq0woaWEB2P5yC3we4VcifOVCwP2CTgB0
         UJ4gl56+vQbrO6eD+V516GY/5TDWn3zDGpQ1U76zbM4FIkrJcmCvn+JoJhxU9WZXw3wo
         Czug==
X-Gm-Message-State: AOJu0YyUrXAUSs6bH0Y3Mow90bNu2Q+zKTns4htLY4ckvJK3WICes5vd
	NhTj+PjbJ4CqidVBulHG8NtnvtV0hJULPSQ7Njui3MHNKrIKYjTVb3ZHwbDbRs3zxDxShcns5gP
	jgQ==
X-Google-Smtp-Source: AGHT+IFFCaiVfP9WTAQPf1JTt9yYyUQVHNNO3XISmWMV/LUcMkX51QsA40uSEzP4h3KBnpPGzCsZnA==
X-Received: by 2002:a05:6122:4581:b0:4b6:b43f:1b04 with SMTP id de1-20020a056122458100b004b6b43f1b04mr995716vkb.9.1705895128427;
        Sun, 21 Jan 2024 19:45:28 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id r26-20020a05612206ba00b004b89836a609sm1988793vkq.49.2024.01.21.19.45.26
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jan 2024 19:45:27 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4b978e5e240so471141e0c.0
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Jan 2024 19:45:26 -0800 (PST)
X-Received: by 2002:a05:6122:410b:b0:4b7:1658:e66b with SMTP id
 ce11-20020a056122410b00b004b71658e66bmr994565vkb.23.1705895125827; Sun, 21
 Jan 2024 19:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20240119063224.29671-1-jason-jh.lin@mediatek.com> <20240119063224.29671-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20240119063224.29671-2-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 22 Jan 2024 11:44:48 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng5v5-LSq6d-R-89N35qiKd7qa8FEo6qakWxrzibYvgSQ@mail.gmail.com>
Message-ID: <CAC=S1ng5v5-LSq6d-R-89N35qiKd7qa8FEo6qakWxrzibYvgSQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_194531_198370_7FB3CE59 
X-CRM114-Status: GOOD (  32.96  )
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

On Fri, Jan 19, 2024 at 2:32=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
Hi Jason,

Just few nitpicks about typo:
>
> Add mediatek,gce-props.yaml for common GCE properties that is used for
> both mailbox providers and consumers. We place the common property
> "mediatek,gce-events" in this binding currently.
>
> The property "mediatek,gce-events" is used for GCE event ID corresponding
> to a hardware event signal sent by the hardware or a sofware driver.
software

> If the mailbox providers or consumers want to manipulate the value of
> the event ID, they need to know the specific event ID.
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../bindings/mailbox/mediatek,gce-props.yaml  | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gc=
e-props.yaml
>
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-props=
.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
> new file mode 100644
> index 000000000000..68b519ff089f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mediatek,gce-props.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Global Command Engine Common Propertes
Properties

> +
> +maintainers:
> +  - Houlong Wei <houlong.wei@mediatek.com>
> +
> +description:
> +  The Global Command Engine (GCE) is an instruction based, multi-threade=
d,
> +  single-core command dispatcher for MediaTek hardware. The Command Queu=
e
> +  (CMDQ) mailbox driver is a driver for GCE, implemented using the Linux
> +  mailbox framework. It is used to receive messages from mailbox consume=
rs
> +  and configure GCE to execute the specified instruction set in the mess=
age.
> +  We use mediatek,gce-mailbox.yaml to define the properties for CMDQ mai=
lbox
> +  driver. A device driver that uses the CMDQ driver to configure its har=
dware
> +  registers is a mailbox consumer. The mailbox consumer can request a ma=
ilbox
> +  channel corresponding to a GCE hardware thread to send a message, spec=
ifying
> +  that the GCE thread to configure its hardware. The mailbox provider ca=
n also
> +  reserved a mailbox channel to configure GCE hardware register by the s=
pcific
s/reserved/reserve/
s/spcific/specific/

Regards,
Fei


> +  GCE thread. This binding defines the common GCE properties for both ma=
ilbox
> +  provider and consumers.
> +
> +properties:
> +  mediatek,gce-events:
> +    description:
> +      GCE has an event table in SRAM, consisting of 1024 event IDs (0~10=
23).
> +      Each event ID has a boolean event value with the default value 0.
> +      The property mediatek,gce-events is used to obtain the event IDs.
> +      Some gce-events are hardware-bound and cannot be changed by softwa=
re.
> +      For instance, in MT8195, when VDO0_MUTEX is stream done, VDO_MUTEX=
 will
> +      send an event signal to GCE, setting the value of event ID 597 to =
1.
> +      Similarly, in MT8188, the value of event ID 574 will be set to 1 w=
hen
> +      VOD0_MUTEX is stream done.
> +      On the other hand, some gce-events are not hardware-bound and can =
be
> +      changed by software. For example, in MT8188, we can set the value =
of
> +      event ID 855, which is not bound to any hardware, to 1 when the dr=
iver
> +      in the secure world completes a task. However, in MT8195, event ID=
 855
> +      is already bound to VDEC_LAT1, so we need to select another event =
ID to
> +      achieve the same purpose. This event ID can be any ID that is not =
bound
> +      to any hardware and is not yet used in any software driver.
> +      To determine if the event ID is bound to the hardware or used by a
> +      software driver, refer to the GCE header
> +      include/dt-bindings/gce/<chip>-gce.h of each chip.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 1024
> +
> +additionalProperties: true
> --
> 2.18.0
>
>

