Return-Path: <SRS0=YyAn=5V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB612C2BA1E
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 21:43:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B8EA206F8
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 21:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kYQS7HHb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gRTssLRK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B8EA206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkL6DTR00ctk5wP8viEDJpugmGGu36a2m95dQmAzby8=; b=kYQS7HHbLYqjoM
	2TtiWHUW013Ft6VU1GZoW1wxRL7gOjnQa9rLC39udM9pGBfqajf7JSYGrEh2Cx10U/YkZrFprITdx
	oFq396I8yHtplZSaDm954+2pAoiRukU/u1Iw6RmGDiqYbfmdvJwaUP4VzT3Q7y7wAV1TxsQWSvg+C
	hh2S4SwZd8Zg/q6sMv0O1nK8tOAzDA+jZ6CdNIxFFRT0uxwvvju6MhRzS8gJvZTXGnzOgnXq5XhvP
	D28by0L+4nLrwCKVs3LJZ/y2Ji4OR9fcoMDXHkcfPpIWW1y+H1uy7vOQ7jcdqNK7QDWqsdM/PADBf
	H8Q5R6UP9if/VjTsI+2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLD2v-0004UR-MQ; Sun, 05 Apr 2020 21:43:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLD2s-0004TP-MY
 for linux-mediatek@lists.infradead.org; Sun, 05 Apr 2020 21:43:12 +0000
X-UUID: 3d990d5e4b5e4b4bac1f0e8e54dfdc9f-20200405
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ykXJOg+MvDEO7S3FZP+B/VvjET2n99Rmo5Cho9/ZgpU=; 
 b=gRTssLRKXrFy0OgrWpjs8H26qsP0+ZTDpbOcTyDRX/5Z2LfivujVghPTcEjH4155zYsovdKMJ0O+R/u5rfji7IGyckyuAQzspBiJ/GCde3KPmMm+tZS93LHwOuwBEGsSo/o62C/XVBgriqFQ8MZYONu7v6cgIZa5VFxPMgrwYus=;
X-UUID: 3d990d5e4b5e4b4bac1f0e8e54dfdc9f-20200405
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 608908010; Sun, 05 Apr 2020 13:43:08 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Apr 2020 14:43:02 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Apr 2020 05:42:54 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 6 Apr 2020 05:42:54 +0800
From: <sean.wang@mediatek.com>
To: <davem@davemloft.net>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <vivien.didelot@savoirfairelinux.com>, <Mark-MC.Lee@mediatek.com>,
 <john@phrozen.org>
Subject: [PATCH v2 net 2/2] net: ethernet: mediatek: move mt7623 settings out
 off the mt7530
