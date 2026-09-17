Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96840C982D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2026 20:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqvBEQTON5xtkHghCnEfWwyRNsnxm/fGPw0hb20/kI4=; b=KOX3qdmP3rluy8irfmXzCmJ1r7
	I7PJc0rfZhxySHfNZ8X+4pq+ECpH+1lWk/eNllwhjYFWfVgdsD+ncrMWdNdDb/tpcfJ42kd7Rwe4r
	+HBd5sUDz0nDZ4h3hxxvb4jhYHroVRfQ3V49Ie8nn2x5rqe5mt4qXsLBqshDpGYEeniGwc7mgDuuI
	IfLRrTLDSwYev3g/aXYIfIrQmFyOM5Z5AUzIeRlnu56bCRTYq1FcKzpmsWlE6za7CKg6nzzwtsrUi
	0yo3NqqwztUV9QoROjaOOCK+Ow9NB9BCGHW7CZ5zOkJrKmC1c5E5HKzSbTrucT3FcpTqSlUXhKrxa
	wgSpj7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J3R-0000000CUM7-2lc6;
	Thu, 17 Sep 2026 20:50:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J3M-0000000CUIr-35XU;
	Thu, 17 Sep 2026 20:49:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AB2F0400BB;
	Thu, 17 Sep 2026 20:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374B61F00898;
	Thu, 17 Sep 2026 20:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789678194;
	bh=HqvBEQTON5xtkHghCnEfWwyRNsnxm/fGPw0hb20/kI4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WLhJTx9sI/xQFHKvvig+awtO0wfNIVZmn5vc0XMZEIFzuUEES2McLvlvL2cDzGZiz
	 6NBuNaIuvwJTWKjCnie9r6TXiPyd67Mrp34QsWEGhabUC5/3+pfYO92WizwdSEq02k
	 ophojyls7KdahDOQnZyRoMVKnsFHZBgxs7wRigWJvVB/++U2eIjXwyVre61YkqhY/h
	 vKALh54tanAZS6WAEhvUJshqeuYqqJWX6gXQOC1KQMLoNK19is8tvvAhYyE6TbI5PX
	 xE/RwAj3yRLpRNn01EFD8bqypZ0fGMsINVnu8DRFBGwJR46pjxJEo+CY6iJTQF/IYN
	 yg52CeOJ5cRzw==
Subject: Re: [PATCH v2 net-next 2/7] dt-bindings: net: dsa: mediatek,mt7530:
 add passthrough mode
From: netdev-bot+sashiko@kernel.org
To: cjd@cjdns.fr
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 chester.a.unal@arinc9.com, daniel@makrotopia.org, linux@armlinux.org.uk,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
Date: Thu, 17 Sep 2026 20:49:52 +0000
Message-ID: <178967819278.22033.11186084049097912254@kernel.org>
In-Reply-To: <20260915174643.253660-3-cjd@cjdns.fr>
References: <20260915174643.253660-3-cjd@cjdns.fr>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 2

- [Low] The added `description` paragraph in
  Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml (lines…
- [Low] Concern (retained for policy combination, assessed as a false
  positive): the binding advertises a passthrough mode that…

--

dt-bindings: net: dsa: mediatek,mt7530: add passthrough mode

This adds a paragraph to the mediatek,mt7530 binding description explaining
that MT7530/MT7531 switches can be operated in a "passthrough" mode where
traffic moves unconditionally between the CPU port and a DSA link port to a
second switch. The paragraph also states that in this mode the upstream
switch may have no other ports or switch configuration.

> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 90b3582b76190..e29fb86934981 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -73,6 +73,13 @@ description: |
>  
>        Check out example 7.
>  
> +  The MT7530 and MT7531 switches are capable of being operated in "passthrough"
> +  mode. In this mode, traffic is unconditionally passed between the CPU port
> +  and the DSA port which links to a second switch. To use passthrough mode, the
> +  upstream switch is configured with a DSA link to the downstream switch. In
> +  passthrough mode the upstream switch is restricted, with no other ports or
> +  switch configuration allowed.
> +

[Severity: Low]
The last sentence states a hard device tree constraint, but it only exists
as prose.  Should this restriction also be expressed in the
machine-checkable part of the schema?

As it stands there is no new property, no if/then under allOf, and no $defs
entry that limits the port set when a port carries a link phandle.  The port
container in this same file is permissive:

  patternProperties:
    "^(ethernet-)?ports$":
      type: object
      additionalProperties: true

      patternProperties:
        "^(ethernet-)?port@[0-6]$":
          type: object
          additionalProperties: true

so a device tree describing an upstream MT7530/MT7531 with a CPU port, a DSA
link port and extra user ports, plus gpio-controller/interrupt-controller,
still passes dt_binding_check.  The layout is instead rejected at probe time
by mt753x_check_passthrough() in drivers/net/dsa/mt7530.c, added by the
following patch in the series:

	if (passthrough_ports > 2 ||
	    (passthrough_ports == 2 && enabled_ports != 2)
	) {
		dev_err(dev, "Only two ports allowed in passthrough mode\n");
		return -EINVAL;

Two smaller points on the same paragraph:

Every other topology description in this description block ends with a
pointer to a validated example ("Check out example 7." just above).  Could
this one gain an example too, so the passthrough layout is actually exercised
by dt_binding_check?

The per-port reg description further down still reads:

          reg:
            description:
              Port address described must be 5 or 6 for CPU port and from 0 to 5
              for user ports.

which never mentions the DSA link port this new mode depends on.  The later
patch in the series constrains that link port to reg = 6 via the
mt7530-passthrough-dsa-port $def, which does not match the text above.
Should the reg description be updated at the same time?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260915174643.253660-1-cjd%40cjdns.fr

