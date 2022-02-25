Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980EFC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 13:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2kx2/G84xlpcWK+TahXIXZ93px5tEJRcGb5NCfcFVE=; b=iN91tAj+gXL3Rx
	RBUqJoEE1Bg5af1e75AfvKt+IrpSj97L+n2Cgqgp4NJKlJ60agrG0Vjbw63+JJBQhx2MbfpjT4F6j
	tMK0bZ7v4Pek4Tk7AHbpxpA+eLV3nKuDCTiQTZ7drJCGGRYDC/Q7O5PkNMB0uNkwa7pu7HyGNZkpO
	nMX96+bEMUFbOEga00x2V9YOHBD+BWfGTmzu3dSgOniQVtYvtoq8b9Ul4GbNCioyWd2kla8qzx2D+
	XoROFcS8xM1OlgUBtj4XpZ8nM9au+Kq1UoE2UWdewO9XIo6G0fU/7eHV20fVaBeKwQZzN4z0+v3FF
	r014F2hY13fi1In56GNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNb3o-005GPD-QS; Fri, 25 Feb 2022 13:55:04 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNaum-005DEG-DU
 for linux-mediatek@lists.infradead.org; Fri, 25 Feb 2022 13:45:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 7A6AF1F45F92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645796741;
 bh=PEG3axVN//YyYVluyyyZUdTkTfte6RZExlKRrKGNNGg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V/oym2rKqKgD8WS1WPUP98b3I3JMruzcQzkNhu3PgRNVN3ZTTJw+3GtVTL7aQoSOC
 ptLBuP3f9+pjoz9+9FnrgPRUlPo8VUleDaWCGLiwJzBpw/YoZOPgnqe50SuZ7CI3JM
 cBm7FrVwATP5cHVP41V99XezDyNEe+JLDXvRQJT3FOB6nF4qJGptcikBkNbiOeKqrq
 cYst4IN9RE4IHAGzU7XZe4bZk0uzpZw6GGOlQiX6xQ8R2LTgwiYm/vHddpjkOwekzs
 5rJVyJdqyqIFY/UJ48Ojz3PCzr+Plzv/pWZts6M45eVOhHQ9qPvjsnEhpEV4N01hB+
 hqRo5dsRtjmaQ==
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, andrzej.hajda@intel.com, narmstrong@baylibre.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 1/2] drm/bridge: parade-ps8640: avoid race condition on driver
 unbinding
Date: Fri, 25 Feb 2022 14:45:03 +0100
Message-Id: <20220225134504.457245-2-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225134504.457245-1-ricardo.canuelo@collabora.com>
References: <20220225134504.457245-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_054544_672215_98C71B83 
X-CRM114-Status: GOOD (  13.10  )
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
