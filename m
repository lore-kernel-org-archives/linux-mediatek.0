Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F4BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 09:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6JzhFQv3ammf4bZey3vUhmQDCV3TV6YraTO+LOHzAY=; b=E+4PIuMpjUhh6G
	914L2WMIgt1vs2LxjQvxgfDvN56XsBgRu9yA60FNjpWDEFj2S9s4UjeL4zU86S/hmqNCBulpXJf8u
	4Eku+pXjyrl17bP1MjySjMxPmqecEv8XHWEdcAvviC6/+9PViI5D+rQVN9JPHrRAgO6C1HlG5ibwb
	8cFJKwU1sYSIRpFNqABMWSPhJDlLHGiDSKogXPoGNfdnEBsCybPJCT959d0/xFoVjH+mqlbMf6P/N
	o6FkAXsthhwlKkjkkp3FyiK7R7P1V+bElmgbovTdNn20RP1VhJnKBjym3p4hDISjz3gIhCFpOM9G9
	CUJCeRlvbizZxF64JVSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndqif-0083xH-14; Mon, 11 Apr 2022 09:52:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndqeS-0080Wg-Rv; Mon, 11 Apr 2022 09:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+mgZjavIGa1UXRhETom46Yf5c2lj00ZXmfX/KHMAcg4=; b=RsO7HFRDfRtAyr7SeCRyxRTa7u
 VUyZKaR4vBw1XZphqr0Qzj/wRbk99wzCzeKKDLC/UQoj1PgKD6MAFg/hxyG5etqA7H1iVWjbVtehV
 GvAltHbjasmFz5d5zDFLftT2TB4R2TRZmh7jvhHoW/bhD7A7gK8N3ayq3D4so8oU3dy/KUlxWZNND
 6AmYIO4Gpu/uZJr1yJIHwPY6lBvVrdrc8/hiphC6eOFtI1SDkCCZJlQZcpU+aO+8mLfXPFlpwm680
 Y+nKQczjyIV5VWa2psS2h+nMaej41KbMni8XEhmB0yBvO6thehQ1/3EYwjhmmJaNv+4KXP7Aa3cvp
 TQd+8/zQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52850 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1ndqcP-0000GA-KN; Mon, 11 Apr 2022 10:45:57 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ndqcO-0055Qd-Nq; Mon, 11 Apr 2022 10:45:56 +0100
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
Subject: [PATCH net-next v2 1/9] net: dsa: mt7530: 1G can also support
 1000BASE-X link mode
MIME-Version: 1.0
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ndqcO-0055Qd-Nq@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Apr 2022 10:45:56 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_024804_946960_898CAFC0 
X-CRM114-Status: GOOD (  12.56  )
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

