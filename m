Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B57C4829E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 16:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSiKXk9mwRyqBgmGtVOmSvPrewMdLEDWzRb5bIGkXs4=; b=H9Wf55g2NWhk1fitnKbosnXrhm
	Uu0Sn+AEMdTrvuneFPd6d1kIrFSpxaJaNjMteSUiQM5/EsCkopws5QQ4O6QzMFrKR5IsVl06QnTcw
	umrloAUHlgK5Gn0YE7o7ehnjdOGa6WHZ3ZqdC61NUSWaLjI0gs+DNwnPA9eINSUkfVDUcGYSqY+fH
	SY5y5ymYqAq0qskTFhjDfXeeXnVc4b8cpsH0+sSfar01FE2vcxQpkDB6E55fxcL2V8tswGb83LeW4
	8oPvOPmTfulOeJt8hzGDKqAAOGSXPBshBPhQb+qJ0iOX6Et773C3ycN34Tz9aO+C+28CZEecQUhVn
	qeHkGdsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raegy-0000000H0E6-0weL;
	Thu, 15 Feb 2024 16:34:32 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raegu-0000000H0DZ-1PP6;
	Thu, 15 Feb 2024 16:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1708014857; x=1708619657; i=frank-w@public-files.de;
	bh=kSiKXk9mwRyqBgmGtVOmSvPrewMdLEDWzRb5bIGkXs4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=DIxBmDRJ5how7NJHXrnMVdxxO+pWkraJvQjXUV4u6LNd+/r8cU4J8L8PYaZtKUNS
	 D3lT2u+EHzEplKf7io5gZBpX4tcQ9+KejLNNKndzbWgBVHkmcme8d+RMk9yRRlduK
	 8vj5uRehSyn87mqKfeusjgAOjwi0/c3Lxh16VQr5ahXLrqKl8bIEiP5eESlGKyxPf
	 NCxXSZfPSDQWOU3mP7xz3jZVRuRbxltm+zAv6eeBTKgNBl7OAlkvbOpaZWgMgIKqP
	 M8JkT7B8ysujVQwxbP3OaT4IaIgCEu6iUcCnzyNWyFFNomoaEN8A5XzztjUmhmW7f
	 lh92twtUXJ7nfZCM/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.150.201] ([217.61.150.201]) by web-mail.gmx.net
 (3c-app-gmx-bs43.server.lan [172.19.170.95]) (via HTTP); Thu, 15 Feb 2024
 17:34:17 +0100
MIME-Version: 1.0
Message-ID: <trinity-008b2d85-9629-4f03-92be-0b4027edea41-1708014857046@3c-app-gmx-bs43>
From: Frank Wunderlich <frank-w@public-files.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Aw: [PATCH v2] arm64: dts: mediatek: mt8186: bpi-r3: Convert to
 sugar syntax
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Feb 2024 17:34:17 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <8c10c4bf701583d015506712ba9239dbc7547426.1708003159.git.geert+renesas@glider.be>
References: <8c10c4bf701583d015506712ba9239dbc7547426.1708003159.git.geert+renesas@glider.be>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:+CuRp+zl8YPKjgtknrzY5aLUxiBRXLXiWqWgSEVvtmIlWDLH3VZT2b55AdAPyBJcKvV1N
 1jdkjomeULFmvyYlTAQ003dk+8Ajo+TNQGyWI+uECfTtNmHX+CPcBxU5ZkNp33mG63T/XehOZnif
 7a3n/4fS5em75FOI0c1pwIPBaEFRB6fMq5UtNM1prKcGFMVmAlm0LbYiJFG9fqCVzCNlaD10z2zs
 eCSlAsAEmOrliuAbasG+cI0RipQHMo4T0YkpC2PyKKXFvetCcg/OaquCmwDILWjAxNlj53TyOXrR
 ZA=
UI-OutboundReport: notjunk:1;M01:P0:0ijNqikVSfA=;rUb8Tg80I/QV7AJNEalajPGQMhq
 mFmxbeS4TTD//u0MZAvvs76UW4GVrueWPA6DuxM6qP2H1F8T3aS/HyYN484Z+HBHSSBcK+RXh
 hhiIq80yxFSR/eG1ZifchYlnBmgIObcDGraSomZjHB1sVGswcDA12VIVVMkfEAQmFKZZGvuGm
 Q6HOk71E4+dhLpBcEIMi5qazXvrLW6SorBesRM825F88SprYWMQilDeGIJu9WJx+vgwgvQAHs
 oXXoLtAZKNdLfi90UBwbyydBlzpKLV8/z5kEhGOXz16kLTXD0HnJn6ai8KBpLm/ZmEtFGt895
 71RsJiMY8WDYn7LudAz2+FJgbxUwknIEWYwKfar1gI7GcgC3Ei9fYsV1OjrzMtmH0KMkIxGV7
 xSbO1buYGJW9fwVk46OJEhULQgNvo0EeFRome2eo/pVXuDjV1R5arbWKIL/rIeYdGCFhKAwHJ
 GqB1ZD2MBUc7Pc13RNhENE2Hkc75TfY6YXjPQsY2PgHLs6iCtyL0HARUZdJ9ygUfyqO4NSims
 bblFZdp1+YbooQLkjHjKF4bl+avlmjaiszJCbjTg5y7D63rbkIvRWeV9ILKBNAqZSTQHZq7c8
 tLXL5uyFl9rODpLLPYxJbA1tiBhkQBXnwGV7dTRM3jgoim/CUnYGSNYtyPynjc1XPt8i/cgt+
 UHhUaY9UtzVnfM3iBNBsCI9OZcH0TmGMAcKPNhs+SEEBvieUOVs/Gjnd3fEhwi4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_083428_750146_48834B9B 
X-CRM114-Status: UNSURE (   5.70  )
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

> Gesendet: Donnerstag, 15. Februar 2024 um 14:20 Uhr
> Von: "Geert Uytterhoeven" <geert+renesas@glider.be>
> Betreff: [PATCH v2] arm64: dts: mediatek: mt8186: bpi-r3: Convert to sugar syntax

should be mt7986, not mt8186 ;)

regards Frank

