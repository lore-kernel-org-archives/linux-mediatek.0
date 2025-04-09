Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9ED0C369A2
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Apr 2025 23:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKOMm9lLgvb/F18kqPd+NqbO3iD1QOhWvXonfY0dLd0=; b=NaEz46fJ1AirMcI4yre+2oF8uE
	JJN/XEOBE/0xP969VPLMHHzKf3+woE6ha+08NacrDJQlG+365vnslV3nDKETreH4jw+sM1Cbbopet
	7S53Z0sewNjDmUF14v0iJX4HiPd6rBwaz+er814jEgWD9czo3VZOylm2qstApAleZaxXSCcTz993V
	kUhEto/wa1uq97qpjZntaVfHh8Qwp2YbERX51s7NN4VDTpQw6mMdq2/WFQ/qtlpDGsW3PxvkmGj/h
	Vcc4w9EUXQGiFohWBvPCQ3NUBO9dWf/mn2UXZwQR0CY0DW/w0KWh22Cb65OSX4BJK+BRVLOlM5PdJ
	14lrjOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2f0z-00000008mW3-2cB7;
	Wed, 09 Apr 2025 23:39:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ezD-00000008mS0-12Oy;
	Wed, 09 Apr 2025 23:37:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CE7E761127;
	Wed,  9 Apr 2025 23:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157BBC4CEE2;
	Wed,  9 Apr 2025 23:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744241858;
	bh=fn3kK6il9AD7bbyhGbo7s4pLFMPkWIgx39JLPgek8Gw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lMHIfp9N9b4AU82PF84cXzGFVf0BQn2dXv8FXhAnXKy5a0Qohkexq7ua9cJJQaN+R
	 qkpnhLZs0cT37kuiyh07Zyti4dkbvQKSDPTkJsWKEd+l6W8ygLXbKqxtbL7r3PubfA
	 sACc7DcndTkjnFvyb/5fy6HFSRx0JKB/ZyBTwWbhSmNvkt+PZn1L3+7IBgDXLkTbL/
	 4I0SZhBwBo1iJpDVtNvI7oU2cfj4UmsmypODzhPCwZ6IC/OtGvGi2R0+Z7ST9UJQyr
	 R2QYvEEf60muOa7hVqZ54LGG33k7QQ3aA+kyVuyAQmhNDu0tG2yCCRRbsPUqplPi2N
	 VIoMKhSHZQLSg==
Date: Wed, 9 Apr 2025 16:37:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, Davide Caratti
 <dcaratti@redhat.com>
Subject: Re: [PATCH net-next v2] net: airoha: Add matchall filter offload
 support
Message-ID: <20250409163737.2b6c13e3@kernel.org>
In-Reply-To: <20250409-airoha-hw-rx-ratelimit-v2-1-694e4fda5c91@kernel.org>
References: <20250409-airoha-hw-rx-ratelimit-v2-1-694e4fda5c91@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 09 Apr 2025 01:15:32 +0200 Lorenzo Bianconi wrote:
> +	airoha_fe_wr(eth, REG_PPE_DFT_CPORT0(0),
> +		     FIELD_PREP(DFT_CPORT_MASK(7), FE_PSE_PORT_CDM1) |
> +		     FIELD_PREP(DFT_CPORT_MASK(6), FE_PSE_PORT_CDM1) |
> +		     FIELD_PREP(DFT_CPORT_MASK(5), FE_PSE_PORT_CDM1) |
> +		     FIELD_PREP(DFT_CPORT_MASK(4), FE_PSE_PORT_CDM1) |
> +		     FIELD_PREP(DFT_CPORT_MASK(4), FE_PSE_PORT_CDM1) |

Coccicheck spotted that the previous line is duplicated..

> +		     FIELD_PREP(DFT_CPORT_MASK(3), FE_PSE_PORT_CDM1) |
> +		     FIELD_PREP(DFT_CPORT_MASK(2), FE_PSE_PORT_CDM1) |
> +		     FIELD_PREP(DFT_CPORT_MASK(1), FE_PSE_PORT_CDM1) |
> +		     FIELD_PREP(DFT_CPORT_MASK(0), FE_PSE_PORT_CDM1));
> +	airoha_fe_wr(eth, REG_PPE_DFT_CPORT0(1),
> +		     FIELD_PREP(DFT_CPORT_MASK(7), FE_PSE_PORT_CDM2) |
> +		     FIELD_PREP(DFT_CPORT_MASK(6), FE_PSE_PORT_CDM2) |
> +		     FIELD_PREP(DFT_CPORT_MASK(5), FE_PSE_PORT_CDM2) |
> +		     FIELD_PREP(DFT_CPORT_MASK(4), FE_PSE_PORT_CDM2) |
> +		     FIELD_PREP(DFT_CPORT_MASK(4), FE_PSE_PORT_CDM2) |

.. and here.

> +		     FIELD_PREP(DFT_CPORT_MASK(3), FE_PSE_PORT_CDM2) |
> +		     FIELD_PREP(DFT_CPORT_MASK(2), FE_PSE_PORT_CDM2) |
> +		     FIELD_PREP(DFT_CPORT_MASK(1), FE_PSE_PORT_CDM2) |
> +		     FIELD_PREP(DFT_CPORT_MASK(0), FE_PSE_PORT_CDM2));
-- 
pw-bot: cr

