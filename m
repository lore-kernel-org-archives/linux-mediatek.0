Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4211C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 15:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AsjA270hthFDrzaLrKIuaKrqInLmvPe7l3CyQynz9w=; b=mxIoqZWvWCYdwa
	fKiMpbMzWpmnf/gIZqebnJi2PucEnokVDYJ+0t+zdRo4fBb8mzACUWF/zlu4Fchu5RE7vNOe/5rDa
	D2pg0i0C/RAbLsSxVc47TVAUjUCcJYydRQymgWshllMEL4eQU8EqYK25KVK7yWH5FhT4URRSLR0cH
	qM7yE7LxmniMi7TtrCgEo8R0Z+sCd6d4krgVdbwv83guX4dgLKmbDYwmRoLr4wp2NlUiKqb3qFHOk
	hDeibL57byf8YLJPT7OppxHjvzipsltHIV43N1Toy94syUmwshGRoxAw49OzYLgzthPJuOcRz5PZt
	HtpNx6WmsxFMyv7Wq9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVSu-00DVJM-TU; Wed, 16 Mar 2022 15:21:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVLI-00DSIx-2L; Wed, 16 Mar 2022 15:13:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 94BFB1F4467B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647443618;
 bh=enIv65xIz/LQWh/DPBxtnq0kzu+DCLgUdEOM/boND/Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UaGSSGHTUXuSIBvDX1tYy0LMYkYn1J6J2aMsJpf3WeNfdNaELQZ/ni0qsdps+6FAI
 7SlYw9+46MqGlHWG4NZF5Ym3Aw4HL4npAlnDwkzeVlwbZJprasBs4OnLAEs7GlvyRv
 jpcdB5iCcAGcO6GJQn0c0d2O79uywW15olDNAywL3kU3bOJs+0XHtQVRE/GQR0OFUG
 JRq8O8HiJnbtIDUXdeLhghnAuzGaG4zWDgx2taSgSKlynk1m4GZl2zmnPUdFJXzPUY
 YEctQcKVNUWHZILp8FYbLPQ12o5E0miMJNR4G0NIA3qWzUl4Xtymh1iAIuIQ9s/u60
 t2AgUoUQM0jfg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 05/10] arm64: dts: mediatek: asurada: Add ChromeOS EC
Date: Wed, 16 Mar 2022 11:13:22 -0400
Message-Id: <20220316151327.564214-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316151327.564214-1-nfraprado@collabora.com>
References: <20220316151327.564214-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_081340_308400_842140A6 
X-CRM114-Status: GOOD (  10.21  )
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

