Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8282CC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2NCxUuVkqRHq2rzpi4B8DJWzT0SqsN6PXV0u6W8HijU=; b=D9a0wZlI0IkUV0
	0a5ohsIjKRak1vGPRVgv37DaMSjvFGs2P5bpERb0tKStC2Y76BqsPn/bSYJZMZH8f9t9/aFf2juDH
	9nEKuB8KEsrffSBElUTtGJyFSfEYkAY79vNzivp+hrrGUN9YA13NPDTSL33f3O4uQ3U4GVhIziuuZ
	KvlTxvpiK+9LtLCm3lh9KtjoBB6qv8tIXOmHCCDN0MVBUxkphRubCQQaodUoC9OUW8cLFkJPI5+1u
	BjQpcF+tz2pz4uWZt+s2OqvfOWg12JMMKDynsZ4ra3zBcdBBmQiOB5x8RMrBwCbEQiTfrQ6ZjB3jT
	pLeiG+hrBcaqCeHVH63Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttPU-00BjOB-5o; Wed, 25 May 2022 15:58:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttO3-00Bis0-1H; Wed, 25 May 2022 15:57:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nfraprado)
	with ESMTPSA id 1E13E1F45163
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653494245;
	bh=0eLyTpn4l8dOBzhVfjQH2gNs2dijb43NxkXswcaDsJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tjkjg18vHS4ohx+g+hOuNKv79erg5X02zmejSMweTsn73dIMwgobW5HRNY/U45jzu
	 +SJUb+bbRY4wtn+nh0480bPCuyTEVGlDIe+olpd0pyKzxFIHRmMU/vPaGHhvrqkQU6
	 nUNiF/K6j3R2p7diQC+sySOZwIO3CDWOn6nr838jxNAtQzU5+eW4eBSEjZRRjxdDv/
	 iklaadfGFqRcBZixOZazlYFJA8Wo7SHAF8/SMp0/NG4KVyMvPcmch72pdGVzLdvjdH
	 2za80sJPraDfvHKHSlk1bmiPWcHZ0Tj8zLT0a24FqRFTkJCmN47OzI1HYd7C+PIqVh
	 aJ0R1Aj3ERh7g==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
Subject: [PATCH v1 2/2] dt-bindings: pinctrl: mt8192: Use generic bias instead of pull-*-adv
Date: Wed, 25 May 2022 11:57:14 -0400
Message-Id: <20220525155714.1837360-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525155714.1837360-1-nfraprado@collabora.com>
References: <20220525155714.1837360-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_085727_273162_6B4A1ED0 
X-CRM114-Status: GOOD (  12.14  )
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

