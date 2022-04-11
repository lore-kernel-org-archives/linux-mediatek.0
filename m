Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA380C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 09:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKNvnSQ7SK5klCjxe1rFgfhwq9KVIsD1DTOkjFKRVXs=; b=E6fBACWnFcuupA
	nlXBgvcxVgzPsuiuC4WVGsPBErfNbsNVm1rIIR6+N+TrFbWa8rrlIywwyPzrjo7B4IHrGkmQuCRqU
	+5FLsPNX7WQ/aA8+ERJM/yzhk83H8+Yb9WWaWsWkJ6IqdcC3ncp6y62gwYjpI+MoGlrKOegAoOuxm
	fSwVPF6haOeFXkYcLYE/ZeiETVNuWSb09lkP48NpLZE61bTXdFYPcJaDmSh/P0ZU4SdXvj+eSoqq8
	bfWRj4E0c5nl69dNpdE+MPlwi6RZUAhNcmh54iny9c/1GqH551v9CO1H5Z3ynfSebTBr8n1UyoKS9
	1pIluVovrnHg5TUVFKtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndqhK-0083E0-1l; Mon, 11 Apr 2022 09:51:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndqd3-0080pg-Hn; Mon, 11 Apr 2022 09:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z3rwZCCM0LZHsBKwzS3UKuH2CbTPGJIJtGg/wOkxfVg=; b=PThn6RVRkxXvFDmwfY1Nn9FH60
 TuKNTsJlNoxA/nG6p84qCSsdkORe5RmV1SSNqv5FjqX1wvTpieHBMaqDBxIfMnlNSWny60D4KhxXr
 y3dbI6Thv+8RXGqJMgfc4ME4PAMSjgyuNMKhKcYQ9tQJ7unfhqGVmON6MWCw5PmwXoY9YzxHKknll
 Ac3gveRJKA+ngM7822XH/8SIX0W0zp0jkMIjO1VQYfn2cgr2eBkG/S7gpENYtfexzRxlfwlhZDl0f
 AZcnd+NF+V0P9cfk4uygYAuKrxNQLhjTlVLhwdXa2wPs1wbOdF6bZmLmLz4vEfP9Uh2NYR8ZUAKpj
 mhc2l2nA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52872 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1ndqcz-0000Hk-Da; Mon, 11 Apr 2022 10:46:33 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ndqcy-0055RU-HE; Mon, 11 Apr 2022 10:46:32 +0100
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
Subject: [PATCH net-next v2 8/9] net: dsa: mt7530: move autoneg handling to
 PCS validation
MIME-Version: 1.0
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ndqcy-0055RU-HE@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Apr 2022 10:46:32 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_024637_637538_536FDB3F 
X-CRM114-Status: GOOD (  14.30  )
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

