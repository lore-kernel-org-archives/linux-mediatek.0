Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE35C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 09:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2kx2/G84xlpcWK+TahXIXZ93px5tEJRcGb5NCfcFVE=; b=FTsUgZv8VbIZcR
	UN5waKFmKYmI9q9vMUV6OyhbKyZCY2lv8f3+afHz7bsegMgzRbqWsa/sNlUpHu1dzqTEYl9u8YjTy
	F0pTGChJYl+9oQOpw9MBftBLECusFw0/l2SVU6O2Ydn+6sNHktoicFpt5Peb3SIyaJZdEnNV62E+O
	AShQYBU8Q3MetK1i07zOKY9KAra3COjqsuY5HaHmBYoCesOP/0ga5Dpe5xfS6tE5R/yUQZFx5BVDf
	YmsLbOFKELC1erOLTDfgV7vJVSszMulz+5Rrzy2wonv/fcdaFShc4ZBwsN54fl2rIXKKfN8XnRVEd
	xN0v4UjSZjXKuaJQEZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSbfV-00Fp4z-24; Fri, 11 Mar 2022 09:34:41 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSbfR-00Fp35-Ti
 for linux-mediatek@lists.infradead.org; Fri, 11 Mar 2022 09:34:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 43B4C1F4649B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646991276;
 bh=PEG3axVN//YyYVluyyyZUdTkTfte6RZExlKRrKGNNGg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IOIevA2nantASE3yYn/YUjQS5gP8DD6vEldy8ZnQb7KvSWDexaKr23Q1H3WWldHVX
 ilMRsF/w8dhmsry9dwQLfOy74iekWPbrKv7KmwjLbbymuI2OupBFSkb0a0Yz6wcVYt
 eJttIa1fKq1b9rKZnUfRuveC31R3UQ4sqv5aNCGlEiO3fcFGAtfhrZJKiLoQ41KAzc
 BuGtK0m5eqWa4/7L+i4DCr+9g3CzUy7kEfBv/ebnRbUDdEXply9m6eEh/Yo3PKNic4
 9wSSwSlwtBBz6x0ComHm5IrbBXghXwrwqHzMnOBxMa+Ep6dqpMnr7Ey5Lh+ediB8wS
 fxrSGXNY4OdkQ==
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, andrzej.hajda@intel.com, narmstrong@baylibre.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 1/2 RESEND] drm/bridge: parade-ps8640: avoid race condition on
 driver unbinding
Date: Fri, 11 Mar 2022 10:34:05 +0100
Message-Id: <20220311093406.4068019-2-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311093406.4068019-1-ricardo.canuelo@collabora.com>
References: <20220311093406.4068019-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_013438_120438_F9E5EFBE 
X-CRM114-Status: GOOD (  12.88  )
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

