Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D02C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 19:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Seik8+1PgC52cCKETsh94n/cvqnfAjrTcrjaPPYtZ8=; b=f1Lv30Vx8qk0Nt
	6VS5cT1L3aimh1npbK6H9CXie6XQPttpWmelk2ZxRw8HOHIZ1FSf9B4CVuWAnXZloVEp7Tm68Ddej
	AZSctlfp2xJJzTCaHyiHETWMQBqWekio/+VfWS9yGhRN/B8ZdVDx5jJEmJZytIiJPaQv8M5ZV7lne
	ye13WrG6iT7d9eYSbtDxkCsdJ/jWVqFDja2pSn/ATcKJuWmNJzrGAJ8i9vYLkz+VlltpC7law6T0l
	3L5NJek0tBKSSH8gpWa/YNvYqyxpOvK1g4Psvh3m/1T6b8UyuzbtHRTOhyS5q2wdOJbSYDjVwNND0
	xMg6F2QKVMgpZz4SVs7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhWC-0000b0-Ix; Thu, 05 May 2022 19:52:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhRG-00HY6R-9W; Thu, 05 May 2022 19:47:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id A6FE71F45CD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651780021;
 bh=riKUyF3QA26FPC6IN4C9exUYKfoEiGvXUwpYMcRDj7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IEVITc3sCSDV2yoTf1mQwuHfgdj8nF+d/X2n/ZXKi5YwM4pS/WjEOl1DDvuWwo0cX
 HRjoOZee/WLN0iYDbwq3L9ydeRrTcCQoKLpcx3sD6uXW+L9di4gL1P7yjES8JrRTZW
 /PIYVbLAV0WClG+LBhsMYiLY/8LzDaRruJ/whCVuUVJngCTA1WixTyslwdSff4daGY
 S1mjJ6Uv2yolUv3Wcyb5cKE92j4ate6tCwKPdN+rxgyrb2k6tY1s/Lt5JHd2DrTKJ1
 F4I3r5vPy3rqobPCxOvXQ9V6zXFeE1WG9wn3UTDOOPczbAqri0k0AX1IX5CBw5MNrz
 5qD5Q98uEZ7nQ==
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
Subject: [PATCH v2 16/16] arm64: dts: mediatek: asurada: Add SPMI regulators
Date: Thu,  5 May 2022 15:45:50 -0400
Message-Id: <20220505194550.3094656-17-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505194550.3094656-1-nfraprado@collabora.com>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_124702_520386_FC7BA8B3 
X-CRM114-Status: GOOD (  10.76  )
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
cmVnbm9AY29sbGFib3JhLmNvbT4KCi0tLQoKQ2hhbmdlcyBpbiB2MjoKLSBBZGRlZCB0aGlzIHBh
dGNoCgogLi4uL2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kgICAgIHwgNDkg
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0
c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKaW5k
ZXggYTlmZmE3NGIyNzY0Li43ZjRjZWU5MjhmNzEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKQEAgLTcsNiArNyw3IEBACiAjaW5jbHVk
ZSAibXQ4MTkyLmR0c2kiCiAjaW5jbHVkZSAibXQ2MzU5LmR0c2kiCiAjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvZ3Bpby9ncGlvLmg+CisjaW5jbHVkZSA8ZHQtYmluZGluZ3Mvc3BtaS9zcG1pLmg+CiAK
IC8gewogCWFsaWFzZXMgewpAQCAtNjgzLDYgKzY4NCw1NCBAQCBjcjUwQDAgewogCX07CiB9Owog
Cismc3BtaSB7CisJI2FkZHJlc3MtY2VsbHMgPSA8Mj47CisJI3NpemUtY2VsbHMgPSA8MD47CisK
KwltdDYzMTVfNjogcG1pY0A2IHsKKwkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYzMTUtcmVn
dWxhdG9yIjsKKwkJcmVnID0gPDB4NiBTUE1JX1VTSUQ+OworCisJCXJlZ3VsYXRvcnMgeworCQkJ
bXQ2MzE1XzZfdmJ1Y2sxOiB2YnVjazEgeworCQkJCXJlZ3VsYXRvci1jb21wYXRpYmxlID0gInZi
dWNrMSI7CisJCQkJcmVndWxhdG9yLW5hbWUgPSAiVmJjcHUiOworCQkJCXJlZ3VsYXRvci1taW4t
bWljcm92b2x0ID0gPDMwMDAwMD47CisJCQkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTE5
Mzc1MD47CisJCQkJcmVndWxhdG9yLWVuYWJsZS1yYW1wLWRlbGF5ID0gPDI1Nj47CisJCQkJcmVn
dWxhdG9yLWFsbG93ZWQtbW9kZXMgPSA8MCAxIDI+OworCQkJCXJlZ3VsYXRvci1hbHdheXMtb247
CisJCQl9OworCisJCQltdDYzMTVfNl92YnVjazM6IHZidWNrMyB7CisJCQkJcmVndWxhdG9yLWNv
bXBhdGlibGUgPSAidmJ1Y2szIjsKKwkJCQlyZWd1bGF0b3ItbmFtZSA9ICJWbGNwdSI7CisJCQkJ
cmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzAwMDAwPjsKKwkJCQlyZWd1bGF0b3ItbWF4LW1p
Y3Jvdm9sdCA9IDwxMTkzNzUwPjsKKwkJCQlyZWd1bGF0b3ItZW5hYmxlLXJhbXAtZGVsYXkgPSA8
MjU2PjsKKwkJCQlyZWd1bGF0b3ItYWxsb3dlZC1tb2RlcyA9IDwwIDEgMj47CisJCQkJcmVndWxh
dG9yLWFsd2F5cy1vbjsKKwkJCX07CisJCX07CisJfTsKKworCW10NjMxNV83OiBwbWljQDcgewor
CQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NjMxNS1yZWd1bGF0b3IiOworCQlyZWcgPSA8MHg3
IFNQTUlfVVNJRD47CisKKwkJcmVndWxhdG9ycyB7CisJCQltdDYzMTVfN192YnVjazE6IHZidWNr
MSB7CisJCQkJcmVndWxhdG9yLWNvbXBhdGlibGUgPSAidmJ1Y2sxIjsKKwkJCQlyZWd1bGF0b3It
bmFtZSA9ICJWZ3B1IjsKKwkJCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMDAwMDA+Owor
CQkJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDExOTM3NTA+OworCQkJCXJlZ3VsYXRvci1l
bmFibGUtcmFtcC1kZWxheSA9IDwyNTY+OworCQkJCXJlZ3VsYXRvci1hbGxvd2VkLW1vZGVzID0g
PDAgMSAyPjsKKwkJCX07CisJCX07CisJfTsKK307CisKICZ1YXJ0MCB7CiAJc3RhdHVzID0gIm9r
YXkiOwogfTsKLS0gCjIuMzYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
