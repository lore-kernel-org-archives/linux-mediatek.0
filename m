Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BDFC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 23:39:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B76D20897
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 23:39:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="puhFsKLj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yZrILwRi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B76D20897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dExOxKiWNQypWIwMhPdv8c3i+HWeUn1S2x37vwTuOpw=; b=puhFsKLjaC24E5rdqjL2YPCrY
	I0LrG9dGA45UGHlDs1pT0k7UZGFkIX/7cbEz1lvtuw1MoIjaOwTTFPIG6dKdQhAB+bddQjQefCZ/v
	uHk067nYjERv7CjdTXm4oesEmvBX7ViTsltdiV/GxoTOTNKWnpBQqle+Hm5/z03kuqyq//CUsEDJZ
	AN2/zWQqjBXoUimQidoxRyJVwJm17cWui5ofFhqj1z+4yRWsSaiWdXyP+IQeU15VtIK2O56HNmwzy
	g16nDwp7C+xtFtXr6DEx8JAggQ7YfBr90gl59d1k0kkJtcpDfAa69cmuEZOsNvpdpVnQ/LhA1L2cH
	PB5FZQLtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHy3y-0002xH-1J; Mon, 14 Sep 2020 23:39:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHy3s-0002uw-Ex; Mon, 14 Sep 2020 23:39:05 +0000
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7026721741;
 Mon, 14 Sep 2020 23:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600126743;
 bh=SqboHRni2bD1vhdXq+F163RDYtXSS69vUAB3qmgkNBY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yZrILwRiKWB3Exo04Zl6br1gc+l/7hc0rbEEUZD7eGpkF/vnTrrTegyPWxzZlH87e
 tb/Nrq3h6DTC2VNTI/4r9e/2B8tbTGokLt/nAf07oTEem9NBKbIYnPTedsGXImc/ry
 4FBNmwk9IUb+vT8xq31IVkhGuXPDsglLsK9TiP8k=
Received: by mail-ed1-f53.google.com with SMTP id ay8so1232927edb.8;
 Mon, 14 Sep 2020 16:39:03 -0700 (PDT)
X-Gm-Message-State: AOAM530T9vIfOWSkBDR2DZdzfFgScGABr3hQvkLNR1AHDDtp97nPfIYp
 1fpFt+z/rtvMmzDMcyCSkIGIIAN1j5/LqintYQ==
X-Google-Smtp-Source: ABdhPJw6RlAfURdpFIW30aW+5Mnee4BOMoBlhb5m43SWlzBpt3unMBFHnJE1V6y4/LgtpshCnDhXAjKJywhgMoXw5nw=
X-Received: by 2002:aa7:dcd2:: with SMTP id w18mr20041867edu.288.1600126742006; 
 Mon, 14 Sep 2020 16:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200909084942.2122349-1-yukuai3@huawei.com>
In-Reply-To: <20200909084942.2122349-1-yukuai3@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 15 Sep 2020 07:38:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY__OPKHd+=WD_nfPJVbXh8As8CDi=tGzbMAtxBQXbzjQYg@mail.gmail.com>
Message-ID: <CAAOTY__OPKHd+=WD_nfPJVbXh8As8CDi=tGzbMAtxBQXbzjQYg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: add exception handing in mtk_drm_probe() if
 component init fail
To: Yu Kuai <yukuai3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_193904_557701_F83C3965 
X-CRM114-Status: GOOD (  19.65  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, yi.zhang@huawei.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 littlecvr@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFl1IEt1YWk6CgpZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+IOaWvCAyMDIw5bm0Oeac
iDnml6Ug6YCx5LiJIOS4i+WNiDQ6NTDlr6vpgZPvvJoKPgo+IG10a19kZHBfY29tcF9pbml0KCkg
aXMgY2FsbGVkIGluIGEgbG9vcCBpbiBtdGtfZHJtX3Byb2JlKCksIGlmIGl0Cj4gZmFpbCwgcHJl
dmlvdXMgc3VjY2Vzc2l2ZSBpbml0IGNvbXBvbmVudCBpcyBub3QgcHJvY2Nlc3NlZC4KPgo+IFRo
dXMgdW5pbml0aWFsaXplIHZhbGlkIGNvbXBvbmVudCBhbmQgcHV0IHRoZWlyIGRldmljZSBpZiBj
b21wb25lbnQKPiBpbml0IGZhaWxlZC4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVu
a3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBGaXhlczogMTE5ZjUxNzM2MjhhICgiZHJtL21lZGlh
dGVrOiBBZGQgRFJNIERyaXZlciBmb3IgTWVkaWF0ZWsgU29DIE1UODE3My4iKQo+IFNpZ25lZC1v
ZmYtYnk6IFl1IEt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4KPgo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8IDcgKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kcnYuYwo+IGluZGV4IDA0MGE4ZjM5M2ZlMi4uNzVhNmNmMjMxZmQ3IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiBAQCAtNTQ0LDggKzU0NCwxMyBAQCBz
dGF0aWMgaW50IG10a19kcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
ICAgICAgIHBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOwo+ICBlcnJfbm9kZToKPiAgICAgICAgIG9m
X25vZGVfcHV0KHByaXZhdGUtPm11dGV4X25vZGUpOwo+IC0gICAgICAgZm9yIChpID0gMDsgaSA8
IEREUF9DT01QT05FTlRfSURfTUFYOyBpKyspCj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgRERQ
X0NPTVBPTkVOVF9JRF9NQVg7IGkrKykgewo+ICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChw
cml2YXRlLT5jb21wX25vZGVbaV0pOwo+ICsgICAgICAgICAgICAgICBpZiAocHJpdmF0ZS0+ZGRw
X2NvbXBbaV0pIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBwdXRfZGV2aWNlKHByaXZhdGUt
PmRkcF9jb21wW2ldLT5sYXJiX2Rldik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJpdmF0
ZS0+ZGRwX2NvbXBbaV0gPSBOVUxMOwo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9Cj4g
ICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiAtLQo+IDIuMjUuNAo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
