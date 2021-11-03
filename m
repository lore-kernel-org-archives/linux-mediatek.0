Return-Path: <SRS0=yT6o=PW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CA2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 15:24:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4070561076
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 15:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4070561076
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67TlCzxwcQt/VOKCISU8GPrvd/xt6oi2yaPTkniB9ZE=; b=RMMSeoDtp0nq5M
	q5qeMVMyH+sMUSFs3w8Da9rIIvonuoS5yfHrUbBUhNJXecNIiZYIcqPHDPP4hBmA6FMe1FQ7LA1cf
	qlUd1pM4XsFGa1eAKPqROr3MCSDks/cMOm7ToLsboGCqpHXVPSDkZ0BtXWzwyyEwyzKaw2oaWor5o
	LD9N4c3Gnw0qissam3+HTbQZdTdxrZG7LuB+CZJxa+q7jh+hydqXexSmAWT4UdLz11UJmX/QXp62C
	yU8qRNWjaxgpd3C++eOkVzhG9nbzvckpyYitPQxPF1+whUcVqwYXocQH2PKJ1GZ2YbopD4QwtkiWM
	grDryyZZqKpcPN+/D6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miI7I-005a0y-JV; Wed, 03 Nov 2021 15:23:56 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miI75-005Zyd-Jk
 for linux-mediatek@lists.infradead.org; Wed, 03 Nov 2021 15:23:44 +0000
Received: by mail-qk1-x72c.google.com with SMTP id bk22so2631878qkb.6
 for <linux-mediatek@lists.infradead.org>; Wed, 03 Nov 2021 08:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=yNC62w+2HzH2SSJhKHtvCjiHcp3DcKu13in8YXC3L58=;
 b=M+/I/5Hft2NlUO4i9S63IGXtD51pzlQDc0ULTbi6L/ghNtnKUooxVNq/SoYMwi/zvp
 3ahh0cL98Kl38mypdfi39VAQKnvM/O3y38/UAns84MaTzcyyJ+7s6fg16KXNdcyRBZdT
 FwODxzltEwj1ZghagD2B9aw/e/BwPbzu9QAVS5hZ0zT4PepwV/BfoXga0U50Xa5fQyN4
 2hBub2Hq19bZtgvlv6/vmGGs+wyeckvmviP0QMeRRaep6xcFXm1e+zgC9ZiHl4l4Rc94
 bNvoyhpmW60gS7MVRSnt79hvX7pZnMn8yVimbCbRD8Gq1xatvxtdtWw8ZjwfynRbIXCP
 rhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=yNC62w+2HzH2SSJhKHtvCjiHcp3DcKu13in8YXC3L58=;
 b=bJ7TECl1ttxOmsojXGVlKZrViPu6u5OFT22sDqwsKqENco2T491QPHl8oPErKDyxdj
 m6SPgbQvNSUV0QEqEn0JuHFpXh0Y4LpZCKyC4bx+W/+vFtyoDIU9D1wiWahIJ26FWdcG
 8flsAl02Crg+QIe1qHNuYoqzclcAc57wBtbCk4RXULhY5PuCt+SzyE1OZWa0/GdQNUCb
 rIh2u9uiL3LHQQHJOwBJpFgfrX1I147TbIQwb0VYMEjJ0UxWBNLjtQ7iakQjMf5w7bZc
 fwGHIMjoACbVKk1NGsZrMx8OQsAXOvOQmXg14Wou3wwepCKPYy6IquH5cZzX0h8nNvQC
 5E8g==
X-Gm-Message-State: AOAM5307WS+EAwQJ52d7rSeoVzynpSJyFtXC71s0aK466v8CyBWOsUtb
 E4Y1UziXDIt+uUcyk/rBapeUjA==
X-Google-Smtp-Source: ABdhPJy4df7FJ5jzZA9CX3XJtZc5nqiiuNWg/WwEWiY+wux4cxWLrQ/cnNXjtkeLmUJr9/v8V9RPUQ==
X-Received: by 2002:a05:620a:2f4:: with SMTP id
 a20mr12095070qko.123.1635953020908; 
 Wed, 03 Nov 2021 08:23:40 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
 by smtp.gmail.com with ESMTPSA id
 m20sm1736604qkp.57.2021.11.03.08.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:23:40 -0700 (PDT)
Message-ID: <b398917ca0c467d83c795f02f751609a52d56edb.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: mtk-vcodec: Align width and height to 64 bytes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Steve Cho <stevecho@google.com>,
 Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>,  Tiffany
 Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>,  Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Wed, 03 Nov 2021 11:23:38 -0400
In-Reply-To: <20211103033708.14469-1-yunfei.dong@mediatek.com>
References: <20211103033708.14469-1-yunfei.dong@mediatek.com>
User-Agent: Evolution 3.42.0 (3.42.0-1.fc35) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_082343_686797_F386BEA3 
X-CRM114-Status: GOOD (  18.00  )
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

