Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99449C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 14:29:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56DCD223DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 14:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56DCD223DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wah/f+3Dwx8flYQnVP5tQ3C1sC4Z8kP0uefsm2c3JO0=; b=FPX34vDVRZZdY7jqZu2a8ZrDI
	3GPaDEBS/MOu3KVD8ggMYohRsuQhOQbiA2usTLv/ObFDFpnGp1TVybGqUY+OCVxUPtwuQR7dtS8cv
	ErOwjMLq8U8sOy91kxAnxtwOhZZQfJ3vPibg8xq6NjXGOLXg6tLRepkkB08a1I7DLSy+Z6NLh1WlJ
	LoPXzBc0wzDqFS3+uhN82JI8SRwq1U8dtz5X8Z0TIiqpcOLdg6ZNKga7h4USRVaeowmV9QVnDSJ2Y
	piEQh0XAmZKYNBcrKXogjU8Ix25EN0WHhCjrJS5XMXmMvlhPJCXWSxy6vEY3zNRUuw1V7F/v5wZRk
	1VMJ2+r3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksRbt-0005Mo-UD; Thu, 24 Dec 2020 14:28:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksRbm-0005Jl-ON; Thu, 24 Dec 2020 14:28:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A1B1E22512;
 Thu, 24 Dec 2020 14:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608820129;
 bh=avuCDzNbHj2dpF1wMtlr+eCWDnDVKL9dKK9/kgnxfs4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ENCPJqaoTtx/w/gjRxswEHbm+8HVvkn/o6ithsijzpCIyPfZxK6j1NMT5Bqr0GEGI
 nJVwGA+Av6dt/xpjmGqyZ0IerOW/S1adE0iqYlvt0jFYaEoV/sc4DI1VKJR/6/4Uu+
 lNaBlogIq22j485Mm06pp3JZi3HVh0MxQ3EkbAUlgpSVgK7mBmF0L/hsLNbRCJnGRJ
 +J437zPckoQBf8YfDHgLzoGb+sQdGWxdfEDRl4E9vbSvHVONERHw+PCh/jPLTvwvNJ
 c4QetSUTVX0uPyqGtPdArOXyrscuH+NmJzl8L4QcKU299UfhUOUzMDaZU0rZGoTxYm
 XdnBTAc/QCFJQ==
Received: by mail-ej1-f44.google.com with SMTP id jx16so3496959ejb.10;
 Thu, 24 Dec 2020 06:28:49 -0800 (PST)
X-Gm-Message-State: AOAM532nlb5wjLK6VZIM9XS+9XrOuOES2aT/fZ4kqB7PAL5uRIe/sgWy
 KWVT/Pz3bG1GiTnR8PyUBUCSGzh23dBG2np7RA==
X-Google-Smtp-Source: ABdhPJz4FZaQVqFZ83WxFt3Fe2+BmFRA28vGU8ERYHuq8sPphR3iLihx8v6LeP10GlrFZUcP3U+83p989lbPDy9D1OQ=
X-Received: by 2002:a17:907:9627:: with SMTP id
 gb39mr28660682ejc.267.1608820128218; 
 Thu, 24 Dec 2020 06:28:48 -0800 (PST)
MIME-Version: 1.0
References: <1608770889-9403-1-git-send-email-yongqiang.niu@mediatek.com>
 <1608770889-9403-4-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1608770889-9403-4-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 24 Dec 2020 22:28:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9e9qadeO9k7zQnvSLZAAJFxjWwYSBz-XXEUUh16jsptA@mail.gmail.com>
Message-ID: <CAAOTY_9e9qadeO9k7zQnvSLZAAJFxjWwYSBz-XXEUUh16jsptA@mail.gmail.com>
Subject: Re: [PATCH v2, 3/3] mailbox: cmdq: add mt8192 support
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_092850_903504_F4A56123 
X-CRM114-Status: GOOD (  17.65  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMjTml6Ug6YCx5ZubIOS4iuWNiDg6NTXlr6vpgZPvvJoKPgo+IGFk
ZCBtdDgxOTIgc3VwcG9ydAo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWFpbGJveC9tdGstY21kcS1t
YWlsYm94LmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyBiL2RyaXZlcnMvbWFp
bGJveC9tdGstY21kcS1tYWlsYm94LmMKPiBpbmRleCA3NTM3OGUzLi43ZjI0M2UxIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMKPiArKysgYi9kcml2ZXJz
L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jCj4gQEAgLTYwNyw2ICs2MDcsNyBAQCBzdGF0aWMg
aW50IGNtZHFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgIHsu
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZ2NlIiwgLmRhdGEgPSAodm9pZCAqKSZnY2Vf
cGxhdF92Mn0sCj4gICAgICAgICB7LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLWdjZSIs
IC5kYXRhID0gKHZvaWQgKikmZ2NlX3BsYXRfdjN9LAo+ICAgICAgICAgey5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10Njc3OS1nY2UiLCAuZGF0YSA9ICh2b2lkICopJmdjZV9wbGF0X3Y0fSwKPiAr
ICAgICAgIHsuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItZ2NlIiwgLmRhdGEgPSAodm9p
ZCAqKSZnY2VfcGxhdF92NH0sCgpJbiB0aGUgdmlldyBvZiBoYXJkd2FyZSBmdW5jdGlvbiwgaXMg
bXQ4MTkyLWdjZSBpZGVudGljYWwgdG8KbXQ2Nzc5LWdjZT8gSWYgdGhlc2UgdHdvIGFyZSBpZGVu
dGljYWwsIHlvdSBuZWVkIG5vdCB0byBtb2RpZnkgZHJpdmVyLAphbmQgdGhlIGNvbXBhdGlibGUg
c2hvdWxkIGJlCgpjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1nY2UiLCAibWVkaWF0ZWss
bXQ2Nzc5LWdjZSI7CgpJZiB0aGV5IGFyZSBub3QgaWRlbnRpY2FsLCB3aGF0J3MgdGhlIGRpZmZl
cmVudD8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICAgICAgICAge30KPiAgfTsKPgo+IC0tCj4g
MS44LjEuMS5kaXJ0eQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
