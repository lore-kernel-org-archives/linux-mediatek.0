Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17879606A327
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jx2J29eL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I7cdb4vd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CuV1HgSyHeqmHnQ6X0W8EKjH6rdyvaViJZVeUHENJ3o=; b=jx2J29eL5EfXNF0i/8kBS1RcN9
	Om7C9GzBiCfehzQQz8H15/qySjAl6Bq8TOQA3G1LJNnq6/PT/So2e6BMSIF5NXTimc/Qo/OP50qg6
	XM3D+eoKEm/AheYQ3k0WpMqe8IG3/ir/vAN1ZaGApfrv9hmXPRtc9mh/XiQ8M/YT8gxT4f7xQ80aS
	pZsNfBksWt3/IjnxEbTkwokYxZl+1x6KfWilVRE5QhWSEhCwhK19DIW9DdMZcYBBppUy96wBOfXeY
	0tWbD8algiEsC5Vb8VK2Td+40numePibMenIuYmOQ/0D6v9aVFosQD9RAFuS6vobQbLCLl6ApOl/w
	GR6R8SZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWe5-000000049Ux-3JHi;
	Mon, 23 Nov 2026 16:11:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWe3-000000049UG-3266;
	Mon, 23 Nov 2026 16:11:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D7E743213;
	Mon, 23 Nov 2026 16:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A5E1F000C0;
	Mon, 23 Nov 2026 16:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795450315;
	bh=CuV1HgSyHeqmHnQ6X0W8EKjH6rdyvaViJZVeUHENJ3o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=I7cdb4vdNUK3v3piY+BZlJjEe9R4MEyMtBgnxanHlmElStgvqGfQY7m05L2McBrOR
	 VP+sk9kRQ+s6g7KtRfwY1IGa/cRy5HXcbrKutTfHWiHSdpSGmhzT2snp63v0kVxoPP
	 D61kJ8ra9i6aLDn7pdM82YRC39mtoLm+pEdt28w6iLFn2sYZknfRXOwISv/FM3j447
	 d8OreZirnkqEWu7JNN9y41OAQcEAUcPYoV2mGz3YuP8hvByYVXaDF5jhMXpDRAwBDK
	 98UKa8QcdVSbM0GLaB87W8AMcxgfQMC03x9D4Rc++I920eQzGHmX5MGcXkTqRzy2mZ
	 WIcA6ugK5QGbA==
Subject: Re: [PATCH net-next 2/2] dt-bindings: net: dsa: Flag unexpected
 ethernet ports
From: netdev-bot+sashiko@kernel.org
To: krzysztof.kozlowski@oss.qualcomm.com
Cc: hauke@hauke-m.de, andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, woojung.huh@microchip.com,
 UNGLinuxDriver@microchip.com, jensemil.schulzostergaard@microchip.com,
 ansuelsmth@gmail.com, arinc.unal@arinc9.com, Landen.Chao@mediatek.com,
 dqfext@gmail.com, sean.wang@mediatek.com, daniel@makrotopia.org,
 marex@denx.de, john@phrozen.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Mon, 23 Nov 2026 16:11:53 +0000
Message-ID: <179545031306.3135.11482802242328622537@kernel.org>
In-Reply-To: <20261122160907.200727-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261122160907.200727-4-krzysztof.kozlowski@oss.qualcomm.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete because it skips a sibling DSA binding
  that has the exact defect described in the commit message.

--

dt-bindings: net: dsa: Flag unexpected ethernet ports

Several DSA bindings reference dsa.yaml ports, use "additionalProperties:
true", and limit their port node pattern to a subset of unit addresses.
Because of that, port nodes with any other unit address pass validation
without a warning. The patch drops the unit address from the pattern and
limits the port reg value with a maximum instead.

[ ... ]

> diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> index 167398ab253aa..3840b336bdb93 100644
> --- a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> @@ -75,13 +75,15 @@ patternProperties:
>      type: object
>      additionalProperties: true
>      patternProperties:
> -      "^(ethernet-)?port@[0-6]$":
> +      "^(ethernet-)?port@":
>          type: object
>          description: Ethernet switch ports
>  
>          $ref: dsa-port.yaml#
>  
>          properties:
> +          reg:
> +            maximum: 6

[Severity: High]
Was renesas,rzn1-a5psw.yaml left out of this conversion on purpose? It
looks like it has the same problem the commit message describes. It
references dsa.yaml ports, its ethernet-ports node uses
additionalProperties: true, and its port pattern still limits the unit
address:

Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml:

allOf:
  - $ref: dsa.yaml#/$defs/ethernet-ports
...
  ethernet-ports:
    type: object
    additionalProperties: true
    patternProperties:
      "^(ethernet-)?port@[0-4]$":

Under a renesas,rzn1-a5psw switch, a node such as port@5 or port@7 does
not match this pattern. It does match the generic
"^(ethernet-)?port@[0-9a-f]+$" pattern in dsa.yaml, so only the generic
dsa-port.yaml checks apply and it passes validation. This hardware only
has ports 0-4 (4 ports plus 1 CPU port).

Would the same change used here for qca8k.yaml work for that file too,
i.e. "^(ethernet-)?port@" plus reg: maximum: 4?

nxp,netc-switch.yaml has a weaker form of the same gap:

  ethernet-ports:
    type: object
    patternProperties:
      "^ethernet-port@[0-9a-f]$":
        type: object
        $ref: dsa-port.yaml#

A node named port@1 (no ethernet- prefix) or ethernet-port@10 does not
match this pattern. Instead it matches the
'^(ethernet-)?port@[0-9a-f]+$' pattern in ethernet-switch.yaml, which is
reached through $ref: dsa.yaml# and only applies type: object.

Such a node skips the NETC port schema, including dsa-port.yaml and its
unevaluatedProperties: false, and passes without a warning.

Should this patch cover nxp,netc-switch.yaml as well?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122160907.200727-3-krzysztof.kozlowski%40oss.qualcomm.com

