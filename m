Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C971C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 22:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3QxA2ECJJK9wyrWeSweWzuzriuRotereIjxZOactZM=; b=pNsUSvCQsGuAew
	IFX0aMs9LQ590Qa4J43BOubdwquIlv5L4RirEZI71CeEuQR4jqNm6ZJHduaksxHG2xGa44UJbL0fS
	tAB8jC6QgS8vDzzUS3SdV/owmpR0Hem+tZJtjvupGdxkyQC5CIxzpQJKFmFaTF9yh2bXxVG+6hnp+
	aWX2JjUUPAbkdRoh4kDrv5pGO3vBEU/QWbFdDtozy7EToezwXzyXloagOEiiCwNjHM1qXOFijBErw
	n0F9+v9OqhoMduYnmGks6vV5i4V7bpbjp13LYbOdU9RK2njRo7B/DZMijHL5iMAx59gShucN+qfQm
	NrXwI7DzSMa/orCqI3hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwADw-00Cpag-1h; Tue, 31 May 2022 22:20:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwADb-00CpWH-G7; Tue, 31 May 2022 22:20:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nfraprado)
	with ESMTPSA id 90A671F43F1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654035601;
	bh=dqvPbD0+LyE8BrCyvcj4tkNdD3HuNjmZ6QAi2jlf4lY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KUux18MMXlb51shdebtxX+3nedmXE19+HQ65ny3FB5b7mvKStmQbMrQrhnRE6giNC
	 /EMiebD2qDDTbz1uEfP9PCMOJXrSyMrTSIAEJT7i/paBPNcZRTtQxKlPl8G8FjsNAb
	 ytuWmbomZTbqlPaqDBdFow89+M6nIrqE1cRPhnftfQ6jWYO7Ch9jue4Gu1P57Y9091
	 8TLKZ6Ph4C3kZw/UDE2Sc/StNoAY+0oCu/YiiqK4BFgWZyvAX1ETJ8+YV9OBkksNFz
	 kZx8duSUqP7ZGjSPdSrocuIGABHGsAwWktMdgZG7Pxyl+ElW8UKdsASUU6scbTxBxF
	 gXyofvy9WtO6g==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: mt8192: Switch drive-strength-adv for -microamp
Date: Tue, 31 May 2022 18:19:53 -0400
Message-Id: <20220531221954.160036-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531221954.160036-1-nfraprado@collabora.com>
References: <20220531221954.160036-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_152003_797729_108E566E 
X-CRM114-Status: GOOD (  13.99  )
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

