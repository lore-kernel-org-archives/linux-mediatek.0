Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F995C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Apr 2022 14:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject
	:MIME-Version:References:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khIhMj1kN6guHsr5+OB1A+I36Rf8CuonCPoEfdixBHw=; b=muM+PKcOzCoJmY
	Y/PSvXbt88h5ERPlMFW+W7xoUIBYvjpIBOA+m6LviWfs/f6TZt0dSnlPjft+8xq8lOezANG7+7JlH
	cQ/cPOtOc9CJ/ICQRYKjTsiF75vSNwC0qnqRxLTEhoufEeg7gQlWuwT85fZkDC1LT6pibJphbL1ya
	V7MIa4nBjpbOT3WycaGjOKGzOvQ6PxTdINF3MKymQB3V+Plc/1L4MzIjBcfVPOvZKOo+EmAX1Bw7V
	VxE4DPSlDCKY6RNUlmlMHfIvG4DnbW+a1yh19cbfIsSIh3cnH5hHea7Z5bQ2se/6UhiMzUB22D73+
	zLT76oP2Ah2CHsXdIGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nknvM-00ETm5-OQ; Sat, 30 Apr 2022 14:18:16 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nknvJ-00ETlA-PN; Sat, 30 Apr 2022 14:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651328265;
 bh=RpZTpQKzzOTn3ZLA/Gs5VRQkp2uGMos0GOqltACh2Ns=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=dhlfNF1jBeDlco4SgSmA4nCwK1HgNjGr+6piBTy9qIRiFS33Iuzs22AkCnocq+SmT
 MptW0h6/ri3N0UYhXdVzdYZ8Hpqp8tH2HcgqL5QmvmjjgP5R5fUrmgUiKVskW3Wthz
 p6HZ3R1MJjh1lNgKkFssVrI9pTaLdwK9EvBns1/4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([80.245.72.211]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnJhO-1oAGqb0I9k-00jJBp; Sat, 30
 Apr 2022 16:17:45 +0200
Date: Sat, 30 Apr 2022 16:17:35 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <3557249.iIbC2pHGDl@phil>
References: <20220430130347.15190-1-linux@fw-web.de>
 <20220430130347.15190-5-linux@fw-web.de> <3557249.iIbC2pHGDl@phil>
MIME-Version: 1.0
Subject: Re: [RFC v2 4/4] arm64: dts: rockchip: Add mt7531 dsa node to
 BPI-R2-Pro board
To: linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>,
 linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <40BC9D9E-3E30-4779-9131-E101CDE993BC@public-files.de>
X-Provags-ID: V03:K1:ZlgyTVYfgWBO1Wy+cVSo2lW0VxJ02caKG+q8L7RxX6xFCXGwzKS
 9Udx4qBl3JfeZ447LxlY29/NnBY4gMmLSnSByEDXRWCScdrLF7Xpqq4av3NGuhFbRaMWYkK
 PkHBk3TrnU78Afq0SL++aWQVkDjqc1ghvD4bSJKSzF9ao9N6UNNApaFP05dCg0HANSYgHZO
 ye2WgAO7g1iw0nykgZxfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AgGhclNko/8=:aCrBet2od/8wC2RSNSK+oT
 a5aRnnJfwRSgWlKkxzCYOVhXI/79O8rT1THVM0MnbzHJCLI4Fvh8OqgLQBFT8KGUMsDt8CCBF
 /ZIuhrnsKwVevPZ+dOIZvsaZAt98lXRiMREzssZlZx1nPn+bBCpvM5CHll4nBR9xV6dsw19rR
 SXVyg90NhXFOe2TaHGck4JIe2kLiAqWqMd9z9H5BmBozxYzi/yqwoZjOb1F4tfsUOHKd/Cp5a
 vuxK04OjaSDcljtOhPHp8yJdUQ+a4X9IB9mGYju+X/SOtToT3sGOPzh1+lIDxO1PxB+ytorEc
 r+M0C0+BY9huBsLtEmv/APjzY96z1nl+Rnr/GiuL65LTyVTxSr/LCNNyngEQ5WbX84PH89QSH
 GXrbMz6poJ5w8ByUMq6Nohi3NhQL6UMV2ulKD2VBEZlF2Gzht2eU73/8nvBOx3m31YL/fRMWh
 zlAEXxeDg50H/FzGYJ8/j+/Y8KYI85DNVDfa+hjSZBbc2kZ9wPEs0tm2m3HuSR2yIln5zbf97
 xYbCnmcx7f4/ImNwuGKnP6rZYm/jitVu0BjGavWVDxzpjsdiBoEnMFnWLFbFCvWdtvDF/WKW6
 O+DwrDISWIGQ/9LRY+RRCKCnqNQ+lOJO3Qi2p2PlblYBJR/IKfhBFQOrWWLHiKAXSIbc2Gy41
 I8v+/4kJEGzo0S2HdK91aL9V51374tvnB6/md4i73yH48vbBJqjUSrl5t/jlg7ru8qtaU1zJF
 UKkxHQzD2TI3ynd9iYzd1QaOR4QCy+3fm08Uq6mbcuRqYNNpU6oRTH1kXAbwOiWFcuu2dKbCb
 Gkihb7baqLrmIoPm1hymk45EqW5vY8YHb5/h+NYgPL408xkD29786S9YtKR6DWdjiRj8borBO
 yi9VwYvK/bCqBNF7dueG2BpVsQpphPcfyQwARyUgJehMnMlUdFDc7PuQLTLH7wChdMNy8VHX8
 JIeFEFN+LRmk/nVjSM63E/eyvQ0+Rgqp8u6aBTZO5RleS7mdXk0isgrPFa/pR4K6uy5KSkKHU
 Fd1cX0xpUxzNAn9BDCqcRcoxK0uNC+dNjmTJfUAHT5qXvVxnW9RGrWELoUPbS3l/QC59ubvVr
 WK7GT44+uDZSpA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_071814_322740_7B072267 
X-CRM114-Status: UNSURE (   9.46  )
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
Reply-To: frank-w@public-files.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 30. April 2022 16:05:06 MESZ schrieb Heiko Stuebner <heiko@sntech.de>:
>Am Samstag, 30. April 2022, 15:03:47 CEST schrieb Frank Wunderlich:

>> --- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
>> @@ -437,6 +437,54 @@ &i2c5 {
>>  	status = "disabled";
>>  };
>>  

>> +			port@5 {
>> +				reg = <5>;
>> +				label = "cpu";
>> +				ethernet = <&gmac0>;
>> +				phy-mode = "rgmii";
>- phy-mode: String, the following values are acceptable for port
>labeled
>	"cpu":
>	If compatible mediatek,mt7530 or mediatek,mt7621 is set,
>	must be either "trgmii" or "rgmii"
>	If compatible mediatek,mt7531 is set,
>	must be either "sgmii", "1000base-x" or "2500base-x"
>
>So I guess the phy-mode needs to change?

This results from current (before my cpu-port patches) implementation in driver where cpu-port is fixed to port 6.

On Mt7530 port 6 supports rgmii and trgmii. On mt7531 port6 only supports sgmii (which is basicly 2500base-x). Afaik it does not support 1G. Port 5 on mt7531 supports rgmii or sgmii (dual sgmii mode) but seems not reflected yet in txt.

On thing more to change when converting txt to yaml.

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
