Return-Path: <SRS0=f9HX=7P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76D5C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 08:28:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 997ED2072F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 08:28:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nmeVEeMi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z2jt/IiE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 997ED2072F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0aNVsfa67WkwDMIbhfa6S4ML6fZBJdd+IRXSVxZniE=; b=nmeVEeMi6Xh6IR
	tfjk+szoAzQ5OhI4tIiEcXoOVFT6pgpTVyd4WPvu0ETWAIYB4K6zm5AxgMplAdFZL0Pu3AcgUBU3Q
	mIirFoLj3/sToSohdH6s4FEfCzFCTqkaJohaQqup12jn6uOYLpHVKJ1gPmejhvPzSoGWOhgv6Eckd
	LvnfrhhrHWNlnzBQzcrXzJbrWOtCkvjp8knA7S2l7jIvlQKG9KMrWemGcpU62SXv4Oeao3LLulzmo
	70JnHHmiYKFIjPZJv118CampCWIWy/u/AVkdn51AOc8vk3cC7Iacx2E1SMuIr0u+BpcpAvuaTZIfJ
	tQVtl5CzoizqMY3Bj7+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg2Hc-0006y5-Iq; Tue, 02 Jun 2020 08:28:28 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg2HU-0006nf-CK
 for linux-mediatek@lists.infradead.org; Tue, 02 Jun 2020 08:28:21 +0000
Received: by mail-wr1-x444.google.com with SMTP id t18so2434408wru.6
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Jun 2020 01:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=THpbqsIqcsaX8JFjkYqBpTRk1wV1aSkOMzOPc76FV+E=;
 b=Z2jt/IiEH08fKBjSDJW/rFkEDpi1SROeqBKQwYrsMkbHq7Dk0FvTxMe18SCdyWn6DA
 cA7BkgouNeJ2A7P1omaDU8w8B91/5SCDKgmVGagtq0OQs8PrixL9xFUzs+pALxIKecSU
 vOHjiyh7QDf/XqPep7KcBc6jTB9OaU9RYAQ+HSgUTVGn4lLHChfpp4t1Tn9XktuWJbc1
 u9GwPRfQV65HNE4RYo03toMPhu9gqrAotSVEmwwNKMIGcE32PgYrdRKt6LGFszNh4OMG
 tZc6ajirZPPYUDTwyrN/iyIE3WKyotRCT6gJqNAfvU4tXgrLZfMg8HloFXERP7qv8th3
 rILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=THpbqsIqcsaX8JFjkYqBpTRk1wV1aSkOMzOPc76FV+E=;
 b=VmKVdUZPzpOGK4RPWku8Tp9fU768IIXYgfe3MTjsrmVM1SEPvPRXbtU0xVr4H3ng3L
 1PWYCM7Ly0L8LzqVzPzAiZdmj98zinGFXGXy92vo2PUxmtFxwlNsNI2GJc7noeHjJ71c
 rRnoGYNa5anDejGHgK3Qoe1UrnU2tbUTBhqVsAqILmSEX2C2ry5xYsBLm2wj9EgnQWSd
 TE7js5e56s7lFqF9zZSXGPhpOd9jsAcvSVONmDLmf/DnDodJYIGQHvD8lGLRviKrp64W
 z0fzEMqIPwD8UeK6s5UvBCcbEujF5P6HJ90KOs99rXFcJ9VmbFzOmrGaV9SKLFen9xDR
 2a9Q==
X-Gm-Message-State: AOAM5307uFxs3itx99kajoA1j1S3OYAlIO50GMAK8EjUMlg3clWoz8Oi
 Td3x892D2glSoSZZimJ86Lf+mg==
X-Google-Smtp-Source: ABdhPJyfWM51ssitVrKZ+ILxEdr3bQxiA49aRTHpesRfUbEo6cvOqTynK9IKviDUA5E06Y92l1RKIg==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr26422025wrs.374.1591086498236; 
 Tue, 02 Jun 2020 01:28:18 -0700 (PDT)
Received: from dell ([95.147.198.92])
 by smtp.gmail.com with ESMTPSA id l2sm2480817wru.58.2020.06.02.01.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 01:28:17 -0700 (PDT)
Date: Tue, 2 Jun 2020 09:28:16 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v10] mfd: mt6360: add pmic mt6360 driver
Message-ID: <20200602082816.GC3714@dell>
References: <1591070142-7653-1-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591070142-7653-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_012820_418355_82F4D88E 
X-CRM114-Status: GOOD (  11.63  )
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

