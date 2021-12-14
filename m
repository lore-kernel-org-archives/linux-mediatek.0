Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EEDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXDvDcGvCqQCcqjxZvvb6Y9WHIOZrkY5uVHESVcbwUE=; b=TBwUlfFsfbyd3E
	yWJuCr31o9WHjiYlGMLFJHWuzr8eUm++9RRvubyp4+4+lFMIhcFjCR7lAg+UD7xA0MJQCww0AbMnd
	7rod89NFPn0rgThlxrLJHbH23S4sNKQmFHQof4EXQE3I6WQN7mPEebCpXLGmJ32QLRnydJoSm1c4u
	wPjnooartes+a6WOMmd835bAoS87HABQTgRJua1+bc5LIhijGmJeXcPUO50trhqdm6SQh/x3lJrE/
	dnvTcQP7Gc1cOpEphTCw6/9N/+FBF7Qt+bd6UmwbX4sNB7hmoeZnKKZBLm043gqSwU7TmaKGI/Dvz
	3eZdW+lEN0z3V9rhp0Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx9hL-00EfJs-UW; Tue, 14 Dec 2021 15:26:35 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx9h6-00EfFd-DD
 for linux-mediatek@lists.infradead.org; Tue, 14 Dec 2021 15:26:23 +0000
Received: by mail-lj1-x22a.google.com with SMTP id bn20so28861212ljb.8
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Dec 2021 07:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E1s89Tuk39UOoZlOnaYWQ3Z1+01yfMXbQponNEtbH2M=;
 b=WwgkRYx3+StpmQOX5zWNZea0LTRzvre8BcRBHN+bQETXffydPPalqRgKWQ3fW+eAFI
 KFzK2WFm26VKLSwNLWJGuC39mWkVXz6LUdX/VmLg5SCCbnB+dsBXv5wlewTxhAUmboEF
 6hKcZV6qzTaHqqZb+PkOulHm19BA4/flkL+WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E1s89Tuk39UOoZlOnaYWQ3Z1+01yfMXbQponNEtbH2M=;
 b=xRh0cFPYQjeC1V/XrKifqsJ4dFKfcGgN4AJa+TTxJwaKKNfWyujhV3FDETVIY71cbp
 mT0CXthXIloQkB4UpcCTJsuhvOyPHGE9pljN9qqtxXBgKreESf+tmbg+dk22vTBDEsqg
 OCqQYvqRzTniOa4cU+Vy2GtMaYGVWPXdFmm0auJicFNEleEhMXNPzg1s9v2b+lI9lbGo
 EocZ4qATsAw/Mr81+I950MBfhOa09Lv19sFr+AoxCZtlBKehid08BQPNwnGsoyHnk5Kv
 lzYYrA7O47yCrhYfC7K/Ez275sj5KMfdHoWY66XDXr4f7K4kDroizSodrAfAVUXfwfED
 cNvg==
X-Gm-Message-State: AOAM532z5uWp02tzKGZWIbGEKKCFwoGUSWNU29U0coFcRsLj+z+txrKX
 JpRBGIBrAI5akw9NXvH++Ujd7VHY9ihcBCOUE8AcPQ==
X-Google-Smtp-Source: ABdhPJxXEMFm5MO03ocP3YbIlaXlGoJzGI5gjZgD3+oeBt+anch+hjrguJ7Q8hdUWyFJf6G1XVFZ07wtaAndgQfCxnM=
X-Received: by 2002:a05:651c:50c:: with SMTP id
 o12mr5639330ljp.88.1639495577542; 
 Tue, 14 Dec 2021 07:26:17 -0800 (PST)
MIME-Version: 1.0
References: <20211027162806.2014022-1-markyacoub@chromium.org>
 <20211213160742.744333-1-markyacoub@chromium.org>
 <CAAOTY_81KaSEWAqTWgzmshDZ9BefO3pNrqQwWbB01E4L0+mqzg@mail.gmail.com>
