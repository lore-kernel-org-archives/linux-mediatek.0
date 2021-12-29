Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DEAC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 19:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ddrmULbmzsCu8/DF6BPt/5fjlY4GdQIhOwaliOAFx0M=; b=zk6yJ75o/yhZsM
	CJvJiE9C05GrxQC9U6+84vqrmHM8tQvHPIsJ2X5ivj1wrb+jNmb397uyGELh6MojUd3i4pLCaDlJZ
	baSAI4yLl+Xji7Ao2MP6kbdV2G7/6PsSaOvjQk8z2sa9rTdHljmvs5oCOzTX+pSBrPAthgl90Gekb
	Ves8RoRtScwjfBZOXyRiOplFowh1AFJRXJeDmJeTEHgZyBfM1ZCLMCfEcGsL4tGJVm7jr/XXDZejl
	LHTx0V+opdhfAOR//8chxRzXQRGJ1ZOzvCOEpBxhYLumStmeBQWd58v+2PNr7jfyEiOoKmPZyM4MF
	nTsdJpTABY534Cm9z4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2efB-003LUN-K5; Wed, 29 Dec 2021 19:31:05 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2ef7-003LTS-HP
 for linux-mediatek@lists.infradead.org; Wed, 29 Dec 2021 19:31:04 +0000
Received: by mail-lf1-x12c.google.com with SMTP id h7so5399473lfu.4
 for <linux-mediatek@lists.infradead.org>; Wed, 29 Dec 2021 11:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1kHntLzhFY+6b33xnFFNKov/UMw0bRniYoNkFNeokK0=;
 b=VSjxFJl0ahNzSM4KdKAVBXj5nnx2ycIMd7oLJm/8VxX+Pq6pIoD8+pfYySEqs9u56K
 LZHUP6bC5wDh2ncQuNiEtxqdC3D9djsXFIsf4IhA3WH/TflZOAhhv+/u3u0/rkJcYAYK
 scuGR2/og7UWys1KX+BarneWj1b5qHACUAEIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1kHntLzhFY+6b33xnFFNKov/UMw0bRniYoNkFNeokK0=;
 b=CRlfyrlf7wLhZWu+Jz6UwRiC2jvZptg18iHe/IFgVW/FztHnxS35wNV3j6EdOD316T
 seiFZhDm8JRErLwQZikQZ98oQjo4BHKFnwJ6nuaHgLw+YvBo1YJJcyIgnsU0iI7gEGPr
 RbGfXAeSTvLTdYFKJvOvZzOR6hvsGnEzCcPVcO8u+ing5TkYSE+vCZQ1TBrY4/zUu+Ly
 9Fe17oLgtayNf18gMNE2M50G1tJTsrVWd9DJKv8sju6+zQ6mXHRA+jMImvzfdLK7GXVE
 tCAkxvgCxoCfhs7RigXzO0f8XKdHhlkjoxg5uuPw/xh9pFJCWWceJtkQkw3cCNECCKbl
 xDpQ==
X-Gm-Message-State: AOAM533B2dwHPc+EwNNlwH8rfgkNbt8/mmpC/6jVvFv8/GFeAK+BM/np
 GyGOnGkn3+wQAqUM6sc9Nxu/8zgT87faAwJea+zauQ==
X-Google-Smtp-Source: ABdhPJzwWydnD66E+ihuzo5xAOnXhWkKsM56kOjwps/BnPwXqQ5sutKmn1B8gZog1GVGDZslne50Xc8xO2HM/LSJsoU=
X-Received: by 2002:ac2:4c54:: with SMTP id o20mr25563858lfk.369.1640806259586; 
 Wed, 29 Dec 2021 11:30:59 -0800 (PST)
MIME-Version: 1.0
References: <20211027162806.2014022-1-markyacoub@chromium.org>
 <20211213160742.744333-1-markyacoub@chromium.org>
 <CAAOTY_81KaSEWAqTWgzmshDZ9BefO3pNrqQwWbB01E4L0+mqzg@mail.gmail.com>
 <CAJUqKUp_Q39S912_epc3pfT-uc3DN=u4sCSdLm9VetwqdH_Pzw@mail.gmail.com>
In-Reply-To: <CAJUqKUp_Q39S912_epc3pfT-uc3DN=u4sCSdLm9VetwqdH_Pzw@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 29 Dec 2021 14:30:48 -0500
Message-ID: <CAJUqKUrrr-QRG1L-+rOV=PGR6LozP=H_SMe+u0V+rGF-OPDtcw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211229_113101_617090_9DF0CC41 
X-CRM114-Status: GOOD (  19.02  )
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

