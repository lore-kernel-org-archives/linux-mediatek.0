Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8B4C77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqqIsQWX2czLFV7gRi02kTxPARVAFN+uNk4YnxYBDqA=; b=AkeWexD/3IO56f
	U0u5wyn091xcA+MPwOOzipA4EfKbfPhJmk/Q+c/DkkxUMA3D4BDHinwfaPvr+TQGKUn9eigrlpeBL
	n7Ej1htiiVQQlBul25lYHTZUiBJyt9Wjv0+94whStBR8RXlORbEAP/YGr99UF9Li/jVMEzg1HeOM7
	o4DgNNFfBjtX4Ca86KusCbgOtbuDNFr64QR+1Iek1HgpEGTgoR77T2YEhycs+FwjyXY3dAQI4Ogxk
	03qy++NkPDL8rZaOyUCnN4hHQl06kGNoJsDLfCMZzwXYhey8IEPOcrNpJp5AsHxMSNTW+z6w4fM7x
	X1ggRHVHLzQeNzFDhQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prKhx-001Y6B-2G;
	Tue, 25 Apr 2023 15:35:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prKht-001Y4i-1f;
	Tue, 25 Apr 2023 15:35:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7250762695;
	Tue, 25 Apr 2023 15:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEE2C433D2;
	Tue, 25 Apr 2023 15:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682436946;
	bh=hILIa7zfeQHX44WHpp5lx3LYz44LYIo0k8gq7ws9Zcc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AbDep0f8nsEPf7I2neZ1pcGQ28Xvmcbo8BCOjn5/gOuRbHDPHnxOwa4ntawlUOn6k
	 B+trDdCn3xuAVLnqrrJ7U4/M7Pl/xesMF2M1V+o9330bPe3Ful16dpRrH5rB4Wc5g2
	 Bi5k2hX9zvXPAQMH3okBg//H4XeI/5ypSEYav9lu9QE9/bre4Jb9Bq8L5NG2b+/9zk
	 j5hjVvm1+dOT2serxNr6YBU6gcBXwG+CPN7kAH4xGxFDk5G2/c1kiZPg1HLOb6gG5e
	 ruw4X4kGRtdl9f2D1oOkVToEu34xxWBsud4xfyvRb82E3IagO0BU7udfn8uzwYmp95
	 75o6Qrjg1Jmiw==
Date: Tue, 25 Apr 2023 08:35:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 00/24] net: dsa: MT7530, MT7531, and MT7988
 improvements
Message-ID: <20230425083544.537538ba@kernel.org>
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_083553_604121_70789224 
X-CRM114-Status: GOOD (  11.89  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?B?QXI=?= =?UTF-8?B?xLFuw6cgw5xOQUw=?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S.
 Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 25 Apr 2023 11:29:09 +0300 arinc9.unal@gmail.com wrote:
> This patch series is focused on simplifying the code, and improving the
> logic of the support for MT7530, MT7531, and MT7988 SoC switches.
> 
> There're two fixes. One for fixing the corrupt frames using trgmii on MCM
> MT7530 with 40 MHz oscillator on certain MT7621 SoCs. The other for fixing
> the port capabilities of the switch on the MT7988 SoC.

## Form letter - net-next-closed

The merge window for v6.3 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We are currently accepting bug fixes only.

Please repost when net-next reopens after May 8th.

RFC patches sent for review only are obviously welcome at any time.
-- 
pw-bot: defer

