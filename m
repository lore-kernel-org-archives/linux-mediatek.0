Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD2AC636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 11:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9n0Whk5/5/utkKTxDjZLAWyUiu6RYJR70BBRM/BBf/c=; b=b7JHJKarq8LwJI+nHKyS6KawHR
	GiAL6zCEORrcgI1RAw3kPmLCedrOw2IQU9hv/XFzdFHtiimpik9rrcKlyPnBNHBbDgINlOJwe8IYq
	WCdbLTDst6XC6qJUgTuf8dQ4AxlHTehrtRr/ut0i9CxJx9TDyAfQ8ooc4LpBFkSYRs+SNfUUs3ONl
	92+BNEhOT+2UIpAqGW0mw22Apgu/OeszNFBm8Ep8azx+NrBN42RTG9J6dPaeQvkFHNCgIhKrkHNRX
	P/M1Ff8jvHIfxKKMc8FliVEmCmCNRKT6EHvXCXJN1uw/J90lubS79Sn1CIim7m1C1k/zES10ZKRRa
	vJlLBwRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLiB-00BqXE-6N; Tue, 07 Feb 2023 11:00:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLi0-00BqTe-6M; Tue, 07 Feb 2023 11:00:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B12706130C;
	Tue,  7 Feb 2023 11:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1200CC433D2;
	Tue,  7 Feb 2023 11:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675767618;
	bh=uXDqiP/EEOsn26MCkEE+Xmwl7tj7nwBTMTAymU2YJQc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HVSaskIhrgM/xao1OQx16Oz9nPcvOqW/61EI01xYAsxMPK8YOAbRTQruGc1ijv/5J
	 meJuEC6hbE5D3vy29QGVtFt/p/O04kW/xiWp78Zmz0Zd8bUpymHD5GDIb/PhChs3RN
	 PUox56o5pdSbscXEEdmXUuykZbn449mSZCh1zO3njrIfiR571faCVNrca99zQzsSzA
	 6RYU8MsEXAZt8dY2xVkMmh+a2gkTnpvP6a5Xnev9Jdx5S+1TadR8LRI3fTD/M0BES3
	 FxUqO9QcBjus//AknvRVXhebvi6iAryO5u46ZYg4v+aKMczdYgbHjXmKtPCFog0eee
	 GZk5BW/Be00vw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DBC96E55F07;
	Tue,  7 Feb 2023 11:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: dsa: mt7530: don't change PVC_EG_TAG when CPU port
 becomes VLAN-aware
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167576761789.20941.3807568418401527275.git-patchwork-notify@kernel.org>
Date: Tue, 07 Feb 2023 11:00:17 +0000
References: <20230205140713.1609281-1-vladimir.oltean@nxp.com>
In-Reply-To: <20230205140713.1609281-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_030020_315345_A10AE57B 
X-CRM114-Status: GOOD (  10.82  )
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
Cc: andrew@lunn.ch, Landen.Chao@mediatek.com, f.fainelli@gmail.com, netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org, dqfext@gmail.com, edumazet@google.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Sun,  5 Feb 2023 16:07:13 +0200 you wrote:
> Frank reports that in a mt7530 setup where some ports are standalone and
> some are in a VLAN-aware bridge, 8021q uppers of the standalone ports
> lose their VLAN tag on xmit, as seen by the link partner.
> 
> This seems to occur because once the other ports join the VLAN-aware
> bridge, mt7530_port_vlan_filtering() also calls
> mt7530_port_set_vlan_aware(ds, cpu_dp->index), and this affects the way
> that the switch processes the traffic of the standalone port.
> 
> [...]

Here is the summary with links:
  - [net] net: dsa: mt7530: don't change PVC_EG_TAG when CPU port becomes VLAN-aware
    https://git.kernel.org/netdev/net/c/0b6d6425103a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



