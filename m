Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D890DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkA7+TXWla4jMYeeJY05hvCjMls+4NxOSNqi+46px4w=; b=Z9eBcrd5yC7uWs
	Yr9T8aKZA8DqHM9N5QKFXX9hwUpmIbOKUeJ+X1tBW7/05h62aaosZFJewZTNRwTWisLzzH4JCJTcP
	EmqjlqT5+UQVrdJqKEhe0b0KONmfcFdmIn4MQHko8SyTW0JZCm/YQSTqnjJioNHxoqZPx9nJVW5Zb
	ejuvs1G/u3u0DNg7vQjI7BcAIrJcnSP1octxnW3xiXQ+nHS6wasH0vY4ahrunvTf3rUg6whvS0e3f
	zg+GsUFsmAEGAYyJVfmWt6sUoF08bYRo+iiztpPaaVlgCcZP6VFLXOTj68O0vf6Jmk0qNieMKKZuA
	qmqaIHmaqi8iUStBf8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVUd-00DW6D-9c; Wed, 16 Mar 2022 15:23:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVLF-00DSH6-3h; Wed, 16 Mar 2022 15:13:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id C5F061F44681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647443615;
 bh=6XdHparrNynql5aI5JDISRsUDYEhB7brv5rqIJfGbOk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LQdSkPXBBpWphzqB2vlbw3lyC7guiYbHqG7S+Fkajzu0NGPBLZnROInbMF1zm/ef3
 dD0jPE2IiFpeSOlvQD0Q/AnMe317I8a60t2IUMUfsPRa3m8huuwnoNqyVeVPwW+3IW
 LuGwM3bfzuuSFAFa6VY/q5jcmHnp93iZiSrS1xAzf2lupNXzVhOkXNL6ilgQ0tNFg/
 QdGHdQq03NAkQEfMOJK3pxQbMWBZdpHsEymAi0hoaF8V/S/bm18a46K36l6CL4T+3z
 3QVxnJ8OIQ8s5TpKudfVdlQdvvkLJW4xOikvxLq2qEG2wBDXhqpVY7PWMcWtJBCQo7
 omarGcoGldLiA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 03/10] arm64: dts: mediatek: asurada: Add system-wide power
 supplies
Date: Wed, 16 Mar 2022 11:13:20 -0400
Message-Id: <20220316151327.564214-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316151327.564214-1-nfraprado@collabora.com>
References: <20220316151327.564214-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_081337_381008_2286F1CD 
X-CRM114-Status: UNSURE (   8.91  )
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

