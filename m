Return-Path: <SRS0=CwkH=6H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA59EC54FCB
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 13:23:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF21420781
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 13:23:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X4iGV9/t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MfGul8Hp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF21420781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Io+qSEJh7eK7vbP+y9gsSC1kR2c7C+jjfr00YH+atRE=; b=X4iGV9/tZdLx1/
	h1VVZla5uhU2qKu+H3+2WoKInNruD9uuYvx4YwP09QjcjbrY2wkP9NkVAMzH6KIeJhqaHF3RBge3Y
	WsmXaqbHHtcZImREpAXY6THo3WXa9B+fw+0J9MDiGZqslBnwndzO4YurKChmfSdiprgXUN6a8cNYD
	kU107ZI7U70se8aEuxCk6joWX5B9e1X6t8RwYCyAXApJeuj9O4f+sMBOSs4QyEsz8NapK3OtAOl+2
	G+Zc4Cr+EJguWeD3enQvmA27aWexiazlscr44ORIsHOwJZiITcKNXf53TO+AOmP6U9D/hTsIjHJAw
	6h+oMsLHRlTbEJvAW8qA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRboj-00058N-53; Thu, 23 Apr 2020 13:23:01 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRbof-00056U-K4
 for linux-mediatek@lists.infradead.org; Thu, 23 Apr 2020 13:23:00 +0000
Received: by mail-wr1-x443.google.com with SMTP id k13so6827724wrw.7
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2020 06:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6lrCN4Y2jvBEhMEE9yoKB0QoRLluJFmgeNzXOO0519c=;
 b=MfGul8Hpypn6B6iEzWypyjdhBn2Sm6I3sSyNkRkdieKZwsujvoViJAlUxKfCp6PvVT
 nwSpOW9fHqYx6TfeuZBHXpiT/Q2s2RfycyW/XV2CCERaWqWBevrZxULrN89FB2oqqqIj
 EC4+LROpYsU0aZMAoa54xpOSfpfCZFQyZRrwaCx87r3hFioBkCt8KsdEjlJAImIi4s1I
 Us/CNyKM0JIG8zvg7SiTo3pIgmAXzgypQm3ZpltQJG1qtzhzgxWvcovuoFdh5tQZy9Cx
 NgvYaqs9da3YhKQ+izEK3Cgf+BXf15gAENfjKuHLNG3VaHH3xMMHcEogSfbIRqjGk5gK
 /7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6lrCN4Y2jvBEhMEE9yoKB0QoRLluJFmgeNzXOO0519c=;
 b=a2qf9iNaATDKHbnvHBy7KX1fRooO1MQyF46cG/RKlIpY2f10v0I+y5FPlQKbgRJG7k
 2h1jMB7/j4szatxhb7TpMYy6r62RfM4z29crH92yUsOiX8Mi1QuYOZDhIUizv5l+ss0w
 EWlw1cZrvng/AOr++tnb+Wvt/mMeeOo2w4ns/aBqV2ypXerqWMvxxtvWRyj9s4iLMXW5
 KB2c0UXOIeMvn+jwSaMO155bqDtbXaQFIFhjq+6u7TsnhR3entFhJq+thjl6vrU4Lidz
 XRik4gvTFH+WKx1n+N3diSEqBWL3NmzOFJAxQacXD8IPsdlpADzhjATGnIbZoDCPHlRS
 1gQQ==
X-Gm-Message-State: AGi0Puadjz/cgTGXayutB6bhx/Y/HvL9j+gqOaoVByh1zSdlBZhcTO2z
 tjGxIUZvuNvIzrN6QM4SC3YwBQ==
X-Google-Smtp-Source: APiQypLIExvxbZk7AtfC6O9cBOXmdm+gz1QSH3p+99FlJwwJBGarRXDyjXQkXRxvvC0opKaSfe3/tA==
X-Received: by 2002:adf:fdc1:: with SMTP id i1mr5430755wrs.158.1587648175280; 
 Thu, 23 Apr 2020 06:22:55 -0700 (PDT)
Received: from linaro.org ([37.167.216.250])
 by smtp.gmail.com with ESMTPSA id h137sm14658623wme.0.2020.04.23.06.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 06:22:54 -0700 (PDT)
Date: Thu, 23 Apr 2020 15:22:43 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v6 03/10] PM / EM: update callback structure and add
 device pointer
Message-ID: <20200423132243.GA65632@linaro.org>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-4-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410084210.24932-4-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_062258_177800_DFDE363F 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, festevam@gmail.com, mka@chromium.org,
 robh@kernel.org, amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 b.zolnierkie@samsung.com, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBcHIgMTAsIDIwMjAgYXQgMDk6NDI6MDNBTSArMDEwMCwgTHVrYXN6IEx1YmEgd3Jv
