Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFF1C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 19:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycYYR5o4bCRHN+MOdJzwkOdSUcJKWPUjyv2EP6M1FkA=; b=wqoA90NTOeV6B4
	9/7GL1leyCTeeUDdZjhPEI/tKn3BJgZ7Qhu48jIlxfKzHv4kbaCuyfZHfa1LxxwLTQpH6d6DNAe2n
	L9QKLf98wqfrq2C4kCbu9CCymypHEcFHYIjydZLIZWYIvwlOzxOi60AEqyYst1f4rS9pmtjZkz1y4
	PDdX3Auv98yhzMTY4IYqpzSxzSg5LHSHUgabJMtDssEpnRY8kzJV4rl/4QgZ+SsjUcTXUWRWUn/Qe
	h95EenQJ0YzpR8A+phei2ihD7E1sWswMV4To7v8saFSiI4zO9EiIo1SpxJ+RuA0tQ0+gRD6KxMvZC
	1ONHY4BxrtwUjRauf/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhS5-00HYkS-DG; Thu, 05 May 2022 19:47:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhQl-00HXkI-Kz; Thu, 05 May 2022 19:46:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 8D1111F45CCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651779990;
 bh=I6V1qhlJl3e4i+gbr+q91PTZx0jogs0Jp+BzGxZx2KE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TW06FaAmI0ySY7OshRtxKpiWkT8By/BDpG0/bMqo7BdF1ZvxjVqFAOC5wrNrVHtUR
 WJAkewcDestegsNrKlFxerdHr6Pl2+/5VHqy/oK0yu/aay2lc5zmHI6LalzT/spr1y
 89GihkT0L92RSIxX18NuevodbMabh6sZ+pbUyng3PIT16k8j5oioirdNbux/OmAghp
 iAVFdGyCWfy6tEkOxcIjwNrATs32aPF5eABgkKJJIo32jsiogZnwqCJ3lxMnAdemvb
 RqJDse0mK7FFnDO5WUTxS90w1F86oD1pFuM0EkMZMX9W6G6mP8rznAMg5ckXCycYYT
 /r4izLAdEGq+w==
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
Subject: [PATCH v2 06/16] arm64: dts: mediatek: asurada: Enable and configure
 I2C and SPI busses
Date: Thu,  5 May 2022 15:45:40 -0400
Message-Id: <20220505194550.3094656-7-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505194550.3094656-1-nfraprado@collabora.com>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_124631_844155_E350D92A 
X-CRM114-Status: UNSURE (   9.87  )
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

