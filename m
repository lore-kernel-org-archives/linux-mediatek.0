Return-Path: <SRS0=WnB0=5U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07585C43331
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 00:38:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC9CC2072B
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 00:38:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dvoykZoh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dyX2dyBM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC9CC2072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zS3AtbeNnDWSgF+ymNMbImk0TwBHaiP90m5UxVvm3T0=; b=dvoykZoh63mPor
	aV1oU8aNy+HldTCjwFlkmVmYbCrwfgSHLWWfQp6RIP+sBPU/l+iWRCeKOsjwXANnU3I2SZ/NLqmFk
	MgEBPygv5oJc/cwIQ8UM84JGIDvq/reN0hDUUTPU/TIapYYO89WIVN9OLlDX1FiwIxVCO3P0rJYbu
	QXwUuHMSnGsa/AA0N5SJFY612yCS/DwsZl2K47ltaTKB2nUoz7Uuuu4DcRBlp7thyTezHqt9vKJeI
	/vtZvHDrcpTPl61enQ7smrf3GtDYIC5h8UA5iTRaIXu7hGmVMXDsQSzJdL76l4HahuQWyq5p5dltr
	NbQtRHPqj62TJ2WOV50w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKWpU-00046T-D8; Sat, 04 Apr 2020 00:38:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKWpR-000467-J6
 for linux-mediatek@lists.infradead.org; Sat, 04 Apr 2020 00:38:31 +0000
X-UUID: 646f576e635b4672a5f3c10d194902ae-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0bVyoWv6qoGb6EzC4renaHQUyi40WWljdwPyCk1Mog8=; 
 b=dyX2dyBMkgiAQYlgJOZEHqRr2JSxHQTqjC4H5DLYu+i1dDWlggTmYkJqe/pKkumu/IotsxZkeN/rJC2rwvuOwAvAtLhKUxR274biB5Uy6LlC8tnM3uR8FK6TkQfIOdD29A5+og3XAq6tbZwBTCAf+jaxZxWr+aiR9VRgVu4RuJQ=;
X-UUID: 646f576e635b4672a5f3c10d194902ae-20200403
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2000394808; Fri, 03 Apr 2020 16:38:25 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 3 Apr 2020 17:38:22 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Apr 2020 08:38:20 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 4 Apr 2020 08:38:21 +0800
From: <sean.wang@mediatek.com>
To: <davem@davemloft.net>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <vivien.didelot@savoirfairelinux.com>, <Mark-MC.Lee@mediatek.com>,
 <john@phrozen.org>
Subject: [PATCH net 2/2] net: ethernet: mediatek: move mt7623 settings out off
 the mt7530
