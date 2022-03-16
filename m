Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08199C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 15:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjdE8K8ycO+6lWzCSpWw01ZPGEktVcW/z1l9V1PkBRc=; b=fOQvLZivBhJyAd
	ZihuWTFAHDsPQdPKwBvk96DhdUY+ys6PHfhdEtP2hQ2wO2FeVjtnskWlqYOid8mvxtrqBX7zgrhQA
	rXrR20I76WH5expLnuO+phk4cXsHcjyermJQ3gXpIN+0nJCmxo5PwOqpMSRouaziRgSnj2GpxHmBN
	iPUxYou5BLsHGlBL3w5ezi6Fv79UOecwnHntGZYSe6txItgX6BMKr0nj4IAzz5h5TsE+A2xQ8nt8x
	2IWHYdfJvCgZ6YWwN3lT8fD323lCi3wyZWkiLVDRvOdXH34vxGN2yAjb8TUbJK7N8UXpyl/cw54TP
	BjOe2GFMCeQv1W4VFGew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVT6-00DVPx-WA; Wed, 16 Mar 2022 15:21:45 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVLG-00DSI7-D1; Wed, 16 Mar 2022 15:13:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 298211F4467E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647443617;
 bh=t5bAb94VXfBDVM8bnyfOVDys57n3UV6MaXzdmkwM90Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RynSvKpHpCH/C9/GmIJFRLeCD+h1B58erwCcKUaBI73V7AdzKqYo9Fc6IH6tJAuXm
 K8vwVs1T3lgiiRe6vl06lF6sWt5G0TNZfVRaI8HNhj00mH5KZZWis4WPXuv4Lqi7Dg
 1YmAu8XI4fBnrDO6rMkIUEax//HIMKeDWWX3GoPOY9HIbvsumQxXDTkb6HONA7p71Y
 1HQph4mPPUN1bPtz2kIOeKqcLoZba6TgediAI5/LFek38xMhPr3zRwoUX5vqB/j0VZ
 xqgJG+N1MiHZ4574DAToifvHMvOQwA2gV5Rpg1V1FVD/AlpIA2s0ASc7twa2l1d8bV
 sSK1K93d39NAw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 04/10] arm64: dts: mediatek: asurada: Enable and configure
 I2C and SPI busses
