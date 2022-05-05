Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36684C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 19:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8hRfSUDiGIDnhMYNearsRj4SI6C89M/WNC8r/0uhKQ=; b=gb1NMAhtvoTRhX
	LuFmxvg4h+ZBumlxd+aao6vs1hB7aDHOgAz8gNf7jX2wCydAkz/HIN6sGeRlPJ4AhZH+LgM3jNvv4
	r8HDv+Flvd8R0UquX85OOK1eM9wTIngHbb19yeiAkr755U7+pcgMPAoya4KOkOpeKaw0jyiZekWVG
	NKUqXk+mCFxgFtuSR9QqnYO1h1vn9/L0yq0iZ94p65JyNrq62vjFXWqV9SiByQD0AP4nCkUpHoea/
	7/zyU7ceUbwJlrg6roEyQ6ZF7I1suBLh8tgT8d3lYJEAdcr6xdWUZm78AQp/thglQTiW0BWbaXfD4
	2LAWVt19Bb+fGFAmxA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhRq-00HYYr-MP; Thu, 05 May 2022 19:47:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhQi-00HXiZ-A8; Thu, 05 May 2022 19:46:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id E74AB1F45CC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651779979;
 bh=XzEaiEHNWOYXuBWQGKEaKopiSHkFX8Xw6nY868u+Ces=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U2rc+UO+OXSwdT+oR1eWJK4kT4Bc6IoHf8rWTxs4788dFRNZhJb9WKoKYG+xJu5if
 2wYeQewZ9+k9NipMekRbxrVHCIiOYyu+b5vlmSPHFptmohRO3HPHCpbl7fswzixn6W
 DeYH86oCoryzksUAlzjbGnV1rvuF+C7mnKNx0iAbvtuY9m5tWc0Ni6dotvG0UAUB0r
 1m5ak/CX+USpqHr+uR2jGOKmfFDn4A6EvFJlRQq1iEpWosMm3UsW+8wm4P2VjqUsLE
 vNIZzlEZoOFG9m3UeuDWMTzndhGPVqi6oL2AoNmFedsBQW8c57GBNAipiebTwLGLQ5
 wSnUBZjND6gvw==
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
Subject: [PATCH v2 05/16] arm64: dts: mediatek: asurada: Add system-wide power
 supplies
Date: Thu,  5 May 2022 15:45:39 -0400
Message-Id: <20220505194550.3094656-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505194550.3094656-1-nfraprado@collabora.com>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_124628_525921_1033E88E 
X-CRM114-Status: UNSURE (   8.90  )
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

