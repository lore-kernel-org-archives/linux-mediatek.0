Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D016BC43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 17:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8h+jIo+JsgVCUjaGs6fgsXOdM/0mXSZxL4zw8Cs3Yg=; b=EinFyFB2BFwCVY
	CfwMHIaLq8txr1CNJG8iRm+KjCBfKBCbMddFZ6T2qjvLAiuM3e6hlfUQkxds6NXGdZ2yaFHHMPoG/
	xIvvixZ+ZPuS1Yuw1JEmXXBygi4trfELpxrjscXnb6AyDHyuQF6a4KpBQHV1T6SwZhBE5C8xG+B/3
	1/rOJ1W34qBrJ8M01C7p7Zncd0E+VIRxbKflXcTyfSSQts8H5mXgLfffW+kOeede9v4zwr1pjqfvS
	VWc2JENCfsb6fkvKNp3jfyx1PoJyE5d4+tCiZlFQcbC/x1tkGWsx+A8/fxvVzESJKxX++/I/4sk3I
	uUdHLYt5aQl8XdkIl9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf3Sr-006e57-Uf; Thu, 14 Apr 2022 17:41:05 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf3S0-006dcr-Og; Thu, 14 Apr 2022 17:40:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649958005; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BM15ImIYlN3d8CHSWmYH8cPVwojD283p5be1s3TSPyyHhKnRVacFahwucqiJhXvM9sellc8nKwOCd1qextffBnW56TuGAS7wcWnel3BfhPXgPh8alChRyfGPVsdZDAi24f6P3kjslhT0lr9XtVRxAQ8k5MCVECWRa0k4RIIzF9Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649958005;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=s1LmDSijsmBE7FvhkLWY0uay9Ozv4AzabDKN3IG8EHc=; 
 b=ksnfp6GJNp0G1CBpZ3MVlIv9XhJMGhOQxQwdKVGlslnEUjUBj2K6tYot6s6BcK2Iz8NkfLKX4kSJqqA35ijWMVUDzAyOW2I8PYXTYBiv7SRrIG63/CAe4GPWS4LS3zqocotOEhY9b+DAyhphyIxZrNZu6gVoWkQsSun6cfb83Po=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649958005; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=s1LmDSijsmBE7FvhkLWY0uay9Ozv4AzabDKN3IG8EHc=;
 b=LQR735vDndLpERduTO7MJi8Y+pixpSVoEVk9jcT6yz8AZjY2bzwcmMvWHKMHjJ2y
 SF3mn5WybNPXnfJdBh5ttVpwyllR9MkUZB7SsUYTN9Z5fPP/45MoSVe7i0HR785TM8R
 gQeKIQWaJ3JJwL+l6JGvDHPN+a0l2IkarnUEdh9Q=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649958003995788.4239165981783;
 Thu, 14 Apr 2022 10:40:03 -0700 (PDT)
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
Subject: [PATCH v2 06/14] pinctrl: ralink: rename driver names to subdrivers
Date: Thu, 14 Apr 2022 20:39:08 +0300
Message-Id: <20220414173916.5552-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414173916.5552-1-arinc.unal@arinc9.com>
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_104012_889160_957F086C 
X-CRM114-Status: GOOD (  10.43  )
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

