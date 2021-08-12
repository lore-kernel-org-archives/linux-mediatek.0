Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54CDC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 09:32:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FC0D60EB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 09:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FC0D60EB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpvPXBLFlnewh8IEGEN9eR9w0bxVfgkQahAyQadr4UI=; b=PvTBCilSTi4rnZ
	+1cuIQGdvhdEwbeLM16HQT2THD7aGyrfnCmkA5KXYU4kw+VL++RAo6TD9LXUEu6GTT9yqfUnI8Eir
	QEkiI6QbJ0NEyPA7KtrWap/mswaBcYqwTc0ajYi7JPRJm+LJ/qEJWzzAX80ENNGArxXL1O+1CDG36
	R9aJU7O6dJgmKjmOHBBmpYc6qiUudD15QWEuxifIyGLGbyHLN8aDzXIG9tKwik+fqVie+2xux3BO/
	fyJCcMhWa7bzJSscKdvEylWYmoQ+YwVeAg/LN8jxtVeasUrZFG+Mkn2W7VqPZ+laf7HYqnMrudSNX
	9gSmCjtWIN3M7ZeDSGGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE74G-009TB0-15; Thu, 12 Aug 2021 09:32:04 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE749-009T7J-UU
 for linux-mediatek@lists.infradead.org; Thu, 12 Aug 2021 09:32:01 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 hv22-20020a17090ae416b0290178c579e424so9768810pjb.3
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Aug 2021 02:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FVskKCl1yiOLa7tUE7ecSFjkdCcT3iQIU3DHdWUifrk=;
 b=N2TulBv/LnNVY4R0n44Ryimm1NeBT5sGkW7wDOan3PefdEv6z8dCkKmVHCwRyf8hUY
 w4D019j82RLvfDJtrxXZSYnRLvk4xMvipUw7KRs2m5VkLsNx4w7nSNL6tlFewsz8ZG1t
 FjDJA0HYtqqXOB9vEsv81ledxzP5JQKTlugrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FVskKCl1yiOLa7tUE7ecSFjkdCcT3iQIU3DHdWUifrk=;
 b=S4mJEh4UgEWXV7+1yJjXzuwWiZJRGjIxKPOdnzfjUo+4K9AJdatxHvdyAOdfL42czZ
 WyEBZ+cquU4JePAUHGiygbCm1MaBxwhyi/DAUNO2TNm3ntP7pZqZFcBJTSRB1yO0T4+e
 gUS0aYSoLAa0Ywx0eGQcnReCHaw+pydqZEnL/L5XikB5tuZdRN56296Kf4pyv2RvcIFb
 q7a2Ic8lSOhFKPgjU9DkYi7+K3mzOq3Pbfci+NrS6INX0epGIU4qzrjcyO3DVBdH3Uz5
 ZSLBjr/Ra4BeR4z79/2tvPrtlXaOyyfYjVMrOLIAvBFewpF8w3R2A8a1UsttefZFHpo+
 +RwQ==
X-Gm-Message-State: AOAM533+7UiviFR+JWO+Je30ujfCe/uglm6KYxdMdYll6bGo3vFfT44s
 fdpdkvhUDhvHzJ5bOIzJS7cC7WWGkXx2mX5K3R7Vqg==
X-Google-Smtp-Source: ABdhPJw9SD7zM/iPzd2ZyOctgSD64+UEsMwbfhKhVAvg3OelRUv1hIF9x3rMFpFUEWWBokQYqGnseHeQKWptCVgE4gk=
X-Received: by 2002:aa7:8d92:0:b029:3e0:8660:b9aa with SMTP id
 i18-20020aa78d920000b02903e08660b9aamr2266006pfr.55.1628760716086; Thu, 12
 Aug 2021 02:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210809165904.RFC.1.I5165a4a8da5cac23c9928b1ec3c3a1a7383b7c23@changeid>
 <YRDxTodNNqtnpPpn@kroah.com>
 <CAATdQgDSCzZtiDSQk94CYHfSb9Mq28OH7-RdaTZNv3oPrW3nkQ@mail.gmail.com>
 <7b48f4c132a8b4b3819282e961fbe8b3ed753069.camel@mediatek.com>
