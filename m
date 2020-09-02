Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC3BC43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 11:04:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1679E2078E
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 11:04:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D8wZh7xh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jvktss2w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1679E2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UFEgThLm3ixN+ostC8UX3uvAAUZCrWnzbBivumPaHmM=; b=D8wZh7xh9lQQeTfsjcNt0lO0O
	eHPhONKYsNLhHH4RyFCihHQ1EckX4KQW8iAtO8VkQlXK1C5yGCvIg3OoLz9olUSu4fLoV0TCIO6Yl
	UY51SQHFHLm+RoPVQozMoTMUvhJS7yQt3RMB6Hpb05mOZnM0VE5TUo17xc3x+O91OYjegOJynPJa2
	Oc0KbgMSumNCJ3ru9Op6mqAmOckdz4vtDdEmSsx5m6J7THRU8yj+4CtTxRxU6EUUJgGuA41XREBCE
	Nhh3svXAo1BdL9dN1yJobyqCEAnP2SURXVYykpfjYlk80noYFsBpD3KY5y7LqK/oDO8hd8rgiZzrn
	d/p7xFw+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDQZI-00010h-CD; Wed, 02 Sep 2020 11:04:44 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDQZE-0000z8-Jg
 for linux-mediatek@lists.infradead.org; Wed, 02 Sep 2020 11:04:41 +0000
Received: by mail-ua1-x944.google.com with SMTP id e41so1431485uad.6
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2020 04:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hf0PIlZBH2f6tZjqIqPKdTSDxg4ey5IHqqV7o7zs3fA=;
 b=jvktss2wubUFAj/XGva63/p+i21EmUocT+VKMGriS4nO/cV/LZCl8IS0SS4RAI5I1B
 PGSRGdX07J/2Y9ObU8kQKYXMoS2CyQ51/SiA8HmfDEN9bG6zj5ZUQSltN4eQYx5vC305
 jUIYB6t85WIce/eXD6+90KH03m60MDMZHE6SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hf0PIlZBH2f6tZjqIqPKdTSDxg4ey5IHqqV7o7zs3fA=;
 b=O3P4r5EtY/i9nY8BiYqjR2qdE3Ujv0RCkNt+tomM/iLcVLgtodFEJSPU8oGCqrhNXR
 FgnDLVIo2GaQKtVer3fGN3LkcYScB5eCP46lgPmTsUrtEcKN0sC6OEaDiErAvjj8O9QK
 ZUoHUhmKsepUg5g+R7DdXg91XWg5y8yE/otyVHzTaaRUARFJEJtcMxQdX8TuOpDpSOXS
 mNLM2OKwiwBgnYxqqu9fJE6BC5aFrWcikUhxJPR2EeIgkrRDWVaXbDP05WvFoCvWTqhg
 LPm08mhm+N4Ebc5XR1fU0XJa8cC9XVD/xIXxTxxzWOAu1TiCIuwLiF5DyZp1ot1yMTBY
 6tZg==
X-Gm-Message-State: AOAM531BckAt6syWgIMh9Qrh9vBD84MDV5Vc8tKcZK17BTiR9GLdkl5J
 0qjycnU7gpTBzCdFTyvZq1jCuS5YdtviskO8Ax7nQw==
X-Google-Smtp-Source: ABdhPJwTAJmdVSE4G5yw+xOM510eJCrk4CeFZ0EVNnIfqJUjO0bPMVj4+uBwlLwieWiC9A5BtacoHnsFLK6H+cR9mhI=
X-Received: by 2002:ab0:1e84:: with SMTP id o4mr4725479uak.74.1599044678604;
 Wed, 02 Sep 2020 04:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <9f4fb922-4aa3-0b63-6d81-c83daefd13b9@web.de>
In-Reply-To: <9f4fb922-4aa3-0b63-6d81-c83daefd13b9@web.de>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 2 Sep 2020 19:04:27 +0800
Message-ID: <CANMq1KBJTpnYG59B1V=y_emqD3dtMZQAPY9bWJOC8FW2fNRgsA@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: Avoid double-free in mtk_rpmsg_register_device()
To: Markus Elfring <Markus.Elfring@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_070440_698167_B3ACD380 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, kernel-janitors@vger.kernel.org,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgMiwgMjAyMCBhdCA1OjMzIFBNIE1hcmt1cyBFbGZyaW5nIDxNYXJrdXMuRWxm
cmluZ0B3ZWIuZGU+IHdyb3RlOgo+Cj4gPiBJZiBycG1zZ19yZWdpc3Rlcl9kZXZpY2UgZmFpbHMs
IGl0IHdpbGwgY2FsbAo+ID4gbXRrX3JwbXNnX3JlbGVhc2VfZGV2aWNlIHdoaWNoIGFscmVhZHkg
ZnJlZXMgbWRldi4KPgo+IENhbiBhbm90aGVyIGltcGVyYXRpdmUgd29yZGluZyBiZWNvbWUgaGVs
cGZ1bCBmb3IgdGhlIGNoYW5nZSBkZXNjcmlwdGlvbj8KPiBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVu
dGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdD9pZD05YzdkNjE5YmU1YTAwMmVh
MjljMTcyZGY1ZTNjMTIyN2MyMmNiYjQxI24xNTEKCkxvb2tpbmcgYXQgeW91ciBwb3N0aW5nIGhp
c3RvcnksIEknbGwgbGVhdmUgaXQgdXAgdG8gdGhlIG1haW50YWluZXIuCgo+IOKApgo+ID4gKysr
IGIvZHJpdmVycy9ycG1zZy9tdGtfcnBtc2cuYwo+ID4gQEAgLTIyMCwxMCArMjIwLDggQEAgIHN0
YXRpYyBpbnQgbXRrX3JwbXNnX3JlZ2lzdGVyX2RldmljZShzdHJ1Y3QgbXRrX3JwbXNnX3Jwcm9j
X3N1YmRldiAqbXRrX3N1YmRldiwKPiA+ICAgICAgIHJwZGV2LT5kZXYucmVsZWFzZSA9IG10a19y
cG1zZ19yZWxlYXNlX2RldmljZTsKPiA+Cj4gPiAgICAgICByZXQgPSBycG1zZ19yZWdpc3Rlcl9k
ZXZpY2UocnBkZXYpOwo+ID4gLSAgICAgaWYgKHJldCkgewo+ID4gLSAgICAgICAgICAgICBrZnJl
ZShtZGV2KTsKPiA+ICsgICAgIGlmIChyZXQpCj4gPiAgICAgICAgICAgICAgIHJldHVybiByZXQ7
Cj4gPiAtICAgICB9Cj4gPgo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+Cj4KPiAqIEhvdyBk
byB5b3UgdGhpbmsgYWJvdXQgdG8gdXNlIHRoZSBmb2xsb3dpbmcgY29kZSB2YXJpYW50IGluc3Rl
YWQ/Cj4KPiAgICAgICAgIHJldHVybiBycG1zZ19yZWdpc3Rlcl9kZXZpY2UocnBkZXYpOwo+Cj4g
KiBXb3VsZCB5b3UgbGlrZSB0byBvbWl0IHRoZSB2YXJpYWJsZSDigJxyZXTigJ0gZm9yIHRoaXMg
ZnVuY3Rpb24gaW1wbGVtZW50YXRpb24/CgpUaGF0J3MgYSBnb29kIHN1Z2dlc3Rpb24sIEknbGwg
dXBkYXRlIGFuZCBzZW5kIGEgdjIuCgo+Cj4gUmVnYXJkcywKPiBNYXJrdXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
