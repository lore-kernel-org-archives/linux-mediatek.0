Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918DDC4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 21:47:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1470722244
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 21:47:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YJrkX+U2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gs/w6JM7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1470722244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sUJ0Jt3OBJYjc0UDZOw29ApGSOx64F0+1igK8o+NhpI=; b=YJrkX+U2H2EEv3BgOi8x8+nPt
	EFaXwDBB2H92Lup/7NtLowHkGw/s2EDn8iYKF8wg3Wlxo+m6W6NiMuJGRCejWf9tZdPSK4DeqA8rY
	Sxu1D6laczoNjouIZFzdPjW/6F5wsWLsjxSjQFODVXng1FnywGITV8xE79fJlrwGHv6L4WZPWMvJp
	K99f1pFhL82wKQhcI2w1/I9wOaSJaOsHCZoYeCPP8NkEnkuk3Xmcy2earyc7zOjrYr3EEb23uhUA+
	E5g73ONYL4MTE6J7PoiuwFjNEFmobtsKEbjw6saVnOT3Y6r3GV2x8Ni1r5+c16106D8WAUHdQWiOC
	jLAzSIvdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUzTF-0003lE-HR; Tue, 20 Oct 2020 21:47:05 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUzTD-0003jj-H3; Tue, 20 Oct 2020 21:47:04 +0000
Received: by mail-ej1-x641.google.com with SMTP id md26so4961605ejb.10;
 Tue, 20 Oct 2020 14:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fT5KwI1u6PV8EmjtyHpKqwjn8VqaBxGqgtD+UYm6G/w=;
 b=Gs/w6JM7zA6yL1ixdYo1xR++QcsTBl9aPPPmTi4LPCXqtcDSCsqlk25SUycBw5BAPq
 lshXIwVAyQmQeHnMmNOE4CAcNnWfUuah3dultc6A7qA546Dis3N/2bSsJ3iLNk7GG4PQ
 Kq93Z/YksnxpG+6FLS5CU3NfXpn/ogqMrYxkiDrpJoyPi6BmQCECe9wVFBdwoAbl0SMa
 01zrWTokETo5D6DzICgTxTe3pr7X1PmIFDgQxYUV5/PPk3grP87lbA5a7CRpYguw72Hs
 7Aa9lBvIOaZszZoF6bNXzNag+O+25IzLyZForF8uJ8pyrOXwU9gurtOPWxZzXXtcAwQ/
 pe1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fT5KwI1u6PV8EmjtyHpKqwjn8VqaBxGqgtD+UYm6G/w=;
 b=dNgPH+4h092H1k6BXAKyRri9fOKDn4YEnYNgQ1I/Fb8pnhFnN3L9/1KEYUTH5j9ILe
 BP+qvMDlcHCBVyi6NIgpLsDK9XEAgSgwZIlpNaSSjZ3PucEsqJ53NuIvkLGBBrvvUQJV
 TGLG97+AyWtv8NDtwHJ428Xywoa3uF3SJw1kko7WY7SIAtEJbEh/FOqkUJhADTUAtHqI
 Vxot3Xe364PEksICUHPGT/qCMZt+NGdgcMVV7vl0bT+6HHi66BR/K3mRqtv2XB43BzQ5
 hbWSBJVCaEB8c+XHXm/HaELjfM8TSk/OXA9VnWB6zD6JC+SHLi9dfMFvQIWA2VBLD7dh
 PAyg==
X-Gm-Message-State: AOAM531jXnHM2trLFdcpIEnx+Mzl1K18y3L/eWsUawKHf3XTjfSN9Hbv
 TaieERKkCbVj9hAsodQaCoE=
X-Google-Smtp-Source: ABdhPJzR95k+qiXGnZue7DquJHpX6z+X0kmVYYGtiPcjz51ZgZ/tz2/zilEua/Slair4hem1PZTnaA==
X-Received: by 2002:a17:906:1e95:: with SMTP id
 e21mr190796ejj.355.1603230420970; 
 Tue, 20 Oct 2020 14:47:00 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:7dff:cc5e:4622:485f?
 ([2a01:110f:b59:fd00:7dff:cc5e:4622:485f])
 by smtp.gmail.com with ESMTPSA id p2sm107051ejd.34.2020.10.20.14.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 14:47:00 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com>
 <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com>
 <CAE+NS35Y41mFKNhj+54BeeSYFu2J9BtvMWOxyMcf9a==39cbdA@mail.gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <8925db23-5cc4-3c5f-932a-461fe6450dad@gmail.com>
