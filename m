Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BD7C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 May 2022 06:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject
	:MIME-Version:References:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hobGNXN9sJnwCvob7dkm2tmlwOYfyyaFuif8xSjbhdQ=; b=QNuF8T91iGlJYy
	PicQ2KiOnwACD/IzEGTjh0XweMJM+atAdKYo8UX2RjKOHZCMORNfcrHnLr68NjeK2iJwApk1UTask
	N3pHViyJYHQT5VS040o+wJrTbOciUPU+8G0sbckLbZR8/x0mp/XRYjE2VrJTR02kV5vFUyfjwB21r
	OSXuiuMAGG0MvWcjyZAsgkSgJnY3j4NjW1jsgmmJzwAWnx+aQnenCKHrgKjMm++/UFvli/QhehlEE
	DdssSD2s2krF6Q9vP0yB/y0zkBN5+SL62MoVLmmvuP0I3lSxj/DZbaZz8S49ALinyb+XYfyuteIds
	b7UvsaEGXIYts726cvKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnaMR-009GXa-Sc; Sun, 08 May 2022 06:25:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnaMQ-009GXG-Fz; Sun, 08 May 2022 06:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Message-ID:From:CC:To:Reply-to:Subject
 :Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Content-ID:Content-Description;
 bh=Ng4jRsIwZxysTh46jpfz6AMJR9c8fLNEyif0uXQBzMM=; b=kQm1npLHZaB/D4xncLGWAIuytk
 P234fkhLfOf5PrYXvCCHe6I5wAoB3gLFUZ87RWTE2FF2ttQUzNuoo15dDDp7uZV5ZJ6h3soH7Hi2o
 YwTSglugCArAxB8BZvm2g8UcXCrUODRS+3gwiFsIeJ6LeK1swAUnpUgloZqnu0XeY5u1l7jziBNoj
 AUpNc15SN7W78zOWqhDB4OEoqDs1MEwJRqPmJP2vfHJkTRk/fg9rp63b0VYLj4EM400Bq54RlAO21
 /DtEoORpn7JxBGwvdF2gKiLPLwdlxaVrQX+41yzdh89jtvQmqVzgVLqRSvlgKZKobgJ20W38D9pVe
 LCSqrTiA==;
Received: from mout.gmx.net ([212.227.17.22])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnaMK-00CCA0-Uu; Sun, 08 May 2022 06:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651991088;
 bh=Ng4jRsIwZxysTh46jpfz6AMJR9c8fLNEyif0uXQBzMM=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=X+vDZVU5h4mNwzU33pKxmhT0xREh95Q0q7hnyhDLpOlZ2oCdGgTkjLrgzT7RpZ4Xg
 J5pZeoUkLSyUcM3tj0bhMC/wwxNWpnAwJOyA408yjpzp7Rd3wTT6fc3PPcfZlnWSZT
 XD6Ssm4K6hdmWrGUbCN5IfffCJwF+b/wk92Vmj/s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([217.61.158.76]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QWG-1njCcq2lQO-004WiY; Sun, 08
 May 2022 08:24:48 +0200
Date: Sun, 08 May 2022 08:24:37 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <06157623-4b9c-6f26-e963-432c75cfc9e5@linaro.org>
References: <20220507170440.64005-1-linux@fw-web.de>
 <20220507170440.64005-6-linux@fw-web.de>
 <06157623-4b9c-6f26-e963-432c75cfc9e5@linaro.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 5/6] dt-bindings: net: dsa: make reset optional and add
 rgmii-mode to mt7531
To: linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
CC: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Ungerer <gerg@kernel.org>,
 =?ISO-8859-1?Q?Ren=E9_van_Dorst?= <opensource@vdorst.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <DC0D3996-DFFE-4E71-B843-8D34C613D498@public-files.de>
