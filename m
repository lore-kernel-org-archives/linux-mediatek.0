Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7ECC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 13:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K680/jiV2StzdefBLdi7btDO40Yk9kIX92YE/sff0Ks=; b=f1U6VEpRzocd62
	MCD4cVrZoIWZCrJie15QWweYyY/mOuTeFI6TNWwZRMsI1UcZi2WwM3SDsNc83TrR4anRjSmCX7KjG
	Se7zvlXHU8cLlyu87LLvfVrDvoGjliwrPi3PVSCsia17WmoSx7FGPsVKOtBaBKCELEIT4rWYr3Bpe
	mSBrnEjry/KA7m1m7spOVwfCth9WZrBOno2+bh79Lgjy4JtDdIxedM7dnixJLgeRKKHj1f0oqUCRW
	VGwn11qIk7zJMwNpu8zZI/BN6TVMZzeyAbOZHK4818vGQh8l6vtaTpW4/N/BThburiEBVhL2ekiL/
	3Jl9xey/G9/oPfU4j//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfX7-006koy-CA; Mon, 30 May 2022 13:34:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfT8-006iPC-R1; Mon, 30 May 2022 13:30:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 12EA7B80DAD;
	Mon, 30 May 2022 13:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708C4C385B8;
	Mon, 30 May 2022 13:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653917399;
	bh=gxsFb/v4AB0XAGjYM+rRf9p/fUvFDHFjqtE2n2EA7VY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dtp2cyHxzOTW7RRYqRW5zKm6djNVQwZ2f+HXsPI1paSCONXgteMdjF9e7RBHs5eAp
	 1/zeVHB4wxpxsASNDO2CxZkPujwzctgwQ3wrc27sFYTQ+/Q529sW7KJ0nZbWmjcAHA
	 vFPMhLLZ2rpnHeu5oHooqabKK5CBecai3mHZHYgTm1nxZLQ6azdxZrKOM+3birvxhE
	 rUHq9aRlz1Ex2zVU7mBqqXkDHLW+5IIi2ZHWWpfhEsPM5wUAU9LKBO5yuhTCDsWz3w
	 Ck9RyHmdHdY8rxxD1XIuciucX9yzOxzTFPRtplRL7kkg4koiP4HKjk+FhqzgcZuMFQ
	 bkAhiPk4hmXZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.18 123/159] media: mediatek: vcodec: prevent kernel crash when rmmod mtk-vcodec-dec.ko
Date: Mon, 30 May 2022 09:23:48 -0400
Message-Id: <20220530132425.1929512-123-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_063003_212764_F65EBC0E 
X-CRM114-Status: GOOD (  12.93  )
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

