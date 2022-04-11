Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC4DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 09:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzmkV7/HsFvniDiGmVQArt/7ooLpeyNkc5Wl5WvWZ5o=; b=H1K2LoNHNpv6DQ
	Vz21bOypreW3CSQQWa0398Qp3xOKV83aIwKkQtg9XE7TtYoyDc/2Ep8pFqM1jIsL/VlCKFZjcp+n4
	siRTSH/Qu+RgvwppHmNHJQpEtmZQCTMyGiWr3mDgTTv3MjKgeBGIwQ3Iln3POEL4+nYGRPsauGOw5
	ZeOqc4WFxxfh/BpUBA45LI6x4BYEuUafAIzyB1C85SBc3CZ0Ja9Endy+Nc64EPvoezCiUaofHjgKC
	X+TrRbD0ZzeK77ZbwZnmZZlZKKz7ruDW9dMpJO+J59h2WQ3QznjsKgf2iqYBAZcTvVGYp3Sz6EOjX
	FOwrkZ/YfIuHmFXewfpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndqe3-0081Ne-DX; Mon, 11 Apr 2022 09:47:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndqco-0080hu-Rf; Mon, 11 Apr 2022 09:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ebIsZQh6bWWdHnFk9H8f8xTDY2EZehgXMp8QevaXF3w=; b=f7om5BwCKQlcRWMRayydqwf5y3
 GqlLR9YdG4qUDrUEdSi/TBW4nKitrc7eYqOU9hs+jvfCyy7H8bjQK9OlQAqcTAOHOiOKETmuZQzMA
 K2a2aS38LGZkiy7QrnfD48yvNFxCfbqM2u7sYyhJLnPcsnGIdA01CtaWx+cyqI/MTAj/EwsyGmf7i
 6LeuRA5SGuTFl4xB40+sBCUr+1Z+4HUq5DGMrW8NIt25w/roci9JT326gKcHHFjJ2IqFu3qXb1x2Z
 6t3Z2n8fFZyutlWhU3cCtCMYK2TJSFB3Hxb4wsmincZuGQw2oLYtb4KdIAR9WFiUuHoGunHOkYE6S
 5JquVQPw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52866 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1ndqck-0000H4-3W; Mon, 11 Apr 2022 10:46:17 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ndqcj-0055RC-6M; Mon, 11 Apr 2022 10:46:17 +0100
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
Subject: [PATCH net-next v2 5/9] net: dsa: mt7530: only indicate linkmodes
 that can be supported
MIME-Version: 1.0
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ndqcj-0055RC-6M@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Apr 2022 10:46:17 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_024622_960875_6FE066F5 
X-CRM114-Status: GOOD (  13.75  )
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

