Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820AEC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Apr 2022 20:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qfK2y97P8JVWpaZlXJ1PpFtiv9mo+sPQDuRudg+tzhE=; b=CRwCFRFS+Zd6K5
	nFFB9RH4wDnmXlYK1PhANj25k3Asmjvp6mlW7J8aEQGzebH/ybATIk2UTq+fAVv10lPZYaCKitwrq
	XS/wLG9EbRm7qIxyinOwuXT1/wFSviGjceds1PmUWt5YCVF7d5Y07+SqEIK1q2EQ48a4nqiERNMsx
	EO2uA4F15C7QPgHCfBgUBCCr87ctOnQKLp7fzIlnzHUkv5Ab+fU8pxVmnZ6N0JWehJyfwCTUfDVK6
	1TGTCGJMUZ1i0Ufk/V5Yisv/uXqmttn6GRYhrchzHB1TPJyXno/t9CUsiwclrYRlehLODYZcZi0yE
	xEOvpkFOhRe/hOLSiCBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndeEk-005RZW-El; Sun, 10 Apr 2022 20:32:42 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndeEK-005RN7-Ab; Sun, 10 Apr 2022 20:32:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649622725; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jXdnh4aUEPVVkA6EtiCcN6TSmImKgdp4fMgYb0Rv0FSjx5WTBIjPBcQ4RpG/yQi59H2et8GaGLCBLxn/D+tgbd6iP74HuWdPpO34v3jegKpI4TM3Z/Czv4/NpWaKeyxV+FAaCarXYnYB5J65Osii6CNG9iyWOvk1lVV8u6D4t4s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649622725;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=3Bdr3ICR42EV4+Gp0uVKnzUG3CsEtqwPWuz6oFmIFog=; 
 b=PoySZ3s3FSrXk1zJTDM7EAidnQXtnpk+XRSnLy8YLBm3DjLR3HBwbb9TeZFXV7XtqbRlEP6CmFr7OB5sp4A9XDNo2+vDBQ4QV865v59dTJv9yjLvbp4RQPBIz0kMtpqQ8KTUKZR47ZnRcZ5R0zW7R1HkaiwjuQUEmUW/xCeqbOg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649622725; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=3Bdr3ICR42EV4+Gp0uVKnzUG3CsEtqwPWuz6oFmIFog=;
 b=Q2FD6ild+jvJRxdxl6l7vDoExFiAXBM/GXvduyOuywZX1gC4oWtXnHqo5LX23rhC
 hMJD7Vq6k2DWUjzbkoVLymjV/nEv46PlKWBoOmcgdbPg8NzSSMHH0MNks27LlDw7d6c
 9Vhyjqw8zBDTeqHji+ViPCVB2yeEakx3U0TgJ2co=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649622724346210.97787152203682;
 Sun, 10 Apr 2022 13:32:04 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH 1/3] mips: dts: mt7621: add mdio label to mdio-bus
Date: Sun, 10 Apr 2022 23:31:36 +0300
Message-Id: <20220410203138.22513-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_133216_514045_16E59ADA 
X-CRM114-Status: UNSURE (   9.82  )
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

QWRkIG1kaW8gbGFiZWwgdG8gdGhlIG1kaW8tYnVzIG5vZGUgdG8gZWFzaWx5IHJlZmVyIHRvIGl0
LgoKVXNlIHRoZSBuZXdseSBjcmVhdGVkIGxhYmVsIG9uIHRoZSBHQi1QQzIgZGV2aWNldHJlZS4K
ClNpZ25lZC1vZmYtYnk6IEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KLS0t
CiAuLi4vYm9vdC9kdHMvcmFsaW5rL210NzYyMS1nbnViZWUtZ2ItcGMyLmR0cyAgIHwgMTggKysr
KysrKystLS0tLS0tLS0tCiBhcmNoL21pcHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMS5kdHNpICAg
ICAgICAgIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL21pcHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMS1n
bnViZWUtZ2ItcGMyLmR0cyBiL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLWdudWJl
ZS1nYi1wYzIuZHRzCmluZGV4IGE3ZmNlOGRlNjE0Ny4uYjQyN2FlOWUwODFmIDEwMDY0NAotLS0g
YS9hcmNoL21pcHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMS1nbnViZWUtZ2ItcGMyLmR0cworKysg
Yi9hcmNoL21pcHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMS1nbnViZWUtZ2ItcGMyLmR0cwpAQCAt
OTMsMTcgKzkzLDE1IEBAIGdwaW8tcGlubXV4IHsKIAl9OwogfTsKIAotJmV0aGVybmV0IHsKLQln
bWFjMTogbWFjQDEgewotCQlzdGF0dXMgPSAib2theSI7Ci0JCXBoeS1oYW5kbGUgPSA8JmV0aHBo
eTc+OwotCX07CismZ21hYzEgeworCXN0YXR1cyA9ICJva2F5IjsKKwlwaHktaGFuZGxlID0gPCZl
dGhwaHk3PjsKK307CiAKLQltZGlvLWJ1cyB7Ci0JCWV0aHBoeTc6IGV0aGVybmV0LXBoeUA3IHsK
LQkJCXJlZyA9IDw3PjsKLQkJCXBoeS1tb2RlID0gInJnbWlpLXJ4aWQiOwotCQl9OworJm1kaW8g
eworCWV0aHBoeTc6IGV0aGVybmV0LXBoeUA3IHsKKwkJcmVnID0gPDc+OworCQlwaHktbW9kZSA9
ICJyZ21paS1yeGlkIjsKIAl9OwogfTsKIApkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2Jvb3QvZHRz
L3JhbGluay9tdDc2MjEuZHRzaSBiL2FyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLmR0
c2kKaW5kZXggMzIyMjY4NDkxNWFjLi40MGQwZjI4NDQ2Y2EgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlw
cy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxLmR0c2kKKysrIGIvYXJjaC9taXBzL2Jvb3QvZHRzL3Jh
bGluay9tdDc2MjEuZHRzaQpAQCAtMzQyLDcgKzM0Miw3IEBAIGdtYWMxOiBtYWNAMSB7CiAJCQlw
aHktbW9kZSA9ICJyZ21paS1yeGlkIjsKIAkJfTsKIAotCQltZGlvLWJ1cyB7CisJCW1kaW86IG1k
aW8tYnVzIHsKIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkJI3NpemUtY2VsbHMgPSA8MD47
CiAKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