RnJvbTogWXVuZmVpIERvbmcgPHl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbT4KClsgVXBzdHJlYW0g
Y29tbWl0IGMxMGMwMDg2ZGI2ODhjOTViYjRlMGUzNzhlNTIzODE4ZGZmMTU1MWQgXQoKSWYgdGhl
IGRyaXZlciBzdXBwb3J0IHN1YmRldiBtb2RlLCB0aGUgcGFyYW1ldGVyICJkZXYtPnBtLmRldiIg
d2lsbCBiZQpOVUxMIGluIG10a192Y29kZWNfZGVjX3JlbW92ZS4gS2VybmVsIHdpbGwgY3Jhc2gg
d2hlbiB0cnkgdG8gcm1tb2QKbXRrLXZjb2RlYy1kZWMua28uCgpbIDQzODAuNzAyNzI2XSBwYyA6
IGRvX3Jhd19zcGluX3RyeWxvY2srMHg0LzB4ODAKWyA0MzgwLjcwNzA3NV0gbHIgOiBfcmF3X3Nw
aW5fbG9ja19pcnErMHg5MC8weDE0YwpbIDQzODAuNzExNTA5XSBzcCA6IGZmZmY4MDAwMDgxOWJj
MTAKWyA0MzgwLjcxNDgxMV0geDI5OiBmZmZmODAwMDA4MTliYzEwIHgyODogZmZmZjM2MDBjMDNl
NDAwMCB4Mjc6IDAwMDAwMDAwMDAwMDAwMDAKWyA0MzgwLjcyMTkzNF0geDI2OiAwMDAwMDAwMDAw
MDAwMDAwIHgyNTogMDAwMDAwMDAwMDAwMDAwMCB4MjQ6IDAwMDAwMDAwMDAwMDAwMDAKWyA0Mzgw
LjcyOTA1N10geDIzOiBmZmZmMzYwMGMwZjM0OTMwIHgyMjogZmZmZmQ1ZTkyMzU0OTAwMCB4MjE6
IDAwMDAwMDAwMDAwMDAyMjAKWyA0MzgwLjczNjE3OV0geDIwOiAwMDAwMDAwMDAwMDAwMjA4IHgx
OTogZmZmZmQ1ZTkyMTNlOGViYyB4MTg6IDAwMDAwMDAwMDAwMDAwMjAKWyA0MzgwLjc0MzI5OF0g
eDE3OiAwMDAwMDAyMDAwMDAwMDAwIHgxNjogZmZmZmQ1ZTkyMTNlOGU5MCB4MTU6IDY5NmMzNDZm
NjU2NDY5NzYKWyA0MzgwLjc1MDQyMF0geDE0OiAwMDAwMDAwMDAwMDAwMDAwIHgxMzogMDAwMDAw
MDAwMDAwMDAwMSB4MTI6IDAwMDAwMDAwMDAwMDAwNDAKWyA0MzgwLjc1NzU0Ml0geDExOiAwMDAw
MDAwMDAwMDAwMDAwIHgxMDogMDAwMDAwMDAwMDAwMDAwMCB4OSA6IDAwMDAwMDAwMDAwMDAwMDAK
WyA0MzgwLjc2NDY2NF0geDggOiAwMDAwMDAwMDAwMDAwMDAwIHg3IDogZmZmZjM2MDBjNzI3M2Fl
OCB4NiA6IGZmZmZkNWU5MjEzZThlYmMKWyA0MzgwLjc3MTc4Nl0geDUgOiAwMDAwMDAwMDAwMDAw
MDAwIHg0IDogMDAwMDAwMDAwMDAwMDAwMSB4MyA6IDAwMDAwMDAwMDAwMDAwMDAKWyA0MzgwLjc3
ODkwOF0geDIgOiAwMDAwMDAwMDAwMDAwMDAwIHgxIDogZmZmZjM2MDBjMDNlNDAwMCB4MCA6IDAw
MDAwMDAwMDAwMDAyMDgKWyA0MzgwLjc4NjAzMV0gQ2FsbCB0cmFjZToKWyA0MzgwLjc4ODQ2NV0g
IGRvX3Jhd19zcGluX3RyeWxvY2srMHg0LzB4ODAKWyA0MzgwLjc5MjQ2Ml0gIF9fcG1fcnVudGlt
ZV9kaXNhYmxlKzB4MmMvMHgxYjAKWyA0MzgwLjc5NjcyM10gIG10a192Y29kZWNfZGVjX3JlbW92
ZSsweDVjLzB4YTAgW210a192Y29kZWNfZGVjXQpbIDQzODAuODAyNDY2XSAgcGxhdGZvcm1fcmVt
b3ZlKzB4MmMvMHg2MApbIDQzODAuODA2MjA0XSAgX19kZXZpY2VfcmVsZWFzZV9kcml2ZXIrMHgx
OTQvMHgyNTAKWyA0MzgwLjgxMDgxMF0gIGRyaXZlcl9kZXRhY2grMHhjOC8weDE1YwpbIDQzODAu
ODE0NDYyXSAgYnVzX3JlbW92ZV9kcml2ZXIrMHg1Yy8weGIwClsgNDM4MC44MTgzNzVdICBkcml2
ZXJfdW5yZWdpc3RlcisweDM0LzB4NjQKWyA0MzgwLjgyMjI4OF0gIHBsYXRmb3JtX2RyaXZlcl91
bnJlZ2lzdGVyKzB4MTgvMHgyNApbIDQzODAuODI2OTc5XSAgbXRrX3Zjb2RlY19kZWNfZHJpdmVy
X2V4aXQrMHgxYy8weDg4OCBbbXRrX3Zjb2RlY19kZWNdClsgNDM4MC44MzMyNDBdICBfX2FybTY0
X3N5c19kZWxldGVfbW9kdWxlKzB4MTkwLzB4MjI0ClsgNDM4MC44MzgwMjBdICBpbnZva2Vfc3lz
Y2FsbCsweDQ4LzB4MTE0ClsgNDM4MC44NDE3NjBdICBlbDBfc3ZjX2NvbW1vbi5jb25zdHByb3Au
MCsweDYwLzB4MTFjClsgNDM4MC44NDY1NDBdICBkb19lbDBfc3ZjKzB4MjgvMHg5MApbIDQzODAu
ODQ5ODQ0XSAgZWwwX3N2YysweDRjLzB4MTAwClsgNDM4MC44NTI5NzVdICBlbDB0XzY0X3N5bmNf
aGFuZGxlcisweGVjLzB4ZjAKWyA0MzgwLjg1NzE0OF0gIGVsMHRfNjRfc3luYysweDE5MC8weDE5
NApbIDQzODAuODYwODAxXSBDb2RlOiA5NDQzMTUxNSAxN2ZmZmZjYSBkNTAzMjAxZiBkNTAzMjQ1
ZiAoYjk0MDAwMDQpCgpTaWduZWQtb2ZmLWJ5OiBZdW5mZWkgRG9uZyA8eXVuZmVpLmRvbmdAbWVk
aWF0ZWsuY29tPgpUZXN0ZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9A
Y29sbGFib3JhLmNvbT4KU2lnbmVkLW9mZi1ieTogSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNj
b0B4czRhbGwubmw+ClNpZ25lZC1vZmYtYnk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhh
YkBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5v
cmc+Ci0tLQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvbXRrX3Zjb2Rl
Y19kZWNfZHJ2LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
dmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay92Y29kZWMvbXRrX3Zjb2RlY19kZWNfZHJ2LmMKaW5kZXggZGY3YjI1ZTljYmM4Li4xMjhl
ZGNmNTQxZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNv
ZGVjL210a192Y29kZWNfZGVjX2Rydi5jCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jCkBAIC00ODcsNyArNDg3LDggQEAgc3Rh
dGljIGludCBtdGtfdmNvZGVjX2RlY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAkJdmlkZW9fdW5yZWdpc3Rlcl9kZXZpY2UoZGV2LT52ZmRfZGVjKTsKIAogCXY0bDJfZGV2
aWNlX3VucmVnaXN0ZXIoJmRldi0+djRsMl9kZXYpOwotCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYt
PnBtLmRldik7CisJaWYgKCFkZXYtPnZkZWNfcGRhdGEtPmlzX3N1YmRldl9zdXBwb3J0ZWQpCisJ
CXBtX3J1bnRpbWVfZGlzYWJsZShkZXYtPnBtLmRldik7CiAJbXRrX3Zjb2RlY19md19yZWxlYXNl
KGRldi0+ZndfaGFuZGxlcik7CiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjM1LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