T24gVHVlLCAwMiBKdW4gMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBBZGQgTUZEIGRyaXZlciBmb3IgbXQ2MzYwIHBt
aWMgY2hpcCBpbmNsdWRlIEJhdHRlcnkgQ2hhcmdlci8KPiBVU0JfUEQvRmxhc2gsIExFRC9SR0Ig
YW5kIExFRC9MRE8vQnVjawo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVu
QHJpY2h0ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+CgpJIGRpZCBub3Qgc2lnbiB0aGlzIG9mZi4KCj4gLS0tCj4gIGRyaXZlcnMvbWZkL0tj
b25maWcgICAgICAgIHwgIDEyICsrCj4gIGRyaXZlcnMvbWZkL01ha2VmaWxlICAgICAgIHwgICAx
ICsKPiAgZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYyAgfCA0MjQgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvbWZkL210NjM2MC5o
IHwgMjQwICsrKysrKysrKysrKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA2Nzcg
aW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZmQvbXQ2MzYwLWNv
cmUuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvbXQ2MzYwLmgKPiAK
PiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjEgJiB2Mgo+IC0gaW5jbHVkZSBtaXNzaW5nIGhlYWRlciBm
aWxlCj4gCj4gY2hhbmdlbG9ncyBiZXR3ZWVuIHYyICYgdjMKPiAtIGFkZCBjaGFuZ2Vsb2dzCj4g
Cj4gY2hhbmdlbG9ncyBiZXR3ZWVuIHYzICYgdjQKPiAtIGZpeCBLY29uZmlnIGRlc2NyaXB0aW9u
Cj4gLSByZXBsYWNlIG10NjM2MF9wbXVfaW5mbyB3aXRoIG10NjM2MF9wbXVfZGF0YQo+IC0gcmVw
bGFjZSBwcm9iZSB3aXRoIHByb2JlX25ldwo+IC0gcmVtb3ZlIHVubmVjZXNzYXJ5IGlycV9jaGlw
IHZhcmlhYmxlCj4gLSByZW1vdmUgYW5ub3RhdGlvbgo+IC0gcmVwbGFjZSBNVDYzNjBfTUZEX0NF
TEwgd2l0aCBPRl9NRkRfQ0VMTAo+IAo+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2NCAmIHY1Cj4gLSBy
ZW1vdmUgdW5uZWNlc3NhcnkgcGFyc2UgZHQgZnVuY3Rpb24KPiAtIHVzZSBkZXZtX2kyY19uZXdf
ZHVtbXlfZGV2aWNlCj4gLSBhZGQgYmFzZS1jb21taXQgbWVzc2FnZQo+IAo+IGNoYW5nZWxvZ3Mg
YmV0d2VlbiB2NSAmIHY2Cj4gLSByZXZpZXcgcmV0dXJuIHZhbHVlCj4gLSByZW1vdmUgaTJjIGlk
X3RhYmxlCj4gLSB1c2UgR1BMIGxpY2Vuc2UgdjIKPiAKPiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjYg
JiB2Nwo+IC0gYWRkIGF1dGhvciBkZXNjcmlwdGlvbgo+IC0gcmVwbGFjZSBNVDYzNjBfUkVHTUFQ
X0lSUV9SRUcgYnkgUkVHTUFQX0lSUV9SRUdfTElORQo+IC0gcmVtb3ZlIG10NjM2MC1wcml2YXRl
LmgKPiAKPiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjcgJiB2OAo+IC0gZml4IGtidWlsZCBhdXRvIHJl
Ym9vdCBieSBpbmNsdWRlIGludGVycnVwdCBoZWFkZXIKPiAKPiBjaGFuZ2Vsb2dzIGJldHdlZW4g
djggJiB2OQo+IC0gZml4IEdQTCBsaWNlbnNlIG91dCBvZiBkYXRlCj4gLSBhZGQgY29tbWl0IG1l
c3NhZ2UgYWJvdXQgQWNrZWQtZm9yLU1GRC1ieQo+IAo+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2OSAm
IHYxMAoKdjkgb2YgdGhpcyBwYXRjaCBpcyBhbHJlYWR5IGFwcGxpZWQuCgpZb3UgY2Fubm90IHNl
bmQgYSB2MTAuCgo+IC0gZml4IGR1cGxpY2F0ZSBkZWZpbmUgb2Yga2J1aWxkIHRlc3QgcmVib290
IGluaXRpYWxpemVyLW92ZXJyaWRlcwoKSSBmaXhlZCB0aGlzIGFscmVhZHkuCgpodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9sZWUvbWZkLmdpdC9jb21taXQv
P2g9Zm9yLW1mZC1uZXh0JmlkPTA5OGM0YWRmMjQ5YzE5ODUxOWE0YWJlYmU0ODJiMWU2YjhjNTBl
NDcKCj4gLSBzeW5jIGNvbW1pdCBtZXNzYWdlIGZvcm1hdAoKLS0gCkxlZSBKb25lcyBb5p2O55C8
5pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBz
b3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdp
dHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
