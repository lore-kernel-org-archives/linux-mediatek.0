Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188C4C3DA5D
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jul 2024 11:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwvyPkKoKEo0cfBrIsBi5UCk/nlk8ZJ0MDuIcEGRLp8=; b=ASjQd+aqe7zVTGrVZWqbbIFXgC
	qDnTreBPQSLYt1VceeyO6sHTsLJ/M3NM754WoJziHGsJF56WeSQae2K/SC30ZNffV/ZUZyq0+BBCL
	kKI3ge11/U1MLav0kTXEb7HBgpUZ65D1zLIlIFYCMkNeRQjrNCN2AMNX3M8Dw/OCKegy6PkwCm/Du
	YpgbVPt+Nia9C3u/RbC0F06i49022c7rEPYsPZumxtYPmmbqnxDK05freZ5XaeqA7w1z/ZGREOC2F
	2N9VM5IaQlxmMy0hc5APVKDOTcE+VQ//PoVog9L9obWrM7RBnkQzE9BHbzavL58O5GkFjtcyEiGCR
	5ubKCFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVUVR-00000006heB-3wmY;
	Sun, 21 Jul 2024 11:13:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVUV1-00000006hb6-3RBe;
	Sun, 21 Jul 2024 11:13:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B5BD6CE01B6;
	Sun, 21 Jul 2024 11:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC208C116B1;
	Sun, 21 Jul 2024 11:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721560383;
	bh=G6cOPB+KBxo56wsOhn9rAt+ZnxMNBvnJZL52wCV3QKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cAjdaxh/xvcVurWPVG1c1R5lqSMNjLGKRbfHTiANf1qon1kn3cuN4ntDRWzyDFcye
	 LNKne2MNcyqPnRj7JP0klZPdBXrc3R16vFcv9d+CFPQSSMwSNEp0fcN6iW7nBj/VxC
	 8fmBitXq0IRshQYw3W0wT7sLF0+5zwOfoWjoTRHU68Dg1kgJBL3I5fJbMc8CTDp9m3
	 k0nRcKRFJq/1w3k7W/VeiQWoCX/onSeVInt6EJ43C9KgxhW1qFrSmJPd/OwKUNjhg1
	 474/Ac1ShJ+3JNHOV4uyWrqjfYFz/xb2IRKxVziHLZEMSzEKHdsecC7bDesIBRKuI2
	 w3RPoE0idi/jw==
Date: Sun, 21 Jul 2024 12:12:56 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	lorenzo.bianconi83@gmail.com, dan.carpenter@linaro.org
Subject: Re: [PATCH net] net: airoha: Fix MBI_RX_AGE_SEL_MASK definition
Message-ID: <20240721111256.GE715661@kernel.org>
References: <d27d0465be1bff3369e886e5f10c4d37fefc4934.1721419930.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d27d0465be1bff3369e886e5f10c4d37fefc4934.1721419930.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_041310_504283_DD6E3B10 
X-CRM114-Status: UNSURE (   6.50  )
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

On Fri, Jul 19, 2024 at 10:38:31PM +0200, Lorenzo Bianconi wrote:
> Fix copy-paste error in MBI_RX_AGE_SEL_MASK macro definition
> 
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


