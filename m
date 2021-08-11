Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC59C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 23:06:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F0146101D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 23:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F0146101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z01i1KwcoN8LbNo2K7hj2ghSCqdjLhTFAx8vKBClR+A=; b=0Lj5ABY7QR2PjM
	ubIIN5CSwcr5Gb6WV773bBMlK+nhBXXYE/haokqCc+ID5PmWtt2/JtETKCf3RJELtZ69s3VgLD2S3
	ZMxoNtsp/6q4dMidpeBDLrJV2HWlJGSu1rjj1a0U+DMhQn5n4Y8+58LnnIDB7g9Fg2TZnFf5YS45d
	Id5xEvs03g8WOvlyQXMyl2zBVuxeaq7DJzsRcIz1mQWg+hNLPxwv3WcWrUKZNekpeNnZMzejgtis4
	sqEh+HpRoOGIlZM6HGlQHevrS2kjmQXt/bTv2sykedcaux+MQdDbLXfdh+8sAedZFiI43V2Y+ljxB
	Rv9oc2k4DZ+fkaet0DPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDxIm-008J9q-17; Wed, 11 Aug 2021 23:06:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDxIY-008J7J-D5; Wed, 11 Aug 2021 23:06:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EDBA6104F;
 Wed, 11 Aug 2021 23:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628723170;
 bh=UsOaT4gmVMtsJlz3K9nEUp4WRF9PrNQoOdiLg+j11SA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EkFP1qBEjK0Mb4zMCvRF5exzxAY/75d6muJUDKjoNyYJUPEzWv+BVbY3EDDLrLkLR
 Mo9tF0vqCaqGYN193KYYVcFKG+e0EQHEgMBS5cVBcbiV7KjYKa60QKDevbzas8qqwT
 TWMDxcahb3Lc/kUqoz1JD+XGSabDG87fu1xee/3ileHn4wNvEMYmzpYnKvSRWbgpOT
 RMZctrDRRjqRNZkQmOcF51FiuJKvFL8MjvzHWMyB/YZ0Ts2qZH4UO1WkifY0lGu/7/
 pqEW+PxGjSnTaIa2DxFfPYPqv6GAtJnFB8/WjKo8uj/zGn2sGlVvOSjYLRR2XwcGWJ
 3Rg6rAJYW/SPQ==
Received: by mail-ej1-f43.google.com with SMTP id d11so7504150eja.8;
 Wed, 11 Aug 2021 16:06:09 -0700 (PDT)
X-Gm-Message-State: AOAM533HPXoxAT4X5tIiGCnF3Dp+R52YNBAUpCcCKp4dCnFweoH6vLqI
 AhUEV1TlwN7GVUjt7VIBjx0SOQK8gCamQf/tpA==
X-Google-Smtp-Source: ABdhPJxVx9j6cw6zRR+hy0FCROJIHdxukPmtOkwM48DK03ECqZ6PGm117swZuRW/lAgUJ0t+Mtru1ea+F5t65uJJCWY=
X-Received: by 2002:a17:906:4156:: with SMTP id
 l22mr824214ejk.75.1628723168648; 
 Wed, 11 Aug 2021 16:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210810040148.17157-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20210810040148.17157-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 12 Aug 2021 07:05:57 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9+G92rhKCiZZS39VCjo6g3Zj+Ag=SeEuRtbP3c=jsSug@mail.gmail.com>
Message-ID: <CAAOTY_9+G92rhKCiZZS39VCjo6g3Zj+Ag=SeEuRtbP3c=jsSug@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Add component_del in OVL and COLOR
 remove function
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, fshao@chromium.org, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_160610_521412_826951EA 
X-CRM114-Status: GOOD (  15.05  )
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDjmnIgxMOaXpSDpgLHkuowg5LiL5Y2IMTI6MDLlr6vpgZPvvJoKPgo+IEFkZCBjb21w
b25lbnRfZGVsIGluIE9WTCBhbmQgQ09MT1IgcmVtb3ZlIGZ1bmN0aW9uLgoKQXBwbGllZCB0byBt
ZWRpYXRlay1kcm0tZml4ZXMgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9
bWVkaWF0ZWstZHJtLWZpeGVzCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IEZpeGVzOiBmZjEz
OTU2MDllMjAgKCJkcm0vbWVkaWF0ZWs6IE1vdmUgbXRrX2RkcF9jb21wX2luaXQoKSBmcm9tIHN1
YiBkcml2ZXIgdG8gRFJNIGRyaXZlciIpCj4gU2lnbmVkLW9mZi1ieTogamFzb24tamgubGluIDxq
YXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPgo+IC0tLQo+IENoYW5nZSBpbiB2MjoKPiAtIGFkZCBj
b21wb25lbnRfZGVsIGZ1bmN0aW9uIGluIENPTE9SIHJlbW92ZSBmdW5jdGlvbgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYyB8IDIgKysKPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jICAgfCAyICsrCj4gIDIgZmlsZXMgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kaXNwX2NvbG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3BfY29sb3IuYwo+IGluZGV4IDZmNGM4MGJiYzBlYi4uNDczZjViYjVjYmFkIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jb2xvci5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2NvbG9yLmMKPiBAQCAtMTMzLDYgKzEzMyw4
IEBAIHN0YXRpYyBpbnQgbXRrX2Rpc3BfY29sb3JfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPgo+ICBzdGF0aWMgaW50IG10a19kaXNwX2NvbG9yX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICB7Cj4gKyAgICAgICBjb21wb25lbnRfZGVsKCZwZGV2LT5k
ZXYsICZtdGtfZGlzcF9jb2xvcl9jb21wb25lbnRfb3BzKTsKPiArCj4gICAgICAgICByZXR1cm4g
MDsKPiAgfQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9vdmwuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYwo+IGluZGV4
IGZhOWQ3OTk2M2NkMy4uNTMyNjk4OWQ1MjA2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9vdmwuYwo+IEBAIC00MjMsNiArNDIzLDggQEAgc3RhdGljIGludCBtdGtfZGlz
cF9vdmxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPgo+ICBzdGF0aWMgaW50
IG10a19kaXNwX292bF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgewo+
ICsgICAgICAgY29tcG9uZW50X2RlbCgmcGRldi0+ZGV2LCAmbXRrX2Rpc3Bfb3ZsX2NvbXBvbmVu
dF9vcHMpOwo+ICsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtLQo+IDIuMTguMAo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
