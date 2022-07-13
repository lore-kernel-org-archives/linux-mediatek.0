Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94611C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 03:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVtCkBQKszMrIaDEzYkwrGHkeTwIMxEmMgFYri9k7SU=; b=UNCXX0oETHEKT6OECBdy19jf1B
	AEw891df5jOzxmIQCBuuYWAYr0oUvWsRVksx0e11JhIAIhA8KcdIVFDCs/ZRvVXimsBvDyWlZ6now
	ps/WsQJHk/lhS6Xx3wS5nnn2e2ZCU7XihHSZUBjS3zya0dvPWBs66wWPiAhoO3cvuzi6lIDvXDnlL
	NBGI+w4G9vgLgqmQXKmvdbqQGTkCaU259IFlK+GmSVR3lvkFVjD74dvtD8Cu/+PLEEqka1JhJsGSm
	I3hM1nciPF+VNmxWc2+n3DHHmz/oEsEa5y+JpV9nfEIeca7qozrxmzd4GGoSwS3O1bTOFUE0AMojo
	e3sjapmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBTUr-00HaHA-K0; Wed, 13 Jul 2022 03:57:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBTUp-00HaGL-8B
	for linux-mediatek@lists.infradead.org; Wed, 13 Jul 2022 03:57:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E89A61AFB;
	Wed, 13 Jul 2022 03:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73876C3411E;
	Wed, 13 Jul 2022 03:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657684624;
	bh=KVtCkBQKszMrIaDEzYkwrGHkeTwIMxEmMgFYri9k7SU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OpkLZf+lpx0JcEvEYSaDe170KG13fjFoBddtICFYcDYzTJ5f0tF5tpiMCmp/9Y430
	 VRGSmlfJ8NMmlQ7YFJD0f1T6YjPOqWOPwDeayAsx1VuBmEBcs9uTfcu60nkdf9q4/C
	 a7xBSviteUbiI7OKe/wCI8ARm6wRU77duaMdH80QzbNNewlCN9GRRmODONyYlmFcOq
	 4Iqb8Hd6anHJfXJFyhms8RNkt2zpiqnAAz+cId8MRyrQgSHnVhHw7fXFt/jY7ZXr1b
	 0BfV5/0H8DRkh2CmTA/dwE98WybKihowSdQfuXFHxfqafl1ETRA3+Kn+l3dGxNF38m
	 T7/QJxmPVx7QA==
Date: Tue, 12 Jul 2022 20:56:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, ilias.apalodimas@linaro.org,
 lorenzo.bianconi@redhat.com, jbrouer@redhat.com
Subject: Re: [PATCH v2 net-next 2/4] net: ethernet: mtk_eth_soc: add basic
 XDP support
Message-ID: <20220712205655.3d3ac17e@kernel.org>
In-Reply-To: <660481b3292e8438b08d129d74e3bf62fab51db7.1657660277.git.lorenzo@kernel.org>
References: <cover.1657660277.git.lorenzo@kernel.org>
	<660481b3292e8438b08d129d74e3bf62fab51db7.1657660277.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_205707_378461_853CBB3E 
X-CRM114-Status: UNSURE (   7.26  )
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

On Tue, 12 Jul 2022 23:16:15 +0200 Lorenzo Bianconi wrote:
> Introduce basic XDP support to mtk_eth_soc driver.
> Supported XDP verdicts:
> - XDP_PASS
> - XDP_DROP
> - XDP_REDIRECT

Looks like you're missing some rcu_access_pointer uses here.
sparse is not happy (2 new warnings)

