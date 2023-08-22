Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196DAEE4993
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 18:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MakkPQM2VPwNbzDzW3dZR1YMrZuQpsu0pdFb9c5OlE=; b=FTeSEX0ie3fDov1InA9Nb9LAXN
	AvbQlScPwSbbMGWSK2FeXiu96JdBmiMqDG/YMInOgMcEBx1oqSAU4CKYygX5tickM/8Y9peKE71pS
	ZqLncrXLOxcmeue+mMHTUmZT3fqOguLXGco7ifvo0ODGuGxh+QqKs5Kp5gLyK5mpXRAy3ANrlUILJ
	PcqTKj0jEOaM1AzHGPvaSdSCipcR7JrhWqYoL9Q9XGz9hAyYbmkXR2biDjc1fuoZPZoFAv0obNZu7
	3yS45dGxsPgxcl4ynTFIZNk4G10BArzX4Pf05Y+8gw8DXAqdQdUvm3dZloYEa6ZW1t2BoOUrytOUo
	cbq+yygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYVhH-00GcAD-1s;
	Tue, 22 Aug 2023 18:01:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYVhE-00Gc9A-2x;
	Tue, 22 Aug 2023 18:01:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3DB5362E19;
	Tue, 22 Aug 2023 18:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF09C433C8;
	Tue, 22 Aug 2023 18:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692727299;
	bh=hBTOuyz8Nt7hcba2eNXqyX4Y0J/02IjEk3pmEmSZmiU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jaswbUAThItRiQaPaN86kz78ooHgBPVR7pMuCG0iCNo6cDVi3p8C6ofUIDeGwFkMM
	 km08vrAWMl8Suls+uELLTFoU/dQR67nRINxgGbm0wpiIW+WGdD+ZPfti3lI55S8696
	 PPSxezV/h09e25GJoUjLicck+wfQJhc5kkT1YoGJvm6p9V6LYdzysLL1BdqPud1tp/
	 3MHTVBcSxN/GvBumzi3vfjtDXZdreZpL5RSNdkC+X1idaPcER7PSCfbqti22VHi6C+
	 7tpi5Hg1zx/ff9I7VT3dcef/T9KIjIrpcwhJVMvpBaAaXysKcX/r9Mf4PAiK1UwaGb
	 rmFa5DOv2tmFA==
Date: Tue, 22 Aug 2023 11:01:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2] net: ethernet: mtk_eth_soc: fix NULL pointer on
 hw reset
Message-ID: <20230822110138.10252779@kernel.org>
In-Reply-To: <5465c1609b464cc7407ae1530c40821dcdf9d3e6.1692634266.git.daniel@makrotopia.org>
References: <5465c1609b464cc7407ae1530c40821dcdf9d3e6.1692634266.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_110141_000987_1F466448 
X-CRM114-Status: UNSURE (   8.17  )
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

On Mon, 21 Aug 2023 17:12:44 +0100 Daniel Golle wrote:
> Changes since v1:
>  * remove unneeded {} initialization for stack allocated memory

s/stack/.bss/, FWIW, thanks for updating!

