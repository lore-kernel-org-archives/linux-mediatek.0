Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D773DC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Nov 2022 10:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WccujCCQpIheOZ0UETKW975TLIiI71rRZqTn9o9i6Q4=; b=D9mYynJBn6UXmM9E9TYGV1kAf1
	ya2vTZPAywq87O0YniXutjCvNp2oozJKRVOxo+AHRV71FLaKiluYFsv4iZg4X5n1SMGEVRnLDaxcm
	YE33wosdDH3TEwHcD0+sKCt5xacafch7nHH4zSqPokMSzjQ+bazJzECJ5JiwlhLNcQD8VsFJ4w8pi
	OLq3MrCV+FWoUjQthYAdEEFW/Wb01dHOK9IGBhTR3sctVBkwo80PwsF8iwnaQvbHRXJ082vPMpbZp
	873yxAz+ocSTuyrvpSMknOuZMGAUUs/tWWeS25J5ufN9YyeTInkJpk0eDf5cUU23W3b9RR2wOjK2O
	hfIsOdJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opoHO-003z03-6d; Tue, 01 Nov 2022 10:13:58 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opoHC-003ymp-Hp; Tue, 01 Nov 2022 10:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1667297618;
	bh=EXo84VvyGFTmnUtTrG/jdPf51mIhHpHMuo9uKvlgcNU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lzdpyZ1ZS169jMbRDTgL75XNWlMM2oWp6gL7Q1PQsKPnFMYm0rYRtToZ5Zak5tAdY
	 KZlEUSD4/6Ye8nvFoYFR8YjjQe7I/hQm7c8tzNMOgQuD4jgGXkzZMM0TCh1qKZDYVz
	 1U+FYiUoOQE5CP9RX/EflIbfb8kaUuVZF/vOUcqAB+kX09mgIF/vbZGYqnuz7UcE43
	 QYr5WYnPQw6U2Ko44aL4YOW6jKZa+iDg3C2a1iFRuXOfVs7alYhzxOCxtHvEF0jSM6
	 K6Wahsp8ZRUoXPROUnDJ531uOU+OXqxd267x2/vdEs/gXM3u60qTxagSZ6+RZ4Xm7h
	 y6J15bBNbJilQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.78.243] ([80.245.78.243]) by web-mail.gmx.net
 (3c-app-gmx-bs25.server.lan [172.19.170.77]) (via HTTP); Tue, 1 Nov 2022
 11:13:38 +0100
MIME-Version: 1.0
Message-ID: <trinity-5f39285a-b188-4b6d-a5e5-d1b3439f9506-1667297618702@3c-app-gmx-bs25>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Cc: linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Aw: [RFC v2 0/7] Add BananaPi R3
Content-Type: text/plain; charset=UTF-8
Date: Tue, 1 Nov 2022 11:13:38 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20221026093650.110290-1-linux@fw-web.de>
References: <20221026093650.110290-1-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:vTLmDZVdxu/OhxXQdTtnUrTU8yVjVdP1AJqlwGeH25SKTftZwcYz5EUJkxLnSKt07UwBO
 AZZbIwz0azU04gsTcylSqO6vpy0EJMzg5tGR6LU9P0Fu85IZkrE5+GvcTrFINcfITW6IQHBLSBFa
 Ft628KAFdy+1Uggnv23DdweVKm61nlYoU2BK7H+xx03l/g9HHxmdfjZz2g6JqY6yhL37vjh5GhrX
 tADFjdkiyYWiCkiglzb25HY2ojRF2UaNFGC60wf2sADUuXgTkxAaiCcrJEoX+IogGJD7XYOWH9/G
 OY=
UI-OutboundReport: notjunk:1;M01:P0:NZk14boAfX4=;LLalRtJ//zvUVwCWzAr8k322sTN
 QrXMtEJIgtdByG7Wy3iKadWHhDzcH+8JJky+xYmGl0x8d7JUgaE1xOa5OHwcdWkzrpgCU105m
 x+XuKXuKkw8v3nE//WDldWCE95s+VodeOkosiVeZsazU+t0+UjMHnVUK9zjlJRUmbE3BGi8uD
 qTKbcussMJZhIgyY74RI4oQhhgh3ic6bcznLXJyzDNDNYzbVWG1qQD6nmvwUHNBkG5O7u1W4s
 gpbq6LsV3vRVxzaxXMK6FX/CJzhaG05bDBay5eBlzdtJathrutqoXncnBApWT9YF3qPjegtgN
 keK/JrUyx2435Ql+HWtGXtTy4HN+b8cUyN0KJnUWSSLVrDCJ4Q22hFyMtFqE5L3xyHimVRpiL
 NRlqJvWjswaiYO3dVQ7Wr3vQWCDz61wI5N5KaCRjp3D5YQPp/kulgfwdOarMuIJwSJ0zZyqB5
 D2zgo86SDhkazQggr8yhqWFX88pHbaNo5Dy1KLouTqIqvg8wWY/A+GLhi6qyoFx3cjW7CJ5Ir
 ngMQ4POi1PhV1bbW5vos8SZhHy61WdivCE7Mj59uV/0ru8hcchBfZ7kagu6rlvcSX1iQuIsdi
 WHE8A0LTkJfGQJnofSzp3o6QcmITBU8NLb0p10n8VJSRv2atfdq4bZPw6RQTaZiMvKAddG3Fr
 +5PxhSLaLwqRomNt0M0nLEPCqBk/91Zgv0PwKo9YDhmHYd1cZnr2f2UKP+yoEl2L8VfHu+jP4
 Spe9FgBMgRA7Ys0Ie1FeAIur0P9rIuizXj71uNWWP4Pn9azh4GwfX3lEY7FRqoGbNRm/hwy7t
 1DHP6sjZ0gMx9urEAFh8zluDt+JzsuX8pectH+UDZotTs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_031346_993365_8946AB61 
X-CRM114-Status: UNSURE (   7.84  )
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

any comments on Parts 2,3,4 and 6?

>   arm64: dts: mt7986: add i2c node
>   arm64: dts: mt7986: add spi related device nodes
>   arm64: dts: mt7986: add usb related device nodes
>   arm64: dts: mt7986: add crypto related device nodes

maybe they are ready to merge? mtk is working on mmc-pinctrl and i work on the other comments for r3 dts.

regards Frank

