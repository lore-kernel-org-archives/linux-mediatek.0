Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D06C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 11:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M6LDQd7JGP+NyQAT0cWg6WPr2gfmChkF9RCcZPndRuM=; b=UDyUuOa3J5ElkL
	Re1l9/PlhQC4P6fyMkDZ5tuiJ772nC4nbWFimYHOxf7mAPZJy+SOVEnazFaHxFLFFJC/WmSf3+uue
	JddRZuCVzrol5ZlGZ5fRtraaXze3Mtr/48hUBFMJVxODnaxY5zTz2nco1A9HCo2l+mzAqpSVXhBM6
	EY4Yf6hs+BrAjq2My4ukD5IU0SYfa71iEDW4TXjtpoK5qvcmp0n97k3NXrn5UQhdGEmVMMAu0dvmS
	MBPV7l/pW33dIySJ1d6HPVR5oQ0IlGJMgUCZL9qr+5Zecl2p8Db03+hGyyuYk49Twr4G0ZBcyXAX1
	jc1kIqxzhpoNW/A4KamQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nds7z-008eBg-2u; Mon, 11 Apr 2022 11:22:39 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nds6j-008dOB-Ci; Mon, 11 Apr 2022 11:21:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649676061; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KvjB4g1IY7b+mOzCYMJW/0qOEEaSLHuB8PIAAUq+B535WJjBOM4sOytUNsn29TxcSSRzuN7x66P1b0SOsP3J6zO8ExXJbsU0sj6GWZw4ZoQcfRGAJkiBV8MFNj5VRU+Y56ztdKHOjai6ZwkZRrkEVbUYkhbxj6gS42Yu/Lxx8Nw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649676061;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=l8Cw8EpJJ1aRQC34dDhV085dThpqu+42RlTKhEGAu3M=; 
 b=nZW1pgR/jcjvxgdSndzs/NZ0YSwAFaiEJ+yjr4QDjE56faYNEqZ83RGM884Lat+ATmDuodBemnoGLmXJM4BUnaqW7wEGdNiQTsLvJDZhffOYGyxwY+acdXV2m48hgzW59QwIIJNR7Z3yEuakrr/oJ7X60AgcQ/jrCS9TnLAfif8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649676061; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=l8Cw8EpJJ1aRQC34dDhV085dThpqu+42RlTKhEGAu3M=;
 b=JdK5Ifnqu04wR5Ou6N6ptEw0Ow4YTZqEucw9xrjLwe+WhAdgJH6BmTCTyJ6nPZ5T
 TEfnmgvcFc+U9crdLHxegC2BAMEcpYOulMd+cdhddfOJBNFOh74wYiMTNGN2oDBkOVl
 3Nfp/P5wdB8Va4q9dIu13xY1Mnu8lkyFnsOyNj6U=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649676058761238.78642786378032;
 Mon, 11 Apr 2022 04:20:58 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v2 1/3] mips: dts: ralink: mt7621: add mdio label to mdio-bus
Date: Mon, 11 Apr 2022 14:20:47 +0300
Message-Id: <20220411112049.18001-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_042121_525355_B1E8874B 
X-CRM114-Status: GOOD (  10.11  )
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

QWRkIG1kaW8gbGFiZWwgdG8gdGhlIG1kaW8tYnVzIG5vZGUgdG8gZWFzaWx5IHJlZmVyIHRvIGl0
LgoKVXNlIHRoZSBuZXdseSBjcmVhdGVkIGxhYmVsIG9uIHRoZSBHQi1QQzIgZGV2aWNldHJlZS4K
ClNpZ25lZC1vZmYtYnk6IEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KUmV2
aWV3ZWQtYnk6IFNlcmdpbyBQYXJhY3VlbGxvcyA8c2VyZ2lvLnBhcmFjdWVsbG9zQGdtYWlsLmNv
bT4KLS0tCnYyOiBhZGQgInJhbGluazoiIHRvIHRoZSBjb21taXQgc3VtbWFyeQoKLS0tCiAuLi4v
Ym9vdC9kdHMvcmFsaW5rL210NzYyMS1nbnViZWUtZ2ItcGMyLmR0cyAgIHwgMTggKysrKysrKyst
LS0tLS0tLS0tCiBhcmNoL21pcHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMS5kdHNpICAgICAgICAg
IHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9hcmNoL21pcHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMS1nbnViZWUt
Z2ItcGMyLmR0cyBiL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLWdudWJlZS1nYi1w
YzIuZHRzCmluZGV4IGE3ZmNlOGRlNjE0Ny4uYjQyN2FlOWUwODFmIDEwMDY0NAotLS0gYS9hcmNo
L21pcHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMS1nbnViZWUtZ2ItcGMyLmR0cworKysgYi9hcmNo
L21pcHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMS1nbnViZWUtZ2ItcGMyLmR0cwpAQCAtOTMsMTcg
KzkzLDE1IEBAIGdwaW8tcGlubXV4IHsKIAl9OwogfTsKIAotJmV0aGVybmV0IHsKLQlnbWFjMTog
bWFjQDEgewotCQlzdGF0dXMgPSAib2theSI7Ci0JCXBoeS1oYW5kbGUgPSA8JmV0aHBoeTc+Owot
CX07CismZ21hYzEgeworCXN0YXR1cyA9ICJva2F5IjsKKwlwaHktaGFuZGxlID0gPCZldGhwaHk3
PjsKK307CiAKLQltZGlvLWJ1cyB7Ci0JCWV0aHBoeTc6IGV0aGVybmV0LXBoeUA3IHsKLQkJCXJl
ZyA9IDw3PjsKLQkJCXBoeS1tb2RlID0gInJnbWlpLXJ4aWQiOwotCQl9OworJm1kaW8geworCWV0
aHBoeTc6IGV0aGVybmV0LXBoeUA3IHsKKwkJcmVnID0gPDc+OworCQlwaHktbW9kZSA9ICJyZ21p
aS1yeGlkIjsKIAl9OwogfTsKIApkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2Jvb3QvZHRzL3JhbGlu
ay9tdDc2MjEuZHRzaSBiL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLmR0c2kKaW5k
ZXggMzIyMjY4NDkxNWFjLi40MGQwZjI4NDQ2Y2EgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9ib290
L2R0cy9yYWxpbmsvbXQ3NjIxLmR0c2kKKysrIGIvYXJjaC9taXBzL2Jvb3QvZHRzL3JhbGluay9t
dDc2MjEuZHRzaQpAQCAtMzQyLDcgKzM0Miw3IEBAIGdtYWMxOiBtYWNAMSB7CiAJCQlwaHktbW9k
ZSA9ICJyZ21paS1yeGlkIjsKIAkJfTsKIAotCQltZGlvLWJ1cyB7CisJCW1kaW86IG1kaW8tYnVz
IHsKIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJI3NpemUtY2VsbHMgPSA8MD47CiAKLS0g
CjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
