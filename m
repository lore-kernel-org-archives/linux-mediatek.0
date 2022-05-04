Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8729C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 21:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3+S+F/BHSU1DlHJrs5CI+72tszJO9ll8lilkzV2u87E=; b=OwWtZgIRg6JY0l
	NEyqb37/Heetn+qguLFjThKAtgNGkALDuK+6eP5ieJxN3Y+UVPhelVirjnXfGSb1ip+VMgY961Qv0
	qRftukkx6DNeHTBX+OcolpjpcHOxcQYiL83Tafa4NvajT3Y7haGuNUVp7IkUn7VhCIie1Mi8Td5KF
	ELcC4hFseoMeBlF0rHQOTfgSIkeYJH07o3S/x/IKnF0FQPQBZvrwHO1biKbm9KvtM+dBdKXoe4RJp
	YiDYxkKk9C3DU6iP7WXvv0soylxjun6Fx9++qh2Ssq6bRqEp7RGshK95xC546PTlueRTtKFM9u0rT
	z2c2LPRUpZenfgLXfO6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmMsv-00Cxlk-Nx; Wed, 04 May 2022 21:50:13 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmMoH-00CvYO-8g; Wed, 04 May 2022 21:45:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id B99F11F41850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651700722;
 bh=Z7NLVHuEUzvqWLpcaKnXuMWP4ACDh+2QKtdBRgPicLc=;
 h=From:To:Cc:Subject:Date:From;
 b=L491H02D+stl9mpJt8KqtKfQIdnAWesP8IEqv2bdhouKHphRLWr+qGK9FCWkd+goz
 4Fnk969QWT+ahqTdlJ+k8Kj4ZYns29cFez5hXpYJOyJQZt7xNuTHsefd+E7YbrSnar
 xqqlLvp9/ZdtCD+0vEwPnOsBpbrSVdmCforbPdCQr+ow272x4C5L1+Q/xCVzUZUbIQ
 V5ArZLlOksM0ycMMm260iwFbizDJTMsIG6Mj1pmg93r8QniLfyBW9uOucJJ0g45NpD
 rjzt4D9UVtEGZl9/RWxjlXaYjQtBv9l4NDbCNXqr4sE0dxFNonEqsnpUeYjWexwPS0
 sZrRiVLaSLgJQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2] arm64: dts: mt8192: Follow binding order for SCP registers
Date: Wed,  4 May 2022 17:45:16 -0400
Message-Id: <20220504214516.2957504-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_144525_493808_4B37D1AB 
X-CRM114-Status: GOOD (  11.64  )
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

VGhlIGR0LWJpbmRpbmcgZm9yIFNDUCBkb2N1bWVudHMgdGhlIHJlZy1uYW1lcyBvcmRlciBhcyBz
cmFtLCBjZmcsCmwxdGNtLiBVcGRhdGUgdGhlIFNDUCBub2RlIG9uIHRoZSBtdDgxOTIgZGV2aWNl
dHJlZSB0byBmb2xsb3cgdGhhdApvcmRlciwgd2hpY2ggZ2V0cyByaWQgb2YgYSBkdGJzX2NoZWNr
IHdhcm5pbmcuIFRoaXMgZG9lc24ndCBjaGFuZ2UgYW55CmJlaGF2aW9yIHNpbmNlIHRoZSBTQ1Ag
ZHJpdmVyIGFjY2Vzc2VzIHRoZSBtZW1vcnkgcmVnaW9ucyB0aHJvdWdoIHRoZQpuYW1lcyBhbnl3
YXkuCgpGaXhlczogYzYzNTU2ZWM2YmZlICgiYXJtNjQ6IGR0czogbXQ4MTkyOiBBZGQgU0NQIG5v
ZGUiKQpTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNv
bGxhYm9yYS5jb20+CgotLS0KCkNoYW5nZXMgaW4gdjI6Ci0gQWRkZWQgbWlzc2luZyBGaXhlcyB0
YWcKCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpIHwgNiArKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaSBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKaW5kZXggMjZkYmU5ZWNjNTI4Li43MzNh
ZWMyZTdmNzcgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTky
LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQpAQCAt
Njk5LDkgKzY5OSw5IEBAIHNwaTc6IHNwaUAxMTAxZTAwMCB7CiAJCXNjcDogc2NwQDEwNTAwMDAw
IHsKIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLXNjcCI7CiAJCQlyZWcgPSA8MCAw
eDEwNTAwMDAwIDAgMHgxMDAwMDA+LAotCQkJICAgICAgPDAgMHgxMDcwMDAwMCAwIDB4ODAwMD4s
Ci0JCQkgICAgICA8MCAweDEwNzIwMDAwIDAgMHhlMDAwMD47Ci0JCQlyZWctbmFtZXMgPSAic3Jh
bSIsICJsMXRjbSIsICJjZmciOworCQkJICAgICAgPDAgMHgxMDcyMDAwMCAwIDB4ZTAwMDA+LAor
CQkJICAgICAgPDAgMHgxMDcwMDAwMCAwIDB4ODAwMD47CisJCQlyZWctbmFtZXMgPSAic3JhbSIs
ICJjZmciLCAibDF0Y20iOwogCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDQzNSBJUlFfVFlQRV9M
RVZFTF9ISUdIIDA+OwogCQkJY2xvY2tzID0gPCZpbmZyYWNmZyBDTEtfSU5GUkFfU0NQU1lTPjsK
IAkJCWNsb2NrLW5hbWVzID0gIm1haW4iOwotLSAKMi4zNi4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