V2hlbiB1c2luZyBhbiBleHRlcm5hbCBQSFkgY29ubmVjdGVkIHVzaW5nIFJHTUlJIHRvIG10NzUz
MSBwb3J0IDUsIHRoZQpQSFkgY2FuIGJlIHVzZWQgdG8gdXNlZCBzdXBwb3J0IDEwMDBCQVNFLVgg
Y29ubmVjdGlvbnMuIE1vcmVvdmVyLCBpZgoxMDAwQkFTRS1UIGlzIHN1cHBvcnRlZCwgdGhlbiB3
ZSBzaG91bGQgYWxsb3cgMTAwMEJBU0UtWCBhcyB3ZWxsLCBzaW5jZQp3aGljaCBhcmUgc3VwcG9y
dGVkIGlzIGEgcHJvcGVydHkgb2YgdGhlIFBIWS4KClRoZXJlZm9yZSwgaXQgbWFrZXMgbm8gc2Vu
c2UgdG8gZXhjbHVkZSB0aGlzIGZyb20gdGhlIGxpbmttb2RlcyB3aGVuCjEwMDBCQVNFLVQgaXMg
c3VwcG9ydGVkLgoKRml4ZXM6IGMyODg1NzVmNzgxMCAoIm5ldDogZHNhOiBtdDc1MzA6IEFkZCB0
aGUgc3VwcG9ydCBvZiBNVDc1MzEgc3dpdGNoIikKVGVzdGVkLWJ5OiBNYXJlayBCZWjDum4gPGth
YmVsQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1r
K2tlcm5lbEBhcm1saW51eC5vcmcudWs+Ci0tLQogZHJpdmVycy9uZXQvZHNhL210NzUzMC5jIHwg
MTQgKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEwIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAuYyBiL2RyaXZl
cnMvbmV0L2RzYS9tdDc1MzAuYwppbmRleCAxOWYwMDM1ZDQ0MTAuLjg1NDg1OWU4Y2I3NSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9uZXQvZHNhL210NzUzMC5jCisrKyBiL2RyaXZlcnMvbmV0L2RzYS9t
dDc1MzAuYwpAQCAtMjUzOSwxMyArMjUzOSw3IEBAIHN0YXRpYyB2b2lkIG10NzUzMV9zZ21paV92
YWxpZGF0ZShzdHJ1Y3QgbXQ3NTMwX3ByaXYgKnByaXYsIGludCBwb3J0LAogCS8qIFBvcnQ1IHN1
cHBvcnRzIGV0aGllciBSR01JSSBvciBTR01JSS4KIAkgKiBQb3J0NiBzdXBwb3J0cyBTR01JSSBv
bmx5LgogCSAqLwotCXN3aXRjaCAocG9ydCkgewotCWNhc2UgNToKLQkJaWYgKG10NzUzMV9pc19y
Z21paV9wb3J0KHByaXYsIHBvcnQpKQotCQkJYnJlYWs7Ci0JCWZhbGx0aHJvdWdoOwotCWNhc2Ug
NjoKLQkJcGh5bGlua19zZXQoc3VwcG9ydGVkLCAxMDAwYmFzZVhfRnVsbCk7CisJaWYgKHBvcnQg
PT0gNikgewogCQlwaHlsaW5rX3NldChzdXBwb3J0ZWQsIDI1MDBiYXNlWF9GdWxsKTsKIAkJcGh5
bGlua19zZXQoc3VwcG9ydGVkLCAyNTAwYmFzZVRfRnVsbCk7CiAJfQpAQCAtMjkxMyw4ICsyOTA3
LDYgQEAgc3RhdGljIHZvaWQKIG10NzUzMF9tYWNfcG9ydF92YWxpZGF0ZShzdHJ1Y3QgZHNhX3N3
aXRjaCAqZHMsIGludCBwb3J0LAogCQkJIHVuc2lnbmVkIGxvbmcgKnN1cHBvcnRlZCkKIHsKLQlp
ZiAocG9ydCA9PSA1KQotCQlwaHlsaW5rX3NldChzdXBwb3J0ZWQsIDEwMDBiYXNlWF9GdWxsKTsK
IH0KIAogc3RhdGljIHZvaWQgbXQ3NTMxX21hY19wb3J0X3ZhbGlkYXRlKHN0cnVjdCBkc2Ffc3dp
dGNoICpkcywgaW50IHBvcnQsCkBAIC0yOTUxLDggKzI5NDMsMTAgQEAgbXQ3NTN4X3BoeWxpbmtf
dmFsaWRhdGUoc3RydWN0IGRzYV9zd2l0Y2ggKmRzLCBpbnQgcG9ydCwKIAl9CiAKIAkvKiBUaGlz
IHN3aXRjaCBvbmx5IHN1cHBvcnRzIDFHIGZ1bGwtZHVwbGV4LiAqLwotCWlmIChzdGF0ZS0+aW50
ZXJmYWNlICE9IFBIWV9JTlRFUkZBQ0VfTU9ERV9NSUkpCisJaWYgKHN0YXRlLT5pbnRlcmZhY2Ug
IT0gUEhZX0lOVEVSRkFDRV9NT0RFX01JSSkgewogCQlwaHlsaW5rX3NldChtYXNrLCAxMDAwYmFz
ZVRfRnVsbCk7CisJCXBoeWxpbmtfc2V0KG1hc2ssIDEwMDBiYXNlWF9GdWxsKTsKKwl9CiAKIAlw
cml2LT5pbmZvLT5tYWNfcG9ydF92YWxpZGF0ZShkcywgcG9ydCwgbWFzayk7CiAKLS0gCjIuMzAu
MgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
