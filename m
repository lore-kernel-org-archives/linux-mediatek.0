Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4540EC4828F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 14:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2pmPEBlyiRHiEP3q/nEXSfiVF8UmXfBHX5RCm1fniU=; b=sR92wGdJLzs9VDBMVRXd9XNZ0E
	ZDxdBpU6HPxAxUsqvV/LiTTgWUtfK9yKXZRu+M6rG94MPQza15orNxxYfnZIQ5hFZyaeuTsrSCYTM
	D3ZF6Vdk7bqd7TKaTiFWOCcf0S4BvNPuu+7ZkTJ8b4uiZoD6Bd78iRmPdn7P+dvnyXCNCHuNNCgeU
	k4Pw+hycaKMKSBq5eBbwj6WS6tsuz5npTONwuQdQrCLlGyHwtDgIUtlgyQPPe5SZ2kl825NFXxM2X
	WdXsRRjl3/7yxbQegzwytN/umTJJY/iAIdGQBpyqrruD7WU8V1/SnX2Qz/AcZmmQADmvzUiNW0IrU
	5KYpcmDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXyO-00000008GzY-39Su;
	Thu, 01 Feb 2024 14:23:24 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXyL-00000008GxX-2oFs;
	Thu, 01 Feb 2024 14:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1706797383; x=1707402183; i=frank-w@public-files.de;
	bh=m2pmPEBlyiRHiEP3q/nEXSfiVF8UmXfBHX5RCm1fniU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=mWrYqBmsYj3oblg++3nqiCBlDnv+qtZAqqqG8mf+/+214L9dbycYTlTLG09uJUFw
	 aLXY7V+aM/taQ2nzIAUXwU2OQJBOqADOd2rPYi4XcpP9G5tlNVndhmTB+8wTFpJcI
	 wweyOwDtwDHDLV5cLs1pb6ABHs3Zdf5I0MoWT5pfH6XP5cCaC6iCB+AuTon0NjriL
	 LaboV81/rheWFHIQZmcVCOTtyWtZo994rFRqlzRn3/uHNx2Cn4MVgBwCYjF8aHc/d
	 EY5HerOSLwH/h3njZIXmrb654nm5cCi49+LsadLMs46QBi8IvOD7CWN/7LPVZMjn4
	 MuMBz3jkqKe6dMfQog==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.148.248] ([217.61.148.248]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Thu, 1 Feb 2024
 15:23:03 +0100
MIME-Version: 1.0
Message-ID: <trinity-2aef55db-42e0-4f58-9c43-696311a96eb8-1706797383340@3c-app-gmx-bap28>
From: Frank Wunderlich <frank-w@public-files.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Frank Wunderlich
 <linux@fw-web.de>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Daniel Golle
 <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Aw: Re:  Re: [PATCH v3 1/2] dt-bindings: reset: mediatek: add
 MT7988 reset IDs
Content-Type: text/plain; charset=UTF-8
Date: Thu, 1 Feb 2024 15:23:03 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20240201-goes-passable-0ba841d36bc3@wendy>
References: <20240117184111.62371-1-linux@fw-web.de>
 <20240117184111.62371-2-linux@fw-web.de>
 <20240118-calcium-krypton-3c787b8d1912@spud>
 <trinity-afc4f48e-65e1-46ee-a78b-1d670cc0f310-1705615200900@3c-app-gmx-bap21>
 <43f946cc-07e1-48c5-9b31-40fc9bc93037@collabora.com>
 <20240119-dupe-obligate-707b3a01b356@spud>
 <0EA6A126-DDC0-4E9F-BEBC-FD018B08CA84@public-files.de>
 <20240201-goes-passable-0ba841d36bc3@wendy>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:YxMTPdbGS56mkMN3Zd6FsPtnRv2rXYnnUO9q5vA4ZfXfh7P0HB+PTT+TmBo0UjMuaPhte
 LQAJzPeZk7lPzybRz42MAd5YyKtZ75adKlGIFfIh+NXO+Jd7Xw7UwDrnH9LieSQ3soraPoAWHqLa
 JpL0MCgK3R8nW3ctIx/Y/FUJrxFvYQIe7LfXCRrJMQS9DsQt4MVzpvAgzBp3P6qLihGRTLVQK1T4
 lgcUIGrIqDOuAzJKaO9EKkoFvdKxK7ZwyAgVhOa2bCoj9VMzoN0FMlDDq/5e531Kac4GGUZhOtGV
 2w=
UI-OutboundReport: notjunk:1;M01:P0:bh8y4f/qa1A=;T0c+3URWOWBAlxRYIrbVPtT+xcn
 quUgipuVtzeToKwu3tFBmBjcuARNRdJDD8WSzZynbER40R7Z13XSNh9PthwSOB1BZDTWytojp
 2Kf7ma19xdfp8cxPlBIIAytQk+ZUjvTNNlDuFRnDcOi+fkTnw4TnJTRDrfaZJQs2CPJ6W3rKG
 IlI/T2PZRgN2CW3vDWxe4VL762UJVuJxDMzKb1yKpWmmMKr01/FtFnFRaXSwTLLpA6hmUWzrR
 Cbh5dZ6ltMdD2Whh+rWjgmmfigVxOmLMmmy0xryOL6z83U9Pv0RrHyPFecapbhhwxkY9lFkNb
 mlIUdJd12iXrEXcH0bBbhgMV05MXX1x6AqIg19xfLNoAjS1efJXEdFGcrG9976B87Sd4Yxe9m
 aDnoL+dAe915is/K3BGsqP0p+n4enRdsPo80Xw2cWIMnSZ9q1tGpHrbVqiriyLTbuuvt+2/0/
 8GxxKY8J17IzW4gKawzSVnz0yWtfsPwL373R4m/8OZ2m++1pOyMT4Hty4na6CybqUaRrnNIHy
 WxBf1J6dKD8Xf1j7T984snPINdqtQTaJ4vR72Ewurzz7Hn2/SDnLvYtjt0eVUBUsqU9cUbyL+
 NLIBXafjwNtmjcKwRdVwRESffYt/00ioI6+fD45OxmjiZ4ywQip2j03RYLSQm5v8OmyCyJLKQ
 ZSsLH+iAX3XdCdF55+a7GqmSw4OgE+L08qH1O53IfELha0BTq5Gef7uJeJjgq9k=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_062322_048273_308140EA 
X-CRM114-Status: UNSURE (   9.82  )
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

> Gesendet: Donnerstag, 01. Februar 2024 um 14:11 Uhr
> Von: "Conor Dooley" <conor.dooley@microchip.com>
> I suspect I was asking for a commit message that explains why these
> numbers don't continue in sequence. With that,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Cheers,
> Conor.

OK, i would add this to commit message:

"Value is starting again from 0 because resets are used in another driver
than existing constants."

and adding infracfg in commit title, if this is enough?

regards Frank

