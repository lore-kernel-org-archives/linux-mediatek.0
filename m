Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E679C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 11:10:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDCA4205CB
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 11:10:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bL3Q44vN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a0e1sqnj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDCA4205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qNtzkB1bj3xNRlvzDSFZGc58I12TolBi08H05p/BKVQ=; b=bL3Q44vNpx75kD6XY7u9D45Ly
	t4BnOlFplqUitlzMleRueiF1oD7rO+j+bjot+lrWxWJ2VUbQH9tpM7zo+/jWDuZVFlaGpU7yYGy/f
	7Qya8kipPJTC9LLfF91bX+7UZayGOOL3GxSkw7HXUV5Z1V4+zcIIZHyV94V7bMvUaFtiXerATf6AU
	eC+KnETdJfNElGGpf3n7D2Q3MPoSs2j0rg8fYdswtLg+mCbb4jFrSP//7hjj7zjn2cK9JZe6cciC+
	3xzPLhc9PZEkpyWLrKvBSeShiuB6T6XPKzs6sUvHzuFo9uNNY4TGEgoEI5vYr10Sk57a6Io0LL6X3
	jAJFykKKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k011B-00029J-Mx; Mon, 27 Jul 2020 11:10:05 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0118-00027y-53
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 11:10:03 +0000
Received: by mail-wr1-x442.google.com with SMTP id l2so3888811wrc.7
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 04:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4QlGeWxo0Xv8FxeXIA+s7ap15MeXV/R9+qJZyp1gslE=;
 b=a0e1sqnjEvJJORN4Xt4p1chaxgO+8UTCbaEZtPivfyVTRm/BD2AtWWyrbAjhsb0is7
 jIZnBzh2A1JG99q/LTWvmgg1ODeedNoZsi84jGOu/I/2x+N7hINg2ZifvhO65QL5kSdv
 IidVugE6wafCJwvTp4qjX14ZtqeQIauED5daNKf2W6H0p/zNTiJGXxYH7zRc7ZzxQI3c
 t5olUi+mCkxi3XK4FTPWRd7vZFVCdoDPj34l2ANcAdPILsdkSREawsvk1dyG1iKAD+o/
 BScu2NjSPMTJf/4XHkNnjetgo8JZpXi9yvwIdFw7CPD1utz5GUD6255ef7i57sovUTxp
 DjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4QlGeWxo0Xv8FxeXIA+s7ap15MeXV/R9+qJZyp1gslE=;
 b=Do5iF6Hdo3pLrROhlGyAH55DCruVYWZxJFp1H6fWZ/HRXvZxOFwUDzfIL2qLcdF3zz
 FzVGV+8rgpA048bdBuzUKlB+XyrbVb9pK+oXj+hROvtrXB0QbR0tcAHeoJOqaQ1SelBb
 jyUs0IfUwY9Y8RXNh+D2HjAq6gMeObHIWUmE846cl0Qhk466IoUsE8kHGOK64SktdBDL
 nkPJvTsp02z6M/hdE3xR8QSxUZ/i7ymJ7Gqva7qe4Ve/FLDGeJn1aCMLt5UWWdmBbZfI
 ziZk1QW7/zZknJxHFMvolZZ9O94Dih8NZ/8IQvkvx4I3QVkySvNFUFi1ZCGQIZ6+ZQAD
 yzUg==
X-Gm-Message-State: AOAM532gH6nlrH7rh9s6S66qgzhI2nF9Fd2P+ooY5wu1fySXPKgZm0aW
 W2DQhPwpz79hlVmhxdnUzGXcyf8r0RxsDg==
X-Google-Smtp-Source: ABdhPJwZjwfADIDphEzPbM6Si87VVr3zoeXBhJhW9mBSSpU58kEItPZXRD4ItNtxV8lX2P5ghRqvxA==
X-Received: by 2002:adf:dfd0:: with SMTP id q16mr22122029wrn.60.1595848201221; 
 Mon, 27 Jul 2020 04:10:01 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id 130sm13039446wme.26.2020.07.27.04.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 04:10:00 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:09:58 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 2/9] mfd: mt6360: Remove redundant brackets around raw
 numbers
Message-ID: <20200727110958.GI1850026@dell>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594983811-25908-3-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594983811-25908-3-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_071002_916204_A14AB448 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBSZW1vdmUgcmVkdW5kYW50IGJyYWNrZXRzIGFy
b3VuZCByYXcgbnVtYmVycy4KClRoZXkncmUgbm90IGRvaW5nIGFueSBoYXJtLCBidXQgSSBndWVz
cyBpdCdzIG9rYXkuCgo+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0
ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jICB8IDE3MiArKysrKysr
KystLS0tLS0tLS0tCj4gIGluY2x1ZGUvbGludXgvbWZkL210NjM2MC5oIHwgNDEwICsrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDI5MSBpbnNlcnRpb25zKCspLCAyOTEgZGVsZXRpb25zKC0pCgpGb3IgbXkgb3duIHJlZmVyZW5j
ZSAoYXBwbHkgdGhpcyBhcy1pcyB0byB5b3VyIHNpZ24tb2ZmIGJsb2NrKToKCiAgQWNrZWQtZm9y
LU1GRC1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCi0tIApMZWUgSm9uZXMg
W+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxp
bmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGlu
YXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
