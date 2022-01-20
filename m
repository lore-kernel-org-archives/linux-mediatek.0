Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F95C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 22:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iMGYuk5XXKztSATu+C6KAdPb+NAX10Usp68C7quWAmc=; b=w9NhZ4LtdzgFMU
	JHlsJEmUNBJAC/wLixH3ZX6uM1gDy0Dm3hh6if60pb/PaMMYuEfYmAtrFRyfQHHsjafViPMOovbUQ
	dLg6koEY9scK3xpb5zjOdpF8eUs9lDEJaD2towR5sL2K66NIYJb6LAls8Au3MZk6NvkgE4t1XLOy5
	jhby5h5u6zKv6/rXY1lunDXkP4YC3EhJpTeRnl/3lWnM7TDU2T8nakIdJxL9yQ/5l5opH7FbFyeT3
	IQ69ZXCDvQQkoGNH2chqpVBZA9lsHxphqbCux9XSQZRUJm/tgOJgCxkduvYBzhmIY4yIya5BXXrMe
	uJrS6dHPnJJpCUnctsNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAg8k-00DK8Q-QJ; Thu, 20 Jan 2022 22:42:46 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAg8Z-00DK5H-7N; Thu, 20 Jan 2022 22:42:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id D44951F40EF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642718549;
 bh=n9nzvUGdd1YQiFhmJQVwJMExyCSnYF3MN5S9On1se6k=;
 h=From:To:Cc:Subject:Date:From;
 b=Gx5LGmfVs1pDMMfMa4ZSil6InBzCwhMelXygPbxag4PlZhUA9YcwTAYl3Qn1lShLR
 Ri9pMcNH1Wxs/JEAEQBMZIrYjI0I7nAxpAQQUZ0rwR/v+cOUQl5fuC2iTyxBIQMNmH
 3ZbngxScmE/R8tVwzUkpdJQRY9uuym5U4ANVRTVzaxOO4UbWMSzhqrFLBbp9Td4qSY
 Mh+A0iDMvExPLmIo0SRKHOUxIcPur+beeqjRquZaPTm6EGmQTDiaeGknjW3fzPHftS
 yDC15r8UABRks9IXEmfmcZgB09bgbdx+eDmiXsM+zF5WppR3+DHB1A6+vYW6tGeCwK
 G3fEtBwmR1bNw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Xin Ji <xji@analogixsemi.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
Subject: [PATCH] arm64: dts: mt8183: jacuzzi: Fix bus properties in anx's DSI
 endpoint
Date: Thu, 20 Jan 2022 17:42:04 -0500
Message-Id: <20220120224204.773117-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_144235_443576_513A1854 
X-CRM114-Status: GOOD (  10.85  )
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

bXQ4MTgzLWt1a3VpLWphY3V6emkgaGFzIGFuIGFueDc2MjUgYnJpZGdlIGNvbm5lY3RlZCB0byB0
aGUgb3V0cHV0IG9mCml0cyBEU0kgaG9zdC4gSG93ZXZlciwgYWZ0ZXIgZmQwMzEwYjZmZTdkICgi
ZHJtL2JyaWRnZTogYW54NzYyNTogYWRkCk1JUEkgRFBJIGlucHV0IGZlYXR1cmUiKSwgYSBidXMt
dHlwZSBwcm9wZXJ0eSBzdGFydGVkIGJlaW5nIHJlcXVpcmVkIGluCnRoZSBlbmRwb2ludCBub2Rl
IGJ5IHRoZSBkcml2ZXIgdG8gaW5kaWNhdGUgd2hldGhlciBpdCBpcyBEU0kgb3IgRFBJLgoKQWRk
IHRoZSBtaXNzaW5nIGJ1cy10eXBlIHByb3BlcnR5IGFuZCBzZXQgaXQgdG8gNQooVjRMMl9GV05P
REVfQlVTX1RZUEVfUEFSQUxMRUwpIHNvIHRoYXQgdGhlIGRyaXZlciBoYXMgaXRzIGlucHV0CmNv
bmZpZ3VyZWQgdG8gRFNJIGFuZCB0aGUgZGlzcGxheSBwaXBlbGluZSBjYW4gcHJvYmUgY29ycmVj
dGx5LgoKV2hpbGUgYXQgaXQsIGFsc28gc2V0IHRoZSBkYXRhLWxhbmVzIHByb3BlcnR5IHRoYXQg
d2FzIGFsc28gaW50cm9kdWNlZAppbiB0aGF0IHNhbWUgY29tbWl0LCBzbyB0aGF0IHdlIGRvbid0
IHJlbHkgb24gdGhlIGRlZmF1bHQgdmFsdWUuCgpGaXhlczogZmQwMzEwYjZmZTdkICgiZHJtL2Jy
aWRnZTogYW54NzYyNTogYWRkIE1JUEkgRFBJIGlucHV0IGZlYXR1cmUiKQpTaWduZWQtb2ZmLWJ5
OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Ci0tLQog
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWktamFjdXp6aS5kdHNpIHwg
MiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWt1a3VpLWphY3V6emkuZHRzaSBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWt1a3VpLWphY3V6emkuZHRzaQppbmRleCA4
ZjdiZjMzZjYwN2QuLmU4ZjEzM2RjOTZiOSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxODMta3VrdWktamFjdXp6aS5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWt1a3VpLWphY3V6emkuZHRzaQpAQCAtMTcxLDYgKzE3MSw4
IEBAIHBvcnRAMCB7CiAKIAkJCWFueDc2MjVfaW46IGVuZHBvaW50IHsKIAkJCQlyZW1vdGUtZW5k
cG9pbnQgPSA8JmRzaV9vdXQ+OworCQkJCWJ1cy10eXBlID0gPDU+OworCQkJCWRhdGEtbGFuZXMg
PSA8MCAxIDIgMz47CiAJCQl9OwogCQl9OwogCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
