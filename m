Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15693CD98C7
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 04:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10pdjtqw1/JtUy9GKEnuwFPnC7XgoLYsseAIedRShWU=; b=Iqa9RUpIVmEFljqf3lond7RCeO
	UzMnm3AUG1GNy5bKJdLzAG3ENdpPsRseAVh/cwLZMvJwpcdABqW1SBc2JwAnfJz5UIZI3vGbqNvfI
	QUEGtwAU+VdrHlW0eKJQjxpgFow6vE3Jf92IepLqaa/RzcNcEFO2/ofm1zBbk8R09vveWY1SB8gPs
	dWjvgEscNTcOSsq2h+k3NUvr4iGXSMpWRBcrrXB7eHaJyuCf6LntVCQYRYGODFaxzGEDqd7vkrb5y
	V78DJnlYYghp3EMor5hSGZeU3aKgGhzuhB2eVrXONRnsDo8dvpQkUsnbdUvVNodIs/ZYcsH6b8gyO
	70RuVuCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYcIv-0000000CjDh-3CmE;
	Sun, 14 Jun 2026 04:18:37 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYcIs-0000000CjCs-3l7u
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 04:18:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c0c2d792c8so14102435ad.1
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 21:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781410714; x=1782015514; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=10pdjtqw1/JtUy9GKEnuwFPnC7XgoLYsseAIedRShWU=;
        b=RtX+oO2AiOHHVSX3BIC1DcHAMR/jii/wWIeJdiLrdrUftVFjG0166L6lxaFJo5yrkt
         J3zFp+y5T0IXtafyEDrTZJ0b7elxvB2aQT/pudcIWZY/YtRkk1hErdmZzU5VtYbbz/cS
         F6o28J7AjNl8jsrwuh4YLV+MTjpU+SamnYvOU/rtf2qyTi2UNCniLflUfUsWNg54W/pl
         cbd6TV9cNQtMs5Xqeln2QZlawcWm0qmesOJrEyVyLu+ApueC8+R78tB8jH+GqFvWb+44
         kLD17Cso7YVrXkeb7FwzBg0aVKEI/acRSRTikjlVckpEFpHqR873U5CaKfqNxpYSno3y
         BAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781410714; x=1782015514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10pdjtqw1/JtUy9GKEnuwFPnC7XgoLYsseAIedRShWU=;
        b=Y2wmR0DJzU1ewDCobl0/U6iDn/m3HjNXhE4uQCtmPHlRtT5gIWZOUsmGE0AS6s/Wdp
         KhCBHGqyinYWsbOfNbpIULZspPYsCeBHCC2KvGlykTNQ7aTEgJOA4AXihxs6ue3pn+vQ
         +XjkCaqLe7aUdWMN0z8nbtmftoKjaC6cVK8vV9y+3t7+qQ5ZERkvclxsiXJlInfzkovj
         IiIFUHeuVxtpDVfbK2oFg2CCdcbjxlSaXpUkTxLXa2jtwBtHkHs4BF2xT5zU8Lw4gqsi
         qjPW2Z9eAEWJBkGqb35WI2cm+pMfkaBTHtr2Im0KiYB4tqGBRm87M81T6JZ/2D56VI6y
         /tFA==
X-Forwarded-Encrypted: i=1; AFNElJ/bTyacgTTnhN6xIsSEggAwqg1PaJ/wVXkTfJv5X35cMvBH88JMFhCZQQf8lCrcxg9VlrL3hL5v7SSFyYdPXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxly91EIyspac83ObdmxfVfRPFAvb+N+cCXsNH5PSpQ1m9i23Sa
	KF2j26CtW0VJj08+Slwp0rCwXnZ4Bpzg7IRYrljRC1aBAU6NXtomGSqi
X-Gm-Gg: Acq92OGaN14mcCB99+VyZg2oALzYyeu7JTs1kqRBvEQq4hzqaQQLTh5VNe9nNjsBX4b
	tfYr7Fag0fWKRoztnl0lbFB+MvwKA8ywTB+joLTB949sEmtcJjOgOqefBpwUtxVww39Loeiutf4
	noTLP+ZoSqipGkfFi5Kzvt9aHw+VCgC0QVy8GHnMaWo7pm61rNKQWojnZjbNZqG8SHoZKKWP0eU
	U2AZQWZ2aij7rEChHH5K/djV1ogaWkoGhWYYhkusyEpvNF52mZdhJVvGK/lb5lBJuLcIQwxA+/b
	t4PkvxniB1yuFRpp8ouqKl6dCS64KzwB3Be0TpL51Y5j2n0TzChekgUsOeKDQ3GLsGOYMth1I3z
	5UQO2hOG18JJG4ux+ZTH3KCmnqBvINCjJZ/g9/7GqXvIuIX5mzayMBSzA3NNHsfwhT/1XJ3cdX0
	Quibl8LQgYAX2dJodgk4QUXCk7RhHA19q7tdm5rnQ=
