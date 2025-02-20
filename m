Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4785FC021B2
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2025 22:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBoRAtb28Bd8anHFUn061Fp+7Mhx/m8cSwBFf15vNiQ=; b=zEEWj48Hk9pIRBwWk7VIK2yH9w
	GBM6w4pJG+Zz1H9IrULfQ3tEvHxbDmxUiLvXJehRMjcq1rM626MR3kjVHKAes1wjac667Jm1zWB0x
	f/7GlzKYzAZF2/e+rH4NEh7ML1PhWKRRWIJuuVmwcMCBMJJuC/BSx25GBsM7EVyPMLQTgfurvwWSt
	kd5cCXAa6zOLmxxlTMWnQ2Jdd/4p1aiy65oheIhMlZIe8ovGQTaA164YEXAdP/7fzmNgaB7wtdVhj
	MAMxuXjks2NmpWxuUwsnFtxh7qu+V/GFT1+knsLmVDePbrkSTtyeF88eAxtn6o97MFmMeaYVlhHs5
	+xEOXLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFDL-00000003Ata-0YOM;
	Thu, 20 Feb 2025 22:40:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFBp-00000003Abu-44Lk;
	Thu, 20 Feb 2025 22:38:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C08F5C5E9C;
	Thu, 20 Feb 2025 22:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20999C4CED1;
	Thu, 20 Feb 2025 22:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740091121;
	bh=Ppb+Pfz3YL9zU3Tv9OOPt/0hADKUh0x5VfaDJ4uMAxE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S1EHRweYEqCVnw8MdjHn1EbXyRrAQOMZG+ts3WicxTwQyQc98jIF31ONIX/dFppWi
	 7VDHDOLyraPnqZxLhiI/Qnz1tBoZSMwLvKtsARCL3vWMQbb7uuFU3m/FWkWlaeyvXJ
	 uaW1AhwLPj6x2ceW7XscmLvJLbQxvI8NgbMr8fBr9J5iSut/JvK4384yQ+vPLjwQxR
	 CZ2L2X/45evioSs4MGk7cn4Yls8l1lR4sWwz0o6mV5kpsCr1MjM+n8jycZrox5wmoc
	 SgWZdSMtcJbXGX9eIqRPXofKHapj0ZH60OVTfgx3+8xvrI7UNyXjzQua6/p1049FwC
	 kAfQ+FbCmTydA==
Date: Thu, 20 Feb 2025 14:38:39 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 upstream@airoha.com
Subject: Re: [PATCH net-next v5 12/15] net: airoha: Introduce Airoha NPU
 support
Message-ID: <20250220143839.5ea18735@kernel.org>
In-Reply-To: <20250217-airoha-en7581-flowtable-offload-v5-12-28be901cb735@kernel.org>
References: <20250217-airoha-en7581-flowtable-offload-v5-0-28be901cb735@kernel.org>
	<20250217-airoha-en7581-flowtable-offload-v5-12-28be901cb735@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_143842_057072_CFEC42D0 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

On Mon, 17 Feb 2025 14:01:16 +0100 Lorenzo Bianconi wrote:
> +static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
> +			       void *p, int size)
> +{
> +	u16 core = 0; /* FIXME */
> +	u32 val, offset = core << 4;
> +	dma_addr_t dma_addr;
> +	void *addr;
> +	int ret;
> +
> +	addr = kzalloc(size, GFP_ATOMIC | GFP_DMA);

You need the actual "zone DMA" memory from ISA times?
I think that's what GFP_DMA is for. Any kmalloc'd memory
can be DMA'ed to/from.

> +	if (dma_set_coherent_mask(dev, 0xbfffffff))

Coherent mask is not contiguous on purpose?
Quick grep reveals no such cases at present, not sure if it works.
Maybe add a comment, at least ?
-- 
pw-bot: cr