In-Reply-To: <CAAOTY_81KaSEWAqTWgzmshDZ9BefO3pNrqQwWbB01E4L0+mqzg@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 14 Dec 2021 10:26:06 -0500
Message-ID: <CAJUqKUp_Q39S912_epc3pfT-uc3DN=u4sCSdLm9VetwqdH_Pzw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Set the default value of rotation to
 DRM_MODE_ROTATE_0
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Sean Paul <seanpaul@chromium.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>, tzungbi@google.com, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_072620_458030_AF273620 
X-CRM114-Status: GOOD (  16.91  )
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

VGhhbmsgeW91IHNvIG11Y2ghCgpPbiBNb24sIERlYyAxMywgMjAyMSBhdCA2OjI3IFBNIENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhpLCBNYXJrOgo+
Cj4gTWFyayBZYWNvdWIgPG1hcmt5YWNvdWJAY2hyb21pdW0ub3JnPiDmlrwgMjAyMeW5tDEy5pyI
MTTml6Ug6YCx5LqMIOS4iuWNiDEyOjA45a+r6YGT77yaCj4gPgo+ID4gQXQgdGhlIHJlc2V0IGhv
b2ssIGNhbGwgX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldCB3aGljaCBpcwo+ID4gY2Fs
bGVkIGF0IHRoZSBpbml0aWFsaXphdGlvbiBvZiB0aGUgcGxhbmUgYW5kIHNldHMgdGhlIGRlZmF1
bHQgdmFsdWUgb2YKPiA+IHJvdGF0aW9uIG9uIGFsbCBwbGFuZXMgdG8gRFJNX01PREVfUk9UQVRF
XzAgd2hpY2ggaXMgZXF1YWwgdG8gMS4KPgo+IEFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQg
WzFdLCB0aGFua3MuCj4KPiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5l
eHQKPgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPgo+ID4KPiA+IFRlc3RlZCBvbiBKYWN1enpp
IChNVEspLgo+ID4gUmVzb2x2ZXMgSUdUQGttc19wcm9wZXJ0aWVzQHBsYW5lLXByb3BlcnRpZXMt
e2xlZ2FjeSxhdG9taWN9Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTWFyayBZYWNvdWIgPG1hcmt5
YWNvdWJAY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fcGxhbmUuYyB8IDMgKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fcGxhbmUuYwo+ID4gaW5kZXggZTZkY2IzNGQzMDUyMi4uYWNjZDI2NDgxYjlmYiAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMKPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMKPiA+IEBAIC00NCw5
ICs0NCwxMCBAQCBzdGF0aWMgdm9pZCBtdGtfcGxhbmVfcmVzZXQoc3RydWN0IGRybV9wbGFuZSAq
cGxhbmUpCj4gPiAgICAgICAgICAgICAgICAgc3RhdGUgPSBremFsbG9jKHNpemVvZigqc3RhdGUp
LCBHRlBfS0VSTkVMKTsKPiA+ICAgICAgICAgICAgICAgICBpZiAoIXN0YXRlKQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gLSAgICAgICAgICAgICAgIHBsYW5lLT5zdGF0
ZSA9ICZzdGF0ZS0+YmFzZTsKPiA+ICAgICAgICAgfQo+ID4KPiA+ICsgICAgICAgX19kcm1fYXRv
bWljX2hlbHBlcl9wbGFuZV9yZXNldChwbGFuZSwgJnN0YXRlLT5iYXNlKTsKPiA+ICsKPiA+ICAg
ICAgICAgc3RhdGUtPmJhc2UucGxhbmUgPSBwbGFuZTsKPiA+ICAgICAgICAgc3RhdGUtPnBlbmRp
bmcuZm9ybWF0ID0gRFJNX0ZPUk1BVF9SR0I1NjU7Cj4gPiAgfQo+ID4gLS0KPiA+IDIuMzQuMS4x
NzMuZzc2YWE4YmMyZDAtZ29vZwo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
