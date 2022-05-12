Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2919C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 20:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWN/IW++6aEbq38DTUF1SJHnAs0STRV5jogXE9yat5o=; b=L9iBCFgCb5z1VI
	cnoFyiXZNqowBuhEWZmcPYcwlp2j6XxGiWq6qY6iMt763+a0M62PhKdTOjcWZlzj9sTvrO5yBBmIa
	0XN2xD7OFQ7eT0tIQaVDQk7QWPk0Bn8vb8P9OgjGUXXP4i/FFgUxtUtHmyfr7hH7tm+xqtQNxXFjj
	Fc36yCY2Ou43dhGWc7DnDqh42s/TF6wGqExBng8J8ZvK4gnQCNk2j3+ynUy2EPP3tqeVdMJspLFVZ
	p5937wRZXF0Sr4BZgxPUIdvts8+SJJobY01EPdUWf6bf58UyGkSpWGYiR1t28vHjLzaq4J4XCd5xP
	5V/wzqc67TCQghbk6hGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFrg-00DRTW-06; Thu, 12 May 2022 20:56:52 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFr7-00DR7n-8L; Thu, 12 May 2022 20:56:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 88FDF1F4585F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652388974;
 bh=kTECtCnCJdyMoV3IS+2RVEgM65NrW1WbxMJuwruw03E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OXGD2zK3BE4xVxhQRivWQ0Itlq3pyAv1CSGziKJxycwm2Fb3SAnnBMOcrfMvJKvey
 urb3gzBfaBXh/qD+brsNxa8idBkeEYaRhs5N/pGBg1XNxzjvDZU7E1VbdI7fTW5vZL
 IcEp7H+Z9L62xLkAPhf+9tBC1YW/SO92xkB9rEHLNKkd3nYnXA1m/jBMmUudWMYK2W
 9BnT44SeLsbn+AxV8YZQiVkxAZBpyggxXQ5iAMEwo3lhE7RJwdHNLXh0G4P+mcsaSz
 egxU8BuvImVb0nm2YATqRnz8OwFfFcBdTPjwEnQqm5iNGMQGRl0rq3woqGstUNT3RM
 Qyyed422g6UVQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxim Kutnij <gtk3@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 02/16] dt-bindings: arm64: dts: mediatek: Add
 mt8192-asurada-hayato
Date: Thu, 12 May 2022 16:55:48 -0400
Message-Id: <20220512205602.158273-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512205602.158273-1-nfraprado@collabora.com>
References: <20220512205602.158273-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_135617_464655_8EF134EA 
X-CRM114-Status: UNSURE (   9.28  )
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
bm9AY29sbGFib3JhLmNvbT4KVGVzdGVkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnN0QGNocm9taXVt
Lm9yZz4KQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgotLS0KCihubyBj
aGFuZ2VzIHNpbmNlIHYyKQoKQ2hhbmdlcyBpbiB2MjoKLSBBZGRlZCB0aGlzIHBhdGNoCgogRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay55YW1sIHwgNSArKysr
KwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbAppbmRleCA0M2ZjMzQxN2U3
ODYuLmJiZTQ3NTc4ODQ3OSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9tZWRpYXRlay55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbApAQCAtMTMxLDYgKzEzMSwxMSBAQCBwcm9wZXJ0aWVz
OgogICAgICAgICAgIC0gZW51bToKICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODMtZXZi
CiAgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTgzCisgICAgICAtIGRlc2NyaXB0aW9u
OiBHb29nbGUgSGF5YXRvCisgICAgICAgIGl0ZW1zOgorICAgICAgICAgIC0gY29uc3Q6IGdvb2ds
ZSxoYXlhdG8tcmV2MQorICAgICAgICAgIC0gY29uc3Q6IGdvb2dsZSxoYXlhdG8KKyAgICAgICAg
ICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTIKICAgICAgIC0gZGVzY3JpcHRpb246IEdvb2dsZSBT
cGhlcmlvbiAoQWNlciBDaHJvbWVib29rIDUxNCkKICAgICAgICAgaXRlbXM6CiAgICAgICAgICAg
LSBjb25zdDogZ29vZ2xlLHNwaGVyaW9uLXJldjMKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
