Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A4BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 14:59:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA511613A6
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 14:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA511613A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jO5PXhhbSzyhvsY6JijNYdvcvzLEGvfhbMcoHe2zIoE=; b=yaIOd7Z+F0cVC9
	I0Xr4Ch3UXG3HpqqpNwY1bPhKz6YebJPsZPGlD1mKJhIXPoOG3WOPaH7R9XSs+bXYNJOyJewh+TpM
	YKsM8roSghXBpR4cvVg3cSetjlV1xaO/LnVIhB2zOQPdgAXaKLmOmCNsYtrSJ5lEvlNsGWEYGAiOO
	XV+ZewC1/Pmrdhrq0ukG6dQFskaRn9CNubt0BW5bMMwkdSFbC4TLI5XgrkptugUOApd66mUOaucDs
	oyeE0Ld2SfKlD8Vb3UNwXuDen6kZsmO4aEhn1Fbz59H5npEid/wEYEOq0EtGBbF8VNykrnqQHSwIU
	P5fVYdb3Ff/SXNhJxAOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVb2r-00BR8z-9h; Wed, 29 Sep 2021 14:58:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVb2c-00BR48-BU; Wed, 29 Sep 2021 14:58:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E583E613CE;
 Wed, 29 Sep 2021 14:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632927517;
 bh=EQQTnRS8lPfDTcCQ7Qonvy40+E4FTsuJpNfA2zp7kgs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QA38vOM7LvC3lgb1+p/mfsCanv5RhcG2wJ/5Rdok8gwueJh0rBgfypeaPcB2/7aTo
 rgqT8J9DXaQ4XkUlIQyaFnjc1qgrNNX66auROy+SsGkioQNE4eR5L/1LOcGesGo6Xe
 hxbQf+csZMQitZFEipW6acVN74Lknruwh5LsAKhE+eqFHXgHR9/zx3W8CrvBeW6nqd
 t7jzPVOhi7hJ8DNhEB6FNMm0boDkRQmeymww8jbeV9/YdarOOQ/nQXnpWiId3PoH7E
 ZlT8UlJobeeFTo9Lc59j6n1UC601UVEFI16BucayUq9HRa+1/Kb2PFPri78q67xhjO
 QV53R3K+EGqgw==
Received: by mail-ed1-f51.google.com with SMTP id v18so9664546edc.11;
 Wed, 29 Sep 2021 07:58:37 -0700 (PDT)
X-Gm-Message-State: AOAM532aIfA7JwLOZIti98dOZwB4cx/HebNChSmpW5fr9TdECwSujgC9
 sIoR7LYoTLYeZZuSCB0YKwb+Prct7WOvtDJHaQ==
X-Google-Smtp-Source: ABdhPJxjDTCqpw+W11Ljil+9t3MzrJAqBg+zykn7W36zQ7oVw8AEF8t6rSe/akCB+6pScUV0nvaP5KPkV9V+4m3JciE=
X-Received: by 2002:a17:907:3e21:: with SMTP id
 hp33mr145136ejc.205.1632927436610; 
 Wed, 29 Sep 2021 07:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210929070807.4488-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20210929070807.4488-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Sep 2021 22:57:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-EEz0tAU_XoL789uOXx_hKGCz53vaaZrA4DSNM4NZ=8g@mail.gmail.com>
Message-ID: <CAAOTY_-EEz0tAU_XoL789uOXx_hKGCz53vaaZrA4DSNM4NZ=8g@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Remove WARN_ON for async_cb.cb in cmdq_exec_done
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@google.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_075838_433224_532F645B 
X-CRM114-Status: GOOD (  15.32  )
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
MjAyMeW5tDnmnIgyOeaXpSDpgLHkuIkg5LiL5Y2IMzowOOWvq+mBk++8mgo+Cj4gQmVjYXVzZSBt
dGtfZHJtX2NydGNfdXBkYXRlX2NvbmZpZyBpcyBub3QgdXNpbmcgY21kcV9wa3RfZmx1c2hfYXN5
bmMsCj4gaXQgd29uJ3QgaGF2ZSBwa3QtPmFzeW5jX2NiLmNiIGFueW1vcmUuCj4KPiBTbyByZW1v
dmUgdGhlIFdBUk5fT04gY2hlY2sgb2YgcGt0LT5hc3luY19jYi5jYiBhdCBjbWRxX2V4ZWNfZG9u
ZS4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4K
Cj4KPiBGaXhlczogMWI2YjBjZTIyNDBlICgibWFpbGJveDogbXRrLWNtZHE6IFVzZSBtYWlsYm94
IHJ4X2NhbGxiYWNrIikKPiBTaWduZWQtb2ZmLWJ5OiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxp
bkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94
LmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jIGIvZHJpdmVycy9tYWlsYm94L210
ay1jbWRxLW1haWxib3guYwo+IGluZGV4IDY0MTc1YTg5MzMxMi4uYzU5MWRhYjlkNWE0IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMKPiArKysgYi9kcml2
ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jCj4gQEAgLTE5NSw3ICsxOTUsNiBAQCBzdGF0
aWMgdm9pZCBjbWRxX3Rhc2tfZXhlY19kb25lKHN0cnVjdCBjbWRxX3Rhc2sgKnRhc2ssIGludCBz
dGEpCj4gICAgICAgICBzdHJ1Y3QgY21kcV90YXNrX2NiICpjYiA9ICZ0YXNrLT5wa3QtPmFzeW5j
X2NiOwo+ICAgICAgICAgc3RydWN0IGNtZHFfY2JfZGF0YSBkYXRhOwo+Cj4gLSAgICAgICBXQVJO
X09OKGNiLT5jYiA9PSAoY21kcV9hc3luY19mbHVzaF9jYilOVUxMKTsKPiAgICAgICAgIGRhdGEu
c3RhID0gc3RhOwo+ICAgICAgICAgZGF0YS5kYXRhID0gY2ItPmRhdGE7Cj4gICAgICAgICBkYXRh
LnBrdCA9IHRhc2stPnBrdDsKPiAtLQo+IDIuMTguMAo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