Date: Sat, 4 Apr 2020 08:38:17 +0800
Message-ID: <1585960697-15547-2-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1585960697-15547-1-git-send-email-sean.wang@mediatek.com>
References: <1585960697-15547-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E5739DF59F6A401EEA2953695B4595341229673A67FE42F9773F8F6918567BB12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_173829_798685_0E333B88 
X-CRM114-Status: GOOD (  11.02  )
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
dC5jb20+DQotLS0NCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3NvYy5j
IHwgNDMgKysrKysrKysrKysrKysrKysrLS0tDQogZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0
ZWsvbXRrX2V0aF9zb2MuaCB8ICA4ICsrKysNCiAyIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5l
dC9tZWRpYXRlay9tdGtfZXRoX3NvYy5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsv
bXRrX2V0aF9zb2MuYw0KaW5kZXggOGQyOGY5MGFjZmU3Li4xNGRhNTk5NjY0ZTYgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3NvYy5jDQorKysgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3NvYy5jDQpAQCAtNjUsNiArNjUs
MTcgQEAgdTMyIG10a19yMzIoc3RydWN0IG10a19ldGggKmV0aCwgdW5zaWduZWQgcmVnKQ0KIAly
ZXR1cm4gX19yYXdfcmVhZGwoZXRoLT5iYXNlICsgcmVnKTsNCiB9DQogDQordTMyIG10a19tMzIo
c3RydWN0IG10a19ldGggKmV0aCwgdTMyIG1hc2ssIHUzMiBzZXQsIHVuc2lnbmVkIHJlZykNCit7
DQorCXUzMiB2YWw7DQorDQorCXZhbCA9IG10a19yMzIoZXRoLCByZWcpOw0KKwl2YWwgJj0gfm1h
c2s7DQorCXZhbCB8PSBzZXQ7DQorCW10a193MzIoZXRoLCB2YWwsIHJlZyk7DQorCXJldHVybiBy
ZWc7DQorfQ0KKw0KIHN0YXRpYyBpbnQgbXRrX21kaW9fYnVzeV93YWl0KHN0cnVjdCBtdGtfZXRo
ICpldGgpDQogew0KIAl1bnNpZ25lZCBsb25nIHRfc3RhcnQgPSBqaWZmaWVzOw0KQEAgLTE2MCwx
MSArMTcxLDIxIEBAIHN0YXRpYyBpbnQgbXQ3NjIxX2dtYWMwX3JnbWlpX2FkanVzdChzdHJ1Y3Qg
bXRrX2V0aCAqZXRoLA0KIAlyZXR1cm4gMDsNCiB9DQogDQotc3RhdGljIHZvaWQgbXRrX2dtYWMw
X3JnbWlpX2FkanVzdChzdHJ1Y3QgbXRrX2V0aCAqZXRoLCBpbnQgc3BlZWQpDQorc3RhdGljIHZv
aWQgbXRrX2dtYWMwX3JnbWlpX2FkanVzdChzdHJ1Y3QgbXRrX2V0aCAqZXRoLA0KKwkJCQkgICBw
aHlfaW50ZXJmYWNlX3QgaW50ZXJmYWNlLCBpbnQgc3BlZWQpDQogew0KIAl1MzIgdmFsOw0KIAlp
bnQgcmV0Ow0KIA0KKwlpZiAoaW50ZXJmYWNlID09IFBIWV9JTlRFUkZBQ0VfTU9ERV9UUkdNSUkp
IHsNCisJCW10a193MzIoZXRoLCBUUkdNSUlfTU9ERSwgSU5URl9NT0RFKTsNCisJCXZhbCA9IDUw
MDAwMDAwMDsNCisJCXJldCA9IGNsa19zZXRfcmF0ZShldGgtPmNsa3NbTVRLX0NMS19UUkdQTExd
LCB2YWwpOw0KKwkJaWYgKHJldCkNCisJCQlkZXZfZXJyKGV0aC0+ZGV2LCAiRmFpbGVkIHRvIHNl
dCB0cmdtaWkgcGxsOiAlZFxuIiwgcmV0KTsNCisJCXJldHVybjsNCisJfQ0KKw0KIAl2YWwgPSAo
c3BlZWQgPT0gU1BFRURfMTAwMCkgPw0KIAkJSU5URl9NT0RFX1JHTUlJXzEwMDAgOiBJTlRGX01P
REVfUkdNSUlfMTBfMTAwOw0KIAltdGtfdzMyKGV0aCwgdmFsLCBJTlRGX01PREUpOw0KQEAgLTE5
Myw3ICsyMTQsNyBAQCBzdGF0aWMgdm9pZCBtdGtfbWFjX2NvbmZpZyhzdHJ1Y3QgcGh5bGlua19j
b25maWcgKmNvbmZpZywgdW5zaWduZWQgaW50IG1vZGUsDQogCXN0cnVjdCBtdGtfbWFjICptYWMg
PSBjb250YWluZXJfb2YoY29uZmlnLCBzdHJ1Y3QgbXRrX21hYywNCiAJCQkJCSAgIHBoeWxpbmtf
Y29uZmlnKTsNCiAJc3RydWN0IG10a19ldGggKmV0aCA9IG1hYy0+aHc7DQotCXUzMiBtY3JfY3Vy
LCBtY3JfbmV3LCBzaWQ7DQorCXUzMiBtY3JfY3VyLCBtY3JfbmV3LCBzaWQsIGk7DQogCWludCB2
YWwsIGdlX21vZGUsIGVycjsNCiANCiAJLyogTVQ3Nng4IGhhcyBubyBoYXJkd2FyZSBzZXR0aW5n
cyBiZXR3ZWVuIGZvciB0aGUgTUFDICovDQpAQCAtMjUxLDEwICsyNzIsMjAgQEAgc3RhdGljIHZv
aWQgbXRrX21hY19jb25maWcoc3RydWN0IHBoeWxpbmtfY29uZmlnICpjb25maWcsIHVuc2lnbmVk
IGludCBtb2RlLA0KIAkJCQkJCQkgICAgICBzdGF0ZS0+aW50ZXJmYWNlKSkNCiAJCQkJCWdvdG8g
ZXJyX3BoeTsNCiAJCQl9IGVsc2Ugew0KLQkJCQlpZiAoc3RhdGUtPmludGVyZmFjZSAhPQ0KLQkJ
CQkgICAgUEhZX0lOVEVSRkFDRV9NT0RFX1RSR01JSSkNCi0JCQkJCW10a19nbWFjMF9yZ21paV9h
ZGp1c3QobWFjLT5odywNCi0JCQkJCQkJICAgICAgIHN0YXRlLT5zcGVlZCk7DQorCQkJCW10a19n
bWFjMF9yZ21paV9hZGp1c3QobWFjLT5odywNCisJCQkJCQkgICAgICAgc3RhdGUtPmludGVyZmFj
ZSwNCisJCQkJCQkgICAgICAgc3RhdGUtPnNwZWVkKTsNCisNCisJCQkJLyogbXQ3NjIzX3BhZF9j
bGtfc2V0dXAgKi8NCisJCQkJZm9yIChpID0gMCA7IGkgPCBOVU1fVFJHTUlJX0NUUkw7IGkrKykN
CisJCQkJCW10a193MzIobWFjLT5odywNCisJCQkJCQlURF9ETV9EUlZQKDgpIHwgVERfRE1fRFJW
Tig4KSwNCisJCQkJCQlUUkdNSUlfVERfT0RUKGkpKTsNCisNCisJCQkJLyogQXNzZXJ0L3JlbGVh
c2UgTVQ3NjIzIFJYQyByZXNldCAqLw0KKwkJCQltdGtfbTMyKG1hYy0+aHcsIDAsIFJYQ19SU1Qg
fCBSWENfRFFTSVNFTCwNCisJCQkJCVRSR01JSV9SQ0tfQ1RSTCk7DQorCQkJCW10a19tMzIobWFj
LT5odywgUlhDX1JTVCwgMCwgVFJHTUlJX1JDS19DVFJMKTsNCiAJCQl9DQogCQl9DQogDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuaCBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19ldGhfc29jLmgNCmluZGV4IDg1ODMwZmUx
NGExYi4uNDU0Y2ZjZDQ2NWZkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVk
aWF0ZWsvbXRrX2V0aF9zb2MuaA0KKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsv
bXRrX2V0aF9zb2MuaA0KQEAgLTM1MiwxMCArMzUyLDEzIEBADQogI2RlZmluZSBEUVNJMCh4KQkJ
KCh4IDw8IDApICYgR0VOTUFTSyg2LCAwKSkNCiAjZGVmaW5lIERRU0kxKHgpCQkoKHggPDwgOCkg
JiBHRU5NQVNLKDE0LCA4KSkNCiAjZGVmaW5lIFJYQ1RMX0RNV1RMQVQoeCkJKCh4IDw8IDE2KSAm
IEdFTk1BU0soMTgsIDE2KSkNCisjZGVmaW5lIFJYQ19SU1QJCQlCSVQoMzEpDQogI2RlZmluZSBS
WENfRFFTSVNFTAkJQklUKDMwKQ0KICNkZWZpbmUgUkNLX0NUUkxfUkdNSUlfMTAwMAkoUlhDX0RR
U0lTRUwgfCBSWENUTF9ETVdUTEFUKDIpIHwgRFFTSTEoMTYpKQ0KICNkZWZpbmUgUkNLX0NUUkxf
UkdNSUlfMTBfMTAwCVJYQ1RMX0RNV1RMQVQoMikNCiANCisjZGVmaW5lIE5VTV9UUkdNSUlfQ1RS
TAkJNQ0KKw0KIC8qIFRSR01JSSBSWEMgY29udHJvbCByZWdpc3RlciAqLw0KICNkZWZpbmUgVFJH
TUlJX1RDS19DVFJMCQkweDEwMzQwDQogI2RlZmluZSBUWENUTF9ETVdUTEFUKHgpCSgoeCA8PCAx
NikgJiBHRU5NQVNLKDE4LCAxNikpDQpAQCAtMzYzLDYgKzM2NiwxMSBAQA0KICNkZWZpbmUgVENL
X0NUUkxfUkdNSUlfMTAwMAlUWENUTF9ETVdUTEFUKDIpDQogI2RlZmluZSBUQ0tfQ1RSTF9SR01J
SV8xMF8xMDAJKFRYQ19JTlYgfCBUWENUTF9ETVdUTEFUKDIpKQ0KIA0KKy8qIFRSR01JSSBUWCBE
cml2ZSBTdHJlbmd0aCAqLw0KKyNkZWZpbmUgVFJHTUlJX1REX09EVChpKQkoMHgxMDM1NCArIDgg
KiAoaSkpDQorI2RlZmluZSAgVERfRE1fRFJWUCh4KQkJKCh4KSAmIDB4ZikNCisjZGVmaW5lICBU
RF9ETV9EUlZOKHgpCQkoKCh4KSAmIDB4ZikgPDwgNCkNCisNCiAvKiBUUkdNSUkgSW50ZXJmYWNl
IG1vZGUgcmVnaXN0ZXIgKi8NCiAjZGVmaW5lIElOVEZfTU9ERQkJMHgxMDM5MA0KICNkZWZpbmUg
VFJHTUlJX0lOVEZfRElTCQlCSVQoMCkNCi0tIA0KMi4yNS4xDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
