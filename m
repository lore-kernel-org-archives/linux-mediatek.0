Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFFAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 20:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qhSNaMTlN/IB524yh4XMMpYkTeganz70MCrb6oAzUI=; b=rl54piAEclqG1G
	9efSC/5sZRcQzsL+Dg10WDPjuKKyhiXi+DN+gFhVqjiFpEARFnkWj7blbAV7UhirmCgYkLh6h2AF7
	JN0CdoKxolwFzowx+cyNIEsGXJajPpdAwzQr2NEaj+rpacwUZ2H2RTzhk1lzEprxNCNEU8rflHOKf
	KXydzGx5j88KSF4WQPWA8drBlmeXpxMvoXlio4Y8lA9jYqZZhREmj2/gibNv2dTImqSkk0misPUQb
	tFJlZ7Hw4VecmiWRe+ACaSQNIW7z+a4WCE14qtRZgX8IkpaLAQ3gbv5LxXRJFkNirqtXQYhLC6AyU
	23I/O+WKYcbrkfsfx+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFrI-00DRET-M0; Thu, 12 May 2022 20:56:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFr7-00DR7X-0A; Thu, 12 May 2022 20:56:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id C65E51F4585A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652388972;
 bh=voeNFipaVaDn/LgNQuPTER6uB6OG5ivBXpY5Y5avsJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ibQT9H69p13pHw/SCdfFDl4IahMmjlK46esoyQ20qVmwLCyRt0pAj61h5goMuOnrs
 xfW8CPDIOoSw72WSs63bolVyKJ/h0Byr+kWjjpeQI1KGDuJnO1hyHBkfzfNHPehFZ0
 XUyNyBEju0tksLRRxOKHd4xft/UquyctJxThapJbEWuw43SFN/3tLeFZjy2zMf+VOV
 PZ5lSO2wcc0nHv9BlnW+v7Gq66qgCmGGfkULttndqObITuIT/nlpuI8/sqIn0CTJ9o
 t6qltg7vlvSR8MiROdqkYbEW0W6xNpluvMHmgGj3m79AcFKwJ6n1Czcglz7a7ITOTb
 Q2Q1ZYWs8qWgw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxim Kutnij <gtk3@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 01/16] dt-bindings: arm64: dts: mediatek: Add
 mt8192-asurada-spherion
Date: Thu, 12 May 2022 16:55:47 -0400
Message-Id: <20220512205602.158273-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512205602.158273-1-nfraprado@collabora.com>
References: <20220512205602.158273-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_135617_296286_5F372B6C 
X-CRM114-Status: UNSURE (   9.02  )
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

QWRkIGJpbmRpbmcgZm9yIHRoZSBHb29nbGUgU3BoZXJpb24gYm9hcmQsIHdoaWNoIGlzIHVzZWQg
Zm9yIEFjZXIKQ2hyb21lYm9vayA1MTQgKENCNTE0LTJIKS4KClNpZ25lZC1vZmYtYnk6IE7DrWNv
bGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNv
bGxhYm9yYS5jb20+ClRlc3RlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1bS5vcmc+
CkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKLS0tCgoobm8gY2hhbmdl
cyBzaW5jZSB2MikKCkNoYW5nZXMgaW4gdjI6Ci0gQWRkZWQgdGhpcyBwYXRjaAoKIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbCB8IDggKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrLnlhbWwKaW5kZXggNGEyYmQ5NzU5YzQ3
Li40M2ZjMzQxN2U3ODYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vbWVkaWF0ZWsueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL21lZGlhdGVrLnlhbWwKQEAgLTEzMSw2ICsxMzEsMTQgQEAgcHJvcGVydGllczoK
ICAgICAgICAgICAtIGVudW06CiAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTgzLWV2Ygog
ICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE4MworICAgICAgLSBkZXNjcmlwdGlvbjog
R29vZ2xlIFNwaGVyaW9uIChBY2VyIENocm9tZWJvb2sgNTE0KQorICAgICAgICBpdGVtczoKKyAg
ICAgICAgICAtIGNvbnN0OiBnb29nbGUsc3BoZXJpb24tcmV2MworICAgICAgICAgIC0gY29uc3Q6
IGdvb2dsZSxzcGhlcmlvbi1yZXYyCisgICAgICAgICAgLSBjb25zdDogZ29vZ2xlLHNwaGVyaW9u
LXJldjEKKyAgICAgICAgICAtIGNvbnN0OiBnb29nbGUsc3BoZXJpb24tcmV2MAorICAgICAgICAg
IC0gY29uc3Q6IGdvb2dsZSxzcGhlcmlvbgorICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10
ODE5MgogICAgICAgLSBpdGVtczoKICAgICAgICAgICAtIGVudW06CiAgICAgICAgICAgICAgIC0g
bWVkaWF0ZWssbXQ4MTkyLWV2YgotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
