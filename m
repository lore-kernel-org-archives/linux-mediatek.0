Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A24C6FD1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 18:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+owYiX7jswArKs3fL+HnoSgqSO+sE7J8CBPiU44HSVA=; b=EPoiHldFfSA35VelNEVfMb3VHQ
	V8DgDN9v/k1KJNE6z1W2aIvtKo/W8q+EsXvtKWwU39CePFxQEATKg98tOc2fSpcgIC2CyB7lo3f8e
	7ueDcsG2xkJnVD1ToZZNoBqAB0dHLEDw2MNQWKv+laCwlDFwuP9fXBJJ4F+Vf5fGxWE7ZB1AX7hJc
	fT5MC5sPQsTn0z7Fdx8xNUQIZgbsrONe8kjKfX2skrRSmnVYTRY45GbuaZh/iAAOWX3zWb/AslFcC
	HNp8vioMjjUc8dDEUaofcb7Tn1vKarpfq/3TNJPOlcTT2TaO9ZkwgKHaiDns6k04B/ldSioCR6i46
	6XHm4vFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcRu-0027yb-Hk; Tue, 07 Mar 2023 18:54:10 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcRr-0027x7-MY; Tue, 07 Mar 2023 18:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1678215228; i=frank-w@public-files.de;
	bh=+owYiX7jswArKs3fL+HnoSgqSO+sE7J8CBPiU44HSVA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ud9W7IEd/03xmWP/ai64n/sHBhn0fBsP6DlJXdr5l0uNkSfa4zEU/lAo34Tm/y6RP
	 bJNoR3KxCBkO9chRoQSPcSMDRyajidiVJgYrgfB6KEnrCLgdWahy7vkNS6AVC9MGFk
	 +sQf/9G03qLckfMgAPncpMxMwS1fu9OraROpcVONaOkMIKqsd2YbtOi7nrxGN5y6G0
	 iF7zovhxIvx+TbxQ8kAUZztBSNez95df01rwHNs6piXujUsggN5qxuwMecDtI7XRTj
	 I0uxYTTwaFFn7ef/eVODUgVKUVwrSkGYmMY6r5++ywCI/21cTfqMt3UjX7gZWcN6gz
	 iheRYz9g6tmiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.156.24] ([217.61.156.24]) by web-mail.gmx.net
 (3c-app-gmx-bs16.server.lan [172.19.170.68]) (via HTTP); Tue, 7 Mar 2023
 19:53:48 +0100
MIME-Version: 1.0
Message-ID: <trinity-c28f2d1c-6730-416a-ad34-6e03182c2cd5-1678215227989@3c-app-gmx-bs16>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Russell
 King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang
 <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <vladimir.oltean@nxp.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, Alexander Couzens
 <lynxis@fe80.eu>
Subject: Aw: [PATCH net-next v12 07/18] net: ethernet: mtk_eth_soc: only
 write values if needed
Content-Type: text/plain; charset=UTF-8
Date: Tue, 7 Mar 2023 19:53:48 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <d2db725199011ec06082926830cf9fb2a8aeb147.1678201958.git.daniel@makrotopia.org>
References: <cover.1678201958.git.daniel@makrotopia.org>
 <d2db725199011ec06082926830cf9fb2a8aeb147.1678201958.git.daniel@makrotopia.org>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:pkz3K6WA6EmNJMhsiAcvkx7bjekeiDSDQDd8tCucyVIXTL57c1OwHykxVgZKG1lGsNyg1
 0cWV/hriObkPzyLS+0mGKLemW65VGLyO2iap2e1yYSL0GICfo5VbTKwQ8DkKaGAEY1NspIXVaseU
 lDoQX7fOwYvYMS2ZGrGAg+YIjOJiAkww3nvUJWFN21/EG7AIU5SydbGcwR6Y+xK9xx0tsk+cUGZr
 kB+K7tsWcuBEK5/xd/TbPnoqFd097MJDgdQbXT7+bzEicx/1VLzODjxPMN3Gn1Yui8bM/sKvC6QH
 Lo=
UI-OutboundReport: notjunk:1;M01:P0:mxzF7MLmkLI=;/RFfM47ZWNU2XSMGrw0gxKEoCRi
 xN13YE1EvN8VdTw8rS/2cyFNG+AoWNsqWM9YR7IhvFNPKeYDE+SoLwGeXs0oagtNQLQf9EOxk
 gcgJkOXmEIJDd41Gv1DnWJ13fAIj+FBM6XIDYbsi/IwJw+mDYvsRYxk5RT9uUeTx7uAirIAEc
 kdVMqy37arAgw1BjHnWZWh4wR57GDqgkvAK13qPvyiFAfPusc3lNFxTPJIU7n3NmS08WNbpDF
 FMjMuUZuJ5JgMNXGRVg5quf+z+P2FgkMNDtm6c8aaiFshuZ0b0lAlyR3z2HJhQDgzC+zytIub
 foMFAK1Dikg24AkfeeQP7qE/9yZBoZnk9C3/xsyPKr3GmWzzh3MbLXVU3J8eosodFg249eIHn
 7lJNSEr7aAERqaWXOcKNaSUBLAmmin6sKHBSvTwlSCXE7fMjMsgGTDXWM2Vm1pCbkKRDn2aUB
 ZK9E+ZYWu7cca711Q8/UjOi0C6DxiYPH2W1CNNhNRh/I9V1J/bGAJY9aTzbl3+3LZDmW9DjIm
 mZKFLid0r+020WWqHU6Dyz/T36itBN2wwOtQR/kQ6hk+Gw6KBJKepHXUZ3J53aW8FWtJrZ0cR
 cT89vsQa06PLXUF2PimUVABhFLki555V+5YGQJRPEHrYFdD0DY966B66ovTLwK11S7ZXTQhXc
 naFm23TpAk2anx7XQmJteQnGAiPI+v0l1XFdiaJVVZRUxgcBpUzY4p747w2C573ynKluLEP0U
 fSwj+7zOjp4QIY8zNNFmfEX/gr3PcIXslEVP/By46T9tK+LhX9OfkQyo6OFlr4hPHpa5SNtaS
 125/WcdSyvOnLbZ8kXoo7R9Mhw2WRgQp92LxqvW+KULJk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_105408_037794_756B4BB8 
X-CRM114-Status: UNSURE (   7.95  )
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

> Gesendet: Dienstag, 07=2E M=C3=A4rz 2023 um 16:53 Uhr
> Von: "Daniel Golle" <daniel@makrotopia=2Eorg>
> Only restart auto-negotiation and write link timer if actually
> necessary=2E This prevents loosing the link in case of minor
> changes=2E

Hi,

have tested Parts 1-12 this on bananapi-r3 (mt7986) with 1G Fiber SFP (no =
2g5 available yet) on gmac1 and lan4 (mt7531 p5)

Tested-by: Frank Wunderlich <frank-w@public-files=2Ede>

Thx Daniel for working on SFP support :)

regards Frank

