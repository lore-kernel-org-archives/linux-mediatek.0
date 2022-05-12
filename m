Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A52C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 21:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4oc+L2HHAjLwYLFbLrnNMiR3MrTdyRITmH84UrQXD4=; b=oGfLu/OrgTvUAm
	NnSRjMbTNuKrJx5wcWewbuNBxpTBYS4aQqaa66yU6V0Qu9oPq5+eoNPTTuAQznkAGXsH0BM9aseTe
	oswBmF3s5YNMvU1flA4c+jg0YRlxg0JFY/fd5TXjNofk4hNcTiDCNQf1n9B7kNXwaPvuLak/aUB3c
	gs3zYzHc03y+/E8om3c9ukrQFPGzVuchLo37jLKh5zTiR3gJyqaJnGWG8k0DnJwa+4M0V9Kt3KCX6
	C3tmj7Yq/dL/BwBbXY1QaearDR+Nx+td64mKhNjZCn3c2gzDNnBOtArMQAcr44AsmHYBfLyt7TdW+
	YV0x7MGDEnPhzoSXhZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFyQ-00DVUa-P6; Thu, 12 May 2022 21:03:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFrd-00DRRX-9g; Thu, 12 May 2022 20:56:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 49C271F45AAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652389008;
 bh=u3bgLWaqCDtC2cPlVcV31sMjvrL2SuIojgozTZcaWa0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JBsnrd14WnmJAEI02AwFqisQMF9YA8XYqDzyAdJr46KoE/v/2XAsmbrVHng3EQzbJ
 RFWIqYBWD+mV5oeOvMTYsBj9SVMaCmJdA7dujGMygxD8mkkeFUYn9GboiImLMHEQ8P
 5yeItut/AoW9HDg/pfnhwopKp1MZrhyZGkdDGlDMndFWWVbRiPoYj6N6BVDR6RJCIB
 ZLNqF5+oUV/sjp0Gclam+8rjVV/MPbWsmSAKEOkCHdxlPUDEpqeAoJkcG6Q0PNciY0
 qvFmIfcR7vekar7Ka9Hpd4/kitSeLQZ0uFhN5DGOv/WeJal4TVCnPsbW3U8OdWuFGV
 iwp3qLR3/JFqw==
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
Subject: [PATCH v3 16/16] arm64: dts: mediatek: asurada: Add SPMI regulators
Date: Thu, 12 May 2022 16:56:02 -0400
Message-Id: <20220512205602.158273-17-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512205602.158273-1-nfraprado@collabora.com>
References: <20220512205602.158273-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_135649_511700_4BB76EF5 
X-CRM114-Status: GOOD (  10.93  )
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

VGhlIEFzdXJhZGEgcGxhdGZvcm0gdXNlcyByZWd1bGF0b3JzIGZyb20gTVQ2MzE1IFBNSUNzIGFj
ZXNzaWJsZSB0aHJvdWdoClNQTUkuIEFkZCBzdXBwb3J0IGZvciB0aGVtLgoKU2lnbmVkLW9mZi1i
eTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgpSZXZp
ZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVs
cmVnbm9AY29sbGFib3JhLmNvbT4KVGVzdGVkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnN0QGNocm9t
aXVtLm9yZz4KCi0tLQoKKG5vIGNoYW5nZXMgc2luY2UgdjIpCgpDaGFuZ2VzIGluIHYyOgotIEFk
ZGVkIHRoaXMgcGF0Y2gKCiAuLi4vYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRz
aSAgICAgfCA0OSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTky
LWFzdXJhZGEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJh
ZGEuZHRzaQppbmRleCBhNTNmNzM1MmYwNmUuLmQ2NmIwMDhjMDFhYiAxMDA2NDQKLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCisrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQpAQCAtNyw2ICs3LDcg
QEAKICNpbmNsdWRlICJtdDgxOTIuZHRzaSIKICNpbmNsdWRlICJtdDYzNTkuZHRzaSIKICNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9zcG1p
L3NwbWkuaD4KIAogLyB7CiAJYWxpYXNlcyB7CkBAIC02ODMsNiArNjg0LDU0IEBAIGNyNTBAMCB7
CiAJfTsKIH07CiAKKyZzcG1pIHsKKwkjYWRkcmVzcy1jZWxscyA9IDwyPjsKKwkjc2l6ZS1jZWxs
cyA9IDwwPjsKKworCW10NjMxNV82OiBwbWljQDYgeworCQljb21wYXRpYmxlID0gIm1lZGlhdGVr
LG10NjMxNS1yZWd1bGF0b3IiOworCQlyZWcgPSA8MHg2IFNQTUlfVVNJRD47CisKKwkJcmVndWxh
dG9ycyB7CisJCQltdDYzMTVfNl92YnVjazE6IHZidWNrMSB7CisJCQkJcmVndWxhdG9yLWNvbXBh
dGlibGUgPSAidmJ1Y2sxIjsKKwkJCQlyZWd1bGF0b3ItbmFtZSA9ICJWYmNwdSI7CisJCQkJcmVn
dWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzAwMDAwPjsKKwkJCQlyZWd1bGF0b3ItbWF4LW1pY3Jv
dm9sdCA9IDwxMTkzNzUwPjsKKwkJCQlyZWd1bGF0b3ItZW5hYmxlLXJhbXAtZGVsYXkgPSA8MjU2
PjsKKwkJCQlyZWd1bGF0b3ItYWxsb3dlZC1tb2RlcyA9IDwwIDEgMj47CisJCQkJcmVndWxhdG9y
LWFsd2F5cy1vbjsKKwkJCX07CisKKwkJCW10NjMxNV82X3ZidWNrMzogdmJ1Y2szIHsKKwkJCQly
ZWd1bGF0b3ItY29tcGF0aWJsZSA9ICJ2YnVjazMiOworCQkJCXJlZ3VsYXRvci1uYW1lID0gIlZs
Y3B1IjsKKwkJCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMDAwMDA+OworCQkJCXJlZ3Vs
YXRvci1tYXgtbWljcm92b2x0ID0gPDExOTM3NTA+OworCQkJCXJlZ3VsYXRvci1lbmFibGUtcmFt
cC1kZWxheSA9IDwyNTY+OworCQkJCXJlZ3VsYXRvci1hbGxvd2VkLW1vZGVzID0gPDAgMSAyPjsK
KwkJCQlyZWd1bGF0b3ItYWx3YXlzLW9uOworCQkJfTsKKwkJfTsKKwl9OworCisJbXQ2MzE1Xzc6
IHBtaWNANyB7CisJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2MzE1LXJlZ3VsYXRvciI7CisJ
CXJlZyA9IDwweDcgU1BNSV9VU0lEPjsKKworCQlyZWd1bGF0b3JzIHsKKwkJCW10NjMxNV83X3Zi
dWNrMTogdmJ1Y2sxIHsKKwkJCQlyZWd1bGF0b3ItY29tcGF0aWJsZSA9ICJ2YnVjazEiOworCQkJ
CXJlZ3VsYXRvci1uYW1lID0gIlZncHUiOworCQkJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0g
PDMwMDAwMD47CisJCQkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTE5Mzc1MD47CisJCQkJ
cmVndWxhdG9yLWVuYWJsZS1yYW1wLWRlbGF5ID0gPDI1Nj47CisJCQkJcmVndWxhdG9yLWFsbG93
ZWQtbW9kZXMgPSA8MCAxIDI+OworCQkJfTsKKwkJfTsKKwl9OworfTsKKwogJnVhcnQwIHsKIAlz
dGF0dXMgPSAib2theSI7CiB9OwotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
