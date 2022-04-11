Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BA3C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 11:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9G12avI+BiBmtZXVLbXAzVy6rW+1nYL90uT/vE5wjg=; b=kSLj0W9TGjIJWp
	PKluocVLzHD2lRdX2NWB+GRZFgsR9PEMtW+L+8+fBjgIkEauL77Xm9xhp9a9bYAX5C50jiwqi2DKQ
	wxs5iEul9B7YW4bYeYa67+lCtITFciUDdqshOyzs26BSfx8mMyI+26sgRcCEtzyJFinz3UncZKBZG
	J9UIg9WcGWkdMD2g7smm2pxt01VEX+vnktSuKjjyA/wsNOo20wrCNQlsvBJsD5//XHgV8518yc683
	5YCMrrqP1ok8U8M8wimGlt8uw/ZEj3oGmnxU4MlhLQ5WIT2IkdsTiUOgOeT/C9gtfuFWyQNfY6xzd
	5CLUzq/gFYh9QbM2lgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nds8i-008edu-I4; Mon, 11 Apr 2022 11:23:24 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nds6t-008dW0-Ik; Mon, 11 Apr 2022 11:21:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649676063; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FYR1ljHw9ZleGd6VEvYY5zwbU+JgG4fLt3a2rwmS4wVlnaOl9s2j1HOI0SSXKQ6A+OyZBAnGhe45k+byVXyfC7zH/i5thZnjMfpPDWFCS8CNw2OnTGcSIxnfoViN50bdVrne8aP5+oFxupsAqFo8Nzw8RWZDQAN4fbGYrYKoUA4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649676063;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=s4xzLoNpe1+7AuZ01StDxH9nnUVROAsjJ2iNHkOD0DU=; 
 b=oKfNTWkk4QyWgfmc4PKiKA3Ynqjmax8qhZTvK266DXBSy5f9LujDG9UsRwnksOB2161zsbCsxfkxMrQmnJdZvPNzA8jWjJABhEE7Nl6NT8s8zhVHq2RzjW4VI0kQPVFijdOjNZeFz4VNwCGnSyMMy3AMbS9xSk6MpSYTvC1OIjE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649676063; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=s4xzLoNpe1+7AuZ01StDxH9nnUVROAsjJ2iNHkOD0DU=;
 b=WJF6fzUvoRQgTBFtax5JnWNJsc7hJbZ3dZX2/HeUGB1SfRYXJUt+x5VouQMl1Tg/
 i7FEnf0Vxfc9+FuiZ4ErEWtDeeFH8Pbcz9D/24Yc+a1rchkZ2anAcB8TWHT/wV2QhPZ
 +FVt1FY1D+gfUfvVwmckgEKi2aZiHE4yO5oZapjs=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649676061982713.5477889360059;
 Mon, 11 Apr 2022 04:21:01 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v2 2/3] mips: dts: ralink: mt7621: mux phy4 to gmac1 for GB-PC1
Date: Mon, 11 Apr 2022 14:20:48 +0300
Message-Id: <20220411112049.18001-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220411112049.18001-1-arinc.unal@arinc9.com>
References: <20220411112049.18001-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_042131_718746_C21B9199 
X-CRM114-Status: GOOD (  10.04  )
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
nE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPgpSZXZpZXdlZC1ieTogU2VyZ2lvIFBhcmFjdWVs
bG9zIDxzZXJnaW8ucGFyYWN1ZWxsb3NAZ21haWwuY29tPgotLS0KdjI6IGFkZCAicmFsaW5rOiIg
dG8gdGhlIGNvbW1pdCBzdW1tYXJ5CgotLS0KIC4uLi9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLWdu
dWJlZS1nYi1wYzEuZHRzICAgfCAxOCArKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvbWlw
cy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLWdudWJlZS1nYi1wYzEuZHRzIGIvYXJjaC9taXBzL2Jv
b3QvZHRzL3JhbGluay9tdDc2MjEtZ251YmVlLWdiLXBjMS5kdHMKaW5kZXggNTg5MmJjZjcxNTk1
Li43NWYzYjA0MjU0ODcgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3
NjIxLWdudWJlZS1nYi1wYzEuZHRzCisrKyBiL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3
NjIxLWdudWJlZS1nYi1wYzEuZHRzCkBAIC0xMDMsMTQgKzEwMywyMSBAQCAmcGluY3RybCB7CiAK
IAlzdGF0ZV9kZWZhdWx0OiBzdGF0ZS1kZWZhdWx0IHsKIAkJZ3Bpby1waW5tdXggewotCQkJZ3Jv
dXBzID0gInJnbWlpMiIsICJ1YXJ0MyIsICJ3ZHQiOworCQkJZ3JvdXBzID0gInVhcnQzIiwgIndk
dCI7CiAJCQlmdW5jdGlvbiA9ICJncGlvIjsKIAkJfTsKIAl9OwogfTsKIAotJmV0aGVybmV0IHsK
LQlwaW5jdHJsLTAgPSA8Jm1kaW9fcGlucz4sIDwmcmdtaWkxX3BpbnM+OworJmdtYWMxIHsKKwlz
dGF0dXMgPSAib2theSI7CisJcGh5LWhhbmRsZSA9IDwmZXRocGh5ND47Cit9OworCismbWRpbyB7
CisJZXRocGh5NDogZXRoZXJuZXQtcGh5QDQgeworCQlyZWcgPSA8ND47CisJfTsKIH07CiAKICZz
d2l0Y2gwIHsKQEAgLTExOSwxMCArMTI2LDUgQEAgcG9ydEAwIHsKIAkJCXN0YXR1cyA9ICJva2F5
IjsKIAkJCWxhYmVsID0gImV0aGJsYWNrIjsKIAkJfTsKLQotCQlwb3J0QDQgewotCQkJc3RhdHVz
ID0gIm9rYXkiOwotCQkJbGFiZWwgPSAiZXRoYmx1ZSI7Ci0JCX07CiAJfTsKIH07Ci0tIAoyLjI1
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
