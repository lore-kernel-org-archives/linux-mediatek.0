Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17592C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 14:47:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0C87611CD
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 14:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0C87611CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8liqE0f+pEFl81wc+XXYgEmPdJRMRHHW2eQHN9taIWQ=; b=YoUC7gDnpukiNg
	gedEzr1BuDqn5sE2VMP7nIX7fFMdEauqfe6ik+ogPqEhjUnqagRp5D2i++m1BB+EfxByTdFbgSqr8
	K7cR1Tj0jArhgO0JzxojssVQQKyhtP+har6rwJ0aK7EIoUtNwi19aJvPPBMPOgSllvC7coJ44QwOD
	7Q8nrDGlxvRcoaO7gD8kz9wnHx6TK+iXq6SGALlBhBaAR75DuscZSqz13NWj2OtWAtQOj1UiLO0YQ
	toQK8nW9Wr9d1hXULnmNdyohnOKLhqwiA9ZhoqoOGoqqRgvI1ZRCmtam/JeR80dlck06JR+hCIZJD
	FVlU4PIHTsoX2IgJhfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2xDk-007fEp-Tt; Mon, 12 Jul 2021 14:47:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2xDY-007fCD-5S; Mon, 12 Jul 2021 14:47:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CA49611CD;
 Mon, 12 Jul 2021 14:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626101251;
 bh=GNc7iEYnBjS+TNAD0DgnhNoeKiMhXXlDvGKvY8DoZQs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hfzOTcL4oK1IocXnx1Wq7lqzjwGJwnbHvjCA3/7lrwqKbAJ/ScbvxhKybAAaQ/Gi6
 4KqLLt9Q9s+DD5gcsJObTWDN23anRPJYI22GiDJjj+tfSK9ePDv7wk0OKb/aPBo79a
 0oCLEMOU/AJiY4MFIlbWzHNzzGdhnBCEILwbyY4LGVptCpVjAgDjisuNqzHSGp5l2q
 1MgzktbTqbyMNF44av/NHwXX6DKmKeelHjbsMCXq+alV734bnq0HCcNDC7YLg1dnZG
 Eq3lebipgdKtxN7aZ8uZdA4zWYjbtyIpuqEUwnM9Ji1sUAD3Q6MqaUsKcEstj2QYuo
 l2A8RNOg9eb1Q==
Received: by mail-ej1-f45.google.com with SMTP id o5so35139582ejy.7;
 Mon, 12 Jul 2021 07:47:30 -0700 (PDT)
X-Gm-Message-State: AOAM533bc6feraCWZxqGEQnf6ksKTOcakwp0+KoCbiVrCG81Rx8o/vwG
 hjrCCXnUn4dXJMNpMWlR/OFzUlLNT1nmpPBY1A==
X-Google-Smtp-Source: ABdhPJz9wP8zZM8xJ1hflPWLyv4neAHs8saPkzoZPDHElB1yvcecZ7bIL4bSeSE95OMDgqTedtJuc4UOl39QeqziLFw=
X-Received: by 2002:a17:907:62a1:: with SMTP id
 nd33mr53383549ejc.303.1626101249542; 
 Mon, 12 Jul 2021 07:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <1625986431-27399-1-git-send-email-yongqiang.niu@mediatek.com>
 <1625986431-27399-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1625986431-27399-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 12 Jul 2021 22:47:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-15k_Fq4svKfaKukuYxc4DRfqP1kRudR9wgSrkc-+ZoQ@mail.gmail.com>
Message-ID: <CAAOTY_-15k_Fq4svKfaKukuYxc4DRfqP1kRudR9wgSrkc-+ZoQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: adjust rdma fifo threshold calculate
 formula
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_074732_282918_59C4BABE 
X-CRM114-Status: GOOD (  15.99  )
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

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDfmnIgxMeaXpSDpgLHml6Ug5LiL5Y2IMjo1NOWvq+mBk++8mgo+Cj4gdGhl
IG9yZ2luYWwgZm9ybXVsYSB3aWxsIGNhdXNlZCByZG1hIGZpZm8gdGhyZXNob2xkIGNvbmZpZyBv
dmVyZmxvdwo+IGFuZCBubyBvbmUgY291bGQgY29tZSBvdXQgYSBzb2x1dGlvbiBmb3IgYWxsIFNv
QywKPiBzZXQgdGhyZXNob2xkIHRvIDcwJSBvZiBtYXggZmlmbyBzaXplIHRvIG1ha2Ugc3VyZSBp
dCB3aWxsCj4gbm90IG92ZXJmbG93LCBhbmQgNzAlIGlzIGEgZW1waXJpY2FsIHZhbHVlCgpBcHBs
aWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQv
bG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFNpZ25l
ZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jIHwgNiArKystLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYwo+IGluZGV4IGYxMjNmYzAuLmYx
ZjZhMmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3Jk
bWEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMKPiBA
QCAtMTY0LDEwICsxNjQsMTAgQEAgdm9pZCBtdGtfcmRtYV9jb25maWcoc3RydWN0IGRldmljZSAq
ZGV2LCB1bnNpZ25lZCBpbnQgd2lkdGgsCj4gICAgICAgICAvKgo+ICAgICAgICAgICogRW5hYmxl
IEZJRk8gdW5kZXJmbG93IHNpbmNlIERTSSBhbmQgRFBJIGNhbid0IGJlIGJsb2NrZWQuCj4gICAg
ICAgICAgKiBLZWVwIHRoZSBGSUZPIHBzZXVkbyBzaXplIHJlc2V0IGRlZmF1bHQgb2YgOCBLaUIu
IFNldCB0aGUKPiAtICAgICAgICAqIG91dHB1dCB0aHJlc2hvbGQgdG8gNiBtaWNyb3NlY29uZHMg
d2l0aCA3LzYgb3ZlcmhlYWQgdG8KPiAtICAgICAgICAqIGFjY291bnQgZm9yIGJsYW5raW5nLCBh
bmQgd2l0aCBhIHBpeGVsIGRlcHRoIG9mIDQgYnl0ZXM6Cj4gKyAgICAgICAgKiBvdXRwdXQgdGhy
ZXNob2xkIHRvIDcwJSBvZiBtYXggZmlmbyBzaXplIHRvIG1ha2Ugc3VyZSB0aGUKPiArICAgICAg
ICAqIHRocmVob2xkIHdpbGwgbm90IG92ZXJmbG93Cj4gICAgICAgICAgKi8KPiAtICAgICAgIHRo
cmVzaG9sZCA9IHdpZHRoICogaGVpZ2h0ICogdnJlZnJlc2ggKiA0ICogNyAvIDEwMDAwMDA7Cj4g
KyAgICAgICB0aHJlc2hvbGQgPSByZG1hX2ZpZm9fc2l6ZSAqIDcgLyAxMDsKPiAgICAgICAgIHJl
ZyA9IFJETUFfRklGT19VTkRFUkZMT1dfRU4gfAo+ICAgICAgICAgICAgICAgUkRNQV9GSUZPX1BT
RVVET19TSVpFKHJkbWFfZmlmb19zaXplKSB8Cj4gICAgICAgICAgICAgICBSRE1BX09VVFBVVF9W
QUxJRF9GSUZPX1RIUkVTSE9MRCh0aHJlc2hvbGQpOwo+IC0tCj4gMS44LjEuMS5kaXJ0eQo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