V2hlbiB1bmJpbmRpbmcgYSBEUk0gbWFzdGVyIGRyaXZlciB0aGVyZSdzIGEgcmFjZSBjb25kaXRp
b24gdGhhdApzb21ldGltZXMgcmVzdWx0cyBpbiBhbiBpbnZhbGlkIHZtIGFjY2VzcyB3aGVuIHVz
ZXJzcGFjZSAoZ25vbWUtc2hlbGwpCmlzc3VlcyBhIERSTV9JT0NUTF9NT0RFX0dFVENPTk5FQ1RP
UiBpb2N0bCByaWdodCBhZnRlciBhIGJyaWRnZSBoYXMgYmVlbgpyZW1vdmVkIGZyb20gYW4gZW5j
b2RlcidzIGJyaWRnZSBjaGFpbi4KClRoaXMgbWVhbnMgdGhhdCBvbmNlIGEgYnJpZGdlIGhhcyBi
ZWVuIGRpc2FibGVkIGFuZCBnb25lIHRocm91Z2gKcHM4NjQwX3Bvc3RfZGlzYWJsZSgpLCBpZiBw
czg2NDBfYnJpZGdlX2dldF9lZGlkKCkgcnVucyBhZnRlcndhcmRzIGFzIGEKcmVzdWx0IG9mIHRo
YXQgaW9jdGwgY2FsbCBpdCB3aWxsIGNhbGwgZHJtX2JyaWRnZV9jaGFpbl9wcmVfZW5hYmxlKCkK
YW5kIGRybV9icmlkZ2VfY2hhaW5fcG9zdF9kaXNhYmxlKCkgYWdhaW4gaW4gYSBicmlkZ2UgdGhh
dCBoYXMgYmVlbgphbHJlYWR5IGRldGFjaGVkLgoKU2V0dGluZyBgcHNfYnJpZGdlLT5wcmVfZW5h
YmxlZCA9IGZhbHNlYCBhdCBhIGxhdGVyIHN0YWdlIG9mIHRoZQpicmluZ2Rvd24gcGF0aCBhbmQg
Y2FsbGluZyBkcm1fYnJpZGdlX2NoYWluX3ByZV9lbmFibGUoKSBpbnNpZGUKcHM4NjQwX2JyaWRn
ZV9nZXRfZWRpZCgpIG9ubHkgaWYgbmVlZGVkIGF2b2lkIHRoaXMsIGFsdGhvdWdoIGEgcHJvcGVy
CnN1YnN5c3RlbS13aWRlIGZpeCB3b3VsZCBiZSB0aGUgcHJvcGVyIHNvbHV0aW9uLCBzaW5jZSB0
aGUgc2FtZSB0eXBlIG9mCnJhY2UgY29uZGl0aW9ucyBtaWdodCBoYXBwZW4gc29tZXdoZXJlIGVs
c2UuCgpUZXN0ZWQgb24gYW4gQWNlciBDaHJvbWVib29rIFIxMyAoRWxtLCBNVDgxNzMpIHdpdGgg
RGViaWFuIFNpZC4KClNpZ25lZC1vZmYtYnk6IFJpY2FyZG8gQ2HDsXVlbG8gPHJpY2FyZG8uY2Fu
dWVsb0Bjb2xsYWJvcmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFyYWRlLXBz
ODY0MC5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYXJhZGUtcHM4
NjQwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhcmFkZS1wczg2NDAuYwppbmRleCAzZjE3
MzM3ZWUzODkuLmE5Mjc3ODdhODliZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9wYXJhZGUtcHM4NjQwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYXJhZGUtcHM4
NjQwLmMKQEAgLTQzNCw4ICs0MzQsNiBAQCBzdGF0aWMgdm9pZCBwczg2NDBfcG9zdF9kaXNhYmxl
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCiB7CiAJc3RydWN0IHBzODY0MCAqcHNfYnJpZGdl
ID0gYnJpZGdlX3RvX3BzODY0MChicmlkZ2UpOwogCi0JcHNfYnJpZGdlLT5wcmVfZW5hYmxlZCA9
IGZhbHNlOwotCiAJcHM4NjQwX2JyaWRnZV92ZG9fY29udHJvbChwc19icmlkZ2UsIERJU0FCTEUp
OwogCXBtX3J1bnRpbWVfcHV0X3N5bmNfc3VzcGVuZCgmcHNfYnJpZGdlLT5wYWdlW1BBR0UwX0RQ
X0NOVExdLT5kZXYpOwogfQpAQCAtNDg3LDYgKzQ4NSw3IEBAIHN0YXRpYyB2b2lkIHBzODY0MF9i
cmlkZ2VfZGV0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCiAJZHJtX2RwX2F1eF91bnJl
Z2lzdGVyKCZwc19icmlkZ2UtPmF1eCk7CiAJaWYgKHBzX2JyaWRnZS0+bGluaykKIAkJZGV2aWNl
X2xpbmtfZGVsKHBzX2JyaWRnZS0+bGluayk7CisJcHNfYnJpZGdlLT5wcmVfZW5hYmxlZCA9IGZh
bHNlOwogfQogCiBzdGF0aWMgc3RydWN0IGVkaWQgKnBzODY0MF9icmlkZ2VfZ2V0X2VkaWQoc3Ry
dWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKQEAgLTUwOCw3ICs1MDcsOCBAQCBzdGF0aWMgc3RydWN0
IGVkaWQgKnBzODY0MF9icmlkZ2VfZ2V0X2VkaWQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwK
IAkgKiBFRElELCBmb3IgdGhpcyBjaGlwLCB3ZSBuZWVkIHRvIGRvIGEgZnVsbCBwb3dlcm9uLCBv
dGhlcndpc2UgaXQgd2lsbAogCSAqIGZhaWwuCiAJICovCi0JZHJtX2JyaWRnZV9jaGFpbl9wcmVf
ZW5hYmxlKGJyaWRnZSk7CisJaWYgKHBvd2Vyb2ZmKQorCQlkcm1fYnJpZGdlX2NoYWluX3ByZV9l
bmFibGUoYnJpZGdlKTsKIAogCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLAogCQkJICAg
IHBzX2JyaWRnZS0+cGFnZVtQQUdFMF9EUF9DTlRMXS0+YWRhcHRlcik7Ci0tIAoyLjI1LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