Date: Mon, 6 Apr 2020 05:42:54 +0800
Message-ID: <1586122974-22125-2-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1586122974-22125-1-git-send-email-sean.wang@mediatek.com>
References: <1586122974-22125-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200405_144310_741625_153C62A9 
X-CRM114-Status: UNSURE (   8.82  )
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
Cc: Landen.Chao@mediatek.com, steven.liu@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogUmVuw6kgdmFuIERvcnN0IDxvcGVuc291cmNlQHZkb3JzdC5jb20+DQoNCk1vdmluZyBt
dDc2MjMgbG9naWMgb3V0IG9mZiBtdDc1MzAsIGlzIHJlcXVpcmVkIHRvIG1ha2UgaGFyZHdhcmUg
c2V0dGluZw0KY29uc2lzdGVudCBhZnRlciB3ZSBpbnRyb2R1Y2UgcGh5bGluayB0byBtdGsgZHJp
dmVyLg0KDQpGaXhlczogYjhmYzlmMzA4MjFlICgibmV0OiBldGhlcm5ldDogbWVkaWF0ZWs6IEFk
ZCBiYXNpYyBQSFlMSU5LIHN1cHBvcnQiKQ0KUmV2aWV3ZWQtYnk6IFNlYW4gV2FuZyA8c2Vhbi53
YW5nQG1lZGlhdGVrLmNvbT4NClRlc3RlZC1ieTogU2VhbiBXYW5nIDxzZWFuLndhbmdAbWVkaWF0
ZWsuY29tPg0KU2lnbmVkLW9mZi1ieTogUmVuw6kgdmFuIERvcnN0IDxvcGVuc291cmNlQHZkb3Jz
dC5jb20+DQotLS0NCnYxIC0+IHYyOiBzcGxpdCBvdXQgbG9naWMgY2hhbmdpbmcgbXRrX2dtYWMw
X3JnbWlpX2FkanVzdCB0aGF0IHNob3VsZCBiZQ0KCSAgcmVmaW5lZCBmdXJ0aGVyIGFuZCBhY3R1
YWx5IGJlbG9uZ2VkIHRvIHNlcGFyYXRlIHBhdGNoLg0KLS0tDQogZHJpdmVycy9uZXQvZXRoZXJu
ZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrLQ0KIGRy
aXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19ldGhfc29jLmggfCAgOCArKysrKysrDQog
MiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3NvYy5jIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuYw0KaW5kZXggOGQyOGY5MGFj
ZmU3Li4wOTA0NzEwOWQwZGEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRp
YXRlay9tdGtfZXRoX3NvYy5jDQorKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9t
dGtfZXRoX3NvYy5jDQpAQCAtNjUsNiArNjUsMTcgQEAgdTMyIG10a19yMzIoc3RydWN0IG10a19l
dGggKmV0aCwgdW5zaWduZWQgcmVnKQ0KIAlyZXR1cm4gX19yYXdfcmVhZGwoZXRoLT5iYXNlICsg
cmVnKTsNCiB9DQogDQordTMyIG10a19tMzIoc3RydWN0IG10a19ldGggKmV0aCwgdTMyIG1hc2ss
IHUzMiBzZXQsIHVuc2lnbmVkIHJlZykNCit7DQorCXUzMiB2YWw7DQorDQorCXZhbCA9IG10a19y
MzIoZXRoLCByZWcpOw0KKwl2YWwgJj0gfm1hc2s7DQorCXZhbCB8PSBzZXQ7DQorCW10a193MzIo
ZXRoLCB2YWwsIHJlZyk7DQorCXJldHVybiByZWc7DQorfQ0KKw0KIHN0YXRpYyBpbnQgbXRrX21k
aW9fYnVzeV93YWl0KHN0cnVjdCBtdGtfZXRoICpldGgpDQogew0KIAl1bnNpZ25lZCBsb25nIHRf
c3RhcnQgPSBqaWZmaWVzOw0KQEAgLTE5Myw3ICsyMDQsNyBAQCBzdGF0aWMgdm9pZCBtdGtfbWFj
X2NvbmZpZyhzdHJ1Y3QgcGh5bGlua19jb25maWcgKmNvbmZpZywgdW5zaWduZWQgaW50IG1vZGUs
DQogCXN0cnVjdCBtdGtfbWFjICptYWMgPSBjb250YWluZXJfb2YoY29uZmlnLCBzdHJ1Y3QgbXRr
X21hYywNCiAJCQkJCSAgIHBoeWxpbmtfY29uZmlnKTsNCiAJc3RydWN0IG10a19ldGggKmV0aCA9
IG1hYy0+aHc7DQotCXUzMiBtY3JfY3VyLCBtY3JfbmV3LCBzaWQ7DQorCXUzMiBtY3JfY3VyLCBt
Y3JfbmV3LCBzaWQsIGk7DQogCWludCB2YWwsIGdlX21vZGUsIGVycjsNCiANCiAJLyogTVQ3Nng4
IGhhcyBubyBoYXJkd2FyZSBzZXR0aW5ncyBiZXR3ZWVuIGZvciB0aGUgTUFDICovDQpAQCAtMjU1
LDYgKzI2NiwxNyBAQCBzdGF0aWMgdm9pZCBtdGtfbWFjX2NvbmZpZyhzdHJ1Y3QgcGh5bGlua19j
b25maWcgKmNvbmZpZywgdW5zaWduZWQgaW50IG1vZGUsDQogCQkJCSAgICBQSFlfSU5URVJGQUNF
X01PREVfVFJHTUlJKQ0KIAkJCQkJbXRrX2dtYWMwX3JnbWlpX2FkanVzdChtYWMtPmh3LA0KIAkJ
CQkJCQkgICAgICAgc3RhdGUtPnNwZWVkKTsNCisNCisJCQkJLyogbXQ3NjIzX3BhZF9jbGtfc2V0
dXAgKi8NCisJCQkJZm9yIChpID0gMCA7IGkgPCBOVU1fVFJHTUlJX0NUUkw7IGkrKykNCisJCQkJ
CW10a193MzIobWFjLT5odywNCisJCQkJCQlURF9ETV9EUlZQKDgpIHwgVERfRE1fRFJWTig4KSwN
CisJCQkJCQlUUkdNSUlfVERfT0RUKGkpKTsNCisNCisJCQkJLyogQXNzZXJ0L3JlbGVhc2UgTVQ3
NjIzIFJYQyByZXNldCAqLw0KKwkJCQltdGtfbTMyKG1hYy0+aHcsIDAsIFJYQ19SU1QgfCBSWENf
RFFTSVNFTCwNCisJCQkJCVRSR01JSV9SQ0tfQ1RSTCk7DQorCQkJCW10a19tMzIobWFjLT5odywg
UlhDX1JTVCwgMCwgVFJHTUlJX1JDS19DVFJMKTsNCiAJCQl9DQogCQl9DQogDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuaCBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L21lZGlhdGVrL210a19ldGhfc29jLmgNCmluZGV4IDg1ODMwZmUxNGExYi4u
NDU0Y2ZjZDQ2NWZkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsv
bXRrX2V0aF9zb2MuaA0KKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0
aF9zb2MuaA0KQEAgLTM1MiwxMCArMzUyLDEzIEBADQogI2RlZmluZSBEUVNJMCh4KQkJKCh4IDw8
IDApICYgR0VOTUFTSyg2LCAwKSkNCiAjZGVmaW5lIERRU0kxKHgpCQkoKHggPDwgOCkgJiBHRU5N
QVNLKDE0LCA4KSkNCiAjZGVmaW5lIFJYQ1RMX0RNV1RMQVQoeCkJKCh4IDw8IDE2KSAmIEdFTk1B
U0soMTgsIDE2KSkNCisjZGVmaW5lIFJYQ19SU1QJCQlCSVQoMzEpDQogI2RlZmluZSBSWENfRFFT
SVNFTAkJQklUKDMwKQ0KICNkZWZpbmUgUkNLX0NUUkxfUkdNSUlfMTAwMAkoUlhDX0RRU0lTRUwg
fCBSWENUTF9ETVdUTEFUKDIpIHwgRFFTSTEoMTYpKQ0KICNkZWZpbmUgUkNLX0NUUkxfUkdNSUlf
MTBfMTAwCVJYQ1RMX0RNV1RMQVQoMikNCiANCisjZGVmaW5lIE5VTV9UUkdNSUlfQ1RSTAkJNQ0K
Kw0KIC8qIFRSR01JSSBSWEMgY29udHJvbCByZWdpc3RlciAqLw0KICNkZWZpbmUgVFJHTUlJX1RD
S19DVFJMCQkweDEwMzQwDQogI2RlZmluZSBUWENUTF9ETVdUTEFUKHgpCSgoeCA8PCAxNikgJiBH
RU5NQVNLKDE4LCAxNikpDQpAQCAtMzYzLDYgKzM2NiwxMSBAQA0KICNkZWZpbmUgVENLX0NUUkxf
UkdNSUlfMTAwMAlUWENUTF9ETVdUTEFUKDIpDQogI2RlZmluZSBUQ0tfQ1RSTF9SR01JSV8xMF8x
MDAJKFRYQ19JTlYgfCBUWENUTF9ETVdUTEFUKDIpKQ0KIA0KKy8qIFRSR01JSSBUWCBEcml2ZSBT
dHJlbmd0aCAqLw0KKyNkZWZpbmUgVFJHTUlJX1REX09EVChpKQkoMHgxMDM1NCArIDggKiAoaSkp
DQorI2RlZmluZSAgVERfRE1fRFJWUCh4KQkJKCh4KSAmIDB4ZikNCisjZGVmaW5lICBURF9ETV9E
UlZOKHgpCQkoKCh4KSAmIDB4ZikgPDwgNCkNCisNCiAvKiBUUkdNSUkgSW50ZXJmYWNlIG1vZGUg
cmVnaXN0ZXIgKi8NCiAjZGVmaW5lIElOVEZfTU9ERQkJMHgxMDM5MA0KICNkZWZpbmUgVFJHTUlJ
X0lOVEZfRElTCQlCSVQoMCkNCi0tIA0KMi4yNS4xDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
