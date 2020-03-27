Return-Path: <SRS0=6DyL=5M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE28C43331
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 14:44:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0FB5206F1
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 14:44:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oz4RNY+H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vdorst.com header.i=@vdorst.com header.b="Nr7wtkCa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0FB5206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZmRzJ7V4ikVmI4HStZjvC4M2Jb40IJPEDrU3j8LNjzA=; b=oz4RNY+HbOP0FM
	JTG/1zl1K+8Pe5/NdFenv6vl6sVNvFfSN38bGwnVISFBHFfN8QNnXDglMrZVF+YoD5x9+6GzGD/Hz
	n7fEpH4fRwxx71PVZS+DmHXbVUKzyW0xUdxLXHZnEoH9MqyIsWapnGHClRAC6hraAjm4SfKVjTsA0
	pms1R8IRrUWYtMc8FkuOibwdeQ30XNxsx0gRYbpoqLqeJ61UmYo/tP6zqAAHUkcfj0Apu7bv7tJ5q
	E3MQdHv9M4560UJ0dNWaTOVmioGnD5PHu4XRt2EJBdXCCniAEFxv4KXbpBbtr7rX5NiMkbaLO8EiI
	LDv/dAr/K7nYnc2mJ/IA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHqDl-0003gl-08; Fri, 27 Mar 2020 14:44:29 +0000
Received: from mx.0dd.nl ([5.2.79.48])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHqDh-0003fe-KP
 for linux-mediatek@lists.infradead.org; Fri, 27 Mar 2020 14:44:27 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx.0dd.nl (Postfix) with ESMTPS id 0DD755FA7A;
 Fri, 27 Mar 2020 15:44:21 +0100 (CET)
Authentication-Results: mx.0dd.nl; dkim=pass (2048-bit key;
 secure) header.d=vdorst.com header.i=@vdorst.com header.b="Nr7wtkCa"; 
 dkim-atps=neutral
Received: from pc-rene-vdorst-com.vdorst.com (pc-rene-vdorst-com.vdorst.com
 [192.168.2.14])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id C2E0926409D;
 Fri, 27 Mar 2020 15:44:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com C2E0926409D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1585320260;
 bh=aKWB1fYafsU00dAeSkuJV48ua04gryao/7n12RqYpkY=;
 h=From:To:Cc:Subject:Date:From;
 b=Nr7wtkCasrQ1/kaPw8pMFNl0AYrgjKvBLHZUHvt7J+sN7Vmj/BqEt/4UcfnDbsOMb
 pl0HIfdPiQ+9kHABjB62Kd90ulQsbQfLZjNPaC4XlpyH/9ZxxEhLfzFaeQmFgY+Mbl
 phcHV8DExewt6QUvtOg4Qhq86VjkOqSugri3gQ4LW0U2MmbQKVCldOT3MaRIj0p7YL
 fJicGBMJX4CUyqmoryi85iEA7ehSv3avUn9w8z43f5f9VwTenuFJquXH5+Mwrqq9vS
 ar/3+Wz/nnzEBQv9g6HjI2KNg3ABzaU27D6LOfTJ+MqZ+f6SXTIpa1n9fCIhBmxt4G
 Porm0RkPumFeQ==
From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next] net: dsa: mt7530: use resolved link config in
 mac_link_up()