QWRkIHN5c3RlbS13aWRlIHBvd2VyIHN1cHBsaWVzIHByZXNlbnQgb24gYWxsIG9mIHRoZSBib2Fy
ZHMgaW4gdGhlCkFzdXJhZGEgZmFtaWx5LgoKU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4g
QS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lv
YWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNv
bT4KLS0tCgoobm8gY2hhbmdlcyBzaW5jZSB2MSkKCiAuLi4vYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4
MTkyLWFzdXJhZGEuZHRzaSAgICAgfCA2NCArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgNjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQppbmRleCBlMTA2MzYyOTg2MzkuLjVjYjc1ODBhMTNjZiAx
MDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5k
dHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRz
aQpAQCAtMTksNiArMTksNzAgQEAgbWVtb3J5QDQwMDAwMDAwIHsKIAkJZGV2aWNlX3R5cGUgPSAi
bWVtb3J5IjsKIAkJcmVnID0gPDAgMHg0MDAwMDAwMCAwIDB4ODAwMDAwMDA+OwogCX07CisKKwkv
KiBzeXN0ZW0gd2lkZSBMRE8gMS44ViBwb3dlciByYWlsICovCisJcHAxODAwX2xkb19nOiBwcDE4
MDAtbGRvLWcgeworCQljb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7CisJCXJlZ3VsYXRv
ci1uYW1lID0gInBwMTgwMF9sZG9fZyI7CisJCXJlZ3VsYXRvci1hbHdheXMtb247CisJCXJlZ3Vs
YXRvci1ib290LW9uOworCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKKwkJ
cmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTgwMDAwMD47CisJCXZpbi1zdXBwbHkgPSA8JnBw
MzMwMF9nPjsKKwl9OworCisJLyogc3lzdGVtIHdpZGUgc3dpdGNoaW5nIDMuM1YgcG93ZXIgcmFp
bCAqLworCXBwMzMwMF9nOiBwcDMzMDAtZyB7CisJCWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZp
eGVkIjsKKwkJcmVndWxhdG9yLW5hbWUgPSAicHAzMzAwX2ciOworCQlyZWd1bGF0b3ItYWx3YXlz
LW9uOworCQlyZWd1bGF0b3ItYm9vdC1vbjsKKwkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8
MzMwMDAwMD47CisJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+OworCQl2aW4t
c3VwcGx5ID0gPCZwcHZhcl9zeXM+OworCX07CisKKwkvKiBzeXN0ZW0gd2lkZSBMRE8gMy4zViBw
b3dlciByYWlsICovCisJcHAzMzAwX2xkb196OiBwcDMzMDAtbGRvLXogeworCQljb21wYXRpYmxl
ID0gInJlZ3VsYXRvci1maXhlZCI7CisJCXJlZ3VsYXRvci1uYW1lID0gInBwMzMwMF9sZG9feiI7
CisJCXJlZ3VsYXRvci1hbHdheXMtb247CisJCXJlZ3VsYXRvci1ib290LW9uOworCQlyZWd1bGF0
b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKKwkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQg
PSA8MzMwMDAwMD47CisJCXZpbi1zdXBwbHkgPSA8JnBwdmFyX3N5cz47CisJfTsKKworCS8qIHNl
cGFyYXRlbHkgc3dpdGNoZWQgMy4zViBwb3dlciByYWlsICovCisJcHAzMzAwX3U6IHBwMzMwMC11
IHsKKwkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOworCQlyZWd1bGF0b3ItbmFtZSA9
ICJwcDMzMDBfdSI7CisJCXJlZ3VsYXRvci1hbHdheXMtb247CisJCXJlZ3VsYXRvci1ib290LW9u
OworCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKKwkJcmVndWxhdG9yLW1h
eC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47CisJCS8qIGVuYWJsZSBwaW4gd2lyZWQgdG8gR1BJTyBj
b250cm9sbGVkIGJ5IEVDICovCisJCXZpbi1zdXBwbHkgPSA8JnBwMzMwMF9nPjsKKwl9OworCisJ
Lyogc3lzdGVtIHdpZGUgc3dpdGNoaW5nIDUuMFYgcG93ZXIgcmFpbCAqLworCXBwNTAwMF9hOiBw
cDUwMDAtYSB7CisJCWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKKwkJcmVndWxhdG9y
LW5hbWUgPSAicHA1MDAwX2EiOworCQlyZWd1bGF0b3ItYWx3YXlzLW9uOworCQlyZWd1bGF0b3It
Ym9vdC1vbjsKKwkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8NTAwMDAwMD47CisJCXJlZ3Vs
YXRvci1tYXgtbWljcm92b2x0ID0gPDUwMDAwMDA+OworCQl2aW4tc3VwcGx5ID0gPCZwcHZhcl9z
eXM+OworCX07CisKKwkvKiBzeXN0ZW0gd2lkZSBzZW1pLXJlZ3VsYXRlZCBwb3dlciByYWlsIGZy
b20gYmF0dGVyeSBvciBVU0IgKi8KKwlwcHZhcl9zeXM6IHBwdmFyLXN5cyB7CisJCWNvbXBhdGli
bGUgPSAicmVndWxhdG9yLWZpeGVkIjsKKwkJcmVndWxhdG9yLW5hbWUgPSAicHB2YXJfc3lzIjsK
KwkJcmVndWxhdG9yLWFsd2F5cy1vbjsKKwkJcmVndWxhdG9yLWJvb3Qtb247CisJfTsKIH07CiAK
ICZwaW8gewotLSAKMi4zNi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
