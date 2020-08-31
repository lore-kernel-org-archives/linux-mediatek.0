Return-Path: <SRS0=LMMB=CJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D279AC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 16:03:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D21120767
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 16:03:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BnMuv2jF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aG0DDdc9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D21120767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4cWaAuDhEIc/Bk+JLz5Rp0G4PPKqbC3a9GJfbCAKq0Y=; b=BnMuv2jF9NEfkZHRDwpdYsMPr
	Cky/RNsvFYW0Cc3VsxmyOEt6iKIDlHv2Ihgm67nwFkSGIvpz2+o7WF7+VuAGbugq95i50LdKhKW1B
	Fa/2SRo7Ipzwip4SaLknCRVWUwpDs0eTlg4p97oYnKJeAmnOenPlbwjpmxTt9SYVzMiKHyD6srP/X
	9fPu0oJUoqY5+g3vbvYYKIPj4va+YPHJy1k/8M0YTvd4oGGO6vZJhzLdn1F1q1L5eLdP70bXBlTTc
	agxMQng1KgdNyk0PZsTXQanM/nzRfgX5gngQtLks9E2gSlBgNzXq/xGZjJ1eAt+aN/oyYpfCoN5Rp
	bABsytWPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCmGi-00052m-TV; Mon, 31 Aug 2020 16:02:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCmGg-00051m-Hz
 for linux-mediatek@lists.infradead.org; Mon, 31 Aug 2020 16:02:51 +0000
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD2BC20936
 for <linux-mediatek@lists.infradead.org>; Mon, 31 Aug 2020 16:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598889770;
 bh=iE2JfXtNRXcBePxejNj2vUktxPmSGqItV3WCiVQWgHE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aG0DDdc9WaflHUKr1gprlR4aRG0QzH6Q6MUeJfGvbWfxmHwwKuo2S5hQ5lOU5zwSr
 P8el1/7aCTUfpMUAoqct3NYExCyvx69iQwp0jNGmv6za6vsPngXGkRmEcgr1vBEY25
 Dk1pPChAxZINkzT6av+40EEyJ2Exv+pCnZp0AkTk=
Received: by mail-ej1-f54.google.com with SMTP id h4so7668145ejj.0
 for <linux-mediatek@lists.infradead.org>; Mon, 31 Aug 2020 09:02:49 -0700 (PDT)
X-Gm-Message-State: AOAM531v1xrVBYJPj3kztsccfj3mvwi3MnrUmZJMgEZDzQ0vZuvgFQw/
 ODdgJ8nWjl/fLsHe3raMaZ7l/CLV3NGZrrp9yw==
X-Google-Smtp-Source: ABdhPJzVfg2VBCCh3cFVWTXiqVCWpKgkXDpTn86toFw+LFgxINOPaV80H9SEI6gSfpVAinA9c18C4USSDNd1DJAwL8w=
X-Received: by 2002:a17:906:1909:: with SMTP id
 a9mr1679553eje.127.1598889768317; 
 Mon, 31 Aug 2020 09:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200823014830.15962-1-chunkuang.hu@kernel.org>
 <20200823014830.15962-5-chunkuang.hu@kernel.org>
 <1598838539.7054.9.camel@mhfsdcap03>
In-Reply-To: <1598838539.7054.9.camel@mhfsdcap03>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 1 Sep 2020 00:02:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9hZgLGSiqCA6a1Ea+TjGZAH4-t4DFS9jCz3nEXNJY1zg@mail.gmail.com>
Message-ID: <CAAOTY_9hZgLGSiqCA6a1Ea+TjGZAH4-t4DFS9jCz3nEXNJY1zg@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] MAINTAINERS: add files for Mediatek DRM drivers
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_120250_710044_88D77658 
X-CRM114-Status: GOOD (  17.81  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIENodW5mZW5nOgoKQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMOW5tDjmnIgzMeaXpSDpgLHkuIAg5LiK5Y2IOTo1MOWvq+mBk++8mgo+Cj4gT24gU3Vu
LCAyMDIwLTA4LTIzIGF0IDA5OjQ4ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gTWVk
aWF0ZWsgSERNSSBwaHkgZHJpdmVyIGlzIG1vdmVkIGZyb20gZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrIHRvCj4gPiBkcml2ZXJzL3BoeS9tZWRpYXRlaywgc28gYWRkIHRoZSBuZXcgZm9sZGVyIHRv
IHRoZSBNZWRpYXRlayBEUk0gZHJpdmVycycKPiA+IGluZm9ybWF0aW9uLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+ID4gUmV2
aWV3ZWQtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+ICBNQUlOVEFJTkVSUyB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gPiBp
bmRleCBkZWFhZmI2MTczNjEuLjE5MWJhY2YwMjIwOSAxMDA2NDQKPiA+IC0tLSBhL01BSU5UQUlO
RVJTCj4gPiArKysgYi9NQUlOVEFJTkVSUwo+ID4gQEAgLTU3OTMsNiArNTc5Myw3IEBAIEw6ICAg
ICAgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gIFM6ICAgU3VwcG9ydGVkCj4g
PiAgRjogICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay8KPiA+ICBGOiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay8KPiA+ICtGOiAgIGRyaXZlcnMv
cGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaSoKPiA+Cj4gPiAgRFJNIERSSVZFUlMgRk9SIE5WSURJ
QSBURUdSQQo+ID4gIE06ICAgVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNv
bT4KPgo+IFJldmlld2VkLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5j
b20+Cj4KCkNvdWxkIHlvdSBnaXZlIGFuICdBY2tlZC1ieScgdGFnIG9uIHRoaXMgcGF0Y2g/IFNv
IEkgY291bGQgYXBwbHkgdGhlCndob2xlIHNlcmllcyBpbnRvIG15IHRyZWUuCgpSZWdhcmRzLApD
aHVuLUt1YW5nLgoKPiBUaGFua3MKPgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
