Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CF3C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 01:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qho4Ur9kLtiOlZ6VM+JZ+GHPKbL31M5XCDrCAVRNOsA=; b=VYgyHuICA0DKiClarxVTY9uIqg
	t7jeZtIHEHua9DdBkf69Vq6r4dQ3EWY5p/Khj33d1sxb3lO+L0j6c8BcSyYv4nOalK4sfmUL3voxR
	wJsXeONxBGN5Dc2rMzyPDXu9jI6McwqP65CEI2OkTzCee2Uf/F32UIXgKnzlP6B3ACf2HWOvWCTo6
	wGbnJhh570MHzKgSqhD+thTiAQFzKsk46mJn2U05myXN5TSgP6sQmwrrrCx5gK9X2VsPp8e0kstXO
	MQGKL5soTI/PC5RpHuy5GkHzP5K2SddA/ig0wmund5ObR2m2NooyVOldu2Aj+vFGHDIb6AvVz9vbY
	7R4SdhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5GOu-009g1I-Js; Wed, 14 Dec 2022 01:17:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5GOk-009fzP-40; Wed, 14 Dec 2022 01:17:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BF326B81608;
	Wed, 14 Dec 2022 01:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D117BC433EF;
	Wed, 14 Dec 2022 01:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670980642;
	bh=Qho4Ur9kLtiOlZ6VM+JZ+GHPKbL31M5XCDrCAVRNOsA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r/n1jshs+E49EDrjrSJgMY4Djrxh/eD48ZTNhtKJYx+shBibbdg1xwy/1YHHz6inn
	 budV7FINzMovmERaZI6yL8pjAJ/gn8DXid22LfWyrka6spkE0jd0AfInhXuOoVkaLF
	 f/jgCWBwftx04aqWy9FXxg3mqU9crCJ0lPAGc7y/AnX2IerTI0EWd4AdbjSag6aMh0
	 LZIxxrIYvat1yE/FEuFDG1+M7ndZxVpYh/XQn7CdSG9k1j+2klGBGy/Ad8McoYJsyO
	 uNVY4LYwE9MGdaE04AdPwRBoHsIt6IFVF7mwZ0kK5UWlKGNkZCvpPk5eONtt5xT9q4
	 bUqveBRm79mdQ==
Date: Tue, 13 Dec 2022 17:17:20 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Landen
 Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Andrew
 Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir
 Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: remove reduntant assignment
Message-ID: <20221213171720.3af6fc05@kernel.org>
In-Reply-To: <Y5f6h8q7rlnk1jnD@makrotopia.org>
References: <Y5b/Tm4GwPGzd9sR@shell.armlinux.org.uk>
	<Y5f6h8q7rlnk1jnD@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_171726_358335_F2BFAEF0 
X-CRM114-Status: UNSURE (   8.61  )
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

On Tue, 13 Dec 2022 04:07:35 +0000 Daniel Golle wrote:
> Fixes: e19de30d20 ("net: dsa: mt7530: add support for in-band link status")

Apart from the changes requested by Russell, could you also correct
this Fixes tag to have the required 12 characters of the commit ID?

You can post as [PATCH net v2], net-next has just made it to Linus
and became net.

