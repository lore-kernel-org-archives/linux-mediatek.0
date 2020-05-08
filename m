Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52765C38A2A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 06:21:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2822C20708
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 06:21:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RUOGk8zW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2822C20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZpnsYOHN93Ke5cveyqtT7kmYkBsdezteFc6smgpAV5E=; b=RUOGk8zWB/JARx
	duUSNxNzt1X0WpJ+W5+PogCGFB5B4M0B0wKjp86zHHZ9NdW+LS3lss08ZdNGC2oanEOEmhn0rOVDq
	sVUhQF3s0AhoXPFi56SgxEge3Tvar6ptj0v9JJefLLkzsUbJTXmj2fv8fXx9qmoqHhexWKFLqZu7j
	hSM3veyX+fy2hanv4uHk71zwvCiV2y3vpffvZuLIAFUrdC/4bpa4r0K2fs9DnZ5eh/goCHTKlN9Yi
	z4/OsjP1ekmOVmJIviyovAV1SWU9Wkvqy37E54MtXYncc1NzSlIDFWIU/OWGgbad8hqccL01IHe94
	n9qjSTG41hSGFXNUODwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWwO1-0004yM-ME; Fri, 08 May 2020 06:21:29 +0000
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWwNz-0004wq-Bo
 for linux-mediatek@lists.infradead.org; Fri, 08 May 2020 06:21:28 +0000
Received: by mail-lj1-f193.google.com with SMTP id a21so439647ljb.9
 for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2020 23:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=l07sjg7wad11JybQiwBPplAsmA/VCV2GQr8sTEyBm88=;
 b=ZBH9h5suxzsf7Jjknt4rc3McIK+qjp09GRdENDjGo9xL6dtLxBBOZs4m19sRqQnuGb
 +65cT1CzfSCdpeBwgqV7EK2rNT+fJ4DQJjyamc+MFEcJ96vZ0qhX9TBJfvTNqK2gM461
 kLb/Wh4Bb24ubvrN4eOEqrBpzR0lrG2UdD8g8me7z8Vju5GnaUWbmoEX6IZZeZbOdaI0
 zlNNIV7cNgZj1vcjfqPBQHUzdfUBoB10R/HWj/TQti87dyYj83w9bNWp5NoUeq8GngW3
 t5UWitK/PqWlNjq4nX1zBnOS52DHPFXn3/jsgRjRQHwqjeFAZ30fM+VFJqmvp47GuKLw
 z8HQ==
X-Gm-Message-State: AOAM532gCfR/ptc/WKOdmh19NHjyW1HlLvEwXwXMfGrBBcFkhLH+WHIF
 t+/dGGj3Q5Y9LaQoC5kj2f8=
X-Google-Smtp-Source: ABdhPJzQwccjomPZVXTofZDq7QNMtMm+acyePCPBUNykc5Wt6G9pf/ArU7L/ehrFMv9M6FmHt7FVvw==
X-Received: by 2002:a05:651c:549:: with SMTP id
 q9mr624525ljp.236.1588918884533; 
 Thu, 07 May 2020 23:21:24 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id z64sm428692lfa.50.2020.05.07.23.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:21:23 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jWwNr-0001TQ-0H; Fri, 08 May 2020 08:21:19 +0200
Date: Fri, 8 May 2020 08:21:19 +0200
From: Johan Hovold <johan@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH net 11/16] net: ethernet: marvell: mvneta: fix fixed-link
 phydev leaks
Message-ID: <20200508062119.GE25962@localhost>
References: <1480357509-28074-1-git-send-email-johan@kernel.org>
 <1480357509-28074-12-git-send-email-johan@kernel.org>
 <CA+G9fYvBjUVkVhtRHVm6xXcKe2+tZN4rGdB9FzmpcfpaLhY1+g@mail.gmail.com>
 <20200507064412.GL2042@localhost>
 <20200507064734.GA798308@kroah.com>
 <20200507111312.GA1497799@kroah.com>
 <CA+G9fYu2SrkEHyAzF57xJz5WjgHv361qdL2wPqON_pGS4Vtxmw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYu2SrkEHyAzF57xJz5WjgHv361qdL2wPqON_pGS4Vtxmw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_232127_399518_1670D51D 
