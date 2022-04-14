Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44920C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 17:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I326urpAECcClQima271V5VPQCINgrj//4Iy7PiHedc=; b=x2GmRr000hYF08
	qAQecr+utPppT8GSdEfeMjesBsx6saxPGuxJbvdetlmKPWvoyT2jaar+5xEisLjw4PZHCB2B1+0DU
	K4QNDUITTQ7uwovIBGlCWucQnxhhZyIng8aI+85CyX4PzW1fhSbIyPyNkY3eWKSgrRoOaEYFcF1py
	0cijaz4F8M+Jdw+goy96B9hn/T9zcIRVTGhN0sc5tWGeqGFhP8ZB+o++NW/7baEqpGA2VIOaYnV6e
	00g0lnURubnuQkL8w0HdhHT1GNwiFkH289W146jbmD0k4w999h6be8y3kBlK3rbLr9kdCS2vurGnt
	qgFiwbaWDRJCLFY9GB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf3WD-006fzL-8Q; Thu, 14 Apr 2022 17:44:33 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf3SE-006dh2-4z; Thu, 14 Apr 2022 17:40:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649958017; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=U+BOK0yxGmhzsUrcSNrdl8S9x/AIthHTs84EHPilgjRUcemeuyVKL7l72czvLAiCnREv3BbNI+s3Q3nvNdKzYymN84kzxCTK2TTFHXtTVQejHUZYjS+ETbCwIhmA6NQO8apoY09E733FzkjXx94LtMB+t9IUVJ2kMnLzpjlsNy0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649958017;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=MB5zzWcylEqjeE5qy26s0JEc3WbeD8CfHOfbrOz2uqg=; 
 b=LaUhHkZaOcKqsul/1EEsbvJi12DxU9iy+qBpGaCMCe7gLHE/WB4zWyXaQhj6pFnMMaDeuEkARslw9gqn7576DiNogzZhoKxU/XJerJ5anx3/CAqzspiYEtJaWnpxJmpfzgOMnR9Vmjl5hzuQUheZoa28hXxwEWaZTsGITxssbEw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649958017; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=MB5zzWcylEqjeE5qy26s0JEc3WbeD8CfHOfbrOz2uqg=;
 b=YgK/x8W5mq8eWD0Eieec2lIx0O75cEFl+70SeV2AFXeIKp85fPGtf36M4GGLnjIK
 Grv805/J9goufe4gdKXvynUSsOK6p/nHKNvqabbMqnAC99nvl0EfKvPFbk261pxX97p
 fYJ4XKqRIqtIBO1CH82DBM7WscUHh+nTHSGeDUts=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 164995801641693.13202580357915;
 Thu, 14 Apr 2022 10:40:16 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Joe Perches <joe@perches.com>
Cc: erkin.bozoglu@xeront.com,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH v2 09/14] mips: dts: ralink: mt7621: use the new compatible
 string for MT7621 pinctrl
Date: Thu, 14 Apr 2022 20:39:11 +0300
Message-Id: <20220414173916.5552-10-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414173916.5552-1-arinc.unal@arinc9.com>
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_104026_296041_325FCE0D 
X-CRM114-Status: GOOD (  11.36  )
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
IHRoZSBSYWxpbmsgTVQ3NjIxCnBpbmN0cmwgc3ViZHJpdmVyIG9uIG10NzYyMS5kdHNpLgoKRWFj
aCBzdWJkcml2ZXIgbmVlZHMgdG8gaGF2ZSBhIGRpZmZlcmVudCBjb21wYXRpYmxlIHN0cmluZy4g
V2UgZG9uJ3Qgd2FudAp0aGUgc2FtZSBjb21wYXRpYmxlIHN0cmluZyB0byBtYXRjaCBhIGRpZmZl
cmVudCBzdWJkcml2ZXIncyBwaW5tdXggZGF0YSBhcwppdCdzIG5vdCBmb3Igb3VyIFNvQy4KClNp
Z25lZC1vZmYtYnk6IEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KLS0tCiBh
cmNoL21pcHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMS5kdHNpIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBz
L2Jvb3QvZHRzL3JhbGluay9tdDc2MjEuZHRzaSBiL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsv
bXQ3NjIxLmR0c2kKaW5kZXggMzIyMjY4NDkxNWFjLi5lZTJlYzc4Yzg5NTIgMTAwNjQ0Ci0tLSBh
L2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLmR0c2kKKysrIGIvYXJjaC9taXBzL2Jv
b3QvZHRzL3JhbGluay9tdDc2MjEuZHRzaQpAQCAtMTUxLDcgKzE1MSw3IEBAIHNwaTA6IHNwaUBi
MDAgewogCX07CiAKIAlwaW5jdHJsOiBwaW5jdHJsIHsKLQkJY29tcGF0aWJsZSA9ICJyYWxpbmss
cnQyODgwLXBpbm11eCI7CisJCWNvbXBhdGlibGUgPSAicmFsaW5rLG10NzYyMS1waW5jdHJsIjsK
IAogCQlpMmNfcGluczogaTJjMC1waW5zIHsKIAkJCXBpbm11eCB7Ci0tIAoyLjI1LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
