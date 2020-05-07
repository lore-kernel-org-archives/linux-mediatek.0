Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60F1C38A2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 13:17:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99C2F20838
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 13:17:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p8vudhfR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="tTp2bzTI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99C2F20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8xxiPSTpkvYhjsMmp5rWuxUBA8SMjTmF/ZdmARwza8=; b=p8vudhfRa9rOCl
	/2cN1TuINSLdZIHKVy4OeoK1nyAW+yPnWfyjvvn+7hl+MbjfazX9rZiUStz/hTZ1pJnKIc99s27NA
	e6EMJHSWTqvqAeikGaj3Jr9J9yLtP0be9Lv9RBTsXKJiqcua4e/1WgTpgM47hTRJ8LLbp0eHT7qq5
	qqFutDNBX9fOLdfAudkb0zDQO1dU0XNDz9BJaQZFVK7u9xRidlKXljhIaNreYAu79oBeYvfSCNOty
	vV+X+iBeq/dCA1OFemLgVKf+4bEs4K3p61UvcwtUO1O2+DoXz1vzye0QY/xBLFGVr4z6VzBkH+f+H
	/1Ej49L+060n1SJR2BFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWgOa-0004CN-CF; Thu, 07 May 2020 13:17:00 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWgOX-0004Bt-PK; Thu, 07 May 2020 13:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vk41FiGE7OzvR4Ex8ve/e7chOhsCEpaO414K5RXlxrY=; b=tTp2bzTIB3i1MnLPqrNbuPXcsY
 WfQt9FVPRWRBztAkewuKACD/1WAg2q6auQUsYJkw/msyPR0OQHQUOfsrFWcF1lafu47rbBSjN6NPB
 Qbfxri/uC9wv8/ac2eZpekCVKVOOnEnfoIX3VyRlq9uVhbKjNL/MKC3Cpp8aRITHl6Jo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1jWgOL-001E3q-DR; Thu, 07 May 2020 15:16:45 +0200
Date: Thu, 7 May 2020 15:16:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 06/11] net: ethernet: mtk-eth-mac: new driver
Message-ID: <20200507131645.GM208718@lunn.ch>
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-7-brgl@bgdev.pl>
 <1588844771.5921.27.camel@mtksdccf07>
 <CAMpxmJW4qZ_Wnp_oRa=j=YnvTzVa3HZ13Hgwy71jS6L3Bd3oMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMpxmJW4qZ_Wnp_oRa=j=YnvTzVa3HZ13Hgwy71jS6L3Bd3oMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_061657_821424_F7611AD3 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-devicetree <devicetree@vger.kernel.org>,
 Felix Fietkau <nbd@openwrt.org>, Arnd Bergmann <arnd@arndb.de>,
 netdev <netdev@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sean Wang <sean.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "Mark-MC.Lee" <Mark-MC.Lee@mediatek.com>,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXkgMDcsIDIwMjAgYXQgMTI6NTA6MTVQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBjencuLCA3IG1haiAyMDIwIG8gMTE6NDYgTWFyay1NQy5MZWUgPE1hcmst
TUMuTGVlQG1lZGlhdGVrLmNvbT4gbmFwaXNhxYIoYSk6Cj4gPgo+ID4gSGkgQmFydG9zejoKPiA+
ICBJIHRoaW5rIHRoZSBuYW1pbmcgb2YgdGhpcyBkcml2ZXIgYW5kIGl0cyBLY29uZmlnIG9wdGlv
biBpcyB0b28gZ2VuZXJpYwo+ID4gdGhhdCB3aWxsIGNvbmZ1c2Ugd2l0aCBjdXJyZW50IG1lZGlh
dGVrIFNvQ3MgZXRoIGRyaXZlciBhcmNoaXRlY3R1cmUoZm9yCj4gPiBhbGwgbXQ3eHh4IFNvQ3Mp
Lgo+ID4gICBTaW5jZSBtdGtfZXRoX21hYy5jIGlzIG5vdCBhIGNvbW1vbiBNQUMgcGFydCBmb3Ig
YWxsIG1lZGlhdGVrIFNvQyBidXQKPiA+IG9ubHkgYSBzcGVjaWZpYyBldGggZHJpdmVyIGZvciBt
dDg1eHgsIGl0IHdpbGwgYmUgbW9yZSByZWFzb25hYmxlIHRvCj4gPiBuYW1lIGl0IGFzIG10ODV4
eF9ldGguYyBhbmQgY2hhbmdlIE5FVF9NRURJQVRFS19NQUMgdG8KPiA+IE5FVF9NRURJQVRFS19N
VDg1WFguIEhvdyBkbyB5b3UgdGhpbms/Cj4gPgo+IAo+IEhpIE1hcmssCj4gCj4gSSBhY3R1YWxs
eSBjb25zdWx0ZWQgdGhpcyB3aXRoIE1lZGlhVGVrIGFuZCB0aGUgbmFtZSBpcyB0aGVpciBpZGVh
Lgo+IE1hbnkgZHJpdmVycyBpbiBkcml2ZXJzL25ldC9ldGhlcm5ldCBoYXZlIHZlcnkgdmFndWUg
bmFtZXMuIEkgZ3Vlc3MKPiB0aGlzIGlzbid0IGEgcHJvYmxlbS4KClRoZXkgaGF2ZSB2YWd1ZSBu
YW1lcywgYnV0IHRoZXkgdGVuZCB0byBiZSBub3QgY29uZnVzaW5nLgoKTkVUX01FRElBVEVLX01B
QyB2cyBORVRfTUVESUFURUtfU09DIGlzIGNvbmZ1c2luZy4KCkkgdGhpbmsgdGhlIHByb3Bvc2Vk
IG5hbWUsIG10ODV4eF9ldGguYyBhbmQgTkVUX01FRElBVEVLX01UODVYWCBpcwpnb29kLiBPciBz
b21lIHZhcmlhbnQgb24gdGhpcywgbXQ4eHh4PwoKICAgIEFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
