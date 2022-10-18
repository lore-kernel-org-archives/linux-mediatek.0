Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C47FC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pj4Ijw7qmM4UnkOosqO08UPd49R83whOKuTqpQBOAqY=; b=I+JNPM/Dpyb0Z0lPbIuWRiCAuo
	Zw4eb9NyhGeMSPZQVGyR02z91+BV4weDna8ju0mKz/fGUegt9ApqELeHe3X8zwf1fn7tYvVPPBliM
	A9FQgt+6TWQnKGvjrvPD+wk6E2SgkZqpgMyaJQUpwKKppAhikBjxFPWJKGK+clUqQMLRMsdFLRBjN
	UkLlZFWSD4OnotkQrmyLfiklnD+IKkFMinC1eiaJP73TdHEaeYDrVL0lvuFG2xN4J5WWOjv69FXNd
	OKDsBc+8DjfstNB/L82M7K4XbEcJ5loU2NXGMPR5PEx1N521611sMYD6+6bdt66miFy1QVfKb62LN
	QbfbUwkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okoFm-007SZB-KY; Tue, 18 Oct 2022 15:11:38 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okoFk-007SWn-6w; Tue, 18 Oct 2022 15:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1666105879;
	bh=dl9lGu7SPkUR7djUfbzQOkXUdnM7a5s07lDMtc/WNS0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fMUdfT8RFUILRE1z/CIWvQAdS/VIKxUJ2XacIrogzAPY9C3Us9qWncNmwbcuOcj3Z
	 UWJdwzCoX+A73OuTThmwxvRlKwYxlN34pvjq8k+tRZ072/caVjQGTI0EelJgJUseba
	 eXPMmvbUisvPrJICOZzYFmtXTx+kEbzFUacxjMlI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.77.116] ([80.245.77.116]) by web-mail.gmx.net
 (3c-app-gmx-bap38.server.lan [172.19.172.108]) (via HTTP); Tue, 18 Oct 2022
 17:11:18 +0200
MIME-Version: 1.0
Message-ID: <trinity-ed7d279a-ec3c-41f4-95b3-8480790f82fd-1666105878851@3c-app-gmx-bap38>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Cc: linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sam
 Shih <sam.shih@mediatek.com>, Jieyy Yang <jieyy.yang@mediatek.com>
Subject: Aw: [RFC v1 07/12] arm64: dts: mt7986: add pcie related device
 nodes
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Oct 2022 17:11:18 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20221017104141.7338-8-linux@fw-web.de>
References: <20221017104141.7338-1-linux@fw-web.de>
 <20221017104141.7338-8-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:XHyKXEmfIp+8IpN/GFU3VJcE1uZUPkFWh2/ja95RgN021GmCn2tf69Og4s0kpGPaSwvcM
 Lw+xD75ClC2usJFimbmiojo70K+xAYylX66hpfjZG7RQREYFn7CRdJAYGLecEAF59pDUGo1FEk9j
 QztYhPithTyO4GAXwPbC1uwdn/any6M/KYmiWOliZ4UeIbVu1rJfimxnIORWEKgyhFPHZD9SDZU8
 4CrwnZzBdqUNkURtXcZsxSurdn/riHpLbe+f+OQMZk4dqinjhKP/w86kQw2aROYsWeUycO6/mQwM
 cY=
