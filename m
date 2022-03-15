Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA373C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 21:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRAjMEHlHUZt6xzhyvekgOGxhSetQx+1oRQ3xODYtBs=; b=w5yCADL6pyuiLS
	/HF3a2jENYcmfXEscpscUwKifW625g0H44CiYS9Wk6VG5uARYaTUhvAkfc2xpiiCbfMJb/gSlhkvn
	UdsGI1sHugU/fTVLTmCcLloxB9MrGF78qWxq1CJo9yD0sZpL4OTGh8Q+81ec2aNp8vkTs0BnKAi02
	7Y0Ssd3fczTIgxna6FdfevuWpioAbKOc+tFoB/ekywa6DpIHSHhdZ++zj1iyzbXjF+wDeqlgltQVR
	1Ux9fXnnqwz8IMHWPMbcHZBvPQTnyo8uWVaLfZR5gUfUiBIcq+KPV4nV1N0Rrd80gxx+fjo+wxUMa
	ccGmMN+Qg+Gv1XDUx2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUEbU-00Ae7s-Pb; Tue, 15 Mar 2022 21:21:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUEb8-00Adzk-SZ; Tue, 15 Mar 2022 21:20:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 880151F42BBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647379249;
 bh=3ckuvqWLQ1qmzoI6HPHe+BcexrvaTRmXFylbDp1AC3I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fiIGSmRYBQRNzj3mgKPV/UTBh7RiXSNivNo34MoxKqEfCQDberhKZkx5V3hpbATJ3
 hX2IB1KUOeNwc/jmKawertc+hsCDJhhTWmNvTwM6yHM2umYnoOUqjCcpevWSxUegjK
 sJydYSemDm5kuiyd7mqxabk6lpX943D6a/l2YoFUMpRJvn+46Oz6CE36MxuGzkWQjS
 S/ZbGXyvLMNBCwfcFcl0haRTEU1JgebWwVluVARlQu9Ps72xPRUTjy6SECtEK0FUfy
 vez6cjtUaOU/VEsiVD8JUv3hOOZRItzn+FXUjHBSlPzTTYypNBZ4lt4pWnNeUZBvOg
 IjUrPQllOg00w==
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
Subject: [PATCH v1 2/4] dt-bindings: pinctrl: mt8192: Add mediatek,
 drive-strength-adv property
Date: Tue, 15 Mar 2022 17:19:34 -0400
Message-Id: <20220315211936.442708-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315211936.442708-1-nfraprado@collabora.com>
References: <20220315211936.442708-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_142055_084952_2ABA8055 
X-CRM114-Status: GOOD (  11.17  )
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

