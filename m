Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC09C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 00:13:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD5E764E9A
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 00:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD5E764E9A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hL4DuSiyDoRXbTZvcdfXkE75wVNvjx2wHJ+HE9GsD1Y=; b=RTntTXPb/bJAKwStJX251siar
	zQRycb5Z3hj0dytIeqxmrJC/uuujxCnve9+ERvfzbVQcMqq04qXty+lh/+wcAioTpsc8kklUi6D48
	EJHt6i+2Y6IuPnfFPjRavs60axOGnI3DCKevwoYSaUwqDOySU569ugfwsB4pL9tmN1lLneDFYDe4e
	+HW+e9fUc4BDLGs16O0bdzk4QhkEUkM7sfLBVfONBbTjwsO9x2ReolxDhTZusPCrWbE+aNA2B/x1U
	JS2uGAHCXV8RITYpdLFcmssaEzmeaTHBT29BkdPCmLen0OOho6fQTOwv3QWkokgFYHyDAzM6Ro2mx
	Ansx3Ky1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Gei-00076X-Cm; Tue, 09 Feb 2021 00:13:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Gec-00074c-St; Tue, 09 Feb 2021 00:13:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D72464DAE;
 Tue,  9 Feb 2021 00:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612829597;
 bh=YGQmG5Aw41UXZ3vI14ndhT9iSdpoqlYcFpzEnNjxbjE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WbIo1RFAUb3UxRl4kThhbzRV6iE2oes6501a2dews7L6RpBw1Tp+RWtbCFOId5QLv
 +ogETCL1EKjjPK8T5pXEVCnYLqhzsbWHzM0TVsC+cEyFOy0fsP0gPg/vtyyyeIbnmk
 y8JqSEYI7gqgh5fwAmG1FX0iH2cHpY6FNb9PtLINeRCsDfvkO96IIrZDqEyYOrY+PD
 AbngIjlr6E17MKSxtNUX9+oWYwDQUTxRrG19/1QypjWGsw4/ylB6XvoWN65+zAOUvz
 +461sHNjjZFHFZZYVBe8lfQtSaQ5DnRGbkAkXWlf4Ro5Mk0y0STLO6XUcxtFUAVM/l
 EYXYuP6EsjVVA==
Received: by mail-ed1-f53.google.com with SMTP id s26so15614213edt.10;
 Mon, 08 Feb 2021 16:13:17 -0800 (PST)
X-Gm-Message-State: AOAM5326RrNXjm0mi9dHpUSK0Wq7LiC/hoB8X73s4N11GcPTpuTqTZjG
 spVw2PH0GGmYRTXtYr94CmbInd1efE0tr9tgxg==
X-Google-Smtp-Source: ABdhPJxAI/h9uXjLJYnN0Sa3CKD70oKvcOCCJCsQsOiLlPPOuDvuzg3BdEn1AI05WVTfO15A/MjEAGAWq5okef9eZWg=
X-Received: by 2002:a50:d90a:: with SMTP id t10mr20535060edj.162.1612829596148; 
 Mon, 08 Feb 2021 16:13:16 -0800 (PST)
MIME-Version: 1.0
References: <20210208014221.196584-1-jitao.shi@mediatek.com>
 <20210208014221.196584-2-jitao.shi@mediatek.com>
In-Reply-To: <20210208014221.196584-2-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 9 Feb 2021 08:13:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-tEJA7suX_9PH9XRcjdd67o6aVw+Nd4A-PBjEFxOUKcQ@mail.gmail.com>
Message-ID: <CAAOTY_-tEJA7suX_9PH9XRcjdd67o6aVw+Nd4A-PBjEFxOUKcQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/mediatek: mtk_dpi: Add check for max clock
 rate in mode_valid
