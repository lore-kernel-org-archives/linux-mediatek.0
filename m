Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EF3C48BF6
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 01:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJnkg4o/lnbk66QKJ1pLyaWugnPbKZ6rSmeYjGhatOE=; b=KwgLjgbxW2rx9dX6JwBHqKaF4I
	0LBzZF3MqdjixnhKPv82wxDAfTNp31DSvAWr3TWOY4gHUFbe5w7aBVMpj0+MozboVYg0pEyvEV6lh
	yHTdrlM/9b6mh9lxrIq+VioJa30SsQIc9IId2msYZzTguSnZK0hqw/HxvZ+EDMc3HfqF/fjUWxfhM
	QBNEXGKbbM8vU4N+EYQzc+HmyTu3S3Pb2P8pDruEuNr3wYwmUP9zrWdHUcJ11YCmFYxqzb7ht6Wzv
	3gaBFMzCPIvrZNFc105p3+TzpJl9Jjhcirm2OJWxnSOSJiKkCxLY7x+MK0MrnJP4DvzGvpI9LjxDn
	DGHzr9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1remEk-00000003GuY-3fuQ;
	Tue, 27 Feb 2024 01:26:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1remEh-00000003GtC-1Qhn;
	Tue, 27 Feb 2024 01:26:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77A9DCE1B0D;
	Tue, 27 Feb 2024 01:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2C5C433F1;
	Tue, 27 Feb 2024 01:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708997180;
	bh=bJnkg4o/lnbk66QKJ1pLyaWugnPbKZ6rSmeYjGhatOE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aHDODS1BJa2mTw7KMtTpB3UW4CtJzQGXAJ9ehwu+0h4N8/JZVr+q4YSYFo9mNaK9n
	 CPMq8XKUyJY+HT3I2ZC1LbWN8eWFaTfsHsOdmHplifEbW2qc/dnEp3G2Hqle3PP1EX
	 0OLkVthSPHZyDjgOaJkzQOp3W/Wqnh4CZPaXrcReyYV/L14rnOVV8dl2JMqXi1ZsP2
	 dB90HncWK8LdkT2zl8gTkviz74qf92PQ7Voc4Yzls2tlcJsd6d4TGsUaLfBeqbhBO0
	 1Ih51Q33qBO+yRUyF1OEyLsdVpa4FPyd/93XphOCBgQL6FGx0HHKhoTubtNDecKcFt
	 luTp24btvjlfQ==
Date: Mon, 26 Feb 2024 17:26:19 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>, Russell King
 <linux@armlinux.org.uk>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>, <arinc.unal@arinc9.com>, Daniel
 Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli
 <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 0/8] MT7530 DSA Subdriver Improvements Act
 III
Message-ID: <20240226172619.59defc7b@kernel.org>
In-Reply-To: <20240216-for-netnext-mt7530-improvements-3-v2-0-094cae3ff23b@arinc9.com>
References: <20240216-for-netnext-mt7530-improvements-3-v2-0-094cae3ff23b@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_172623_576030_D42FE1C2 
X-CRM114-Status: UNSURE (   9.61  )
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

On Fri, 16 Feb 2024 14:05:28 +0300 Ar=C4=B1n=C3=A7 =C3=9CNAL via B4 Relay w=
rote:
> This is the third patch series with the goal of simplifying the MT7530 DSA
> subdriver and improving support for MT7530, MT7531, and the switch on the
> MT7988 SoC.
>=20
> I have done a simple ping test to confirm basic communication on all swit=
ch
> ports on MCM and standalone MT7530, and MT7531 switch with this patch
> series applied.

Russell, Vladimir, there are patches here carrying your Suggested-by
tags. Would either of you be able to take a look thru these?

