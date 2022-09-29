Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A421EC32771
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 02:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6qDHoR7CjFqiBgvoGKy/A4Yw5IK7ptxY/JMlYvXaAQ=; b=fzZiKjz1iPxXoEWkVQ+yydjOR+
	xYw1Lv3BATu23bQApy+/02sv7svV59+zSIURZxo7NzhuZMSo5INvPDtDMm2FTFapkjy7V9s9MM3I8
	wMzTKrQUAFo6LlzzL8Xm9Hqb3+klfCcxt8sdf+gxgjqv3bATcYrhRXV0tiF7P0flqRFldljGtQspt
	Y6f243FGe7v7MV8Q6zeG8nMq+apaxU5Sezyfp3pzV4zIodawd38PQhxboUXGl5yUByfl7dhBkJ0nQ
	AeuUDbFMkvhmNmggF+ddI5+sZHQ/jddBRrSQYAq0efXS84vSYyCY/mlW5atom0fAkoPO9QjILXZdv
	vEwDIzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odizi-000wCO-HL; Thu, 29 Sep 2022 02:09:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odizf-000wBy-Ja
	for linux-mediatek@lists.infradead.org; Thu, 29 Sep 2022 02:09:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3630661117;
	Thu, 29 Sep 2022 02:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB72BC433C1;
	Thu, 29 Sep 2022 02:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664417381;
	bh=8U2R8U8IuBgofNLvI4s6FImBhCH5B70PhnDWBOIJ6Ws=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VjR6M0rCxNlAN5h/ia3DBElBR9LAbWDGeI9LfyAY26Z96u3TXCoR7FYOVtxrnmlll
	 XbAXnUk7KAT1yPQvMxE9FmQhwuB6ij8sk9EsYZKnxwWWn19t02nC+p+QhevCD15F7c
	 NQxEadwkv1pDhzd32P4MnyYzg4OrN/X4ZSnYV7A3riMIY1Xkc934RP05/mUuTR5QS7
	 yqgwD4EmvAMaJs9k+GhU6L09KiPfa2VqqH3An+4KAe+jWCKSU8Kd092o2Q1R51yFke
	 8B3kai250natQze16KhxDPnP4yt/wz1cd1M4pc7nPJFvynC+DyuDK9/Uf4HA4dg7oL
	 EcxL6oaKjz45A==
Date: Wed, 28 Sep 2022 19:09:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, Lorenzo
 Bianconi <lorenzo@kernel.org>, Sujuan Chen <sujuan.chen@mediatek.com>, Bo
 Jiao <Bo.Jiao@mediatek.com>, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Chen Minqiang <ptpt52@gmail.com>, Thomas
 =?UTF-8?B?SMO8aG4=?= <thomas.huehn@hs-nordhausen.de>
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: fix state in
 __mtk_foe_entry_clear
Message-ID: <20220928190939.3c43516f@kernel.org>
In-Reply-To: <YzOie0dkiQ43EPnu@makrotopia.org>
References: <YzOie0dkiQ43EPnu@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_190943_731699_1A1138DE 
X-CRM114-Status: GOOD (  12.69  )
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

On Wed, 28 Sep 2022 02:25:15 +0100 Daniel Golle wrote:
> Setting ib1 state to MTK_FOE_STATE_UNBIND in __mtk_foe_entry_clear
> routine as done by commit 0e80707d94e4c8 ("net: ethernet: mtk_eth_soc:
> fix typo in __mtk_foe_entry_clear") breaks flow offloading, at least
> on older MTK_NETSYS_V1 SoCs; OpenWrt users have confirmed the bug on
> MT7622 and MT7621 systems.
> Felix Fietkau suggested to use MTK_FOE_STATE_INVALID instead which
> works well on both, MTK_NETSYS_V1 and MTK_NETSYS_V2.
> 
> Tested on MT7622 (Linksys E8450) and MT7986 (BananaPi BPI-R3).
> 
> Suggested-by: Felix Fietkau <nbd@nbd.name>
> Fixes: 0e80707d94e4c8 ("net: ethernet: mtk_eth_soc: fix typo in __mtk_foe_entry_clear")
> Fixes: 33fc42de33278 ("net: ethernet: mtk_eth_soc: support creating mac address based offload entries")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Looks like this patch is generated on top of net-next while it fixes 
a bug in net (judging by mention of 0e80707d94e4c8).
Please rebase on top of net and resent, we'll deal with the conflict.

