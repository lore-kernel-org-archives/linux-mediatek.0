Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3FFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 06:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cC8ynL99MhzW3BjtnZpHU/JXJp5CmzIcAAgJZhjdpog=; b=mOjTBOgBM5LCHL
	LpCr6TJKgnTDiXWyV/7CIAW/qavsL1OTjtPor3m6/SBE1s1GommztveDxJvLufQ7pb/BF1AONJlUw
	Z+oS1CCI9Wk2A3Kt4NuPVgN+SZDN0twJt/AlF3CKHl4u3C4S6m8urkKo63WQlK+b4Isko0hsADP8r
	O/Y04LVWEgEdnNV0oBxRysjLCcTTxR79kYDAlcJ9MPSorUsF4Zm/AYcVk8hO7qQ1k911W1BdA0Y2j
	dMxVjmIAvkYBnLD5hPoI8moIljrqBRmk/Z16g4h1oBsnx5wlF9EFjCnzxvfdLyyy+7xcMGfHy0ttf
	/fvN+iIBRV+WodqVtwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neWIM-00H4GT-Oe; Wed, 13 Apr 2022 06:16:02 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neWBF-00H0nE-8m; Wed, 13 Apr 2022 06:08:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649830113; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hpzg3wR0LpVH5X/8/57RA59bYRDXsf84Bb3hl8VxUS+hB2k2O+/zk+HDlD5suu+C+bcLWDcWGuHyjIG+6TSRp7R6T39s/HalBsEjYzn+Jc/gT7jkMTSrUAHrCtjHQ893ypQWS3o/LcGk0TzaBSl0VfUanYEUECHcEZB+BQzrw7k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649830113;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=1BjrczZirfUF2dEXTl/cJGz/srxQHd03Uv9nvjAwYEU=; 
 b=dekgzskHx43z7DuUjdOyF3iGknQLw4InEb2ha1g5GyeBBOkHIEyFy5WEYVwS9GZ9zGhwZh3bpjYsHg4KKT9JukWT0cUD3A6b3OpcI9xSBF3KKKqLPt/mO+hTygn1klyw/Mdp2HBqIB+FpzomaPHWYc0E+F7VrpMKpzUwyrXAL6o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649830113; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=1BjrczZirfUF2dEXTl/cJGz/srxQHd03Uv9nvjAwYEU=;
 b=aBatCYOOIzcSb3fFkXcG8jq3VliSKO6ip08Rx0p9aK2EmP83Cqn33IzvZkDDYfLX
 AYBdr6uPE1664ca1RWoHNLxN036H8QSwAOaCIpuiTBTcu67J0tpoRsPfy5e1iZ7VBVz
 ZqLhN5WRAgqQvTDq6iP5Z3jb6P8TKWDUW6e5X/Fc=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649830111968178.63025992054952;
 Tue, 12 Apr 2022 23:08:31 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: erkin.bozoglu@xeront.com,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH 09/14] mips: dts: ralink: mt7621: use the new compatible
 string for MT7621 pinctrl
Date: Wed, 13 Apr 2022 09:07:24 +0300
Message-Id: <20220413060729.27639-10-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413060729.27639-1-arinc.unal@arinc9.com>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_230841_433091_2D14D7B6 
X-CRM114-Status: GOOD (  10.99  )
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

VXNlIHRoZSBuZXcgY29tcGF0aWJsZSBzdHJpbmcgInJhbGluayxtdDc2MjEtcGluY3RybCIgZm9y
IHRoZSBSYWxpbmsgTVQ3NjIxCnBpbmN0cmwgc3ViZHJpdmVyIG9uIG10NzYyMS5kdHNpLgoKU2ln
bmVkLW9mZi1ieTogQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPgotLS0KIGFy
Y2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLmR0c2kgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL21pcHMv
Ym9vdC9kdHMvcmFsaW5rL210NzYyMS5kdHNpIGIvYXJjaC9taXBzL2Jvb3QvZHRzL3JhbGluay9t
dDc2MjEuZHRzaQppbmRleCAzMjIyNjg0OTE1YWMuLmVlMmVjNzhjODk1MiAxMDA2NDQKLS0tIGEv
YXJjaC9taXBzL2Jvb3QvZHRzL3JhbGluay9tdDc2MjEuZHRzaQorKysgYi9hcmNoL21pcHMvYm9v
dC9kdHMvcmFsaW5rL210NzYyMS5kdHNpCkBAIC0xNTEsNyArMTUxLDcgQEAgc3BpMDogc3BpQGIw
MCB7CiAJfTsKIAogCXBpbmN0cmw6IHBpbmN0cmwgewotCQljb21wYXRpYmxlID0gInJhbGluayxy
dDI4ODAtcGlubXV4IjsKKwkJY29tcGF0aWJsZSA9ICJyYWxpbmssbXQ3NjIxLXBpbmN0cmwiOwog
CiAJCWkyY19waW5zOiBpMmMwLXBpbnMgewogCQkJcGlubXV4IHsKLS0gCjIuMjUuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
