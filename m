Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AB1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:59:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F07D61177
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F07D61177
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZoLO+UcgXr7uZ9A/GEwVkK9JWfFWfKxUHSixwkU6Cr8=; b=KkrkYzLBvEQe0q
	inBTzgaRFIcbMC/nfMbmN7dq18O8HWiqmk37Eg4pvrCZq7zHvhi91OCI7O9SZSuF0gatzvEBJAZHx
	AZd6xy+R+Yd+eGG9upKkC9zrXdsFFXKvxqa9rexCdnuo5b1DX6Goi6XxchaJZKI3vhBfJD3aAZfJx
	HZgT46RKPN28QuOxPnxowFl9JIhYS2j/jnQbuYJEY/ZAnlny+WuWjaZKNgPkxlXEJEo4k25qpAZZ7
	dqe1fFyykVXUU5+gTW97UrQXbUBH4887QahSnmo731v7yPyLRvn0zh/HtJ3rqv2QxK1KcdKZce614
	p7iKIT4QVOYPfohzytpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkKA9-000m1Z-CD; Tue, 09 Nov 2021 05:59:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkKA6-000m0t-6H
 for linux-mediatek@lists.infradead.org; Tue, 09 Nov 2021 05:59:15 +0000
X-UUID: 51b635de2cb14a4f81dda651acf5bd18-20211108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=u3Y7rOgSooNJ5mSZ8l6Ju99PK0paNi5uV64VWV4jMbY=; 
 b=Txjuc0ZIlw0higt45XGCE0FVvDO43r2m0+yaQDou2mJtd6lOmbfSLVIHiR+6rerEZBCNnOEBds1340DMfATcbX1M55ibQ99SKRw/xx3y/R6u5Xd3mqPdh1qHaM9WGgfYhvEYylQ/fq8c+tL/U7H2TG0V72ZWugNYxBTsnhEfD6c=;
X-UUID: 51b635de2cb14a4f81dda651acf5bd18-20211108
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1670194553; Mon, 08 Nov 2021 22:59:06 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Nov 2021 21:59:04 -0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkexhb01.mediatek.inc (172.21.101.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 13:58:51 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 9 Nov 2021 13:58:45 +0800
Message-ID: <0982a0743a2e6fd5678719db0ac6ee74b54f3ee3.camel@mediatek.com>
Subject: Re: Distinguish mediatek drivers
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
CC: Bjorn Helgaas <helgaas@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, 
 Fan Fei <ffclaire1224@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-mediatek@lists.infradead.org>, <linux-pci@vger.kernel.org>
Date: Tue, 9 Nov 2021 13:58:45 +0800
In-Reply-To: <YYlHzMGAdO1eOQLn@rocinante>
References: <20211105202913.GA944432@bhelgaas>
 <98d237693bc618cba62e93495b7b3379c18ac6b5.camel@mediatek.com>
 <YYlHzMGAdO1eOQLn@rocinante>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_215914_255951_0B4D81D9 
X-CRM114-Status: GOOD (  17.00  )
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

SGkgS3J6eXN6dG9mLA0KDQpUaGF0J3MgcmVhbGx5IGEgZ29vZCBpZGVhLCB5ZXMsIHdlIGNhbiBj
b21iaW5lIGJvdGggZHJpdmVycyBpbnRvIGENCnNpbmdsZSBvbmUuIA0KDQpCdXQgdGhlIHJlYWwg
cHJvYmxlbSBpcyB0aGF0IHRoZSBvbGQgZHJpdmVyIGhhcyBiZWVuIHVzZWQgdG8gYSBsb3Qgb2YN
CnBsYXRmb3JtcyBhbmQgaXQgd29ya3Mgc3RhYmxlIGZvciBub3cuIFdoZW4gd2UgY29tYmluZSB0
aGVzZSBkcml2ZXJzLA0Kd2Ugd2lsbCBoYXZlIGEgdmVyeSBodWdlIGVmZm9ydCB0byBhZGp1c3Qg
dGhlIGRyaXZlciBzdHlsZSBhbmQgdGVzdCBpdA0KaW4gYWxsIHBsYXRmb3Jtcy4NCg0KV2Ugd2ls
bCBjaGVjayB0aGUgcG9zc2liaWxpdGllcyBidXQgaXQgbWF5IHRha2UgbW9yZSB0aW1lIHRvIGZp
bmlzaCB0aGUNCndvcmsuDQoNClRoYW5rcy4NCg0KT24gTW9uLCAyMDIxLTExLTA4IGF0IDE2OjUy
ICswMTAwLCBLcnp5c3p0b2YgV2lsY3p5xYRza2kgd3JvdGU6DQo+IEhlbGxvLA0KPiANCj4gWy4u
Ll0NCj4gPiA+IEJvdGggZHJpdmVycyBhcmUgYWxzbyBuYW1lZCAibXRrLXBjaWUiIGFuZCB1c2Ug
dGhlIHNhbWUgaW50ZXJuYWwNCj4gPiA+ICJtdGtfIiBwcmVmaXggb24gc3RydWN0cyBhbmQgZnVu
Y3Rpb25zLiAgTm90IGEgKmh1Z2UqIHByb2JsZW0sDQo+ID4gPiBidXQNCj4gPiA+IG5vdCByZWFs
bHkgaWRlYWwgZWl0aGVyLg0KPiANCj4gWy4uLl0NCj4gPiBUaGFua3MgZm9yIHRoZSByZW1pbmRl
ciwgSSB3aWxsIHNlbmQgcGF0Y2hlcyB0byB1cGRhdGUgdGhlc2UNCj4gPiBlbnRyaWVzLg0KPiAN
Cj4gUGVyaGFwcyBhIHNpbGx5IHF1ZXN0aW9uLCBidXQgd291bGQgaXQgYmUgcG9zc2libGUgdG8g
Y29tYmluZSBib3RoDQo+IGRyaXZlcnMNCj4gaW50byBhIHNpbmdsZSBvbmUgdGhhdCBoYW5kbGVz
cyBkZXZpY2VzIGFjcm9zcyBhbGwgZ2VuZXJhdGlvbnM/DQo+IA0KPiAJS3J6eXN6dG9mDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
