Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179F0C54E94
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 02:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRqabsnyUFGuScHCJ+vG+5iY/BKBmahVGELxsL9cqVI=; b=SRIO+ILOdxRiIojIeoqKWtxxaF
	d46cWmj32KWw2Y2x6kEGQOOLBPxZ5P5GVLZM4m+j4l04FnIAMNnxN9rrA5oMPku+/bJ2xDZW37mBA
	7gL8aUbPaEfAx09qkN/aWOVpoq5nxQbQ9Z2ksXlXL7KIX189QVpZitxtxyc4us37fYNtmFZWsTki8
	LQFcEgMmITPEnErZ8AeXJHbc95VyIvcEn2LAoXTfu5+LW7lj4AWjergSrWs8JddUmvGfcagtnq5hw
	z5GbmgzXzhNbkBZiCZR5Yf+Y0p+cWQ8S9BySTbMbq6FEjjfqpczCJqrHcHBtLfYcqBFRT/GQSpT60
	sIJUpfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKryX-009S5K-7w; Thu, 26 Jan 2023 02:26:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKryK-009S2g-Vb; Thu, 26 Jan 2023 02:26:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 06B1661588;
	Thu, 26 Jan 2023 02:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545B6C433EF;
	Thu, 26 Jan 2023 02:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674699999;
	bh=hRqabsnyUFGuScHCJ+vG+5iY/BKBmahVGELxsL9cqVI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uOek77d+d4DOP0WXkE3uKIY7HGNkI3/B+pUaog8LdAfohV8dKQ/aHbC7R9zq3p1XC
	 P9YUh9dlaTAAqpqBMoCzJjxFIyWgmdJ2AMkKEunyn7zP9ioKzE9t/W2Zd+elhxEQl7
	 pEd3lG5q8HhpWeBj3/bj50JFeyADHfcpTFbumiGI+CgcOoxLWvcgebWAUWmfAdCiiv
	 FDe9sy5LlYXhe1dViUHWmMJdA+UjjMLhrDJf/y7QVoyIpDj5CGHJjI0XZv92dsfqb5
	 xvmR7mw5MmN95eSYT0OqfBtLaO88CRDR+zmXxdtBwB9rHJ401e/ILICWoc86jrAger
	 Vs1k7y+42bSEg==
Message-ID: <2fb3e7dcbedf22d054e3fb48596d41e2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3dfa96e2dba814930445e8dcfae97e89.sboyd@kernel.org>
References: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com> <3dfa96e2dba814930445e8dcfae97e89.sboyd@kernel.org>
Subject: Re: [PATCH v4 00/23] MediaTek clocks cleanups and improvements
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com, wenst@chromium.org, johnson.wang@mediatek.com, miles.chen@mediatek.com, fparent@baylibre.com, chun-jie.chen@mediatek.com, sam.shih@mediatek.com, y.oudjana@protonmail.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, ryder.lee@kernel.org, daniel@makrotopia.org, jose.exposito89@gmail.com, yangyingliang@huawei.com, pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com, ikjn@chromium.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Date: Wed, 25 Jan 2023 18:26:37 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_182641_081771_C2510968 
X-CRM114-Status: GOOD (  10.98  )
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

Quoting Stephen Boyd (2023-01-25 15:09:40)
> Quoting AngeloGioacchino Del Regno (2023-01-20 01:20:30)
> >=20
> > * Some more spare cleanups here and there.
> >=20
> > All of this was manually tested on various Chromebooks (with different =
MTK
> > SoCs) and no regression was detected.
> >=20
>=20
> Do you want me to pick this up directly? Or is there some mediatek
> maintainer willing to send me a PR? If I don't hear anything soon I'll
> go sweep my inbox for mediatek clk patches and start applying them.

I applied them all locally and will push out to next soonish.

