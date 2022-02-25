Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884D8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 23:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=051Jmwg6TOuKJYQSV+2PD4n+nzAoo1GMQlc258Knwlk=; b=Nd/dCs1U6S8GAK
	m0+tc8F1fnOCxTvuMq9P1TYWVdPqemflARnmhennrT7FNNq4kg1WiktlL0Aobx93jqMMQC32x46Bo
	0TS2EAC4g3KPc/0i4UPkwraC8oYthJWiOfXRqtEOtpcj6ITJpN7dbNdNhje5wKDJrbDXQceqEZ0Bc
	4BpflOKsRwCcy6tHn8FgaRjM0/Ws/joaDrSgZAx5hkhmBWu4NkNn+YVDsy/7chwe1rhcUtaxMGXvh
	OE1q9tzBLZTyhMXLKj/9jSag/owNY4utN4xuWcD89jPLvX0/rUGZxDdUdl04kQ3tTYGvC+ABZAYAL
	SbEGw/UCk9D42FwDmr9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNjZG-0079Dc-8Z; Fri, 25 Feb 2022 23:00:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNjYs-00793G-83; Fri, 25 Feb 2022 22:59:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id BF9381F46804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645829981;
 bh=t19nw/t143xzVk+Pi630XyI7MsIs/Qg22pD/AG+WnVg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RED1y/2IFuJpJ/GLLEHcBSw+7IZBlOjLU4a6jmNflSTDX671E7OI3W2itFXoYlVRd
 Sr6GGRnhhm+lBA6fB64D3oSFM3k4I3KpwxNjevYnrM4CMUxP+l9k3p0cgUvVZ+bO/B
 iV+G2hBmVhJdXrVsTyFtVSaQysaS+iaODik64ZTpc67u1snqyxnTbFMIfJku3cRFmd
 PnmOIUyXl4FP1dHUH8TMv9pEI7Db94BNV35BmxAhhgjziUmSXFxwry2riqyxih+fmM
 0u96qhKp0xvXIh9z7AxlIP3nDuOOteTqlrMi1x93uKJ9iDqfO5Z3sziQ+6vuLLI+oF
 D8f+uZ7J0L7hQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: remoteproc: mediatek: Add interrupts
 property to mtk, scp
Date: Fri, 25 Feb 2022 17:58:52 -0500
Message-Id: <20220225225854.81038-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225225854.81038-1-nfraprado@collabora.com>
References: <20220225225854.81038-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_145942_441934_4FDFBBDB 
X-CRM114-Status: UNSURE (   8.95  )
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

VGhlIFNDUCBub2RlIGNhbiBoYXZlIGFuIGFzc29jaWF0ZWQgaW50ZXJydXB0LiBBZGQgYSBwcm9w
ZXJ0eSBmb3IgaXQuCgpTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZy
YXByYWRvQGNvbGxhYm9yYS5jb20+CgotLS0KCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbAppbmRleCBkMjFhMjVlZTk2ZTYuLjEwM2Nj
ZWE0NjJmOCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jl
bW90ZXByb2MvbXRrLHNjcC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbApAQCAtNDEsNiArNDEsOSBAQCBwcm9wZXJ0aWVz
OgogICBjbG9jay1uYW1lczoKICAgICBjb25zdDogbWFpbgogCisgIGludGVycnVwdHM6CisgICAg
bWF4SXRlbXM6IDEKKwogcmVxdWlyZWQ6CiAgIC0gY29tcGF0aWJsZQogICAtIHJlZwotLSAKMi4z
NS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
