Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB7BC76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 12:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMICsUzMAChsX8gX6T4Kb0+13sZIfFeReaM+TBpCFVA=; b=lnC9891hbU0gcsPW8J631ThxUQ
	KpAylfJwRxE++eL+n5vOsswzTPcIre8O1RGka+cVdlC9+zi3RopYJgUwNNzeZxnn7MwWPYT7g9q/z
	GTIhSfWFAgVfBrgnSfGRRFX3f/U5gdbHC/K7AE4JnVCvs8XKhPrDuficv+VAh3ECWxDcbqU7cI6hC
	COW98DJSQoLliz/aZmK9SJ6ej3TS2cV7MELCrIn0v94gNzO2GXVxqtRATwPF62XD2sPx/2u6lybIQ
	FdU3YaT/RLwY4ZNKGFpYcxUEtp8ZpqOGqJ9FzoPlglasiIx3RRhxscl7z45RIdkQkU7yZFChiDTJc
	hRFcmfCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJg1-00FLqN-3D;
	Mon, 03 Apr 2023 12:52:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJfx-00FLpH-0g;
	Mon, 03 Apr 2023 12:52:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 57A7261A60;
	Mon,  3 Apr 2023 12:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72D4C4339B;
	Mon,  3 Apr 2023 12:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680526363;
	bh=I1U8a0CpEbn1WglTzJbuJSWzo+Oe4sN1VaS9yf+8xSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L+5pqbG9ruhm88XVe/eA9FPu3JmXE9oL3nixjMsXOvIBRnz9Pi3Dgvv+1rsB7U98S
	 26J0PCa/eZqYWTY2hbsEY4n5Kww7Y/PqzDZIQUS8Ch3sJk13FIYZyPuGhEJS7NLSyn
	 n4SbzQwZsB8CRH4Tj2wRlm/+QgBRE5/1isFV/vB5sEXAqVm8b5vp/V+cdS4t3wXf0/
	 nTHXTwRpCF2VV8BBCQNE6si/vW53sseo5V6ex2wUmjUfH1gB0lwTDmdzT7t7FS43yb
	 ymIry9M597CCJGpoRZGpWm0KYhMxVhyDl8aRKAmJ10uaEv5QdqbFoQ2TbpEsjEQrCh
	 pQTnIQ5td31iA==
Date: Mon, 3 Apr 2023 14:52:38 +0200
From: Simon Horman <horms@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: use be32 type to store be32
 values
Message-ID: <ZCrMFtTxZSjqjdTZ@kernel.org>
References: <20230401-mtk_eth_soc-sparse-v1-1-84e9fc7b8eab@kernel.org>
 <c7684349-535c-45a4-9a74-d47479a50020@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7684349-535c-45a4-9a74-d47479a50020@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_055245_304165_BA2423AD 
X-CRM114-Status: GOOD (  15.41  )
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

On Sat, Apr 01, 2023 at 05:55:35PM +0200, Andrew Lunn wrote:
> On Sat, Apr 01, 2023 at 08:43:44AM +0200, Simon Horman wrote:
> > Perhaps there is a nicer way to handle this but the code
> > calls for converting an array of host byte order 32bit values
> > to big endian 32bit values: an ipv6 address to be pretty printed.
> 
> Hi Simon
> 
> Maybe make a generic helper? I could be used in other places, e.g:
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c#L6773

Hi Andrew,

do you mean something like this?

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index 7332296eca44..cff6c1177502 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -935,6 +935,11 @@ static inline void iph_to_flow_copy_v6addrs(struct flow_keys *flow,
 	flow->control.addr_type = FLOW_DISSECTOR_KEY_IPV6_ADDRS;
 }
 
+static inline void ipv6_addr_cpu_to_be32(__be32 *dst, const u32 *src)
+{
+	cpu_to_be32_array(dst, src, 4);
+}
+
 #if IS_ENABLED(CONFIG_IPV6)
 
 static inline bool ipv6_can_nonlocal_bind(struct net *net,

