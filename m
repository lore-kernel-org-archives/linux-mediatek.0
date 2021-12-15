Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF26CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 02:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAP9pn/sqTa+ti0EF3AOVpGVYV75T0k5xIBCLbKBPcI=; b=1mqNadwTkLMiIj
	9qaPcEMxdKbqV9ny9R3xfvMqUIJXbKoLrFXHXNyzzCj9KATixwQMYlf/46Crhb9lbbjzlcwYpN1w1
	yO8b+jKzexLKok0qU2+7/RMCu0AkkEyT+SMm2w/77AHFbQ5ACFr1HqiIrmzKnG/XYZwPeY0FUJclp
	mzSB1vlwUu4udLh5OTT1T23ap1eiM8LUA7pDcIqZGhDYEKJMcJEGOxtIxRQGykXefNkvOQ/awDCR7
	H1jltVOtZsdBWBpUvc1aPt1eIaBmyiH9EMYAOQnBYHPYaC+ayivyYlaze1KB00NMcZ0r5kNTNGLQf
	Aeo7atgb0Z/+HVqyYVnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxJk5-00GM2P-MO; Wed, 15 Dec 2021 02:10:05 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxJjr-00GLzI-M8; Wed, 15 Dec 2021 02:09:53 +0000
Received: by mail-oo1-xc34.google.com with SMTP id
 e17-20020a4a8291000000b002c5ee0645e7so5471101oog.2; 
 Tue, 14 Dec 2021 18:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PVdeEwPhqkBs/Pea5KEyA6MfcBeMy0NS692bpZuteEs=;
 b=ZAMGfcpTtZZb5skT+LP/hwFkLze7fjLO2IOdRL13WrOwGHnMrM3rsxdG0F4VOLBP/r
 PB+L+R6CdiWt0sFPZwkWyd2VMbDsHncwdaVpeEb+rgwgBFg9iRKoefSFphoWNv/oiK0E
 Z4H8XzdNcnGD0Q7UVzR09k/hKqthzItnunyEHtlPvhIju03nWAJHRRD2MrswfQPm2iMG
 5KW1Y8aLIoOYPPPsKukt07gzkWNwr66AT4l/4kVPGedq2JDRhT6p1dZ8hA2uLlwkkADk
 b8UWcdUk4qVjLmpUZxPwcoNghX3GmpDQ1PYE4MbI/UvAWLz9K3OahOWKBLrkq6z7AP4w
 ZLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PVdeEwPhqkBs/Pea5KEyA6MfcBeMy0NS692bpZuteEs=;
 b=noSKk3c2yVMH5I9pOUl/OF05q/OF3n4LqMWwq8lexnS3mYuWm4D6Bo7D/nagMOwnB0
 mjS6815GQ9wxzzJ8AWCWCt1QchLNgyAT1gkAqdtgN6GP+FMkjmaOczCeD02CXVYHT4iu
 smqu0fVy1dVmg2XlimL+DZ9F0NlVM10S/YY65xL64LKQ1WDLFPCIsJY/wVkYo/PIYbT/
 vqAgZiLTBeWzw5+1qM0FGMEtNMFC+wiEZIyFy/sLLfV2xBzDPbFtZ0keztOuM3LqbIpP
 vYEvPTphIVUXZU/faqZlFH3IleD0IAmn4Lsbq9rdmz2Gq90c59fTwr+mUBZzOlhsneLW
 UyMA==
X-Gm-Message-State: AOAM5312fQ6dN3sULcqGCVBxhBo0NBOj629YhxX4cIB8gqOWaeyG2q8y
 hmex6sBBu5jAo5heQvu0pkwncM65poTezBnxcu8=
X-Google-Smtp-Source: ABdhPJwqeVw4JEsQNOi4sE1GSdprNp933aEmoicRHAob3sqYfYWzt9wxUzrbXUg0UwNydvXeRVN6q5YVh1bIKGkllak=
X-Received: by 2002:a4a:a30a:: with SMTP id q10mr5905524ool.40.1639534190791; 
 Tue, 14 Dec 2021 18:09:50 -0800 (PST)
MIME-Version: 1.0
References: <20211209072218.21651-1-chunfeng.yun@mediatek.com>
 <c448da77-f2f3-8b79-fc4b-b9dcff727c6e@linux.intel.com>
 <CAKgpwJXxtLwOjxjg3vFHiqS92j6rx_b1+C-bRwDnp+PBvXCMTg@mail.gmail.com>
 <e7a6e45e-68ce-54a5-9632-80244dd1e4c7@linux.intel.com>
In-Reply-To: <e7a6e45e-68ce-54a5-9632-80244dd1e4c7@linux.intel.com>
From: Jun Li <lijun.kernel@gmail.com>
Date: Wed, 15 Dec 2021 10:09:39 +0800
Message-ID: <CAKgpwJXdO8BZPcUH5Lq8AQUkQMDvLUW9h4HsgCm1XLcuP1G1HA@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci: skip re-check pending port event if hibernated
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux USB List <linux-usb@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 lkml <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>, 
 Yun-Chien Yu <yun-chien.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_180951_747495_65D28CD3 
X-CRM114-Status: GOOD (  22.74  )
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

