Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C30D72371
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Jan 2026 21:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5CVp6AAdxPRS7c1qysAYvNHT2y3oHzixFhgdmCPVjg=; b=ffoPSTUbHymw6k43HMJajfZJJl
	Z0vHLLi9PEwE9SwHQmBc1aqvMUIpdGyGTfIS0Yg25Ax5Od4TGe5Cp9m6fiWXhecO5KhJ6Ha/XBZK6
	Bchs7L+lE3qmzw3ziIb8hiVXgbrVq/XO7dEzb8+9rFcht1h6IKknBreghn7+D6PqAumHv6CR5D7w6
	65ZKQmLSzQItshpfDi1VQIyDahjc9brDP1EkwAxCogrUW680hPfzDXHG+m7QQmd0CQAhLVcwr53CO
	Ook865T9pVCqTC3Jtv2aLkLGcE26MOxAUyDsy3C/QcM5LOaE8EHqZXflokP2Y8uZ9a0EkW4gg6WGy
	RRpcUwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk7ed-0000000BWw5-3jce;
	Sun, 25 Jan 2026 21:28:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk7eY-0000000BWvW-3CId;
	Sun, 25 Jan 2026 21:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 736ED409EC;
	Sun, 25 Jan 2026 21:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D110AC4CEF1;
	Sun, 25 Jan 2026 21:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769376493;
	bh=uVMCMyvfZ4s9lS2txgigny86OJMSLMjE2gP+cqhj00c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j1pq3GN6k3TjxjrXyfJ5SbFrdJy+8dWn7dNf97tdLKx9L4Or+d4TQMG8yZn62iS++
	 hqYJPu45/ukXIuVqOnFmedqx1R+mwpjOCeDsQHgptMv8S/cHZ4iwHVVya/sWSKtOaZ
	 g5bhOSaxgze/EAqu3mSytqDTxl3pSr6z91HRyWzWqwpgdS9z7im1liYaY8AfZlY0WG
	 S0eGbVOVpemE6s8EMI1lR9XE43e0R5tBqVaFPHvmq/bv9fc+ZVFPvMBkQtjLjHBMQX
	 FKp67dFV0Zk1nIUXWzwZ4xG1Xyf/hm/cOYO8Hn2mMut4zkd4nYkbWXSdcMpLJFLTqA
	 p6swMaUAabx1w==
From: Jakub Kicinski <kuba@kernel.org>
To: mmyangfl@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pabeni@redhat.com,
	lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next] net: airoha: Use u64_stats_t with u64_stats_sync properly
Date: Sun, 25 Jan 2026 13:28:05 -0800
Message-ID: <20260125212805.3374863-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122185255.2761568-1-mmyangfl@gmail.com>
References: <20260122185255.2761568-1-mmyangfl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_132814_820793_0F2CBDE6 
X-CRM114-Status: GOOD (  10.32  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: airoha: Use u64_stats_t with u64_stats_sync properly

This commit converts statistics fields from u64 to u64_stats_t and changes
direct arithmetic operations to u64_stats_add()/u64_stats_read() calls
to ensure atomic operations on 64-bit architectures.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 62bcbbbe2a95..6ed220e5a094 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1472,131 +1472,131 @@ static void airoha_update_hw_stats(struct airoha_gdm_port *port)
>
>  	/* TX */
>  	val = airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
> -	port->stats.tx_ok_pkts += ((u64)val << 32);
> +	u64_stats_add(&port->stats.tx_ok_pkts, (u64)val << 32);

On 32-bit systems (ARCH_AIROHA is supported on ARM32 per
arch/arm/Kconfig.platforms), does this lose the upper 32 bits of the
counter?

The u64_stats_add() signature is:

  static inline void u64_stats_add(u64_stats_t *p, unsigned long val)

On 32-bit architectures, unsigned long is 32 bits. When (u64)val << 32
is passed, the resulting 64-bit value is truncated to unsigned long.
Since all the non-zero bits are in the upper half, the truncation yields
zero.

The original code worked because the destination was u64:

  port->stats.tx_ok_pkts += ((u64)val << 32);

This pattern appears 16 times in airoha_update_hw_stats() for all the
_CNT_H registers (tx_ok_pkts, tx_ok_bytes, tx_len[], rx_ok_pkts,
rx_ok_bytes, rx_len[]). On 32-bit builds, these counters would only
accumulate the low 32 bits from the hardware.

[ ... ]
-- 
pw-bot: cr