QWRkIHN1cHBvcnQgZm9yIHRoZSBDaHJvbWVPUyBFbWJlZGRlZCBDb250cm9sbGVyIHByZXNlbnQg
b24gdGhlIEFzdXJhZGEKcGxhdGZvcm0uIEl0IGlzIGNvbm5lY3RlZCB0aHJvdWdoIHRoZSBTUEkx
IGJ1cyBhbmQgb2ZmZXJzIHNldmVyYWwKZnVuY3Rpb25hbGl0aWVzOiBiYXNlIGRldGVjdGlvbiwg
UFdNIGNvbnRyb2xsZXIsIEkyQyB0dW5uZWxpbmcsCnJlZ3VsYXRvcnMsIFR5cGUtQyBjb25uZWN0
b3IgbWFuYWdlbWVudCwga2V5Ym9hcmQgYW5kIFNtYXJ0IEJhdHRlcnkKTWV0cmljcyAoU0JTKS4K
ClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFi
b3JhLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9n
aW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+Ci0tLQoKIC4uLi9ib290L2R0cy9tZWRp
YXRlay9tdDgxOTItYXN1cmFkYS5kdHNpICAgICB8IDc5ICsrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCmluZGV4IDNjNWIxZTQ3NWNmNi4uYmQyNzMw
YWI2MjY2IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1h
c3VyYWRhLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1
cmFkYS5kdHNpCkBAIC0zNTMsNiArMzUzLDE0IEBAICZwaW8gewogCQkJICAiQVVEX0RBVF9NSVNP
MCIsCiAJCQkgICJBVURfREFUX01JU08xIjsKIAorCWNyb3NfZWNfaW50OiBjcm9zLWVjLWlycS1k
ZWZhdWx0LXBpbnMgeworCQlwaW5zLWVjLWFwLWludC1vZGwgeworCQkJcGlubXV4ID0gPFBJTk1V
WF9HUElPNV9fRlVOQ19HUElPNT47CisJCQlpbnB1dC1lbmFibGU7CisJCQliaWFzLXB1bGwtdXA7
CisJCX07CisJfTsKKwogCWkyYzBfcGluczogaTJjMC1kZWZhdWx0LXBpbnMgewogCQlwaW5zLWJ1
cyB7CiAJCQlwaW5tdXggPSA8UElOTVVYX0dQSU8yMDRfX0ZVTkNfU0NMMD4sCkBAIC00MzIsNiAr
NDQwLDc0IEBAICZzcGkxIHsKIAltZWRpYXRlayxwYWQtc2VsZWN0ID0gPDA+OwogCXBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCI7CiAJcGluY3RybC0wID0gPCZzcGkxX3BpbnM+OworCisJY3Jvc19l
YzogZWNAMCB7CisJCWNvbXBhdGlibGUgPSAiZ29vZ2xlLGNyb3MtZWMtc3BpIjsKKwkJcmVnID0g
PDA+OworCQlpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZwaW8gNSBJUlFfVFlQRV9MRVZFTF9MT1c+
OworCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDwzMDAwMDAwPjsKKwkJcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IjsKKwkJcGluY3RybC0wID0gPCZjcm9zX2VjX2ludD47CisKKwkJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47CisJCSNzaXplLWNlbGxzID0gPDA+OworCisJCWJhc2VfZGV0ZWN0aW9uOiBjYmFz
IHsKKwkJCWNvbXBhdGlibGUgPSAiZ29vZ2xlLGNyb3MtY2JhcyI7CisJCX07CisKKwkJY3Jvc19l
Y19wd206IGVjLXB3bSB7CisJCQljb21wYXRpYmxlID0gImdvb2dsZSxjcm9zLWVjLXB3bSI7CisJ
CQkjcHdtLWNlbGxzID0gPDE+OworCisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQl9OworCisJ
CWkyY190dW5uZWw6IGkyYy10dW5uZWwgeworCQkJY29tcGF0aWJsZSA9ICJnb29nbGUsY3Jvcy1l
Yy1pMmMtdHVubmVsIjsKKwkJCWdvb2dsZSxyZW1vdGUtYnVzID0gPDA+OworCQkJI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47CisJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJfTsKKworCQltdDYzNjBfbGRv
M19yZWc6IHJlZ3VsYXRvckAwIHsKKwkJCWNvbXBhdGlibGUgPSAiZ29vZ2xlLGNyb3MtZWMtcmVn
dWxhdG9yIjsKKwkJCXJlZyA9IDwwPjsKKwkJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDE4
MDAwMDA+OworCQkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47CisJCX07CisK
KwkJbXQ2MzYwX2xkbzVfcmVnOiByZWd1bGF0b3JAMSB7CisJCQljb21wYXRpYmxlID0gImdvb2ds
ZSxjcm9zLWVjLXJlZ3VsYXRvciI7CisJCQlyZWcgPSA8MT47CisJCQlyZWd1bGF0b3ItbWluLW1p
Y3Jvdm9sdCA9IDwzMzAwMDAwPjsKKwkJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAw
MDA+OworCQl9OworCisJCXR5cGVjIHsKKwkJCWNvbXBhdGlibGUgPSAiZ29vZ2xlLGNyb3MtZWMt
dHlwZWMiOworCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkjc2l6ZS1jZWxscyA9IDwwPjsK
KworCQkJdXNiX2MwOiBjb25uZWN0b3JAMCB7CisJCQkJY29tcGF0aWJsZSA9ICJ1c2ItYy1jb25u
ZWN0b3IiOworCQkJCXJlZyA9IDwwPjsKKwkJCQlsYWJlbCA9ICJsZWZ0IjsKKwkJCQlwb3dlci1y
b2xlID0gImR1YWwiOworCQkJCWRhdGEtcm9sZSA9ICJob3N0IjsKKwkJCQl0cnktcG93ZXItcm9s
ZSA9ICJzb3VyY2UiOworCQkJfTsKKworCQkJdXNiX2MxOiBjb25uZWN0b3JAMSB7CisJCQkJY29t
cGF0aWJsZSA9ICJ1c2ItYy1jb25uZWN0b3IiOworCQkJCXJlZyA9IDwxPjsKKwkJCQlsYWJlbCA9
ICJyaWdodCI7CisJCQkJcG93ZXItcm9sZSA9ICJkdWFsIjsKKwkJCQlkYXRhLXJvbGUgPSAiaG9z
dCI7CisJCQkJdHJ5LXBvd2VyLXJvbGUgPSAic291cmNlIjsKKwkJCX07CisJCX07CisJfTsKIH07
CiAKICZzcGk1IHsKQEAgLTQ0NiwzICs1MjIsNiBAQCAmc3BpNSB7CiAmdWFydDAgewogCXN0YXR1
cyA9ICJva2F5IjsKIH07CisKKyNpbmNsdWRlIDxhcm0vY3Jvcy1lYy1rZXlib2FyZC5kdHNpPgor
I2luY2x1ZGUgPGFybS9jcm9zLWVjLXNicy5kdHNpPgotLSAKMi4zNS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
