Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556FCC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 10:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjttPaOj5ahYCmsN5Sn9bXCLy8Wa4KT+ItxHbt00cDs=; b=dtRdR2FrRuI2ZO
	XMWfYpEvu/ZMagCmjDiwdwM+qh2Evwa/nfUFmtiP4nS4Jg9u9RekE91XOpPto410i1gdAuphNTDpl
	Fw3Mjr4uFvm7ZX/Q95fOhCP4CzXit2xPQ0QPPOsIGfR0bDFZyEwdZX/6xkCPq1rnFLn0ZfzYSa4nR
	WB0yFBljfBFDfOcV3WAbAdrARnVGn19mM7u/03gdKZ0rV1q2CUpV7Kci/lydpDZAAjHRjT+n7FR1l
	qrhdvBUvyfHXoa4tmVyBGdKCok5vnY8OhWM8fFfcjg8ZVSW/YcMy+IzjNCYIL32WpY/ncvdEy1nLm
	HMlzE87DsTKW0Z2CthOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmC9G-00ADgn-Ai; Wed, 04 May 2022 10:22:22 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmC9C-00ADf4-RE; Wed, 04 May 2022 10:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651659719;
 bh=FMqy0avoQkJTPHIwxT5BOwePV8xTDg1i/a1jeG3qI+Y=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=a/tWSVIXXDy8jbJh8kiUKjnq16C+BCvfq7Pht2bkf4Zaa7YOHgg6uwuP+ohQQTy2S
 ZVZgL928GRPcDxohNdzc0IlhQuoVOdfs4oSZezf/bYEkqLY4f0gdYCRt+VPfNNd2AG
 rDI4fnq2o+3fGzGtURHnVMbQDAAQlMF3tt5mfUSE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.79.168] ([80.245.79.168]) by web-mail.gmx.net
 (3c-app-gmx-bs42.server.lan [172.19.170.94]) (via HTTP); Wed, 4 May 2022
 12:21:59 +0200
MIME-Version: 1.0
Message-ID: <trinity-050a20ad-480c-4464-99fc-95a3ce2eba11-1651659719023@3c-app-gmx-bs42>
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank Wunderlich <linux@fw-web.de>, Andrew Lunn <andrew@lunn.ch>, Vivien
 Didelot <vivien.didelot@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Aw: Re: [RFC v1] dt-bindings: net: dsa: convert binding for
 mediatek switches
Date: Wed, 4 May 2022 12:21:59 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <d29637f8-87ff-b5f0-9604-89b51a2ba7c1@linaro.org>
References: <20220502153238.85090-1-linux@fw-web.de>
 <d29637f8-87ff-b5f0-9604-89b51a2ba7c1@linaro.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:6GHTHGGG/fWYaiqZe61bZK/+zhObG4vTyf/KfTx7otfQ/biiPX6LU4lOzmXX85G4UESoG
 4hslvlK+fUX5CDwywLxRK82Ho/brj3SKPBTNOtB3qzQYfRzs2ZQDxs5e1kr6mpTzC5SuSXpGjf8h
 v81wIH6gk/s6iFE2OEcFySVDq07v+eBsZmUbLRNuTFThc9R2BtjvumXHM73Q2VCYj+clGLdu9x3Q
 nPNkkg//gwL55I/o4XoRrYf5lPV6M5JW90KB2IASWCrPb0F2dblMXebz7OhiDWgRd2pC2b2pLWaW
 Es=
X-UI-Out-Filterresults: notjunk:1;V03:K0:fzNN70NOehs=:o2y6DVX52shLGNI/cLV33n
 3HqYzOCruL5pfhyvZhdfoBxlSVtQofMnCzShO6uS/MQCk/Y/BfZaewZnrVokYmzRMyYt6lPSs
 HM1ACDcfFu2zAqSFuuVzAOeeqbgO9AeR/m6tuJCRivAJMPbIaYspcEpcu4Mkp6sBxc+MDrPau
 5C1hC/W/XiiGSnsoVXCadcSPZj7RZ38DnSfP9U9dBb/9RzWb0hTAhZgz0vqckwRdoBOkwP1eF
 re1+1RC7g1YRw/OSpzEpj4pewVnYt+NKWAX+dYnyanY7T3voCxsYqwQjdY6P+4Sa8Az8rXR/8
 zYg1anWPD8jy+h6sPfJ9Q7nXew9tBBJPIDoHx3GxBvQuxt7Cm0Mv1Kc6NbZe9L0Y1/vyUnjkl
 32kkDd0nQ5IgV3V0Kl82+4RmXIGS/NA9YG0bWszpVRVzahf44rLZ4djNNxc2M1PgrZ4/hqAAe
 +Q+CjPjlDOVs9tRCKG+i1frcFmWhH8zChohoXI5JnoJC+OhYQKyYM749LzBjbBDH22fEXrAb8
 +qicqfFBhv+su5kRv67CPgXn8eBsN0GCb7sN1lpGQl+AlKx6C3BpaUk2WKy70+cjIbNVOxXN3
 3OLooidyH8LontIKlXXN0BwUbSMlhbua7Y8M4QnLv3J0xizz8rjwuNANld93ZofDT1rHHhF4H
 tQ8YKCIILPIl245jrAnkwHPMMCwwHW7X+b/ofRpZSK4PE6Ln4q66igK+XM3KoIMnaaB+XqX8F
 qfcLQ9+/ljBVnDq5tXlTGJHTtM+cV0ceNLQ9ixyyTdCoMcFhxH7DraCZyIefbMtA0iXdbViQh
 JSQ0Yrn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_032219_381933_07BBB0B4 
X-CRM114-Status: UNSURE (   8.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

> Gesendet: Dienstag, 03. Mai 2022 um 14:05 Uhr
> Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>

> > +required:
> > +  - compatible
> > +  - reg
>
> What about address/size cells?

in current devicetrees the address-cells/size-cells are set above the switch on mdio-bus so i would
not add these to required for switch.

https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts#L190

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
