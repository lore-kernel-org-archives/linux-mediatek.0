Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9248CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 06:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdQvljsDG30RyDPhVKJ4WCo7+1IDJ0zpBx0eCseufu4=; b=uOB5bOjF/VNLtl
	YB9waozUKDp7vcoYuB6VDHd6p28G9Iqx5Q5/Ey6bqUBVz5SM3sWehl9G+BV8KjT9pEq26XKTSwzRD
	c39hVsRDNUrvDaHnRq+a17n1oOeuQuBTCPIudFM4fBqsRGvF+jlIDzLauQkvatSHyWhphfP1MNJmv
	ZGRWArVx79ACugK4QLCWHP6tb+liystl7ZtRoSKUC1UKOoLkgnFOnzHKbdYSvE/Rb4TWVc7gtwNV7
	F/8KPppwNah9LjMMNWYSAIyAUMtPMBSEXhZhr1p3vx5/bjOyhVxPZO9yMLvs47+5Ivz6PLZeTOk6Q
	LjXxrF3Rn6ACyDakimaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neWFW-00H2hs-EG; Wed, 13 Apr 2022 06:13:06 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neWB2-00H0g2-D1; Wed, 13 Apr 2022 06:08:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649830101; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=liMgNpg33SS2OvOZYdZBKHZPqfXvTi8pe2mXkUOC1YNNNsD53CjcTEtzhm7ywRh/q4vEifwykX5M+gZlsbUk7wQYdGKiROSyFlCdF6nAic/YMp8okO+ynkThGQpUQy4m5y0SoeKocv/BeL+A5c9WoIy7SoRnEvf3YTCG+F9NLxw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649830101;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=878kXtEdAnfBMNKIaxNjcqBB89T7RAeyy8yeVqqZFHA=; 
 b=UGyTXtknCEaz98x2XVAGNPd0FMmwfz3sU4DfzcLM+2dViqxqH0hvChK0Pjj5/eizqn3i7SXqB5WvnI8Jm71Rk+ffY8daCF1eSB7ru51PhH24mOFnG17xuNsXJok0/HxgAZnMXB1MocrlRyoI7a1aCpJZn501KqnwJbWfYEgjm7Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649830101; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=878kXtEdAnfBMNKIaxNjcqBB89T7RAeyy8yeVqqZFHA=;
 b=XHLpY3f5Wlpeu1WOHea63Cmyugy13JUveEvwQmzPjDFvsh8xlry0jpxJlS/bQ5qU
 nxVQgrdZ8lJ6zTIWzE5V3xxhSz2IvoX1sNbhCM9ehp0W5EpKqLRdhJi6gCbSp6TTrJg
 Ro/zzMAz9e7ph8hjjEDS5nRcnaLtwkpkTcHaUYPo=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649830100132544.2723875253341;
 Tue, 12 Apr 2022 23:08:20 -0700 (PDT)
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
Subject: [PATCH 06/14] pinctrl: ralink: rename driver names to subdrivers
Date: Wed, 13 Apr 2022 09:07:21 +0300
Message-Id: <20220413060729.27639-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413060729.27639-1-arinc.unal@arinc9.com>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_230828_654125_9ABE5B69 
X-CRM114-Status: GOOD (  10.27  )
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
TkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+Ci0tLQogZHJpdmVycy9waW5jdHJsL3JhbGluay9L
Y29uZmlnIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcmFsaW5rL0tjb25m
aWcgYi9kcml2ZXJzL3BpbmN0cmwvcmFsaW5rL0tjb25maWcKaW5kZXggYWE4MmFjZmFlODI3Li4x
ZTRjNWU0M2Q2OWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGluY3RybC9yYWxpbmsvS2NvbmZpZwor
KysgYi9kcml2ZXJzL3BpbmN0cmwvcmFsaW5rL0tjb25maWcKQEAgLTgsMjcgKzgsMjcgQEAgY29u
ZmlnIFBJTkNUUkxfUkFMSU5LCiAgICAgICAgIHNlbGVjdCBHRU5FUklDX1BJTkNPTkYKIAogY29u
ZmlnIFBJTkNUUkxfTVQ3NjIwCi0gICAgICAgIGJvb2wgIm10NzYyMCBwaW5jdHJsIGRyaXZlciBm
b3IgUkFMSU5LL01lZGlhdGVrIFNPQ3MiCisgICAgICAgIGJvb2wgIk1UNzYyMCBwaW5jdHJsIHN1
YmRyaXZlciIKICAgICAgICAgZGVwZW5kcyBvbiBSQUxJTksgJiYgU09DX01UNzYyMAogICAgICAg
ICBzZWxlY3QgUElOQ1RSTF9SQUxJTksKIAogY29uZmlnIFBJTkNUUkxfTVQ3NjIxCi0gICAgICAg
IGJvb2wgIm10NzYyMSBwaW5jdHJsIGRyaXZlciBmb3IgUkFMSU5LL01lZGlhdGVrIFNPQ3MiCisg
ICAgICAgIGJvb2wgIk1UNzYyMSBwaW5jdHJsIHN1YmRyaXZlciIKICAgICAgICAgZGVwZW5kcyBv
biBSQUxJTksgJiYgU09DX01UNzYyMQogICAgICAgICBzZWxlY3QgUElOQ1RSTF9SQUxJTksKIAog
Y29uZmlnIFBJTkNUUkxfUlQyODgwCi0gICAgICAgIGJvb2wgIlJUMjg4MCBwaW5jdHJsIGRyaXZl
ciBmb3IgUkFMSU5LL01lZGlhdGVrIFNPQ3MiCisgICAgICAgIGJvb2wgIlJUMjg4MCBwaW5jdHJs
IHN1YmRyaXZlciIKICAgICAgICAgZGVwZW5kcyBvbiBSQUxJTksgJiYgU09DX1JUMjg4WAogICAg
ICAgICBzZWxlY3QgUElOQ1RSTF9SQUxJTksKIAogY29uZmlnIFBJTkNUUkxfUlQzMDVYCi0gICAg
ICAgIGJvb2wgIlJUMzA1WCBwaW5jdHJsIGRyaXZlciBmb3IgUkFMSU5LL01lZGlhdGVrIFNPQ3Mi
CisgICAgICAgIGJvb2wgIlJUMzA1WCBwaW5jdHJsIHN1YmRyaXZlciIKICAgICAgICAgZGVwZW5k
cyBvbiBSQUxJTksgJiYgU09DX1JUMzA1WAogICAgICAgICBzZWxlY3QgUElOQ1RSTF9SQUxJTksK
IAogY29uZmlnIFBJTkNUUkxfUlQzODgzCi0gICAgICAgIGJvb2wgIlJUMzg4MyBwaW5jdHJsIGRy
aXZlciBmb3IgUkFMSU5LL01lZGlhdGVrIFNPQ3MiCisgICAgICAgIGJvb2wgIlJUMzg4MyBwaW5j
dHJsIHN1YmRyaXZlciIKICAgICAgICAgZGVwZW5kcyBvbiBSQUxJTksgJiYgU09DX1JUMzg4Mwog
ICAgICAgICBzZWxlY3QgUElOQ1RSTF9SQUxJTksKIAotLSAKMi4yNS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
