Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C154CC4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 08:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psAl4xYsagSw7D6c6rdl/M3zRR70g8jwLLUhLUJBJqU=; b=ND5TWyEbfouGDvYCNKJMeE/ygB
	06bc+ptT0/npRju1Yz6lCFaIo/RcJw8Gtw0mcu00GS7s8zRRRcHo3XiNnmLwFrH1bd8L6xU1qaaZ6
	q+coUpLQ1J5FwtfSUS2uy57E6AZw8kQoLs8wATN0aJQfqGICDQeRgge8HH8Lt6uarq3LiZbFasc4p
	rBTJUCf2eXHkGI8/eN1A/+8ejx8IvaaQ4bkoVTy07YQRzylzU8y6F/71tyfxNs5ufoHLFeOd66dwB
	fCBhOEpjnjnCRyiY5fNOA/m2xO2IzhQQVkfiulcnwUC1/AiyR3HtKClEFv5irxQUo2J/Zj5LBSsck
	8nIjVMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oraiK-007gfF-FG; Sun, 06 Nov 2022 08:09:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orai8-007gby-Ef; Sun, 06 Nov 2022 08:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=psAl4xYsagSw7D6c6rdl/M3zRR70g8jwLLUhLUJBJqU=; b=nfqyVKUNZM97QI2Dp9dxp7M8M6
	G9yNiBG90JQWW6H9Y0XxWft40YcS23ZG/ZBHRIST8bBH+A4If41g6QOI4TlQOK5ksEyfm2KJPO/Uc
	757kwGf4lYgQ+9ummnfOcWXTh5p5Fpz2E7XUNxpgQonGhLe4EIKP/dgsvU9oYShZwRCOVsxSbi4Eb
	4J/1+F0zSjUhtQTVuE7FbdQ1wqTCuZX4Znh0/tzxwttwUF6tHKLswqk3yf4JhQL8L7hZ2MiYP3/Hc
	FLwkPUT2Gao7df07uDu0vGisU1CPAb1DTlLAxMgWYBCikE6NOT5oUY3TM62Cyb1tJkAiJCmJuCcml
	E0934vQw==;
Received: from mout.gmx.net ([212.227.17.20])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oraht-009Uq8-PL; Sun, 06 Nov 2022 08:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1667722110;
	bh=psAl4xYsagSw7D6c6rdl/M3zRR70g8jwLLUhLUJBJqU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dRjipgN4EbNkFq7tBqeTvNTbZq7vuPIyMWfkHIgZsw7gMJzKK4kiUBR3G9rHMnurS
	 QGKL2HNY2oAD1n6RzRBlbb06JD7Tlj4VyJ6w4qJVL3Ys/tNodMgbXWIDaFEi/ezfrU
	 3YI4igH1sDiH6ZEMaAn/dNHdT0Px1K9CemNe0zPc21UDGRGZLVObSzxj2upb5+GMnt
	 ZMo/Q6TAVxqwUcSUdgJmKdjoWUl8UNH8oa+mPyf+83Fo4mharKTsCQumreaMe8uG5p
	 5dNkn/g+VzXoPRc6sFAR9ID0z99UypA/y68I0EtyaZYR7vIkxvo/IsF1Kx7cpgT4jb
	 xUUYWLLZaysqw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.79.199] ([80.245.79.199]) by web-mail.gmx.net
 (3c-app-gmx-bap30.server.lan [172.19.172.100]) (via HTTP); Sun, 6 Nov 2022
 09:08:30 +0100
MIME-Version: 1.0
Message-ID: <trinity-f782418a-8148-4eab-93ff-dd213cf05fd0-1667722110396@3c-app-gmx-bap30>
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Aw: Re: [PATCH] dt-bindings: pinctrl: update pcie/pwm/spi bindings
 for MT7986 SoC
Content-Type: text/plain; charset=UTF-8
Date: Sun, 6 Nov 2022 09:08:30 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <cd2e3ae3-6a30-f6cd-fbbb-9c5c6071fb9b@linaro.org>
References: <20221024074349.7777-1-linux@fw-web.de>
 <cd2e3ae3-6a30-f6cd-fbbb-9c5c6071fb9b@linaro.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:fGz1/KhXbeWnAd5zd1PUJkVWwdG90UbiMcUADj/KY9NVZ64iNeWLh5R3z4PuC3tn5idoq
 OnYe9WSqSZCcNF65fbJyQ9TB/5Rv/lsh7lS04dncSEJ0BxhauWps0hrR+aOIcLbKwVQJTXnEwhAk
 k1Psgh39gkWRR5FNMKXX/ZEY2Dky5Lv19AXjUnSlYlwsWqbLErtMJ3jeqbnby66L5mi4bheYRLPg
 9G6LiFiiCdjAxs2sJvG2716qMmzCEtLy6Ckp8vq0eP+4Btj8bhoYp9xIWKJUIu/ij1RD7/+B3E1w
 S4=
UI-OutboundReport: notjunk:1;M01:P0:8nvazYWkGJg=;FwFz1MwnXoUa4YfGZurYexOPqXw
 CxVMnOUfJ2JK0FMvysjx12hyt8/tpoMGfvhBvgTamqfzFMZJJuQ+L+wVR6DjKwbvfEHKVQQi6
 sIUyAQjB7gOrAWm8vnvm+NmcrxbrKQvxOMhhc/9sFBUh7LmAJCsMiTBfnDCQidPhfqDR0Bu/E
 zrlJuXSNon/0KRJ064M0WupyXutK5dqHsx0isz8Qw5IUbiL8lbHu48g/Yzjp4hhefvGp+oqJ3
 6dIVFZ5bebaznflaFKrlB4rZQ6dIrMcPobsY/nAYA637tPKmPiOczFhDaf6m1E5mUl8v7CaH1
 F7Rq0T7wlEb/FUCePeCqKoeu8BX6c0TqL0juWvSECooWzVNrsMcWAq9IWT5sHCwMXuRDKTLOy
 abIIBwOSPjB6mOeflSyy1LXP9S/OMjBQu69MYdtGMVm9gPBXogcmoDOher1FgWhKkOs8Z/4LX
 JCpra3G6xZQ7I2zRWYpPFj6jCwScX41SNw5VSdxIfQolp47QcOMjWIHQhf00LmlzemkUTTqVN
 oGxgQ/fGwnYfcMZx81xbI4GZOB8GmCQzGpYNFcX8yPk1RWFT2xqPJJhyzMmmW3yDvX1R7+jQE
 Mid92tV6aofbLxOxPO1s4NFvNGpoNiVBa4U4fxl+dMyGZmlrQbZiRv9MowJIuHLj4LqFK89he
 5ZCahZLDPUBW/6dyixESHu2pRm0UAHfq5qLKEIM6Zjl1NyKA/W7BS0+V5VDoeFzgInY0iCT5i
 KatrVDjqzJ1jQY07VFVkdCIyOpotJpJCkkZ/Bk1LSYl5U3MbOFZi5+GSwk1VgwpwgAZ23LmOS
 c+CEq0OD9W4n5xIQLcMFs6Ww==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_080842_305269_9AEC6F25 
X-CRM114-Status: UNSURE (   6.13  )
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

included this Patch into the pinctl series to have binding checks clean

https://patchwork.kernel.org/project/linux-mediatek/list/?series=692462

regards Frank