X-Received: by 2002:a17:903:1b47:b0:2c0:3400:5c34 with SMTP id d9443c01a7336-2c4111b5cbemr97182875ad.3.1781410713730;
        Sat, 13 Jun 2026 21:18:33 -0700 (PDT)
Received: from [192.168.89.2] ([115.4.79.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac79fsm57407845ad.45.2026.06.13.21.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 21:18:33 -0700 (PDT)
Message-ID: <f34dfb84-3aaf-4094-ada7-b19e3449cdda@gmail.com>
Date: Sun, 14 Jun 2026 13:18:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next 0/7] net: airoha: add EN7581 SOE ESP packet
 offload
To: netdev@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Christian Marangi <ansuelsmth@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 linux-kernel@vger.kernel.org
References: <20260614040032.1567994-1-hurryman2212@gmail.com>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <20260614040032.1567994-1-hurryman2212@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_211834_971934_B0AC23FF 
X-CRM114-Status: GOOD (  20.52  )
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



On 6/14/26 13:00, Jihong Min wrote:
> Add Secure Offload Engine (SOE) support for the Airoha EN7581 Ethernet
> driver. SOE provides inline ESP packet offload for native ESP and NAT-T
> traffic, with the Ethernet/QDMA path used to submit packets to the SOE
> block and the PPE path used to bind eligible ESP flows. NETIF_F_GSO_ESP
> and NETIF_F_HW_ESP_TX_CSUM are intentionally left out for now and will be
> revisited separately for feasibility.
> 
> This is posted as RFC because the code was originally developed and tested
> against an OpenWrt 6.18 Airoha tree, not against the current upstream
> net-next driver. The original OpenWrt commit used as the source for this
> RFC is available at:
> https://github.com/hurryman2212/OpenW1700k-test/commit/7c1b5e662f7790b3d23ed143beadc1dcbf6d15f7
> 
> The SOE part is intentionally linked into the airoha Ethernet module
> instead of being exposed as an independent crypto or platform driver. The
> user-visible ESP offload control is a netdev capability: xfrmdev_ops and
> NETIF_F_HW_ESP live on the target netdev, and the feature can be controlled
> through the usual netdev feature path. SOE also shares the FE/QDMA/PPE
> datapath, private queues, DSA conduit handling and netdev lifetime owned by
> airoha_eth.
> 
> Patch 1 adds xdo_dev_packet_xmit() because the existing XFRM packet
> offload transmit path does not provide a hook for hardware whose ESP engine
> is reached through device-specific packet forwarding. SOE needs to consume
> the skb, add a hardware hop descriptor, steer it to a private QDMA path and
> return the final transmit status. Drivers that do not implement the
> optional callback keep the existing XFRM output behavior.
> 
> Jihong Min (7):
>   xfrm: allow packet offload drivers to own transmit
>   dt-bindings: net: airoha: add EN7581 SOE
>   arm64: dts: airoha: add EN7581 SOE node
>   net: airoha: add SOE registers and driver state
>   net: airoha: add QDMA support for SOE packets
>   net: airoha: add PPE support for SOE flows
>   net: airoha: add SOE XFRM packet offload support
> 
>  .../bindings/net/airoha,en7581-soe.yaml       |   48 +
>  MAINTAINERS                                   |    1 +
>  arch/arm64/boot/dts/airoha/en7581.dtsi        |    6 +
>  drivers/net/ethernet/airoha/Kconfig           |   13 +
>  drivers/net/ethernet/airoha/Makefile          |    1 +
>  drivers/net/ethernet/airoha/airoha_eth.c      |  668 +++++-
>  drivers/net/ethernet/airoha/airoha_eth.h      |   40 +
>  drivers/net/ethernet/airoha/airoha_ppe.c      |  606 +++++-
>  drivers/net/ethernet/airoha/airoha_regs.h     |   16 +
>  drivers/net/ethernet/airoha/airoha_soe.c      | 1896 +++++++++++++++++
>  drivers/net/ethernet/airoha/airoha_soe.h      |  126 ++
>  include/linux/netdevice.h                     |    8 +
>  include/linux/soc/airoha/airoha_offload.h     |    5 +
>  net/xfrm/xfrm_output.c                        |   11 +
>  14 files changed, 3342 insertions(+), 103 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/airoha,en7581-soe.yaml
>  create mode 100644 drivers/net/ethernet/airoha/airoha_soe.c
>  create mode 100644 drivers/net/ethernet/airoha/airoha_soe.h
> 

I noticed, after posting this RFC, that I forgot to include the
following trailer while preparing the latest patch series:

Assisted-by: Codex:gpt-5.5

These patches were written and tested with AI assistance, although I've
reviewed the resulting code and test results. I'll include the trailer
properly in future revisions or submissions. Sorry.


Sincerely,
Jihong Min