TW92ZSB0aGUgYXV0b25lZyBiaXQgaGFuZGxpbmcgdG8gdGhlIFBDUyB2YWxpZGF0aW9uLCB3aGlj
aCBhbGxvd3MgdXMgdG8KZ2V0IHJpZCBvZiBtdDc1M3hfcGh5bGlua192YWxpZGF0ZSgpIGFuZCBy
ZWx5IG9uIHRoZSBkZWZhdWx0CnBoeWxpbmtfZ2VuZXJpY192YWxpZGF0ZSgpIGltcGxlbWVudGF0
aW9uIGZvciB0aGUgTUFDIHNpZGUuCgpUZXN0ZWQtYnk6IE1hcmVrIEJlaMO6biA8a2FiZWxAa2Vy
bmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIChPcmFjbGUpIDxybWsra2VybmVs
QGFybWxpbnV4Lm9yZy51az4KLS0tCiBkcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMgfCAyOCArKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZHNhL210NzUzMC5j
IGIvZHJpdmVycy9uZXQvZHNhL210NzUzMC5jCmluZGV4IDFjMGQ5MzE5NzNlNS4uMGVlMmNiN2U1
NjY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMKKysrIGIvZHJpdmVycy9u
ZXQvZHNhL210NzUzMC5jCkBAIC0yOTAwLDI1ICsyOTAwLDE2IEBAIHN0YXRpYyB2b2lkIG10NzUz
eF9waHlsaW5rX2dldF9jYXBzKHN0cnVjdCBkc2Ffc3dpdGNoICpkcywgaW50IHBvcnQsCiAJcHJp
di0+aW5mby0+bWFjX3BvcnRfZ2V0X2NhcHMoZHMsIHBvcnQsIGNvbmZpZyk7CiB9CiAKLXN0YXRp
YyB2b2lkCi1tdDc1M3hfcGh5bGlua192YWxpZGF0ZShzdHJ1Y3QgZHNhX3N3aXRjaCAqZHMsIGlu
dCBwb3J0LAotCQkJdW5zaWduZWQgbG9uZyAqc3VwcG9ydGVkLAotCQkJc3RydWN0IHBoeWxpbmtf
bGlua19zdGF0ZSAqc3RhdGUpCitzdGF0aWMgaW50IG10NzUzeF9wY3NfdmFsaWRhdGUoc3RydWN0
IHBoeWxpbmtfcGNzICpwY3MsCisJCQkgICAgICAgdW5zaWduZWQgbG9uZyAqc3VwcG9ydGVkLAor
CQkJICAgICAgIGNvbnN0IHN0cnVjdCBwaHlsaW5rX2xpbmtfc3RhdGUgKnN0YXRlKQogewotCV9f
RVRIVE9PTF9ERUNMQVJFX0xJTktfTU9ERV9NQVNLKG1hc2spID0geyAwLCB9OwotCXUzMiBjYXBz
OwotCi0JY2FwcyA9IGRzYV90b19wb3J0KGRzLCBwb3J0KS0+cGxfY29uZmlnLm1hY19jYXBhYmls
aXRpZXM7Ci0KLQlwaHlsaW5rX3NldF9wb3J0X21vZGVzKG1hc2spOwotCXBoeWxpbmtfZ2V0X2xp
bmttb2RlcyhtYXNrLCBzdGF0ZS0+aW50ZXJmYWNlLCBjYXBzKTsKKwkvKiBBdXRvbmVnb3RpYXRp
b24gaXMgbm90IHN1cHBvcnRlZCBpbiBUUkdNSUkgbm9yIDgwMi4zeiBtb2RlcyAqLworCWlmIChz
dGF0ZS0+aW50ZXJmYWNlID09IFBIWV9JTlRFUkZBQ0VfTU9ERV9UUkdNSUkgfHwKKwkgICAgcGh5
X2ludGVyZmFjZV9tb2RlX2lzXzgwMjN6KHN0YXRlLT5pbnRlcmZhY2UpKQorCQlwaHlsaW5rX2Ns
ZWFyKHN1cHBvcnRlZCwgQXV0b25lZyk7CiAKLQlpZiAoc3RhdGUtPmludGVyZmFjZSAhPSBQSFlf
SU5URVJGQUNFX01PREVfVFJHTUlJICYmCi0JICAgICFwaHlfaW50ZXJmYWNlX21vZGVfaXNfODAy
M3ooc3RhdGUtPmludGVyZmFjZSkpCi0JCXBoeWxpbmtfc2V0KG1hc2ssIEF1dG9uZWcpOwotCi0J
bGlua21vZGVfYW5kKHN1cHBvcnRlZCwgc3VwcG9ydGVkLCBtYXNrKTsKLQlsaW5rbW9kZV9hbmQo
c3RhdGUtPmFkdmVydGlzaW5nLCBzdGF0ZS0+YWR2ZXJ0aXNpbmcsIG1hc2spOworCXJldHVybiAw
OwogfQogCiBzdGF0aWMgdm9pZCBtdDc1MzBfcGNzX2dldF9zdGF0ZShzdHJ1Y3QgcGh5bGlua19w
Y3MgKnBjcywKQEAgLTMwMjAsMTIgKzMwMTEsMTQgQEAgc3RhdGljIHZvaWQgbXQ3NTMwX3Bjc19h
bl9yZXN0YXJ0KHN0cnVjdCBwaHlsaW5rX3BjcyAqcGNzKQogfQogCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHBoeWxpbmtfcGNzX29wcyBtdDc1MzBfcGNzX29wcyA9IHsKKwkucGNzX3ZhbGlkYXRlID0g
bXQ3NTN4X3Bjc192YWxpZGF0ZSwKIAkucGNzX2dldF9zdGF0ZSA9IG10NzUzMF9wY3NfZ2V0X3N0
YXRlLAogCS5wY3NfY29uZmlnID0gbXQ3NTN4X3Bjc19jb25maWcsCiAJLnBjc19hbl9yZXN0YXJ0
ID0gbXQ3NTMwX3Bjc19hbl9yZXN0YXJ0LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBwaHls
aW5rX3Bjc19vcHMgbXQ3NTMxX3Bjc19vcHMgPSB7CisJLnBjc192YWxpZGF0ZSA9IG10NzUzeF9w
Y3NfdmFsaWRhdGUsCiAJLnBjc19nZXRfc3RhdGUgPSBtdDc1MzFfcGNzX2dldF9zdGF0ZSwKIAku
cGNzX2NvbmZpZyA9IG10NzUzeF9wY3NfY29uZmlnLAogCS5wY3NfYW5fcmVzdGFydCA9IG10NzUz
MV9wY3NfYW5fcmVzdGFydCwKQEAgLTMxMTcsNyArMzExMCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZHNhX3N3aXRjaF9vcHMgbXQ3NTMwX3N3aXRjaF9vcHMgPSB7CiAJLnBvcnRfbWlycm9yX2Fk
ZAk9IG10NzUzeF9wb3J0X21pcnJvcl9hZGQsCiAJLnBvcnRfbWlycm9yX2RlbAk9IG10NzUzeF9w
b3J0X21pcnJvcl9kZWwsCiAJLnBoeWxpbmtfZ2V0X2NhcHMJPSBtdDc1M3hfcGh5bGlua19nZXRf
Y2FwcywKLQkucGh5bGlua192YWxpZGF0ZQk9IG10NzUzeF9waHlsaW5rX3ZhbGlkYXRlLAogCS5w
aHlsaW5rX21hY19zZWxlY3RfcGNzCT0gbXQ3NTN4X3BoeWxpbmtfbWFjX3NlbGVjdF9wY3MsCiAJ
LnBoeWxpbmtfbWFjX2NvbmZpZwk9IG10NzUzeF9waHlsaW5rX21hY19jb25maWcsCiAJLnBoeWxp
bmtfbWFjX2xpbmtfZG93bgk9IG10NzUzeF9waHlsaW5rX21hY19saW5rX2Rvd24sCi0tIAoyLjMw
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
