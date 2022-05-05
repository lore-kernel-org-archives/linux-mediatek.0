Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE969C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 19:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYg0gPU+zRMSHu96PZF4QUJicYm3i2czpRq8Oe/sAMs=; b=2MJRIActgPkcrv
	eOFy6urMHYfWg1Y0eZhS6K1vj6YmdglHYp0BuYknZ0yZn1Y1NplzSh+4fxUUfUg4UKS/4CRavjqI1
	P835D0Dr2/Fq+czUDbi9jF1VWw+tj9zHtFQAvXbvklBslk9C/mqQkXBsqL5bgCjLQ0Q6Ssi3O1iZc
	7DnzOJBtBf+m41bv2eVlkRbN3z3bjRwjVttZMnlaQMK0KrYQsa3RHHDUeb+zCvYPX5RjP8/99DHob
	o3Y9QReIWLmN4eOe7kqvoYKOmJ0vtPZg5HmPbb2kzSCC5jr1qNbTnuN9JBHfdmDo4pMENmBZ0ayWp
	0PRjDocPZE8RAQc7Hnbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhUM-00HaO7-NV; Thu, 05 May 2022 19:50:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhR4-00HXwu-EH; Thu, 05 May 2022 19:46:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id AC83F1F45CD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651780009;
 bh=8TvoEhGQU6t2qg9uM8iphoK/DuIcgX6ObTBGTPSxnTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XSsfXvMh/3UvAYBBO5gWbz63asC1SxSMIAZvqX3j4MDRYYwGfClwFV3ak8VXdWV18
 bqv0Bh+GBInZgOfD2LHapuhjie9qOp1OdtpVe4r5OREjgzG7zvI1lK4ulqRe2u9/Oi
 BGB/xUNuCMopwMrJnmU27zEjybmvzVd0qfrgolUngTt7beTEIafEG19kQzBpz/Wym+
 eBGunoEKPuB4GDZfZEdeI7Gpaa+dPb3d8J4WgKx4zEvvUrvNPfepXdEoaVvolV/bAt
 pk4eKgKw+iuLd2pDB9EOAIWEwz09nXqgR2icBMdLX3MoaH6MHYFwYK+OT93OnNZn03
 kg6aDjWuS0D1Q==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 12/16] arm64: dts: mediatek: spherion: Add keyboard
 backlight
Date: Thu,  5 May 2022 15:45:46 -0400
Message-Id: <20220505194550.3094656-13-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505194550.3094656-1-nfraprado@collabora.com>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_124650_633516_5163B719 
X-CRM114-Status: GOOD (  10.02  )
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

VGhlIFNwaGVyaW9uIGJvYXJkIGhhcyBrZXlib2FyZCBiYWNrbGlnaHQgY29udHJvbGxlZCBieSB0
aGUgUFdNIHNpZ25hbApnZW5lcmF0ZWQgYnkgdGhlIENocm9tZU9TIEVDLgoKRW5hYmxlIFBXTSBv
dXRwdXQgZm9yIENocm9tZU9TIEVDIGFuZCBhZGQgYSBQV00gY29udHJvbGxlZCBMRUQgbm9kZSBm
b3IKdGhlIGtleWJvYXJkIGJhY2tsaWdodC4KClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIu
IEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5j
b20+Ci0tLQoKKG5vIGNoYW5nZXMgc2luY2UgdjEpCgogLi4uL2R0cy9tZWRpYXRlay9tdDgxOTIt
YXN1cmFkYS1zcGhlcmlvbi1yMC5kdHMgIHwgMTYgKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLXNwaGVyaW9uLXIwLmR0cyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEtc3BoZXJpb24tcjAuZHRzCmluZGV4IDM1ZDlj
NTI5NGZlMC4uN2Y5Y2Y3ZWUxNDM3IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE5Mi1hc3VyYWRhLXNwaGVyaW9uLXIwLmR0cworKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLXNwaGVyaW9uLXIwLmR0cwpAQCAtNCwxMiAr
NCwyOCBAQAogICovCiAvZHRzLXYxLzsKICNpbmNsdWRlICJtdDgxOTItYXN1cmFkYS5kdHNpIgor
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2xlZHMvY29tbW9uLmg+CiAKIC8gewogCW1vZGVsID0gIkdv
b2dsZSBTcGhlcmlvbiAocmV2MCAtIDMpIjsKIAljb21wYXRpYmxlID0gImdvb2dsZSxzcGhlcmlv
bi1yZXYzIiwgImdvb2dsZSxzcGhlcmlvbi1yZXYyIiwKIAkJICAgICAiZ29vZ2xlLHNwaGVyaW9u
LXJldjEiLCAiZ29vZ2xlLHNwaGVyaW9uLXJldjAiLAogCQkgICAgICJnb29nbGUsc3BoZXJpb24i
LCAibWVkaWF0ZWssbXQ4MTkyIjsKKworCXB3bWxlZHMgeworCQljb21wYXRpYmxlID0gInB3bS1s
ZWRzIjsKKworCQlsZWQgeworCQkJZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fS0JEX0JBQ0tMSUdI
VDsKKwkJCWNvbG9yID0gPExFRF9DT0xPUl9JRF9XSElURT47CisJCQlwd21zID0gPCZjcm9zX2Vj
X3B3bSAwPjsKKwkJCW1heC1icmlnaHRuZXNzID0gPDEwMjM+OworCQl9OworCX07Cit9OworCism
Y3Jvc19lY19wd20geworCXN0YXR1cyA9ICJva2F5IjsKIH07CiAKICZ0b3VjaHNjcmVlbiB7Ci0t
IAoyLjM2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