QWRkIHN5c3RlbS13aWRlIHBvd2VyIHN1cHBsaWVzIHByZXNlbnQgb24gYWxsIG9mIHRoZSBib2Fy
ZHMgaW4gdGhlCkFzdXJhZGEgZmFtaWx5LgoKU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4g
QS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lv
YWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNv
bT4KLS0tCgogLi4uL2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kgICAgIHwg
NjQgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRh
LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kK
aW5kZXggZTEwNjM2Mjk4NjM5Li41Y2I3NTgwYTEzY2YgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKQEAgLTE5LDYgKzE5LDcwIEBAIG1l
bW9yeUA0MDAwMDAwMCB7CiAJCWRldmljZV90eXBlID0gIm1lbW9yeSI7CiAJCXJlZyA9IDwwIDB4
NDAwMDAwMDAgMCAweDgwMDAwMDAwPjsKIAl9OworCisJLyogc3lzdGVtIHdpZGUgTERPIDEuOFYg
cG93ZXIgcmFpbCAqLworCXBwMTgwMF9sZG9fZzogcHAxODAwLWxkby1nIHsKKwkJY29tcGF0aWJs
ZSA9ICJyZWd1bGF0b3ItZml4ZWQiOworCQlyZWd1bGF0b3ItbmFtZSA9ICJwcDE4MDBfbGRvX2ci
OworCQlyZWd1bGF0b3ItYWx3YXlzLW9uOworCQlyZWd1bGF0b3ItYm9vdC1vbjsKKwkJcmVndWxh
dG9yLW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAwMD47CisJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0
ID0gPDE4MDAwMDA+OworCQl2aW4tc3VwcGx5ID0gPCZwcDMzMDBfZz47CisJfTsKKworCS8qIHN5
c3RlbSB3aWRlIHN3aXRjaGluZyAzLjNWIHBvd2VyIHJhaWwgKi8KKwlwcDMzMDBfZzogcHAzMzAw
LWcgeworCQljb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7CisJCXJlZ3VsYXRvci1uYW1l
ID0gInBwMzMwMF9nIjsKKwkJcmVndWxhdG9yLWFsd2F5cy1vbjsKKwkJcmVndWxhdG9yLWJvb3Qt
b247CisJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+OworCQlyZWd1bGF0b3It
bWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKKwkJdmluLXN1cHBseSA9IDwmcHB2YXJfc3lzPjsK
Kwl9OworCisJLyogc3lzdGVtIHdpZGUgTERPIDMuM1YgcG93ZXIgcmFpbCAqLworCXBwMzMwMF9s
ZG9fejogcHAzMzAwLWxkby16IHsKKwkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwor
CQlyZWd1bGF0b3ItbmFtZSA9ICJwcDMzMDBfbGRvX3oiOworCQlyZWd1bGF0b3ItYWx3YXlzLW9u
OworCQlyZWd1bGF0b3ItYm9vdC1vbjsKKwkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzMw
MDAwMD47CisJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+OworCQl2aW4tc3Vw
cGx5ID0gPCZwcHZhcl9zeXM+OworCX07CisKKwkvKiBzZXBhcmF0ZWx5IHN3aXRjaGVkIDMuM1Yg
cG93ZXIgcmFpbCAqLworCXBwMzMwMF91OiBwcDMzMDAtdSB7CisJCWNvbXBhdGlibGUgPSAicmVn
dWxhdG9yLWZpeGVkIjsKKwkJcmVndWxhdG9yLW5hbWUgPSAicHAzMzAwX3UiOworCQlyZWd1bGF0
b3ItYWx3YXlzLW9uOworCQlyZWd1bGF0b3ItYm9vdC1vbjsKKwkJcmVndWxhdG9yLW1pbi1taWNy
b3ZvbHQgPSA8MzMwMDAwMD47CisJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+
OworCQkvKiBlbmFibGUgcGluIHdpcmVkIHRvIEdQSU8gY29udHJvbGxlZCBieSBFQyAqLworCQl2
aW4tc3VwcGx5ID0gPCZwcDMzMDBfZz47CisJfTsKKworCS8qIHN5c3RlbSB3aWRlIHN3aXRjaGlu
ZyA1LjBWIHBvd2VyIHJhaWwgKi8KKwlwcDUwMDBfYTogcHA1MDAwLWEgeworCQljb21wYXRpYmxl
ID0gInJlZ3VsYXRvci1maXhlZCI7CisJCXJlZ3VsYXRvci1uYW1lID0gInBwNTAwMF9hIjsKKwkJ
cmVndWxhdG9yLWFsd2F5cy1vbjsKKwkJcmVndWxhdG9yLWJvb3Qtb247CisJCXJlZ3VsYXRvci1t
aW4tbWljcm92b2x0ID0gPDUwMDAwMDA+OworCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDw1
MDAwMDAwPjsKKwkJdmluLXN1cHBseSA9IDwmcHB2YXJfc3lzPjsKKwl9OworCisJLyogc3lzdGVt
IHdpZGUgc2VtaS1yZWd1bGF0ZWQgcG93ZXIgcmFpbCBmcm9tIGJhdHRlcnkgb3IgVVNCICovCisJ
cHB2YXJfc3lzOiBwcHZhci1zeXMgeworCQljb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7
CisJCXJlZ3VsYXRvci1uYW1lID0gInBwdmFyX3N5cyI7CisJCXJlZ3VsYXRvci1hbHdheXMtb247
CisJCXJlZ3VsYXRvci1ib290LW9uOworCX07CiB9OwogCiAmcGlvIHsKLS0gCjIuMzUuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
