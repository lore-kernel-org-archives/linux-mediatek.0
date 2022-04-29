Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B8EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LcMQpmf14KSyaewIS6WHTrT3B6tL2vMoJAdMUx+KfN4=; b=LyL2qijNx5CCuX
	Y90MrOAlFG+7cky/ep1yArdKukgkNHsoLn5Ogr+zaQfDoGkluaSWrdLCZ6Pn0BlbvMvFOsSfPeRP6
	Lrkw+C+y3+YP913r/VsA1LtnYP0nB5vpa1x7YvbHlWQzDC8UI25h5x3/40ofTOsWOoFNhceB3GQQr
	eesapPbOetOnhRrF/+59L5V33mdJyN2ylrxj7t2MhPQtFygfuAF3YzmxFFuRk3bF+wfrWXi6cJcKW
	99qnx/jHSKEQ9mUzH7a6Ii99/Pl+LAiAUuWRYAqF9QcZmjVuV3Y5bkW4tUPNH15NAFHU/UD6izsBX
	zSx2HsESUnYrD597aXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXtp-00Cjpl-Ou; Fri, 29 Apr 2022 21:11:37 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXta-00Cjhv-IT; Fri, 29 Apr 2022 21:11:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id D8AF81F4699C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651266679;
 bh=vGQAjdZ3iJkV/fg/QPQxJzmeLpJuTQKMjR6O+7rTCyM=;
 h=From:To:Cc:Subject:Date:From;
 b=h9q+nV9PaAmxttoiUWaF2CEscgxVP6cAHHnaATFnuPcanNTj3Z2GcgHF3L44AMOHZ
 K7DbzQ90OjkguYL94vYwVnkNSnvAzKs9gHDH6wGQgypYBp6xzE8y7j315K1rdHKP/T
 Ln/hG4pj/wD0Kv9ou2nQrIMiea2yK/iA2A4IHVZUyaayf4cLmrXoUI/VA8GYFjsQbe
 fhduhwHgHI30Ugk6jkkCB3upZ396tTtl1YNaawyf/99d8qQYanIxQ/JtlV2YX9WTJF
 tumohQfwV5gwO2qeQvlmnkR6rZQhdBFLlXQ/HXNVq6MTfnxyhhwn4rBjeRq26aaNjQ
 qKl20RGld6Wrg==
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
Subject: [PATCH 0/2] Mediatek SCP dt-binding tweaks
Date: Fri, 29 Apr 2022 17:11:08 -0400
Message-Id: <20220429211111.2214119-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_141122_857674_F1C00BFB 
X-CRM114-Status: UNSURE (   7.05  )
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

ClR3byBzaW1wbGUgcGF0Y2hlcyBmb3IgdGhlIE1lZGlhdGVrIFNDUCBkdC1iaW5kaW5nLiBUaGUg
Zmlyc3QgZml4ZXMgdGhlCnJlZy9yZWctbmFtZXMgcHJvcGVydHkgd2hpbGUgdGhlIHNlY29uZCBh
ZGRzIGEgbmV3IG9wdGlvbmFsCm1lbW9yeS1yZWdpb24gcHJvcGVydHkuCgoKTsOtY29sYXMgRi4g
Ui4gQS4gUHJhZG8gKDIpOgogIGR0LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBtZWRpYXRlazogRml4
IG9wdGlvbmFsIHJlZy1uYW1lcyBmb3IgbXRrLHNjcAogIGR0LWJpbmRpbmdzOiByZW1vdGVwcm9j
OiBtZWRpYXRlazogQWRkIG9wdGlvbmFsIG1lbW9yeS1yZWdpb24gdG8KICAgIG10ayxzY3AKCiAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbCAgfCAxNiArKysr
KysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCi0tIAoyLjM2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
