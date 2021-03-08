Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE9FC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 13:06:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91B596512C
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 13:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91B596512C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oKo5tDSSEHzy6x273jL0257mX7/RjKGZ6L3FhU4u2RE=; b=aYwA8rC2R1pI8bWUu1ePQooGo
	ppe6xs/kp/4ReEPnfqpc6t0+p6oeH6qgOfDNmqhaNDCewDjOBtljfEaUh0MUFC4CvXB3NkAVhhNM+
	0cA8N8OwaGq6EvIKa3xlS7GX7moa1KrNud6PjtqszeFCM4ndrQ86mYRl6bjtIuGnE3+pd5Tbxl44C
	eLvCo9WQ7g6vwZ8pkMNbAUQ/BKRZEM+F/OZAWgCppZ7DJzLPHUJyatsQ/1XfTZ2uwbgRyR36avcfz
	czKT/vOPOe/IG8OvwUDHo20TKl5NW7en8InCABkUPzwlWOC0UIZvbEBZru0+as4/JhxSCEscXwHXS
	Xo3xByZkA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJFao-00HKf0-Nc; Mon, 08 Mar 2021 13:06:38 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJFaa-00HKXd-1H
 for linux-mediatek@lists.infradead.org; Mon, 08 Mar 2021 13:06:27 +0000
Received: by mail-qk1-x735.google.com with SMTP id z190so9039825qka.9
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Mar 2021 05:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3JrrXwWADSgvZgB68bLvoI/RkxNlWv5mnUS3xpDfwl4=;
 b=Gb85a/xfbYipZ66rmq5YfwkxhoHqFWepT63E+GvRuUqHGBP9QKT/JwHd9xTvZk67V0
 TB+K0xafNKXaLpozFHhRHJ24wQseaEvt5p60ZgxhAagERKJabXNopDKh0PXCMsO37TIC
 m2JuRFKF+xvuV/KF1HZBxa6517JTOO5R9xl7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3JrrXwWADSgvZgB68bLvoI/RkxNlWv5mnUS3xpDfwl4=;
 b=Rlqqc2+7WlGUdeMoD5vvSEVAaBaGh/KYjt+ZH+gnDlXr/8GHwRQkYxI8vGWffKpGg4
 XOTbfpXz3z7W7+BAYEfQ4RJ06/AX5xYLsiU6D7KXEgAmCc4HKUvbrcCCgaCB0pQK79+r
 jzFb+wbEBHZ1A2H3CPXXjwusobD/uDUV78d3yaQTkDgp8Q2FtrW0+W7BRWt8j2qFjBY6
 HxFVjCa1VTAAl2Xp8pA/4jdP0cxU6DraQHa9o93B+ti+8nNLYRD5yU+RmxPrJ1wObh9U
 kLWFKX1nR6B030ojImtupaFuzkJNhGVl8ZGmHxmNbfP4VVIYJAtVTl4jWW+wvZD/r8y1
 3Xng==
X-Gm-Message-State: AOAM533U9lue9niBpTuGP/jDA+FtYgRW/COXOHTIqRQNK0QRvQaTj9K2
 2v55lUwfPKY+Gs/MTEXvvkK1hpUnYvxZbFegpk67Tw==
X-Google-Smtp-Source: ABdhPJz1u6cjSQ5e7n4Is4pIA/0ot62WSzGvhjIAL0Y7umbZvEOpHs1XdA1hQNrNmLBC0ZnuULrizRg6UlL8RU4rCys=
X-Received: by 2002:a05:620a:228:: with SMTP id
 u8mr20259137qkm.443.1615208780474; 
 Mon, 08 Mar 2021 05:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20210305120930.14297-1-mark-pk.tsai@mediatek.com>
 <CAFr9PXmDp7UwWnT+49Yciy-gvYiQOd3cus0W_QnGKm-LqziHCg@mail.gmail.com>
 <875z24rvaz.wl-maz@kernel.org>
 <30c45ccea273461ca9552cef01b75de2@mtkmbs05n2.mediatek.inc>
In-Reply-To: <30c45ccea273461ca9552cef01b75de2@mtkmbs05n2.mediatek.inc>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 8 Mar 2021 22:06:05 +0900
Message-ID: <CAFr9PXkK+L0kpEfJsQMVa0R9P3jMDJFHQKCR8jaCuL=Um6G=gQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/irq-mst: Support polarity configuration
To: =?UTF-8?B?TWFyay1QSyBUc2FpICjolKHmspvliZsp?= <Mark-PK.Tsai@mediatek.com>
Cc: Marc Zyngier <maz@kernel.org>, Daniel Palmer <daniel@thingy.jp>, 
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 =?UTF-8?B?WUogQ2hpYW5nICjmsZ/oi7HmnbAp?= <yj.chiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_130624_654230_6EA3E294 
X-CRM114-Status: GOOD (  28.35  )
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