QWRkIHRoZSBtZWRpYXRlayxkcml2ZS1zdHJlbmd0aC1hZHYgcHJvcGVydHkgdG8gdGhlIHBpbmN0
cmwtbXQ4MTkyCmR0LWJpbmRpbmcgdG8gYWxsb3cgZnVydGhlciBkcml2ZSBjdXJyZW50IGFkanVz
dG1lbnRzIGZvciBJMkMgbm9kZXMgb24KTVQ4MTkyLiBJdCBpcyB0aGUgc2FtZSBhcyBpbiBtdDgx
ODMtcGluY3RybC4KClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJh
cHJhZG9AY29sbGFib3JhLmNvbT4KLS0tCgogLi4uL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1t
dDgxOTIueWFtbCAgICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDI2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5Mi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIueWFtbAppbmRleCBkNjNlMjNk
OWVkMTYuLmI1MmQ4ZDBlYjJkMCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIueWFtbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5Mi55YW1sCkBAIC03OCw2
ICs3OCwzMiBAQCBwYXR0ZXJuUHJvcGVydGllczoKICAgICAgICAgICAgICAgZHQtYmluZGluZ3Mv
cGluY3RybC9tdDY1eHguaC4gSXQgY2FuIG9ubHkgc3VwcG9ydCAyLzQvNi84LzEwLzEyLzE0LzE2
bUEgaW4gbXQ4MTkyLgogICAgICAgICAgICAgZW51bTogWzIsIDQsIDYsIDgsIDEwLCAxMiwgMTQs
IDE2XQogCisgICAgICAgICAgbWVkaWF0ZWssZHJpdmUtc3RyZW5ndGgtYWR2OgorICAgICAgICAg
ICAgZGVzY3JpcHRpb246IHwKKyAgICAgICAgICAgICAgRGVzY3JpYmUgdGhlIHNwZWNpZmljIGRy
aXZpbmcgc2V0dXAgcHJvcGVydHkuCisgICAgICAgICAgICAgIEZvciBJMkMgcGlucywgdGhlIGV4
aXN0aW5nIGdlbmVyaWMgZHJpdmluZyBzZXR1cCBjYW4gb25seSBzdXBwb3J0CisgICAgICAgICAg
ICAgIDIvNC82LzgvMTAvMTIvMTQvMTZtQSBkcml2aW5nLiBCdXQgaW4gc3BlY2lmaWMgZHJpdmlu
ZyBzZXR1cCwgdGhleQorICAgICAgICAgICAgICBjYW4gc3VwcG9ydCAwLjEyNS8wLjI1LzAuNS8x
bUEgYWRqdXN0bWVudC4gSWYgd2UgZW5hYmxlIHNwZWNpZmljCisgICAgICAgICAgICAgIGRyaXZp
bmcgc2V0dXAsIHRoZSBleGlzdGluZyBnZW5lcmljIHNldHVwIHdpbGwgYmUgZGlzYWJsZWQuCisg
ICAgICAgICAgICAgIFRoZSBzcGVjaWZpYyBkcml2aW5nIHNldHVwIGlzIGNvbnRyb2xsZWQgYnkg
RTFFMEVOLgorICAgICAgICAgICAgICBXaGVuIEUxPTAvRTA9MCwgdGhlIHN0cmVuZ3RoIGlzIDAu
MTI1bUEuCisgICAgICAgICAgICAgIFdoZW4gRTE9MC9FMD0xLCB0aGUgc3RyZW5ndGggaXMgMC4y
NW1BLgorICAgICAgICAgICAgICBXaGVuIEUxPTEvRTA9MCwgdGhlIHN0cmVuZ3RoIGlzIDAuNW1B
LgorICAgICAgICAgICAgICBXaGVuIEUxPTEvRTA9MSwgdGhlIHN0cmVuZ3RoIGlzIDFtQS4KKyAg
ICAgICAgICAgICAgRU4gaXMgdXNlZCB0byBlbmFibGUgb3IgZGlzYWJsZSB0aGUgc3BlY2lmaWMg
ZHJpdmluZyBzZXR1cC4KKyAgICAgICAgICAgICAgVmFsaWQgYXJndW1lbnRzIGFyZSBkZXNjcmli
ZWQgYXMgYmVsb3c6CisgICAgICAgICAgICAgIDA6IChFMSwgRTAsIEVOKSA9ICgwLCAwLCAwKQor
ICAgICAgICAgICAgICAxOiAoRTEsIEUwLCBFTikgPSAoMCwgMCwgMSkKKyAgICAgICAgICAgICAg
MjogKEUxLCBFMCwgRU4pID0gKDAsIDEsIDApCisgICAgICAgICAgICAgIDM6IChFMSwgRTAsIEVO
KSA9ICgwLCAxLCAxKQorICAgICAgICAgICAgICA0OiAoRTEsIEUwLCBFTikgPSAoMSwgMCwgMCkK
KyAgICAgICAgICAgICAgNTogKEUxLCBFMCwgRU4pID0gKDEsIDAsIDEpCisgICAgICAgICAgICAg
IDY6IChFMSwgRTAsIEVOKSA9ICgxLCAxLCAwKQorICAgICAgICAgICAgICA3OiAoRTEsIEUwLCBF
TikgPSAoMSwgMSwgMSkKKyAgICAgICAgICAgICAgU28gdGhlIHZhbGlkIGFyZ3VtZW50cyBhcmUg
ZnJvbSAwIHRvIDcuCisgICAgICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZp
bml0aW9ucy91aW50MzIKKyAgICAgICAgICAgIGVudW06IFswLCAxLCAyLCAzLCA0LCA1LCA2LCA3
XQorCiAgICAgICAgICAgYmlhcy1wdWxsLWRvd246IHRydWUKIAogICAgICAgICAgIGJpYXMtcHVs
bC11cDogdHJ1ZQotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