VGhlIEFzdXJhZGEgcGxhdGZvcm0gaGFzIGZpdmUgSTJDIGNvbnRyb2xsZXJzIGFuZCB0d28gU1BJ
IGNvbnRyb2xsZXJzCnRoYXQgYXJlIHVzZWQuIEluIHByZXBhcmF0aW9uIGZvciBlbmFibGluZyB0
aGUgZGV2aWNlcyBjb25uZWN0ZWQgdG8KdGhlc2UgY29udHJvbGxlcnMsIGVuYWJsZSBhbmQgY29u
ZmlndXJlIHRoZWlyIGJ1c3Nlcy4KClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFBy
YWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hp
bm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+Ci0t
LQoKKG5vIGNoYW5nZXMgc2luY2UgdjEpCgogLi4uL2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1h
c3VyYWRhLmR0c2kgICAgIHwgMTMwICsrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDEzMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDgxOTItYXN1cmFkYS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDgxOTItYXN1cmFkYS5kdHNpCmluZGV4IDVjYjc1ODBhMTNjZi4uM2M1YjFlNDc1Y2Y2IDEwMDY0
NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kK
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCkBA
IC04NSw2ICs4NSw0NyBAQCBwcHZhcl9zeXM6IHBwdmFyLXN5cyB7CiAJfTsKIH07CiAKKyZpMmMw
IHsKKwlzdGF0dXMgPSAib2theSI7CisKKwljbG9jay1mcmVxdWVuY3kgPSA8NDAwMDAwPjsKKwlw
aW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCXBpbmN0cmwtMCA9IDwmaTJjMF9waW5zPjsKK307
CisKKyZpMmMxIHsKKwlzdGF0dXMgPSAib2theSI7CisKKwljbG9jay1mcmVxdWVuY3kgPSA8NDAw
MDAwPjsKKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCXBpbmN0cmwtMCA9IDwmaTJjMV9w
aW5zPjsKK307CisKKyZpMmMyIHsKKwlzdGF0dXMgPSAib2theSI7CisKKwljbG9jay1mcmVxdWVu
Y3kgPSA8NDAwMDAwPjsKKwljbG9jay1zdHJldGNoLW5zID0gPDEyNjAwPjsKKwlwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOworCXBpbmN0cmwtMCA9IDwmaTJjMl9waW5zPjsKK307CisKKyZpMmMz
IHsKKwlzdGF0dXMgPSAib2theSI7CisKKwljbG9jay1mcmVxdWVuY3kgPSA8NDAwMDAwPjsKKwlw
aW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCXBpbmN0cmwtMCA9IDwmaTJjM19waW5zPjsKK307
CisKKyZpMmM3IHsKKwlzdGF0dXMgPSAib2theSI7CisKKwljbG9jay1mcmVxdWVuY3kgPSA8NDAw
MDAwPjsKKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCXBpbmN0cmwtMCA9IDwmaTJjN19w
aW5zPjsKK307CisKICZwaW8gewogCS8qIDIyMCBsaW5lcyAqLwogCWdwaW8tbGluZS1uYW1lcyA9
ICJJMlNfRFBfTFJDSyIsCkBAIC0zMTEsNiArMzUyLDk1IEBAICZwaW8gewogCQkJICAiQVVEX0RB
VF9NT1NJMSIsCiAJCQkgICJBVURfREFUX01JU08wIiwKIAkJCSAgIkFVRF9EQVRfTUlTTzEiOwor
CisJaTJjMF9waW5zOiBpMmMwLWRlZmF1bHQtcGlucyB7CisJCXBpbnMtYnVzIHsKKwkJCXBpbm11
eCA9IDxQSU5NVVhfR1BJTzIwNF9fRlVOQ19TQ0wwPiwKKwkJCQkgPFBJTk1VWF9HUElPMjA1X19G
VU5DX1NEQTA+OworCQkJYmlhcy1wdWxsLXVwOworCQkJbWVkaWF0ZWsscHVsbC11cC1hZHYgPSA8
Mz47CisJCQltZWRpYXRlayxkcml2ZS1zdHJlbmd0aC1hZHYgPSA8Nz47CisJCX07CisJfTsKKwor
CWkyYzFfcGluczogaTJjMS1kZWZhdWx0LXBpbnMgeworCQlwaW5zLWJ1cyB7CisJCQlwaW5tdXgg
PSA8UElOTVVYX0dQSU8xMThfX0ZVTkNfU0NMMT4sCisJCQkJIDxQSU5NVVhfR1BJTzExOV9fRlVO
Q19TREExPjsKKwkJCWJpYXMtcHVsbC11cDsKKwkJCW1lZGlhdGVrLHB1bGwtdXAtYWR2ID0gPDM+
OworCQkJbWVkaWF0ZWssZHJpdmUtc3RyZW5ndGgtYWR2ID0gPDc+OworCQl9OworCX07CisKKwlp
MmMyX3BpbnM6IGkyYzItZGVmYXVsdC1waW5zIHsKKwkJcGlucy1idXMgeworCQkJcGlubXV4ID0g
PFBJTk1VWF9HUElPMTQxX19GVU5DX1NDTDI+LAorCQkJCSA8UElOTVVYX0dQSU8xNDJfX0ZVTkNf
U0RBMj47CisJCQliaWFzLXB1bGwtdXA7CisJCQltZWRpYXRlayxwdWxsLXVwLWFkdiA9IDwzPjsK
KwkJCW1lZGlhdGVrLGRyaXZlLXN0cmVuZ3RoLWFkdiA9IDwwPjsKKwkJfTsKKwl9OworCisJaTJj
M19waW5zOiBpMmMzLWRlZmF1bHQtcGlucyB7CisJCXBpbnMtYnVzIHsKKwkJCXBpbm11eCA9IDxQ
SU5NVVhfR1BJTzE2MF9fRlVOQ19TQ0wzPiwKKwkJCQkgPFBJTk1VWF9HUElPMTYxX19GVU5DX1NE
QTM+OworCQkJYmlhcy1kaXNhYmxlOworCQkJbWVkaWF0ZWssZHJpdmUtc3RyZW5ndGgtYWR2ID0g
PDc+OworCQl9OworCX07CisKKwlpMmM3X3BpbnM6IGkyYzctZGVmYXVsdC1waW5zIHsKKwkJcGlu
cy1idXMgeworCQkJcGlubXV4ID0gPFBJTk1VWF9HUElPMTI0X19GVU5DX1NDTDc+LAorCQkJCSA8
UElOTVVYX0dQSU8xMjVfX0ZVTkNfU0RBNz47CisJCQliaWFzLWRpc2FibGU7CisJCQltZWRpYXRl
ayxkcml2ZS1zdHJlbmd0aC1hZHYgPSA8Nz47CisJCX07CisJfTsKKworCXNwaTFfcGluczogc3Bp
MS1kZWZhdWx0LXBpbnMgeworCQlwaW5zLWNzLW1vc2ktY2xrIHsKKwkJCXBpbm11eCA9IDxQSU5N
VVhfR1BJTzE1N19fRlVOQ19TUEkxX0FfQ1NCPiwKKwkJCQkgPFBJTk1VWF9HUElPMTU5X19GVU5D
X1NQSTFfQV9NTz4sCisJCQkJIDxQSU5NVVhfR1BJTzE1Nl9fRlVOQ19TUEkxX0FfQ0xLPjsKKwkJ
CWJpYXMtZGlzYWJsZTsKKwkJfTsKKworCQlwaW5zLW1pc28geworCQkJcGlubXV4ID0gPFBJTk1V
WF9HUElPMTU4X19GVU5DX1NQSTFfQV9NST47CisJCQliaWFzLXB1bGwtZG93bjsKKwkJfTsKKwl9
OworCisJc3BpNV9waW5zOiBzcGk1LWRlZmF1bHQtcGlucyB7CisJCXBpbnMtYnVzIHsKKwkJCXBp
bm11eCA9IDxQSU5NVVhfR1BJTzM4X19GVU5DX1NQSTVfQV9NST4sCisJCQkJIDxQSU5NVVhfR1BJ
TzM3X19GVU5DX0dQSU8zNz4sCisJCQkJIDxQSU5NVVhfR1BJTzM5X19GVU5DX1NQSTVfQV9NTz4s
CisJCQkJIDxQSU5NVVhfR1BJTzM2X19GVU5DX1NQSTVfQV9DTEs+OworCQkJYmlhcy1kaXNhYmxl
OworCQl9OworCX07Cit9OworCismc3BpMSB7CisJc3RhdHVzID0gIm9rYXkiOworCisJbWVkaWF0
ZWsscGFkLXNlbGVjdCA9IDwwPjsKKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCXBpbmN0
cmwtMCA9IDwmc3BpMV9waW5zPjsKK307CisKKyZzcGk1IHsKKwlzdGF0dXMgPSAib2theSI7CisK
Kwljcy1ncGlvcyA9IDwmcGlvIDM3IEdQSU9fQUNUSVZFX0xPVz47CisJbWVkaWF0ZWsscGFkLXNl
bGVjdCA9IDwwPjsKKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCXBpbmN0cmwtMCA9IDwm
c3BpNV9waW5zPjsKIH07CiAKICZ1YXJ0MCB7Ci0tIAoyLjM2LjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
