Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120AAC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbtyXOTyyGt9tWMaOIt9RYbssgXHubg5HfyDPQ3N+Ec=; b=zVpXomZNIDMlPh
	5NJX489Yl+mdGcEG2khjb2N0sCUGAYZB3axjyAWGUCEEapP0lMKrThB69Q5fJhbHDPaNH+H4lNLzd
	cDC4AlgFithln2/sFxVa1ypQRF5ny07kCwBu/nXrEXVpUYshjh+0xMIbLChDDUHHvlkGzDJoQxhuW
	OrzkhD0YG8Bs1Nhwa5hGopZtbvnI3THAWu4iP7akcRLWh9YAA92cyokyWgOu8V3Q0GYMWINyVM6qe
	2FEs+mXdLUg2C/3hv6KIAXZcGboOBkjf6dCMcUr3GY1WCFFG1HP087mFcVJmTiXWp1V4UJGEQmSxl
	tQ4ZkpVC7nJf1jnls/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVX1-00DWxP-4h; Wed, 16 Mar 2022 15:25:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVLL-00DSLI-TH; Wed, 16 Mar 2022 15:13:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 8E8691F44699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647443622;
 bh=/bhUnlYrfsDoQs+TNn3x9vAxRBVThPY75bVuGDqvUHc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xev6M37ThJ7B5XZLX6Q+n2iHghpH/+e9tfo2nYJOl6J1bwh4RKsp35BngBcse0qMN
 g6MTwYFglWVkWDvI+DxEts7TYamFkFi7SuJB6aHFgIRiecAz/YrfesTduJcz2BRTiB
 7wxHq3rZ1uzTVqoj+RRtrWfr4KtynQ/nYco66bb+Z+rnNMDOHqMoqme7iER0k8qGFR
 tbtkks7BsKP8/1qRDAeTvJElH2TTEnNGtBGBwvjNqOjEY9TrmvIh2NPeunixYXqMFR
 ywIDgjQbsu7YA20oJ8ssPysp1NROFRRQdA1FKRKsOgZ6gPgmi33fG/i1qBn9TsivqZ
 i3N54e9f2TUEg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 08/10] arm64: dts: mediatek: asurada: Add Elan eKTH3000 I2C
 trackpad
Date: Wed, 16 Mar 2022 11:13:25 -0400
Message-Id: <20220316151327.564214-9-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316151327.564214-1-nfraprado@collabora.com>
References: <20220316151327.564214-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_081344_171343_DDD037D0 
X-CRM114-Status: UNSURE (   9.75  )
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

QWRkIHN1cHBvcnQgZm9yIHRoZSBFbGFuIGVLVEgzMDAwIGkyYyB0cmFja3BhZCBwcmVzZW50IG9u
IEFzdXJhZGEuIEl0IGlzCmNvbm5lY3RlZCB0byB0aGUgSTJDMiBidXMgYW5kIGhhcyBhZGRyZXNz
IDB4MTUuCgpTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRv
QGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8
YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgotLS0KCiAuLi4vYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaSAgICAgIHwgMTggKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaSBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQppbmRleCAzYjRjNzRkNWQ1YzMu
LmI5MTFmNGZjMzAzOCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDgxOTItYXN1cmFkYS5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4
MTkyLWFzdXJhZGEuZHRzaQpAQCAtMTA5LDYgKzEwOSwxNiBAQCAmaTJjMiB7CiAJY2xvY2stc3Ry
ZXRjaC1ucyA9IDwxMjYwMD47CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKIAlwaW5jdHJs
LTAgPSA8JmkyYzJfcGlucz47CisKKwl0cmFja3BhZEAxNSB7CisJCWNvbXBhdGlibGUgPSAiZWxh
bixla3RoMzAwMCI7CisJCXJlZyA9IDwweDE1PjsKKwkJaW50ZXJydXB0cy1leHRlbmRlZCA9IDwm
cGlvIDE1IElSUV9UWVBFX0xFVkVMX0xPVz47CisJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7
CisJCXBpbmN0cmwtMCA9IDwmdHJhY2twYWRfcGlucz47CisJCXZjYy1zdXBwbHkgPSA8JnBwMzMw
MF91PjsKKwkJd2FrZXVwLXNvdXJjZTsKKwl9OwogfTsKIAogJmkyYzMgewpAQCAtNDQwLDYgKzQ1
MCwxNCBAQCBwaW5zLWJ1cyB7CiAJCQliaWFzLWRpc2FibGU7CiAJCX07CiAJfTsKKworCXRyYWNr
cGFkX3BpbnM6IHRyYWNrcGFkLWRlZmF1bHQtcGlucyB7CisJCXBpbnMtaW50LW4geworCQkJcGlu
bXV4ID0gPFBJTk1VWF9HUElPMTVfX0ZVTkNfR1BJTzE1PjsKKwkJCWlucHV0LWVuYWJsZTsKKwkJ
CW1lZGlhdGVrLHB1bGwtdXAtYWR2ID0gPDM+OworCQl9OworCX07CiB9OwogCiAmc3BpMSB7Ci0t
IAoyLjM1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