SGkgTWFyay1QSywKCk9uIE1vbiwgOCBNYXIgMjAyMSBhdCAxMTo0MiwgTWFyay1QSyBUc2FpICjo
lKHmspvliZspCjxNYXJrLVBLLlRzYWlAbWVkaWF0ZWsuY29tPiB3cm90ZToKPiA+IEl0IHNlZW1z
IGxpa2UgdGhlIHBvbGFyaXR5IG9mIGludGVycnVwdHMgaXMgYWx3YXlzIHRoZSBzYW1lIGJldHdl
ZW4gdGhlIE1TdGFyIGludGMgYW5kIHRoZSBHSUM/IExvdyBsZXZlbCBpbnRlcnJ1cHRzIGFyZSBo
YW5kbGVkIGluIHRoZSBtc3RhciBpbnRjIGFuZCBiZWNvbWUgaGlnaCBsZXZlbCBpbnRlcnJ1cHRz
IHRvIHRoZSBHSUM/Cj4gPiBJIHRoaW5rIGZvciB0aGUgTXN0YXIgTVNDMzEzKGUpIGFuZCBTaWdt
YVN0YXIgY2hpcHMgYWxsIG9mIHRoZSBpbnRlcm5hbCBpbnRlcnJ1cHRzIGFyZSBoaWdoIGxldmVs
IHNvIEkgbmV2ZXIgbm90aWNlZCB0aGlzIGJlaGF2aW91ci4KPiA+IEkgY2FuJ3QgcmVtZW1iZXIg
c2VlaW5nIGFueXRoaW5nIHRoYXQgaGFuZGxlZCB0aGlzIGluIHRoZSBNU3RhciBrZXJuZWwgY29k
ZSBJIGxvb2tlZCBhdC4KPiA+IElzIHRoaXMgc3BlY2lmaWMgdG8gYSBjZXJ0YWluIGNoaXAgb3Ig
ZG9lcyBpdCBhcHBseSBmb3IgZXZlcnl0aGluZyB3aXRoIHRoaXMgaW50Yz8KPgo+IEkgc3VwcG9z
ZSBNc3RhciBTb0NzIGFsc28gbmVlZCB0aGlzIHBhdGNoIHdoaWNoIGRlcGVuZHMgb24gd2hhdCBr
aW5kIG9mIGludGVycnVwdCBzb3VyY2UgdGhlIEhXIGRlc2lnbmVyIHdpcmUgdG8gdGhpcyBpbnRj
Lgo+IElmIGFuIGludGVycnVwdCBzb3VyY2UgaXMgYWN0aXZlIGxvdywgd2UgbmVlZCB0byBzZXQg
dGhlIGNvcnJlc3BvbmRpbmcgYml0IHRvIHJldmVyc2UgdGhlIHBvbGFyaXR5IHRvIG1lZXQgR0lD
IFNQSSByZXF1aXJlbWVudCBhcyBNYXJjIG1lbnRpb25lZC4KClRoYXQgbWFrZXMgc2Vuc2UuIExv
b2tpbmcgYmFjayBhdCB0aGUgb3JpZ2luYWwgTVN0YXIgZHJpdmVyIGFnYWluIHRoZXkKZGlkIGhh
bmRsZSByZXZlcnNpbmcgdGhlIHBvbGFyaXR5IGJ1dCB0aGV5IHBhc3NlZCB0aGUgb3JpZ2luYWwK
cG9sYXJpdHkgdGhyb3VnaCB0byB0aGUgR0lDIHRvby4KU28gbWF5YmUgaXQgbmV2ZXIgd29ya2Vk
IHByb3Blcmx5LiA6KQoKSSB0aGluayBJIGNhbiB0ZXN0IHRoaXMgd2l0aCBHUElPcyB0aGF0IGFy
ZSB3aXJlZCBpbnRvIHRoZSBtc3RhciBpbnRjCm9uIHRoZSBNU3Rhci9TaWdtYVN0YXIgY2hpcHMu
IEknbGwgZ2V0IGJhY2sgdG8geW91IHdpdGggaG93IHRoYXQgd29ya3MKb3V0LgoKVGhhbmtzLAoK
RGFuaWVsCgoKCj4KPiA+IFRoZSByZWdpc3RlciB2YWx1ZXMgYmVpbmcgbG9zdCBpZiB0aGUgY2hp
cCBnb2VzIGludG8gc3VzcGVuZCB0byBtZW1vcnkgbWFrZXMgc2Vuc2UgZm9yIHRoZSBNU3RhciBj
aGlwcyB0b28gSSB0aGluayBhcyBldmVyeXRoaW5nIHRoYXQgaXMgbm90IGluIHRoZSAicG1zbGVl
cCIgcmVnaXN0ZXIgZ3JvdXAgc2VlbXMgdG8gYmUgbG9zdC4KPgo+IFRoZXJlIGFyZSBtYXNrIGFu
ZCBlb2kgYml0cyBJIGRpZCBub3QgaGFuZGxlIGhlcmUuCj4gVGhhdCdzIGJlY2F1c2Uga2VybmVs
IHdpbGwgaGFuZGxlIHRoZSBtYXNrIGFuZCBlb2kgc3RhdHVzIHdoZW4gc3lzdGVtIGdvaW5nIHRv
IHN1c3BlbmQvcmVzdW1lIGluIHN1c3BlbmRfZGV2aWNlX2lycXMvIHJlc3VtZV9kZXZpY2VfaXJx
cy4KPiBBbmQgYWxsIHRoZSBpcnFzIG9mIE1zdGFyIGludGMgYXJlIG1hc2tlZCBieSBkZWZhdWx0
IHdoZW4gdGhlIElQIHBvd2VyZWQgb24uCj4KPgo+IEJlc3QgcmVnYXJkcywKPiBNYXJrLVBLIFRz
YWkKPgo+Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBNYXJjIFp5bmdpZXIg
W21haWx0bzptYXpAa2VybmVsLm9yZ10KPiBTZW50OiBTdW5kYXksIE1hcmNoIDcsIDIwMjEgMjoy
OCBBTQo+IFRvOiBEYW5pZWwgUGFsbWVyIDxkYW5pZWxAMHgwZi5jb20+Cj4gQ2M6IE1hcmstUEsg
VHNhaSAo6JSh5rKb5YmbKSA8TWFyay1QSy5Uc2FpQG1lZGlhdGVrLmNvbT47IERhbmllbCBQYWxt
ZXIgPGRhbmllbEB0aGluZ3kuanA+OyBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5k
ZT47IEphc29uIENvb3BlciA8amFzb25AbGFrZWRhZW1vbi5uZXQ+OyBNYXR0aGlhcyBCcnVnZ2Vy
IDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPjsgTGludXggS2VybmVsIE1haWxpbmcgTGlzdCA8bGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IGxpbnV4LWFybS1rZXJuZWwgPGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IFlKIENoaWFuZyAo5rGf6Iux5p2wKSA8eWouY2hpYW5nQG1lZGlhdGVrLmNvbT4KPiBT
dWJqZWN0OiBSZTogW1BBVENIXSBpcnFjaGlwL2lycS1tc3Q6IFN1cHBvcnQgcG9sYXJpdHkgY29u
ZmlndXJhdGlvbgo+Cj4gT24gU2F0LCAwNiBNYXIgMjAyMSAxNzowNjo1MSArMDAwMCwKPiBEYW5p
ZWwgUGFsbWVyIDxkYW5pZWxAMHgwZi5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIE1hcmstUEssCj4g
Pgo+ID4gSSdtIHRyeWluZyB0byB1bmRlcnN0YW5kIHRoZSBsb2dpYyBiZWhpbmQgdGhlIGNoYW5n
ZXMuCj4gPiBJdCBzZWVtcyBsaWtlIHRoZSBwb2xhcml0eSBvZiBpbnRlcnJ1cHRzIGlzIGFsd2F5
cyB0aGUgc2FtZSBiZXR3ZWVuCj4gPiB0aGUgTVN0YXIgaW50YyBhbmQgdGhlIEdJQz8gTG93IGxl
dmVsIGludGVycnVwdHMgYXJlIGhhbmRsZWQgaW4gdGhlCj4gPiBtc3RhciBpbnRjIGFuZCBiZWNv
bWUgaGlnaCBsZXZlbCBpbnRlcnJ1cHRzIHRvIHRoZSBHSUM/Cj4KPiBUaGF0J3MgYmVjYXVzZSB0
aGUgR0lDIG9ubHkgc3VwcG9ydHMgbGV2ZWwtaGlnaCBpbnB1dCBpbnRlcnJ1cHRzIHdoZW4gdGhl
eSBhcmUgbGV2ZWwgdHJpZ2dlcmVkIChhbmQgcmlzaW5nIGVkZ2Ugd2hlbiBlZGdlIHRyaWdnZXJl
ZCkuCj4KPiBUaGFua3MsCj4KPiAgICAgICAgIE0uCj4KPiAtLQo+IFdpdGhvdXQgZGV2aWF0aW9u
IGZyb20gdGhlIG5vcm0sIHByb2dyZXNzIGlzIG5vdCBwb3NzaWJsZS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
