Return-Path: <SRS0=6w7/=HO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1D8C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Feb 2021 14:41:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B212464E74
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Feb 2021 14:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B212464E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ijuFEPr1gvIiLmXJNvVlYu6AWftCTCqNWVSo9fe8fGw=; b=16rp5FPUE0O7kFVdxe4YTm4f2
	08JUe0qQpDrOQY+5nzf5rQUDfZpuLIw2f6ghh5RKBVt1CVPZ5OAqUWSHIIxByQ8asJ15q7an7N9ht
	I5egQjDWt0kaKOBdgViVxKB0G9NcexWmI5ANJiX5fQoa7S8DLzNNYsXcFLkYY0cF/R5jNcNBA0R4n
	hGcEg8Tamn961WeCmQt3va781JmJjLPljl3If5mbAbEUCMs1gMsacSb9knPYbAnAeT/VBN+EOMQh1
	Fm3F31zbgQCWTovTz8lLkM1RFrgWQxiqUi+ofmXkbvvslplxYqXWHekzAPSRgVx8TxF98SrCAnMp7
	ThyJt5SxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAZcy-0004yg-8O; Fri, 12 Feb 2021 14:41:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAZcs-0004xS-9w; Fri, 12 Feb 2021 14:40:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8542064E79;
 Fri, 12 Feb 2021 14:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613140852;
 bh=lNmf+KonFuMPi+dCFqb4apHvIFyN63ZqhEuNvuAJZJU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=td5au61zw+FH83RNa8thtPObsVAI3458852CvKpchSTdCb59iljNK91+7ECh7e/jg
 brNylOPY9rhazfPz5HfUtkgLYLr+4iD2qjjm85S23sSu8QamwRhRy9hqw4j596QHsk
 GQBnjoYAelq9h2WyRYvO4c+4rMyGmJCOF283ctuNGrnn0i9f+4NkcLMTyvABsZ8O9j
 wOkBodRWHRpTeGzaFOsm9BO80z7Xj9CTt2FwudCt3JpWieXsBsjobjBhCw8IgSkdw9
 rgBHPvGWerc0LdUgYLHZEelv5aPoesfeKzX1KF7I/7Y1Dtr7cblt5zr7Iv+fMooY2c
 z381YVLqhw/4w==
Received: by mail-wr1-f53.google.com with SMTP id b3so8230295wrj.5;
 Fri, 12 Feb 2021 06:40:52 -0800 (PST)
X-Gm-Message-State: AOAM530KHlORXhVzgW2IcTdOqtJEGTqqflyLHj9TgC98t33FLysrFhwJ
 JeUXVsQCP8OLzJgAv9iQ03bpyK8nUNgT8DxDfA==
X-Google-Smtp-Source: ABdhPJwlgv4RWqsDiLaeTsG54Sh0GpBHZUBUqDQ3pj4i+G7BzdkEZweyl6jsXPlPJ0Trb4kAvI8JnfP3v+LhWsbBKNY=
X-Received: by 2002:a5d:6783:: with SMTP id v3mr3814242wru.394.1613140851043; 
 Fri, 12 Feb 2021 06:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
 <20210201070016.41721-3-chunfeng.yun@mediatek.com>
In-Reply-To: <20210201070016.41721-3-chunfeng.yun@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 12 Feb 2021 22:40:39 +0800
X-Gmail-Original-Message-ID: <CAAOTY__QS8USVB3ZZ_a9t8VvOEZvnLCpdVxPtwgG0m9__p+fMQ@mail.gmail.com>
Message-ID: <CAAOTY__QS8USVB3ZZ_a9t8VvOEZvnLCpdVxPtwgG0m9__p+fMQ@mail.gmail.com>
Subject: Re: [PATCH next v3 03/16] dt-bindings: phy: mediatek: dsi-phy: modify
 compatible dependence
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_094054_482486_BEFAB43B 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 DTML <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIENodW5mZW5nOgoKQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMeW5tDLmnIgx5pelIOmAseS4gCDkuIvljYgzOjAw5a+r6YGT77yaCj4KPiBtdDc2MjMt
bWlwaS10eCBpcyBjb21wYXRpYmxlIHRvIG10MjcwMS1taXBpLXR4LCBhbmQgdXNlCj4gIm1lZGlh
dGVrLG10MjcwMS1taXBpLXR4IiBpbnN0ZWFkIG9uIE1UNzYyMywgc28gbW9kaWZ5Cj4gdGhlIGNv
bXBhdGlibGUgaXRlbXMgdG8gbWFrZSBkZXBlbmRlbmNlIGNsZWFyLgoKQWNrZWQtYnk6IENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IENjOiBDaHVuLUt1YW5nIEh1
IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBw
ZW5ndXRyb25peC5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1
bkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gdjM6IG1vZGlmeSBjb21taXQgbWVzc2FnZSBzdWdnZXN0
ZWQgYnkgQ0sKPiB2Mjogc2VwYXJhdGUgdHdvIHBhdGNoZXMgc3VnZ2VzdGVkIGJ5IENLCj4gLS0t
Cj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwgICB8
IDEzICsrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sCj4gaW5kZXggNzFkNGFjZWExZjY2
Li42ZTRkNzk1ZjliMDIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFtbAo+IEBAIC0xOSwxMSAr
MTksMTQgQEAgcHJvcGVydGllczoKPiAgICAgIHBhdHRlcm46ICJeZHNpLXBoeUBbMC05YS1mXSsk
Igo+Cj4gICAgY29tcGF0aWJsZToKPiAtICAgIGVudW06Cj4gLSAgICAgIC0gbWVkaWF0ZWssbXQy
NzAxLW1pcGktdHgKPiAtICAgICAgLSBtZWRpYXRlayxtdDc2MjMtbWlwaS10eAo+IC0gICAgICAt
IG1lZGlhdGVrLG10ODE3My1taXBpLXR4Cj4gLSAgICAgIC0gbWVkaWF0ZWssbXQ4MTgzLW1pcGkt
dHgKPiArICAgIG9uZU9mOgo+ICsgICAgICAtIGl0ZW1zOgo+ICsgICAgICAgICAgLSBlbnVtOgo+
ICsgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ3NjIzLW1pcGktdHgKPiArICAgICAgICAgIC0g
Y29uc3Q6IG1lZGlhdGVrLG10MjcwMS1taXBpLXR4Cj4gKyAgICAgIC0gY29uc3Q6IG1lZGlhdGVr
LG10MjcwMS1taXBpLXR4Cj4gKyAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE3My1taXBpLXR4
Cj4gKyAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE4My1taXBpLXR4Cj4KPiAgICByZWc6Cj4g
ICAgICBtYXhJdGVtczogMQo+IC0tCj4gMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
