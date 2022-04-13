Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD05C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 08:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NE/sBRglAHMUQfj7vHlZ3QXvp6DIKS/9N2FIhh9chbE=; b=pWZBNCYRw/pdUw
	BNo/+JSarcvYdp8l97mFpX9F7QozGi+JA0tiXrZ6MTC6wO01vo6oYSQmbGonfUUuWyQD6rAYdtHE/
	nA7zwKTuX7XL2iIgwepjQbPRt80iVJpye5x4zxqnNOKFymXNkMCG+aGggmg5N96yYq2aK/NksOjN6
	RlXa7YvAimpCBR0vxa1rn6nNHAelI82wt2HXQD+RUHWRe2UYO2MX7vPhKM+qCrk2jedUt0LgvjfrE
	Y3TiXrts6Jm48c8ClADowYThswARCLdN43haCsS3j64+ak0xHYsHPHorHR+ShY0kBmLFyyThCwxyz
	DQuR7pKVR01pAiNuvdLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYOH-0004Tk-Ah; Wed, 13 Apr 2022 08:30:17 +0000
Received: from relay.hostedemail.com ([64.99.140.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYO3-0004L2-D6; Wed, 13 Apr 2022 08:30:04 +0000
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay13.hostedemail.com (Postfix) with ESMTP id E6D7960B0F;
 Wed, 13 Apr 2022 08:29:57 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf12.hostedemail.com (Postfix) with ESMTPA id D72BC1D; 
 Wed, 13 Apr 2022 08:29:54 +0000 (UTC)
Message-ID: <d0ed8518dfb93e6f2bbbaf4aac3436dd20369c00.camel@perches.com>
Subject: Re: [PATCH 08/14] MAINTAINERS: add Ralink pinctrl driver
From: Joe Perches <joe@perches.com>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, Sergio
 Paracuellos <sergio.paracuellos@gmail.com>, Luiz Angelo Daros de Luca
 <luizluca@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger
 <matthias.bgg@gmail.com>
Cc: erkin.bozoglu@xeront.com, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org
Date: Wed, 13 Apr 2022 01:29:53 -0700
In-Reply-To: <20220413060729.27639-9-arinc.unal@arinc9.com>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <20220413060729.27639-9-arinc.unal@arinc9.com>
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
X-Stat-Signature: zhuoxxoync4pzqz7sdbq39i3jeft38mk
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: D72BC1D
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18hGnWBYKAheXpW4IDdjP9YcLGcKeoboe4=
X-HE-Tag: 1649838594-350832
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_013003_540186_F51F56B6 
X-CRM114-Status: GOOD (  10.20  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIyLTA0LTEzIGF0IDA5OjA3ICswMzAwLCBBcsSxbsOnIMOcTkFMIHdyb3RlOgo+
IEFkZCBhIG5ldyBzZWN0aW9uIGZvciB0aGUgUmFsaW5rIHBpbmN0cmwgZHJpdmVyIGFuZCBhZGQg
bWUgYW5kIFNlcmdpbyBhcwo+IHRoZSBtYWludGFpbmVycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
csSxbsOnIMOcTkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+CgpJdCdzIHVudXN1YWwgZm9yIGEg
bGFzdCBuYW1lIHRvIGJlIGNvbXBsZXRlbHkgY2FwaXRhbGl6ZWQuCgo+IGRpZmYgLS1naXQgYS9N
QUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCltdCj4gQEAgLTE2NTAyLDYgKzE2NTAyLDEzIEBAIEw6
CWxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnCj4gIFM6CU1haW50YWluZWQKPiAgRjoJYXJjaC9t
aXBzL2Jvb3QvZHRzL3JhbGluay9tdDc2MjEqCj4gIAo+ICtSQUxJTksgUElOQ1RSTCBEUklWRVIK
PiArTToJQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPgo+ICtNOglTZXJnaW8g
UGFyYWN1ZWxsb3MgPHNlcmdpby5wYXJhY3VlbGxvc0BnbWFpbC5jb20+Cj4gK0w6CWxpbnV4LW1p
cHNAdmdlci5rZXJuZWwub3JnCj4gK1M6CU1haW50YWluZWQKPiArRjoJZHJpdmVycy9waW5jdHJs
L3JhbGluay8qCgpUeXBpY2FsbHkgdGhpcyBpcyBqdXN0IHRoZSBkaXJlY3RvcnkuCgpGOglkcml2
ZXJzL3BpbmN0cmwvcmFsaW5rLwoKYXMgdGhpcyBjb3ZlcnMgYW55IGZpbGUgaW4gdGhlIGRpcmVj
dG9yeSBhcyB3ZWxsIGFzCmFueSBwb3NzaWJsZSBzdWJkaXJlY3RvcmllcyBhbmQgZmlsZXMuCgpV
c2luZwoKRjoJZHJpdmVycy9waW5jdHJsL3JhbGluay8qCgpleGNsdWRlcyBhbnkgcG9zc2libGUg
c3ViZGlyZWN0b3JpZXMgYW5kIGZpbGVzIHdpdGhpbiB0aG9zZQpwb3NzaWJsZSBzdWJkaXJlY3Rv
cmllcy4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
