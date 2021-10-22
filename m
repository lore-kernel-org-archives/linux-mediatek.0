Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EAEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 06:45:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B082E60FE7
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 06:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B082E60FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uTgwb3pFWEsrFXijjh2YLVUuACejxkQr4kcNnlMxJw=; b=i+MBLWQb1zYsdbF8lkL9penrm2
	N1hCEXE2/JbsgEAuPp1lvHY7el6swSSlacsXG4pa0xEwL9PdjStxiEO4AtEOnsN5QLCLHKESOV3IA
	7yGrsj2SVT0BCRwDzyEvmDwUrLVchM/zMmD1u5Z/qrs+2NkHZyddc2w1DTOoXR+BKfVP6gIDPC5GF
	6mPxxoduCYVD7zp56zdlyYzdzwxqOP1TdWeHal4uNFC1Q6gUHUa4507psenKFp6i5TQNuDYHpKyay
	jDriKE2gAH0+C973DGe4htsDTZ14aOZkenb0SzUe12cOFwnXTrFSNtpQpztDvT9LLae/StLQSKFWX
	3b2eCaQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdoIK-009pkf-I0; Fri, 22 Oct 2021 06:44:48 +0000
Received: from mout-u-107.mailbox.org ([2001:67c:2050:1::465:107])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdoI6-009pjN-Uq; Fri, 22 Oct 2021 06:44:36 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4HbFFS5mZjzQkB9;
 Fri, 22 Oct 2021 08:44:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Subject: Re: [PATCH] i2c: mt76xx: add I2C_FUNC_NOSTART and I2C_M_REV_DIR_ADDR
To: "zhaojh329@gmail.com" <zhaojh329@gmail.com>
Cc: "matthias.bgg" <matthias.bgg@gmail.com>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <202110200007146639874@gmail.com>
From: Stefan Roese <sr@denx.de>
Message-ID: <12006f4c-137c-4d78-fbaa-40776c65f079@denx.de>
Date: Fri, 22 Oct 2021 08:44:24 +0200
MIME-Version: 1.0
In-Reply-To: <202110200007146639874@gmail.com>
Content-Language: en-US
X-Rspamd-Queue-Id: 688E1131C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_234435_182401_35229986 
X-CRM114-Status: GOOD (  20.25  )
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

