Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 19:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHpc/16aVqamJv3vqpnhNX9ox+sud19eHDHs6JzlBG4=; b=IY6H9XkfKeGjOm
	1ysLxZVyCvQ2DvprIfHHNlUR9/tG5kXsuV6raUJ8Mcu/CZjepcBHUxMysJ2Dt2LjhO3vvFUlLjDc+
	kMaftXSPuIQB3fzGDrRTwW1+rbB0cos/KCdgu4i/k41EQ7zODHuiwNEDcC9eG4ORVE0JXw58fd7Yp
	9UDFOA51bhVqwetPveyzMASY3BLlLvktfCmX6RPNNbwzc3IDSN1lrYslOVTxcJ7uNvkrEpzY3CoZq
	tc5aXyriP3SWcR0+NhrUSBVeAO9aG9ORlaOKZdxgYt0nadbCoeMiaXuqtfBpb9lnaxeF3htdmjgGT
	KfedSd4JWH0C9dkKG0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhQh-00HXil-WC; Thu, 05 May 2022 19:46:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhQM-00HXaK-4i; Thu, 05 May 2022 19:46:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 23C351F45CC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651779965;
 bh=21w7d4HLQIHxJNtHhSY7Qd63ixB77Yj/2Hy7oU1nCRM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MA793fHkQpeb0B6Mq8BCqnXq8maWZ6jDR75RsX19Yzl66A9YyFx4ue57yg4ruqcFH
 ENNSUUUJj1sRlTTvM2WxOTiSIRf2NO2PEVfLJqAchkCpLsUzDU8phQbVgiqiwNZHOb
 KaF8HNW9JZU4ujSTDwIkJQvZPIiDgP+KBJiE6UCixBzGn8wTkjqfKhG7n/3CkOqCik
 k2qWff5dxwOgh7Iqc6gIKN/Z0ela1sSgBG0BTCgUYrKDo1VxU6pRFC+6fXcLB8uZt7
 lFOywidO3A6gKDkrrZ8MihQyE+n5Ndbyh1BBnThv6p7bseJMMF35WvQK0biC02PakZ
 8YqDaPWLOazaQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Luca Weiss <luca@z3ntu.xyz>, Maxim Kutnij <gtk3@inbox.ru>,
 Rob Herring <robh+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 01/16] dt-bindings: arm64: dts: mediatek: Add
 mt8192-asurada-spherion
Date: Thu,  5 May 2022 15:45:35 -0400
Message-Id: <20220505194550.3094656-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505194550.3094656-1-nfraprado@collabora.com>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_124606_351515_8DF3DD0D 
X-CRM114-Status: UNSURE (   8.97  )
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
bGxhYm9yYS5jb20+CgotLS0KCkNoYW5nZXMgaW4gdjI6Ci0gQWRkZWQgdGhpcyBwYXRjaAoKIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbCB8IDggKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrLnlhbWwKaW5kZXggNGEyYmQ5
NzU5YzQ3Li40M2ZjMzQxN2U3ODYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrLnlhbWwKQEAgLTEzMSw2ICsxMzEsMTQgQEAgcHJvcGVy
dGllczoKICAgICAgICAgICAtIGVudW06CiAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTgz
LWV2YgogICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE4MworICAgICAgLSBkZXNjcmlw
dGlvbjogR29vZ2xlIFNwaGVyaW9uIChBY2VyIENocm9tZWJvb2sgNTE0KQorICAgICAgICBpdGVt
czoKKyAgICAgICAgICAtIGNvbnN0OiBnb29nbGUsc3BoZXJpb24tcmV2MworICAgICAgICAgIC0g
Y29uc3Q6IGdvb2dsZSxzcGhlcmlvbi1yZXYyCisgICAgICAgICAgLSBjb25zdDogZ29vZ2xlLHNw
aGVyaW9uLXJldjEKKyAgICAgICAgICAtIGNvbnN0OiBnb29nbGUsc3BoZXJpb24tcmV2MAorICAg
ICAgICAgIC0gY29uc3Q6IGdvb2dsZSxzcGhlcmlvbgorICAgICAgICAgIC0gY29uc3Q6IG1lZGlh
dGVrLG10ODE5MgogICAgICAgLSBpdGVtczoKICAgICAgICAgICAtIGVudW06CiAgICAgICAgICAg
ICAgIC0gbWVkaWF0ZWssbXQ4MTkyLWV2YgotLSAKMi4zNi4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
