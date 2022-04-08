Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD86C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 01:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ckvv8xKYsDx/Z4XVnqRcdWxIKbwYJq3E+m7qNCq/zTw=; b=iPayU1v4wBTvnk
	r/3ARJeq5ICj9HJQEXWRq2fpeU1DGjPLaSHDdjpccNYV9TswIdWp/KJWY32igiWi4XfOQzaFbkWwY
	ovpJfBdYc42+HDzyBt0fKEz1LtA2Z4zu8YX4PHhHMIp3eOxL/ZCpkkHJc1bNvdcd32USUbyYEkmlv
	l5Cr0pt/yBMzPI5Gcd3+5EkZRyf4B0bEjVZ+IEnghspF8By0Z2FUhRR5fdKLT2gNe6aUsLPD7O/yX
	0cuRgYtrN+UR7rV+nKBNj8Ag1C4gSv+3Ydem1THrD2z6CIiwQHg5qmke0BIvof6Ft1iWZSu4ypOdp
	gJSTO1unfcuAvOAHRO7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncdbd-00EYxc-Ez; Fri, 08 Apr 2022 01:40:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncdbR-00EYup-SD; Fri, 08 Apr 2022 01:39:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 2E48A1F46A39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649381996;
 bh=Zoo0D97gEmqNrY989eMksqTtr9Q81mrxj7dB1t09D6s=;
 h=From:To:Cc:Subject:Date:From;
 b=SQ9QUQfCr2e2hvpXJL9p427drhnonB1hrAQ8NW3YHYwSh7XMHkrq68aZorlrf21qK
 rxNjA+g4ONZ9RezDcpv3/OYQjrUaiaBo0tlbsPaodSI0pBtpPdm0c1Y8JNg25LcGCM
 ocvAOI7iADHCPaxskD5eQYeZ12t3qdFf3IL4SHC8tItqZiP4fJyVaoUdoTvKwCFjRH
 ToDi6AZ2yynJchpugZDEsMe2PFFwramN38bqAYBmAhKLHqP73XvYN5dhhOI7eWrDCT
 5zhHtBpnbQ7QB55NIwNBTgjUNfbVLGYhetLLKjxnMm/NGfObTwaDWENbbgBENwLMlD
 CJpl9ajw90Gjg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jitao Shi <jitao.shi@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2] drm/mediatek: dpi: Use mt8183 output formats for mt8192
Date: Thu,  7 Apr 2022 21:39:50 -0400
Message-Id: <20220408013950.674477-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_183958_082802_41186B6A 
X-CRM114-Status: GOOD (  13.18  )
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

VGhlIGNvbmZpZ3VyYXRpb24gZm9yIG10ODE5MiB3YXMgaW5jb3JyZWN0bHkgdXNpbmcgdGhlIG91
dHB1dCBmb3JtYXRzCmZyb20gbXQ4MTczLiBTaW5jZSB0aGUgb3V0cHV0IGZvcm1hdHMgZm9yIG10
ODE5MiBhcmUgaW5zdGVhZCB0aGUgc2FtZQpvbmVzIGFzIGZvciBtdDgxODMsIHdoaWNoIHJlcXVp
cmUgdHdvIGJ1cyBzYW1wbGVzIHBlciBwaXhlbCwgdGhlCnBpeGVsY2xvY2sgYW5kIEREUiBlZGdl
IHNldHRpbmcgd2VyZSBtaXNjb25maWd1cmVkLiBUaGlzIG1hZGUgZXh0ZXJuYWwKZGlzcGxheXMg
dW5hYmxlIHRvIHNob3cgdGhlIGltYWdlLgoKRml4IHRoZSBpc3N1ZSBieSBjb3JyZWN0aW5nIHRo
ZSBvdXRwdXQgZm9ybWF0IGZvciBtdDgxOTIgdG8gYmUgdGhlIHNhbWUKYXMgZm9yIG10ODE4Mywg
Zml4aW5nIHRoZSB1c2FnZSBvZiBleHRlcm5hbCBkaXNwbGF5cyBmb3IgbXQ4MTkyLgoKRml4ZXM6
IGJlNjNmNmU4NjAxZiAoImRybS9tZWRpYXRlazogZHBpOiBBZGQgb3V0cHV0IGJ1cyBmb3JtYXRz
IHRvIGRyaXZlciBkYXRhIikKU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8g
PG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgoKLS0tCgpDaGFuZ2VzIGluIHYyOgotIEFkZGVkIEZp
eGVzIHRhZwoKIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCA0ICsrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHBpLmMKaW5kZXggNDU1NGUyZGUxNDMwLi5lNjFjZDY3Yjk3OGYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcGkuYwpAQCAtODE5LDggKzgxOSw4IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE5Ml9jb25mID0gewogCS5jYWxfZmFjdG9yID0gbXQ4
MTgzX2NhbGN1bGF0ZV9mYWN0b3IsCiAJLnJlZ19oX2ZyZV9jb24gPSAweGUwLAogCS5tYXhfY2xv
Y2tfa2h6ID0gMTUwMDAwLAotCS5vdXRwdXRfZm10cyA9IG10ODE3M19vdXRwdXRfZm10cywKLQku
bnVtX291dHB1dF9mbXRzID0gQVJSQVlfU0laRShtdDgxNzNfb3V0cHV0X2ZtdHMpLAorCS5vdXRw
dXRfZm10cyA9IG10ODE4M19vdXRwdXRfZm10cywKKwkubnVtX291dHB1dF9mbXRzID0gQVJSQVlf
U0laRShtdDgxODNfb3V0cHV0X2ZtdHMpLAogfTsKIAogc3RhdGljIGludCBtdGtfZHBpX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCi0tIAoyLjM1LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
