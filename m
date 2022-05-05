Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658C5C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 19:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87tu0HRLPbee2khYVkVjb7TaV8BbpOxGD5VUijOIXb4=; b=z9fQzowGhin9Hx
	S42o/acNl6XDzQYst54SQF5C3e7t17MHb+mSvLAjqUhhWzI6LRDgcCva/7zZZiKG5PGGyjj+mNApx
	y3C1RqWp2L4XWUvQs5K1wXElJOjuQApQzuyKHjnCr7rL6nn/iMDCAqvNnPRv7zYb1qxhyFZ27o/mG
	bG7DzmUDNURag4PhxQW1C0RfNbhHiSWDKoZhdbPoG5QiGKilisiKKi3J5xpVJvfaAjVupT6Q1SPLk
	mj5CuNIm9arTCQMRzwK4arLrGEBE9K7xCE/wNrLK4KWaMz00hdYgsLF1zBVtGwNdqFzPvS+NIe7ki
	P158O2gsCIILoHIGU4nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhVs-0000NC-Mu; Thu, 05 May 2022 19:51:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhRD-00HY3a-Bb; Thu, 05 May 2022 19:47:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 6824E1F45CD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651780018;
 bh=66Gcdl/BCzrTY3JeghuLR7TheiL9yVTorpEjlpfyV/8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=clx1QUAk8PRxDtNJSmG0WHj2SvvJhV+eWQHT6V/uHzLDOmjgrAULRqO22jnVi4B7R
 KrVPYpgopgTt1EP8r9ITnc8O+J0zWoALXltUIlU1cL330dOvZXLUCCC5WvpS1GByNC
 ewX4Aw73EaPT9GEZizyuUoeVJNqZiHgp9asN6Ba70yDdGS2wfn0rFL+dZbBve2HE+u
 Q03Q774WnoLME1E14XLDNaz5PbAhH+9Pu2D9IYS1kJWeONUh3TkMdgiwdAsqNOcs+a
 llLphy1KdOCJ3XBNSMTNM9ajhJXzP+a/TX3NMush3nP/lmA/gxDydY6tACIvzxBENx
 vz2hB6Q0KBEeg==
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
Subject: [PATCH v2 15/16] arm64: dts: mediatek: asurada: Add MT6359 PMIC
Date: Thu,  5 May 2022 15:45:49 -0400
Message-Id: <20220505194550.3094656-16-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505194550.3094656-1-nfraprado@collabora.com>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_124659_632761_064EF0C9 
X-CRM114-Status: GOOD (  11.57  )
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

TVQ2MzU5IGlzIHRoZSBwcmltYXJ5IFBNSUMgcHJlc2VudCBvbiB0aGUgQXN1cmFkYSBwbGF0Zm9y
bS4gSW5jbHVkZSBpdHMKZHRzaSBhbmQgY29uZmlndXJlIHByb3BlcnRpZXMgc3BlY2lmaWMgZm9y
IHRoZSBwbGF0Zm9ybS4KClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxu
ZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVs
IFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CgotLS0KCkNo
YW5nZXMgaW4gdjI6Ci0gQWRkZWQgdGhpcyBwYXRjaAoKIC4uLi9ib290L2R0cy9tZWRpYXRlay9t
dDgxOTItYXN1cmFkYS5kdHNpICAgICB8IDMwICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCmluZGV4IDg3YTlhNmIxZWFiYy4uYTlmZmE3NGIyNzY0
IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRh
LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5k
dHNpCkBAIC01LDYgKzUsNyBAQAogICovCiAvZHRzLXYxLzsKICNpbmNsdWRlICJtdDgxOTIuZHRz
aSIKKyNpbmNsdWRlICJtdDYzNTkuZHRzaSIKICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dw
aW8uaD4KIAogLyB7CkBAIC0xNjgsNiArMTY5LDMxIEBAICZpMmM3IHsKIAlwaW5jdHJsLTAgPSA8
JmkyYzdfcGlucz47CiB9OwogCisvKiBmb3IgQ09SRSAqLworJm10NjM1OV92Z3B1MTFfYnVja19y
ZWcgeworCXJlZ3VsYXRvci1hbHdheXMtb247Cit9OworCismbXQ2MzU5X3ZncHUxMV9zc2h1Yl9i
dWNrX3JlZyB7CisJcmVndWxhdG9yLWFsd2F5cy1vbjsKKwlyZWd1bGF0b3ItbWluLW1pY3Jvdm9s
dCA9IDw1NzUwMDA+OworCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDU3NTAwMD47Cit9Owor
CismbXQ2MzU5X3ZyZjEyX2xkb19yZWcgeworCXJlZ3VsYXRvci1hbHdheXMtb247Cit9OworCism
bXQ2MzU5X3Z1ZnNfbGRvX3JlZyB7CisJcmVndWxhdG9yLWFsd2F5cy1vbjsKK307CisKKyZtdDYz
NTljb2RlYyB7CisJbWVkaWF0ZWssZG1pYy1tb2RlID0gPDE+OyAvKiBvbmUtd2lyZSAqLworCW1l
ZGlhdGVrLG1pYy10eXBlLTAgPSA8Mj47IC8qIERNSUMgKi8KKwltZWRpYXRlayxtaWMtdHlwZS0y
ID0gPDI+OyAvKiBETUlDICovCit9OworCiAmcGNpZSB7CiAJcGluY3RybC1uYW1lcyA9ICJkZWZh
dWx0IjsKIAlwaW5jdHJsLTAgPSA8JnBjaWVfcGlucz47CkBAIC01NTksNiArNTg1LDEwIEBAIHBp
bnMtcmVwb3J0LXN3IHsKIAl9OwogfTsKIAorJnBtaWMgeworCWludGVycnVwdHMtZXh0ZW5kZWQg
PSA8JnBpbyAyMTQgSVJRX1RZUEVfTEVWRUxfSElHSD47Cit9OworCiAmc3BpMSB7CiAJc3RhdHVz
ID0gIm9rYXkiOwogCi0tIAoyLjM2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