In-Reply-To: <7b48f4c132a8b4b3819282e961fbe8b3ed753069.camel@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Thu, 12 Aug 2021 17:31:45 +0800
Message-ID: <CAATdQgD1paUUmWhiLVq-+zq0V6=RTJw89ggk=R6cBUZO+5dB-Q@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: xhci-mtk: handle bandwidth table rollover
To: =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
 "mathias.nyman@intel.com" <mathias.nyman@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_023158_038447_266D765E 
X-CRM114-Status: GOOD (  30.28  )
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

SEksCgpPbiBXZWQsIEF1ZyAxMSwgMjAyMSBhdCA1OjAyIFBNIENodW5mZW5nIFl1biAo5LqR5pil
5bOwKQo8Q2h1bmZlbmcuWXVuQG1lZGlhdGVrLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIDIwMjEt
MDgtMDkgYXQgMTc6NDIgKzA4MDAsIElram9vbiBKYW5nIHdyb3RlOgo+ID4gT24gTW9uLCBBdWcg
OSwgMjAyMSBhdCA1OjExIFBNIEdyZWcgS3JvYWgtSGFydG1hbgo+ID4gPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gTW9uLCBBdWcgMDksIDIwMjEgYXQg
MDQ6NTk6MjlQTSArMDgwMCwgSWtqb29uIEphbmcgd3JvdGU6Cj4gPiA+ID4geGhjaS1tdGsgaGFz
IDY0IHNsb3RzIGZvciBwZXJpb2RpYyBiYW5kd2lkdGggY2FsY3VsYXRpb25zIGFuZAo+ID4gPiA+
IGVhY2gKPiA+ID4gPiBzbG90IHJlcHJlc2VudHMgYnl0ZSBidWRnZXRzIG9uIGEgbWljcm9mcmFt
ZS4gV2hlbiBhbiBlbmRwb2ludCdzCj4gPiA+ID4gYWxsb2NhdGlvbiBzaXRzIG9uIHRoZSBib3Vu
ZGFyeSBvZiB0aGUgdGFibGUsIGJ5dGUgYnVkZ2V0cycgc2xvdAo+ID4gPiA+IHNob3VsZCBiZSBy
b2xsZWQgb3ZlciBidXQgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZG9lc24ndC4KPiA+ID4g
Pgo+ID4gPiA+IFRoaXMgcGF0Y2ggYXBwbGllcyBhIDYgYml0cyBtYXNrIHRvIHRoZSBtaWNyb2Zy
YW1lIGluZGV4IHRvCj4gPiA+ID4gaGFuZGxlCj4gPiA+ID4gaXRzIHJvbGxvdmVyIDY0IHNsb3Rz
IGFuZCBwcmV2ZW50IG91dC1vZi1ib3VuZHMgYXJyYXkgYWNjZXNzLgo+ID4gPiA+Cj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogSWtqb29uIEphbmcgPGlram5AY2hyb21pdW0ub3JnPgo+ID4gPiA+IC0t
LQo+ID4gPiA+Cj4gPiA+ID4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1tdGstc2NoLmMgfCA3OSAr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gLS0tLS0tLS0KPiA+ID4gPiAgZHJpdmVy
cy91c2IvaG9zdC94aGNpLW10ay5oICAgICB8ICAxICsKPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyMyBpbnNlcnRpb25zKCspLCA1NyBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gV2h5IGlzIHRo
aXMgIlJGQyI/ICBXaGF0IG5lZWRzIHRvIGJlIGFkZHJlc3NlZCBpbiB0aGlzIGNoYW5nZQo+ID4g
PiBiZWZvcmUgaXQKPiA+ID4gY2FuIGJlIGFjY2VwdGVkPwo+ID4KPiA+IHNvcnJ5LCBJIGhhZCB0
byBtZW50aW9uIHdoeSB0aGlzIGlzIFJGQzoKPiA+Cj4gPiBJIHNpbXBseSBkb24ndCBrbm93IGFi
b3V0IHRoZSBkZXRhaWxzIG9mIHRoZSB4aGNpLW10ayBpbnRlcm5hbHMuCj4gPiBJdCB3YXMgb2th
eSBmcm9tIG15IHRlc3RzIHdpdGggbXQ4MTczIGFuZCBJIHRoaW5rIHRoaXMgd2lsbCBiZQo+ID4g
aGFybWxlc3MKPiA+IGFzIHRoaXMgaXMgImJldHRlciB0aGFuIGJlZm9yZSIuCj4gPgo+ID4gQnV0
IHdoZW4gSSByZW1vdmVkIGdldF9lc2l0X2JvdW5kYXJ5KCksIEkgcmVhbGx5IGhhdmUgbm8gaWRl
YSB3aHkKPiA+IGl0IHdhcyB0aGVyZS4gSSdtIHdvbmRlcmluZyBpZiB0aGVyZSB3YXMgYW5vdGhl
ciByZWFzb24gb2YgdGhhdAo+ID4gZnVuY3Rpb24KPiA+IG90aGVyIHRoYW4ganVzdCBwcmV2ZW50
aW5nIG91dC1vZi1ib3VuZHMuIE1heWJlIGNodW5mZW5nIGNhbiBhbnN3ZXIKPiA+IHRoaXM/Cj4g
V2UgdXNlIEBlc2l0IHRvIHByZXZlbnQgb3V0LW9mLWJvdW5kcyBhcnJheSBhY2Nlc3MuIGl0J3Mg
bm90IGEgcmluZywKPiBjYW4ndCBpbnNlcnQgb3V0LW9mLWJvdW5kcyB2YWx1ZSBpbnRvIGhlYWQg
c2xvdC4KClRoYW5rcywgc28gdGhhdCBmdW5jdGlvbiB3YXMgb25seSBmb3Igb3V0LW9mLWJvdW5k
cyBhcnJheSBhY2Nlc3MuCnRoZW4gSSB0aGluayB3ZSBqdXN0IGNhbiByZW1vdmUgdGhhdCBmdW5j
dGlvbiBhbmQgdXNlIGl0IGFzIGEgcmluZy4KQ2FuIHlvdSB0ZWxsIG1lIF93aHlfIGl0IGNhbid0
IGJlIHVzZWQgYXMgYSByaW5nPwoKSSB0aGluayBhIHRyYW5zYWN0aW9uIChlLmcuIGVzaXRfYm91
bmRhcnkgPSA3KSBjYW4gc3RhcnQgaXRzIGZpcnN0IFNTUExJVApmcm9tIFlfNyAob2Zmc2V0ID0g
NykuIEJ1dCB3aWxsIHRoYXQgYWxsb2NhdGlvbiBiZSBtYXRjaGVkIHdpdGggdGhpcz8KCi0gICAg
ICAgICAgICAgICBpZiAoKG9mZnNldCArIHNjaF9lcC0+bnVtX2J1ZGdldF9taWNyb2ZyYW1lcykg
PiBlc2l0X2JvdW5kYXJ5KQotICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKCkkgbWVhbiBJ
J20gbm90IHN1cmUgd2h5IHRoaXMgaXMgbmVlZGVkLgoKVW50aWwgbm93LCBJIGNvdWxkbid0IGZp
bmQgYSB3YXkgdG8gYWNjZXB0IHRoZSBVU0IgYXVkaW8gaGVhZHNldAp3aXRoIGEgY29uZmlndXJh
dGlvbiBvZiB7IElOVC1JTiA2NCArIElTT0MtT1VUIDM4NCArIElTT0MtSU4gMTkyIH0Kd2l0aG91
dCB0aGlzIHBhdGNoLgoKPgo+ID4KPiA+IFRoYW5rcyEKPiA+Cj4gPiA+Cj4gPiA+IHRoYW5rcywK
PiA+ID4KPiA+ID4gZ3JlZyBrLWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
