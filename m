Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ECCC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 12:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zn+/jwMkPbBkBTt1T8N8iF29HZcpnK0/VvfWgT2y6mE=; b=E00aIXK9wRWaDhCAjXMw1WUQs3
	h0wznP82l+wyKaXWQDfBAVZmoHlGyV0SyhB4idM6O39PV1RXNfUhwx0NKFuN/9qix11p+2jDqO6/D
	UxgxmWfg5ffGoZFC+XNuNcr2qHH8lXDJ/zaAL5EAc2CDSepC2a+YV2Y0fAOGGNqaZcMa0TzF7hnHB
	dT/iPIYvW84qnnetz7SqDMpMcKdcGnpTNx7vvpC7vsWZIe1BK7FjpvDSeUpVBDv119QNH/kw2lVmw
	+Da2BMJVHNRmgkW/bhs0pkmLcuWnSwMnl4VMAksfaEWd7VFcFNc8kI7VWx7PpXFBwhsBwsAIBK2h2
	dSqYPHkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxnNj-00000005bNx-2092;
	Fri, 19 Apr 2024 12:30:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxnNf-00000005bNB-3LZj;
	Fri, 19 Apr 2024 12:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 46598CE1AD1;
	Fri, 19 Apr 2024 12:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559A1C3277B;
	Fri, 19 Apr 2024 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713529812;
	bh=VeN/kN2AbD4PeQX7ZuRMsohc9478jy4azX325WAmLTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vig2AR6jsAssAqTEKgUhXAXyzbWAjmRcSglKCpSEvnJ6B9jbXRSWLX62NIBLrqM4l
	 jFAbSz/9TIkO7oVNlq3kIiOXrTDq9ANvAuu8ok3F9hPw0Eya8w//68RJiWdfFt+yhL
	 /T0bpCr3kHHYmKOV5/ZXVl/mFzLMKzZM+bFdUzthCTO/QzAMfi+sjZZ8Tr51frKFIP
	 1JJI3ofGhn/fdXPL+NECCUgP0z1U1MqCmxHCqdXeJGdukjdMybZ6d8DnRImDFtY9mA
	 YRp3uoLM6W/lVrjY380MJvT4mf80XKDf1VBAHCjNe7f/Z7Tz0NKQd0unE+x7VEdJyK
	 UGHq3c6x3QbGg==
Date: Fri, 19 Apr 2024 13:30:07 +0100
From: Simon Horman <horms@kernel.org>
To: =?utf-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: flower: validate
 control flags
Message-ID: <20240419123007.GA3975545@kernel.org>
References: <20240418161821.189263-1-ast@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418161821.189263-1-ast@fiberby.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_053016_044670_2686CDB3 
X-CRM114-Status: UNSURE (   9.96  )
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

On Thu, Apr 18, 2024 at 04:18:15PM +0000, Asbjørn Sloth Tønnesen wrote:
> This driver currently doesn't support any control flags.
> 
> Use flow_rule_has_control_flags() to check for control flags,
> such as can be set through `tc flower ... ip_flags frag`.
> 
> In case any control flags are masked, flow_rule_has_control_flags()
> sets a NL extended error message, and we return -EOPNOTSUPP.
> 
> Only compile-tested.
> 
> Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>

Reviewed-by: Simon Horman <horms@kernel.org>