TGUgbWVyY3JlZGkgMDMgbm92ZW1icmUgMjAyMSDDoCAxMTozNyArMDgwMCwgWXVuZmVpIERvbmcg
YSDDqWNyaXTCoDoKPiBXaWR0aCBhbmQgaGVpZ2h0IG5lZWQgdG8gNjQgYnl0ZXMgYWxpZ25lZCB3
aGVuIHNldHRpbmcgdGhlIGZvcm1hdC4KPiBOZWVkIHRvIG1ha2Ugc3VyZSBhbGwgaXMgNjQgYnl0
ZXMgYWxpZ24gd2hlbiB1c2Ugd2lkdGggYW5kIGhlaWdodCB0bwo+IGNhbGN1bGF0ZSBidWZmZXIg
c2l6ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZdW5mZWkgRG9uZyA8eXVuZmVpLmRvbmdAbWVkaWF0
ZWsuY29tPgo+IENoYW5nZS1JZDogSTM5ODg2YjFhNmI0MzNjOTI1NjVkZGJmMjk3ZWIxOTM0NTZl
ZWMxZDIKClBlcmhhcHMgYXZvaWQgdGhpcyB0YWcgbGF0ZXIgPyBBbm90aGVyIHBlcmhhcHMsIHRo
ZXJlIGlzIGEgdGFnIHRvIGluZGljYXRlIHdoaWNoCnBhdGNoIGludHJvZHVjZSB0aGF0IGJ1Zywg
aWYgeW91IGFkZCB0aGlzIHRhZywgdGhlIHBhdGNoIHdpbGwgYmUgYXV0b21hdGljYWxseQpiYWNr
cG9ydGVkIGludG8gcmVsZXZhbnQgc3RhYmxlIGtlcm5lbC4gVGhlIGZvcm1hdCBpczoKCj4gRml4
ZXM6IDxzaG9ydC1oYXNoPiAoIjxzaG9ydCBjb21taXQgZGVzY3JpcHRpb24iKQoKQWNrZWQtYnk6
IE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4KCj4gLS0t
Cj4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlYy5oICAg
ICAgICB8IDEgKwo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmRlYy92ZGVj
X2gyNjRfcmVxX2lmLmMgfCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlYy5oIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstdmNvZGVjL210a192Y29kZWNfZGVjLmgKPiBpbmRleCBlMzA4MDZjMWZhZWEuLjY2Y2Q2ZDIy
NDJjMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRr
X3Zjb2RlY19kZWMuaAo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9t
dGtfdmNvZGVjX2RlYy5oCj4gQEAgLTExLDYgKzExLDcgQEAKPiAgI2luY2x1ZGUgPG1lZGlhL3Zp
ZGVvYnVmMi1jb3JlLmg+Cj4gICNpbmNsdWRlIDxtZWRpYS92NGwyLW1lbTJtZW0uaD4KPiAgCj4g
KyNkZWZpbmUgVkNPREVDX0RFQ19BTElHTkVEXzY0IDY0Cj4gICNkZWZpbmUgVkNPREVDX0NBUEFC
SUxJVFlfNEtfRElTQUJMRUQJMHgxMAo+ICAjZGVmaW5lIFZDT0RFQ19ERUNfNEtfQ09ERURfV0lE
VEgJNDA5NlUKPiAgI2RlZmluZSBWQ09ERUNfREVDXzRLX0NPREVEX0hFSUdIVAkyMzA0VQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmRlYy92ZGVjX2gy
NjRfcmVxX2lmLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmRlYy92ZGVj
X2gyNjRfcmVxX2lmLmMKPiBpbmRleCBkNDAyZmM0YmRhNjkuLmUxYTMwMTE3NzJhOSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmRlYy92ZGVjX2gyNjRf
cmVxX2lmLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmRlYy92
ZGVjX2gyNjRfcmVxX2lmLmMKPiBAQCAtNTYyLDggKzU2Miw4IEBAIHN0YXRpYyB2b2lkIGdldF9w
aWNfaW5mbyhzdHJ1Y3QgdmRlY19oMjY0X3NsaWNlX2luc3QgKmluc3QsCj4gIHsKPiAgCXN0cnVj
dCBtdGtfdmNvZGVjX2N0eCAqY3R4ID0gaW5zdC0+Y3R4Owo+ICAKPiAtCWN0eC0+cGljaW5mby5i
dWZfdyA9IChjdHgtPnBpY2luZm8ucGljX3cgKyAxNSkgJiAweEZGRkZGRkYwOwo+IC0JY3R4LT5w
aWNpbmZvLmJ1Zl9oID0gKGN0eC0+cGljaW5mby5waWNfaCArIDMxKSAmIDB4RkZGRkZGRTA7Cj4g
KwljdHgtPnBpY2luZm8uYnVmX3cgPSBBTElHTihjdHgtPnBpY2luZm8ucGljX3csIFZDT0RFQ19E
RUNfQUxJR05FRF82NCk7Cj4gKwljdHgtPnBpY2luZm8uYnVmX2ggPSBBTElHTihjdHgtPnBpY2lu
Zm8ucGljX2gsIFZDT0RFQ19ERUNfQUxJR05FRF82NCk7Cj4gIAljdHgtPnBpY2luZm8uZmJfc3pb
MF0gPSBjdHgtPnBpY2luZm8uYnVmX3cgKiBjdHgtPnBpY2luZm8uYnVmX2g7Cj4gIAljdHgtPnBp
Y2luZm8uZmJfc3pbMV0gPSBjdHgtPnBpY2luZm8uZmJfc3pbMF0gPj4gMTsKPiAgCWluc3QtPnZz
aV9jdHguZGVjLmNhcF9udW1fcGxhbmVzID0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