Date: Wed, 16 Mar 2022 11:13:21 -0400
Message-Id: <20220316151327.564214-5-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316151327.564214-1-nfraprado@collabora.com>
References: <20220316151327.564214-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_081338_643247_62965E0A 
X-CRM114-Status: UNSURE (   9.96  )
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
LQoKIC4uLi9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpICAgICB8IDEzMCAr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMzAgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRz
aSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQppbmRl
eCA1Y2I3NTgwYTEzY2YuLjNjNWIxZTQ3NWNmNiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQpAQCAtODUsNiArODUsNDcgQEAgcHB2YXJf
c3lzOiBwcHZhci1zeXMgewogCX07CiB9OwogCismaTJjMCB7CisJc3RhdHVzID0gIm9rYXkiOwor
CisJY2xvY2stZnJlcXVlbmN5ID0gPDQwMDAwMD47CisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKKwlwaW5jdHJsLTAgPSA8JmkyYzBfcGlucz47Cit9OworCismaTJjMSB7CisJc3RhdHVzID0g
Im9rYXkiOworCisJY2xvY2stZnJlcXVlbmN5ID0gPDQwMDAwMD47CisJcGluY3RybC1uYW1lcyA9
ICJkZWZhdWx0IjsKKwlwaW5jdHJsLTAgPSA8JmkyYzFfcGlucz47Cit9OworCismaTJjMiB7CisJ
c3RhdHVzID0gIm9rYXkiOworCisJY2xvY2stZnJlcXVlbmN5ID0gPDQwMDAwMD47CisJY2xvY2st
c3RyZXRjaC1ucyA9IDwxMjYwMD47CisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwlwaW5j
dHJsLTAgPSA8JmkyYzJfcGlucz47Cit9OworCismaTJjMyB7CisJc3RhdHVzID0gIm9rYXkiOwor
CisJY2xvY2stZnJlcXVlbmN5ID0gPDQwMDAwMD47CisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKKwlwaW5jdHJsLTAgPSA8JmkyYzNfcGlucz47Cit9OworCismaTJjNyB7CisJc3RhdHVzID0g
Im9rYXkiOworCisJY2xvY2stZnJlcXVlbmN5ID0gPDQwMDAwMD47CisJcGluY3RybC1uYW1lcyA9
ICJkZWZhdWx0IjsKKwlwaW5jdHJsLTAgPSA8JmkyYzdfcGlucz47Cit9OworCiAmcGlvIHsKIAkv
KiAyMjAgbGluZXMgKi8KIAlncGlvLWxpbmUtbmFtZXMgPSAiSTJTX0RQX0xSQ0siLApAQCAtMzEx
LDYgKzM1Miw5NSBAQCAmcGlvIHsKIAkJCSAgIkFVRF9EQVRfTU9TSTEiLAogCQkJICAiQVVEX0RB
VF9NSVNPMCIsCiAJCQkgICJBVURfREFUX01JU08xIjsKKworCWkyYzBfcGluczogaTJjMC1kZWZh
dWx0LXBpbnMgeworCQlwaW5zLWJ1cyB7CisJCQlwaW5tdXggPSA8UElOTVVYX0dQSU8yMDRfX0ZV
TkNfU0NMMD4sCisJCQkJIDxQSU5NVVhfR1BJTzIwNV9fRlVOQ19TREEwPjsKKwkJCWJpYXMtcHVs
bC11cDsKKwkJCW1lZGlhdGVrLHB1bGwtdXAtYWR2ID0gPDM+OworCQkJbWVkaWF0ZWssZHJpdmUt
c3RyZW5ndGgtYWR2ID0gPDc+OworCQl9OworCX07CisKKwlpMmMxX3BpbnM6IGkyYzEtZGVmYXVs
dC1waW5zIHsKKwkJcGlucy1idXMgeworCQkJcGlubXV4ID0gPFBJTk1VWF9HUElPMTE4X19GVU5D
X1NDTDE+LAorCQkJCSA8UElOTVVYX0dQSU8xMTlfX0ZVTkNfU0RBMT47CisJCQliaWFzLXB1bGwt
dXA7CisJCQltZWRpYXRlayxwdWxsLXVwLWFkdiA9IDwzPjsKKwkJCW1lZGlhdGVrLGRyaXZlLXN0
cmVuZ3RoLWFkdiA9IDw3PjsKKwkJfTsKKwl9OworCisJaTJjMl9waW5zOiBpMmMyLWRlZmF1bHQt
cGlucyB7CisJCXBpbnMtYnVzIHsKKwkJCXBpbm11eCA9IDxQSU5NVVhfR1BJTzE0MV9fRlVOQ19T
Q0wyPiwKKwkJCQkgPFBJTk1VWF9HUElPMTQyX19GVU5DX1NEQTI+OworCQkJYmlhcy1wdWxsLXVw
OworCQkJbWVkaWF0ZWsscHVsbC11cC1hZHYgPSA8Mz47CisJCQltZWRpYXRlayxkcml2ZS1zdHJl
bmd0aC1hZHYgPSA8MD47CisJCX07CisJfTsKKworCWkyYzNfcGluczogaTJjMy1kZWZhdWx0LXBp
bnMgeworCQlwaW5zLWJ1cyB7CisJCQlwaW5tdXggPSA8UElOTVVYX0dQSU8xNjBfX0ZVTkNfU0NM
Mz4sCisJCQkJIDxQSU5NVVhfR1BJTzE2MV9fRlVOQ19TREEzPjsKKwkJCWJpYXMtZGlzYWJsZTsK
KwkJCW1lZGlhdGVrLGRyaXZlLXN0cmVuZ3RoLWFkdiA9IDw3PjsKKwkJfTsKKwl9OworCisJaTJj
N19waW5zOiBpMmM3LWRlZmF1bHQtcGlucyB7CisJCXBpbnMtYnVzIHsKKwkJCXBpbm11eCA9IDxQ
SU5NVVhfR1BJTzEyNF9fRlVOQ19TQ0w3PiwKKwkJCQkgPFBJTk1VWF9HUElPMTI1X19GVU5DX1NE
QTc+OworCQkJYmlhcy1kaXNhYmxlOworCQkJbWVkaWF0ZWssZHJpdmUtc3RyZW5ndGgtYWR2ID0g
PDc+OworCQl9OworCX07CisKKwlzcGkxX3BpbnM6IHNwaTEtZGVmYXVsdC1waW5zIHsKKwkJcGlu
cy1jcy1tb3NpLWNsayB7CisJCQlwaW5tdXggPSA8UElOTVVYX0dQSU8xNTdfX0ZVTkNfU1BJMV9B
X0NTQj4sCisJCQkJIDxQSU5NVVhfR1BJTzE1OV9fRlVOQ19TUEkxX0FfTU8+LAorCQkJCSA8UElO
TVVYX0dQSU8xNTZfX0ZVTkNfU1BJMV9BX0NMSz47CisJCQliaWFzLWRpc2FibGU7CisJCX07CisK
KwkJcGlucy1taXNvIHsKKwkJCXBpbm11eCA9IDxQSU5NVVhfR1BJTzE1OF9fRlVOQ19TUEkxX0Ff
TUk+OworCQkJYmlhcy1wdWxsLWRvd247CisJCX07CisJfTsKKworCXNwaTVfcGluczogc3BpNS1k
ZWZhdWx0LXBpbnMgeworCQlwaW5zLWJ1cyB7CisJCQlwaW5tdXggPSA8UElOTVVYX0dQSU8zOF9f
RlVOQ19TUEk1X0FfTUk+LAorCQkJCSA8UElOTVVYX0dQSU8zN19fRlVOQ19HUElPMzc+LAorCQkJ
CSA8UElOTVVYX0dQSU8zOV9fRlVOQ19TUEk1X0FfTU8+LAorCQkJCSA8UElOTVVYX0dQSU8zNl9f
RlVOQ19TUEk1X0FfQ0xLPjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJfTsKKwl9OworfTsKKworJnNw
aTEgeworCXN0YXR1cyA9ICJva2F5IjsKKworCW1lZGlhdGVrLHBhZC1zZWxlY3QgPSA8MD47CisJ
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwlwaW5jdHJsLTAgPSA8JnNwaTFfcGlucz47Cit9
OworCismc3BpNSB7CisJc3RhdHVzID0gIm9rYXkiOworCisJY3MtZ3Bpb3MgPSA8JnBpbyAzNyBH
UElPX0FDVElWRV9MT1c+OworCW1lZGlhdGVrLHBhZC1zZWxlY3QgPSA8MD47CisJcGluY3RybC1u
YW1lcyA9ICJkZWZhdWx0IjsKKwlwaW5jdHJsLTAgPSA8JnNwaTVfcGlucz47CiB9OwogCiAmdWFy
dDAgewotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
