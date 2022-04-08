Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAA0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 01:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/pSvn7xfTFuJPqDZ8pcENtYqaPaVYERC7kSGnUHOhZg=; b=T4e5TEpxHsju/b
	zoo1yZXxQxZ4/l223myN6tRccgQ7z8meb8ZAAb1u1woeqIc/maD7yO4X3T76lu9VmhDaBKzUKxvNk
	F8tOhGoGuSr0gCiAWzLm0c9YRr30OPqwabosFRlMmqxZyDjtrSTAdw0QOarGtPMfwforuPzFjfs+o
	6rcejudcQABaDdmka7loR0MH5+brjigjXShWAG/9iHMGXd6nyGUdxaWrwQYG6os6jxxIxLbLe9t14
	mugXJ7/CBAfhVupVCZawya4VzJSsa4i+8P5e7TweQYrrlkIxNh95wQHGFnyGKwUhOoQmEBDC458XO
	4tKc+WVnhJLVbWOgiOtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncdHb-00EWJX-Mz; Fri, 08 Apr 2022 01:19:27 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncdHQ-00EWGR-9J; Fri, 08 Apr 2022 01:19:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 8FD2F1F46B10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649380752;
 bh=DRF0VVql1NDF1AFBXdreQkrM736cxZe8TLofRJp+rIE=;
 h=From:To:Cc:Subject:Date:From;
 b=CzKotq9B/GtJeR8NyobQE7fpb4jsG3di7QvNmI8YKfpttbMaevDT9Uf0OdhsDS3Wq
 kW0OUMPFd8j73Nlc3Lx7iohdfUWUeC1u6t+C0BUkKMEfMlejJb/BOwbGK3j4oiaQzl
 zV1wC6Be1FGMR6a/4BlZpDjMns3t8ZmMr6qU8M/9H3+myE196Vsk92YjgRydOUwQhB
 F1h6D4bzcLn4Cau+hHx5IL9LmniCCecJfT4lHOneb0gonTu8akKH5rN3Lxdb82jKcK
 rYHceKabJgfRjDlxubAvqcymueNkYSqbcd2MEn7p1ifNkTqfkboJOVEsqsCUZcY+/0
 Qj2e/jOnJFqkA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: dpi: Use mt8183 output formats for mt8192
Date: Thu,  7 Apr 2022 21:19:07 -0400
Message-Id: <20220408011907.672120-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_181916_571245_603C3622 
X-CRM114-Status: GOOD (  12.91  )
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

VGhlIGNvbmZpZ3VyYXRpb24gZm9yIG10ODE5MiB3YXMgaW5jb3JyZWN0bHkgdXNpbmcgdGhlIG91
dHB1dCBmb3JtYXRzCmZyb20gbXQ4MTczLiBTaW5jZSB0aGUgb3V0cHV0IGZvcm1hdHMgZm9yIG10
ODE5MiBhcmUgaW5zdGVhZCB0aGUgc2FtZQpvbmVzIGFzIGZvciBtdDgxODMsIHdoaWNoIHJlcXVp
cmUgdHdvIGJ1cyBzYW1wbGVzIHBlciBwaXhlbCwgdGhlCnBpeGVsY2xvY2sgYW5kIEREUiBlZGdl
IHNldHRpbmcgd2VyZSBtaXNjb25maWd1cmVkLiBUaGlzIG1hZGUgZXh0ZXJuYWwKZGlzcGxheXMg
dW5hYmxlIHRvIHNob3cgdGhlIGltYWdlLgoKRml4IHRoZSBpc3N1ZSBieSBjb3JyZWN0aW5nIHRo
ZSBvdXRwdXQgZm9ybWF0IGZvciBtdDgxOTIgdG8gYmUgdGhlIHNhbWUKYXMgZm9yIG10ODE4Mywg
Zml4aW5nIHRoZSB1c2FnZSBvZiBleHRlcm5hbCBkaXNwbGF5cyBmb3IgbXQ4MTkyLgoKU2lnbmVk
LW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29t
PgoKLS0tCgogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcGkuYwppbmRleCA0NTU0ZTJkZTE0MzAuLmU2MWNkNjdiOTc4ZiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCkBAIC04MTksOCArODE5LDggQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTkyX2NvbmYgPSB7CiAJLmNhbF9mYWN0b3IgPSBtdDgx
ODNfY2FsY3VsYXRlX2ZhY3RvciwKIAkucmVnX2hfZnJlX2NvbiA9IDB4ZTAsCiAJLm1heF9jbG9j
a19raHogPSAxNTAwMDAsCi0JLm91dHB1dF9mbXRzID0gbXQ4MTczX291dHB1dF9mbXRzLAotCS5u
dW1fb3V0cHV0X2ZtdHMgPSBBUlJBWV9TSVpFKG10ODE3M19vdXRwdXRfZm10cyksCisJLm91dHB1
dF9mbXRzID0gbXQ4MTgzX291dHB1dF9mbXRzLAorCS5udW1fb3V0cHV0X2ZtdHMgPSBBUlJBWV9T
SVpFKG10ODE4M19vdXRwdXRfZm10cyksCiB9OwogCiBzdGF0aWMgaW50IG10a19kcGlfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKLS0gCjIuMzUuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