X-UI-Out-Filterresults: notjunk:1;V03:K0:3X1DRKyYfB4=:0SYjpc8rCTHbnbw6nQ7E54
 CBut18XBBj4vKs2imxIn2lLysdZA+0cC2kfy+1s91yiECV7U8kr8/5K7hgW2VOzBZd+vEGJj5
 6tO1Ft4JWAAJT0LmCL9ECp1vpWecPhE4TuQp7lEcDNBdP5ji0RD+aoIvZj46R9bLtrH7j3saU
 J8HwBB3bQV7BgaUcrdxBlptjGjz+ovo8avYv61Sq4n2lbgUINb4bhRc/bu4EQX1EGim2sEh0h
 EGQZDqNR0sc16SIDY1nlXezIx6WOoThUxe4n+Uydp2PIoZ79+7mtr3c3WY49WI6rAn7z02AII
 xv0cPLMpzZuVkBKYrBW3ak5GzNkmSBwRvNk+iC6EcuSKFvgEKapyNi9S3sYYLVg/fEtGabDI+
 RjM1OaCAt4J4SXDGhCINBRoadl1tEfcOXgm0/45WGFxm3vIprAxHqK3s+NOBP2310MFi5HyTn
 ftrcVS6a/J6DRtXePxx/t4ohF/RaPC7jWKACVq9C8NkmzOqK7jSjIevAay58XizqMsR7/J/64
 N5ZbBsGxV5l+uAmAl1m3cMiGCYMRM2dcutiYkZyoPhQRlWlt70DtPnWTOo2Vhi6gsSTmfsWJH
 bCk+Q5H5jG6igGYbh+ptAzrnaevckmP/KxHN+FgvGEE5DyjxU5bjN7iUa3A9n/diTu4sEGPsQ
 /6nCsqs7z6M5IqzltYl/kLbug1wLanb9nu+14dOwBvEN1V1lKYUf/QlxvErsNHsKvc53zPwD/
 2FAJvuPcZRjR7SUWPvNnl5XtloUtBdVgXDIfD5BUZDS1sDvwK4hCA6o63VWZrcCQB6R+EmBO4
 jIykSTdHxBKGyRoE97T1dxiHwdb+GIdXPuUXZ77l9QyOvZHEptXeABr2eRCOjx+kxgEa0MKjo
 Vdm4TAP6H6XhVAJ05ST3r3LNbz7b+pZzFpnSy9EufZ3I+lNzO6mMgKX9dJFT0ty0N019TvMkN
 n+avyJZRGGPCfUyEC8zDftEY/K1YiTlHaSgbnmO7Gyvz6VuE/TrHqB0zhnaqX0ImRMiH1RJCv
 o8ydT8LZxXNHQBoplXOecQJMhxkFzpquVDOrMFPykTp4Zv4hM31J3NlEuWcOFvy/M9pTF8pmj
 Cvsdqs4eUNuAzyMyIGC7ovISsVDpsm2XIW4naxO2DxjJCsObGOGxB2BcS0egv3T5THk9TXaMC
 K/gdKKLVTJLM8A2g9rWZsGQPPH1LONrSnciZqbZ0v+JuRacBXqDOj+Lzy+dGZ5kGvheTq8c/o
 XUVudJ9h0pU5oXMUYVkgVxm9SHQz2Q9ZVAQqEbROgux8KBIWbgFiaip9lyeBXPWh77jm9DHa0
 HvkUAQ/R
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_081136_812107_B26FC758 
X-CRM114-Status: UNSURE (   9.08  )
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

Hi
> Gesendet: Montag, 17. Oktober 2022 um 12:41 Uhr
> Von: "Frank Wunderlich" <linux@fw-web.de>

> changes compared to sams original version:
>
> - add clock-names to pcie node
>   driver does bulk handling without names, but binding requires 6 clocks
>   and not only 5 we have

i got info from mtk that i can define clocks in pcie-node like this:

			clocks =3D <&infracfg CLK_INFRA_IPCIE_PIPE_CK>,
				 <&infracfg CLK_INFRA_IPCIE_CK>,
				 <&clk40m>,
				 <&clk40m>,
				 <&infracfg CLK_INFRA_IPCIER_CK>,
				 <&infracfg CLK_INFRA_IPCIEB_CK>;
			clock-names =3D "pl_250m", "tl_26m", "tl_96m",
				      "tl_32k", "peri_26m", "top_133m";

So i only need the binding change i've posted in this series and have clea=
n dtbs_check.

if this is ok, i change it in next version.

regards Frank