aGV5IC0gdXBsb2FkZWQgdjIgdGhhdCB0YWtlcyBjYXJlIG9mIHRoZSBwYW5lbDoKaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjExMjI5
MTg0NDIwLjc5MzIzNC0xLW1hcmt5YWNvdWJAY2hyb21pdW0ub3JnLwoKVGhhbmtzIQoKT24gVHVl
LCBEZWMgMTQsIDIwMjEgYXQgMTA6MjYgQU0gTWFyayBZYWNvdWIgPG1hcmt5YWNvdWJAY2hyb21p
dW0ub3JnPiB3cm90ZToKPgo+IFRoYW5rIHlvdSBzbyBtdWNoIQo+Cj4gT24gTW9uLCBEZWMgMTMs
IDIwMjEgYXQgNjoyNyBQTSBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPgo+ID4gSGksIE1hcms6Cj4gPgo+ID4gTWFyayBZYWNvdWIgPG1hcmt5YWNvdWJA
Y2hyb21pdW0ub3JnPiDmlrwgMjAyMeW5tDEy5pyIMTTml6Ug6YCx5LqMIOS4iuWNiDEyOjA45a+r
6YGT77yaCj4gPiA+Cj4gPiA+IEF0IHRoZSByZXNldCBob29rLCBjYWxsIF9fZHJtX2F0b21pY19o
ZWxwZXJfcGxhbmVfcmVzZXQgd2hpY2ggaXMKPiA+ID4gY2FsbGVkIGF0IHRoZSBpbml0aWFsaXph
dGlvbiBvZiB0aGUgcGxhbmUgYW5kIHNldHMgdGhlIGRlZmF1bHQgdmFsdWUgb2YKPiA+ID4gcm90
YXRpb24gb24gYWxsIHBsYW5lcyB0byBEUk1fTU9ERV9ST1RBVEVfMCB3aGljaCBpcyBlcXVhbCB0
byAxLgo+ID4KPiA+IEFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCj4g
Pgo+ID4gWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0Cj4gPgo+ID4g
UmVnYXJkcywKPiA+IENodW4tS3VhbmcuCj4gPgo+ID4gPgo+ID4gPiBUZXN0ZWQgb24gSmFjdXp6
aSAoTVRLKS4KPiA+ID4gUmVzb2x2ZXMgSUdUQGttc19wcm9wZXJ0aWVzQHBsYW5lLXByb3BlcnRp
ZXMte2xlZ2FjeSxhdG9taWN9Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmsgWWFjb3Vi
IDxtYXJreWFjb3ViQGNocm9taXVtLm9yZz4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jIHwgMyArKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jCj4gPiA+IGluZGV4IGU2ZGNiMzRkMzA1MjIuLmFj
Y2QyNjQ4MWI5ZmIgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX3BsYW5lLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fcGxhbmUuYwo+ID4gPiBAQCAtNDQsOSArNDQsMTAgQEAgc3RhdGljIHZvaWQgbXRrX3BsYW5l
X3Jlc2V0KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lKQo+ID4gPiAgICAgICAgICAgICAgICAgc3Rh
dGUgPSBremFsbG9jKHNpemVvZigqc3RhdGUpLCBHRlBfS0VSTkVMKTsKPiA+ID4gICAgICAgICAg
ICAgICAgIGlmICghc3RhdGUpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsK
PiA+ID4gLSAgICAgICAgICAgICAgIHBsYW5lLT5zdGF0ZSA9ICZzdGF0ZS0+YmFzZTsKPiA+ID4g
ICAgICAgICB9Cj4gPiA+Cj4gPiA+ICsgICAgICAgX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9y
ZXNldChwbGFuZSwgJnN0YXRlLT5iYXNlKTsKPiA+ID4gKwo+ID4gPiAgICAgICAgIHN0YXRlLT5i
YXNlLnBsYW5lID0gcGxhbmU7Cj4gPiA+ICAgICAgICAgc3RhdGUtPnBlbmRpbmcuZm9ybWF0ID0g
RFJNX0ZPUk1BVF9SR0I1NjU7Cj4gPiA+ICB9Cj4gPiA+IC0tCj4gPiA+IDIuMzQuMS4xNzMuZzc2
YWE4YmMyZDAtZ29vZwo+ID4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
