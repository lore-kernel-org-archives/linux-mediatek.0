Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F631C7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 17:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSXHnTZzWxnUCfTtKsu0J9OA2BMeOKUP3P1my0EJ+3c=; b=jLSfRMshRNHwGT0JUU14TH3leb
	A4jVfW+UJuJRWXbYlwg4K/WCCo9XxWfF1L0yI3QUA3I+1AZs3i+pvCtAkLT/cqkcHRmmJ47BQ4RJc
	aI7WA9Fkp7YS2DHoW96o9sYvGaOHla6WJY2N/K5cvfSZOmPzNTduZ7DctVxUGLUfbcZuzFwxmqK3q
	t27Rto5azSrC0BlPf5Ds3mEotEGbaLPcdafzqaxDj/QWelz++wPSKXN2bP0oBsK1gz+P2z3158mbi
	Yh2Vf0SmRiyo5QIzKdf9PW/X7LfaIKDVdHWV0gC4b167BfsqZHqkrUWbWH5sriYlh5RNInOUbZ5wU
	X7V75qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prjJr-004Zik-0H;
	Wed, 26 Apr 2023 17:52:43 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prjJo-004ZhS-1k;
	Wed, 26 Apr 2023 17:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1682531537; i=frank-w@public-files.de;
	bh=YSXHnTZzWxnUCfTtKsu0J9OA2BMeOKUP3P1my0EJ+3c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wc/98jMO0/+y7MaO54jCWMwvYzpioSbvBDJiAlt9FANgCn/bkpbRnaKVc8dcJBqBX
	 GG53WEFbRTn8R36obSXdVfSP4jhll7xuJO7SONgt1m7JLQj7ogSsIckFbVu9kP23zL
	 vC5v8X+t/+PqETjVsBfFbi6hxrNRP2mxxsSoJVgtw901Zm+46KA4olf37ToFKpby8u
	 2ScTs6vUPwHcNH1UoFAK0R6SKFd5zEEnfOcUZXv5AyfsiHj5Gk5D7EP1nWlmLSdz8R
	 W/rzgAqJjLfTehvax2LmmZdRdOAsq1rD2NVr5GFl2P4elTc4+cNwpzYHa/hKVLHr7m
	 51AearMfwClxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.146.19] ([217.61.146.19]) by web-mail.gmx.net
 (3c-app-gmx-bs05.server.lan [172.19.170.54]) (via HTTP); Wed, 26 Apr 2023
 19:52:17 +0200
MIME-Version: 1.0
Message-ID: <trinity-a7837941-a0d2-4f38-aa65-0f0bd4759624-1682531537098@3c-app-gmx-bs05>
From: Frank Wunderlich <frank-w@public-files.de>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
Subject: Aw: Re: [net v2] net: ethernet: mtk_eth_soc: drop generic vlan rx
 offload, only use DSA untagging
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Apr 2023 19:52:17 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <61ea49b7-8a04-214d-ef02-3ef6181619e9@arinc9.com>
References: <20230426172153.8352-1-linux@fw-web.de>
 <61ea49b7-8a04-214d-ef02-3ef6181619e9@arinc9.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:m4OLvO2aGfpIPh1kNegtBhLwbWWrwPKhw5jaBky6DTbTjIL8iU/9nCzT6in+N2xsvI+Ds
 /3WbIowJLyskcLJlw5Av77vSAEHyRpHuUJhb4mmvNHbNFUWHGGugfnL95HFeFwbsKu3i/h3qrK8f
 x96Pe7xebX75skDhOsngadfjHoWL3Hu+midtv2HOaCQ1BWgbtE/s3X18rB9RXQuBZaNhl7LFnoLK
 UNO6SUdeHM847TznfMX7LlqaaS2PTqznByv/0ZF03zLFlviZJ2Mx+PZXySbCPxzSqnPm+t16b1Pt
 XE=
UI-OutboundReport: notjunk:1;M01:P0:oZmXxWVFW/M=;/m8bA08ftBuXup6g9QipcJDbYVR
 mUgKaInR5ce2Af58dfc9nqC/Cv0P59JQZ2hi5FMU5UAXSH1dxjjMdCfSX7P9T+esNRACuhQ0k
 R6iJma/JcYDbnIyuNh6BI0u9ebFDbMBZSE+piTnzMvb1RJi8RbOrJZvX7o5+mV9lOeCjxNeE/
 qvPrbWUF4gcikV4ODz5Pjb2rdPFOC0filGeWqvYQn84m9quZAxX6Jy+w19gGbng4X+AjkOPAe
 hQNAeua91Bmjtbehj9hks6rnlNw2Ld4dgNHaZvO25u0uQJ+sFsaja0ts3ksCkx53mzsDaOAfW
 ybRWPdC/J6iQyDgWZRm9fxnKRaPDZmJRCxVYHw3gp0uNGsQmO733nBASHffS4QWDYAzn5k6ES
 r2CpHfnYOG87WziymO4iAK6/RGvNcIDy67I756a9nnag5nCDElk/pRigjUGGfBlFLq/VEJCN7
 5zJ9w5cffm6sQGd6xgVG7so1I9NJvMKMuXIifbmEinNQatBDHUIMnzLTkiE9uo8j+FoEIPjHW
 k/BhEee9BYCb6WhPHUlfyIVE5QQxDscNU5OLnwapDirQbmjidKCi15aEdhtqwxpIsFwABi6j8
 6/hR11iOtMR2/+LUAOBFcJZ9IFcKlLB9qZ2u9DLQvq+rWyFzBT7eiiaqQinECLkM5YXl+lv6u
 dH8EoVEKXrspDPqOkEAPnwaNDcIcc5uzAIGKy8d7GRw1txko8S1B86FQsM95OXTZAnWzcoJfy
 vTlv5Gk0y0Iyn9gUc277ELYljC+U85M/ZgC8lpTYlKUPUug67nfmJ1CYSEvXGTveZAd0RHP/o
 k4z+RwdZF0g033BGcC0QewuQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_105240_860269_40521132 
X-CRM114-Status: GOOD (  11.12  )
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

Hi
> Gesendet: Mittwoch, 26=2E April 2023 um 19:25 Uhr
> Von: "Ar=C4=B1n=C3=A7 =C3=9CNAL" <arinc=2Eunal@arinc9=2Ecom>

> > tested this on bananapi-r3 on non-dsa gmac1 and dsa eth0 (wan)=2E
> > on both vlan is working, but maybe it breaks HW-vlan-untagging
>=20
> I'm confused by this=2E What is HW-vlan-untagging, and which SoCs do you=
=20
> think this patch would break this feature? How can I utilise this=20
> feature on Linux so I can confirm whether it works or not?

oh, you mean my wording about "hw-vlan-untagging"=2E=2E=2Ei mean the hw vl=
an offload feature which may
not be working on non-mt7621/7622 devices as i have no idea how to check t=
his=2E i hope felix can
answer this=2E at least the feature activeated on mt7986 breaks sw-vlan on=
 the gmac1 (without
switch)=2E

regards Frank

