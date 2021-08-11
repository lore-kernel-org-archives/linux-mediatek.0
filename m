Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCD4C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 23:06:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CABE76101D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 23:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CABE76101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EcjiByY5hlVBByNke2T8bX4qGnlS5PP/GQaTfbyhKHQ=; b=t3SSi5yqP1xLmK
	Ia9Q/PE95KZS4X1d9lCZok/v6IK/0/Fx1O8CmrSLVEfaZOMTLpK6llRiVer1EMBjnJXi6Rn94l/tY
	IOLyFJPyDZkRWBjzh8zGM8/aSQnTVl/hvKx6wBxPC6Z+Dj903cp6YylDJjjnQDLxasMr2umtM50iP
	36DqsCCx3ZmWs6yl85cuyDCUtDNrUqAVroz4IG7u/ylKMIt6efHEM9Ktq8/48upbeclqTTTDcfwBB
	l4lBDVJPKjhbppANA8CKsz9FvvhMwrzspi8VdSRlhiTonE4RDM5+Szwlvy7+HUrmquNuOroT9lbcc
	UzfBwnZ9QCluIYcKKYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDxIM-008J5a-FK; Wed, 11 Aug 2021 23:05:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDxI9-008J4G-CH; Wed, 11 Aug 2021 23:05:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D89C96104F;
 Wed, 11 Aug 2021 23:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628723143;
 bh=LBkFZQCUVSz/Rhx1ZP4O8O+xC4njvVvDFWJMqfhUzZc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N7j+EgSapAyF+E2AEGflrSJiCZjpXiN2JMJWDRznUA/NrxH+lurInjTi1MtNpy85D
 xrJ7HqMEM0cEO5JzCgW2Lz0DffXyBVfrtxqKIXiAn6i5bBxbOSn+zcxVG6d6GvMMrK
 bVWXu4t+swt1Ylq/HkupY0NqVEegG6CVxnygcST8s+n1CW6/WYqUrUQkxfr5m2S/ow
 pMTVv8JkSs5Lvg++Yqzdkq9L51sUm711vSUAPRNPiIeTBhtJ5goF6+14H2UfZQX2Vu
 cZcu3ctNnysA4Km0Q2sG4gehaPE1JbwKv5poy95kXoLmCCFE/qu1rkqhn293tb2X4e
 qMsycz3wt/GRg==
Received: by mail-ej1-f48.google.com with SMTP id go31so7502320ejc.6;
 Wed, 11 Aug 2021 16:05:43 -0700 (PDT)
X-Gm-Message-State: AOAM531Wp5FxZv1Dbd7cKcyKYlTwNW3Qni59IX2IbE3GSd0SiPXOtsaS
 tLEcyThN5FW9wx3CeFmeswo4E2PmlCAzzznLIA==
X-Google-Smtp-Source: ABdhPJyl3xEbZZiTrI86cuk97OLZ4BOIdeT1gJvH8o+OFIusAC3qYu99JLfekICMO5HYVUlnTIbMmIkwRgDjMX6NUW0=
X-Received: by 2002:a17:906:fcd7:: with SMTP id
 qx23mr818236ejb.267.1628723142314; 
 Wed, 11 Aug 2021 16:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210810025503.16353-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20210810025503.16353-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 12 Aug 2021 07:05:31 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8+wnXxetnvijkc1FCN=bPuq8sO4psoTpjT9gS-4nieMw@mail.gmail.com>
Message-ID: <CAAOTY_8+wnXxetnvijkc1FCN=bPuq8sO4psoTpjT9gS-4nieMw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: add AAL output size configuration
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, fshao@chromium.org, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_160545_491322_4910C927 
X-CRM114-Status: GOOD (  15.98  )
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
MjAyMeW5tDjmnIgxMOaXpSDpgLHkuowg5LiK5Y2IMTA6NTXlr6vpgZPvvJoKPgo+IFRvIGF2b2lk
IHRoZSBvdXRwdXQgd2lkdGggYW5kIGhlaWdodCBpcyBpbmNvcnJlY3QsCj4gQUFMX09VVFBVVF9T
SVpFIGNvbmZpZ3VyYXRpb24gc2hvdWxkIGJlIHNldC4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJt
LWZpeGVzIFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRy
bS1maXhlcwoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBGaXhlczogMDY2NGQxMzkyYzI2ICgi
ZHJtL21lZGlhdGVrOiBBZGQgQUFMIGVuZ2luZSBiYXNpYyBmdW5jdGlvbiIpCj4gU2lnbmVkLW9m
Zi1ieTogamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPgo+IC0tLQo+IENo
YW5nZSBpbiB2MjoKPiAtIGZpeCB0byBvbmUgbGluZQo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZGRwX2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmMKPiBpbmRleCA3NWJjMDBlMTdmYzQuLjUwZDIwNTYyZTYxMiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IEBAIC0zNCw2ICszNCw3IEBA
Cj4KPiAgI2RlZmluZSBESVNQX0FBTF9FTiAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAw
MDAKPiAgI2RlZmluZSBESVNQX0FBTF9TSVpFICAgICAgICAgICAgICAgICAgICAgICAgICAweDAw
MzAKPiArI2RlZmluZSBESVNQX0FBTF9PVVRQVVRfU0laRSAgICAgICAgICAgICAgICAgICAweDA0
ZDgKPgo+ICAjZGVmaW5lIERJU1BfRElUSEVSX0VOICAgICAgICAgICAgICAgICAgICAgICAgIDB4
MDAwMAo+ICAjZGVmaW5lIERJVEhFUl9FTiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJ
VCgwKQo+IEBAIC0xOTcsNiArMTk4LDcgQEAgc3RhdGljIHZvaWQgbXRrX2FhbF9jb25maWcoc3Ry
dWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgdywKPiAgICAgICAgIHN0cnVjdCBtdGtfZGRw
X2NvbXBfZGV2ICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4KPiAgICAgICAgIG10a19k
ZHBfd3JpdGUoY21kcV9wa3QsIHcgPDwgMTYgfCBoLCAmcHJpdi0+Y21kcV9yZWcsIHByaXYtPnJl
Z3MsIERJU1BfQUFMX1NJWkUpOwo+ICsgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgdyA8
PCAxNiB8IGgsICZwcml2LT5jbWRxX3JlZywgcHJpdi0+cmVncywgRElTUF9BQUxfT1VUUFVUX1NJ
WkUpOwo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgbXRrX2FhbF9nYW1tYV9zZXQoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKnN0YXRlKQo+IC0tCj4gMi4xOC4wCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
