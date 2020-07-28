Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D290C433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 06:33:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A8720792
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 06:33:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yMumBMYZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X3iAUbzc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7A8720792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kbtq6IRBYaYLUHNN3eaWeUR/skyFaOjez/je13fx0o0=; b=yMumBMYZxJ+IqHKQY9QYllJEv
	8VL3Y2UFs7xHHA2LT3mvwqOdvvTmNhG9YfV8nrzoPO3kE2Jr3aWFGv6kHraMWKNLju2vFs11zI/MF
	E/ZEBvjqlmWbJwwPkNcIsMWJK2XSQ8zZSZXAbs9D8K3BVPSmfB6Tsod6EyAHVJMV+Pxc+v/FqyxZO
	dTiVlnaWJmFW7WX77a2jZLSEc2uJ/S/9BbaKOM3jKxH2y/s6e1vr+S1iSPVhzy2eqygmibwiRRhvK
	oKwYSbbaVWjFfmF4j38qmvlJcS0R+KSW3kzE+bVEoCiRbjNzf1xQb1fqVR9071ut5L+MRutgcUrsj
	qD7KKsg0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0JBK-0008MA-75; Tue, 28 Jul 2020 06:33:46 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0JBF-0008KS-RQ
 for linux-mediatek@lists.infradead.org; Tue, 28 Jul 2020 06:33:42 +0000
Received: by mail-wm1-x343.google.com with SMTP id g10so14840894wmc.1
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 23:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+9ymQbKkfvO2y0f7evJNoJIbYaR/0FS5usSf9zZXVSk=;
 b=X3iAUbzcAVC2eGpCBvjCn4obAVo7l+i3+wwa7yIxH/WmhUWBjuFq7hGzz+fvnSyaAB
 quMvdv5Qi/JkmwdW4QFJllKbLYmPkiabffTbT1uJpqUBUcuN3ybpia01rAKe0pviFXV4
 pn9HVSNZVHlsv3vHcTlRyakcLbag1Lm0myAzUxLVBzeNtZXOhdUpyOnKf7eHu1lRJoRL
 2x+BoJIcXgKB2tderQzucrwj5kbuv3/SQl/n4jod67tA0T/Zb6UilZLrfdQyEbHMZpUm
 nOeYxCxqZKOGnK33Na20Pw/+zsJR0JnXZN5Ljy8cM6+CHnL24CTbRFcq1irhI+CCND/x
 J1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+9ymQbKkfvO2y0f7evJNoJIbYaR/0FS5usSf9zZXVSk=;
 b=Xn56Zcv9zUBM6hXgdLau5MVdvXbpqenQnWp21mCgmntMBxW1ywCzOZvoDxrrN1T6AM
 /2DUG+Z9DzepMNVZGK4PICDkaz58KJzQvsyzPxCmrbd4FtsLuGKW8XcmUB2ZlDc1CY/d
 /Qvw1P89rHzKPNvfW+eFKFORFPx/gtAKWC9OpWmHdOU1wsBX3995ll6qcOlJLSFZB3HP
 m6Gk27i0OLHonpwUbZMTpSelNF5EfoFTUsPovtIjKDQ8ualOiVpj946FaBfsd+pmeZ+E
 ooX/LfiNTtQcjpomeqcdnYyDehimDxkTk99RBgGU1SZ4ianwn59cKnPTgCAGllRBGZzX
 bzNg==
X-Gm-Message-State: AOAM531lsLSmK0a4YyqavNNS4NsSfQ6bNUfL51NdJtqROSxFfXcHvxDU
 aOLIzynqnZB9sT27dDdUvbq3Tw==
X-Google-Smtp-Source: ABdhPJzjVOkrHdjavp13uvCll7m2KDhHn6VDGg3h7jEdKnRlL7BYK4WvIkBkSIt4th7SG9tF/xjpCw==
X-Received: by 2002:a7b:c921:: with SMTP id h1mr2351362wml.29.1595918020669;
 Mon, 27 Jul 2020 23:33:40 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id c10sm16074682wro.84.2020.07.27.23.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 23:33:40 -0700 (PDT)
Date: Tue, 28 Jul 2020 07:33:38 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH 2/8] dt-bindings: mfd: Add compatible for the MediaTek
 MT6359 PMIC
Message-ID: <20200728063338.GZ1850026@dell>
References: <1595509133-5358-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1595509133-5358-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595509133-5358-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_023341_912357_CBD09DE2 
X-CRM114-Status: GOOD (  12.24  )
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
Cc: devicetree@vger.kernel.org, Josef Friedl <josef.friedl@speed.at>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMyBKdWwgMjAyMCwgSHNpbi1Ic2l1bmcgV2FuZyB3cm90ZToKCj4gVGhpcyBhZGRz
IGNvbXBhdGlibGUgZm9yIHRoZSBNZWRpYVRlayBNVDYzNTkgUE1JQy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBIc2luLUhzaXVuZyBXYW5nIDxoc2luLWhzaXVuZy53YW5nQG1lZGlhdGVrLmNvbT4KPiAt
LS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9tdDYzOTcudHh0IHwg
OCArKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpGb3IgbXkgb3duIHJlZmVyZW5jZSAoYXBwbHkgdGhpcyBhcy1pcyB0byB5b3VyIHNpZ24t
b2ZmIGJsb2NrKToKCiAgQWNrZWQtZm9yLU1GRC1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFk
IC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJl
IGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