TWF0aGlhcyBOeW1hbiA8bWF0aGlhcy5ueW1hbkBsaW51eC5pbnRlbC5jb20+IOS6jjIwMjHlubQx
MuaciDE05pel5ZGo5LqMIDE4OjAz5YaZ6YGT77yaCj4KPiBPbiAxNC4xMi4yMDIxIDEwLjAwLCBK
dW4gTGkgd3JvdGU6Cj4gPiBNYXRoaWFzIE55bWFuIDxtYXRoaWFzLm55bWFuQGxpbnV4LmludGVs
LmNvbT4g5LqOMjAyMeW5tDEy5pyIMTHml6Xlkajlha0gMDE6NTblhpnpgZPvvJoKPiA+Pgo+ID4+
IE9uIDkuMTIuMjAyMSA5LjIyLCBDaHVuZmVuZyBZdW4gd3JvdGU6Cj4gPj4+IFdoZW4geEhDSSBj
b250cm9sbGVyIGhpYmVybmF0ZWQsIHRoZSByb290IGh1YiBsb3N0IHBvd2VyLCBpZiBjb250cm9s
bGVyCj4gPj4+IHN1cHBvcnQgUG9ydCBQb3dlciBDb250cm9sIChQUEMpLCBQUCBpcyBub3Qgc2V0
IGF0IHhoY2lfcmVzdW1lKCkgYW5kCj4gPj4+IHNldCBieSBodWJfcmVzZXRfcmVzdW1lKCkgbGF0
ZXIsIHNvIG5vIG5lZWQgY2hlY2sgcGVuZGluZyBwb3J0IGV2ZW50Lgo+ID4+PiBJZiBQUEMgaXMg
bm90IHN1cHBvcnRlZCwgZGV2aWNlIGlzIGRpc2Nvbm5lY2VkLCBzZWVtcyBkbyBub3Qgc2VuZCBv
dXQKPiA+Pj4gVTMgTEZQUyB3YWtlIHNpZ25hbCwgbm8gbmVlZCByZS1jaGVjayBhZ2FpbiBhbmQg
ZHJvcCAxMjBtcyBkZWxheSB0bwo+ID4+PiBzYXZlIHJlc3VtZSB0aW1lLgo+ID4+Pgo+ID4+PiBS
ZXBvcnRlZC1ieTogWXVuLUNoaWVuIFl1IDx5dW4tY2hpZW4ueXVAbWVkaWF0ZWsuY29tPgo+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+
Cj4gPj4+IC0tLQo+ID4+Cj4gPj4gVGhhbmtzLCBhZGRpbmcKPiA+Cj4gPiBIaSBNYXRoaWFzLCBD
aHVuZmVuZwo+ID4KPiA+IEkgaGF2ZSBhIHF1ZXN0aW9uIG9uIHRoaXMsIGlmIHRoZXJlIGlzIG5v
IGFueSB1c2IgZGV2aWNlcyBjb25uZWN0ZWQKPiA+IGJlZm9yZSBzdXNwZW5kLCBkbyB3ZSBuZWVk
IHRoaXMgMTIwbXMgZGVsYXkgdG8gY2hlY2sgYWdhaW4/Cj4gPiBTbyBkbyB3ZSBuZWVkIG9uZSBt
b3JlIGNvbmRpdGlvbiB0byBsaW1pdCB0aGlzIGxpa2U/Cj4gPiBpZiAoIXBlbmRpbmdfcG9ydGV2
ZW50ICYmICFoaWJlcm5hdGVkICYmIHhoY2lfaGFzX2NoaWxkX2RldmljZSgpKQo+Cj4gVGhlIDEy
MG1zIGRlbGF5IHdhcyBhZGRlZCB0byBtYWtlIHN1cmUgd2UgY2F0Y2ggdGhlIHNlY29uZCB3YWtl
IHNpZ25hbAo+IGZyb20gYSBkZXZpY2UgaW4gY2FzZSBob3N0IG1pc3NlZCB0aGUgZmlyc3QgVTMg
ZXhpdCBMRlBTIHdha2V1cCBzaWduYWwuCj4KPiBFdmVuIGlmIG5vIGRldmljZXMgYXJlIGNvbm5l
Y3RlZCB0aGlzIG1pZ2h0IGJlIGhlbHBmdWwgaWYgYSBkZXZpY2UgaXMKPiBjb25uZWN0ZWQgd2hp
bGUgaG9zdCBpcyBzdXNwZW5kZWQuCgpBZ3JlZSB0aGlzIG1heSBhbHNvIGhlbHAgb24gdGhpcyBj
YXNlLgoKPiBJIGhhdmVuJ3QgY2hlY2tlZCBhbnkgdGltaW5nIGZvciB0aGUgbGluayB0cmFpbmlu
ZyBkdXJpbmcgZW51bWVyYXRpb24sCj4gYnV0IGl0IGFsc28gdXNlcyBMRlBTIHNpZ25hbGxpbmcs
IGFuZCBjb25uZWN0ZWQgZGV2aWNlIGlzbid0IHZpc2libGUgdG8KPiBkcml2ZXIgdW50aWwgbGlu
ayBpcyBzdWNjZXNzZnVsbHkgdHJhaW5lZC4KPgo+IFNvIHRoZSBvcmlnaW5hbCAxMjBtcyBkZWxh
eSBwYXRjaCBtaWdodCBhcyBhIHBvc2l0aXZlIHNpZGUgZWZmZWN0IGVuc3VyZQo+IGRyaXZlciBk
b2Vzbid0IHN1c3BlbmQgaG9zdCBtaWQgZGV2aWNlIGVudW1lcmF0aW9uLgoKSXMgdGhpcyB1bmV4
cGVjdGVkIHN1c3BlbmQgY2FuIGJlIHByZXZlbnRlZCBieSBhZGRpbmcgYXV0byBzdXNwZW5kCmRl
bGF5PwoKVGhhbmtzCkxpIEp1bgo+Cj4gQ291bGQgYmUgbG9va2VkIGludG8gbW9yZSwgYnV0IEkg
ZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIHRoaXMgcGF0Y2ggYnkKPiBDaHVuZmVuZwo+Cj4gVGhhbmtz
Cj4gTWF0aGlhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