Q29tbWl0IGNhZmUxOWRiNzc1MSAoInBpbmN0cmw6IG1lZGlhdGVrOiBCYWNrd2FyZCBjb21wYXRp
YmxlIHRvIHByZXZpb3VzCk1lZGlhdGVrJ3MgYmlhcy1wdWxsIHVzYWdlIikgYWxsb3dlZCB0aGUg
Ymlhcy1wdWxsLXVwIGFuZCBiaWFzLXB1bGwtZG93bgpwcm9wZXJ0aWVzIHRvIGJlIHVzZWQgZm9y
IHNldHRpbmcgUFVQRC9SMS9SMCB0eXBlIGJpYXMgb24gbXRrLXBhcmlzCmJhc2VkIFNvQydzLCB3
aGljaCB3YXMgcHJldmlvdXNseSBvbmx5IHN1cHBvcnRlZCBieSB0aGUgY3VzdG9tCm1lZGlhdGVr
LHB1bGwtdXAtYWR2IGFuZCBtZWRpYXRlayxwdWxsLWRvd24tYWR2IHByb3BlcnRpZXMuCgpTaW5j
ZSB0aGUgYmlhcy1wdWxsLXt1cCxkb3dufSBwcm9wZXJ0aWVzIGFscmVhZHkgaGF2ZSBkZWZpbmVz
IGFzc29jaWF0ZWQKdGh1cyBiZWluZyBtb3JlIGRlc2NyaXB0aXZlIGFuZCBpcyBtb3JlIHVuaXZl
cnNhbCBvbiBNZWRpYVRlayBwbGF0Zm9ybXMsCmFuZCBnaXZlbiB0aGF0IHRoZXJlIGFyZSBubyBt
ZWRpYXRlayxwdWxsLXt1cCxkb3dufS1hZHYgdXNlcnMgb24gbXQ4MTkyCnlldCwgcmVtb3ZlIHRo
ZSBjdXN0b20gYWR2IHByb3BlcnRpZXMgaW4gZmF2b3Igb2YgdGhlIGdlbmVyaWMgb25lcy4KCk5v
dGUgdGhhdCBvbmx5IG1lZGlhdGVrLHB1bGwtdXAtYWR2IHdhcyBtZXJnZWQgaW4gdGhlIGJpbmRp
bmcsIGJ1dCBub3QKaXRzIGRvd24gY291bnRlcnBhcnQuCgpGaXhlczogZWRiYWNiMzZlYTUwICgi
ZHQtYmluZGluZ3M6IHBpbmN0cmw6IG10ODE5MjogQWRkIG1lZGlhdGVrLHB1bGwtdXAtYWR2IHBy
b3BlcnR5IikKU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFk
b0Bjb2xsYWJvcmEuY29tPgotLS0KCiAuLi4vYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5
Mi55YW1sICAgICAgfCAyOSArKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwK
aW5kZXggOGVkZThiNzUwMjM3Li5lMzlmNTg5M2JmMTYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIu
eWFtbApAQCAtODMsMjAgKzgzLDIxIEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAgICAgICAgIGRy
aXZlLXN0cmVuZ3RoLW1pY3JvYW1wOgogICAgICAgICAgICAgZW51bTogWzEyNSwgMjUwLCA1MDAs
IDEwMDBdCiAKLSAgICAgICAgICBtZWRpYXRlayxwdWxsLXVwLWFkdjoKLSAgICAgICAgICAgIGRl
c2NyaXB0aW9uOiB8Ci0gICAgICAgICAgICAgIFB1bGwgdXAgc2V0dGluZ3MgZm9yIDIgcHVsbCBy
ZXNpc3RvcnMsIFIwIGFuZCBSMS4gVXNlciBjYW4KLSAgICAgICAgICAgICAgY29uZmlndXJlIHRo
b3NlIHNwZWNpYWwgcGlucy4gVmFsaWQgYXJndW1lbnRzIGFyZSBkZXNjcmliZWQgYXMgYmVsb3c6
Ci0gICAgICAgICAgICAgIDA6IChSMSwgUjApID0gKDAsIDApIHdoaWNoIG1lYW5zIFIxIGRpc2Fi
bGVkIGFuZCBSMCBkaXNhYmxlZC4KLSAgICAgICAgICAgICAgMTogKFIxLCBSMCkgPSAoMCwgMSkg
d2hpY2ggbWVhbnMgUjEgZGlzYWJsZWQgYW5kIFIwIGVuYWJsZWQuCi0gICAgICAgICAgICAgIDI6
IChSMSwgUjApID0gKDEsIDApIHdoaWNoIG1lYW5zIFIxIGVuYWJsZWQgYW5kIFIwIGRpc2FibGVk
LgotICAgICAgICAgICAgICAzOiAoUjEsIFIwKSA9ICgxLCAxKSB3aGljaCBtZWFucyBSMSBlbmFi
bGVkIGFuZCBSMCBlbmFibGVkLgotICAgICAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvdWludDMyCi0gICAgICAgICAgICBlbnVtOiBbMCwgMSwgMiwgM10KLQot
ICAgICAgICAgIGJpYXMtcHVsbC1kb3duOiB0cnVlCi0KLSAgICAgICAgICBiaWFzLXB1bGwtdXA6
IHRydWUKKyAgICAgICAgICBiaWFzLXB1bGwtZG93bjoKKyAgICAgICAgICAgIG9uZU9mOgorICAg
ICAgICAgICAgICAtIHR5cGU6IGJvb2xlYW4KKyAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbjog
bm9ybWFsIHB1bGwgZG93bi4KKyAgICAgICAgICAgICAgLSBlbnVtOiBbMTAwLCAxMDEsIDEwMiwg
MTAzXQorICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBQVVBEL1IxL1IwIHB1bGwgZG93biB0
eXBlLiBTZWUgTVRLX1BVUERfU0VUX1IxUjBfCisgICAgICAgICAgICAgICAgICBkZWZpbmVzIGlu
IGR0LWJpbmRpbmdzL3BpbmN0cmwvbXQ2NXh4LmguCisKKyAgICAgICAgICBiaWFzLXB1bGwtdXA6
CisgICAgICAgICAgICBvbmVPZjoKKyAgICAgICAgICAgICAgLSB0eXBlOiBib29sZWFuCisgICAg
ICAgICAgICAgICAgZGVzY3JpcHRpb246IG5vcm1hbCBwdWxsIHVwLgorICAgICAgICAgICAgICAt
IGVudW06IFsxMDAsIDEwMSwgMTAyLCAxMDNdCisgICAgICAgICAgICAgICAgZGVzY3JpcHRpb246
IFBVUEQvUjEvUjAgcHVsbCB1cCB0eXBlLiBTZWUgTVRLX1BVUERfU0VUX1IxUjBfCisgICAgICAg
ICAgICAgICAgICBkZWZpbmVzIGluIGR0LWJpbmRpbmdzL3BpbmN0cmwvbXQ2NXh4LmguCiAKICAg
ICAgICAgICBiaWFzLWRpc2FibGU6IHRydWUKIAotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
