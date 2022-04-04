Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4490C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 11:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AcDh53MkW/yNTo+fz8wG202iCE7AHeS3cmzFD7U9kFY=; b=cO7nsNVZUMHTib
	lPIi+x4w/A+Pyat8lixl9vXBlb2VDAKk4YfKhBc+yJXhgP+kOM8gobpt2xeLnorrfgsoj6aeJSK0g
	XS+rypSBP2/NX0hMbzofzdWF7TD7OWefo6hSTpCWvJ5IvKwkJUQxUeY2x1WSN0VF0vCfWhu45S7GN
	Tmgfh3lqTQzQGaqH82tuXXBkIcOQq2ElLBchaHwx3sxC/r9EHRzHz90MwqbfDKUxaGI/7cg1xQkxz
	lbsihTR0N6IzYEBKFGrMz5etOdi/87LWyw1WprVbVIlULpobeaaLlU6QhY+9f1QVh1doViqCQof4Z
	e01reIRxDD+uCJsclyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbLDy-00EmYa-ES; Mon, 04 Apr 2022 11:50:22 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbLDm-00EmUq-Sl; Mon, 04 Apr 2022 11:50:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649072989; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mo9jhXQZ7dDfCf1zx7Yyf+stoyzYLHDat6/ldYvgARU4DTqk8M/fLkTKnk6kk4m8K4dDx/tbE29b02iB/+7WXLZVRt7BlxIAwga5gqJUmEcl1lwZPbYgk21o8TIOcGFeoY3s0Mn3bsubyzEqVQw9r+vjftyvK0Td6cDS0tLLy6k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649072989;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=wH4MR2QRn9EFb2QbwxNQgFaKaRIZbXHNTjFSYpDqoMw=; 
 b=mvN16TYvpnQFqPff72eSPvIC0ozSHO71u54Mb9PCl6qVOfs55jVj68Nkm+weM4gCFg5kXX4T2LXE5+xbCP3qxkh9t/PeTwxTlKpBGcp4N+eK2KpPxvl0tjkMZyjmT97nrv+bq0/D604smZ9Nm/IYVVQB/EPkS7bim5lBRhRP5KI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649072989; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=wH4MR2QRn9EFb2QbwxNQgFaKaRIZbXHNTjFSYpDqoMw=;
 b=IkEd+cky5pBihx3tcwh3yFXJsL52aUpLmKI7SE1Veg6+CXdfer2QOO4OVurIN1cz
 kqH2BKaeeH708amasT03Nq1Lhc31tl7VooNJHHiuYATvSkEcCoDsm/Wsnxxl25FMKqS
 LHIoyRojQWUtUkheDaeSrCqNTo+eHvfAZKOwAWbg=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649072986682935.7989606149916;
 Mon, 4 Apr 2022 04:49:46 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH] net: ethernet: mtk_eth_soc: add label support for GMACs
Date: Mon,  4 Apr 2022 14:40:00 +0300
Message-Id: <20220404114000.3549-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_045011_025447_7ACA5BFE 
X-CRM114-Status: GOOD (  11.24  )
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

RnJvbTogUmVuw6kgdmFuIERvcnN0IDxvcGVuc291cmNlQHZkb3JzdC5jb20+CgpBZGQgbGFiZWwg
c3VwcG9ydCBmb3IgR01BQ3MuIFRoZSBuZXR3b3JrIGludGVyZmFjZSBvZiB0aGUgR01BQyB3aWxs
IGhhdmUKdGhlIHN0cmluZyBvZiB0aGUgbGFiZWwgcHJvcGVydHkgZGVmaW5lZCBvbiB0aGUgZGV2
aWNldHJlZSBhcyBpdHMgbmFtZS4KClNpZ25lZC1vZmYtYnk6IFJlbsOpIHZhbiBEb3JzdCA8b3Bl
bnNvdXJjZUB2ZG9yc3QuY29tPgpbYXJpbmMudW5hbEBhcmluYzkuY29tOiBjaGFuZ2UgY29tbWl0
IGxvZyBhbmQgcmViYXNlIHRvIGN1cnJlbnQgbmV0LW5leHRdClNpZ25lZC1vZmYtYnk6IEFyxLFu
w6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5l
dC9tZWRpYXRlay9tdGtfZXRoX3NvYy5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRr
X2V0aF9zb2MuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19ldGhfc29jLmMK
aW5kZXggZjAyZDA3ZWM1Y2NiLi5hZjJmMDY5MzE4MGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0
L2V0aGVybmV0L21lZGlhdGVrL210a19ldGhfc29jLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuYwpAQCAtMjkxMSw2ICsyOTExLDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBuZXRfZGV2aWNlX29wcyBtdGtfbmV0ZGV2X29wcyA9IHsKIAogc3RhdGljIGlu
dCBtdGtfYWRkX21hYyhzdHJ1Y3QgbXRrX2V0aCAqZXRoLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
KQogeworCWNvbnN0IGNoYXIgKm5hbWUgPSBvZl9nZXRfcHJvcGVydHkobnAsICJsYWJlbCIsIE5V
TEwpOwogCWNvbnN0IF9fYmUzMiAqX2lkID0gb2ZfZ2V0X3Byb3BlcnR5KG5wLCAicmVnIiwgTlVM
TCk7CiAJcGh5X2ludGVyZmFjZV90IHBoeV9tb2RlOwogCXN0cnVjdCBwaHlsaW5rICpwaHlsaW5r
OwpAQCAtMzAzMyw2ICszMDM0LDkgQEAgc3RhdGljIGludCBtdGtfYWRkX21hYyhzdHJ1Y3QgbXRr
X2V0aCAqZXRoLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQogCWVsc2UKIAkJZXRoLT5uZXRkZXZb
aWRdLT5tYXhfbXR1ID0gTVRLX01BWF9SWF9MRU5HVEhfMksgLSBNVEtfUlhfRVRIX0hMRU47CiAK
KwlpZiAobmFtZSkKKwkJc3RybGNweShldGgtPm5ldGRldltpZF0tPm5hbWUsIG5hbWUsIElGTkFN
U0laKTsKKwogCXJldHVybiAwOwogCiBmcmVlX25ldGRldjoKLS0gCjIuMjUuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
