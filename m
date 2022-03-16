Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD5DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 15:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kPvG27Ah6TjiloNx8xgMz/sE24GYm5XCZqK6FlJyQeg=; b=WUUnKKPBXcWBeI
	xktA6OfAj625c+5mPouXwNkA+eo4bDu3/xLnOyJ4EHk0d+Q5k6I0jZWeMy6jerxUqoJZpS5f0Yt+g
	kzfPH+A5icdfkuV+9Ul2Lnb4foCZdR8YKh5zWbdMWy3njseeghUK3haiR8n3THqpIDjajH3aik1Ro
	bLBBzc9ounW2vFXBQ6voAgkxIkBubN1HVedv0RlcdXUioAovHGU2tAr8WGg5TxsaFW0dgZ+m087Wv
	qpoc5vevCNkt5LISPAikLEyQyzZeFOfXCsGrY0VvzayuOYIfmvtUSK7M1NLTB5MBIDMUvdftwt2Cr
	gcRpjMcZBHlOm2eUy7Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVWv-00DWvA-Dc; Wed, 16 Mar 2022 15:25:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVLJ-00DSJO-Bh; Wed, 16 Mar 2022 15:13:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id E11001F44697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647443619;
 bh=2p0nXwmN6GNvSmOE+eHbcWmtXYYvQUQ67PxW87FfnP0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OnTFA0NyRINzLPsGHHJRLupwUDQrXTFXZAL1gYHKMD2Nk0UlqXvWXI2HomyMvWsAB
 ibVz1qaT34Bqixs06vC5y1SaLe/M2OTaB9oOU9s7Aber7hh9E/9LQ8NdMZ/bEn3bJl
 qugzWEf5u+/4q8u4dg7Do4ZWYPWBPCTkJaFPpJWE/VU8gLyZB9d7AmhA4blWeFLt1f
 7XSP4Zb/GAN12W4T5JibJLoV9obppFNE2HY+tCywtidbP9N2Q1Vc2wL8y74ZFe0v0h
 zoXSLelwiLaNE/KrkwfLddJriyMsnPYHV2Lr+E0jqOHKguaioDKiJrZStLN8sDKHZX
 RQRfr2272m1mQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 06/10] arm64: dts: mediatek: asurada: Add keyboard mapping
 for the top row
Date: Wed, 16 Mar 2022 11:13:23 -0400
Message-Id: <20220316151327.564214-7-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316151327.564214-1-nfraprado@collabora.com>
References: <20220316151327.564214-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_081341_574936_A7B66C7B 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

Q2hyb21lYm9va3MnIGVtYmVkZGVkIGtleWJvYXJkcyBkaWZmZXIgZnJvbSBzdGFuZGFyZCBsYXlv
dXRzIGZvciB0aGUKdG9wIHJvdyBpbiB0aGF0IHRoZXkgaGF2ZSBzaG9ydGN1dHMgaW4gcGxhY2Ug
b2YgdGhlIHN0YW5kYXJkIGZ1bmN0aW9uCmtleXMuIE1hcCB0aGVzZSBrZXlzIHRvIGFjaGlldmUg
dGhlIGZ1bmN0aW9uYWxpdHkgdGhhdCBpcyBwaWN0dXJlZCBvbgp0aGUgcHJpbnRvdXRzLgoKU2ln
bmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEu
Y29tPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2Fj
Y2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KLS0tCgogLi4uL2Jvb3QvZHRzL21lZGlhdGVr
L210ODE5Mi1hc3VyYWRhLmR0c2kgICAgIHwgMjkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKaW5kZXggYmQyNzMwYWI2MjY2Li4xZDFhNGI5YTk4
OWEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJh
ZGEuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRh
LmR0c2kKQEAgLTUyNSwzICs1MjUsMzIgQEAgJnVhcnQwIHsKIAogI2luY2x1ZGUgPGFybS9jcm9z
LWVjLWtleWJvYXJkLmR0c2k+CiAjaW5jbHVkZSA8YXJtL2Nyb3MtZWMtc2JzLmR0c2k+CisKKyZr
ZXlib2FyZF9jb250cm9sbGVyIHsKKwlmdW5jdGlvbi1yb3ctcGh5c21hcCA9IDwKKwkJTUFUUklY
X0tFWSgweDAwLCAweDAyLCAwKQkvKiBUMSAqLworCQlNQVRSSVhfS0VZKDB4MDMsIDB4MDIsIDAp
CS8qIFQyICovCisJCU1BVFJJWF9LRVkoMHgwMiwgMHgwMiwgMCkJLyogVDMgKi8KKwkJTUFUUklY
X0tFWSgweDAxLCAweDAyLCAwKQkvKiBUNCAqLworCQlNQVRSSVhfS0VZKDB4MDMsIDB4MDQsIDAp
CS8qIFQ1ICovCisJCU1BVFJJWF9LRVkoMHgwMiwgMHgwNCwgMCkJLyogVDYgKi8KKwkJTUFUUklY
X0tFWSgweDAxLCAweDA0LCAwKQkvKiBUNyAqLworCQlNQVRSSVhfS0VZKDB4MDIsIDB4MDksIDAp
CS8qIFQ4ICovCisJCU1BVFJJWF9LRVkoMHgwMSwgMHgwOSwgMCkJLyogVDkgKi8KKwkJTUFUUklY
X0tFWSgweDAwLCAweDA0LCAwKQkvKiBUMTAgKi8KKwk+OworCWxpbnV4LGtleW1hcCA9IDwKKwkJ
TUFUUklYX0tFWSgweDAwLCAweDAyLCBLRVlfQkFDSykKKwkJTUFUUklYX0tFWSgweDAzLCAweDAy
LCBLRVlfUkVGUkVTSCkKKwkJTUFUUklYX0tFWSgweDAyLCAweDAyLCBLRVlfWk9PTSkKKwkJTUFU
UklYX0tFWSgweDAxLCAweDAyLCBLRVlfU0NBTEUpCisJCU1BVFJJWF9LRVkoMHgwMywgMHgwNCwg
S0VZX1NZU1JRKQorCQlNQVRSSVhfS0VZKDB4MDIsIDB4MDQsIEtFWV9CUklHSFRORVNTRE9XTikK
KwkJTUFUUklYX0tFWSgweDAxLCAweDA0LCBLRVlfQlJJR0hUTkVTU1VQKQorCQlNQVRSSVhfS0VZ
KDB4MDIsIDB4MDksIEtFWV9NVVRFKQorCQlNQVRSSVhfS0VZKDB4MDEsIDB4MDksIEtFWV9WT0xV
TUVET1dOKQorCQlNQVRSSVhfS0VZKDB4MDAsIDB4MDQsIEtFWV9WT0xVTUVVUCkKKworCQlDUk9T
X1NURF9NQUlOX0tFWU1BUAorCT47Cit9OwotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
