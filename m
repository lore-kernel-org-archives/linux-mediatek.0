Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA9CC25B5F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 16:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:References:In-Reply-To:Date:Content-Type:Subject:To
	:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IwqP/7Y2UdbLwDktzhmSvQ1RXPsSrkmi1XtKQnEU5/s=; b=3c2ZoRj7L4N9Fi
	W6KQGaUV0OWcKYRSNNDwsCz32dkPxECvEaLsLEDlM9QxHKq6bT/jgpSQrBh28hDYfvpIco0HpMQV6
	q57d2czvAQgFmOmJ8SkDYNPwqk8z0GsPyWz1I5YsANGcNV4iOAbTGCC4vxK6R3B40Lt78vI2Tdgxq
	InCulW3Eyc7cz3WgnR0kjM4X/ix7olCvFtD6Rhali4ypXZyLSVpc9y7irPwXQjBRbvsRuzDzqHa9x
	zUFP3cl2Qy/2zwxkW8AH3y5nxkYVDmaB37A81P/emWguU1eHLNG3m+JRAJpCBQPe+p9tTJBbdOtkJ
	pArmMOpDD9toBxFNwmdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s41ZL-000000088t0-4B3W;
	Mon, 06 May 2024 16:52:04 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s41ZI-000000088qz-1qdw;
	Mon, 06 May 2024 16:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1715014303; x=1715619103; i=frank-w@public-files.de;
	bh=IwqP/7Y2UdbLwDktzhmSvQ1RXPsSrkmi1XtKQnEU5/s=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZJMOhgOaKoq2Ph9aUz+zN3cUTdYprV6pz+9vp0TklV/mxEjT5dcBOZdN8n/MHgsj
	 uZJOVLgY5rbwdC6lf5YKQf7zCp/lnoFb0fXuiwxzhkSbV5uJW/po6L8lpbPz8PM7S
	 5EWCAPpwo875gXwsUm98FWYpQI0m/kq9LDTbU31ay4bbFdq4uaj665h+JNIJZngN6
	 cMtdDOUnJO+tgLNJpLEJm6JqLUQaXhMgLOIQBfRIA0Zxf4qG4bZ2woDhXT5GEX00v
	 vd5ngkpvKgyV3abAUmeVPkHsrGPEHkX0Si8mcJQfE7YzD7HReqEdcba33+Iuy2x/I
	 ZvCtSViQrY/dE7UFjw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.77.247] ([80.245.77.247]) by web-mail.gmx.net
 (3c-app-gmx-bap23.server.lan [172.19.172.93]) (via HTTP); Mon, 6 May 2024
 18:51:43 +0200
MIME-Version: 1.0
Message-ID: <trinity-9ceb52ff-9a3b-4fe2-93f8-2e95b8ffb1ee-1715014303393@3c-app-gmx-bap23>
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Aw: Re: [RFC v1 2/5] dt-bindings: clock: mediatek: add
 address-cells and size-cells to ethsys
Content-Type: text/plain; charset=UTF-8
Date: Mon, 6 May 2024 18:51:43 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <9f8237c4-f603-459a-9d34-9cda556874b8@linaro.org>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-3-linux@fw-web.de>
 <9f8237c4-f603-459a-9d34-9cda556874b8@linaro.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:3Tx8ITtU9FZAbAHnVZrQv0sGnxOJ7y55w3K4FyNlXKBO0OOrZTMZ7iPXAy0QoSb6Y7OrR
 OHP1cqr8ebHy9MA3C8iyt8voE5P7UohIVetGk1ZZ+JEnmShVktL642Q/CllLjuW1Zeeabdigrueo
 MEP2qg5Uq7eHLcBnES1UCzrOM74CPlfQxPD6Nd3agGY3Dmih954CFjcgqGqFqHFiFi54/d2P2668
 v8+QwlWfn7ELKzP3vVtD6YciGd4OmkyJd2Ya+99yXxs014VxFbL+kVmhh4AEZIWKiGBfBoMpEP53
 kY=
UI-OutboundReport: notjunk:1;M01:P0:HqZgEzNzP30=;1Z/bVNz2Hg6od3fp1iQE8Dn5VyS
 EMECAIq92weuhOb8c8mleVtH7XDWJU47XhJV7CSFmtutIbyEKDwdL41WD5GYXOOqwUMf2XXAU
 0NOPFdiGzFDxcetA4IyMDIHE9gd/oUT5MflrTXniYf4hqofn1Z1xeV4UhApgq8JWMiy82IVAo
 VcMsngEWSVtjR5FBOm9mqK10zHiV7Z3/gdZBbYijlzN5+/WdYHL1QJYefIbnctzGs/H82hweC
 sSAg+e4G38eCfn5sDMBk48oas9UkM/eoZUpP7+3dhWOdyvvOcZ6KzQ6cuaq1xWUhqzO1svqbQ
 9H0n5FCYY+UEtvAx1dJOHQui14G0w69SG6tyKkuH9RVlEbFMBUXhN9ejUXKMBEwwIzqH9nUv9
 JJON+I5GCmgbsa3KaRcxsjxmdobOhDBoJicv/FrWTBqOFYRgvmnwqh+CLio2Wvd2joe9ZfBlm
 Pm7exN4QymBMZUZRMmUaE5DrF+H702+7i/mhCAlKxh89TbOpvgMhZHmzGk1MxsSxcQnEU19/7
 iohn9RievoaAAR3BsEtdfWPZkKuFDC9yLx7vpNiHFm+ISVfJFrDysgJFKhlN6ddvI5Y7n12d7
 SB6A1MnomcyH1qpn3uYNPaLtnr5z4b0KR4sJFFWF3YTUn1/ig0HmBFr/2jC9Bjcd/ytLJ1G3U
 vMZJGgxPW3Mxk3q/x4a3fSUL22PvZ7DqxSALrDogsl+WOny5eNVViwT0POtGKQ8=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_095200_801676_EAF2B20E 
X-CRM114-Status: GOOD (  11.34  )
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Eric Dumazet <edumazet@google.com>, Pavel Machek <pavel@ucw.cz>, Frank Wunderlich <linux@fw-web.de>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org, Rob Herring <robh@kernel.org>, Tianling Shen <cnsztl@immortalwrt.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Woudstra <ericwouds@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Montag, 06. Mai 2024 um 10:18 Uhr
> Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
> On 05/05/2024 18:45, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add missing properties already used in mt7986a.dtsi.
>
> Missing for what? Or why? Provide context, IOW, explain why they are
> missing.

ethernet-node in mt7986a.dtsi hast reset-cells-property

https://elixir.bootlin.com/linux/v6.9-rc1/source/arch/arm64/boot/dts/media=
tek/mt7986a.dtsi#L559

and

address-cells and size-cells are used here:

https://elixir.bootlin.com/linux/v6.9-rc1/source/arch/arm64/boot/dts/media=
tek/mt7986a.dtsi#L495

i saw the warnings while checking my r3mini dts...

arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: syscon@1500=
0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pi=
nctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/clock/mediatek,ethsys.yaml=
#
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: ethernet@15=
100000: Unevaluated properties are not allowed ('#reset-cells' was unexpec=
ted)
	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#

so i thought it is a good idea to fix this now ;)

but basicly not related to my dts as these are inherited, so i can drop bi=
nding-changes...

regards Frank

> Best regards,
> Krzysztof


