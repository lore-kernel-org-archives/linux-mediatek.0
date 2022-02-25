Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAB8C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 13:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYKHBFDGLnFCK/SH3NPErmo3HjeDGw913WN0vUx8PYU=; b=gWD86IZqYg0PvU
	YUoOulAwoWQ/uazYzd6O6/DIPxkA3mDzTLMSNJdEX6dz5A699vuzsD1cYgGKTYmskxkN9U+JaAymm
	F9k9Sk+7F7jP0P8Z4uPI0rcXEZTq9IwR0mHgeWwVNNrpLXO0rIHX67yYX6kTasw04rnxCdCU0bV+y
	8Kd1Kw66ogcgF0ocv3WenMw6G9tEHUTUyEL/Z2geN5JEPjFxOBkwHaP3v/digdDLDLwSqtEdgRlUK
	4fa4KCaKH9CeJZN3HuBLELezjiuVC5erR06YReKn8NGGHwNdpEIzSSt1nKULzApr3PUvwsTQaAwvk
	xZ9QohdstumkPYWv/nzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNb3t-005GSG-DK; Fri, 25 Feb 2022 13:55:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNaum-005DEb-MR
 for linux-mediatek@lists.infradead.org; Fri, 25 Feb 2022 13:45:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 38B651F45F94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645796741;
 bh=6IuTiAPuhKDYgNwCLKRyc4SunUJTB6ruZFYFsOvvpvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=furnXzpdMdgCyVoYEJ4jDsNkBjXVwWUIBhNi74Q0yGH4QrCYy2xcC23hpHNo4n5G1
 y8Ob0c1jgVIFTYAcUYS0VgI+V4cihoITEyo8tyqT6WCgnBVRZAwEIIomHmYKBxSzBt
 Dht/iRxyKUmfqcBqP4xEmfexO2cMyX4S0ivgJEH+iaqsHPSzatnnyPqq1iRfrV4b4u
 qfp/5GFOhhwNbEnaYRe9iWYSMgpbdoygnLQc8OU1T8IM4sTQQYPQz75DX31oGd8161
 ibLHJGZwlRfOAm0FWAFpDkxesQSeTlLajZta2f58kEj2pvFTU9sy/6WHJQ3UtXQ8ic
 0d/WRZ7lQBuGw==
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, andrzej.hajda@intel.com, narmstrong@baylibre.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 2/2] drm/bridge: Add extra checks in pre_enable and post_enable
Date: Fri, 25 Feb 2022 14:45:04 +0100
Message-Id: <20220225134504.457245-3-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225134504.457245-1-ricardo.canuelo@collabora.com>
References: <20220225134504.457245-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_054544_940351_9489F8A1 
X-CRM114-Status: GOOD (  11.43  )
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