X-CRM114-Status: GOOD (  15.14  )
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>,
 Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Fugang Duan <fugang.duan@nxp.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, nios2-dev@lists.rocketboards.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXkgMDgsIDIwMjAgYXQgMDM6MzU6MDJBTSArMDUzMCwgTmFyZXNoIEthbWJvanUg
d3JvdGU6Cj4gT24gVGh1LCA3IE1heSAyMDIwIGF0IDE2OjQzLCBHcmVnIEtyb2FoLUhhcnRtYW4K
PiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4KPiA8dHJpbT4KPiA+ID4g
Pgo+ID4gPiA+IEdyZWcsIDNmNjUwNDdjODUzYSAoIm9mX21kaW86IGFkZCBoZWxwZXIgdG8gZGVy
ZWdpc3RlciBmaXhlZC1saW5rCj4gPiA+ID4gUEhZcyIpIG5lZWRzIHRvIGJlIGJhY2twb3J0ZWQg
YXMgd2VsbCBmb3IgdGhlc2UuCj4gPiA+ID4KPiA+ID4gPiBPcmlnaW5hbCBzZXJpZXMgY2FuIGJl
IGZvdW5kIGhlcmU6Cj4gPiA+ID4KPiA+ID4gPiAgICAgaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcv
ci8xNDgwMzU3NTA5LTI4MDc0LTEtZ2l0LXNlbmQtZW1haWwtam9oYW5Aa2VybmVsLm9yZwo+ID4g
Pgo+ID4gPiBBaCwgdGhhbmtzIGZvciB0aGF0LCBJIHRob3VnaHQgSSBkcm9wcGVkIGFsbCBvZiB0
aGUgb25lcyB0aGF0IGNhdXNlZAo+ID4gPiBidWlsZCBlcnJvcnMsIGJ1dCBtaXNzZWQgdGhlIGFi
b3ZlIG9uZS4gIEknbGwgZ28gdGFrZSB0aGUgd2hvbGUgc2VyaWVzCj4gPiA+IGluc3RlYWQuCj4g
Pgo+ID4gVGhpcyBzaG91bGQgbm93IGFsbCBiZSBmaXhlZCB1cCwgdGhhbmtzLgo+IAo+IFdoaWxl
IGJ1aWxkaW5nIGtlcm5lbCBJbWFnZSBmb3IgYXJtIGFyY2hpdGVjdHVyZSBvbiBzdGFibGUtcmMg
NC40IGJyYW5jaAo+IHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3IgZm91bmQuCj4gCj4gb2ZfbWRp
bzogYWRkIGhlbHBlciB0byBkZXJlZ2lzdGVyIGZpeGVkLWxpbmsgUEhZcwo+IGNvbW1pdCAzZjY1
MDQ3Yzg1M2EyYTVhYmNkOGFjMTk4NGFmMzQ1MmI1ZGY0YWRhIHVwc3RyZWFtLgo+IAo+IEFkZCBo
ZWxwZXIgdG8gZGVyZWdpc3RlciBmaXhlZC1saW5rIFBIWXMgcmVnaXN0ZXJlZCB1c2luZwo+IG9m
X3BoeV9yZWdpc3Rlcl9maXhlZF9saW5rKCkuCj4gCj4gQ29udmVydCB0aGUgdHdvIGRyaXZlcnMg
dGhhdCBjYXJlIHRvIGRlcmVnaXN0ZXIgdGhlaXIgZml4ZWQtbGluayBQSFlzIHRvCj4gdXNlIHRo
ZSBuZXcgaGVscGVyLCBidXQgbm90ZSB0aGF0IG1vc3QgZHJpdmVycyBjdXJyZW50bHkgZmFpbCB0
byBkbyBzby4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0
Pgo+IFtvbmx5IHRha2UgaGVscGVyIGZ1bmN0aW9uIGZvciA0LjQueSAtIGdyZWdraF0KPiAKPiAg
IyBtYWtlIC1zayBLQlVJTERfQlVJTERfVVNFUj1UdXhCdWlsZCAtQy9saW51eCAtajE2IEFSQ0g9
YXJtCj4gQ1JPU1NfQ09NUElMRT1hcm0tbGludXgtZ251ZWFiaWhmLSBIT1NUQ0M9Z2NjIENDPSJz
Y2NhY2hlCj4gYXJtLWxpbnV4LWdudWVhYmloZi1nY2MiIE89YnVpbGQgekltYWdlCj4gNzAgIwo+
IDcxIC4uL2RyaXZlcnMvb2Yvb2ZfbWRpby5jOiBJbiBmdW5jdGlvbiDigJhvZl9waHlfZGVyZWdp
c3Rlcl9maXhlZF9saW5r4oCZOgo+IDcyIC4uL2RyaXZlcnMvb2Yvb2ZfbWRpby5jOjM3OToyOiBl
cnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YKPiBmdW5jdGlvbiDigJhmaXhlZF9waHlfdW5y
ZWdpc3RlcuKAmTsgZGlkIHlvdSBtZWFuIOKAmGZpeGVkX3BoeV9yZWdpc3RlcuKAmT8KPiBbLVdl
cnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiA3MyAgMzc5IHwgZml4ZWRfcGh5
X3VucmVnaXN0ZXIocGh5ZGV2KTsKPiA3NCAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fgo+IDc1ICB8
IGZpeGVkX3BoeV9yZWdpc3Rlcgo+IDc2IC4uL2RyaXZlcnMvb2Yvb2ZfbWRpby5jOjM4MToyMjog
ZXJyb3I6IOKAmHN0cnVjdCBwaHlfZGV2aWNl4oCZIGhhcyBubwo+IG1lbWJlciBuYW1lZCDigJht
ZGlv4oCZOyBkaWQgeW91IG1lYW4g4oCYbWRpeOKAmT8KPiA3NyAgMzgxIHwgcHV0X2RldmljZSgm
cGh5ZGV2LT5tZGlvLmRldik7IC8qIG9mX3BoeV9maW5kX2RldmljZSgpICovCj4gNzggIHwgXn5+
fgo+IDc5ICB8IG1kaXgKCkFub3RoZXIgZGVwZW5kZW5jeTogNWJjYmUwZjM1ZmIxICgicGh5OiBm
aXhlZDogRml4IHJlbW92YWwgb2YgcGh5cy4iKQoKR3JlZywgdGhlc2UgcGF0Y2hlcyBhcmUgZnJv
bSBmb3VyIHllYXJzIGFnbyBzbyBjYW4ndCByZWFsbHkgcmVtZW1iZXIgaWYKdGhlcmUgYXJlIG90
aGVyIGRlcGVuZGVuY2llcyBvciByZWFzb25zIGFnYWluc3QgYmFja3BvcnRpbmcgdGhlbSAodGhl
Cm1pc3Npbmcgc3RhYmxlIHRhZ3MgYXJlIHBlciBEYXZlJ3MgcHJlZmVyZW5jZSksIHNvcnJ5LgoK
VGhlIGNvdmVyIGxldHRlciBhbHNvIG1lbnRpb25zIGFub3RoZXIgZGVwZW5kZW5jeSwgYnV0IHRo
YXQgbWF5IGp1c3QKaGF2ZSBiZWVuIHNvbWUgY29udGV4dCBjb25mbGljdC4KClBlcmhhcHMgeW91
IGJldHRlciBkcm9wIHRoZXNlIHVubGVzcyB5b3Ugd2FudCB0byByZXZpZXcgdGhlbSBjbG9zZXIu
CgpKb2hhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
