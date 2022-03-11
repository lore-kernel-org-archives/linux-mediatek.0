Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43989C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 09:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYKHBFDGLnFCK/SH3NPErmo3HjeDGw913WN0vUx8PYU=; b=yVA6gyDD/s3huf
	foOnRfSa64nvMsY3gU+pGf28qcQC2aYboIY2/vdXAgD4m4GPL8ssEMWfDnKxQtoWvAO0wQh2H+zAP
	Xle5IHqxmQW9DZ7m+tHGYegmrlOT772YRgObZcM0OtnnHf/4VHrtsJWYgdsNyXZYEYi8/lJNKQc9f
	miGZqDWqKUUY/1ZGoF+AncrUby4jcp+7pp5Yac7m+rjMLclmSLK36pocojk1mdYAaOaBIZTIqHiGk
	816faqHA7YG3dHft+q5lBjJuofC+6BT1fgdyGa8BeK1gAWVn9w71Z/rniZaQ2wduvImZiwMIB6bXR
	ybCamqu8mqcEmq8irwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSbfW-00Fp63-9y; Fri, 11 Mar 2022 09:34:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSbfS-00Fp38-Kf
 for linux-mediatek@lists.infradead.org; Fri, 11 Mar 2022 09:34:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id E511A1F4649E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646991277;
 bh=6IuTiAPuhKDYgNwCLKRyc4SunUJTB6ruZFYFsOvvpvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gD8SJkWPQ7AVcDYe+nWxXfobtI4INoYCVxW2ZB+Ymm9w2+8CaNz1q4SOTOz0LYPjz
 hGE5rXOAurREVi3IW7YQ+311vbeuCvhAZEtGwT1UQ6JGNN4jw9I5SVByaHfedUpRgk
 8tl6I1ycOfeVe6h3U6FpZHRJQ4a08lXbIc0faRsAqCq1QccSYUlhyRTPdgqB7lD/KD
 nlgN6VZ5BncUXMpaEJHhVlgNMh78y/7kD8lLHl4E8MWn0XAm+B4cW/SdglvOY5S+SS
 JRf3BVt9wetOW7qBA0Od2XtzFbiAg08uBp+EtWKh8s9Wzyz3ipXIE1sm44716SVvX1
 7EEsvho0zxjdg==
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, andrzej.hajda@intel.com, narmstrong@baylibre.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 2/2 RESEND] drm/bridge: Add extra checks in pre_enable and
 post_enable
Date: Fri, 11 Mar 2022 10:34:06 +0100
Message-Id: <20220311093406.4068019-3-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311093406.4068019-1-ricardo.canuelo@collabora.com>
References: <20220311093406.4068019-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_013438_831863_AC746819 
X-CRM114-Status: GOOD (  11.27  )
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

RGVwZW5kaW5nIG9uIHRoZSBicmlkZ2UgY29kZSwgY2VydGFpbiB1c2Vyc3BhY2UgZXZlbnRzIGR1
cmluZyBhIGRyaXZlcgp0ZWFyZG93biAoc3VjaCBhcyBhIERSTSBpb2N0bCBjYWxsKSBtaWdodCBj
YXVzZSBhIHJhY2UgY29uZGl0aW9uIHdoZXJlCnRoZSBkcm1fYnJpZGdlX2NoYWluX3ByZV9lbmFi
bGUoKSBhbmQgZHJtX2JyaWRnZV9jaGFpbl9wb3N0X2VuYWJsZSgpCmZ1bmN0aW9ucyBjb3VsZCBi
ZSBjYWxsZWQgZm9yIGEgYnJpZGdlIHRoYXQgaGFzIGp1c3QgYmVlbiBkZXRhY2hlZCBhbmQKcmVt
b3ZlZCBmcm9tIHRoZSBicmlkZ2UgY2hhaW4gb2YgYW4gZW5jb2Rlci4KClRoaXMgY2hhbmdlIG1h
a2VzIHRoZXNlIGZ1bmN0aW9ucyBhIGJpdCBtb3JlIHJvYnVzdCBieSBiYWlsaW5nIG91dCBpZgp0
aGUgYnJpZGdlIGhhcyBhbHJlYWR5IGJlZW4gZGV0YWNoZWQuCgpUZXN0ZWQgb24gYW4gQWNlciBD
aHJvbWVib29rIFIxMyAoRWxtLCBNVDgxNzMpIHdpdGggRGViaWFuIFNpZC4KClNpZ25lZC1vZmYt
Ynk6IFJpY2FyZG8gQ2HDsXVlbG8gPHJpY2FyZG8uY2FudWVsb0Bjb2xsYWJvcmEuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9icmlkZ2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMKaW5kZXggYzk2
ODQ3ZmMwZWJjLi5lMDc0YWE0NTZkZDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
YnJpZGdlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwpAQCAtNTI5LDcgKzUy
OSw3IEBAIHZvaWQgZHJtX2JyaWRnZV9jaGFpbl9wb3N0X2Rpc2FibGUoc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSkKIHsKIAlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7CiAKLQlpZiAoIWJy
aWRnZSkKKwlpZiAoIWJyaWRnZSB8fCAhYnJpZGdlLT5kZXYpCiAJCXJldHVybjsKIAogCWVuY29k
ZXIgPSBicmlkZ2UtPmVuY29kZXI7CkBAIC01ODUsNyArNTg1LDcgQEAgdm9pZCBkcm1fYnJpZGdl
X2NoYWluX3ByZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIAlzdHJ1Y3QgZHJt
X2VuY29kZXIgKmVuY29kZXI7CiAJc3RydWN0IGRybV9icmlkZ2UgKml0ZXI7CiAKLQlpZiAoIWJy
aWRnZSkKKwlpZiAoIWJyaWRnZSB8fCAhYnJpZGdlLT5kZXYpCiAJCXJldHVybjsKIAogCWVuY29k
ZXIgPSBicmlkZ2UtPmVuY29kZXI7Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