Q29tbWl0IGU1ZmFiYmU0M2YzZiAoInBpbmN0cmw6IG1lZGlhdGVrOiBwYXJpczogU3VwcG9ydCBn
ZW5lcmljClBJTl9DT05GSUdfRFJJVkVfU1RSRU5HVEhfVUEiKSBhZGRlZCBzdXBwb3J0IGZvciB1
c2luZwpkcml2ZS1zdHJlbmd0aC1taWNyb2FtcCBpbnN0ZWFkIG9mIG1lZGlhdGVrLGRyaXZlLXN0
cmVuZ3RoLWFkdi4KClNpbmNlIHRoZXJlIGFyZW4ndCBhbnkgdXNlcnMgb2YgbWVkaWF0ZWssZHJp
dmUtc3RyZW5ndGgtYWR2IG9uIG10ODE5Mgp5ZXQsIHJlbW92ZSB0aGlzIHByb3BlcnR5IGFuZCBh
ZGQgZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAgaW4gaXRzIHBsYWNlLAp3aGljaCBoYXMgYSBjbGVh
cmVyIG1lYW5pbmcuCgpXaGlsZSBhdCBpdCwgYWRkIGEgbmV3ICdpZicgYmxvY2sgdG8gdmFsaWRh
dGUgdGhhdCBkcml2ZS1zdHJlbmd0aCBhbmQKZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAgYXJlbid0
IHVzZWQgdG9nZXRoZXIsIHNpbmNlIHRoZXkncmUgbXV0dWFsbHkKZXhjbHVzaXZlLgoKU2lnbmVk
LW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29t
PgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9jY2hpbm8uZGVscmVnbm9AY29s
bGFib3JhLmNvbT4KCi0tLQoKQ2hhbmdlcyBpbiB2MjoKLSBBZGRlZCAnaWYnIGJsb2NrIHRvIG1h
a2UgZHJpdmUtc3RyZW5ndGggYW5kIGRyaXZlLXN0cmVuZ3RoLW1pY3JvYW1wCiAgbXV0dWFsbHkg
ZXhjbHVzaXZlCi0gQ2hhbmdlZCBjb21taXQgdGl0bGUgdG8gYmUgbW9yZSBwcmVjaXNlCi0gRHJv
cHBlZCBGaXhlcyB0YWcKCiAuLi4vYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5Mi55YW1s
ICAgICAgfCAzNSArKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwKaW5kZXgg
YzkwYTEzMmZiYzc5Li5jODA5MmIyMThmMmYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIueWFtbApA
QCAtODAsMzEgKzgwLDggQEAgcGF0dGVyblByb3BlcnRpZXM6CiAgICAgICAgICAgICAgIGR0LWJp
bmRpbmdzL3BpbmN0cmwvbXQ2NXh4LmguIEl0IGNhbiBvbmx5IHN1cHBvcnQgMi80LzYvOC8xMC8x
Mi8xNC8xNm1BIGluIG10ODE5Mi4KICAgICAgICAgICAgIGVudW06IFsyLCA0LCA2LCA4LCAxMCwg
MTIsIDE0LCAxNl0KIAotICAgICAgICAgIG1lZGlhdGVrLGRyaXZlLXN0cmVuZ3RoLWFkdjoKLSAg
ICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Ci0gICAgICAgICAgICAgIERlc2NyaWJlIHRoZSBzcGVj
aWZpYyBkcml2aW5nIHNldHVwIHByb3BlcnR5LgotICAgICAgICAgICAgICBGb3IgSTJDIHBpbnMs
IHRoZSBleGlzdGluZyBnZW5lcmljIGRyaXZpbmcgc2V0dXAgY2FuIG9ubHkgc3VwcG9ydAotICAg
ICAgICAgICAgICAyLzQvNi84LzEwLzEyLzE0LzE2bUEgZHJpdmluZy4gQnV0IGluIHNwZWNpZmlj
IGRyaXZpbmcgc2V0dXAsIHRoZXkKLSAgICAgICAgICAgICAgY2FuIHN1cHBvcnQgMC4xMjUvMC4y
NS8wLjUvMW1BIGFkanVzdG1lbnQuIElmIHdlIGVuYWJsZSBzcGVjaWZpYwotICAgICAgICAgICAg
ICBkcml2aW5nIHNldHVwLCB0aGUgZXhpc3RpbmcgZ2VuZXJpYyBzZXR1cCB3aWxsIGJlIGRpc2Fi
bGVkLgotICAgICAgICAgICAgICBUaGUgc3BlY2lmaWMgZHJpdmluZyBzZXR1cCBpcyBjb250cm9s
bGVkIGJ5IEUxRTBFTi4KLSAgICAgICAgICAgICAgV2hlbiBFMT0wL0UwPTAsIHRoZSBzdHJlbmd0
aCBpcyAwLjEyNW1BLgotICAgICAgICAgICAgICBXaGVuIEUxPTAvRTA9MSwgdGhlIHN0cmVuZ3Ro
IGlzIDAuMjVtQS4KLSAgICAgICAgICAgICAgV2hlbiBFMT0xL0UwPTAsIHRoZSBzdHJlbmd0aCBp
cyAwLjVtQS4KLSAgICAgICAgICAgICAgV2hlbiBFMT0xL0UwPTEsIHRoZSBzdHJlbmd0aCBpcyAx
bUEuCi0gICAgICAgICAgICAgIEVOIGlzIHVzZWQgdG8gZW5hYmxlIG9yIGRpc2FibGUgdGhlIHNw
ZWNpZmljIGRyaXZpbmcgc2V0dXAuCi0gICAgICAgICAgICAgIFZhbGlkIGFyZ3VtZW50cyBhcmUg
ZGVzY3JpYmVkIGFzIGJlbG93OgotICAgICAgICAgICAgICAwOiAoRTEsIEUwLCBFTikgPSAoMCwg
MCwgMCkKLSAgICAgICAgICAgICAgMTogKEUxLCBFMCwgRU4pID0gKDAsIDAsIDEpCi0gICAgICAg
ICAgICAgIDI6IChFMSwgRTAsIEVOKSA9ICgwLCAxLCAwKQotICAgICAgICAgICAgICAzOiAoRTEs
IEUwLCBFTikgPSAoMCwgMSwgMSkKLSAgICAgICAgICAgICAgNDogKEUxLCBFMCwgRU4pID0gKDEs
IDAsIDApCi0gICAgICAgICAgICAgIDU6IChFMSwgRTAsIEVOKSA9ICgxLCAwLCAxKQotICAgICAg
ICAgICAgICA2OiAoRTEsIEUwLCBFTikgPSAoMSwgMSwgMCkKLSAgICAgICAgICAgICAgNzogKEUx
LCBFMCwgRU4pID0gKDEsIDEsIDEpCi0gICAgICAgICAgICAgIFNvIHRoZSB2YWxpZCBhcmd1bWVu
dHMgYXJlIGZyb20gMCB0byA3LgotICAgICAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvdWludDMyCi0gICAgICAgICAgICBlbnVtOiBbMCwgMSwgMiwgMywgNCwg
NSwgNiwgN10KKyAgICAgICAgICBkcml2ZS1zdHJlbmd0aC1taWNyb2FtcDoKKyAgICAgICAgICAg
IGVudW06IFsxMjUsIDI1MCwgNTAwLCAxMDAwXQogCiAgICAgICAgICAgbWVkaWF0ZWsscHVsbC11
cC1hZHY6CiAgICAgICAgICAgICBkZXNjcmlwdGlvbjogfApAQCAtMTM4LDYgKzExNSwxNCBAQCBw
YXR0ZXJuUHJvcGVydGllczoKICAgICAgICAgcmVxdWlyZWQ6CiAgICAgICAgICAgLSBwaW5tdXgK
IAorICAgICAgICBhbGxPZjoKKyAgICAgICAgICAtIGlmOgorICAgICAgICAgICAgICByZXF1aXJl
ZDoKKyAgICAgICAgICAgICAgICAtIGRyaXZlLXN0cmVuZ3RoLW1pY3JvYW1wCisgICAgICAgICAg
ICB0aGVuOgorICAgICAgICAgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICAgICAgICAgIGRyaXZl
LXN0cmVuZ3RoOiBmYWxzZQorCiAgICAgICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQog
CiBhbGxPZjoKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