dGU6Cj4gVGhlIEVuZXJneSBNb2RlbCBmcmFtZXdvcmsgaXMgZ29pbmcgdG8gc3VwcG9ydCBkZXZp
Y2VzIG90aGVyIHRoYXQgQ1BVcy4gSW4KPiBvcmRlciB0byBtYWtlIHRoaXMgaGFwcGVuIGNoYW5n
ZSB0aGUgY2FsbGJhY2sgZnVuY3Rpb24gYW5kIGFkZCBwb2ludGVyIHRvCj4gYSBkZXZpY2UgYXMg
YW4gYXJndW1lbnQuCj4gCj4gVXBkYXRlIHRoZSByZWxhdGVkIHVzZXJzIHRvIHVzZSBuZXcgZnVu
Y3Rpb24gYW5kIG5ldyBjYWxsYmFjayBmcm9tIHRoZQo+IEVuZXJneSBNb2RlbC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBMdWthc3ogTHViYSA8bHVrYXN6Lmx1YmFAYXJtLmNvbT4KPiAtLS0KClsgLi4u
IF0KCj4gK3N0YXRpYyBzdHJ1Y3QgZW1fcGVyZl9kb21haW4gKgo+ICtlbV9jcmVhdGVfcGQoc3Ry
dWN0IGRldmljZSAqZGV2LCBpbnQgbnJfc3RhdGVzLCBzdHJ1Y3QgZW1fZGF0YV9jYWxsYmFjayAq
Y2IsCj4gKwkgICAgIGNwdW1hc2tfdCAqc3BhbikKPiAgewo+ICAJdW5zaWduZWQgbG9uZyBvcHBf
ZWZmLCBwcmV2X29wcF9lZmYgPSBVTE9OR19NQVg7Cj4gIAl1bnNpZ25lZCBsb25nIHBvd2VyLCBm
cmVxLCBwcmV2X2ZyZXEgPSAwOwo+IEBAIC0xMDYsNyArMTA3LDcgQEAgc3RhdGljIHN0cnVjdCBl
bV9wZXJmX2RvbWFpbiAqZW1fY3JlYXRlX3BkKGNwdW1hc2tfdCAqc3BhbiwgaW50IG5yX3N0YXRl
cywKPiAgCQkgKiBsb3dlc3QgcGVyZm9ybWFuY2Ugc3RhdGUgb2YgJ2NwdScgYWJvdmUgJ2ZyZXEn
IGFuZCB1cGRhdGVzCj4gIAkJICogJ3Bvd2VyJyBhbmQgJ2ZyZXEnIGFjY29yZGluZ2x5Lgo+ICAJ
CSAqLwo+IC0JCXJldCA9IGNiLT5hY3RpdmVfcG93ZXIoJnBvd2VyLCAmZnJlcSwgY3B1KTsKPiAr
CQlyZXQgPSBjYi0+YWN0aXZlX3Bvd2VyKCZwb3dlciwgJmZyZXEsIGRldik7Cj4gIAkJaWYgKHJl
dCkgewo+ICAJCQlwcl9lcnIoInBkJWQ6IGludmFsaWQgcGVyZi4gc3RhdGU6ICVkXG4iLCBjcHUs
IHJldCk7Cj4gIAkJCWdvdG8gZnJlZV9wc190YWJsZTsKCldoeSBhcmUgdGhlIGNoYW5nZXMgJ2Nw
dScgdG8gJ2RldicgaW4gdGhlIHBhdGNoIDQvMTAgaW5zdGVhZCBvZiB0aGlzIG9uZSA/Cgo+IEBA
IC0yMzcsNyArMjM4LDcgQEAgaW50IGVtX2Rldl9yZWdpc3Rlcl9wZXJmX2RvbWFpbihzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBucl9zdGF0ZXMsCj4gIAl9Cj4gIAo+ICAJLyogQ3Jl
YXRlIHRoZSBwZXJmb3JtYW5jZSBkb21haW4gYW5kIGFkZCBpdCB0byB0aGUgRW5lcmd5IE1vZGVs
LiAqLwo+IC0JcGQgPSBlbV9jcmVhdGVfcGQoc3BhbiwgbnJfc3RhdGVzLCBjYik7Cj4gKwlwZCA9
IGVtX2NyZWF0ZV9wZChkZXYsIG5yX3N0YXRlcywgY2IsIHNwYW4pOwo+ICAJaWYgKCFwZCkgewo+
ICAJCXJldCA9IC1FSU5WQUw7Cj4gIAkJZ290byB1bmxvY2s7CgotLSAKCiA8aHR0cDovL3d3dy5s
aW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFy
bz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8
CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
