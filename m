Return-Path: <SRS0=1xoO=IP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBD0C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 15:35:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE92B64EFD
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 15:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE92B64EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s1WEYxCwAa0JW07pXHciBxqH/1HkDZJRSDKXSVYDyyQ=; b=K9fz/iVluxkmjbL0JuCgTL0g+
	kLftzOpwFAUlueyh95WFkGVcoyOape5K1WSUJWauF/O6tHBKf7wrzdXuq0UXzoc7e5CcfUuwnL3e+
	KwTShYuzxqTyh8E0XNV9ucwwSBEsstNoUIKu9itIqber0sq3wLz14cU9VQDpKECFS/hqm4mFmuMz2
	p+XJLv5IPyI+q4rVX0zphmVP3Q/7i5lNxavCM7WkPx0mpPfPJXlSi+jzC9UsDZga5tJid3w/GyRDe
	l6cSyE55an/fw5yDqqKYxLGXQr1D0+ove18C6TJJjOoAwGZdeOVcV0P8YwWL6zPOYAHW0a42rISil
	QdqMMaiNw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMYCQ-003RZd-Cm; Wed, 17 Mar 2021 15:35:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMYCG-003RYC-JL; Wed, 17 Mar 2021 15:34:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21C6464F77;
 Wed, 17 Mar 2021 15:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615995291;
 bh=H6ToFP9IpajHVCAlF99k3SS6q1zby7bi+PPlrMJQOdQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fuDHz6UVURxUyrd7PzH5LVSEU2BR0ELsxOfALk/LlAmYMQZMmXBVsWbyqgCdBUPN7
 WlUYOiNRq4Q6WHGSwG5eFQEwIejGTlIQA8PzLf2oZvkMKWbcAYpNHlM21x0QJxFCI5
 mWaJugGH0EkqOrUqLgJ82lc7/pQSehtlKRMuCwxfipFUUlRhMwYiUh90+EPQPOMZFa
 wA/oJ/qmRrg+pc9nU0atUpPKgOj4s82jaqjCF0NpViOa0fpy4TLjpnEeFBuOhR+uxp
 0DdvfQ5iL4ofew/T204nrFq5xqIqEhgyoqpWbQx6Xi7PBmyBnr4jyZfejTRWMoaEOK
 w8p+hUDhUGXzg==
Received: by mail-ej1-f50.google.com with SMTP id mj10so3312613ejb.5;
 Wed, 17 Mar 2021 08:34:51 -0700 (PDT)
X-Gm-Message-State: AOAM530dWrEhrcyhT1R8aH0Som8bozHNdPFlGLUdb98SMXurciQv79yJ
 HbziN7PtMwR7RhiOoACuV4sorCxGS+FIrn765Q==
X-Google-Smtp-Source: ABdhPJwSiOiRDcVZYuIJiV7u6IZ2RehlGlE6RVJe04HiMs9FM5CJD8TDbdJFQJRTY2Pp3r0L1WnqjxkxX4VsM2B0y+s=
X-Received: by 2002:a17:906:9888:: with SMTP id
 zc8mr36576434ejb.310.1615995289517; 
 Wed, 17 Mar 2021 08:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <1615865179-22051-1-git-send-email-rex-bc.chen@mediatek.com>
 <1615865179-22051-2-git-send-email-rex-bc.chen@mediatek.com>
In-Reply-To: <1615865179-22051-2-git-send-email-rex-bc.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 17 Mar 2021 23:34:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8pt5Vm9Xjy-c4kLV0qcmVJQp4Pj2=gokrnuGrdrYD7Nw@mail.gmail.com>
Message-ID: <CAAOTY_8pt5Vm9Xjy-c4kLV0qcmVJQp4Pj2=gokrnuGrdrYD7Nw@mail.gmail.com>
Subject: Re: [RESEND,v4,1/2] drm/mediatek: mtk_dpi: Add check for max clock
 rate in mode_valid
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_153456_989104_E83B1595 
X-CRM114-Status: GOOD (  16.09  )
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

SGksIFJleDoKClJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+IOaWvCAyMDIx
5bm0M+aciDE25pelIOmAseS6jCDkuIrljYgxMToyNuWvq+mBk++8mgo+Cj4gQWRkIHBlci1wbGF0
Zm9ybSBtYXggY2xvY2sgcmF0ZSBjaGVjayBpbiBtdGtfZHBpX2JyaWRnZV9tb2RlX3ZhbGlkLgo+
Cj4gUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+
IFNpZ25lZC1vZmYtYnk6IFBpLUhzdW4gU2hpaCA8cGloc3VuQGNocm9taXVtLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBSZXgtQkMgQ2hlbiA8cmV4LWJjLmNoZW5AbWVkaWF0ZWsuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyB8IDE3ICsrKysrKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHBpLmMKPiBpbmRleCBiMDVmOTAwZDkzMjIuLmUxOTQ1ZDRiZDdjNCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcGkuYwo+IEBAIC0xMjAsNiArMTIwLDcgQEAgc3RydWN0IG10a19k
cGlfeWNfbGltaXQgewo+ICBzdHJ1Y3QgbXRrX2RwaV9jb25mIHsKPiAgICAgICAgIHVuc2lnbmVk
IGludCAoKmNhbF9mYWN0b3IpKGludCBjbG9jayk7Cj4gICAgICAgICB1MzIgcmVnX2hfZnJlX2Nv
bjsKPiArICAgICAgIHUzMiBtYXhfY2xvY2tfa2h6Owo+ICAgICAgICAgYm9vbCBlZGdlX3NlbF9l
bjsKPiAgfTsKPgo+IEBAIC01NTcsOSArNTU4LDIyIEBAIHN0YXRpYyB2b2lkIG10a19kcGlfYnJp
ZGdlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ICAgICAgICAgbXRrX2RwaV9z
ZXRfZGlzcGxheV9tb2RlKGRwaSwgJmRwaS0+bW9kZSk7Cj4gIH0KPgo+ICtzdGF0aWMgZW51bSBk
cm1fbW9kZV9zdGF0dXMKPiArbXRrX2RwaV9icmlkZ2VfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Jy
aWRnZSAqYnJpZGdlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKm1vZGUpCj4gK3sKPiArICAgICAgIHN0cnVjdCBtdGtfZHBpICpkcGkg
PSBicmlkZ2VfdG9fZHBpKGJyaWRnZSk7Cj4gKwo+ICsgICAgICAgaWYgKGRwaS0+Y29uZi0+bWF4
X2Nsb2NrX2toeiAmJiBtb2RlLT5jbG9jayA+IGRwaS0+Y29uZi0+bWF4X2Nsb2NrX2toeikKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIE1PREVfQ0xPQ0tfSElHSDsKPiArCj4gKyAgICAgICByZXR1
cm4gTU9ERV9PSzsKPiArfQo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1
bmNzIG10a19kcGlfYnJpZGdlX2Z1bmNzID0gewo+ICAgICAgICAgLmF0dGFjaCA9IG10a19kcGlf
YnJpZGdlX2F0dGFjaCwKPiAgICAgICAgIC5tb2RlX3NldCA9IG10a19kcGlfYnJpZGdlX21vZGVf
c2V0LAo+ICsgICAgICAgLm1vZGVfdmFsaWQgPSBtdGtfZHBpX2JyaWRnZV9tb2RlX3ZhbGlkLAoK
QnVpbGQgZXJyb3I6CgouLi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jOjU3Njox
NjogZXJyb3I6IGluaXRpYWxpemF0aW9uCmZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBb
LVdlcnJvcj1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KICAubW9kZV92YWxpZCA9IG10a19k
cGlfYnJpZGdlX21vZGVfdmFsaWQsCiAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+CgpQbGVhc2UgcmVtb3ZlIG15ICdSZXZpZXdlZC1ieScgdGFnLgoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gICAgICAgICAuZGlzYWJsZSA9IG10a19kcGlfYnJpZGdlX2Rpc2FibGUsCj4g
ICAgICAgICAuZW5hYmxlID0gbXRrX2RwaV9icmlkZ2VfZW5hYmxlLAo+ICB9Owo+IEBAIC02Njgs
MTcgKzY4MiwyMCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IG10ODE4M19jYWxjdWxhdGVfZmFjdG9y
KGludCBjbG9jaykKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTczX2Nv
bmYgPSB7Cj4gICAgICAgICAuY2FsX2ZhY3RvciA9IG10ODE3M19jYWxjdWxhdGVfZmFjdG9yLAo+
ICAgICAgICAgLnJlZ19oX2ZyZV9jb24gPSAweGUwLAo+ICsgICAgICAgLm1heF9jbG9ja19raHog
PSAzMDAwMDAsCj4gIH07Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQy
NzAxX2NvbmYgPSB7Cj4gICAgICAgICAuY2FsX2ZhY3RvciA9IG10MjcwMV9jYWxjdWxhdGVfZmFj
dG9yLAo+ICAgICAgICAgLnJlZ19oX2ZyZV9jb24gPSAweGIwLAo+ICAgICAgICAgLmVkZ2Vfc2Vs
X2VuID0gdHJ1ZSwKPiArICAgICAgIC5tYXhfY2xvY2tfa2h6ID0gMTUwMDAwLAo+ICB9Owo+Cj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE4M19jb25mID0gewo+ICAgICAg
ICAgLmNhbF9mYWN0b3IgPSBtdDgxODNfY2FsY3VsYXRlX2ZhY3RvciwKPiAgICAgICAgIC5yZWdf
aF9mcmVfY29uID0gMHhlMCwKPiArICAgICAgIC5tYXhfY2xvY2tfa2h6ID0gMTAwMDAwLAo+ICB9
Owo+Cj4gIHN0YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+IC0tCj4gMi4xOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
