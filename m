Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A068C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 19:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0W+G+r4ZvSEsmgObcKwuYaBheeHknfTEGhz/SrD5YOw=; b=Pwcv/oBa/4xEEH
	7sOdrIJ3zRYEIq9lJjl5zQ4kHaW98QH0KKvRRpLoEbeVbdZXJN3s1uTx2NNUgkYjKHG4pWBJZJ+cB
	akd6E9EsiMqi7Da3UrINcQ+IEQ3SGiraWUgAPHL/gbz4aU+oCdXk6rxq4BLAegfdmBH/USSpUEqn7
	DnVaqxZPLjgyK8BnswbnY+RGw+tXSaEEpG9mSY6cHa53d43DE72i7/b3PvB1N3KqxjuhtjWvKrjBQ
	y1TZFRgWTnrvhz76NdwL252LVGjeaPZt/FzFRhTTDcw++2+LtUFKqhiUSAfwug4/nRZRGQEaZFgi1
	UK0zA76WJcKlFyM53IDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhUl-00Haee-EC; Thu, 05 May 2022 19:50:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhRA-00HY0Y-14; Thu, 05 May 2022 19:46:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 9B9201F45CD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651780011;
 bh=m1JTt5Fhkh+wV/Wx5MQaFp1SHyGbtuJWnkpiKW7wYyk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gag2AsnwQgh2vQVDAEVDp4CJ0Gg0ajkhD3r6zJ6ryZ0yKuIZg0659ICdeIjNunthQ
 IYhJNu0FB7Yetj0JqD0+lQtapqYLyC1MG88tvbbrvEdVVyPNKYs/Z3p2TFprrh2hAS
 qIzVyQ6I7NgSznVSvf0F3GDHxMW4pFgF6rgtbwhTua9kjdXIIHAnfxnW7DGSN/Ou4Z
 hZ2ILyVPMOihj/DUAZTGHFe0HL695bWtSxlVu3CTji/ksEs7i7haJHSeFdrkHEqBp2
 oLDQtZxowi/i8TqBvVhRI7zJVnO6uZ+IZ5lfQJLA2Rai3e1afiilN+M9GlaJ9jqLMn
 IgUs2DYqCXetA==
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
Subject: [PATCH v2 13/16] arm64: dts: mediatek: asurada: Enable XHCI
Date: Thu,  5 May 2022 15:45:47 -0400
Message-Id: <20220505194550.3094656-14-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505194550.3094656-1-nfraprado@collabora.com>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_124656_276986_12CE73ED 
X-CRM114-Status: GOOD (  10.62  )
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

RW5hYmxlIFhIQ0kgY29udHJvbGxlciBvbiB0aGUgQXN1cmFkYSBwbGF0Zm9ybS4gVGhpcyBhbGxv
d3MgdGhlIHVzZSBvZgp0aGUgVVNCIHBvcnRzLCBhbmQgdGhlcmVmb3JlIGEgcm9vdGZzIGNhbiBi
ZSBsb2FkZWQgYW5kIGEgdXNhYmxlIHNoZWxsCnJlYWNoZWQgZnJvbSBhIGxpdmUgVVNCIGltYWdl
LgoKU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xs
YWJvcmEuY29tPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vs
b2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KCi0tLQoKQ2hhbmdlcyBpbiB2MjoK
LSBBZGRlZCB0aGlzIHBhdGNoCgogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIt
YXN1cmFkYS5kdHNpIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJh
ZGEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRz
aQppbmRleCBjODUyY2IwZThiNjMuLjRmOWE5ZWMwNDZiMCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCisrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQpAQCAtNTgzLDYgKzU4MywxNCBA
QCAmdWFydDAgewogCXN0YXR1cyA9ICJva2F5IjsKIH07CiAKKyZ4aGNpIHsKKwlzdGF0dXMgPSAi
b2theSI7CisKKwl3YWtldXAtc291cmNlOworCXZ1c2IzMy1zdXBwbHkgPSA8JnBwMzMwMF9nPjsK
Kwl2YnVzLXN1cHBseSA9IDwmcHA1MDAwX2E+OworfTsKKwogI2luY2x1ZGUgPGFybS9jcm9zLWVj
LWtleWJvYXJkLmR0c2k+CiAjaW5jbHVkZSA8YXJtL2Nyb3MtZWMtc2JzLmR0c2k+CiAKLS0gCjIu
MzYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
