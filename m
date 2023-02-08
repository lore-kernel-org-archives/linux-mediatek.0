Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BD6C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 07:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJZsJu6FE/m8RkUXLIqO4+l2gX1b3XV9offgkGavorA=; b=armJOaV0MPkr+mA+rPuPHyfnUy
	ZSgPc6CVORgn8ZnEiJ40phWETv+nfFfpf26IrQ/ed6wmeSssIoQiEviizJHSoT5OGKP4Xk5B8SsBl
	rNV/YP+aKsSO0fP83ZOJwLByhb6se3Qhx2hg37zT390osp6Y3egnhb8XpyKEggCt1mlcq7w/W869J
	m2dX02HorC+TKhyAhjCHV+sLXC6q+5XXlnCqXlmr9skKTLXSrPQyCSQcU3dD+goxgOSbfJePwMJF0
	yfhndq4uFLpCQtRp4fp9fO7cowwiqUe+TrYDxgdj3LrrjfOVj3M+ZYfYzwpJ1HpCPVxzvSFbFeat3
	lxBO1D8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfAE-00ETvD-8Q; Wed, 08 Feb 2023 07:46:46 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfAB-00ETu0-4T; Wed, 08 Feb 2023 07:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1675842373;
	bh=lJZsJu6FE/m8RkUXLIqO4+l2gX1b3XV9offgkGavorA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z1XqmXIrzpSMAkZ+Q0XE5W/aaZ0b3GDmOv9Uu1iprRwYmrXmGDDIA1nxIBDjyuzI3
	 cdoIt1KRcWqN7baNK4TcI+yi7ZVr+Teprx2VIpIqXlpCYm34Dm3ZfxcIZePlDfRTdV
	 Uj602Lf1KZsQpKmk2+jDr6+YSk9YQRlxeqOh6jiCIBJZSLpJi8cB0fEV+zaS+fxbNu
	 DoGYCbY7bHbDPw2a5OGDNDARN+lqF+CysamJq1PyTQBcAofPV2fpdQPXOXcS1DZPYL
	 Ft6tsaS789xJmM2kE1qv7Bsps/jp2oCXDIDKXuHCtO5vtc9hLjx4ML52OzYKPiDcAI
	 FpAA/GVACFpRg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.227.18] ([157.180.227.18]) by web-mail.gmx.net
 (3c-app-gmx-bap61.server.lan [172.19.172.131]) (via HTTP); Wed, 8 Feb 2023
 08:46:13 +0100
MIME-Version: 1.0
Message-ID: <trinity-e1125c6e-9b6c-4e34-82fd-d99d34661cb6-1675842373343@3c-app-gmx-bap61>
From: Frank Wunderlich <frank-w@public-files.de>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, erkin.bozoglu@xeront.com
Subject: Aw: Re: [PATCH net v3 4/5] net: ethernet: mtk_eth_soc: drop generic
 vlan rx offload, only use DSA untagging
Content-Type: text/plain; charset=UTF-8
Date: Wed, 8 Feb 2023 08:46:13 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <79506b27-d71a-c341-48fd-0e6d3a973f2e@arinc9.com>
References: <20221230073145.53386-1-nbd@nbd.name>
 <20221230073145.53386-4-nbd@nbd.name>
 <79506b27-d71a-c341-48fd-0e6d3a973f2e@arinc9.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:be3w77Hl6YYRLG2Pfygnosn9NFEWYnMi66wjxQ4iLMaU706Pu0SKotAM8rWVzb05/cgeb
 UjMHM1GFVDZ82M7mSaTRl8PWr2yByQuuDJvFP/rhSniukSrojFgxOG/DSCdxcOW8Q1qU3IpOE7MC
 ASw5EGGWNjhysiJsZNs34RM8wO2/8Vh7o/8kUNsdH0eAz0Eoa7/Edvtv4WRkmatEVRwZDPa2p45u
 JB1CYxMlOSgZlQZpEIAhakF5W4XFdKu/hr66QUq22PfeJ1M3LdZTZPV3NiaaFZYpBXqzKPQGpwpe
 Kg=
UI-OutboundReport: notjunk:1;M01:P0:yDiaRCpQi1g=;6amzwCNFap286wCSTAXysO5Rhpp
 O+UUFM2v/aTS8UCc0eVw8RHuIwGelQ76CmlCScX5w/kULvrbwzqdV6HfM8aX2HaLSJB8PVgOy
 V6QcEFHKSbhTK6PUxFDNTj34PNgNkS7I8acI40s2ppYdCpNWvQc1Em7rF2OBnpTtOSAo8VJPD
 ypNQeFMkP8JKKYBFnU3m8VIYq3dUzejVljBgnwcbe8NUgLZF1gzpYbtLUmIHgY2CwNmEGYGMF
 /1opsI8tiz5liYMHa8mvThM7yN3bVl/A4wqjQBUwYdZzk/BvAt/buJYqj2YjZdDiebTYaxLhF
 iWVrZLVzepCgUjz+eqcwta37aeMirJacjU/UogMkR5J/AqMXEY3HtCU3V8cL0uoGfGlUaiMYd
 kRAr+NyTfuxCuVUJjxxYHwGDXAvaMsR5BX1gqjTpdLly6zin+B0xxG6mnkoyp6/GZcdtn4UjN
 YALJ47I9/nf097nYqxAGQXiFPgnK+uLi167IyZ4YruTTNDuoaMdy+DfIvPrEsIUfJtxxCQYba
 i1oMbvEjg78akZJmkMOUnXPZY3B1jGZN3GzHyrlW68Z7yLqe1li3hb1CKh9L/28YhBA/w3RC2
 tR+J6IMcgssUzO94Ru2lehxVwaHBAkQdGzHqsJhEpjjOHQ9ZijgQxuuCcxs0RiSC4M3Tsf07I
 jFzDgHqgJ0lE0iFApc6YXXqsyeAewIAHT7B3UsqV3sJnZjhuel1Tqq4ZBcsIwyKrHeRvjc/YE
 Z1zw8RSUeEPuq9ZVqOllCtEeXRjZnf7zPJvfP5UmnRpfgLpStnlRux1bmpuav0Nhs4JFLBz0F
 d5PXOnVpwE0jW0gNT9iPTSqQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_234643_477751_C81BB43C 
X-CRM114-Status: UNSURE (   7.71  )
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

Hi,

just to confirm, my issues were not caused by this series, it was there before and now fixed with [1]

at least one issue arinc is mention is fixed with [2]

so please apply

regards Frank

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20230205140713.1609281-1-vladimir.oltean@nxp.com/
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20230207103027.1203344-1-vladimir.oltean@nxp.com/