Date: Fri, 27 Mar 2020 15:44:12 +0100
Message-Id: <20200327144412.100913-1-opensource@vdorst.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_074425_950358_55329C5B 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <landen.chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q29udmVydCB0aGUgbXQ3NTMwIHN3aXRjaCBkcml2ZXIgdG8gdXNlIHRoZSBmaW5hbGlzZWQgbGlu
awpwYXJhbWV0ZXJzIGluIG1hY19saW5rX3VwKCkgcmF0aGVyIHRoYW4gdGhlIHBhcmFtZXRlcnMg
aW4gbWFjX2NvbmZpZygpLgoKU2lnbmVkLW9mZi1ieTogUmVuw6kgdmFuIERvcnN0IDxvcGVuc291
cmNlQHZkb3JzdC5jb20+Ci0tLQogZHJpdmVycy9uZXQvZHNhL210NzUzMC5jIHwgNTcgKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9uZXQvZHNhL210NzUz
MC5oIHwgIDQgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDMzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAuYyBiL2RyaXZlcnMv
bmV0L2RzYS9tdDc1MzAuYwppbmRleCA2ZTkxZmUyZjRiOWEuLmVmNTc1NTJkYjI2MCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9uZXQvZHNhL210NzUzMC5jCisrKyBiL2RyaXZlcnMvbmV0L2RzYS9tdDc1
MzAuYwpAQCAtNTYzLDE3ICs1NjMsNiBAQCBtdDc1MzBfbWliX3Jlc2V0KHN0cnVjdCBkc2Ffc3dp
dGNoICpkcykKIAltdDc1MzBfd3JpdGUocHJpdiwgTVQ3NTMwX01JQl9DQ1IsIENDUl9NSUJfQUNU
SVZBVEUpOwogfQogCi1zdGF0aWMgdm9pZAotbXQ3NTMwX3BvcnRfc2V0X3N0YXR1cyhzdHJ1Y3Qg
bXQ3NTMwX3ByaXYgKnByaXYsIGludCBwb3J0LCBpbnQgZW5hYmxlKQotewotCXUzMiBtYXNrID0g
UE1DUl9UWF9FTiB8IFBNQ1JfUlhfRU4gfCBQTUNSX0ZPUkNFX0xOSzsKLQotCWlmIChlbmFibGUp
Ci0JCW10NzUzMF9zZXQocHJpdiwgTVQ3NTMwX1BNQ1JfUChwb3J0KSwgbWFzayk7Ci0JZWxzZQot
CQltdDc1MzBfY2xlYXIocHJpdiwgTVQ3NTMwX1BNQ1JfUChwb3J0KSwgbWFzayk7Ci19Ci0KIHN0
YXRpYyBpbnQgbXQ3NTMwX3BoeV9yZWFkKHN0cnVjdCBkc2Ffc3dpdGNoICpkcywgaW50IHBvcnQs
IGludCByZWdudW0pCiB7CiAJc3RydWN0IG10NzUzMF9wcml2ICpwcml2ID0gZHMtPnByaXY7CkBA
IC03NTAsNyArNzM5LDcgQEAgbXQ3NTMwX3BvcnRfZW5hYmxlKHN0cnVjdCBkc2Ffc3dpdGNoICpk
cywgaW50IHBvcnQsCiAJcHJpdi0+cG9ydHNbcG9ydF0uZW5hYmxlID0gdHJ1ZTsKIAltdDc1MzBf
cm13KHByaXYsIE1UNzUzMF9QQ1JfUChwb3J0KSwgUENSX01BVFJJWF9NQVNLLAogCQkgICBwcml2
LT5wb3J0c1twb3J0XS5wbSk7Ci0JbXQ3NTMwX3BvcnRfc2V0X3N0YXR1cyhwcml2LCBwb3J0LCAw
KTsKKwltdDc1MzBfY2xlYXIocHJpdiwgTVQ3NTMwX1BNQ1JfUChwb3J0KSwgUE1DUl9MSU5LX1NF
VFRJTkdTX01BU0spOwogCiAJbXV0ZXhfdW5sb2NrKCZwcml2LT5yZWdfbXV0ZXgpOwogCkBAIC03
NzMsNyArNzYyLDcgQEAgbXQ3NTMwX3BvcnRfZGlzYWJsZShzdHJ1Y3QgZHNhX3N3aXRjaCAqZHMs
IGludCBwb3J0KQogCXByaXYtPnBvcnRzW3BvcnRdLmVuYWJsZSA9IGZhbHNlOwogCW10NzUzMF9y
bXcocHJpdiwgTVQ3NTMwX1BDUl9QKHBvcnQpLCBQQ1JfTUFUUklYX01BU0ssCiAJCSAgIFBDUl9N
QVRSSVhfQ0xSKTsKLQltdDc1MzBfcG9ydF9zZXRfc3RhdHVzKHByaXYsIHBvcnQsIDApOworCW10
NzUzMF9jbGVhcihwcml2LCBNVDc1MzBfUE1DUl9QKHBvcnQpLCBQTUNSX0xJTktfU0VUVElOR1Nf
TUFTSyk7CiAKIAltdXRleF91bmxvY2soJnByaXYtPnJlZ19tdXRleCk7CiB9CkBAIC0xNDk5LDgg
KzE0ODgsNyBAQCBzdGF0aWMgdm9pZCBtdDc1MzBfcGh5bGlua19tYWNfY29uZmlnKHN0cnVjdCBk
c2Ffc3dpdGNoICpkcywgaW50IHBvcnQsCiAKIAltY3JfY3VyID0gbXQ3NTMwX3JlYWQocHJpdiwg
TVQ3NTMwX1BNQ1JfUChwb3J0KSk7CiAJbWNyX25ldyA9IG1jcl9jdXI7Ci0JbWNyX25ldyAmPSB+
KFBNQ1JfRk9SQ0VfU1BFRURfMTAwMCB8IFBNQ1JfRk9SQ0VfU1BFRURfMTAwIHwKLQkJICAgICBQ
TUNSX0ZPUkNFX0ZEWCB8IFBNQ1JfVFhfRkNfRU4gfCBQTUNSX1JYX0ZDX0VOKTsKKwltY3JfbmV3
ICY9IH5QTUNSX0xJTktfU0VUVElOR1NfTUFTSzsKIAltY3JfbmV3IHw9IFBNQ1JfSUZHX1hNSVQo
MSkgfCBQTUNSX01BQ19NT0RFIHwgUE1DUl9CQUNLT0ZGX0VOIHwKIAkJICAgUE1DUl9CQUNLUFJf
RU4gfCBQTUNSX0ZPUkNFX01PREU7CiAKQEAgLTE1MDgsMjIgKzE0OTYsNiBAQCBzdGF0aWMgdm9p
ZCBtdDc1MzBfcGh5bGlua19tYWNfY29uZmlnKHN0cnVjdCBkc2Ffc3dpdGNoICpkcywgaW50IHBv
cnQsCiAJaWYgKHBvcnQgPT0gNSAmJiBkc2FfaXNfdXNlcl9wb3J0KGRzLCA1KSkKIAkJbWNyX25l
dyB8PSBQTUNSX0VYVF9QSFk7CiAKLQlzd2l0Y2ggKHN0YXRlLT5zcGVlZCkgewotCWNhc2UgU1BF
RURfMTAwMDoKLQkJbWNyX25ldyB8PSBQTUNSX0ZPUkNFX1NQRUVEXzEwMDA7Ci0JCWJyZWFrOwot
CWNhc2UgU1BFRURfMTAwOgotCQltY3JfbmV3IHw9IFBNQ1JfRk9SQ0VfU1BFRURfMTAwOwotCQli
cmVhazsKLQl9Ci0JaWYgKHN0YXRlLT5kdXBsZXggPT0gRFVQTEVYX0ZVTEwpIHsKLQkJbWNyX25l
dyB8PSBQTUNSX0ZPUkNFX0ZEWDsKLQkJaWYgKHN0YXRlLT5wYXVzZSAmIE1MT19QQVVTRV9UWCkK
LQkJCW1jcl9uZXcgfD0gUE1DUl9UWF9GQ19FTjsKLQkJaWYgKHN0YXRlLT5wYXVzZSAmIE1MT19Q
QVVTRV9SWCkKLQkJCW1jcl9uZXcgfD0gUE1DUl9SWF9GQ19FTjsKLQl9Ci0KIAlpZiAobWNyX25l
dyAhPSBtY3JfY3VyKQogCQltdDc1MzBfd3JpdGUocHJpdiwgTVQ3NTMwX1BNQ1JfUChwb3J0KSwg
bWNyX25ldyk7CiB9CkBAIC0xNTM0LDcgKzE1MDYsNyBAQCBzdGF0aWMgdm9pZCBtdDc1MzBfcGh5
bGlua19tYWNfbGlua19kb3duKHN0cnVjdCBkc2Ffc3dpdGNoICpkcywgaW50IHBvcnQsCiB7CiAJ
c3RydWN0IG10NzUzMF9wcml2ICpwcml2ID0gZHMtPnByaXY7CiAKLQltdDc1MzBfcG9ydF9zZXRf
c3RhdHVzKHByaXYsIHBvcnQsIDApOworCW10NzUzMF9jbGVhcihwcml2LCBNVDc1MzBfUE1DUl9Q
KHBvcnQpLCBQTUNSX0xJTktfU0VUVElOR1NfTUFTSyk7CiB9CiAKIHN0YXRpYyB2b2lkIG10NzUz
MF9waHlsaW5rX21hY19saW5rX3VwKHN0cnVjdCBkc2Ffc3dpdGNoICpkcywgaW50IHBvcnQsCkBA
IC0xNTQ1LDggKzE1MTcsMjcgQEAgc3RhdGljIHZvaWQgbXQ3NTMwX3BoeWxpbmtfbWFjX2xpbmtf
dXAoc3RydWN0IGRzYV9zd2l0Y2ggKmRzLCBpbnQgcG9ydCwKIAkJCQkgICAgICAgYm9vbCB0eF9w
YXVzZSwgYm9vbCByeF9wYXVzZSkKIHsKIAlzdHJ1Y3QgbXQ3NTMwX3ByaXYgKnByaXYgPSBkcy0+
cHJpdjsKKwl1MzIgbWNyOworCisJbWNyID0gUE1DUl9SWF9FTiB8IFBNQ1JfVFhfRU4gfCBQTUNS
X0ZPUkNFX0xOSzsKKworCXN3aXRjaCAoc3BlZWQpIHsKKwljYXNlIFNQRUVEXzEwMDA6CisJCW1j
ciB8PSBQTUNSX0ZPUkNFX1NQRUVEXzEwMDA7CisJCWJyZWFrOworCWNhc2UgU1BFRURfMTAwOgor
CQltY3IgfD0gUE1DUl9GT1JDRV9TUEVFRF8xMDA7CisJCWJyZWFrOworCX0KKwlpZiAoZHVwbGV4
ID09IERVUExFWF9GVUxMKSB7CisJCW1jciB8PSBQTUNSX0ZPUkNFX0ZEWDsKKwkJaWYgKHR4X3Bh
dXNlKQorCQkJbWNyIHw9IFBNQ1JfVFhfRkNfRU47CisJCWlmIChyeF9wYXVzZSkKKwkJCW1jciB8
PSBQTUNSX1JYX0ZDX0VOOworCX0KIAotCW10NzUzMF9wb3J0X3NldF9zdGF0dXMocHJpdiwgcG9y
dCwgMSk7CisJbXQ3NTMwX3NldChwcml2LCBNVDc1MzBfUE1DUl9QKHBvcnQpLCBtY3IpOwogfQog
CiBzdGF0aWMgdm9pZCBtdDc1MzBfcGh5bGlua192YWxpZGF0ZShzdHJ1Y3QgZHNhX3N3aXRjaCAq
ZHMsIGludCBwb3J0LApkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZHNhL210NzUzMC5oIGIvZHJp
dmVycy9uZXQvZHNhL210NzUzMC5oCmluZGV4IGI3Y2ZiM2Q1MmIxYy4uZWY5YjUyZjMxNTJiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmgKKysrIGIvZHJpdmVycy9uZXQvZHNh
L210NzUzMC5oCkBAIC0yMDYsNiArMjA2LDEwIEBAIGVudW0gbXQ3NTMwX3ZsYW5fcG9ydF9hdHRy
IHsKICNkZWZpbmUgIFBNQ1JfRk9SQ0VfTE5LCQkJQklUKDApCiAjZGVmaW5lICBQTUNSX1NQRUVE
X01BU0sJCShQTUNSX0ZPUkNFX1NQRUVEXzEwMCB8IFwKIAkJCQkJIFBNQ1JfRk9SQ0VfU1BFRURf
MTAwMCkKKyNkZWZpbmUgIFBNQ1JfTElOS19TRVRUSU5HU19NQVNLCShQTUNSX1RYX0VOIHwgUE1D
Ul9GT1JDRV9TUEVFRF8xMDAwIHwgXAorCQkJCQkgUE1DUl9SWF9FTiB8IFBNQ1JfRk9SQ0VfU1BF
RURfMTAwIHwgXAorCQkJCQkgUE1DUl9UWF9GQ19FTiB8IFBNQ1JfUlhfRkNfRU4gfCBcCisJCQkJ
CSBQTUNSX0ZPUkNFX0ZEWCB8IFBNQ1JfRk9SQ0VfTE5LKQogCiAjZGVmaW5lIE1UNzUzMF9QTVNS
X1AoeCkJCSgweDMwMDggKyAoeCkgKiAweDEwMCkKICNkZWZpbmUgIFBNU1JfRUVFMUcJCQlCSVQo
NykKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
