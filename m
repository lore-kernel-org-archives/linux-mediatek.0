Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E50C54E60
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Mar 2024 15:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpJmCXnRWkvipvI+cl7psJeUcSum3HGG9o3Z43g1ycg=; b=oyAo8zNOI1CV97jJnCA3N33YaF
	ZVHjtMKC3QkgpARWP0jAcNG6nF7+U36cwxzxurntHXyGDGwuuu9UXu5s5fPgPOYezgNpqt9hJjsAD
	gIh1CPK6lAsrQb5QEH/XBYWIQVUJJxEy/KQZtCqhYK6X2I7dZBHIyGbOqcEb0pEFAVj5rgweg03Q7
	JckYQYnLM4EiodRccI8mGRoMS+0VwzZM9E488K1KduIPGYkhcTIxppHrw6pL8YNGhM88ed0znLaBX
	WIg/TiTOn0C6fyXXoYYMJE5ZWRsz2GeWjEIQ8FMyTLYHCFkaqevKc2WWnndYfP+zyz31O2orvNEm/
	osnxQ1vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlsLi-00000005Z2V-4099;
	Sun, 17 Mar 2024 15:22:58 +0000
Received: from outgoing4.flk.host-h.net ([188.40.0.90])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlsLe-00000005Z0H-1AyM;
	Sun, 17 Mar 2024 15:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=risingedge.co.za; s=xneelo; h=Message-ID:References:In-Reply-To:Subject:Cc:
	To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:reply-to:
	sender:bcc; bh=jpJmCXnRWkvipvI+cl7psJeUcSum3HGG9o3Z43g1ycg=; b=j2TNxf4Pgtf1G9
	tWJ3FqrZY26UZOriQ/i+mwirYaOpaKRVI6JSjuXyBZIjOyJ3YVJ1qtNOi17HiTgJxGmFGrrGJH5Y6
	SqqN9A4DpEVRT7ZKTVC6kyxxMJM8ONNBlyfaegMGUIxhjewGyTtFwM3eQldfoM92T04q/pm+kBO4S
	Fsb+EsFEZFRph9ocgXJoJ/KQdfAw1bY7dYLnGjip8ePhy+Gdo6ktp9872SMApqt8eXMyPJwzl+F8j
	UmxPMqL1tGZ2Fsz9V+jkRjpOJqS86ltBU52yek/bUYHKdn/y4tYXdBTypNFalyCbSnMlQXs6p46HG
	dmt0hgj7yCIQoiNEktIw==;
Received: from www31.flk1.host-h.net ([188.40.1.173])
	by antispam1-flk1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rlsLS-008gRB-0O; Sun, 17 Mar 2024 17:22:44 +0200
Received: from roundcubeweb1.flk1.host-h.net ([138.201.244.33] helo=webmail9.konsoleh.co.za)
	by www31.flk1.host-h.net with esmtpa (Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rlsLQ-0005pa-09; Sun, 17 Mar 2024 17:22:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Sun, 17 Mar 2024 17:22:39 +0200
From: Justin Swartz <justin.swartz@risingedge.co.za>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?UTF-8?Q?Ar=C4=B1?=
 =?UTF-8?Q?n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 00/14] mips: dts: ralink: mt7621: improve DTS style
In-Reply-To: <60512ae2-dd73-4cb6-9514-145f946300fc@linaro.org>
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <CAMhs-H9ZO-sitsrASuvsEd+ddwVyHH35gj7yAABTqFNfOCGYYw@mail.gmail.com>
 <60512ae2-dd73-4cb6-9514-145f946300fc@linaro.org>
