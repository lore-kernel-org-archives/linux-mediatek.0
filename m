Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40477C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 19:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQNeHmRLYwcauGCXjf3mR7kTJoV/KRjp/0Jeycikfm4=; b=orn+DSxaWREdVm
	CX3EPKEsl8nY2EkzXcxKlEuts3LGWDXuqqTtu/cUoIMMd2ptwYSGescI8c3D+vS5qvg1doW5uQ/4M
	SSOLZwRejXqh7CpCb7JDR03kBeCBtYa6FUJCJsSuk9Lh7Odk0yOMMVeHbaue/k1HEdOuHEVIMkITK
	5pC7j9j49yTReqLwsLMMydbeNYOFHHo/EjIM69JnVfifwrqCGm83NqFC6Yn7VR8QRAYyWZXY4MeS4
	PaQgeajkrYHDoVdSuQ5cCK7cVqch0YIT3eAIpAMsrvQdUmrDlSzmPiBcFPlWAi067r4xyEmcmsJ9T
	m6Ov4Qe+3ZFHyrgn62mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhVS-00006v-82; Thu, 05 May 2022 19:51:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhRA-00HY0d-2e; Thu, 05 May 2022 19:46:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 51B7B1F45CD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651780014;
 bh=xzUy2wIyZXyHws5Sfef8bUOIhBVmWMeAQk76VcEPaRI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eOVPVi70rUmGojFG3yEu34VRcLCOrYmReCGhcDWvQJ2s4HSOPhs4Gj+1janAdE+w+
 UyXPLWUsJhooEqMvJ1dzcg2vuUnJeIvGe5zXkG8yxz3Gi7jS6Waa7FWzlkVZpF3BPd
 8SJ12uM12ezZyu7YLHdTKy7QPFNBl/stxL34IXZiJG6CNpcvugBCGEFShYe0iCCK0W
 AMISaWJ0IBoxLmhmE7mZtHtgVBUlB2aysdQXLpi7sHmiw6oFXet2pJr2SmPML89+8O
 +6DOPUKVQY/dO2aCqIug8a5AGYxnq44atGQlD8CCO/2voZJXbfUuqXbi/o2Gfoz64C
 6xeQciBOFYGFw==
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
Subject: [PATCH v2 14/16] arm64: dts: mediatek: asurada: Enable PCIe and add
 WiFi
Date: Thu,  5 May 2022 15:45:48 -0400
Message-Id: <20220505194550.3094656-15-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505194550.3094656-1-nfraprado@collabora.com>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_124656_285630_3D215598 
X-CRM114-Status: GOOD (  12.58  )
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