Tm93IHRoYXQgbXQ3NTMwIGlzIG5vdCB1c2luZyB0aGUgYmFzZXggaGVscGVyLCBpdCBiZWNvbWVz
IHVubmVjZXNzYXJ5IHRvCmluZGljYXRlIHN1cHBvcnQgZm9yIGJvdGggMTAwMGJhc2VYIGFuZCAy
NTAwYmFzZVggd2hlbiBvbmUgb2YgdGhlIDgwMy4zegpQSFkgaW50ZXJmYWNlIG1vZGVzIGlzIGJl
aW5nIHNlbGVjdGVkLiBFbnN1cmUgdGhhdCB0aGUgZHJpdmVyIGluZGljYXRlcwpvbmx5IHRob3Nl
IGxpbmttb2RlcyB0aGF0IGNhbiBhY3R1YWxseSBiZSBzdXBwb3J0ZWQgYnkgdGhlIFBIWSBpbnRl
cmZhY2UKbW9kZS4KClRlc3RlZC1ieTogTWFyZWsgQmVow7puIDxrYWJlbEBrZXJuZWwub3JnPgpT
aWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgu
b3JnLnVrPgotLS0KIGRyaXZlcnMvbmV0L2RzYS9tdDc1MzAuYyB8IDEyICsrKysrKysrLS0tLQog
ZHJpdmVycy9uZXQvZHNhL210NzUzMC5oIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZHNhL210
NzUzMC5jIGIvZHJpdmVycy9uZXQvZHNhL210NzUzMC5jCmluZGV4IGRlOWNmZDIwY2NiZi4uZGZl
M2NkNmQ2YjU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMKKysrIGIvZHJp
dmVycy9uZXQvZHNhL210NzUzMC5jCkBAIC0yNTIyLDEyICsyNTIyLDEzIEBAIHN0YXRpYyBpbnQg
bXQ3NTMxX3JnbWlpX3NldHVwKHN0cnVjdCBtdDc1MzBfcHJpdiAqcHJpdiwgdTMyIHBvcnQsCiB9
CiAKIHN0YXRpYyB2b2lkIG10NzUzMV9zZ21paV92YWxpZGF0ZShzdHJ1Y3QgbXQ3NTMwX3ByaXYg
KnByaXYsIGludCBwb3J0LAorCQkJCSAgcGh5X2ludGVyZmFjZV90IGludGVyZmFjZSwKIAkJCQkg
IHVuc2lnbmVkIGxvbmcgKnN1cHBvcnRlZCkKIHsKIAkvKiBQb3J0NSBzdXBwb3J0cyBldGhpZXIg
UkdNSUkgb3IgU0dNSUkuCiAJICogUG9ydDYgc3VwcG9ydHMgU0dNSUkgb25seS4KIAkgKi8KLQlp
ZiAocG9ydCA9PSA2KSB7CisJaWYgKHBvcnQgPT0gNiAmJiBpbnRlcmZhY2UgPT0gUEhZX0lOVEVS
RkFDRV9NT0RFXzI1MDBCQVNFWCkgewogCQlwaHlsaW5rX3NldChzdXBwb3J0ZWQsIDI1MDBiYXNl
WF9GdWxsKTsKIAkJcGh5bGlua19zZXQoc3VwcG9ydGVkLCAyNTAwYmFzZVRfRnVsbCk7CiAJfQpA
QCAtMjkwMiwxNiArMjkwMywxOCBAQCBzdGF0aWMgdm9pZCBtdDc1M3hfcGh5bGlua19nZXRfY2Fw
cyhzdHJ1Y3QgZHNhX3N3aXRjaCAqZHMsIGludCBwb3J0LAogCiBzdGF0aWMgdm9pZAogbXQ3NTMw
X21hY19wb3J0X3ZhbGlkYXRlKHN0cnVjdCBkc2Ffc3dpdGNoICpkcywgaW50IHBvcnQsCisJCQkg
cGh5X2ludGVyZmFjZV90IGludGVyZmFjZSwKIAkJCSB1bnNpZ25lZCBsb25nICpzdXBwb3J0ZWQp
CiB7CiB9CiAKIHN0YXRpYyB2b2lkIG10NzUzMV9tYWNfcG9ydF92YWxpZGF0ZShzdHJ1Y3QgZHNh
X3N3aXRjaCAqZHMsIGludCBwb3J0LAorCQkJCSAgICAgcGh5X2ludGVyZmFjZV90IGludGVyZmFj
ZSwKIAkJCQkgICAgIHVuc2lnbmVkIGxvbmcgKnN1cHBvcnRlZCkKIHsKIAlzdHJ1Y3QgbXQ3NTMw
X3ByaXYgKnByaXYgPSBkcy0+cHJpdjsKIAotCW10NzUzMV9zZ21paV92YWxpZGF0ZShwcml2LCBw
b3J0LCBzdXBwb3J0ZWQpOworCW10NzUzMV9zZ21paV92YWxpZGF0ZShwcml2LCBwb3J0LCBpbnRl
cmZhY2UsIHN1cHBvcnRlZCk7CiB9CiAKIHN0YXRpYyB2b2lkCkBAIC0yOTM0LDEyICsyOTM3LDEz
IEBAIG10NzUzeF9waHlsaW5rX3ZhbGlkYXRlKHN0cnVjdCBkc2Ffc3dpdGNoICpkcywgaW50IHBv
cnQsCiAJfQogCiAJLyogVGhpcyBzd2l0Y2ggb25seSBzdXBwb3J0cyAxRyBmdWxsLWR1cGxleC4g
Ki8KLQlpZiAoc3RhdGUtPmludGVyZmFjZSAhPSBQSFlfSU5URVJGQUNFX01PREVfTUlJKSB7CisJ
aWYgKHN0YXRlLT5pbnRlcmZhY2UgIT0gUEhZX0lOVEVSRkFDRV9NT0RFX01JSSAmJgorCSAgICBz
dGF0ZS0+aW50ZXJmYWNlICE9IFBIWV9JTlRFUkZBQ0VfTU9ERV8yNTAwQkFTRVgpIHsKIAkJcGh5
bGlua19zZXQobWFzaywgMTAwMGJhc2VUX0Z1bGwpOwogCQlwaHlsaW5rX3NldChtYXNrLCAxMDAw
YmFzZVhfRnVsbCk7CiAJfQogCi0JcHJpdi0+aW5mby0+bWFjX3BvcnRfdmFsaWRhdGUoZHMsIHBv
cnQsIG1hc2spOworCXByaXYtPmluZm8tPm1hY19wb3J0X3ZhbGlkYXRlKGRzLCBwb3J0LCBzdGF0
ZS0+aW50ZXJmYWNlLCBtYXNrKTsKIAogCXBoeWxpbmtfc2V0KG1hc2ssIFBhdXNlKTsKIAlwaHls
aW5rX3NldChtYXNrLCBBc3ltX1BhdXNlKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2RzYS9t
dDc1MzAuaCBiL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAuaAppbmRleCBjYmViYmNjNzY1MDkuLjcz
Y2ZkMjlmYmIxNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZHNhL210NzUzMC5oCisrKyBiL2Ry
aXZlcnMvbmV0L2RzYS9tdDc1MzAuaApAQCAtNzcyLDYgKzc3Miw3IEBAIHN0cnVjdCBtdDc1M3hf
aW5mbyB7CiAJdm9pZCAoKm1hY19wb3J0X2dldF9jYXBzKShzdHJ1Y3QgZHNhX3N3aXRjaCAqZHMs
IGludCBwb3J0LAogCQkJCSAgc3RydWN0IHBoeWxpbmtfY29uZmlnICpjb25maWcpOwogCXZvaWQg
KCptYWNfcG9ydF92YWxpZGF0ZSkoc3RydWN0IGRzYV9zd2l0Y2ggKmRzLCBpbnQgcG9ydCwKKwkJ
CQkgIHBoeV9pbnRlcmZhY2VfdCBpbnRlcmZhY2UsCiAJCQkJICB1bnNpZ25lZCBsb25nICpzdXBw
b3J0ZWQpOwogCWludCAoKm1hY19wb3J0X2dldF9zdGF0ZSkoc3RydWN0IGRzYV9zd2l0Y2ggKmRz
LCBpbnQgcG9ydCwKIAkJCQkgIHN0cnVjdCBwaHlsaW5rX2xpbmtfc3RhdGUgKnN0YXRlKTsKLS0g
CjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
