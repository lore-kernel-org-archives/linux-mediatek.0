Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A104DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 21:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rM3h0w6uigyrmLE32m42uo737SymuiJ5VJWRgzw3/is=; b=NwWvXT82kEvAAw
	lAkFiZmpmpjGdInX9a6imIqfFH2aK4/w/YH+3sGp6NXGpM0ECSQLwSyfczquJyXhy2kmGo2WrkS1l
	2Fl0Bc+wI8DdYajII+vb1K4Oy9VEbBylNa2y5sQ7WESXqZ+8t50Y5vy+W1UuQI5UMGyldZBaNNjw4
	161cr4lxpk5gG72wwWFnz5BzbrJPbCe+mp+h6eLYn0wkrw3qNgMQYM6C1Qacbj3X4MhpvQvpsl/pf
	rOcDIfb0HPPO3VpLC76MZW4g1w3AXVoIWRQdCwgX7N7bGkclRLbLijhFEGZEGZXME/WyWBuFn1WBk
	OKqP5U6lC8dCPkDRM1xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlzoC-007ix9-KB; Tue, 03 May 2022 21:11:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlzns-007io5-UZ; Tue, 03 May 2022 21:11:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 56AF01F417FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651612287;
 bh=wTlOS8O93LdQ3MZ6Pc0zTUq7Pc+a0aYpZvVoWcRP7HY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PzSazz1tK90Q9PV9UW17Y7+FKQeT43UIJllNJzWKH28JQXxB3qTDrJA25wkDRYJVa
 7BvGRuBU6nsidwYJ34eUmqTm4xn96Zszvt6v4qSaLn7YCrzzua8YDIlHsA08NI2fLv
 sPUK2hKb9ofGOHQIhH3bvXF2j4kmXdgZs6no/FLLhA+WiC0dQCN1ULHQf42UjOLfTo
 jk9dJ24cr4gJC8rVz1KVBHsXoE3IMidBLhmTCy3YqyQz4Lw5tRb2c4uzXwgHe+ZN1J
 fX5k98xqZy/XPWuUhpWRnHcHF87r67Awf6Yz9/oYiQRo/WR1gS8oFcTetYQDsNkLry
 rJPHKNqs4cjPg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: mediatek: Make l1tcm reg
 optional for mtk, scp
Date: Tue,  3 May 2022 17:11:13 -0400
Message-Id: <20220503211114.2656099-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220503211114.2656099-1-nfraprado@collabora.com>
References: <20220503211114.2656099-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_141129_151236_23542065 
X-CRM114-Status: GOOD (  11.87  )
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

VGhlIFNDUCBoYXMgdGhyZWUgbWVtb3J5IHJlZ2lvbnM6IHNyYW0sIGNmZyBhbmQgbDF0Y20uIFdo
aWxlIHRoZSBmaXJzdAp0d28gYXJlIHJlcXVpcmVkLCBsMXRjbSBpcyBvcHRpb25hbC4gRml4IHRo
ZSBkdC1iaW5kaW5nIHNvIHRoYXQgaXQgY2FuCmJlIG9taXR0ZWQgYW5kIHVwZGF0ZSB0aGUgZGVz
Y3JpcHRpb24uIFRoaXMgZ2V0cyByaWQgb2YgZHRic19jaGVjawp3YXJuaW5ncyBmb3IgZGV2aWNl
dHJlZXMgd2hlcmUgdGhlIGwxdGNtIHJlZyBpcyBtaXNzaW5nIGxpa2UgbXQ4MTgzLgoKU2lnbmVk
LW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29t
PgoKLS0tCgpDaGFuZ2VzIGluIHYzOgotIE1hZGUgdGhlIGNmZyByZWcgcmVxdWlyZWQgYWdhaW4u
IEFmdGVyIGxvb2tpbmcgYWdhaW4gaW50byB0aGUgbXRrLXNjcAogIGRyaXZlciwgb25seSBsMXRj
bSBpcyBvcHRpb25hbC4KLSBBZGRlZCBtZW50aW9uIHRoYXQgYSBkdGJzX2NoZWNrIHdhcm5pbmcg
Z2V0cyBmaXhlZCBieSBwYXRjaCBpbiBjb21taXQKICBtZXNzYWdlLgoKIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbCB8IDYgKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3Au
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxz
Y3AueWFtbAppbmRleCA4MjNhMjM2MjQyZGUuLmVlZWE4NDM3OWExZSAxMDA2NDQKLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90ZXByb2MvbXRrLHNjcC55YW1sCisr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3Au
eWFtbApAQCAtMjMsMTEgKzIzLDEzIEBAIHByb3BlcnRpZXM6CiAKICAgcmVnOgogICAgIGRlc2Ny
aXB0aW9uOgotICAgICAgU2hvdWxkIGNvbnRhaW4gdGhlIGFkZHJlc3MgcmFuZ2VzIGZvciBtZW1v
cnkgcmVnaW9ucyBTUkFNLCBDRkcsIGFuZAotICAgICAgTDFUQ00uCisgICAgICBTaG91bGQgY29u
dGFpbiB0aGUgYWRkcmVzcyByYW5nZXMgZm9yIG1lbW9yeSByZWdpb25zIFNSQU0sIENGRywgYW5k
LAorICAgICAgb3B0aW9uYWxseSwgTDFUQ00uCisgICAgbWluSXRlbXM6IDIKICAgICBtYXhJdGVt
czogMwogCiAgIHJlZy1uYW1lczoKKyAgICBtaW5JdGVtczogMgogICAgIGl0ZW1zOgogICAgICAg
LSBjb25zdDogc3JhbQogICAgICAgLSBjb25zdDogY2ZnCi0tIAoyLjM2LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
