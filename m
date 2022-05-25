Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A0AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVlltAYLSN3BUNIPBWM8/BNEgS4GPkjck5p4IJDF5ik=; b=qRXEuI9sE5rRHq
	4xXmTIgl75f73sJcE2eA0E1D4/ZEl68iBGQoyo6oAod9VP8A6RYKgicmBzh9ycxEcqqEG8Rsk5y4w
	hlTSd7QPS4zzv2NKC1XfUjU1vHayFfLGSp51q6yDASWz2BdTpGJKKC+creSG8AdGcbFBMKI7zT92i
	OCPkyY8SREnlGCSWZno+JNYcMtIM3Iav9MsBfQJlJmEIh3ouv5r4yVwRNCb8Jff2K0Fc0B4uR0qXQ
	NnRV07hF6YOyb/taBa9VKDw4eJx6iQQED1U3X6Z6/HHhHC9x0JqDhD7dBhzj+61Jxvl0dugyIjve+
	IHeGDKuMO+DyBX7EcRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttPW-00BjPZ-Cz; Wed, 25 May 2022 15:58:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttO2-00Biqn-8E; Wed, 25 May 2022 15:57:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nfraprado)
	with ESMTPSA id CCF8D1F45159
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653494243;
	bh=KsiEYfGpxg0O1y1KjTtQ242A3Duo08kD4AXp8U0Hc0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l+VX70OMMYa1KMnuEIF7mYLU973wrz8OAvlyiDiy/UivnsZSnWQmH+D4532vb9MN1
	 XcK44xZap/3ZSDQW8TkgmjVoVaZ/Ua4mUadChfoWBVVBbfwvvtnSuJsRHc3MnxFS2O
	 dFNw+COY5gsY0cPPRcOPsG9QgjLiFGM9FHXxiFD1TAI1TEFX2y1nDvEw3NCFFKwrmS
	 EL6w6imihlGytimwVmB2RM2apTjF/iNALVbN+aXwkjhK8lzJ5F6eiCWa+RBesinoGh
	 8h46Qroc3DFeFFhh20UhRdcX1fADM4Gf/MvdNXYkaiS5dyjD9r1LFfwn2QiM/1Ffwx
	 hqmswncX+O6Sg==
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
Subject: [PATCH v1 1/2] dt-bindings: pinctrl: mt8192: Add drive-strength-microamp
Date: Wed, 25 May 2022 11:57:13 -0400
Message-Id: <20220525155714.1837360-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525155714.1837360-1-nfraprado@collabora.com>
References: <20220525155714.1837360-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_085726_520690_94BAEC35 
X-CRM114-Status: GOOD (  13.21  )
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
cmVyIG1lYW5pbmcuCgpGaXhlczogNGFjNjgzMzNmZjZkICgiZHQtYmluZGluZ3M6IHBpbmN0cmw6
IG10ODE5MjogQWRkIG1lZGlhdGVrLGRyaXZlLXN0cmVuZ3RoLWFkdiBwcm9wZXJ0eSIpClNpZ25l
ZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNv
bT4KCi0tLQoKIC4uLi9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwgICAgICB8
IDI3ICsrLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDI1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5Mi55YW1sCmluZGV4IGM5MGExMzJm
YmM3OS4uOGVkZThiNzUwMjM3IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5Mi55YW1sCisrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwKQEAgLTgwLDMx
ICs4MCw4IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAgICAgICAgICAgICBkdC1iaW5kaW5ncy9w
aW5jdHJsL210NjV4eC5oLiBJdCBjYW4gb25seSBzdXBwb3J0IDIvNC82LzgvMTAvMTIvMTQvMTZt
QSBpbiBtdDgxOTIuCiAgICAgICAgICAgICBlbnVtOiBbMiwgNCwgNiwgOCwgMTAsIDEyLCAxNCwg
MTZdCiAKLSAgICAgICAgICBtZWRpYXRlayxkcml2ZS1zdHJlbmd0aC1hZHY6Ci0gICAgICAgICAg
ICBkZXNjcmlwdGlvbjogfAotICAgICAgICAgICAgICBEZXNjcmliZSB0aGUgc3BlY2lmaWMgZHJp
dmluZyBzZXR1cCBwcm9wZXJ0eS4KLSAgICAgICAgICAgICAgRm9yIEkyQyBwaW5zLCB0aGUgZXhp
c3RpbmcgZ2VuZXJpYyBkcml2aW5nIHNldHVwIGNhbiBvbmx5IHN1cHBvcnQKLSAgICAgICAgICAg
ICAgMi80LzYvOC8xMC8xMi8xNC8xNm1BIGRyaXZpbmcuIEJ1dCBpbiBzcGVjaWZpYyBkcml2aW5n
IHNldHVwLCB0aGV5Ci0gICAgICAgICAgICAgIGNhbiBzdXBwb3J0IDAuMTI1LzAuMjUvMC41LzFt
QSBhZGp1c3RtZW50LiBJZiB3ZSBlbmFibGUgc3BlY2lmaWMKLSAgICAgICAgICAgICAgZHJpdmlu
ZyBzZXR1cCwgdGhlIGV4aXN0aW5nIGdlbmVyaWMgc2V0dXAgd2lsbCBiZSBkaXNhYmxlZC4KLSAg
ICAgICAgICAgICAgVGhlIHNwZWNpZmljIGRyaXZpbmcgc2V0dXAgaXMgY29udHJvbGxlZCBieSBF
MUUwRU4uCi0gICAgICAgICAgICAgIFdoZW4gRTE9MC9FMD0wLCB0aGUgc3RyZW5ndGggaXMgMC4x
MjVtQS4KLSAgICAgICAgICAgICAgV2hlbiBFMT0wL0UwPTEsIHRoZSBzdHJlbmd0aCBpcyAwLjI1
bUEuCi0gICAgICAgICAgICAgIFdoZW4gRTE9MS9FMD0wLCB0aGUgc3RyZW5ndGggaXMgMC41bUEu
Ci0gICAgICAgICAgICAgIFdoZW4gRTE9MS9FMD0xLCB0aGUgc3RyZW5ndGggaXMgMW1BLgotICAg
ICAgICAgICAgICBFTiBpcyB1c2VkIHRvIGVuYWJsZSBvciBkaXNhYmxlIHRoZSBzcGVjaWZpYyBk
cml2aW5nIHNldHVwLgotICAgICAgICAgICAgICBWYWxpZCBhcmd1bWVudHMgYXJlIGRlc2NyaWJl
ZCBhcyBiZWxvdzoKLSAgICAgICAgICAgICAgMDogKEUxLCBFMCwgRU4pID0gKDAsIDAsIDApCi0g
ICAgICAgICAgICAgIDE6IChFMSwgRTAsIEVOKSA9ICgwLCAwLCAxKQotICAgICAgICAgICAgICAy
OiAoRTEsIEUwLCBFTikgPSAoMCwgMSwgMCkKLSAgICAgICAgICAgICAgMzogKEUxLCBFMCwgRU4p
ID0gKDAsIDEsIDEpCi0gICAgICAgICAgICAgIDQ6IChFMSwgRTAsIEVOKSA9ICgxLCAwLCAwKQot
ICAgICAgICAgICAgICA1OiAoRTEsIEUwLCBFTikgPSAoMSwgMCwgMSkKLSAgICAgICAgICAgICAg
NjogKEUxLCBFMCwgRU4pID0gKDEsIDEsIDApCi0gICAgICAgICAgICAgIDc6IChFMSwgRTAsIEVO
KSA9ICgxLCAxLCAxKQotICAgICAgICAgICAgICBTbyB0aGUgdmFsaWQgYXJndW1lbnRzIGFyZSBm
cm9tIDAgdG8gNy4KLSAgICAgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3VpbnQzMgotICAgICAgICAgICAgZW51bTogWzAsIDEsIDIsIDMsIDQsIDUsIDYsIDdd
CisgICAgICAgICAgZHJpdmUtc3RyZW5ndGgtbWljcm9hbXA6CisgICAgICAgICAgICBlbnVtOiBb
MTI1LCAyNTAsIDUwMCwgMTAwMF0KIAogICAgICAgICAgIG1lZGlhdGVrLHB1bGwtdXAtYWR2Ogog
ICAgICAgICAgICAgZGVzY3JpcHRpb246IHwKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
