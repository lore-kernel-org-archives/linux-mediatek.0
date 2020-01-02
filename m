Return-Path: <SRS0=VH+m=2X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1689C2D0DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 08:47:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C255520866
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 08:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="or7YBQdO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BCROBod9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C255520866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3kAxntBvW42XIuHADiQVpib05wYlfiigkN5L2YdF+Y=; b=or7YBQdOgiOGlL
	wQ6CQ4naoIXOHjDeGJ5d6j/gI4Zkymo/8E3lY+c66BLay6BuSVjEpQsWBS21WNG1vksYlF6zXmDFd
	zxdlse19WMs3eyBC4F+JHat9TlyLKusDLOAjCWP99V2HpSAsTXA1lv/q39yhl3N87s2Hlc+ebfnQg
	Vb8Q+j1Nrp1R3l3jMfJ0gYImGXq6feIveEDi8wLS5jXUIjXYgJu4AFqt6/I902WzYxbn5JzchT+RB
	Oy3JgnYewlEowJcqtKhFkUp/j0CdEAL+P+UbUcVVE0P90aPO3X6ksAnA10STVNRkXuWWJ9niw+Lct
	vFh+0/ef0OBAr6sMSbUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imw81-00060a-RT; Thu, 02 Jan 2020 08:46:49 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imw7s-0005rY-Uf
 for linux-mediatek@lists.infradead.org; Thu, 02 Jan 2020 08:46:43 +0000
Received: by mail-wr1-x443.google.com with SMTP id g17so38484869wro.2
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Jan 2020 00:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=J4BV4xVxmbRJ/r05rBs0QYCjejbH9ewz1c2yLbanQBw=;
 b=BCROBod9j1yy6ajGa+uGcRO+X7a2oqm4ydiMzZwtcBr9thqmJoeDeB8vBmZ8hG0bas
 pRPAAfyxHm4lV8LwRhEx8jE7sUssEq5x7jyXSEWyaeVjbx6ftoR15mx1tVsz9zBJPr7c
 XKAtOPTAmr9rL8LaoS6MAbOmkxPCkurDhm33TvQuGx+C4zXTRjiHvzEgka/uTyIuQRQZ
 4okHxCZsuUbIzRcY+45HcNOTYwAZ9GKO2r45tzSpjwejmSI5KqXeACQ7w61v6Pvkr5HN
 sAcbzQvhK41LfV8r0fmaOsCu/wE88cGOus0huQH7AwGLIQ5s63Vl1ClDEY5SRBvILAPv
 CzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=J4BV4xVxmbRJ/r05rBs0QYCjejbH9ewz1c2yLbanQBw=;
 b=swHhttF9BMTmjkGnfFr6luOAnjOJvgHBg6LenMfYx603r0X8FDezwZhnTqKsN3N1CH
 cZ1IRl7Rj/zDvHOr5pnuCWFS4MObp1p8aMTlcK9XE5flBESRxfGza1gEeUGQm5qSzg+x
 z6OqyksZwMDiP/lCiBt1P1+UmMbXT9g6X+dULNJH3fHb8j98VYj3/pqZrTuX9ZMwrCgu
 /TKYvDdGDR8CGMzklqSzR9S79pNBAhM9NouTpG6Y4KoPgvzM55AwPnBydwceNPWpQ49L
 Pg1R4SKwknSfqJj42e8kwnKH+uT2lfhGnNai/9/EM+13P7iRHYGsQgBGgubrsyi8rpxK
 WpNg==
X-Gm-Message-State: APjAAAUtyXSenlh24o+H+IYQL2rC8QdhZCLO9wFALrPrg6JveCy3BW88
 Qbdjk0pY8PVHiHtlwGYlIF+udw==
X-Google-Smtp-Source: APXvYqwSDKoiB5ra6drQsoyYVfGcpU9ytlL7NbMzlMJbbOVavFr5G0msLQo7wTmzibB98v+znbhMpQ==
X-Received: by 2002:a5d:68c5:: with SMTP id p5mr83053200wrw.193.1577954798497; 
 Thu, 02 Jan 2020 00:46:38 -0800 (PST)
Received: from dell ([2.27.35.135])
 by smtp.gmail.com with ESMTPSA id g2sm54686011wrw.76.2020.01.02.00.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 00:46:37 -0800 (PST)
