Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A995AC54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 11:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ze+j0YzZqi1sY/PlV6uWwtewNaSyKkO/JsfwB/RL83M=; b=exnxumY9hOyUa4jHceNPdp2mw6
	XF7DUYvS9HflIL4RzrA76xjVUz0j3oX5niO3WZF5W5mZFeI7GysRfLaj8cNLyZPtZtqNsXeARZxgO
	G1nl061OprTKtI7EIAarqsMOryKjx9fkr9rLAg4yeJy8ZfjYG8fWw1Gg+7ATGcMeDvBx4ZDy4iLAm
	QIuwTnW5oIW/XRdyK4A66nDa6zS+woEx+darXybBGRd0Lj9zMSHtih6Sa50NhfZDm7KsR2AM5BUFg
	t606VoEAPNHBPO0CYrb/Oa251/KwfVM1EJZcRUFtdQ6RvC9ZFuR95n2JgmDRX/hGRnqT6HpZxFIl7
	Taxb2ZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtoX-0000000GtU6-0f8V;
	Wed, 20 Mar 2024 11:08:57 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtoT-0000000GtQz-1MaS;
	Wed, 20 Mar 2024 11:08:54 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rmtnv-00017k-0M;
	Wed, 20 Mar 2024 11:08:19 +0000
Date: Wed, 20 Mar 2024 11:08:12 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
	Russell King <linux@armlinux.org.uk>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
Message-ID: <ZfrDnFyGay5YTTFg@makrotopia.org>
References: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v1-0-3f17226344e8@arinc9.com>
 <9d111cc9-c73a-4d3c-83f5-3f59e6c8841f@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d111cc9-c73a-4d3c-83f5-3f59e6c8841f@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_040853_398640_83541866 
X-CRM114-Status: GOOD (  17.63  )
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

On Wed, Mar 20, 2024 at 11:10:19AM +0300, Arınç ÜNAL wrote:
> On 18.03.2024 10:46, Arınç ÜNAL via B4 Relay wrote:
> > Hi.
> > 
> > This patch series fixes EEE support for MT7531 and the switch on the MT7988
> > SoC. EEE did not work on MT7531 on most boards before this, it is unclear
> > what's the status on MT7988 SoC switch as I don't have the hardware.
> > 
> > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> I see the state of this patch series is deferred on patchwork. I see that I
> forgot to delegate this to the net tree. As I don't see any objections in
> this series, I'll send v2 with it tomorrow.

Sorry, but imho it should go to net-next, and you might have overlook
it but there have been some concerns.

For sure it should not go to net tree as you are enabling a new feature
and not fixing anything which is broken. EEE on MT7988 works fine as
of now (see my reply), EEE on MT7531 was supposedly intentionally
disabled for reasons we should ask MTK people about.

