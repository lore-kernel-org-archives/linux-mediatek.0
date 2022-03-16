Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53AFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 15:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8RjMd4nsbH+Jyw9FHjjCc4QGF49NvU1M2YKfpGYzf5k=; b=bcXvYD01kqPko7
	NsjeOCg8XdFqgSKe0Cd0qUvOcC7VsjEMO7I3vfpserHhdNdTjMQ+SuLaJ/SKxqkGRajCk3J0b/GB2
	UhOB7B+HlEBpft+VpYK3iPRuRd3QbZ6OqfgZM2bGQOc+mCRyKTA6VHygBm/XS6SVO3f+kq2F43ohK
	i7fq8DjN67uH0voVCWT7zupbPXHAVGEd7PqDx0WLomJnSndq0NVQhFsA8lkrrT7Swxh8s/J8XNi2h
	h+QSLPTfb3zZzBxMV8K9Ak9NciDw9s+Wh1jphHxPisa1eSIYW/aapd99hLPjCzBaVVxT4tekm6bMK
	b63/RS5K6vb+jJXpAHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVWx-00DWwB-Pw; Wed, 16 Mar 2022 15:25:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVLK-00DSKI-GU; Wed, 16 Mar 2022 15:13:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 3F30E1F4468D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647443621;
 bh=iWCKuQcSEhS1E0/lZPLekaNrYJWzHrIOHJ2/Yty469k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b6CEDyUVZ1jFrCdInFhpSC/7sqMyVyW4jVS8wNwJ1Ct6DfM7lptPfpO0GQvWJ/9IJ
 BvjLh0q/NBU/hyqyoUyxT+z1yBKIGti+Tkis0sDlnu+TJZDwzvnsPjGGrZG4RnVmeX
 8x1JQJo3vgASiaDuOmwu9MZ6tWdtLjJ77RRkYUXHhoO1T1CY3MYQ01mOBi/KmRfQwN
 qyGzgPAb0QnsQyBvG/zEcvp+YWT8XIIXlwOSKmSVJZKLPnnmaCgxK9i3AZoYYkx/VJ
 PrS2UwpSuO5Or//sM3gqxjKyJqpRNzw3Br1lGb25LvuK/pQoJBnvpaYic3uhorLdsT
 hvsjlQO0L83cA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 07/10] arm64: dts: mediatek: asurada: Add Cr50 TPM
Date: Wed, 16 Mar 2022 11:13:24 -0400
Message-Id: <20220316151327.564214-8-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316151327.564214-1-nfraprado@collabora.com>
References: <20220316151327.564214-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_081342_734794_82088143 
X-CRM114-Status: GOOD (  10.35  )
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

VGhlIEFzdXJhZGEgcGxhdGZvcm0gaGFzIGEgR29vZ2xlIFNlY3VyaXR5IENoaXAgY29ubmVjdGVk
IHRvIHRoZSBTUEk1CmJ1cy4gSXQgcnVucyB0aGUgY3I1MCBmaXJtd2FyZSBhbmQgcHJvdmlkZXMg
VFBNIGZ1bmN0aW9uYWxpdHkuIEFkZApzdXBwb3J0IGZvciBpdC4KClNpZ25lZC1vZmYtYnk6IE7D
rWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25v
QGNvbGxhYm9yYS5jb20+Ci0tLQoKIC4uLi9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIt
YXN1cmFkYS5kdHNpIHwgMTcgKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDgxOTItYXN1cmFkYS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIt
YXN1cmFkYS5kdHNpCmluZGV4IDFkMWE0YjlhOTg5YS4uM2I0Yzc0ZDVkNWMzIDEwMDY0NAotLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCkBAIC01LDYg
KzUsNyBAQAogICovCiAvZHRzLXYxLzsKICNpbmNsdWRlICJtdDgxOTIuZHRzaSIKKyNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KIAogLyB7CiAJYWxpYXNlcyB7CkBAIC0zNTMsNiAr
MzU0LDEzIEBAICZwaW8gewogCQkJICAiQVVEX0RBVF9NSVNPMCIsCiAJCQkgICJBVURfREFUX01J
U08xIjsKIAorCWNyNTBfaW50OiBjcjUwLWlycS1kZWZhdWx0LXBpbnMgeworCQlwaW5zLWdzYy1h
cC1pbnQtb2RsIHsKKwkJCXBpbm11eCA9IDxQSU5NVVhfR1BJTzE3MV9fRlVOQ19HUElPMTcxPjsK
KwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwl9OworCiAJY3Jvc19lY19pbnQ6IGNyb3MtZWMtaXJx
LWRlZmF1bHQtcGlucyB7CiAJCXBpbnMtZWMtYXAtaW50LW9kbCB7CiAJCQlwaW5tdXggPSA8UElO
TVVYX0dQSU81X19GVU5DX0dQSU81PjsKQEAgLTUxNyw2ICs1MjUsMTUgQEAgJnNwaTUgewogCW1l
ZGlhdGVrLHBhZC1zZWxlY3QgPSA8MD47CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKIAlw
aW5jdHJsLTAgPSA8JnNwaTVfcGlucz47CisKKwljcjUwQDAgeworCQljb21wYXRpYmxlID0gImdv
b2dsZSxjcjUwIjsKKwkJcmVnID0gPDA+OworCQlpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZwaW8g
MTcxIElSUV9UWVBFX0VER0VfUklTSU5HPjsKKwkJc3BpLW1heC1mcmVxdWVuY3kgPSA8MTAwMDAw
MD47CisJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJCXBpbmN0cmwtMCA9IDwmY3I1MF9p
bnQ+OworCX07CiB9OwogCiAmdWFydDAgewotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