Date: Tue, 20 Oct 2020 23:46:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAE+NS35Y41mFKNhj+54BeeSYFu2J9BtvMWOxyMcf9a==39cbdA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_174703_564288_B288CED7 
X-CRM114-Status: GOOD (  20.20  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, shufan_lee@richtek.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMTAvMjAvMjAgODo0NCBBTSwgR2VuZSBDaGVuIHdyb3RlOgo+IEphY2VrIEFuYXN6ZXdza2kg
PGphY2VrLmFuYXN6ZXdza2lAZ21haWwuY29tPiDmlrwgMjAyMOW5tDEw5pyIOeaXpSDpgLHkupQg
5LiK5Y2INTo1MeWvq+mBk++8mgo+Pgo+PiBIaSBHZW5lLAo+Pgo+PiBPbiAxMC83LzIwIDM6NDIg
QU0sIEdlbmUgQ2hlbiB3cm90ZToKPj4+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0
ZWsuY29tPgo+Pj4KPj4+IEFkZCBNVDYzNjAgTEVEIGRyaXZlciBpbmNsdWRlIDItY2hhbm5lbCBG
bGFzaCBMRUQgd2l0aCB0b3JjaC9zdHJvYmUgbW9kZSwKPj4+IDMtY2hhbm5lbCBSR0IgTEVEIHN1
cHBvcnQgUmVnaXN0ZXIvRmxhc2gvQnJlYXRoIE1vZGUsIGFuZCAxLWNoYW5uZWwgZm9yCj4+PiBt
b29ubGlnaHQgTEVELgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVu
QHJpY2h0ZWsuY29tPgo+Pj4gLS0tCj4+PiAgICBkcml2ZXJzL2xlZHMvS2NvbmZpZyAgICAgICB8
ICAxMiArCj4+PiAgICBkcml2ZXJzL2xlZHMvTWFrZWZpbGUgICAgICB8ICAgMSArCj4+PiAgICBk
cml2ZXJzL2xlZHMvbGVkcy1tdDYzNjAuYyB8IDc4MyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwgNzk2IGluc2VydGlv
bnMoKykKPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2xlZHMvbGVkcy1tdDYzNjAu
Ywo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvS2NvbmZpZyBiL2RyaXZlcnMvbGVk
cy9LY29uZmlnCj4+PiBpbmRleCAxYzE4MWRmLi5jNzE5MmRkIDEwMDY0NAo+Pj4gLS0tIGEvZHJp
dmVycy9sZWRzL0tjb25maWcKPj4+ICsrKyBiL2RyaXZlcnMvbGVkcy9LY29uZmlnCj4+PiBAQCAt
MjcxLDYgKzI3MSwxOCBAQCBjb25maWcgTEVEU19NVDYzMjMKPj4+ICAgICAgICAgIFRoaXMgb3B0
aW9uIGVuYWJsZXMgc3VwcG9ydCBmb3Igb24tY2hpcCBMRUQgZHJpdmVycyBmb3VuZCBvbgo+Pj4g
ICAgICAgICAgTWVkaWF0ZWsgTVQ2MzIzIFBNSUMuCj4+Pgo+Pj4gK2NvbmZpZyBMRURTX01UNjM2
MAo+Pj4gKyAgICAgdHJpc3RhdGUgIkxFRCBTdXBwb3J0IGZvciBNZWRpYXRlayBNVDYzNjAgUE1J
QyIKPj4+ICsgICAgIGRlcGVuZHMgb24gTEVEU19DTEFTU19GTEFTSCAmJiBPRgo+Pj4gKyAgICAg
ZGVwZW5kcyBvbiBMRURTX0NMQVNTX01VTFRJQ09MT1IKPj4KPj4gU2luY2UgQ09ORklHX0xFRF9D
TEFTU19NVUxUSUNPTE9SIGNhbiBiZSB0dXJuZWQgb2ZmIHlvdSBuZWVkIHRvIGhhdmUKPj4gYmVs
b3cgaW5zdGVhZDoKPj4KPj4gZGVwZW5kcyBvbiBMRURTX0NMQVNTX01VTFRJQ09MT1IgfHwgISFM
RURTX0NMQVNTX01VTFRJQ09MT1IKPj4KPj4gVW5sZXNzIHlvdSB3YW50IHRvIHByZXZlbnQgZW5h
YmxpbmcgdGhlIGRyaXZlciB3aXRob3V0IFJHQiBMRUQsCj4+IGJ1dCB0aGF0IGRvZXMgbm90IHNl
ZW0gdG8gYmUgcmVhc29uYWJsZSBhdCBmaXJzdCBnbGFuY2UuCj4+Cj4gCj4gTWF5IEkgY2hhbmdl
IHRvICJzZWxlY3QgTEVEU19DTEFTU19NVUxUSUNPTE9SIj8KPiBJIHN1cHBvc2UgUkdCIGFsd2F5
cyB1c2UgbXVsdGljb2xvciBtb2RlLgoKWW91IHdpbGwgYWxzbyBoYXZlIG1vb25saWdodCBMRUQg
dGhhdCB3aWxsIG5vdCBuZWVkIG11bHRpY29sb3IKZnJhbWV3b3JrLiBJcyBpdCBzb21laG93IHRy
b3VibGVzb21lIHRvIGtlZXAgImRlcGVuZHMgb24iPwoKLS0gCkJlc3QgcmVnYXJkcywKSmFjZWsg
QW5hc3pld3NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