Date: Thu, 2 Jan 2020 08:46:50 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v6] mfd: mt6360: add pmic mt6360 driver
Message-ID: <20200102084650.GA22390@dell>
References: <20191225014148.19082-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191225014148.19082-1-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_004641_184567_F3ECE309 
X-CRM114-Status: GOOD (  18.48  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyNSBEZWMgMjAxOSwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBBZGQgbWZkIGRyaXZlciBmb3IgbXQ2MzYwIHBt
aWMgY2hpcCBpbmNsdWRlCj4gQmF0dGVyeSBDaGFyZ2VyL1VTQl9QRC9GbGFzaCBMRUQvUkdCIExF
RC9MRE8vQnVjawo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0
ZWsuY29tCj4gLS0tCj4gIGRyaXZlcnMvbWZkL0tjb25maWcgICAgICAgICAgICAgICAgfCAgMTIg
Kwo+ICBkcml2ZXJzL21mZC9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVy
cy9tZmQvbXQ2MzYwLWNvcmUuYyAgICAgICAgICB8IDQyNiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNjAtcHJpdmF0ZS5oIHwgMjE3ICsrKysr
KysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNjAuaCAgICAgICAgIHwgIDMyICsr
Kwo+ICA1IGZpbGVzIGNoYW5nZWQsIDY4OCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2xpbnV4L21mZC9tdDYzNjAtcHJpdmF0ZS5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2xpbnV4L21mZC9tdDYzNjAuaAo+IAo+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2MSAmIHYyCj4g
LSBpbmNsdWRlIG1pc3NpbmcgaGVhZGVyIGZpbGUKPiAKPiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjIg
JiB2Mwo+IC0gYWRkIGNoYW5nZWxvZ3MKPiAKPiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjMgJiB2NAo+
IC0gZml4IEtjb25maWcgZGVzY3JpcHRpb24KPiAtIHJlcGxhY2UgbXQ2MzYwX3BtdV9pbmZvIHdp
dGggbXQ2MzYwX3BtdV9kYXRhCj4gLSByZXBsYWNlIHByb2JlIHdpdGggcHJvYmVfbmV3Cj4gLSBy
ZW1vdmUgdW5uZWNlc3NhcnkgaXJxX2NoaXAgdmFyaWFibGUKPiAtIHJlbW92ZSBhbm5vdGF0aW9u
Cj4gLSByZXBsYWNlIE1UNjM2MF9NRkRfQ0VMTCB3aXRoIE9GX01GRF9DRUxMCj4gCj4gY2hhbmdl
bG9ncyBiZXR3ZWVuIHY0ICYgdjUKPiAtIHJlbW92ZSB1bm5lY2Vzc2FyeSBwYXJzZSBkdCBmdW5j
dGlvbgo+IC0gdXNlIGRldm1faTJjX25ld19kdW1teV9kZXZpY2UKPiAtIGFkZCBiYXNlLWNvbW1p
dCBtZXNzYWdlCj4gCj4gY2hhbmdlbG9ncyBiZXR3ZWVuIHY1ICYgdjYKPiAtIHJldmlldyByZXR1
cm4gdmFsdWUKPiAtIHJlbW92ZSBpMmMgaWRfdGFibGUKPiAtIHVzZSBHUEwgbGljZW5zZSB2Mgo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9LY29uZmlnIGIvZHJpdmVycy9tZmQvS2NvbmZp
Zwo+IGluZGV4IDQyMDkwMDg1MjE2Ni4uZTZkZjkxZDU1NDA1IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbWZkL0tjb25maWcKPiArKysgYi9kcml2ZXJzL21mZC9LY29uZmlnCj4gQEAgLTg1Niw2ICs4
NTYsMTggQEAgY29uZmlnIE1GRF9NQVg4OTk4Cj4gIAkgIGFkZGl0aW9uYWwgZHJpdmVycyBtdXN0
IGJlIGVuYWJsZWQgaW4gb3JkZXIgdG8gdXNlIHRoZSBmdW5jdGlvbmFsaXR5Cj4gIAkgIG9mIHRo
ZSBkZXZpY2UuCj4gIAo+ICtjb25maWcgTUZEX01UNjM2MAo+ICsJdHJpc3RhdGUgIk1lZGlhdGVr
IE1UNjM2MCBTdWJQTUlDIgo+ICsJc2VsZWN0IE1GRF9DT1JFCj4gKwlzZWxlY3QgUkVHTUFQX0ky
Qwo+ICsJc2VsZWN0IFJFR01BUF9JUlEKPiArCWRlcGVuZHMgb24gSTJDCj4gKwloZWxwCj4gKwkg
IFNheSBZIGhlcmUgdG8gZW5hYmxlIE1UNjM2MCBQTVUvUE1JQy9MRE8gZnVuY3Rpb25hbCBzdXBw
b3J0Lgo+ICsJICBQTVUgcGFydCBpbmNsdWRlcyBDaGFyZ2VyLCBGbGFzaGxpZ2h0LCBSR0IgTEVE
Cj4gKwkgIFBNSUMgcGFydCBpbmNsdWRlcyAyLWNoYW5uZWwgQlVDS3MgYW5kIDItY2hhbm5lbCBM
RE9zCj4gKwkgIExETyBwYXJ0IGluY2x1ZGVzIDQtY2hhbm5lbCBMRE9zCj4gKwo+ICBjb25maWcg
TUZEX01UNjM5Nwo+ICAJdHJpc3RhdGUgIk1lZGlhVGVrIE1UNjM5NyBQTUlDIFN1cHBvcnQiCj4g
IAlzZWxlY3QgTUZEX0NPUkUKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvTWFrZWZpbGUgYi9k
cml2ZXJzL21mZC9NYWtlZmlsZQo+IGluZGV4IGFlZDk5ZjA4NzM5Zi4uZjVmODBkNzVlZTUzIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbWZkL01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9tZmQvTWFr
ZWZpbGUKPiBAQCAtMjM3LDYgKzIzNyw3IEBAIG9iai0kKENPTkZJR19JTlRFTF9TT0NfUE1JQykJ
Kz0gaW50ZWwtc29jLXBtaWMubwo+ICBvYmotJChDT05GSUdfSU5URUxfU09DX1BNSUNfQlhUV0Mp
CSs9IGludGVsX3NvY19wbWljX2J4dHdjLm8KPiAgb2JqLSQoQ09ORklHX0lOVEVMX1NPQ19QTUlD
X0NIVFdDKQkrPSBpbnRlbF9zb2NfcG1pY19jaHR3Yy5vCj4gIG9iai0kKENPTkZJR19JTlRFTF9T
T0NfUE1JQ19DSFREQ19USSkJKz0gaW50ZWxfc29jX3BtaWNfY2h0ZGNfdGkubwo+ICtvYmotJChD
T05GSUdfTUZEX01UNjM2MCkJKz0gbXQ2MzYwLWNvcmUubwo+ICBtdDYzOTctb2Jqcwk6PSBtdDYz
OTctY29yZS5vIG10NjM5Ny1pcnEubwo+ICBvYmotJChDT05GSUdfTUZEX01UNjM5NykJKz0gbXQ2
Mzk3Lm8KPiAgb2JqLSQoQ09ORklHX0lOVEVMX1NPQ19QTUlDX01SRkxEKQkrPSBpbnRlbF9zb2Nf
cG1pY19tcmZsZC5vCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMgYi9k
cml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwMDAuLmY2ZDQzYjZkYWQ0ZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJz
L21mZC9tdDYzNjAtY29yZS5jCj4gQEAgLTAsMCArMSw0MjYgQEAKPiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAKPiArLyoKPiArICogQ29weXJpZ2h0IChjKSAyMDE5IE1lZGlh
VGVrIEluYy4KCk5vIGF1dGhvcj8KCj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgPGxpbnV4L2kyYy5o
Pgo+ICsjaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+ICsjaW5jbHVkZSA8bGludXgva2VybmVsLmg+
Cj4gKyNpbmNsdWRlIDxsaW51eC9tZmQvY29yZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4KPiArI2luY2x1ZGUgPGxpbnV4L29mX3Bs
YXRmb3JtLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC92ZXJzaW9uLmg+Cj4gKwo+ICsjaW5jbHVkZSA8
bGludXgvbWZkL210NjM2MC5oPgo+ICsjaW5jbHVkZSA8bGludXgvbWZkL210NjM2MC1wcml2YXRl
Lmg+CgpbLi4uXQoKPiArI2RlZmluZSBNVDYzNjBfUkVHTUFQX0lSUV9SRUcoX2lycV9ldnQpCQlc
Cj4gKwlSRUdNQVBfSVJRX1JFRyhfaXJxX2V2dCwgKF9pcnFfZXZ0KSAvIDgsIEJJVCgoX2lycV9l
dnQpICUgOCkpCgpObyBuZWVkIHRvIHJvbGwgeW91ciBvd24gbWFjcm9zIGZvciB0aGlzLiAgSSB0
aGluawpSRUdNQVBfSVJRX1JFR19MSU5FKCkgaXMgd2hhdCB5b3UncmUgbG9va2luZyBmb3IuCgo+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9pcnEgbXQ2MzYwX3BtdV9pcnFzW10gPSAgewoK
CVJFR01BUF9JUlFfUkVHX0xJTkUoTVQ2MzYwX0NIR19UUkVHX0VWVCwgOCksCgouLi4gZXRjLgoK
PiArCU1UNjM2MF9SRUdNQVBfSVJRX1JFRyhNVDYzNjBfQ0hHX1RSRUdfRVZUKSwKPiArCU1UNjM2
MF9SRUdNQVBfSVJRX1JFRyhNVDYzNjBfQ0hHX0FJQ1JfRVZUKSwKClsuLi5dCgo+ICsJTVQ2MzYw
X1JFR01BUF9JUlFfUkVHKE1UNjM2MF9MRE83X1BHQl9FVlQpLAo+ICt9OwoKWy4uLl0KCj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWZkL210NjM2MC1wcml2YXRlLmggYi9pbmNsdWRlL2xp
bnV4L21mZC9tdDYzNjAtcHJpdmF0ZS5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwMDAuLmQ1NDI2NTJmNGRlMAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9pbmNsdWRl
L2xpbnV4L21mZC9tdDYzNjAtcHJpdmF0ZS5oCgpBcyB0aGVyZSBhcmUgb25seSBhcHByb3ByaWF0
ZWx5IG5hbWVzcGFjZWQgbWFjcm9zIGluIGhlcmUsIEkgd291bGQKbW92ZSB0aGVtIHRvIHRoZSBu
b3JtYWwgaGVhZGVyIGZpbGUgYW5kIGRpc3Bvc2Ugb2YgdGhpcyBvbmUuCgo+IEBAIC0wLDAgKzEs
MjE3IEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4gKy8qCj4g
KyAqIENvcHlyaWdodCAoYykgMjAxOSBNZWRpYVRlayBJbmMuCj4gKyAqLwo+ICsKPiArI2lmbmRl
ZiBfX01UNjM2MF9QUklWQVRFX0hfXwo+ICsjZGVmaW5lIF9fTVQ2MzYwX1BSSVZBVEVfSF9fCj4g
Kwo+ICsvKiBQTVUgcmVnaXN0ZXIgZGVmaW5pbml0aW9uICovCj4gKyNkZWZpbmUgTVQ2MzYwX1BN
VV9ERVZfSU5GTwkJCSgweDAwKQo+ICsjZGVmaW5lIE1UNjM2MF9QTVVfQ09SRV9DVFJMMQkJCSgw
eDAxKQoKWy4uLl0KCj4gKyNkZWZpbmUgTVQ2MzYwX1BNVV9MRE9fTUFTSzIJCQkoMHhGRikKPiAr
I2RlZmluZSBNVDYzNjBfUE1VX01BWFJFRwkJCShNVDYzNjBfUE1VX0xET19NQVNLMikKPiArCj4g
Ky8qIE1UNjM2MF9QTVVfSVJRX1NFVCAqLwo+ICsjZGVmaW5lIE1UNjM2MF9QTVVfSVJRX1JFR05V
TQkoTVQ2MzYwX1BNVV9MRE9fSVJRMiAtIE1UNjM2MF9QTVVfQ0hHX0lSUTEgKyAxKQo+ICsjZGVm
aW5lIE1UNjM2MF9JUlFfUkVUUklHCUJJVCgyKQo+ICsKPiArI2RlZmluZSBDSElQX1ZFTl9NQVNL
CQkJCSgweEYwKQo+ICsjZGVmaW5lIENISVBfVkVOX01UNjM2MAkJCQkoMHg1MCkKPiArI2RlZmlu
ZSBDSElQX1JFVl9NQVNLCQkJCSgweDBGKQo+ICsKPiArI2VuZGlmIC8qIF9fTVQ2MzYwX1BSSVZB
VEVfSF9fICovCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNo
bmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNv
Q3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