TVQ3NjIwLCBNVDc2MjEsIFJUMjg4MCwgUlQzMDVYIGFuZCBSVDM4ODMgcGluY3RybCBhcmUgc3Vi
ZHJpdmVycyBvZiB0aGUKUmFsaW5rIHBpbmN0cmwgZHJpdmVyLiBDaGFuZ2UgdGhlIGJvb2wgZm9y
IHRoZXNlIHN1YmRyaXZlcnMgYWNjb3JkaW5nbHkuCgpTaWduZWQtb2ZmLWJ5OiBBcsSxbsOnIMOc
TkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+ClJldmlld2VkLWJ5OiBTZXJnaW8gUGFyYWN1ZWxs
b3MgPHNlcmdpby5wYXJhY3VlbGxvc0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9waW5jdHJsL3Jh
bGluay9LY29uZmlnIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcmFsaW5r
L0tjb25maWcgYi9kcml2ZXJzL3BpbmN0cmwvcmFsaW5rL0tjb25maWcKaW5kZXggYWE4MmFjZmFl
ODI3Li4xZTRjNWU0M2Q2OWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGluY3RybC9yYWxpbmsvS2Nv
bmZpZworKysgYi9kcml2ZXJzL3BpbmN0cmwvcmFsaW5rL0tjb25maWcKQEAgLTgsMjcgKzgsMjcg
QEAgY29uZmlnIFBJTkNUUkxfUkFMSU5LCiAgICAgICAgIHNlbGVjdCBHRU5FUklDX1BJTkNPTkYK
IAogY29uZmlnIFBJTkNUUkxfTVQ3NjIwCi0gICAgICAgIGJvb2wgIm10NzYyMCBwaW5jdHJsIGRy
aXZlciBmb3IgUkFMSU5LL01lZGlhdGVrIFNPQ3MiCisgICAgICAgIGJvb2wgIk1UNzYyMCBwaW5j
dHJsIHN1YmRyaXZlciIKICAgICAgICAgZGVwZW5kcyBvbiBSQUxJTksgJiYgU09DX01UNzYyMAog
ICAgICAgICBzZWxlY3QgUElOQ1RSTF9SQUxJTksKIAogY29uZmlnIFBJTkNUUkxfTVQ3NjIxCi0g
ICAgICAgIGJvb2wgIm10NzYyMSBwaW5jdHJsIGRyaXZlciBmb3IgUkFMSU5LL01lZGlhdGVrIFNP
Q3MiCisgICAgICAgIGJvb2wgIk1UNzYyMSBwaW5jdHJsIHN1YmRyaXZlciIKICAgICAgICAgZGVw
ZW5kcyBvbiBSQUxJTksgJiYgU09DX01UNzYyMQogICAgICAgICBzZWxlY3QgUElOQ1RSTF9SQUxJ
TksKIAogY29uZmlnIFBJTkNUUkxfUlQyODgwCi0gICAgICAgIGJvb2wgIlJUMjg4MCBwaW5jdHJs
IGRyaXZlciBmb3IgUkFMSU5LL01lZGlhdGVrIFNPQ3MiCisgICAgICAgIGJvb2wgIlJUMjg4MCBw
aW5jdHJsIHN1YmRyaXZlciIKICAgICAgICAgZGVwZW5kcyBvbiBSQUxJTksgJiYgU09DX1JUMjg4
WAogICAgICAgICBzZWxlY3QgUElOQ1RSTF9SQUxJTksKIAogY29uZmlnIFBJTkNUUkxfUlQzMDVY
Ci0gICAgICAgIGJvb2wgIlJUMzA1WCBwaW5jdHJsIGRyaXZlciBmb3IgUkFMSU5LL01lZGlhdGVr
IFNPQ3MiCisgICAgICAgIGJvb2wgIlJUMzA1WCBwaW5jdHJsIHN1YmRyaXZlciIKICAgICAgICAg
ZGVwZW5kcyBvbiBSQUxJTksgJiYgU09DX1JUMzA1WAogICAgICAgICBzZWxlY3QgUElOQ1RSTF9S
QUxJTksKIAogY29uZmlnIFBJTkNUUkxfUlQzODgzCi0gICAgICAgIGJvb2wgIlJUMzg4MyBwaW5j
dHJsIGRyaXZlciBmb3IgUkFMSU5LL01lZGlhdGVrIFNPQ3MiCisgICAgICAgIGJvb2wgIlJUMzg4
MyBwaW5jdHJsIHN1YmRyaXZlciIKICAgICAgICAgZGVwZW5kcyBvbiBSQUxJTksgJiYgU09DX1JU
Mzg4MwogICAgICAgICBzZWxlY3QgUElOQ1RSTF9SQUxJTksKIAotLSAKMi4yNS4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
