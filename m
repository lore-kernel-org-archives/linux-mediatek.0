Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14474C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:45:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFA9C60F25
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFA9C60F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vSjG9+00xpRsf3qjY43S/RzCDa0njcdcCpkxrPGfZ3A=; b=hctvmmyS9iWBM09S3euVFgckyz
	tqMnfw9kCRRANhgRnqz6sq+9lGF8+yOyO6YvZTZ7CihU5Is+4JeGUDtlBhiHkefczv8d6/pwpUE+n
	Jt9LDgF3n60yy5wIPjarLAdUpXuvVx8KSYorc3LZC83tSu8s6E5qlEM0T7AzwiXi8XAV8To1pqhTm
	xCkzodFFLAoFqRZeNKTaL+5+4eH5r4AdlBnf+qAcGU94wrJJpVKeY4ACNi3Bs1mAekFNxSp5re29y
	vrDmR1kmnkB1XHITh+k0Y0eiGl2n+gqVXi1O4VymEydCttHAXSygcWf8C8RmkwnTjuhAm6OBfCb+Y
	wAl8oKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDNNa-0037Ab-Lb; Tue, 10 Aug 2021 08:44:58 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDNEI-0032yJ-JC; Tue, 10 Aug 2021 08:35:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 203-20020a1c00d40000b02902e6a4e244e4so322587wma.4; 
 Tue, 10 Aug 2021 01:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vMSBdoateZIgBwXLZF1A9XcC/9zqYgLH80lmcKQu37Q=;
 b=fTDl3pEOIsU2zfYCfPcWhCJl/MENDAApV8LcoWAEB7OWBlHrVQHH+FACqNwyJzTeIQ
 7tbjM8//gJgy7/1MzZnB0hz+pgLWSVV3kfbr/f0gyQBOAwdGuhpAtdtmjWkR3Q3rqvTC
 XSAzShMz/edMcrpV645291q8ReC1JL40pWVDh3b/UtTYN/X4a1+ptCn9iswZd6RhW/4X
 QNhmd7bBBZTkdHwH+C2FnqpKyHhThlR3tXnRwNZ9iD0cykn5pomOdaEFyD+00aed6xuf
 Rokj/R2LSgCyzI2pL9hEVs1CTseKk3Z42JBTaQgom+ldCBEG/ZSG+Ftr0hp5kc3DRTgU
 keAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vMSBdoateZIgBwXLZF1A9XcC/9zqYgLH80lmcKQu37Q=;
 b=gk6rAypq4l+/bUnaE4ZM/5kzKfu6AjzcrqsnmTq+aSkdi+1lHhlhaWaMPSbsMUODAP
 8qG2fSslyO+U/BmooA96ESjiwSOFCr+qSB0xQeU8zLDKiatTuPtm7eUW7nPNIWlHRVmU
 8vZrBCK2M4CzLjrnoLsjWS6kVjt9llFQ/nVdyEWJneCss4JsiZ0S+x0nwknLLbsuPqnS
 P6eUlGzRuDEdzVmOWR8gUVT2zbteh2ZB1zrXY8WdidG5+2mU4zksx9vuorglmdW+yCx0
 Wle+GVSDhQDo2TrwQJoK+RFBzg5Ty/6A9qCpVYCMIF52unrYVCYgkKueICS+ppI6I+bx
 GKKg==
X-Gm-Message-State: AOAM532db4rWIg25goxs7Ygv1YHsHYyq8A0bfI7ElZ3jcyj5O23RMtdw
 ps9/+TCOJBBouTwlPMxQRYg=
X-Google-Smtp-Source: ABdhPJzUXAmUIoBvvY+R2JQrcLjcY4L2lYlgSnC90VO+/hMRs+Zbn4ppJt0Vv7egumyYv0BGV/LSPw==
X-Received: by 2002:a05:600c:242:: with SMTP id
 2mr3322563wmj.167.1628584520679; 
 Tue, 10 Aug 2021 01:35:20 -0700 (PDT)
Received: from ziggy.stardust ([207.188.163.204])
 by smtp.gmail.com with ESMTPSA id e11sm2293695wrm.80.2021.08.10.01.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 01:35:19 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] drm/mediatek: Add support for main DDP path on
 MT8167
