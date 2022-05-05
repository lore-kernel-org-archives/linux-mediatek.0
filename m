Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4518C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 19:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARi8xX15PPS14Yq9GlLOe1YeNel04RNwXp01tQs4PuM=; b=jgj/b/JhCuzzKO
	wAE9Mnwfi7x55PRItQzMXuLO6dmIpxj+nrh3RnT5jR9rtB97FrQNof8mLT/I6oOxCsbr8VYvESx+i
	tio1bBROKGDhyPibJchfhOucQ70pZWAOw0uQcCEWKf3W6vtU96DkufGp9gPOnlMHmyWpZ+fc+5WOY
	lX2a9k8t2QITAXlG1KHve1bTTL9vlbTy73G2Nx5y//+ToVC5NGS+UBvDBasmyPLvfp/fUBH+j3SMA
	jxo69DjhFZCqEHSM9sw7Z4I7EzA/XqloooAbPZulKoH0wn4I49UbzgmhvYk8Wpr32eFT21xFVFJEl
	x+NYVI3EnxXwxXWdKFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhQt-00HXpH-3G; Thu, 05 May 2022 19:46:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhQR-00HXbz-94; Thu, 05 May 2022 19:46:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 9FA281F45CC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651779970;
 bh=5Kcbcqr9OhmHIuCYNXcg4C+KzQ6qGeSuadFLlrIJIpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ea29dOxZVnZfxMa8lHkkVZVcdYNA/IJW9A/OO8DPYVdpBx9E2IEP7OKdsAekp9IlG
 /NOoFuzjIX/C73+/b/njYYfStfREJ6dg+jd5C2ViKlHimpXa1rCxbDs//sGEr18atH
 sU7wovYGUidGjGXEwLvbl/jWKXKUSbEvsvJbrkjyVDNVMKnz5FV14FIVrBgvbVQZ9m
 j6ShUa/7LqVG86/oJRLW3Wqx78A1fQmsQVaELZdkMVXDGJnamVjHXZ4gV8IUa6HdDq
 3pvQqX7hrCYkZWb+aWVEGIX0brnH+szPZBmV2Bz+/oYo70AzptrMw4Atvb4l27drJ8
 cmxgDAcyMnAdw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxim Kutnij <gtk3@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 02/16] dt-bindings: arm64: dts: mediatek: Add
 mt8192-asurada-hayato
Date: Thu,  5 May 2022 15:45:36 -0400
Message-Id: <20220505194550.3094656-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505194550.3094656-1-nfraprado@collabora.com>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_124611_524003_65C6CDBC 
X-CRM114-Status: UNSURE (   9.12  )
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

QWRkIGJpbmRpbmcgZm9yIHRoZSBHb29nbGUgSGF5YXRvIGJvYXJkLgoKU2lnbmVkLW9mZi1ieTog
TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdl
ZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbT4KCi0tLQoKQ2hhbmdlcyBpbiB2MjoKLSBBZGRlZCB0aGlzIHBhdGNo
CgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay55YW1sIHwg
NSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbAppbmRleCA0M2Zj
MzQxN2U3ODYuLmJiZTQ3NTc4ODQ3OSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbApAQCAtMTMxLDYgKzEzMSwxMSBAQCBwcm9w
ZXJ0aWVzOgogICAgICAgICAgIC0gZW51bToKICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgx
ODMtZXZiCiAgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTgzCisgICAgICAtIGRlc2Ny
aXB0aW9uOiBHb29nbGUgSGF5YXRvCisgICAgICAgIGl0ZW1zOgorICAgICAgICAgIC0gY29uc3Q6
IGdvb2dsZSxoYXlhdG8tcmV2MQorICAgICAgICAgIC0gY29uc3Q6IGdvb2dsZSxoYXlhdG8KKyAg
ICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTIKICAgICAgIC0gZGVzY3JpcHRpb246IEdv
b2dsZSBTcGhlcmlvbiAoQWNlciBDaHJvbWVib29rIDUxNCkKICAgICAgICAgaXRlbXM6CiAgICAg
ICAgICAgLSBjb25zdDogZ29vZ2xlLHNwaGVyaW9uLXJldjMKLS0gCjIuMzYuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
