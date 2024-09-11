Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1B3EE01FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 02:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sM+Nri6PI9PZCVCbcMb7jnvIb/bAN0rXtg3IxsYWfP0=; b=bOQrIy/m0xnPOZWuz2kHHhpafG
	jh8/+Sgzcn5SEzxiIjar0E/T9hy5WY6glYdiN477FnuCJpTVNnpll+VMuOxMgnTKCn+2k3AGe+N3t
	sHi/23NPKzOoZB1pJ3jxTwknr6ebhxpQnQf+G1gXzaaa0K0/NGVHxDJbKwZXPaQZWjUklvnr4y63S
	cptSb5pX+9E/tdPClV8rTNRoWsbXpf4TV5ZQ1phdzaORb1WFapITkgXbeGnZZYOqDfXfJwK5rkTt/
	jFK8OzE5nUn0GMqP7bKdoVCVULjhoiVSIVr8FF0nc5D5J6OoikkiIWFHqJXfK0pDHuINR2bCmnPke
	F1g1j/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soCxk-00000007oTS-3Gl7;
	Wed, 11 Sep 2024 02:20:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soCxQ-00000007oQd-3E1V
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 02:19:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 964FC5C033B;
	Wed, 11 Sep 2024 02:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C758C4CEC3;
	Wed, 11 Sep 2024 02:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726021187;
	bh=AJkBmtbaw8Zj8MNsRWLW065rLMCDKTZf84K0t+Toj0Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n9UCrQ5+WQECvmpZMrgBlxWCCxLH0gU7LJwA/4WMa1PS1IaI86Mb3pjvbBqfuZ0aP
	 yrI9ru3JLzoYE7DxEqgcy4GdwmyWAK7lBRJN/5ucE4lrSISsNodPEA7mHrx7IUFYCw
	 9O2aEUl2bKVPRLX7dGZ6lrGZVxy0D4KncjkwyeTjzhypeIYmUiA1o3ApuemtKEGIRO
	 kV1ZTey5ghK63tZyzZJkhiTglPiR/ApFysm5JR1kAK9Em3FVGSwrGFR3PyKYWA4Ibu
	 g3ZOBpqDIo6nTjazSMOOA5QfPzZutuTXnFVI2Hfoe62YyS+BCpuDv5X2sJS0if87/C
	 Dh79XLt75P/cQ==
Date: Tue, 10 Sep 2024 19:19:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: netdev@vger.kernel.org, =?UTF-8?B?QXIxbsOnIMOcTkFM?=
 <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, DENG
 Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Andrew
 Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir
 Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, UNGLinuxDriver@microchip.com, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay
 Aleksandrov <razor@blackwall.org>, linux-mediatek@lists.infradead.org,
 bridge@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/2] net: dsa: RCU-protect dsa_ptr in struct net_device
Message-ID: <20240910191945.717ea514@kernel.org>
In-Reply-To: <20240910130321.337154-1-alexander.sverdlin@siemens.com>
References: <20240910130321.337154-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_191948_883739_E25B3202 
X-CRM114-Status: UNSURE (   8.68  )
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

On Tue, 10 Sep 2024 15:03:14 +0200 A. Sverdlin wrote:
> Subject: [PATCH 0/2] net: dsa: RCU-protect dsa_ptr in struct net_device

When you repost please use --subject-prefix="PATCH net v2" 
in git format-patch. The "net" part, specifically, is important,
the patch doesn't apply to net-next so we need to give our bots
a bit of a hint as to which tree this should be (build) tested 
against.
-- 
pw-bot: cr