To: Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_191319_140126_E7F3CBFA 
X-CRM114-Status: GOOD (  17.48  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, shuijing.li@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDLmnIg45pelIOmAseS4gCDkuIrljYg5OjQy5a+r6YGT77yaCj4KPiBBZGQgcGVyLXBsYXRmb3Jt
IG1heCBjbG9jayByYXRlIGNoZWNrIGluIG10a19kcGlfYnJpZGdlX21vZGVfdmFsaWQuCgpSZXZp
ZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2ln
bmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIHwgMTcgKysrKysrKysrKysrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcGkuYwo+IGluZGV4IDUyZjExYTYzYTMzMC4uZmZhNGEwZjE5ODlmIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gQEAgLTExOCw2ICsxMTgsNyBAQCBzdHJ1Y3QgbXRr
X2RwaV95Y19saW1pdCB7Cj4gIHN0cnVjdCBtdGtfZHBpX2NvbmYgewo+ICAgICAgICAgdW5zaWdu
ZWQgaW50ICgqY2FsX2ZhY3RvcikoaW50IGNsb2NrKTsKPiAgICAgICAgIHUzMiByZWdfaF9mcmVf
Y29uOwo+ICsgICAgICAgdTMyIG1heF9jbG9ja19raHo7Cj4gICAgICAgICBib29sIGVkZ2Vfc2Vs
X2VuOwo+ICB9Owo+Cj4gQEAgLTU1NSw5ICs1NTYsMjIgQEAgc3RhdGljIHZvaWQgbXRrX2RwaV9i
cmlkZ2VfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gICAgICAgICBtdGtfZHBp
X3NldF9kaXNwbGF5X21vZGUoZHBpLCAmZHBpLT5tb2RlKTsKPiAgfQo+Cj4gK3N0YXRpYyBlbnVt
IGRybV9tb2RlX3N0YXR1cwo+ICttdGtfZHBpX2JyaWRnZV9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1f
YnJpZGdlICpicmlkZ2UsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qg
ZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKPiArewo+ICsgICAgICAgc3RydWN0IG10a19kcGkgKmRw
aSA9IGJyaWRnZV90b19kcGkoYnJpZGdlKTsKPiArCj4gKyAgICAgICBpZiAoZHBpLT5jb25mLT5t
YXhfY2xvY2tfa2h6ICYmIG1vZGUtPmNsb2NrID4gZHBpLT5jb25mLT5tYXhfY2xvY2tfa2h6KQo+
ICsgICAgICAgICAgICAgICByZXR1cm4gTU9ERV9DTE9DS19ISUdIOwo+ICsKPiArICAgICAgIHJl
dHVybiBNT0RFX09LOwo+ICt9Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9icmlkZ2Vf
ZnVuY3MgbXRrX2RwaV9icmlkZ2VfZnVuY3MgPSB7Cj4gICAgICAgICAuYXR0YWNoID0gbXRrX2Rw
aV9icmlkZ2VfYXR0YWNoLAo+ICAgICAgICAgLm1vZGVfc2V0ID0gbXRrX2RwaV9icmlkZ2VfbW9k
ZV9zZXQsCj4gKyAgICAgICAubW9kZV92YWxpZCA9IG10a19kcGlfYnJpZGdlX21vZGVfdmFsaWQs
Cj4gICAgICAgICAuZGlzYWJsZSA9IG10a19kcGlfYnJpZGdlX2Rpc2FibGUsCj4gICAgICAgICAu
ZW5hYmxlID0gbXRrX2RwaV9icmlkZ2VfZW5hYmxlLAo+ICB9Owo+IEBAIC02NzMsMTcgKzY4Nywy
MCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IG10ODE4M19jYWxjdWxhdGVfZmFjdG9yKGludCBjbG9j
aykKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTczX2NvbmYgPSB7Cj4g
ICAgICAgICAuY2FsX2ZhY3RvciA9IG10ODE3M19jYWxjdWxhdGVfZmFjdG9yLAo+ICAgICAgICAg
LnJlZ19oX2ZyZV9jb24gPSAweGUwLAo+ICsgICAgICAgLm1heF9jbG9ja19raHogPSAzMDAwMDAs
Cj4gIH07Cj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQyNzAxX2NvbmYg
PSB7Cj4gICAgICAgICAuY2FsX2ZhY3RvciA9IG10MjcwMV9jYWxjdWxhdGVfZmFjdG9yLAo+ICAg
ICAgICAgLnJlZ19oX2ZyZV9jb24gPSAweGIwLAo+ICAgICAgICAgLmVkZ2Vfc2VsX2VuID0gdHJ1
ZSwKPiArICAgICAgIC5tYXhfY2xvY2tfa2h6ID0gMTUwMDAwLAo+ICB9Owo+Cj4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE4M19jb25mID0gewo+ICAgICAgICAgLmNhbF9m
YWN0b3IgPSBtdDgxODNfY2FsY3VsYXRlX2ZhY3RvciwKPiAgICAgICAgIC5yZWdfaF9mcmVfY29u
ID0gMHhlMCwKPiArICAgICAgIC5tYXhfY2xvY2tfa2h6ID0gMTAwMDAwLAo+ICB9Owo+Cj4gIHN0
YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+IC0t
Cj4gMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
