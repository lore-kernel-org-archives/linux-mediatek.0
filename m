Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B585CCFA74C
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 08:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oxZyp3eZ8k8zuivapL9rT1F6bBI1eaH4lwdCzl24o8=; b=kUfGPJNAexphKLJDylFWWkX1wh
	5FHnRoufpxWCO5ecMnSfEFQYmIWh/k6ZbchZQSI6E3fDozgBGlCyGL6JSejSe4n1jawtUy9wiy39I
	kqVPzUOQZoIKcOb2zmhHLGlWPrvj5ckCtlCquRDlk3ijtE+iaWIjYA68M+vtytrarA21QD2LsIjV2
	bciwQRntEc60oPZ6q5NkYXNN4DM+hM2H4hHrmAk+CMCckKRQcWQYKq/HeyiZGoYL2Pawdf58V7CQZ
	cQ/eQOE1kUCjCB6VC/8LF2nbNkmUBUSS5RxjFDLGruQOrYTwsLCpsPkkc3WmAnzHs6PdDJKw3s33h
	fWp+XDcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdgT-0000000BPip-3EnB;
	Fri, 04 Oct 2024 08:29:09 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdcJ-0000000BOhA-0eZb
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Oct 2024 08:24:52 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-4a3c6bc4cecso506157137.0
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Oct 2024 01:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728030289; x=1728635089; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oxZyp3eZ8k8zuivapL9rT1F6bBI1eaH4lwdCzl24o8=;
        b=mJAf0x7Z7ckBd6kHD8xuO7EElnR3FpXnG1GIZescy4yJ5dqBTcgMac0iGz+Zoh9MRq
         /vSOq4AiQqjuF2YTWY+BQS0pujF3hL7uYq8qiGI0zUSUq5EoAytTEVsfCzzcpOEa5O1U
         YAe8lLw0S9OWdzQ+LriwY5KBkAa4W9cuX6juk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728030289; x=1728635089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oxZyp3eZ8k8zuivapL9rT1F6bBI1eaH4lwdCzl24o8=;
        b=RQryNwsYe8OANNDqXdpKqNa7sUMAKsaKFKb+wAwUZCu697jnCDG0a1fnkgUo9+Qrp3
         NfOo1OT1M/HljQTgl8LgzxBFCmvqCm6AXF7qssiQAukjrcJg8qUQ8FP5vp/0NjTJlfrp
         EdOqm2aWTdoJkqxowwLIZOZkMo24ASBDvAvwgAV6dji89eFERyB7Vrpye7+nm0XNv+PO
         JwDTIbJQdT49JGx6yzQBO0fTsQMEsS9bbgRLQXIGF+awSqwpBazVjgNWzg0KLxbWx6p4
         VSBs91hDbZNi/2+SBInyiLJ2JIBLvStel67svoHfT7wVx3uxKrsGIupjWZYXj16vaxoR
         4Lhw==
X-Forwarded-Encrypted: i=1; AJvYcCVZzhev405kPdcI/9f6K3KQoroFWk9X9R6kInJSf7J3G8dK03L4GuRB2tPVrWfq3L0JE3tMokIyTFqxQRaSLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YywxhgE7T3CON2cd9a81hC+2cE3OUBdh/whvgey6vaItflhFQ07
	1rDiUp/BbAYo3vkvODr6UVFEIZzJkzSo1JV1LMTlxhWeFqI+IkTAtv0d/KILPeAWKkitGHWQcPm
	aNA==
X-Google-Smtp-Source: AGHT+IEnRbT21qoPjbx/QwUv5sgCEOvjV4CFF5/XAFtQhMdpihbYYG1KB1IN1c/+IXf8Agt5qqzpdw==
X-Received: by 2002:a05:6102:26ce:b0:498:f38a:2c80 with SMTP id ada2fe7eead31-4a40575a173mr1151158137.10.1728030289458;
        Fri, 04 Oct 2024 01:24:49 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-84f3ae2fa29sm364578241.11.2024.10.04.01.24.48
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 01:24:48 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-50923780607so524021e0c.1
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Oct 2024 01:24:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURGRhW1uEZ9D+2jD4NiJopxkAiGNUC+4VzIV1+R43Mvz1AUNG5dLzlM8e69CASDQcyF0MdNQ8XEX6s6CqMkg==@lists.infradead.org
X-Received: by 2002:a05:6122:78d:b0:50a:c19b:e712 with SMTP id
 71dfb90a1353d-50c855597a5mr1192054e0c.8.1728030287686; Fri, 04 Oct 2024
 01:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20241004074938.6571-1-macpaul.lin@mediatek.com>
In-Reply-To: <20241004074938.6571-1-macpaul.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 4 Oct 2024 16:24:10 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhW7ervk-b31mxtx_c-KUeLuC0P_Yr=9jtumUXAm6AZ_A@mail.gmail.com>
Message-ID: <CAC=S1nhW7ervk-b31mxtx_c-KUeLuC0P_Yr=9jtumUXAm6AZ_A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: mediatek: Refine multiple level power
 domain nodes
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>, 
	Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
	Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, 
	Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_012451_218097_B740C791 
X-CRM114-Status: GOOD (  13.87  )
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

On Fri, Oct 4, 2024 at 3:53=E2=80=AFPM Macpaul Lin <macpaul.lin@mediatek.co=
m> wrote:
>
> Extract duplicated properties and support more levels of power
> domain nodes.
>
> This change fix following error when do dtbs_check,
>   mt8390-genio-700-evk.dtb:
>     power-controller: power-domain@15:power-domain@16:power-domain@29:pow=
er-domain@30:
>     Unevaluated properties are not allowed ('power-domain@31', 'power-dom=
ain@32'
>     were unexpected)
>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../devicetree/bindings/power/mediatek,power-controller.yaml  | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-contr=
oller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-control=
ler.yaml
> index 8985e2df8a56..a7df4041b745 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.y=
aml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.y=
aml
> @@ -54,6 +54,10 @@ patternProperties:
>              patternProperties:
>                "^power-domain@[0-9a-f]+$":
>                  $ref: "#/$defs/power-domain-node"
> +                patternProperties:
> +                  "^power-domain@[0-9a-f]+$":
> +                    $ref: "#/$defs/power-domain-node"
> +                    unevaluatedProperties: false
>                  unevaluatedProperties: false
>              unevaluatedProperties: false
>          unevaluatedProperties: false

For reference, I sent the exact same patch and it's been acked:
https://lore.kernel.org/all/20241001113052.3124869-2-fshao@chromium.org/

Regards,
Fei