Message-ID: <5d6c36cb9dd9afda1efb69aa34058517@risingedge.co.za>
X-Sender: justin.swartz@risingedge.co.za
User-Agent: Roundcube Webmail/1.3.17
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.04)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9ZXznAGsLAbssBYrxq90PQPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wCPRB8bAzJcv2cv+UqiTTc2+CpNcmBnO4XM3Sck4bwNogU
 WCl1nkLBzZX0KuJ9bXiS85Z42w/+2OBolTNFbPomXFWCX8oNdggW7HE9XDTdSejrkEpbuUvwMvHx
 3T+KSG//gbuP7hnUK8NQdLwsVWKIFDZRrTGv3rxiw9tFrqFSCFNiLZt/QXQnOBRD+jq1HsKsDh/6
 Srgk2K3gr1VBfJbChkYH6fbrypLNrde+UooQVNLReLErukdelEOHUIpaBbp5GdnsN8+UvimwMinK
 0+Txhz2u9qvrL2PODYgMZQApJXOjDLkqunZ9NcY2bHZn7CfFscMZZf3sCkN20I5vMh4akiObI7Kj
 vK7X04QEin24qbfMFd8eGjnYW8aSH5qj4ujh/13psIvqSqJFa1CcANErDW/w69saM9prk3jNnHtn
 nuEt/J9wDZeQfiNOYsLDFBdwYt2XtlLzy7G7T4kla0JNMwpa8J6LDEGB71xpBP9rMN3suOKfn8Hl
 koyhyj7ioi1H+3FR74FPtCVqefSOps3DjBaEzxvm/wSPAqUO1+xOWSBZB5ABM5ibrJKBc41fzX2f
 c4dPBW7pWChw4uEjGhn8NxWJwjYpP3+Q3/7iG2wtXpj+MxXskxADOZtFo1H2i7Tgo+5B/jmqOvZj
 iTeRCozF+pjfbFrzHCaFHgNTrYhVbBAqR8ZRvY88PgTw/yJlftBcHX6tS8NW54gm54VAvfk9VDzu
 2DWvs648c5Z9erCJvcji+JcS2GUvCK1BsRI8tTKkBVM18TehOmSn2kZRt3z8CHTZnKdQqcB0QMMU
 IPF3mL0sZmYqDqSi6Ubx7BN0H0IaZOsZnP36dPZwQWhvr8FGGENbqE9x654AXkUfGHPAHnWD1MEm
 8zNnsSuSxjl6RVTXva2Jl4AHe5oTGEWuK7wQuHiJKcf5Sqd6P3zHxU4Ham35bIM7+pzQRR2+p5za
 8H1gUaDJZGpg6c2oigrh+YcF3SeOS5epce2vBFQn8BLQG4wdJz5OZPl/85ViK8Ea0fe5iniRDU9a
 IkFLX1Ne1hGTitUHsPftyxriH1hAvmSO1crrLwiF2BozUnkjKLcelPzx2oqVYjg7pBU6N7n2Xnf9
 ORWrllgKtBSNx6xUC0rhukb6/HI5FFTbPOoZF9qxZ4vEB++mMxBCD3fThxO9W05FCDXTgie1WJoD
 4hXRjHZ+R3cXutruHTpS87YkskBoFo6eZ5Uv5yUh4sH+KRvQOJ2675fcuW/3lDmDZZ7XgBhunFdj
 VYxKH3qWyoySMt2NXQeSeCQL64BFVPTx/kcAi/BxQpDwnPv6lZRBE5yf8dBL5neTPEi/hBlrHCDh
 EJ2WARFy2DNwOgV373pfDhBQ21Od8BCsodKtWDQizmRHoSVjKnexcCkQ+p5zWKzxeWKxLCyS8776
 l4RSwc4z5cqDb97hdiFVwaP90eVaqnDphEW4xEWnj3iKGpP30awjRzKpQ4kPl+3D1YhNMZlGTB68
 YWMe6VM9RYQVmV8q7nN/oibcn491jt+pt12gBHaGoo19huz2OKHH5lr9xXvSM4nM3avg
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_082254_931093_07A13D9F 
X-CRM114-Status: UNSURE (   9.93  )
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

On 2024-03-17 17:10, Krzysztof Kozlowski wrote:
> On 16/03/2024 16:49, Sergio Paracuellos wrote:
>> On Sat, Mar 16, 2024 at 5:54 AM Justin Swartz
>> <justin.swartz@risingedge.co.za> wrote:
>>> 
>>> This set of patches was created with the intention of cleaning up
>>> arch/mips/boot/dts/ralink/mt7621.dtsi so that it is aligned with
>>> the Devicetree Sources (DTS) Coding Style [1] [2] guide.
>>> 
>>> [1] Documentation/devicetree/bindings/dts-coding-style.rst
>>> 
>>> [2] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>>> 
>>> Justin Swartz (14):
>>>   mips: dts: ralink: mt7621: reorder cpu node attributes
>>>   mips: dts: ralink: mt7621: reorder cpuintc node attributes
>>>   mips: dts: ralink: mt7621: reorder mmc regulator attributes
>>>   mips: dts: ralink: mt7621: reorder sysc node attributes
>>>   mips: dts: ralink: mt7621: reorder gpio node attributes
>>>   mips: dts: ralink: mt7621: reorder i2c node attributes
>>>   mips: dts: ralink: mt7621: reorder spi0 node attributes
>>>   mips: dts: ralink: mt7621: move pinctrl and sort its children
>>>   mips: dts: ralink: mt7621: reorder mmc node attributes
>>>   mips: dts: ralink: mt7621: reorder gic node attributes
>>>   mips: dts: ralink: mt7621: reorder ethernet node attributes and 
>>> kids
>>>   mips: dts: ralink: mt7621: reorder pcie node attributes and 
>>> children
>>>   mips: dts: ralink: mt7621: reorder pci?_phy attributes
> 
> These are all simple cleanups for the same file. It's one patch, not 
> 15.

I agree these are all simple cleanups.

Even though the cleanup pattern was the same, or very similar,
for each node affected, the intention was to isolate each change
to a single node (or a grouping of nodes of that seemed logical
to me) so that if anyone had any objections, the discussion would
be easier to follow in subthreads identifiable by patch names (and
thus subject lines) that clearly indicate the context.

But if there're no objections and it lessens the burden on
maintainers upstream to have less patches to apply, then I have no
problem combining them into a single patch.

Regards
Justin

