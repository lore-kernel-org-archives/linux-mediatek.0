Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062F2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 15:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fSypcts/ar1QaIW7lkiWybUQv4ZywoQR+ajbuDYoUlY=; b=DNYttwlzxHYTX6
	ccIdpX/s0Ah0FVAKylbwhx5fczzXziDf9a2KBkrYHS9UC9YhfxGTUx6NsD2C7OTMlCwKlZsrDlBle
	+O65aIHkPoLxS6PsBU2MaGH/5SBvsv+F81euBkaP2pyhyfiQwctw1Y0aG/6hteIhKPcViq54VK6E7
	5odxxxpNDdtGzleGShdCPiI7z1aIc+NUlb+1lhrtYziHt+L2e5IErHrcs2fEr3ZNtXiSsMtPu9Gsx
	dY/TaOOLAVwabZrmiPQjgG5Q04JkVYsR9oy1Xo9BWs/tAjEEHTHSOJsHjSoavb55ARKKHJLacoc/R
	PSBMmfeCD8aY7vpp9gzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVOg-00DTdu-Kx; Wed, 16 Mar 2022 15:17:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVLB-00DSEe-Lb; Wed, 16 Mar 2022 15:13:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id C951E1F44661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647443611;
 bh=jPM6xKtCPNZJwJ/DiHYFLek7T8L3dpESMA/tat5KKvc=;
 h=From:To:Cc:Subject:Date:From;
 b=fzKMEmzbsWa8oaNnpTpFzMhWn1w0yS505IAwyj3uMiAucpQlzFipEI8daQjZYn3or
 wy1i84wcSd4uK5QxICDrmNEkGdL/2VloPeinACJErIYwZEW5hML/KbqS5TeY4F0ta/
 2H4U0GC/6eX6m6ZF0nRBf3ZJkAuO8ye3MDhzWNWxu0dbhHw/7cHeS2+1qxRlT8PLwP
 QiOYBSOpDbQzpLV7lTR9rzraJLdJ6xUMBEqNZ2ha+njs+UbszGDLX0oGZKQwHM1/iJ
 7ktHaHQC01DmuFJCAxMVHXNgkdcK77XfnARW4pr+u6HRXaMVLGFRbAnkYYyDMHQE5J
 fvgbHVoPh94xg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 00/10] Introduce support for MediaTek MT8192 Google
 Chromebooks
Date: Wed, 16 Mar 2022 11:13:17 -0400
Message-Id: <20220316151327.564214-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_081333_879563_1CCBC7AC 
X-CRM114-Status: GOOD (  12.09  )
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

ClRoaXMgc2VyaWVzIGludHJvZHVjZXMgRGV2aWNldHJlZXMgZm9yIHRoZSBNVDgxOTItYmFzZWQg
QXN1cmFkYSBwbGF0Zm9ybQphcyB3ZWxsIGFzIEFzdXJhZGEgU3BoZXJpb24gYW5kIEFzdXJhZGEg
SGF5YXRvIGJvYXJkcy4KClN1cHBvcnQgZm9yIHRoZSBib2FyZHMgaXMgYWRkZWQgdG8gdGhlIGV4
dGVudCB0aGF0IGlzIGN1cnJlbnRseSBlbmFibGVkCmluIHRoZSBtdDgxOTIuZHRzaSwgYXMgdG8g
bm90IGFkZCBhbnkgZGVwZW5kZW5jaWVzIHRvIHRoaXMgc2VyaWVzLgoKQWZ0ZXIgdGhlIHNlcmll
cyBhZGRpbmcgdmFyaW91cyBtaXNzaW5nIG5vZGVzIG9uIE1UODE5MiBbMV0gaXMgbWVyZ2VkLCBh
Cm5ldyBzZXJpZXMgd2lsbCBiZSBzZW50IGVuYWJsaW5nIHRoZSByZW1haW5pbmcgZGV2aWNlcyBv
biB0aGUgQXN1cmFkYQpwbGF0Zm9ybS4KCldoaWxlIHRoZSBkdHMgZmlsZXMgYWRkZWQgaW4gdGhp
cyBzZXJpZXMgaW50cm9kdWNlIGEgY291cGxlIG5ldwpkdGJzX2NoZWNrIHdhcm5pbmdzLCB0aGV5
IGFyZSBmaXhlZCBieSBhbm90aGVyIHNlcmllcyBbMl0uCgpUaGlzIHNlcmllcyB3YXMgcGVlci1y
ZXZpZXdlZCBpbnRlcm5hbGx5IGJlZm9yZSBzdWJtaXNzaW9uLgoKWzFdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LW1lZGlhdGVrLzIwMjIwMzA0MTMwODA5LjEyOTI0LTEtYWxsZW4ta2gu
Y2hlbmdAbWVkaWF0ZWsuY29tLwpbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVk
aWF0ZWsvMjAyMjAzMTUyMTE5MzYuNDQyNzA4LTEtbmZyYXByYWRvQGNvbGxhYm9yYS5jb20vCgoK
TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gKDEwKToKICBhcm02NDogZHRzOiBtZWRpYXRlazogSW50
cm9kdWNlIE1UODE5Mi1iYXNlZCBBc3VyYWRhIGJvYXJkIGZhbWlseQogIGFybTY0OiBkdHM6IG1l
ZGlhdGVrOiBhc3VyYWRhOiBEb2N1bWVudCBHUElPIG5hbWVzCiAgYXJtNjQ6IGR0czogbWVkaWF0
ZWs6IGFzdXJhZGE6IEFkZCBzeXN0ZW0td2lkZSBwb3dlciBzdXBwbGllcwogIGFybTY0OiBkdHM6
IG1lZGlhdGVrOiBhc3VyYWRhOiBFbmFibGUgYW5kIGNvbmZpZ3VyZSBJMkMgYW5kIFNQSSBidXNz
ZXMKICBhcm02NDogZHRzOiBtZWRpYXRlazogYXN1cmFkYTogQWRkIENocm9tZU9TIEVDCiAgYXJt
NjQ6IGR0czogbWVkaWF0ZWs6IGFzdXJhZGE6IEFkZCBrZXlib2FyZCBtYXBwaW5nIGZvciB0aGUg
dG9wIHJvdwogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRhOiBBZGQgQ3I1MCBUUE0KICBh
cm02NDogZHRzOiBtZWRpYXRlazogYXN1cmFkYTogQWRkIEVsYW4gZUtUSDMwMDAgSTJDIHRyYWNr
cGFkCiAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IGFzdXJhZGE6IEFkZCBJMkMgdG91Y2hzY3JlZW4K
ICBhcm02NDogZHRzOiBtZWRpYXRlazogc3BoZXJpb246IEFkZCBrZXlib2FyZCBiYWNrbGlnaHQK
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgfCAgIDIgKwog
Li4uL2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1oYXlhdG8tcjEuZHRzIHwgIDE4ICsKIC4u
Li9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1zcGhlcmlvbi1yMC5kdHMgICB8ICAzMyArCiAuLi4v
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaSAgICAgfCA2MTYgKysrKysrKysr
KysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDY2OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS1oYXlh
dG8tcjEuZHRzCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDgxOTItYXN1cmFkYS1zcGhlcmlvbi1yMC5kdHMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKCi0tIAoyLjM1LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
