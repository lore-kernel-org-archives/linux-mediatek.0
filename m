Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217FFC38A2A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 12:02:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E728E208DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 12:02:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FXpkgrU1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Twetzls2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E728E208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svA3WmG1I9gKE9f5K6/B1jJ8HlEDXgUGSqrN2g40Ztw=; b=FXpkgrU10b6JWI
	+8J1iJDeCiVse4fsXOFtOL4mx0oqm8SziGEHXNteLU5bKiQBZ5sHDekeJ1vgYw+0ie1gipX6/jH4/
	a8MIjZheRZHbjr0ApyBp2H84RVKdXg032wc3QVbAl3Q1jWPjJz9rHSpBLia4MrK+EN/D0m91COqpR
	4sYuE+8rTriCpFaa9KZjtT7YYPI4nnZjoLaHQsI8smhTJ0lZkXW7dw3gNLwCEaym2KmuwNvSinZSp
	aM06npuuCo560dEG9DkHGClBKDN/Tq5G6OoZGSxkSYcbfpMS+D/9cqsLHQRnQB6qFCkErTK9lAh9y
	GIAwwL4Td7OWcUjY/2TQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX1hj-00060u-QY; Fri, 08 May 2020 12:02:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX1hg-00060M-Rb
 for linux-mediatek@lists.infradead.org; Fri, 08 May 2020 12:02:10 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44B0B208DB;
 Fri,  8 May 2020 12:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588939327;
 bh=MVgAInBlHbFucqqOMS2zpzCl41mt8McPbpWInuTvt7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Twetzls2F3Jeu+KmG5FUOutvjCz/WoqfrsBaX8GvAALNLGFDnKHPy8LdLPUulm0yK
 tBOfN6D3JwamP0kQgp3199ol6mSEtcR3ZeMDY8UHhllndREBSrWk/ouW1UclYwkLr1
 L125iRZ6ei661Ah3Bz5HYH2pfNhM462Cs2rBmyg0=
Date: Fri, 8 May 2020 14:02:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH net 11/16] net: ethernet: marvell: mvneta: fix fixed-link
 phydev leaks
Message-ID: <20200508120205.GA4089177@kroah.com>
References: <1480357509-28074-1-git-send-email-johan@kernel.org>
 <1480357509-28074-12-git-send-email-johan@kernel.org>
 <CA+G9fYvBjUVkVhtRHVm6xXcKe2+tZN4rGdB9FzmpcfpaLhY1+g@mail.gmail.com>
 <20200507064412.GL2042@localhost>
 <20200507064734.GA798308@kroah.com>
 <20200507111312.GA1497799@kroah.com>
 <CA+G9fYu2SrkEHyAzF57xJz5WjgHv361qdL2wPqON_pGS4Vtxmw@mail.gmail.com>
 <20200508062119.GE25962@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508062119.GE25962@localhost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_050208_931945_21B8A8FD 