T24gMTkuMTAuMjEgMTg6MDcsIHpoYW9qaDMyOUBnbWFpbC5jb20gd3JvdGU6Cj4gIMKgVGhpcyBw
YXRjaCBhZGRzIEkyQ19GVU5DX05PU1RBUlQgYW5kIEkyQ19NX1JFVl9ESVJfQUREUiBzdXBwb3J0
IGZvcgo+IE1lZGlhVGVrIE1UNzYyMS83NjI4Lzc2ODguIFRoaXMgaXMgdXNlZnVsIGZvciBzb21l
IEkyQyBzbGF2ZSBjaGlwcywKPiBzdWNoIGFzICdkcml2ZXJzL2lucHV0L2pveXN0aWNrL2FzNTAx
MS5jJy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKaWFuaHVpIFpoYW8gPHpoYW9qaDMyOUBnbWFpbC5j
b20+Cj4gLS0tCj4gICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NzYyMS5jIHwgOSArKysrKysr
Ky0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDc2MjEuYyBiL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtbXQ3NjIxLmMKPiBpbmRleCA0NWZlNGE3ZmUwYzAuLjNkMjc2M2Q5YzA5
MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW10NzYyMS5jCj4gKysrIGIv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDc2MjEuYwo+IEBAIC0xNTAsNiArMTUwLDkgQEAgc3Rh
dGljIGludCBtdGtfaTJjX21hc3Rlcl94ZmVyKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCwgc3Ry
dWN0IGkyY19tc2cgKm1zZ3MsCj4gICAJZm9yIChpID0gMDsgaSA8IG51bTsgaSsrKSB7Cj4gICAJ
CXBtc2cgPSAmbXNnc1tpXTsKPiAgIAo+ICsJCWlmIChwbXNnLT5mbGFncyAmIEkyQ19NX05PU1RB
UlQpCj4gKwkJCWdvdG8gbm9zdGFydDsKPiArCj4gICAJCS8qIHdhaXQgaGFyZHdhcmUgaWRsZSAq
Lwo+ICAgCQlyZXQgPSBtdGtfaTJjX3dhaXRfaWRsZShpMmMpOwo+ICAgCQlpZiAocmV0KQo+IEBA
IC0xNzQsNiArMTc3LDggQEAgc3RhdGljIGludCBtdGtfaTJjX21hc3Rlcl94ZmVyKHN0cnVjdCBp
MmNfYWRhcHRlciAqYWRhcCwgc3RydWN0IGkyY19tc2cgKm1zZ3MsCj4gICAJCX0gZWxzZSB7Cj4g
ICAJCQkvKiA3IGJpdHMgYWRkcmVzcyAqLwo+ICAgCQkJYWRkciA9IGkyY184Yml0X2FkZHJfZnJv
bV9tc2cocG1zZyk7Cj4gKwkJCWlmIChwbXNnLT5mbGFncyAmIEkyQ19NX1JFVl9ESVJfQUREUikK
PiArCQkJCWFkZHIgXj0gMTsKPiAgIAkJCWlvd3JpdGUzMihhZGRyLCBpMmMtPmJhc2UgKyBSRUdf
U00wRDBfUkVHKTsKPiAgIAkJCXJldCA9IG10a19pMmNfbWFzdGVyX2NtZChpMmMsIFNNMENUTDFf
V1JJVEUsIDEpOwo+ICAgCQkJaWYgKHJldCkKPiBAQCAtMTg3LDYgKzE5Miw3IEBAIHN0YXRpYyBp
bnQgbXRrX2kyY19tYXN0ZXJfeGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsIHN0cnVjdCBp
MmNfbXNnICptc2dzLAo+ICAgCQkJCWdvdG8gZXJyX2FjazsKPiAgIAkJfQo+ICAgCj4gK25vc3Rh
cnQ6Cj4gICAJCS8qIHRyYW5zZmVyIGRhdGEgKi8KPiAgIAkJZm9yIChsZW4gPSBwbXNnLT5sZW4s
IGogPSAwOyBsZW4gPiAwOyBsZW4gLT0gOCwgaiArPSA4KSB7Cj4gICAJCQlwYWdlX2xlbiA9IChs
ZW4gPj0gOCkgPyA4IDogbGVuOwo+IEBAIC0yNDIsNyArMjQ4LDggQEAgc3RhdGljIGludCBtdGtf
aTJjX21hc3Rlcl94ZmVyKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCwgc3RydWN0IGkyY19tc2cg
Km1zZ3MsCj4gICAKPiAgIHN0YXRpYyB1MzIgbXRrX2kyY19mdW5jKHN0cnVjdCBpMmNfYWRhcHRl
ciAqYSkKPiAgIHsKPiAtCXJldHVybiBJMkNfRlVOQ19JMkMgfCBJMkNfRlVOQ19TTUJVU19FTVVM
IHwgSTJDX0ZVTkNfUFJPVE9DT0xfTUFOR0xJTkc7Cj4gKwlyZXR1cm4gSTJDX0ZVTkNfSTJDIHwg
STJDX0ZVTkNfU01CVVNfRU1VTCB8IEkyQ19GVU5DXzEwQklUX0FERFIKPiArCQl8IEkyQ19GVU5D
X1BST1RPQ09MX01BTkdMSU5HIHwgSTJDX0ZVTkNfTk9TVEFSVDsKCk5pdDogSSBwcmVmZXIgdG8g
aGF2ZSB0aGUgInwiIGF0IHRoZSBlbmQgb2YgdGhlIHVwcGVyIGxpbmUgaW5zdGVhZCBvZgphZGRp
bmcgaXQgaW4gdGhlIDJuZCBsaW5lLgoKT3RoZXIgdGhhdCB0aGlzOgoKUmV2aWV3ZWQtYnk6IFN0
ZWZhbiBSb2VzZSA8c3JAZGVueC5kZT4KClRoYW5rcywKU3RlZmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
