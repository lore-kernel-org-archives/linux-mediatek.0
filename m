Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD29C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 14:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHWVXxL11MaSP7fDCVS2yMF1pzw0NWgexA6bcgSSHLk=; b=RklkRp7PDzPbQ8
	tMgKCvZYjrROeQBED1OzCKEPDzxs/0rTpdcguLCMyshCyLGn15KTp9u7/09grKDutY/P2cAnH8363
	8spA8yJ7MlxioI3kAsB6npHLn08jHOqUMqQCOV3Sb7+gcNfjJJo7dpTp2s4vgiGayswVTEOtWBxM5
	ukFO2cJ9zmd6cwBj9VAkoZpzIjROthomi/4StNqg0T+R/QtPVi4r9IOkXGvyJP9U1QZq2OblQPGkh
	L2aAjXbJivj4xegf+6H87Wajc6r3WuwrbZOrfOHQJbkQ2kAHGwbwlyhd1b8X6FOFcvE5CKaMH2MHN
	ewcUSrIjK5Tdmq0lYurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHoGe-000Qu7-Kl; Wed, 09 Feb 2022 14:48:24 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHoGR-000Qs3-Se; Wed, 09 Feb 2022 14:48:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1644418054; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TjSgu9sZsyKr/hEIFKeJoy8pAugybVEUIG2BbddlTrs/AzVW06uYW0wauusGZd1/x2gqVFeErVdMmZTGCV977DymOq79p4kbgo0g8G/TTySGUNIuIBucp4FqADBDddVFu45vp9XSpagMGUCLyrlLsASlnwdqVMrhsmhQAySobVE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1644418054;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=kmwejnD0khrSw7Jzk3gPGadOWupapvsORfk9uYGhYd8=; 
 b=ZfRt3CP6bd8JCsvrDkWACX5GpUwqQH8HPkoDpdKMq0KlyXyLVrvP4BF63Csvjie+bhLvvPKdwZR+gGYEqcFz7yDUJzB/yfWFOTS7wBtnyPB3W3g3g+DXbAhGCedhmLhnmlpkJ1KOF+wKJshTEph8ljTgN92mEtxp0UDiX0Sjr14=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1644418054; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=kmwejnD0khrSw7Jzk3gPGadOWupapvsORfk9uYGhYd8=;
 b=dtNvbm1VL5aQ7kRJ3HU8prbsmNoyKbtJT6VpnGh3kx9eJngRuoRUbnyu6offD4tt
 y9tws15N7pKZwvLJgg4u1Kj6ngAU/o9Trel972AB06beF6VH61aRGTihbjkf0PqFbAl
 JWjqjnvn3w6MV7vuG9bf+d8ZvcKZZGtXwriz2P5c=
Received: from [10.10.10.216] (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1644418053600780.3051547022845;
 Wed, 9 Feb 2022 06:47:33 -0800 (PST)
Message-ID: <24eba648-9029-e66f-aa2c-31ddbc7b1199@arinc9.com>
Date: Wed, 9 Feb 2022 17:47:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH net] net: phy: mediatek: remove PHY mode check on MT7531
Content-Language: en-US
To: DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>
References: <20220209143948.445823-1-dqfext@gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20220209143948.445823-1-dqfext@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_064812_001704_6BC7E8F2 
X-CRM114-Status: GOOD (  13.89  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMDkvMDIvMjAyMiAxNzozOSwgREVORyBRaW5nZmFuZyB3cm90ZToKPiBUaGUgZnVuY3Rpb24g
bXQ3NTMxX3BoeV9tb2RlX3N1cHBvcnRlZCBpbiB0aGUgRFNBIGRyaXZlciBzZXQgc3VwcG9ydGVk
Cj4gbW9kZSB0byBQSFlfSU5URVJGQUNFX01PREVfR01JSSBpbnN0ZWFkIG9mIFBIWV9JTlRFUkZB
Q0VfTU9ERV9JTlRFUk5BTAo+IGZvciB0aGUgaW50ZXJuYWwgUEhZLCBzbyB0aGlzIGNoZWNrIGJy
ZWFrcyB0aGUgUEhZIGluaXRpYWxpemF0aW9uOgo+IAo+IG10NzUzMCBtZGlvLWJ1czowMCB3YW4g
KHVuaW5pdGlhbGl6ZWQpOiBmYWlsZWQgdG8gY29ubmVjdCB0byBQSFk6IC1FSU5WQUwKPiAKPiBS
ZW1vdmUgdGhlIGNoZWNrIHRvIG1ha2UgaXQgd29yayBhZ2Fpbi4KPiAKPiBSZXBvcnRlZC1ieTog
SGF1a2UgTWVocnRlbnMgPGhhdWtlQGhhdWtlLW0uZGU+Cj4gRml4ZXM6IGU0MGQyY2NhMDE4OSAo
Im5ldDogcGh5OiBhZGQgTWVkaWFUZWsgR2lnYWJpdCBFdGhlcm5ldCBQSFkgZHJpdmVyIikKPiBT
aWduZWQtb2ZmLWJ5OiBERU5HIFFpbmdmYW5nIDxkcWZleHRAZ21haWwuY29tPgo+IC0tLQo+ICAg
ZHJpdmVycy9uZXQvcGh5L21lZGlhdGVrLWdlLmMgfCAzIC0tLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3BoeS9tZWRpYXRl
ay1nZS5jIGIvZHJpdmVycy9uZXQvcGh5L21lZGlhdGVrLWdlLmMKPiBpbmRleCBiN2E1YWUyMGVk
ZDUuLjY4ZWU0MzRmOWRlYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9waHkvbWVkaWF0ZWst
Z2UuYwo+ICsrKyBiL2RyaXZlcnMvbmV0L3BoeS9tZWRpYXRlay1nZS5jCj4gQEAgLTU1LDkgKzU1
LDYgQEAgc3RhdGljIGludCBtdDc1MzBfcGh5X2NvbmZpZ19pbml0KHN0cnVjdCBwaHlfZGV2aWNl
ICpwaHlkZXYpCj4gICAKPiAgIHN0YXRpYyBpbnQgbXQ3NTMxX3BoeV9jb25maWdfaW5pdChzdHJ1
Y3QgcGh5X2RldmljZSAqcGh5ZGV2KQo+ICAgewo+IC0JaWYgKHBoeWRldi0+aW50ZXJmYWNlICE9
IFBIWV9JTlRFUkZBQ0VfTU9ERV9JTlRFUk5BTCkKPiAtCQlyZXR1cm4gLUVJTlZBTDsKPiAtCj4g
ICAJbXRrX2dlcGh5X2NvbmZpZ19pbml0KHBoeWRldik7Cj4gICAKPiAgIAkvKiBQSFkgbGluayBk
b3duIHBvd2VyIHNhdmluZyBlbmFibGUgKi8KClRoYW5rcyBmb3Igc3VibWl0dGluZyB0aGlzIQoK
QWNrZWQtYnk6IEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KCkNoZWVycy4K
QXLEsW7DpwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