RW5hYmxlIE1UODE5MidzIFBDSWUgY29udHJvbGxlciBhbmQgYWRkIHN1cHBvcnQgZm9yIHRoZSBN
VDc5MjFlIFdpRmkKY2FyZCB0aGF0IGlzIHByZXNlbnQgb24gdGhhdCBidXMgZm9yIHRoZSBBc3Vy
YWRhIHBsYXRmb3JtLgoKU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5m
cmFwcmFkb0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwg
UmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KCi0tLQoKQ2hh
bmdlcyBpbiB2MjoKLSBBZGRlZCB0aGlzIHBhdGNoCgogLi4uL2Jvb3QvZHRzL21lZGlhdGVrL210
ODE5Mi1hc3VyYWRhLmR0c2kgICAgIHwgNzQgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDc0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKaW5kZXggNGY5YTllYzA0NmIwLi44N2E5YTZiMWVhYmMg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEu
ZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0
c2kKQEAgLTY2LDYgKzY2LDE5IEBAIHBwMzMwMF91OiBwcDMzMDAtdSB7CiAJCXZpbi1zdXBwbHkg
PSA8JnBwMzMwMF9nPjsKIAl9OwogCisJcHAzMzAwX3dsYW46IHBwMzMwMC13bGFuIHsKKwkJY29t
cGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOworCQlyZWd1bGF0b3ItbmFtZSA9ICJwcDMzMDBf
d2xhbiI7CisJCXJlZ3VsYXRvci1hbHdheXMtb247CisJCXJlZ3VsYXRvci1ib290LW9uOworCQly
ZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKKwkJcmVndWxhdG9yLW1heC1taWNy
b3ZvbHQgPSA8MzMwMDAwMD47CisJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJCXBpbmN0
cmwtMCA9IDwmcHAzMzAwX3dsYW5fcGlucz47CisJCWVuYWJsZS1hY3RpdmUtaGlnaDsKKwkJZ3Bp
byA9IDwmcGlvIDE0MyBHUElPX0FDVElWRV9ISUdIPjsKKwl9OworCiAJLyogc3lzdGVtIHdpZGUg
c3dpdGNoaW5nIDUuMFYgcG93ZXIgcmFpbCAqLwogCXBwNTAwMF9hOiBwcDUwMDAtYSB7CiAJCWNv
bXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKQEAgLTg0LDYgKzk3LDE3IEBAIHBwdmFyX3N5
czogcHB2YXItc3lzIHsKIAkJcmVndWxhdG9yLWFsd2F5cy1vbjsKIAkJcmVndWxhdG9yLWJvb3Qt
b247CiAJfTsKKworCXJlc2VydmVkX21lbW9yeTogcmVzZXJ2ZWQtbWVtb3J5IHsKKwkJI2FkZHJl
c3MtY2VsbHMgPSA8Mj47CisJCSNzaXplLWNlbGxzID0gPDI+OworCQlyYW5nZXM7CisKKwkJd2lm
aV9yZXN0cmljdGVkX2RtYV9yZWdpb246IHdpZmlAYzAwMDAwMDAgeworCQkJY29tcGF0aWJsZSA9
ICJyZXN0cmljdGVkLWRtYS1wb29sIjsKKwkJCXJlZyA9IDwwIDB4YzAwMDAwMDAgMCAweDQwMDAw
MDA+OworCQl9OworCX07CiB9OwogCiAmaTJjMCB7CkBAIC0xNDQsNiArMTY4LDI4IEBAICZpMmM3
IHsKIAlwaW5jdHJsLTAgPSA8JmkyYzdfcGlucz47CiB9OwogCismcGNpZSB7CisJcGluY3RybC1u
YW1lcyA9ICJkZWZhdWx0IjsKKwlwaW5jdHJsLTAgPSA8JnBjaWVfcGlucz47CisKKwlwY2llMDog
cGNpZUAwLDAgeworCQlkZXZpY2VfdHlwZSA9ICJwY2kiOworCQlyZWcgPSA8MHgwMDAwIDAgMCAw
IDA+OworCQludW0tbGFuZXMgPSA8MT47CisJCWJ1cy1yYW5nZSA9IDwweDEgMHgxPjsKKworCQkj
YWRkcmVzcy1jZWxscyA9IDwzPjsKKwkJI3NpemUtY2VsbHMgPSA8Mj47CisJCXJhbmdlczsKKwor
CQl3aWZpOiB3aWZpQDAsMCB7CisJCQlyZWcgPSA8MHgxMDAwMCAwIDAgMCAweDEwMDAwMD4sCisJ
CQkgICAgICA8MHgxMDAwMCAwIDB4MTAwMDAwIDAgMHgxMDAwMDA+OworCQkJbWVtb3J5LXJlZ2lv
biA9IDwmd2lmaV9yZXN0cmljdGVkX2RtYV9yZWdpb24+OworCQl9OworCX07Cit9OworCiAmcGlv
IHsKIAkvKiAyMjAgbGluZXMgKi8KIAlncGlvLWxpbmUtbmFtZXMgPSAiSTJTX0RQX0xSQ0siLApA
QCAtNDM0LDYgKzQ4MCwzNCBAQCBwaW5zLWJ1cyB7CiAJCX07CiAJfTsKIAorCXBjaWVfcGluczog
cGNpZS1kZWZhdWx0LXBpbnMgeworCQlwaW5zLXBjaWUtd2FrZSB7CisJCQlwaW5tdXggPSA8UElO
TVVYX0dQSU82M19fRlVOQ19QQ0lFX1dBS0VfTj47CisJCQliaWFzLXB1bGwtdXA7CisJCX07CisK
KwkJcGlucy1wY2llLXBlcmVzZXQgeworCQkJcGlubXV4ID0gPFBJTk1VWF9HUElPNjRfX0ZVTkNf
UENJRV9QRVJFU0VUX04+OworCQl9OworCisJCXBpbnMtcGNpZS1jbGtyZXEgeworCQkJcGlubXV4
ID0gPFBJTk1VWF9HUElPNjVfX0ZVTkNfUENJRV9DTEtSRVFfTj47CisJCQliaWFzLXB1bGwtdXA7
CisJCX07CisKKwkJcGlucy13aWZpLWtpbGwgeworCQkJcGlubXV4ID0gPFBJTk1VWF9HUElPMTQ1
X19GVU5DX0dQSU8xNDU+OyAvKiBXSUZJX0tJTExfTCAqLworCQkJb3V0cHV0LWhpZ2g7CisJCX07
CisJfTsKKworCXBwMzMwMF93bGFuX3BpbnM6IHBwMzMwMC13bGFuLXBpbnMgeworCQlwaW5zLXBj
aWUtZW4tcHAzMzAwLXdsYW4geworCQkJcGlubXV4ID0gPFBJTk1VWF9HUElPMTQzX19GVU5DX0dQ
SU8xNDM+OworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJfTsKKwogCXNwaTFfcGluczogc3BpMS1k
ZWZhdWx0LXBpbnMgewogCQlwaW5zLWNzLW1vc2ktY2xrIHsKIAkJCXBpbm11eCA9IDxQSU5NVVhf
R1BJTzE1N19fRlVOQ19TUEkxX0FfQ1NCPiwKLS0gCjIuMzYuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
