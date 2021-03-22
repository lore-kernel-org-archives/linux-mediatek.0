Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E974CC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 15:06:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E6D36192E
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 15:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E6D36192E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+DNRNSVSqwKfFpLNXRLFIS9EeiWZAVYHGIFBZtqwVeY=; b=JU3BX/gxMNzM+r+NVU2Z0wCnd
	p3qpluHiph2hqDDtxsV9iN6kShHQNgZpcetTC2JGZi3OiSTQGB1hwT+yBEcOsDFICylwm0dhHNJds
	TUF/AMy1sUI2016JXktYGRE0B2F9Cy96XmTSTPwuFPRBTaAnrJzWo2rPHhWqzWM2RXPsqmAxnGQ1D
	ASNYh++SsSxqwSc5ZVMXAB9wqjcxs3yysjv49z7K9UgdDl/rvzQgJmPh55fFBRt8Q7Uz+C7vJit0Y
	77+mY6jeHMrVq9HH3RmHEx0WKJTaXNdJDgvpBSe6Id6PfI68bAId4InYhQFeUwOIJeVDsg+8EumXd
	HYi+n6lQA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOM7t-00Bqkv-OS; Mon, 22 Mar 2021 15:05:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOM7X-00Bqhh-BW; Mon, 22 Mar 2021 15:05:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE8676198E;
 Mon, 22 Mar 2021 15:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616425528;
 bh=c4yP7LH8IBW/QR/vQG5f43s6dXD+rwLuJrpHYufaYPg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fs29X7UnIjE+Bl8ZhIKrYh5yNaYulJZGHlE+nNA9MKMIARjndFhJZSrJOathwSV8R
 uugjpqF1mpuEJF/pZKPn/dQVsYEh1ewpWy7X3z/6fDBA6opAV4iC11ODWBZ1jQFf0r
 HAyho/s5aElYWAPrdEl6cG3qvDBIC0YvolWrvSom6nj/v+DYAyZCqkyNKcbjXYc/Q0
 nwk+k9SAPvQg1qezFKJJUXHqFVWcpyruK0W3yM+OrLYYDXbfHP9oVb2/PAskylPqbo
 vnmqZT64DQJHD40k1NfcR59h304u+irrl89Gk/ROKyANR7qmPxofwImf2iuD/96Tzo
 YRmHXbNZF4wug==
Received: by mail-ej1-f52.google.com with SMTP id a7so21830424ejs.3;
 Mon, 22 Mar 2021 08:05:27 -0700 (PDT)
X-Gm-Message-State: AOAM533P81ClIJxGOmKbzvb1uQAfU++NneMRq80OXd/1vD8PGf3i+6H3
 XpjM//To0jKOMiTpzkNuYM0s2O5kxTHajteroA==
X-Google-Smtp-Source: ABdhPJyZsV8x+yYZywL3lcsQsXOxgCOh3eH/w6d7o0h5Iv9aWzDffRX6YSUicNu0SInCh4YA5/zW5+whL6f4MGzx6i4=
X-Received: by 2002:a17:907:7651:: with SMTP id
 kj17mr184000ejc.127.1616425526252; 
 Mon, 22 Mar 2021 08:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-5-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_98vrwQrefD9KwvsM+9+tDpNcUwbLoVwu_mXRf17imuTA@mail.gmail.com>
In-Reply-To: <CAAOTY_98vrwQrefD9KwvsM+9+tDpNcUwbLoVwu_mXRf17imuTA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 22 Mar 2021 23:05:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-yegJy-z4E_A0=3uxHHgre0jH2syQOY==PLe6yvx0vYA@mail.gmail.com>
Message-ID: <CAAOTY_-yegJy-z4E_A0=3uxHHgre0jH2syQOY==PLe6yvx0vYA@mail.gmail.com>
Subject: Re: [PATCH v3, 4/8] soc: mediatek: mmsys: add component OVL_2L2
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_150533_765924_4BA33BDF 
X-CRM114-Status: GOOD (  15.86  )
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

SGksIE1hdHRoaWFzOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaW
vCAyMDIw5bm0MTLmnIgyOeaXpSDpgLHkuowg5LiL5Y2IMTE6MjPlr6vpgZPvvJoKPgo+IEhpLCBZ
b25ncWlhbmc6Cj4KPiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4g
5pa8IDIwMjDlubQxMuaciDI45pelIOmAseS4gCDkuIvljYg0OjM35a+r6YGT77yaCj4gPgo+ID4g
VGhpcyBwYXRjaCBhZGQgY29tcG9uZW50IE9WTF8yTDIKPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQg
dGhpcyBwYXRjaD8gT25lIGRybSBwYXRjaCBbMV0gZGVwZW5kcyBvbiB0aGlzIHBhdGNoLgoKWzFd
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRj
aC8yMDIxMDIwMjA4MTIzNy43NzQ0NDItMi1oc2lueWlAY2hyb21pdW0ub3JnLwoKUmVnYXJkcywK
Q2h1bi1LdWFuZy4KCgo+Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9u
Z3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2xpbnV4L3NvYy9t
ZWRpYXRlay9tdGstbW1zeXMuaCB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGst
bW1zeXMuaCBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oCj4gPiBpbmRl
eCA0YjZjNTE0Li40MjQ3NmMyIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9zb2MvbWVk
aWF0ZWsvbXRrLW1tc3lzLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210
ay1tbXN5cy5oCj4gPiBAQCAtMjksNiArMjksNyBAQCBlbnVtIG10a19kZHBfY29tcF9pZCB7Cj4g
PiAgICAgICAgIEREUF9DT01QT05FTlRfT1ZMMCwKPiA+ICAgICAgICAgRERQX0NPTVBPTkVOVF9P
VkxfMkwwLAo+ID4gICAgICAgICBERFBfQ09NUE9ORU5UX09WTF8yTDEsCj4gPiArICAgICAgIERE
UF9DT01QT05FTlRfT1ZMXzJMMiwKPiA+ICAgICAgICAgRERQX0NPTVBPTkVOVF9PVkwxLAo+ID4g
ICAgICAgICBERFBfQ09NUE9ORU5UX1BXTTAsCj4gPiAgICAgICAgIEREUF9DT01QT05FTlRfUFdN
MSwKPiA+IC0tCj4gPiAxLjguMS4xLmRpcnR5Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4g
PiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
