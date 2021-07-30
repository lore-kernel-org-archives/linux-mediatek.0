Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57270C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 16:23:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D4C060F4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 16:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D4C060F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XURjVVgL7muAvjjCiPP6+q5MyNfOFhSQrE2o0ug5u+A=; b=sKdE9v15LgJ0Mh
	/k0NBbbjmP/dUGdq5tFXbxBF1Dol6JLERk7rV1v1/2yvnlbG3pxwcwOSTHw20Py70UlHuEyR6czah
	tP6bTv9v99tsoHtp2r+nwrl3Xr0ecrD/GO9rJc1u37FoIQpLbaisyzRi+S33XvhgZAhAalRt7SzK9
	DBzBFh7hmgxLoXx2vOq/bM2ERDYZVVQU6KHWk8Qj9NaD75sb9Ehse5fLPJLjh8qse4GZxCYkMChc3
	Bnrtftw7m5mnO9Z9we5VmW/Jeb8uCyHZ72KC27sQukPKWhykBxIPbCeCvyOtqOrWprgOWvf2Iu8fB
	lsDc7nQEpshFlX6wzvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9VIO-009Twr-Lx; Fri, 30 Jul 2021 16:23:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9VIA-009TuS-K9; Fri, 30 Jul 2021 16:23:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C199760F94;
 Fri, 30 Jul 2021 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627662201;
 bh=FW5LB4/droceMkapj9/opDRSSB08Hj67ZWxOidv6Bak=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pi4Pi51yNSIBNhSaMwGePr9C1LErMMOjm7VEeu4XA+T1AoBJXCXLGmB8IrxI1e9M9
 nQnmJWRnj1dEdcCOyUhUASV58lg6mp8Q9Ch3HUwvo+M1dye9AB0F+qXy56B2fcuIL/
 7yekJ7i6GVA27N22fvtF6si8l9zFY4GT5rxgQq2NQAS5Dq0oMzhdZOivz31N74h7Nk
 aHOOn63rsKKmynnbkepxhaPwWuzDvmlg+3JxANOZXAENVNOzRAfw28Hod0z5Ejznzw
 M68M4cIHmzUAo0PYkJMwhcdiiHP27Sm3RhbIw2ew0QAaHWd8z7SZn4SYwA/sDM82Ju
 Son813H1X1wtg==
Received: by mail-ed1-f46.google.com with SMTP id y7so11716313eda.5;
 Fri, 30 Jul 2021 09:23:21 -0700 (PDT)
X-Gm-Message-State: AOAM5300HV2HR/WAa+sJ9SsoHeFIVBpRysKp0NiD6XWaAotEbN1OsLf5
 ilbXjAEPOk6Y4ITDHq9q6Kk3lcisvfwR2EScyg==
X-Google-Smtp-Source: ABdhPJzMdtcUi1zO0dPd4SSrt2q34Yx/1YxBJlURSGlVXMthQEd0rhojXPsJpfAwWhNd3aUVC/s1oj1cE69g15qMsjo=
X-Received: by 2002:a05:6402:718:: with SMTP id
 w24mr3884876edx.49.1627662200337; 
 Fri, 30 Jul 2021 09:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <1627459111-2907-1-git-send-email-chunfeng.yun@mediatek.com>
 <1627459111-2907-7-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1627459111-2907-7-git-send-email-chunfeng.yun@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 31 Jul 2021 00:23:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_95Qpv-RjxzWteQ-+p=P0siC2c0vAQdkx-V7bfCwgn34g@mail.gmail.com>
Message-ID: <CAAOTY_95Qpv-RjxzWteQ-+p=P0siC2c0vAQdkx-V7bfCwgn34g@mail.gmail.com>
Subject: Re: [PATCH 7/9] phy: phy-mtk-hdmi: convert to
 devm_platform_ioremap_resource
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-phy@lists.infradead.org, 
 DTML <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eddie Hung <eddie.hung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_092322_715546_76E6BE24 
X-CRM114-Status: GOOD (  15.33  )
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

SGksIENodW5mZW5nOgoKQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMeW5tDfmnIgyOOaXpSDpgLHkuIkg5LiL5Y2IMzo1OeWvq+mBk++8mgo+Cj4gVXNlIGRl
dm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSB0byBzaW1wbGlmeSBjb2RlCgpBY2tlZC1ieTog
Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1i
eTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLWhkbWkuYyB8IDcgKystLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS5jIGIvZHJpdmVycy9waHkvbWVkaWF0ZWsv
cGh5LW10ay1oZG1pLmMKPiBpbmRleCA4YWQ4ZjcxN2VmNDMuLjVmYjQyMTdmYjhlMCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLWhkbWkuYwo+ICsrKyBiL2RyaXZl
cnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS5jCj4gQEAgLTEwMCw3ICsxMDAsNiBAQCBzdGF0
aWMgaW50IG10a19oZG1pX3BoeV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
ICB7Cj4gICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ICAgICAgICAg
c3RydWN0IG10a19oZG1pX3BoeSAqaGRtaV9waHk7Cj4gLSAgICAgICBzdHJ1Y3QgcmVzb3VyY2Ug
Km1lbTsKPiAgICAgICAgIHN0cnVjdCBjbGsgKnJlZl9jbGs7Cj4gICAgICAgICBjb25zdCBjaGFy
ICpyZWZfY2xrX25hbWU7Cj4gICAgICAgICBzdHJ1Y3QgY2xrX2luaXRfZGF0YSBjbGtfaW5pdCA9
IHsKPiBAQCAtMTE2LDExICsxMTUsOSBAQCBzdGF0aWMgaW50IG10a19oZG1pX3BoeV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgaWYgKCFoZG1pX3BoeSkKPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4KPiAtICAgICAgIG1lbSA9IHBsYXRmb3Jt
X2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4gLSAgICAgICBoZG1pX3Bo
eS0+cmVncyA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIG1lbSk7Cj4gLSAgICAgICBpZiAo
SVNfRVJSKGhkbWlfcGh5LT5yZWdzKSkgewo+ICsgICAgICAgaGRtaV9waHktPnJlZ3MgPSBkZXZt
X3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7Cj4gKyAgICAgICBpZiAoSVNfRVJS
KGhkbWlfcGh5LT5yZWdzKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoaGRtaV9w
aHktPnJlZ3MpOwo+IC0gICAgICAgfQo+Cj4gICAgICAgICByZWZfY2xrID0gZGV2bV9jbGtfZ2V0
KGRldiwgInBsbF9yZWYiKTsKPiAgICAgICAgIGlmIChJU19FUlIocmVmX2NsaykpIHsKPiAtLQo+
IDIuMTguMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
