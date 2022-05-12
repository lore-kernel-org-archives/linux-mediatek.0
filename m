Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEE3C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 21:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bd0dxeAz0XTPWpcWQmcv9aoQ/FLGf0WOnEukixnvO3U=; b=BHjjAaONXlnPTc
	aZEzSN+QNp2muoGM0sd/fMU5cp1WUPJCjPzAlDKrfz+khkfh7bEScogWM+S72jTq34T/KcI3duaYZ
	fHWL7pecnG6c7jPucQlzRPXaU9RVuOhbROcby1yYySYV561dWzdu7Y/tFFjbjUFgwapINbZwVJeQ1
	INjtp+zdKy7X2GxRS95AmKC+sAHFu1ADI6OCab6wGa8nyZ+3sPw5+w9YXQidZ9MkZtJu/HbgojZRR
	1+yLzRcJJhPIoNnDm1zk36oX9hFv5AkRz3I+SMwqxiMpnBUgLePOpY5dP3bc/7g+Q44GkxQNm7Jii
	HQ5lLJnouAJV808NjrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFut-00DTX5-6j; Thu, 12 May 2022 21:00:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFrR-00DRJs-Ge; Thu, 12 May 2022 20:56:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id C44701F45948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652388996;
 bh=j9EKFrnbOZbyTcEQCEWfG2IS74kguTTzKhClb3b7Sbg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HJ8wu6AYCA+FpIEs9q8u7ovvjzcuuduExswm/0ZNchZ7YXJhw1nHCIZxRFBTtOveS
 w/DZz7DRShWZ3LLaz17T1ZF8srgWgCZIrAa4J6y6OSgItZ8CRewkgRcwiml6Qb/ojd
 UFw3SZ9bt3tsf2Tg89pbOZ5zhsjExbmuRzukLJKBSijxb1p/JDQ3zUfZ69+jOaRaIJ
 gTOulhx+Rpkr/vtFoz3gSEggfsbBJBw1dJM+m6TTSoY7oVZ+gkAkiW53Cps09kMH4n
 WNOZtYFsETBGGHwOBzDHpG3yUwHXdHRjfLSaMb2nVY4pDnj6GGG6Rg6mB28mlx89hW
 cycLiWuUtha9w==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 10/16] arm64: dts: mediatek: asurada: Add Elan eKTH3000 I2C
 trackpad
Date: Thu, 12 May 2022 16:55:56 -0400
Message-Id: <20220512205602.158273-11-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512205602.158273-1-nfraprado@collabora.com>
References: <20220512205602.158273-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_135637_771257_D42BDDCE 
X-CRM114-Status: UNSURE (   9.70  )
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
YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgpUZXN0ZWQtYnk6IENoZW4t
WXUgVHNhaSA8d2Vuc3RAY2hyb21pdW0ub3JnPgotLS0KCihubyBjaGFuZ2VzIHNpbmNlIHYxKQoK
IC4uLi9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpICAgICAgfCAxOCArKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpIGIv
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCmluZGV4IGRk
ZjE4ODYxZWRhZC4uYTYzYjNjODZkNjUwIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCkBAIC0xMDksNiArMTA5LDE2IEBAICZpMmMyIHsK
IAljbG9jay1zdHJldGNoLW5zID0gPDEyNjAwPjsKIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
OwogCXBpbmN0cmwtMCA9IDwmaTJjMl9waW5zPjsKKworCXRyYWNrcGFkQDE1IHsKKwkJY29tcGF0
aWJsZSA9ICJlbGFuLGVrdGgzMDAwIjsKKwkJcmVnID0gPDB4MTU+OworCQlpbnRlcnJ1cHRzLWV4
dGVuZGVkID0gPCZwaW8gMTUgSVJRX1RZUEVfTEVWRUxfTE9XPjsKKwkJcGluY3RybC1uYW1lcyA9
ICJkZWZhdWx0IjsKKwkJcGluY3RybC0wID0gPCZ0cmFja3BhZF9waW5zPjsKKwkJdmNjLXN1cHBs
eSA9IDwmcHAzMzAwX3U+OworCQl3YWtldXAtc291cmNlOworCX07CiB9OwogCiAmaTJjMyB7CkBA
IC00NDAsNiArNDUwLDE0IEBAIHBpbnMtYnVzIHsKIAkJCWJpYXMtZGlzYWJsZTsKIAkJfTsKIAl9
OworCisJdHJhY2twYWRfcGluczogdHJhY2twYWQtZGVmYXVsdC1waW5zIHsKKwkJcGlucy1pbnQt
biB7CisJCQlwaW5tdXggPSA8UElOTVVYX0dQSU8xNV9fRlVOQ19HUElPMTU+OworCQkJaW5wdXQt
ZW5hYmxlOworCQkJbWVkaWF0ZWsscHVsbC11cC1hZHYgPSA8Mz47CisJCX07CisJfTsKIH07CiAK
ICZzcGkxIHsKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
