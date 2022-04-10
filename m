Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E860BC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Apr 2022 20:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OdfYxw8x079rKPz8izfvdoY9a2vurustwtIpeloGqM=; b=hnm364PSOgY6UP
	2gEwwTGBPdpdVFitcWQbFRewiTHURxacWHM472Ro/u69hMmPlmxjjjtURiJ4HtR8qYMFw/hAePwZv
	6ulGTTlWMygIYS8AvGJs3tLAFQx6hwI5NdGf93rVxSa5g9d5z2lHbB5jpds5LJXb8Yb+J+wV+5BKl
	5HbyvaKSQ1WH6W9wC9QLiuM8lwehLkUtEcCNn1q1uOYyS5eV/vYSX4kt6Z4qLk09P2sjEfZSfa2jp
	IvSZviZg5OQYQ2xGAV9dDb6I4H8l0cIRcKqunjPW5g+Nlg7kARdXICURPk7BMZ+16dpQl6WoqYBQJ
	vv+eNaBoY6u/snwSAytA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndeEZ-005RSi-H7; Sun, 10 Apr 2022 20:32:31 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndeEK-005RNG-Aa; Sun, 10 Apr 2022 20:32:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649622729; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GEQjRguIJZYHBHb1etQ4PriBmnya+eD7hSHE4mtsUSoj/AC+g2WgUYB5vmChbmJO1KqjiPZ4xmNQJeZJMULWDNHAltgSKTkfne3bsqXTK/MbZn1529kND4GcEblYIQtzh9nShoDHI4qIb6Dkix3s/P9Hog8HvauakmhgKBm8ywk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649622729;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=XK2YqT7nlytvRR0jjgieJSJ0MKgXSnwQ6QlocLMC3Yg=; 
 b=agFnNEWp7AeMpce2wS6R5M0CSwLzTeimeR5JIRInnIXlwZBuf/KDI/1H+m0RD3C3O/G6JUxm0w7Sainl14DEK9KggZ7zuOqBy+WfvkAoNVgP8R3zpgZO+oYNxYRkXVYfGJ02x5wsQKmN7McrZNdbpAApXdyTvSyLs9yKG+K7Xzg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649622729; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=XK2YqT7nlytvRR0jjgieJSJ0MKgXSnwQ6QlocLMC3Yg=;
 b=JfnbIWgD67HPe2UUlSbDAHUl6AiTVDLpixgd+RjFuozcX6EWtN/0NtCeA7ymmRQG
 7tKd/M/kLdFsVkE9360EffYBZvG6pfgYFIdcQIT2jk9CcegJ+7aOxLj6IKU753oLEoG
 jlGTKSZw8AnKxjHvVFvQBVV9umWWJ4MC2dzolCm8=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649622727528283.822930182718;
 Sun, 10 Apr 2022 13:32:07 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH 2/3] mips: dts: mt7621: mux phy4 to gmac1 for GB-PC1
Date: Sun, 10 Apr 2022 23:31:37 +0300
Message-Id: <20220410203138.22513-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220410203138.22513-1-arinc.unal@arinc9.com>
References: <20220410203138.22513-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_133216_456960_045F809B 
X-CRM114-Status: UNSURE (   9.56  )
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

TXV4IHRoZSBNVDc1MzAgc3dpdGNoJ3MgcGh5NCB0byB0aGUgU29DJ3MgZ21hYzEgb24gdGhlIEdC
LVBDMSBkZXZpY2V0cmVlLgpUaGlzIGFjaGlldmVzIDIgR2JwcyB0b3RhbCBiYW5kd2lkdGggdG8g
dGhlIENQVSB1c2luZyB0aGUgc2Vjb25kIFJHTUlJLgoKU2lnbmVkLW9mZi1ieTogQXLEsW7DpyDD
nE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPgotLS0KIC4uLi9ib290L2R0cy9yYWxpbmsvbXQ3
NjIxLWdudWJlZS1nYi1wYzEuZHRzICAgfCAxOCArKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLWdudWJlZS1nYi1wYzEuZHRzIGIvYXJjaC9t
aXBzL2Jvb3QvZHRzL3JhbGluay9tdDc2MjEtZ251YmVlLWdiLXBjMS5kdHMKaW5kZXggNTg5MmJj
ZjcxNTk1Li43NWYzYjA0MjU0ODcgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9ib290L2R0cy9yYWxp
bmsvbXQ3NjIxLWdudWJlZS1nYi1wYzEuZHRzCisrKyBiL2FyY2gvbWlwcy9ib290L2R0cy9yYWxp
bmsvbXQ3NjIxLWdudWJlZS1nYi1wYzEuZHRzCkBAIC0xMDMsMTQgKzEwMywyMSBAQCAmcGluY3Ry
bCB7CiAKIAlzdGF0ZV9kZWZhdWx0OiBzdGF0ZS1kZWZhdWx0IHsKIAkJZ3Bpby1waW5tdXggewot
CQkJZ3JvdXBzID0gInJnbWlpMiIsICJ1YXJ0MyIsICJ3ZHQiOworCQkJZ3JvdXBzID0gInVhcnQz
IiwgIndkdCI7CiAJCQlmdW5jdGlvbiA9ICJncGlvIjsKIAkJfTsKIAl9OwogfTsKIAotJmV0aGVy
bmV0IHsKLQlwaW5jdHJsLTAgPSA8Jm1kaW9fcGlucz4sIDwmcmdtaWkxX3BpbnM+OworJmdtYWMx
IHsKKwlzdGF0dXMgPSAib2theSI7CisJcGh5LWhhbmRsZSA9IDwmZXRocGh5ND47Cit9OworCism
bWRpbyB7CisJZXRocGh5NDogZXRoZXJuZXQtcGh5QDQgeworCQlyZWcgPSA8ND47CisJfTsKIH07
CiAKICZzd2l0Y2gwIHsKQEAgLTExOSwxMCArMTI2LDUgQEAgcG9ydEAwIHsKIAkJCXN0YXR1cyA9
ICJva2F5IjsKIAkJCWxhYmVsID0gImV0aGJsYWNrIjsKIAkJfTsKLQotCQlwb3J0QDQgewotCQkJ
c3RhdHVzID0gIm9rYXkiOwotCQkJbGFiZWwgPSAiZXRoYmx1ZSI7Ci0JCX07CiAJfTsKIH07Ci0t
IAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
