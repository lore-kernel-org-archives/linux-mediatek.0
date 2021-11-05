Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF949C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 00:01:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B97761213
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 00:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B97761213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17K7R8Xal+rhC8MPUK9ofNSq8/B5ZIcHvFLvtzKqOj4=; b=f0pODrluBgTrgW
	UgG0OovughiumVZm5/nLZz8cwsoyG4p0bCVtYSAqev9YYAbFTUr7sc8fqFiiMZzHL/vlMlBmhvnsg
	vWP9bU31SeDQtkTg4VEo5SQzq+0soAXqkURa8df/IGvrCmKFytGOOUADtAsogSThcg4d1DmS1CNCk
	gES8iNhMyM6pQjBDyFUYDvZ158pL98D7FxagWwGJ+JVOt6Jd1Akus4ZD5rPNVM609fgs0knymoJVW
	7Smo86uuc2i3qyTJnuQccOzSlCV7J0Xki3eqBTtsAbzUeWxV/eKn2hiSERDd1EJnd9sHk0h4bnRW+
	7zdK5PxS7YXNA0M4ChUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mimfL-00AAys-Kj; Fri, 05 Nov 2021 00:01:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mimf0-00AAu8-OB; Fri, 05 Nov 2021 00:00:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DC4161213;
 Fri,  5 Nov 2021 00:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636070446;
 bh=gecQ0nukzSqLw2rZdP9krP19f9e4VSUL6mOBSXKSTkY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mK4Mr1FteUnVP4YznUeFazG/YgAGzji5dNB8U9oXl9/J2au6HJlsFtPKH3c/vrr9R
 nBjRXntR4RCXAfvkn2rfwnBtZ0vdOBKxI69bXnXKLVRGPe1rz43MTypJv3VoavIvQd
 XCCkiLhsV7icEhCsC+lbJJgG/OC15dNBohIURONMEaYly9uc6+M9USvPUoxZVdvzs0
 pNzEyrqgWdlOzyIxaefijWzhak/3bJe282XXuYAzvsX1evgPmaRstHb5oggZr2+RVm
 w9BkU+arQa4O0qjhJwuMRkf59ckoCRGfnXgNcVPbvX9iF9A7NOG3nN9zLpG6mhikB7
 Hw7Ex91dkoIdA==
Received: by mail-ed1-f51.google.com with SMTP id w1so27369811edd.10;
 Thu, 04 Nov 2021 17:00:46 -0700 (PDT)
X-Gm-Message-State: AOAM531U6qF/tuAxJrBRHI9HBaM48Ybny2jbCHStiM5YStU/fDmYf90P
 CQ+oFLhLgcToF2VlwIAggKAvLDdSL90SGfhBNA==
X-Google-Smtp-Source: ABdhPJx/WMm8hJQXmws5vs/A8Eq/kJboI9Ajg4xbaZCnrwqe3NFwsFluqpKG7WJR/yu5SJJOXENMxG3a9r06A35Nhwg=
X-Received: by 2002:a17:907:7f2a:: with SMTP id
 qf42mr524429ejc.388.1636070444817; 
 Thu, 04 Nov 2021 17:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211029075203.17093-1-nancy.lin@mediatek.com>
 <20211029075203.17093-18-nancy.lin@mediatek.com>
In-Reply-To: <20211029075203.17093-18-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 5 Nov 2021 08:00:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-PMzZu-nKweOpL_ybEPAaGD4PpaO=7zsY2rb=B8ubG3A@mail.gmail.com>
Message-ID: <CAAOTY_-PMzZu-nKweOpL_ybEPAaGD4PpaO=7zsY2rb=B8ubG3A@mail.gmail.com>
Subject: Re: [PATCH v7 17/20] drm/mediatek: add mediatek-drm plane color
 encoding info
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_170046_846175_68A6D7D5 
X-CRM114-Status: GOOD (  13.92  )
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

SGksIE5hbmN5OgoKTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDEw5pyIMjnml6Ug6YCx5LqUIOS4i+WNiDM6NTLlr6vpgZPvvJoKPgo+IEFkZCBwbGFuZSBjb2xv
ciBlbmNvZGluZyBpbmZvcm1hdGlvbiBmb3IgY29sb3Igc3BhY2UgY29udmVyc2lvbi4KPiBJdCdz
IGEgcHJlcGFyYXRpb24gZm9yIGFkZGluZyBzdXBwb3J0IGZvciBtdDgxOTUgb3ZsX2FkYXB0b3Ig
bWRwX3JkbWEKPiBjc2MgY29udHJvbC4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVu
a3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBOYW5jeS5MaW4gPG5hbmN5
LmxpbkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX3BsYW5lLmMgfCAxICsKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxh
bmUuaCB8IDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jCj4gaW5kZXggNzM0YTFmYjA1MmRmLi44
MWJkNWQ2ZThkZjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fcGxhbmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5l
LmMKPiBAQCAtMTM3LDYgKzEzNyw3IEBAIHN0YXRpYyB2b2lkIG10a19wbGFuZV91cGRhdGVfbmV3
X3N0YXRlKHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm5ld19zdGF0ZSwKPiAgICAgICAgIG10a19w
bGFuZV9zdGF0ZS0+cGVuZGluZy53aWR0aCA9IGRybV9yZWN0X3dpZHRoKCZuZXdfc3RhdGUtPmRz
dCk7Cj4gICAgICAgICBtdGtfcGxhbmVfc3RhdGUtPnBlbmRpbmcuaGVpZ2h0ID0gZHJtX3JlY3Rf
aGVpZ2h0KCZuZXdfc3RhdGUtPmRzdCk7Cj4gICAgICAgICBtdGtfcGxhbmVfc3RhdGUtPnBlbmRp
bmcucm90YXRpb24gPSBuZXdfc3RhdGUtPnJvdGF0aW9uOwo+ICsgICAgICAgbXRrX3BsYW5lX3N0
YXRlLT5wZW5kaW5nLmNvbG9yX2VuY29kaW5nID0gbmV3X3N0YXRlLT5jb2xvcl9lbmNvZGluZzsK
PiAgfQo+Cj4gIHN0YXRpYyB2b2lkIG10a19wbGFuZV9hdG9taWNfYXN5bmNfdXBkYXRlKHN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lLAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9wbGFuZS5oIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxh
bmUuaAo+IGluZGV4IGQ0NTRiZWNlOTUzNS4uMmQ1ZWM2NmUzZGYxIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmgKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5oCj4gQEAgLTI0LDYgKzI0LDcgQEAgc3RydWN0
IG10a19wbGFuZV9wZW5kaW5nX3N0YXRlIHsKPiAgICAgICAgIGJvb2wgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZGlydHk7Cj4gICAgICAgICBib29sICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGFzeW5jX2RpcnR5Owo+ICAgICAgICAgYm9vbCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBhc3luY19jb25maWc7Cj4gKyAgICAgICBlbnVtIGRybV9jb2xvcl9lbmNvZGluZyAgICAgICAg
IGNvbG9yX2VuY29kaW5nOwo+ICB9Owo+Cj4gIHN0cnVjdCBtdGtfcGxhbmVfc3RhdGUgewo+IC0t
Cj4gMi4xOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