To: Fabien Parent <fparent@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-6-fparent@baylibre.com>
 <CAAOTY_8ZgoQJFnEDDZ=JCy-3zLwn7yjk1EHVYgeSG2ufLxK04g@mail.gmail.com>
 <CAOwMV_wzp67zeiSvXP59OLMwd_8srfSTSqV9BwXagq5gFu6B3g@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <43fb2cda-5fed-f770-35d7-ed59db7dbae5@gmail.com>
Date: Tue, 10 Aug 2021 10:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAOwMV_wzp67zeiSvXP59OLMwd_8srfSTSqV9BwXagq5gFu6B3g@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_013522_702724_6AB90246 
X-CRM114-Status: GOOD (  19.24  )
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

CgpPbiAyNy8xMC8yMDIwIDE3OjA4LCBGYWJpZW4gUGFyZW50IHdyb3RlOgo+IEhpIENodW4tS3Vh
bmcsCj4gCj4gT24gRnJpLCBPY3QgMjMsIDIwMjAgYXQgNTo1MiBQTSBDaHVuLUt1YW5nIEh1IDxj
aHVua3VhbmcuaHVAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IEhpLCBGYWJpZW46Cj4+Cj4+IEZh
YmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAyMOW5tDEw5pyIMjPml6Ug
6YCx5LqUIOS4i+WNiDk6MzHlr6vpgZPvvJoKPj4+Cj4+PiBBZGQgdGhlIG1haW4gKERTSSkgZHJt
IGRpc3BsYXkgcGF0aCBmb3IgTVQ4MTY3Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEZhYmllbiBQ
YXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPgo+Pj4gLS0tCj4+Pgo+Pj4gQ2hhbmdlbG9nOgo+
Pj4KPj4+IFYyOiBObyBjaGFuZ2UKPj4+Cj4+PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZHJ2LmMgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZHJ2LmMKPj4+IGluZGV4IDU5Yzg1YzYzYjdjYy4uMzk1MjQzNTA5M2ZlIDEwMDY0NAo+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4+PiBAQCAtMTEyLDYgKzEx
MiwxNyBAQCBzdGF0aWMgY29uc3QgZW51bSBtdGtfZGRwX2NvbXBfaWQgbXQyNzEyX210a19kZHBf
dGhpcmRbXSA9IHsKPj4+ICAgICAgICAgRERQX0NPTVBPTkVOVF9QV00yLAo+Pj4gIH07Cj4+Pgo+
Pj4gK3N0YXRpYyBlbnVtIG10a19kZHBfY29tcF9pZCBtdDgxNjdfbXRrX2RkcF9tYWluW10gPSB7
Cj4+PiArICAgICAgIEREUF9DT01QT05FTlRfT1ZMMCwKPj4+ICsgICAgICAgRERQX0NPTVBPTkVO
VF9DT0xPUjAsCj4+PiArICAgICAgIEREUF9DT01QT05FTlRfQ0NPUlIsCj4+PiArICAgICAgIERE
UF9DT01QT05FTlRfQUFMMCwKPj4+ICsgICAgICAgRERQX0NPTVBPTkVOVF9HQU1NQSwKPj4+ICsg
ICAgICAgRERQX0NPTVBPTkVOVF9ESVRIRVIsCj4+PiArICAgICAgIEREUF9DT01QT05FTlRfUkRN
QTAsCj4+PiArICAgICAgIEREUF9DT01QT05FTlRfRFNJMCwKPj4+ICt9Owo+Pj4gKwo+Pj4gIHN0
YXRpYyBjb25zdCBlbnVtIG10a19kZHBfY29tcF9pZCBtdDgxNzNfbXRrX2RkcF9tYWluW10gPSB7
Cj4+PiAgICAgICAgIEREUF9DT01QT05FTlRfT1ZMMCwKPj4+ICAgICAgICAgRERQX0NPTVBPTkVO
VF9DT0xPUjAsCj4+PiBAQCAtMTYzLDYgKzE3NCwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10
a19tbXN5c19kcml2ZXJfZGF0YSBtdDgxNzNfbW1zeXNfZHJpdmVyX2RhdGEgPSB7Cj4+PiAgICAg
ICAgIC5leHRfbGVuID0gQVJSQVlfU0laRShtdDgxNzNfbXRrX2RkcF9leHQpLAo+Pj4gIH07Cj4+
Pgo+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10ODE2N19t
bXN5c19kcml2ZXJfZGF0YSA9IHsKPj4+ICsgICAgICAgLm1haW5fcGF0aCA9IG10ODE2N19tdGtf
ZGRwX21haW4sCj4+PiArICAgICAgIC5tYWluX2xlbiA9IEFSUkFZX1NJWkUobXQ4MTY3X210a19k
ZHBfbWFpbiksCj4+PiArfTsKPj4+ICsKPj4+ICBzdGF0aWMgaW50IG10a19kcm1fa21zX2luaXQo
c3RydWN0IGRybV9kZXZpY2UgKmRybSkKPj4+ICB7Cj4+PiAgICAgICAgIHN0cnVjdCBtdGtfZHJt
X3ByaXZhdGUgKnByaXZhdGUgPSBkcm0tPmRldl9wcml2YXRlOwo+Pj4gQEAgLTQwMSwyNiArNDE3
LDQyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY29tcG9uZW50X21hc3Rlcl9vcHMgbXRrX2RybV9v
cHMgPSB7Cj4+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2RkcF9jb21w
X2R0X2lkc1tdID0gewo+Pj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Mjcw
MS1kaXNwLW92bCIsCj4+PiAgICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX09WTCB9
LAo+Pj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE2Ny1kaXNwLW92bCIs
Cj4+PiArICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX09WTCB9LAo+Pj4gICAgICAg
ICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kaXNwLW92bCIsCj4+PiAgICAgICAg
ICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX09WTCB9LAo+Pj4gICAgICAgICB7IC5jb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10MjcwMS1kaXNwLXJkbWEiLAo+Pj4gICAgICAgICAgIC5kYXRhID0g
KHZvaWQgKilNVEtfRElTUF9SRE1BIH0sCj4+PiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ4MTY3LWRpc3AtcmRtYSIsCj4+PiArICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1U
S19ESVNQX1JETUEgfSwKPj4+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
NzMtZGlzcC1yZG1hIiwKPj4+ICAgICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfUkRN
QSB9LAo+Pj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kaXNwLXdk
bWEiLAo+Pj4gICAgICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRElTUF9XRE1BIH0sCj4+PiAr
ICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3LWRpc3AtY2NvcnIiLAo+Pj4g
KyAgICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRElTUF9DQ09SUiB9LAo+Pj4gICAgICAgICB7
IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1kaXNwLWNvbG9yIiwKPj4+ICAgICAgICAg
ICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfQ09MT1IgfSwKPj4+ICsgICAgICAgeyAuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxNjctZGlzcC1jb2xvciIsCj4+PiArICAgICAgICAgLmRhdGEg
PSAodm9pZCAqKU1US19ESVNQX0NPTE9SIH0sCj4+PiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ4MTczLWRpc3AtY29sb3IiLAo+Pj4gICAgICAgICAgIC5kYXRhID0gKHZvaWQg
KilNVEtfRElTUF9DT0xPUiB9LAo+Pj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVr
LG10ODE2Ny1kaXNwLWFhbCIsCj4+PiArICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQ
X0FBTH0sCj4+PiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLWRpc3At
YWFsIiwKPj4+ICAgICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfQUFMfSwKPj4+ICsg
ICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNjctZGlzcC1nYW1tYSIsCj4+PiAr
ICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX0dBTU1BLCB9LAo+Pj4gICAgICAgICB7
IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kaXNwLWdhbW1hIiwKPj4+ICAgICAgICAg
ICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfR0FNTUEsIH0sCj4+PiArICAgICAgIHsgLmNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3LWRpc3AtZGl0aGVyIiwKPj4+ICsgICAgICAgICAuZGF0
YSA9ICh2b2lkICopTVRLX0RJU1BfRElUSEVSIH0sCj4+PiAgICAgICAgIHsgLmNvbXBhdGlibGUg
PSAibWVkaWF0ZWssbXQ4MTczLWRpc3AtdWZvZSIsCj4+PiAgICAgICAgICAgLmRhdGEgPSAodm9p
ZCAqKU1US19ESVNQX1VGT0UgfSwKPj4+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDI3MDEtZHNpIiwKPj4+ICAgICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RTSSB9LAo+
Pj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE2Ny1kc2kiLAo+Pj4gKyAg
ICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRFNJIH0sCj4+PiAgICAgICAgIHsgLmNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQ4MTczLWRzaSIsCj4+PiAgICAgICAgICAgLmRhdGEgPSAodm9pZCAq
KU1US19EU0kgfSwKPj4+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEt
ZHBpIiwKPj4+IEBAIC00MzEsMTAgKzQ2MywxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBtdGtfZGRwX2NvbXBfZHRfaWRzW10gPSB7Cj4+PiAgICAgICAgICAgLmRhdGEgPSAo
dm9pZCAqKU1US19ESVNQX01VVEVYIH0sCj4+PiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQyNzEyLWRpc3AtbXV0ZXgiLAo+Pj4gICAgICAgICAgIC5kYXRhID0gKHZvaWQgKilN
VEtfRElTUF9NVVRFWCB9LAo+Pj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10
ODE2Ny1kaXNwLW11dGV4IiwKPj4+ICsgICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1Bf
TVVURVggfSwKPj4+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlz
cC1tdXRleCIsCj4+PiAgICAgICAgICAgLmRhdGEgPSAodm9pZCAqKU1US19ESVNQX01VVEVYIH0s
Cj4+PiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLWRpc3AtcHdtIiwK
Pj4+ICAgICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfQkxTIH0sCj4+PiArICAgICAg
IHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3LWRpc3AtcHdtIiwKPj4+ICsgICAgICAg
ICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfUFdNIH0sCj4+PiAgICAgICAgIHsgLmNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQ4MTczLWRpc3AtcHdtIiwKPj4+ICAgICAgICAgICAuZGF0YSA9ICh2
b2lkICopTVRLX0RJU1BfUFdNIH0sCj4+PiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ4MTczLWRpc3Atb2QiLAo+Pj4gQEAgLTQ0OSw2ICs0ODUsOCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBtdGtfZHJtX29mX2lkc1tdID0gewo+Pj4gICAgICAgICAgIC5k
YXRhID0gJm10NzYyM19tbXN5c19kcml2ZXJfZGF0YX0sCj4+PiAgICAgICAgIHsgLmNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQyNzEyLW1tc3lzIiwKPj4+ICAgICAgICAgICAuZGF0YSA9ICZtdDI3
MTJfbW1zeXNfZHJpdmVyX2RhdGF9LAo+Pj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE2Ny1tbXN5cyIsCj4+Cj4+IFRoaXMgcGF0Y2ggbG9va3MgZ29vZCB0byBtZSwgYnV0
IGl0IGRlcGVuZCBvbiBhbm90aGVyIHBhdGNoIHdoaWNoCj4+IGRlZmluZSB0aGUgY29tcGF0aWJs
ZSAibWVkaWF0ZWssbXQ4MTY3LW1tc3lzIi4gV2hlcmUgaXMgdGhhdCBwYXRjaD8KPiAKPiBZb3Ug
Y2FuIGZpbmQgdGhlIHBhdGNoIHRoZXJlOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDIwMTAyNzE2MDYzMS42MDg1MDMtMi1mcGFy
ZW50QGJheWxpYnJlLmNvbS8KPiAKCkRyaXZlciBpcyB1cHN0cmVhbSBzaW5jZSB2NS4xMyB3aXRo
OgplN2JlNzg1M2FiMWIgKCJkdC1iaW5kaW5nczogbWVkaWF0ZWs6IG1tc3lzOiBhZGQgbXQ4MTY3
IGJpbmRpbmciKQoKMDYwZjc4NzViZDIzICgic29jOiBtZWRpYXRlazogbW1zeXM6IEFkZCBzdXBw
b3J0IGZvciBNVDgxNjcgU29DIikKCgpSZWdhcmRzLApNYXR0aGlhcwoKPj4KPj4gUmVnYXJkcywK
Pj4gQ2h1bi1LdWFuZy4KPj4KPj4+ICsgICAgICAgICAuZGF0YSA9ICZtdDgxNjdfbW1zeXNfZHJp
dmVyX2RhdGF9LAo+Pj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1t
bXN5cyIsCj4+PiAgICAgICAgICAgLmRhdGEgPSAmbXQ4MTczX21tc3lzX2RyaXZlcl9kYXRhfSwK
Pj4+ICAgICAgICAgeyB9Cj4+PiAtLQo+Pj4gMi4yOC4wCj4+PgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
