Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598C5C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 21:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+j75zMV0S6afRnQZ45x8YNL5mKb/qAo7PHA8x886Fi8=; b=SYpk4ewqqV6jW4
	sGsCaCPg81zegJ4cXSSfACm1ducqtIZcXE7JFsTXSghE/CHv1yej2InpPl8Cg+waeq9G4cqRYRCNd
	ztBunvVEVrbMWxpU541i/e8mfFB9fRUH4aE+IImM+MBzi5flsGd3oLjCNbolfl4oRv7cNmwW34fTK
	IEzHQ24TNKviVgrUbJUJU6kWMQitbdccAbVuBlspuPsOFvFMtlnr1yfZeObs3rP/fAGgwitzrxz6H
	hATkJpqBL6Xu1P/G36ab46t2OPNtrOIxbD7pCVEaacUUzXt6HmH81HFuHD+sIYz0R386oqDy/GnRZ
	wNSWMV4oJ2r65DSP0B9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUEbq-00AeGq-HT; Tue, 15 Mar 2022 21:21:38 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUEb8-00Ae01-TP; Tue, 15 Mar 2022 21:20:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 0EB771F42BBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647379251;
 bh=vZXGUjEOoQ/hDl1/0up+a55Pw8LwwlkZJAbKDK6p7ZU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OQ3dUMDo+U38x8tXlkVy+aOoIfivhouBoK4rUd5hAnnxlR8uqiJWObLdl/sPOAgnB
 0j1ZIdnPKux6r9hJLHbeSAWJZqA/g84oY+awqqGSBDJ7CNkjGewTCR05cngdJA6pex
 AztOP3wqTQPHp8dyhteUJMZGu5oA+IJKX0Q4j0veVaUGnL1Z92XLcmxpc/TlCH37Gh
 D4uBgW6dmpNib6Y9Z7raDIvnJjpYo75WoM3rI1uXFI8VMTwq9GLJswdV4oUd68Z35k
 Vni+s1kR0ivvrWpRpUT9sL5pFxq36AAyZk7D2k/uwWkEQqvg1YCFQs83YQsvi77Tvx
 J13eM8VJBZc9Q==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 3/4] dt-bindings: pinctrl: mt8192: Add mediatek,
 pull-up-adv property
Date: Tue, 15 Mar 2022 17:19:35 -0400
Message-Id: <20220315211936.442708-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315211936.442708-1-nfraprado@collabora.com>
References: <20220315211936.442708-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_142055_103234_2844545E 
X-CRM114-Status: UNSURE (   9.08  )
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

QWRkIHRoZSBtZWRpYXRlayxwdWxsLXVwLWFkdiBwcm9wZXJ0eSB0byB0aGUgcGluY3RybC1tdDgx
OTIgZHQtYmluZGluZwp0byBhbGxvdyBjb25maWd1cmluZyBwdWxsLXVwIHJlc2lzdG9ycyBvbiB0
aGUgcGlucyBvZiBNVDgxOTIuIEl0IGlzIHRoZQpzYW1lIGFzIGluIG10ODE4My1waW5jdHJsLgoK
U2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJv
cmEuY29tPgotLS0KCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4
MTkyLnlhbWwgICB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5j
dHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGluY3RybC9waW5jdHJsLW10ODE5Mi55YW1sCmluZGV4IGI1MmQ4ZDBlYjJkMC4uZTI3Y2Jj
YzZlOGY5IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGlu
Y3RybC9waW5jdHJsLW10ODE5Mi55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwKQEAgLTEwNCw2ICsxMDQsMTcgQEAg
cGF0dGVyblByb3BlcnRpZXM6CiAgICAgICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1s
Iy9kZWZpbml0aW9ucy91aW50MzIKICAgICAgICAgICAgIGVudW06IFswLCAxLCAyLCAzLCA0LCA1
LCA2LCA3XQogCisgICAgICAgICAgbWVkaWF0ZWsscHVsbC11cC1hZHY6CisgICAgICAgICAgICBk
ZXNjcmlwdGlvbjogfAorICAgICAgICAgICAgICBQdWxsIHVwIHNldHRpbmdzIGZvciAyIHB1bGwg
cmVzaXN0b3JzLCBSMCBhbmQgUjEuIFVzZXIgY2FuCisgICAgICAgICAgICAgIGNvbmZpZ3VyZSB0
aG9zZSBzcGVjaWFsIHBpbnMuIFZhbGlkIGFyZ3VtZW50cyBhcmUgZGVzY3JpYmVkIGFzIGJlbG93
OgorICAgICAgICAgICAgICAwOiAoUjEsIFIwKSA9ICgwLCAwKSB3aGljaCBtZWFucyBSMSBkaXNh
YmxlZCBhbmQgUjAgZGlzYWJsZWQuCisgICAgICAgICAgICAgIDE6IChSMSwgUjApID0gKDAsIDEp
IHdoaWNoIG1lYW5zIFIxIGRpc2FibGVkIGFuZCBSMCBlbmFibGVkLgorICAgICAgICAgICAgICAy
OiAoUjEsIFIwKSA9ICgxLCAwKSB3aGljaCBtZWFucyBSMSBlbmFibGVkIGFuZCBSMCBkaXNhYmxl
ZC4KKyAgICAgICAgICAgICAgMzogKFIxLCBSMCkgPSAoMSwgMSkgd2hpY2ggbWVhbnMgUjEgZW5h
YmxlZCBhbmQgUjAgZW5hYmxlZC4KKyAgICAgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgICAgICAgICAgZW51bTogWzAsIDEsIDIsIDNdCisK
ICAgICAgICAgICBiaWFzLXB1bGwtZG93bjogdHJ1ZQogCiAgICAgICAgICAgYmlhcy1wdWxsLXVw
OiB0cnVlCi0tIAoyLjM1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