X-Provags-ID: V03:K1:cmDKAX75GAWrl5EVsFsdZd3/enOiiqcTlPQt33Mk48FUrUnPxAP
 U3BMSjIAlW9yIFTQxc6r5ZGwIBzhjF3Eyc7HA/HmUMOhdXJESKU/WOTVhl/KuWjQZJHCK5y
 qcuAgH7UpLQS0Nwh95lnIShPBdyyoyyqWA+QjXtfxQ2F/aeuVB1FPLxNkP2XqesUCDrQJMR
 yG7/qjijqGViHXGbgI2HQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bt/imPOyZgc=:gwTL4xTW1EFlFic5EmehuZ
 K3tPQ1T2YEOPsfiS+vfhaZb9DEmkYVHlD/FR4mInJt3PgNl0Qv01PIPSMx17iKY2eRal/5y6i
 cP0MYxK1pg6giLZDsQj9PdZXachOyph2RT+LTBbDqyTdwbs7CLxEtm5Pwtf2rdoY5XkHJV/Y2
 ec6qOXl0/qj/VmpdrbqBy4zQ/1hWp1UBv9OS2pT3cqavFhXZQEH4aQTDLk9JNpth8plSiqJEP
 BE9PKVM66PYgl7cjxXgCg55oJEECTEZ4uTGThtMy+tIxftpoikt6Q0J23d0LsjqxAVDAf9sih
 ak0vWuCLmoNY5NmYOnWWd4Sc9ralz1sv8qqFzhM/yzJK+zVoyMDegsDf3EMuQWE5PYzDj4pNK
 dY3XDd81wQq8YIBmMsSlhcGTijit12enWbsnefF7MAk4QyKU73N6mwVkCzlv9vjFgOUxmaV0/
 SLOQ8OhLSKHn/wp+yIUFKdDFqvjEQB2SQr4iioFpsiMIA+2Ty4N3ElDilk/1USsTQJ/QBFRa9
 iBYypxmOh1oJZOOq3reAzjnp7sc4Gqi+r7H4hkR10pIpB5xO37Bz4CVE6AHlZEmX57JYSoQLR
 APgffcXp1EooN8zuPLqI3qrETvgB5qdU5oRehbBYp4hChOzWR3BEkDODs5rsA3MR4z2RtGSyg
 UXW0GmtFGQqQ/IooPXH5qyKtVv7gDNe7fNNMwScJpE1Ju5hy9w1AxFnBCF/YOi+KwwlZRbIiU
 m1x+briTvys/DR0AxtKoU/3ARfUlE//mpL0ZZhkCPqxF8jpgPhqo8Usonb7apnQRIynbEIZf7
 +6uLAzBWZbnF56sm4WObjUbVev1kBquTKBQZ/jZEbOhcjjJVnYX3CQYZlyL7dVd55dFlFsWif
 rMwUQddDBjYWvamkLP4LW2bvbqySz4gKwB9C3Zp4Rr25JpASSXbAyfDQ9S6Ic7cyOIH33ugAd
 jJU4IdGCgljdAZWOLdWvoWBxAkdvXfxY3MdzkEH8FAKA39Z11wS0BsKMJToIssVhsMwoadgFS
 qf/y3agWZoSVD2WSm0oUTvxYbC2sU47z7lz6azW8AjCOfZnBnpOBR+9akJTyG90hq/ZI4Egg6
 7LfkJf4JYSWx3k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_072537_380175_8F64204B 
X-CRM114-Status: GOOD (  11.64  )
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

Am 7. Mai 2022 22:01:22 MESZ schrieb Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:
>On 07/05/2022 19:04, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files.de>
>> 
>> Make reset optional as driver already supports it, 
>
>I do not see the connection between hardware needing or not needing a
>reset GPIO and a driver supporting it or not... What does it mean?

My board has a shared gpio-reset between gmac and switch, so both will resetted if it is asserted. Currently it is set to the gmac and is aquired exclusive. Adding it to switch results in 2 problems:

- due to exclusive and already mapped to gmac, switch driver exits as it cannot get the reset-gpio again.
- if i drop the reset from gmac and add to switch, it resets the gmac and this takes too long for switch to get up. Of course i can increase the wait time after reset,but dropping reset here was the easier way.

Using reset only on gmac side brings the switch up.

>> allow port 5 as
>> cpu-port 
>
>How do you allow it here?

Argh, seems i accidentally removed this part and have not recognized while checking :(

It should only change description of reg for ports to:

"Port address described must be 5 or 6 for CPU port and from 0 to 5 for user ports."

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
