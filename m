Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFC8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 17:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From:Date:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p6nR+n8BbC5SzpIysJ5yAWOFEMhROccdYBsllZvfVlQ=; b=FfKemXLoiO6U3NiOabuhcxBEox
	ahbFVoj5gT4CaSBSH3t4QHNZe7LCxToWO0nuQKCy6EKIsCvvvYvvFnEt896u9cyOd2NvWm/m4xIYN
	m8n2UWG1ZR8GVQ4WFzQbmydwu3lzR2cIVrRYW1olWg9x5+G7Roj2f/l1BZIuw8g4Zmaxr5aw0hA1+
	evEzkYGFfnQhJUfowxVzkyZwRrmtU32pyA59DCO0tzh5s1YPHsbYiJeM4mcO3ymx1PoziKViyGuOj
	jSFVVXLNDd0cCJ1G5kL1onXDEdO6Eh0cwNkaij2BrDM3zPAsnGqH/O9uHsH3x//bbPeRUIakLEegV
	ApdYcfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSMuZ-00DesT-QB; Thu, 10 Mar 2022 17:49:15 +0000
Received: from mail.va1der.ca ([107.6.27.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRMvN-001zgw-Kb; Mon, 07 Mar 2022 23:37:59 +0000
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=va1der.ca;
 i=@va1der.ca; q=dns/txt; s=ed25519; t=1646696260; h=mime-version :
 date : from : to : cc : subject : message-id : content-type :
 content-transfer-encoding : from;
 bh=q8GEAHMQlNaRhusANlNy77UsivpPXDacShRAJqbTrBM=;
 b=mjC4dp1pnxYID/Yy6itT+59j7h3EvOILdYS5gVeRXHGMpImn8G/xZZhEwNzHJ8gk3ZC6C
 zsNcUa5fKCz9EMzCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=va1der.ca;
 i=@va1der.ca; q=dns/txt; s=rsa2k; t=1646696260; h=mime-version : date
 : from : to : cc : subject : message-id : content-type :
 content-transfer-encoding : from;
 bh=q8GEAHMQlNaRhusANlNy77UsivpPXDacShRAJqbTrBM=;
 b=MInQOjfTcUVm+rzshYppHW2tEI1D0s6F1WgY4rA7oeTTsCPK6H7Jv8WPBfA5yPVd0TfH1
 R5nUkxHjmuwxE87UgKD4QIZol6POTOOX5XJxsW2T0LGnmzZH6y10M++nerjQAeXB4lUooxe
 14EEZMyo2FeicTBDCZnEL/ijdk/WWfi1LgakngrLmifvgU7A+STOZAuoSRNhMCX2Xs3bobf
 slhaAb2NuTeulvYmCNEryCZAtisy6avUjCL+q0xA5WfyDqX668eF6SnFuNWp7Yus+eE3y/H
 jw7AqD6KorX8Z02ixhUNqY0K9X8O5+hMV3S9J0HWRfRt8q2g7IHDPhR3vSLg==
Received: from mail.va1der.ca (mail.va1der.ca [107.6.27.142])
 by mail.va1der.ca (Postfix) with ESMTPSA id 3811D8027E;
 Mon,  7 Mar 2022 19:37:40 -0400 (AST)
MIME-Version: 1.0
Date: Mon, 07 Mar 2022 19:37:35 -0400
From: kurt@va1der.ca
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: Aw: Re: [PATCH] arm: dts: mt7623: increase passive cooling trip
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <2ca1bfd16fb26c63f5ef01f01528c79a@va1der.ca>
X-Sender: kurt@va1der.ca
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_153757_872747_B9FD640B 
X-CRM114-Status: GOOD (  24.95  )
X-Mailman-Approved-At: Thu, 10 Mar 2022 09:49:15 -0800
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgRnJhbmssCgpPbiAyMDIyLTAzLTA1IDEyOjM3LCBGcmFuayBXdW5kZXJsaWNoIHdyb3RlOgoK
PiBkb2VzIHlvdXIgUGF0Y2ggZml4ZXMgdGhlIGlzc3VlPyBpZiB5ZXMgeW91IGNhbiBzZW5kIGEg
UGF0Y2ggYmFzZWQgb24KPiBjdXJyZW50IG1haW5saW5lIGR0cy4KCkkgc2hvdWxkIGFwb2xvZ2l6
ZS4gIEkgZGlkbid0IHB1dCB0aGUga2luZCBvZiBzY3J1dGlueSBpbnRvIHRoaXMgdGhhdCBJIApz
aG91bGQgaGF2ZSBiZWZvcmUgcHJvcG9zaW5nIGEga2VybmVsIHBhdGNoLgoKTG9va2luZyBhdCB0
aGlzIGR0cyBtb3JlIGRlZXBseSwgSSBzZWUgdGhhdCBJIHdhcyBtaXNsZWFkIGJ5IE1lZGlhdGVr
J3MgCnVzZSBvZiAiYWN0aXZlIiBhbmQgInBhc3NpdmUiIHRyaXAgcG9pbnRzLiAgQW4gYWN0aXZl
IHRyaXAgcG9pbnQgaXMgCnN1cHBvc2VkIHRvIG9ubHkgYmUgZm9yIGZhbnMgYW5kIHRoZSBsaWtl
LiAgQnV0IGluIHRoaXMgY2FzZSwgbG9va2luZyBhdCAKdGhlIGNvb2xpbmcgbWFwcyB0aGUgdHJp
cCBwb2ludHMgcmVmZXJlbmNlLCBJIHNlZSBwYXNzaXZlIGFuZCBhY3RpdmUgCihhbmQgaG90IGFz
IHdlbGwpIGFyZSBhbGwgbWFwcGVkIHRvIHRoZSBzYW1lIGV4YWN0IENQVSBzY2FsaW5nIAptZWNo
YW5pc20uICBUaGV5IGV2ZW4gYWxsIGhhdmUgdGhlIHNhbWUgdW5saW1pdGVkIHNjYWxpbmcgcmFu
Z2UuICBXaGljaCAKbWVhbnMgdHdvIG9mIHRoZW0gY2FuJ3QgZXZlciBoYXZlIGFueSBlZmZlY3Qu
ICBJIHN1c3BlY3QgYXQgb25lIHBvaW50IAp0aGV5IGhhZCBoYXJkd2FyZSBmYW4gc3VwcG9ydCBp
biB0aGVpciBkZXZlbG9wbWVudCBjeWNsZSB3aGljaCB3YXMgCmRlbGV0ZWQuCgpTbyB3ZSBjYW4n
dCBzd2FwIHBhc3NpdmUvYWN0aXZlIHdpdGggYW55IGVmZmVjdC4gIEJ1dCBJIHN0aWxsIHRoaW5r
IGV2ZW4gCjU3wrBDIGlzIGEgbGl0dGxlIGxvdyB0byBsb2NrIHRoZSBDUFUgYXQsIHNpbmNlIGl0
J3Mgbm90IGEgZGFuZ2Vyb3VzIAp0ZW1wZXJhdHVyZSBhbmQgaXQncyBub3QgZGlmZmljdWx0IHRv
IGdldCBkZXZpY2VzIHRoYXQgd2FybS4gIEkgc3VnZ2VzdCAKd2UgZGVsZXRlIHRoZSBjdXJyZW50
ICJBY3RpdmUiIHRyaXAgcG9pbnQgZW50aXJlbHksIGFuZCB0aGVuIGhhdmUgb25seSAKdGhyZWUg
dHJpcCBwb2ludHMgc3RhcnRpbmcgYXQgNjfCsEMuICBJIGhhdmUgdHdvIHRlc3QgYm9hcmRzIChC
UEkgUjIgYW5kIApVbmlFbGVjIFU3NjIzKSBlYWNoIHJ1bm5pbmcgYSBrZXJuZWwgd2l0aCB0aGlz
IHNldHVwIG5vdyBhbmQgaXQgd29ya3MgCnF1aXRlIHdlbGwuCgogICAgS3VydAoKPiAKPiBpdCBs
b29rcyBhIGJpdCB3ZWlyZWQgdG8gbWUgaGF2aW5nIGFjdGl2ZSBiZWZvcmUgcGFzc2l2ZS4uLmJ1
dCBpJ20gbm8KPiBleHBlcnQgaW4gdGhlIGNvb2xpbmcgdHJpcHMuCj4gaSBqdXN0IGluY3JlYXNl
ZCB0aGUgdGVtcHMgOikKPiAKPiBwbGVhc2Ugc2VlIG5vdGVzIGJlbG93Cj4gCj4+IE9uIDIwMjEt
MDctMjUgMTozNCBwLm0uLCBGcmFuayBXdW5kZXJsaWNoIHdyb3RlOgo+PiA+IEZyb206IEZyYW5r
IFd1bmRlcmxpY2ggPGZyYW5rLXdAcHVibGljLWZpbGVzLmRlPgo+PiA+Cj4+ID4gTVQ3NjIzL0JQ
SS1SMiBoYXMgaWRsZSB0ZW1wZXJhdHVyZSBhZnRlciBib290dXAgZnJvbSA0OCBkZWdyZWVzIGNl
bHNpdXMKPj4gPiBpbmNyZWFzZSB0aGUgcGFzc2l2ZSB0cmlwIHRlbXAgdGhyZXNob2xkIHRvIG5v
dCB0cm90dGxlIENQVSBmcmVxdWVuY3kgYXQKPj4gPiB0aGlzIHRlbXBlcmF0dXJlCj4+IAo+PiBU
aGUgZHRzIGZpbGUgZm9yIHRoZSBtdDc2MjMgaGFzIGZvdXIgdHJpcCBwb2ludHM6Cj4+IC0gVHJp
cCBwb2ludCAwLCBUeXBlPVBhc3NpdmUgQCA0N8KwQyAob3JpZ2luYWxseSwgbm93IDU3wrBDKQo+
PiAtIFRyaXAgcG9pbnQgMSwgVHlwZT1BY3RpdmUgQCA2N8KwQwo+PiAtIFRyaXAgcG9pbnQgMiwg
VHlwZT1Ib3QgQCA4N8KwQwo+PiAtIFRyaXAgcG9pbnQgMywgVHlwZT1Dcml0aWNhbCBAIDEwN8Kw
Qwo+PiAKPj4gSXQgbWFrZXMgbGl0dGxlIHNlbnNlIHRvIGhhdmUgcGFzc2l2ZSBDUFUgdGhyb3R0
bGluZyBlbXBsb3llZCAqYmVmb3JlKgo+PiBlbmdhZ2luZyBhIGZhbi4gIEdlbmVyYWxseSB1c2Vy
cyB3YW50IGEgZmFuIChpZiBwcmVzZW50KSB0byBiZSBlbmdhZ2VkCj4+IGJlZm9yZSBpbnRlbnRp
b25hbCBwZXJmb3JtYW5jZSBkZWdyYWRhdGlvbiBpcyBlbXBsb3llZC4KPj4gCj4+ID4gICAJCQkJ
CWNwdV9wYXNzaXZlOiBjcHUtcGFzc2l2ZSB7Cj4+ID4gLQkJCQkJCXRlbXBlcmF0dXJlID0gPDQ3
MDAwPjsKPj4gPiArCQkJCQkJdGVtcGVyYXR1cmUgPSA8NTcwMDA+Owo+PiAKPj4gVGhlIG9sZCB0
ZW1wZXJhdHVyZSBvZiA0N8KwQyBhcHBlYXJzLCBpbiBwcmFjdGljZSwgdG8gYmUgYSBnb29kCj4+
IHRlbXBlcmF0dXJlIGZvciBhbiBhY3RpdmUgY29vbGluZyB0cmlwIHBvaW50LiAgSXQgaXMganVz
dCBhYm92ZSB0aGUKPj4gdGVtcGVyYXR1cmUgdGhhdCBhIGdlbmVyYWxseSBpZGxlIG10NzYyMyBz
aXRzIGF0IGluIGVuY2xvc3VyZXMgd2hlcmUKPj4gdGhpcyBTb0MgaXMgZW1wbG95ZWQsIGJ1dCBh
bHNvIGEgdGVtcGVyYXR1cmUgdGhhdCBhIENQVSB1bmRlciBsb2FkIAo+PiB3aWxsCj4+IHF1aWNr
bHkgcmVhY2guCj4+IAo+PiBUaGVyZWZvcmUgSSBwcm9wb3NlIHRoZSB0eXBlcyBvZiB0cmlwIHBv
aW50cyAwIGFuZCAxIGJlIHJldmVyc2VkIGFuZCAKPj4gdGhlCj4+IHRlbXBlcmF0dXJlcyBsZWZ0
IGFzIHRoZXkgd2VyZS4KPj4gCj4+IAo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9tdDc2MjMu
ZHRzaQkyMDIyLTAyLTI3IDE4OjM2OjMzIC0wNDAwCj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L210NzYyMy5kdHNpCTIwMjItMDMtMDUgMTE6Mzc6NTIgLTA0MDAKPj4gQEAgLTE1OCwxOSArMTU4
LDE5IEBACj4+IAo+PiAgIAkJCQl0aGVybWFsLXNlbnNvcnMgPSA8JnRoZXJtYWwgMD47Cj4+IAo+
PiAgIAkJCQl0cmlwcyB7Cj4+ICAgCQkJCQljcHVfcGFzc2l2ZTogY3B1LXBhc3NpdmUgewo+PiAt
CQkJCQkJdGVtcGVyYXR1cmUgPSA8NTcwMDA+Owo+PiArCQkJCQkJdGVtcGVyYXR1cmUgPSA8NDcw
MDA+Owo+PiAgIAkJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47Cj4+IC0JCQkJCQl0eXBlID0gInBh
c3NpdmUiOwo+PiArCQkJCQkJdHlwZSA9ICJhY3RpdmUiOwo+PiAgIAkJCQkJfTsKPiAKPiBpZiB0
eXBlIGlzIGRpZmZlcmVudCwgaW1obyB0aGUgbmFtZStsYWJlbCBzaG91bGQgYmUgY2hhbmdlZCB0
b28KPiAKPj4gICAJCQkJCWNwdV9hY3RpdmU6IGNwdS1hY3RpdmUgewo+PiAgIAkJCQkJCXRlbXBl
cmF0dXJlID0gPDY3MDAwPjsKPj4gICAJCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+Owo+PiAtCQkJ
CQkJdHlwZSA9ICJhY3RpdmUiOwo+PiArCQkJCQkJdHlwZSA9ICJwYXNzaXZlIjsKPj4gICAJCQkJ
CX07Cj4gCj4gZGl0bwo+IAo+PiAgIAkJCQkJY3B1X2hvdDogY3B1LWhvdCB7Cj4+ICAgCQkJCQkJ
dGVtcGVyYXR1cmUgPSA8ODcwMDA+Owo+PiAgIAkJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47Cj4g
Cj4gcmVnYXJkcyBGcmFuawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