X-CRM114-Status: GOOD (  17.24  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, lkft-triage@lists.linaro.org,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Fugang Duan <fugang.duan@nxp.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Netdev <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXkgMDgsIDIwMjAgYXQgMDg6MjE6MTlBTSArMDIwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IE9uIEZyaSwgTWF5IDA4LCAyMDIwIGF0IDAzOjM1OjAyQU0gKzA1MzAsIE5hcmVzaCBL
YW1ib2p1IHdyb3RlOgo+ID4gT24gVGh1LCA3IE1heSAyMDIwIGF0IDE2OjQzLCBHcmVnIEtyb2Fo
LUhhcnRtYW4KPiA+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPiA+Cj4g
PiA8dHJpbT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBHcmVnLCAzZjY1MDQ3Yzg1M2EgKCJvZl9tZGlv
OiBhZGQgaGVscGVyIHRvIGRlcmVnaXN0ZXIgZml4ZWQtbGluawo+ID4gPiA+ID4gUEhZcyIpIG5l
ZWRzIHRvIGJlIGJhY2twb3J0ZWQgYXMgd2VsbCBmb3IgdGhlc2UuCj4gPiA+ID4gPgo+ID4gPiA+
ID4gT3JpZ2luYWwgc2VyaWVzIGNhbiBiZSBmb3VuZCBoZXJlOgo+ID4gPiA+ID4KPiA+ID4gPiA+
ICAgICBodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzE0ODAzNTc1MDktMjgwNzQtMS1naXQtc2Vu
ZC1lbWFpbC1qb2hhbkBrZXJuZWwub3JnCj4gPiA+ID4KPiA+ID4gPiBBaCwgdGhhbmtzIGZvciB0
aGF0LCBJIHRob3VnaHQgSSBkcm9wcGVkIGFsbCBvZiB0aGUgb25lcyB0aGF0IGNhdXNlZAo+ID4g
PiA+IGJ1aWxkIGVycm9ycywgYnV0IG1pc3NlZCB0aGUgYWJvdmUgb25lLiAgSSdsbCBnbyB0YWtl
IHRoZSB3aG9sZSBzZXJpZXMKPiA+ID4gPiBpbnN0ZWFkLgo+ID4gPgo+ID4gPiBUaGlzIHNob3Vs
ZCBub3cgYWxsIGJlIGZpeGVkIHVwLCB0aGFua3MuCj4gPiAKPiA+IFdoaWxlIGJ1aWxkaW5nIGtl
cm5lbCBJbWFnZSBmb3IgYXJtIGFyY2hpdGVjdHVyZSBvbiBzdGFibGUtcmMgNC40IGJyYW5jaAo+
ID4gdGhlIGZvbGxvd2luZyBidWlsZCBlcnJvciBmb3VuZC4KPiA+IAo+ID4gb2ZfbWRpbzogYWRk
IGhlbHBlciB0byBkZXJlZ2lzdGVyIGZpeGVkLWxpbmsgUEhZcwo+ID4gY29tbWl0IDNmNjUwNDdj
ODUzYTJhNWFiY2Q4YWMxOTg0YWYzNDUyYjVkZjRhZGEgdXBzdHJlYW0uCj4gPiAKPiA+IEFkZCBo
ZWxwZXIgdG8gZGVyZWdpc3RlciBmaXhlZC1saW5rIFBIWXMgcmVnaXN0ZXJlZCB1c2luZwo+ID4g
b2ZfcGh5X3JlZ2lzdGVyX2ZpeGVkX2xpbmsoKS4KPiA+IAo+ID4gQ29udmVydCB0aGUgdHdvIGRy
aXZlcnMgdGhhdCBjYXJlIHRvIGRlcmVnaXN0ZXIgdGhlaXIgZml4ZWQtbGluayBQSFlzIHRvCj4g
PiB1c2UgdGhlIG5ldyBoZWxwZXIsIGJ1dCBub3RlIHRoYXQgbW9zdCBkcml2ZXJzIGN1cnJlbnRs
eSBmYWlsIHRvIGRvIHNvLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2hhbiBIb3ZvbGQgPGpv
aGFuQGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBTLiBNaWxsZXIgPGRhdmVt
QGRhdmVtbG9mdC5uZXQ+Cj4gPiBbb25seSB0YWtlIGhlbHBlciBmdW5jdGlvbiBmb3IgNC40Lnkg
LSBncmVna2hdCj4gPiAKPiA+ICAjIG1ha2UgLXNrIEtCVUlMRF9CVUlMRF9VU0VSPVR1eEJ1aWxk
IC1DL2xpbnV4IC1qMTYgQVJDSD1hcm0KPiA+IENST1NTX0NPTVBJTEU9YXJtLWxpbnV4LWdudWVh
YmloZi0gSE9TVENDPWdjYyBDQz0ic2NjYWNoZQo+ID4gYXJtLWxpbnV4LWdudWVhYmloZi1nY2Mi
IE89YnVpbGQgekltYWdlCj4gPiA3MCAjCj4gPiA3MSAuLi9kcml2ZXJzL29mL29mX21kaW8uYzog
SW4gZnVuY3Rpb24g4oCYb2ZfcGh5X2RlcmVnaXN0ZXJfZml4ZWRfbGlua+KAmToKPiA+IDcyIC4u
L2RyaXZlcnMvb2Yvb2ZfbWRpby5jOjM3OToyOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24g
b2YKPiA+IGZ1bmN0aW9uIOKAmGZpeGVkX3BoeV91bnJlZ2lzdGVy4oCZOyBkaWQgeW91IG1lYW4g
4oCYZml4ZWRfcGh5X3JlZ2lzdGVy4oCZPwo+ID4gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24t
ZGVjbGFyYXRpb25dCj4gPiA3MyAgMzc5IHwgZml4ZWRfcGh5X3VucmVnaXN0ZXIocGh5ZGV2KTsK
PiA+IDc0ICB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiA3NSAgfCBmaXhlZF9waHlfcmVnaXN0
ZXIKPiA+IDc2IC4uL2RyaXZlcnMvb2Yvb2ZfbWRpby5jOjM4MToyMjogZXJyb3I6IOKAmHN0cnVj
dCBwaHlfZGV2aWNl4oCZIGhhcyBubwo+ID4gbWVtYmVyIG5hbWVkIOKAmG1kaW/igJk7IGRpZCB5
b3UgbWVhbiDigJhtZGl44oCZPwo+ID4gNzcgIDM4MSB8IHB1dF9kZXZpY2UoJnBoeWRldi0+bWRp
by5kZXYpOyAvKiBvZl9waHlfZmluZF9kZXZpY2UoKSAqLwo+ID4gNzggIHwgXn5+fgo+ID4gNzkg
IHwgbWRpeAo+IAo+IEFub3RoZXIgZGVwZW5kZW5jeTogNWJjYmUwZjM1ZmIxICgicGh5OiBmaXhl
ZDogRml4IHJlbW92YWwgb2YgcGh5cy4iKQo+IAo+IEdyZWcsIHRoZXNlIHBhdGNoZXMgYXJlIGZy
b20gZm91ciB5ZWFycyBhZ28gc28gY2FuJ3QgcmVhbGx5IHJlbWVtYmVyIGlmCj4gdGhlcmUgYXJl
IG90aGVyIGRlcGVuZGVuY2llcyBvciByZWFzb25zIGFnYWluc3QgYmFja3BvcnRpbmcgdGhlbSAo
dGhlCj4gbWlzc2luZyBzdGFibGUgdGFncyBhcmUgcGVyIERhdmUncyBwcmVmZXJlbmNlKSwgc29y
cnkuCj4gCj4gVGhlIGNvdmVyIGxldHRlciBhbHNvIG1lbnRpb25zIGFub3RoZXIgZGVwZW5kZW5j
eSwgYnV0IHRoYXQgbWF5IGp1c3QKPiBoYXZlIGJlZW4gc29tZSBjb250ZXh0IGNvbmZsaWN0Lgo+
IAo+IFBlcmhhcHMgeW91IGJldHRlciBkcm9wIHRoZXNlIHVubGVzcyB5b3Ugd2FudCB0byByZXZp
ZXcgdGhlbSBjbG9zZXIuCgpHb29kIGlkZWEsIEkndmUgZHJvcHBlZCB0aGVtIGFsbCBmb3Igbm93
LCBzb3JyeSBmb3IgdGhlIG5vaXNlLgoKZ3JlZyBrLWgKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
