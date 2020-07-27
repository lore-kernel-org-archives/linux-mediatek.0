Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A57C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 11:08:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80174205CB
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 11:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2drYXCcx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V9XuKevR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80174205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z20E0wIbvPDSYRPY76am7nvnSZ5Bv9lU1Kv/cFTtIPU=; b=2drYXCcx93oPWGbWFCR9KJ4W3
	YR5jMAiRPSZaUwi8u/IL5cHDyM7cn9NK5q+XnW3z9bOmacq58lD6GsABg/IfzM++rT8eOTQbN57Sw
	HdH7S3jYH/pLZfuQS72/ia+5xFMluM1jpZbrGWgOz7SzeT3QN26tJs+6Akh7GkcF1EbviIPg7gsEL
	Uf5tO+xesmkXOEiCWy7/ei4TYzJrcw0RLONUPKxK4BJhc11jrT3VjfU3bDELEa/BGypCc6xZv6hCO
	1ah4o4fPWX9+CJf424mMN1AkY0Q2Kp0NS3h9xk/f9DTAb9zGFEmITWHxw3EMxshKo/617L+RgI572
	sZFaKcb9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k00zd-0001jg-U8; Mon, 27 Jul 2020 11:08:29 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k00za-0001hk-L9
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 11:08:28 +0000
Received: by mail-wr1-x441.google.com with SMTP id a14so14459796wra.5
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 04:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qURU45Kb+6c1KqHtW0F2gSyFK0AFPhbSpzUMWZVfYyw=;
 b=V9XuKevRcMdAg3nJ98vwGFYpUqj6aTb99a24/sEOyectnuhsyGk0ZogRrquWiL19BV
 yuxxUqMfj0B+lxbDfuUYV/aRINiRDFZXstTO6h7JRdh2kzRV4zuuI2DKG5NekLDpBDN1
 OWQCzWN6pUyPJxRyOsxySFKaE1Uvnn22hYGFh5gDl+XNEYqckBu7FoD0FanBeY6JC2SU
 SYSLznGYb5kkP/4a7cUeSnu+rUGhndxh0Yh4c69dBLv33SocW+LVOLTfriQD9bDyBroE
 K1yJ1CppcNxh/lQBT2bGvjA3qQHjHR3rHcM8pXw9NjM8cw/3muuvH1BtlntUgEs0RP10
 nACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qURU45Kb+6c1KqHtW0F2gSyFK0AFPhbSpzUMWZVfYyw=;
 b=KShLxOJVykSqI2HW24WFUm0NLQkej26v1CIr3KJVrDDZaJoaD+KBUctGhLOTgYZnMc
 IXr7WoMWP6tyijvogBAtaRjfti0+mp+yBR+L72vQ85TLU8W2NSqDU/J/sz8OPIRyC4AZ
 GJwDlOtZqT/wX6hIapMAdQMz6LKgcoUkD9/WCxdQreIYUO6o0l00Ca0tbbTJZ36DfunP
 bMTT8VEhIsntdHrzGYT7ioMV5yMUya2Z6W1CHhVSW3Rh4zSGTZrcs2UMte64L/xrS52A
 RK2Ax6311mZAI9CWlbQjzYxw+6SyjUyIQJElTU6ZVJY9Sme/HSPXi09a1WkVSVL54N6m
 bi8g==
X-Gm-Message-State: AOAM530zNkknvrTC4m/gN8Dp9E2+wdo4D43lt6x+uU/dNzR/Qrc0/66r
 dzfWg0KA/z/moZfQWoNEP5wjig==
X-Google-Smtp-Source: ABdhPJw3u23L4RGaem28Ie9bN9I/a+j+lvOfQgQboVl6nTwgWMo2fvXQmJKjwCEeluX+TMOAYG+oRg==
X-Received: by 2002:adf:e48f:: with SMTP id i15mr18894627wrm.327.1595848103943; 
 Mon, 27 Jul 2020 04:08:23 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id g3sm13325267wrb.59.2020.07.27.04.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 04:08:23 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:08:21 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 1/9] mfd: mt6360: Rearrange include file
Message-ID: <20200727110821.GH1850026@dell>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594983811-25908-2-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594983811-25908-2-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_070827_042379_51446FD2 
X-CRM114-Status: GOOD (  13.74  )
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
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNyBKdWwgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBSZWFycmFuZ2UgaW5jbHVkZSBmaWxlIHdpdGhv
dXQgc29ydGluZyBieSBhbHBoYWJldC4KCldoeSBhcmUgeW91IG1ha2luZyB0aGlzIGNoYW5nZT8K
Cj4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMgfCAxMSArKysrKy0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIGIvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+
IGluZGV4IGU5Y2FjYzIuLmRmNDUwNmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZmQvbXQ2MzYw
LWNvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiBAQCAtNSwxNSArNSwx
NCBAQAo+ICAgKiBBdXRob3I6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ICAg
Ki8KPiAgCj4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiArI2luY2x1ZGUgPGxpbnV4L21v
ZHVsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvaTJjLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9pbml0
Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9jcmM4Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9zbGFiLmg+
Cj4gKyNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVw
dC5oPgo+IC0jaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tZmQv
Y29yZS5oPgo+IC0jaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9v
Zl9pcnEuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+Cj4gLSNpbmNsdWRlIDxs
aW51eC92ZXJzaW9uLmg+Cj4gIAo+ICAjaW5jbHVkZSA8bGludXgvbWZkL210NjM2MC5oPgo+ICAK
Ci0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxv
cGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0g
U29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
