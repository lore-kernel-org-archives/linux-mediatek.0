Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE70AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 09:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ZTL0PGufy93gvu9OyJXvlqsUKPOhW/2f6VLF4sV2uU=; b=wR8QbPjSqCtlzQ
	dATtq5WDNgCQ9EW0MeiQjJFqBX4Mw7fo4G7HslVfTs/bgXRJnvbaucNFI7/ZMuHXvs8hXABmHiAw5
	iTjP4jYtcNEyb5hMEV49Gef6lvqzS70at4o4FrQjZOXKcDQae2jafD3H6a40/8gRLRF0DIlaT6jrn
	YxcAHrLGt0RvvKHUw8F2SOowbuQNL20rXjyRLoHy8bYMJFSybfGJiWH7mFyBhmZ6b1HoZjL3I9N1r
	tcGvPLUDAUvxb4ArqgKE5GtnlGHdKiFcxkdf53+tYwlezotvLoTh9TU5fD1PLT2oGcSS48dnxrn/R
	rELCK0vRzm4qmdCwqEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndqi8-0083Zc-P3; Mon, 11 Apr 2022 09:51:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndqd8-0080so-Tw; Mon, 11 Apr 2022 09:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a5XqWTROzrEsa9kYVWtuOFOR0rQwTes8cbVz40O+e10=; b=lp5iJFMU5l8bn2mAu9mWVEtDq2
 qRZhhTFXZxhy6CZEOU5RDTBuduDXg3Gl+y1KwBE/CC3efwN8nUPY1ZidavU1eXnCRHCU1BJNPLtDy
 V3CO3045UpyHSPbyUGZ+pvs8iUvc2r6Tpq3CzcyZh4gB34M5n2Qp3/QYVHpuH8VbbY6ZxhVLyFWI9
 dbwjD/LACaxe0KkGk6d/3Kt+WDEPZ80hoWyTLGH6/kJAKlA0itNu/45Zcql78ZPNGnEoTdceC9FEo
 RklE/wbH9z5Ore9Bf8F/iFKnBwORFPxvSkPqc+yiTf1SXWAP0yfqqQ6UVUEU6AuC0Dft2XCoedGYM
 i1uaJfgQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52874 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1ndqd4-0000Hy-Gq; Mon, 11 Apr 2022 10:46:38 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ndqd3-0055Ra-Kr; Mon, 11 Apr 2022 10:46:37 +0100
In-Reply-To: <YlP4vGKVrlIJUUHK@shell.armlinux.org.uk>
References: <YlP4vGKVrlIJUUHK@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 9/9] net: dsa: mt7530: mark as non-legacy
MIME-Version: 1.0
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ndqd3-0055Ra-Kr@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Apr 2022 10:46:37 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_024643_031634_A233AF0E 
X-CRM114-Status: GOOD (  11.70  )
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

VGhlIG10NzUzMCBkcml2ZXIgZG9lcyBub3QgbWFrZSB1c2Ugb2YgdGhlIHNwZWVkLCBkdXBsZXgs
IHBhdXNlIG9yCmFkdmVydGlzZW1lbnQgaW4gaXRzIHBoeWxpbmtfbWFjX2NvbmZpZygpIGltcGxl
bWVudGF0aW9uLCBzbyBpdCBjYW4gYmUKbWFya2VkIGFzIGEgbm9uLWxlZ2FjeSBkcml2ZXIuCgpU
ZXN0ZWQtYnk6IE1hcmVrIEJlaMO6biA8a2FiZWxAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTog
UnVzc2VsbCBLaW5nIChPcmFjbGUpIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KLS0tCiBk
cml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAuYyBiL2RyaXZl
cnMvbmV0L2RzYS9tdDc1MzAuYwppbmRleCAwZWUyY2I3ZTU2NjQuLmM0ZWE3M2Q5OTZlOCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9uZXQvZHNhL210NzUzMC5jCisrKyBiL2RyaXZlcnMvbmV0L2RzYS9t
dDc1MzAuYwpAQCAtMjg5Nyw2ICsyODk3LDEyIEBAIHN0YXRpYyB2b2lkIG10NzUzeF9waHlsaW5r
X2dldF9jYXBzKHN0cnVjdCBkc2Ffc3dpdGNoICpkcywgaW50IHBvcnQsCiAJY29uZmlnLT5tYWNf
Y2FwYWJpbGl0aWVzID0gTUFDX0FTWU1fUEFVU0UgfCBNQUNfU1lNX1BBVVNFIHwKIAkJCQkgICBN
QUNfMTAgfCBNQUNfMTAwIHwgTUFDXzEwMDBGRDsKIAorCS8qIFRoaXMgZHJpdmVyIGRvZXMgbm90
IG1ha2UgdXNlIG9mIHRoZSBzcGVlZCwgZHVwbGV4LCBwYXVzZSBvciB0aGUKKwkgKiBhZHZlcnRp
c2VtZW50IGluIGl0cyBtYWNfY29uZmlnLCBzbyBpdCBpcyBzYWZlIHRvIG1hcmsgdGhpcyBkcml2
ZXIKKwkgKiBhcyBub24tbGVnYWN5LgorCSAqLworCWNvbmZpZy0+bGVnYWN5X3ByZV9tYXJjaDIw
MjAgPSBmYWxzZTsKKwogCXByaXYtPmluZm8tPm1hY19wb3J0X2dldF9jYXBzKGRzLCBwb3J0LCBj
b25maWcpOwogfQogCi0tIAoyLjMwLjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
