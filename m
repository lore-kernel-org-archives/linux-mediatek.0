Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BEEC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 14:08:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57B8420829
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 14:08:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aJDRI3xi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="y9jCMQ+B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57B8420829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghf2eXfeDsIL40JUkSGera0N4o5ZTST9frnQl3lWIXA=; b=aJDRI3xiSa7HYw
	AxQBFjlxYhcruBfMS8YTo/5zTtOGRqpdoa2KVS7X2gJ3Ji88F4q5CFPjUqxTM4/EMHxDH9JejzNfD
	k2fchrjfwhUYAiLDk+I20UJp04BPyKC8yq1///YlKawbW7zLtdcvaXMl4ToVnauFw3Nf4KniwX8OE
	AxcbrJvjuCsrWXz+m9NzgL2lxiGV1iG9J7rn0PDHva4shbR0FicTEJqsKNQhEenacW4aaaCokDc6A
	mBZAOHqda9HvJr1l4rE6ObmZpS+C8+JBTEpOSPERbWN78bmlpxNf/uz5bOzedZfYctbWoZQQWjkua
	qKymOGCr966bMyc94+CA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jagQj-0008Al-Nl; Mon, 18 May 2020 14:07:45 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jagQa-000835-Ug
 for linux-mediatek@lists.infradead.org; Mon, 18 May 2020 14:07:38 +0000
Received: by mail-io1-xd41.google.com with SMTP id k18so10743303ion.0
 for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2020 07:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=88kserzSxBEIDjdSt5lOO0U4rUg4np+0t0E9MSvOSs4=;
 b=y9jCMQ+BCO5bCs8V3KsG5KK/VGobVsgkQjY5AVz6q9lOYoUJM+8UK0wcbWXbI8xF3J
 prvbfUFKweWoR6i7a/sKx8hd+VDVivXpCogr+13TXNGWTzBZpoaT3G04gbQTXtnAwNKm
 b2zIgm05cKPpwTzQZBzWTIfeMmi6lp+iJJXuFHrQJEVyf70Wd/i8BU+zd33WziDDBQrr
 1aDDD33/n5PpFBKnqs55DxtGDOKC++20oqW8SMvEt6g64DqxmPH3Ynmu/dkM2TvOboRT
 smliBL1UFi7+UPGOT4cDY3LUQc1+4WEkr22dkDohlTcdglusE9AOIuhVsW1qLQbe12qf
 X+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=88kserzSxBEIDjdSt5lOO0U4rUg4np+0t0E9MSvOSs4=;
 b=N8tJp3nQ2rH92L2JC/lgCED4XP/RwIuI09okX1Ku80VQJYHZ18V1Wr2OlJTlbOWyl3
 a0OLnkNF3QANg9F6z5U7d8OC0pVfdNcpLwF8jpEXQ0rjifbY/KTPmCTsOVFylA2zgw/T
 ZH50nELEgBmV+M+KuK8EjcmU1x70lXArwtOfXojcngCl0c5uRLDj65YlQISnn2zy+tTP
 ISRxSkK5qOt/8bDFhqO6TwJtaXFeorwS8r7uSATF94bBIyb+JEnW3q2nH7f88jsvtSvF
 QSzcJc+UEE+0Oqy1rAs1NSkMTqfVcSCX5MBbeBMyk4fGAh41jfJdEPMs6w1NZUOZHdac
 jGCQ==
X-Gm-Message-State: AOAM532SbXGRC8eht4FJF3s9xqqmwdFySOpH0BoxWHje3EeXlujbg/FX
 z05JBHGRHlbdQU1faYBDjVamuFBwQteyDxvkb+XHpQ==
X-Google-Smtp-Source: ABdhPJz7TVBqL0o8reZpmOjcpmNU0hBkhjlx8exFERPwwjlGWCDBsQrggYZf+B/u4J3tppWJHADctBPzuEotkI8yI7U=
X-Received: by 2002:a6b:7c45:: with SMTP id b5mr14815810ioq.31.1589810854135; 
 Mon, 18 May 2020 07:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200514075942.10136-1-brgl@bgdev.pl>
 <20200514075942.10136-11-brgl@bgdev.pl>
 <CAK8P3a0XgJtZNKePZUUpzADO25-JZKyDiVHFS_yuHRXTjvjDwg@mail.gmail.com>
In-Reply-To: <CAK8P3a0XgJtZNKePZUUpzADO25-JZKyDiVHFS_yuHRXTjvjDwg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 18 May 2020 16:07:23 +0200
Message-ID: <CAMRc=MeVyNzTWw_hk=J9kX1NE9reCE_O4P3wrNpMMc9z4xA_DA@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] net: ethernet: mtk-eth-mac: new driver
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_070736_986919_E16CE619 
X-CRM114-Status: GOOD (  19.64  )
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
Cc: Edwin Peer <edwin.peer@broadcom.com>, DTML <devicetree@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Jonathan Corbet <corbet@lwn.net>, Networking <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pedro Tsai <pedro.tsai@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

cHQuLCAxNSBtYWogMjAyMCBvIDE1OjMyIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IG5h
cGlzYcWCKGEpOgo+Cj4gT24gVGh1LCBNYXkgMTQsIDIwMjAgYXQgMTA6MDAgQU0gQmFydG9zeiBH
b2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4gd3JvdGU6Cj4gPiArc3RhdGljIGludCBtdGtfbWFj
X3JpbmdfcG9wX3RhaWwoc3RydWN0IG10a19tYWNfcmluZyAqcmluZywKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtdGtfbWFjX3JpbmdfZGVzY19kYXRhICpkZXNj
X2RhdGEpCj4KPiBJIHRvb2sgYW5vdGhlciBsb29rIGF0IHRoaXMgZnVuY3Rpb24gYmVjYXVzZSBv
ZiB5b3VyIGNvbW1lbnQgb24gdGhlIGxvY2tpbmcKPiB0aGUgZGVzY3JpcHRvciB1cGRhdGVzLCB3
aGljaCBzZWVtZWQgc3VzcGljaW91cyBhcyB0aGUgZGV2aWNlIHNpZGUgZG9lcyBub3QKPiBhY3R1
YWxseSB1c2UgdGhlIGxvY2tzIHRvIGFjY2VzcyB0aGVtCj4KPiA+ICt7Cj4gPiArICAgICAgIHN0
cnVjdCBtdGtfbWFjX3JpbmdfZGVzYyAqZGVzYyA9ICZyaW5nLT5kZXNjc1tyaW5nLT50YWlsXTsK
PiA+ICsgICAgICAgdW5zaWduZWQgaW50IHN0YXR1czsKPiA+ICsKPiA+ICsgICAgICAgLyogTGV0
IHRoZSBkZXZpY2UgcmVsZWFzZSB0aGUgZGVzY3JpcHRvci4gKi8KPiA+ICsgICAgICAgZG1hX3Jt
YigpOwo+ID4gKyAgICAgICBzdGF0dXMgPSBkZXNjLT5zdGF0dXM7Cj4gPiArICAgICAgIGlmICgh
KHN0YXR1cyAmIE1US19NQUNfREVTQ19CSVRfQ09XTikpCj4gPiArICAgICAgICAgICAgICAgcmV0
dXJuIC0xOwo+Cj4gVGhlIGRtYV9ybWIoKSBzZWVtcyBvZGQgaGVyZSwgYXMgSSBkb24ndCBzZWUg
d2hpY2ggcHJpb3IgcmVhZAo+IGlzIGJlaW5nIHByb3RlY3RlZCBieSB0aGlzLgo+Cj4gPiArICAg
ICAgIGRlc2NfZGF0YS0+bGVuID0gc3RhdHVzICYgTVRLX01BQ19ERVNDX01TS19MRU47Cj4gPiAr
ICAgICAgIGRlc2NfZGF0YS0+ZmxhZ3MgPSBzdGF0dXMgJiB+TVRLX01BQ19ERVNDX01TS19MRU47
Cj4gPiArICAgICAgIGRlc2NfZGF0YS0+ZG1hX2FkZHIgPSByaW5nLT5kbWFfYWRkcnNbcmluZy0+
dGFpbF07Cj4gPiArICAgICAgIGRlc2NfZGF0YS0+c2tiID0gcmluZy0+c2tic1tyaW5nLT50YWls
XTsKPiA+ICsKPiA+ICsgICAgICAgZGVzYy0+ZGF0YV9wdHIgPSAwOwo+ID4gKyAgICAgICBkZXNj
LT5zdGF0dXMgPSBNVEtfTUFDX0RFU0NfQklUX0NPV047Cj4gPiArICAgICAgIGlmIChzdGF0dXMg
JiBNVEtfTUFDX0RFU0NfQklUX0VPUikKPiA+ICsgICAgICAgICAgICAgICBkZXNjLT5zdGF0dXMg
fD0gTVRLX01BQ19ERVNDX0JJVF9FT1I7Cj4gPiArCj4gPiArICAgICAgIC8qIEZsdXNoIHdyaXRl
cyB0byBkZXNjcmlwdG9yIG1lbW9yeS4gKi8KPiA+ICsgICAgICAgZG1hX3dtYigpOwo+Cj4gVGhl
IGNvbW1lbnQgYW5kIHRoZSBiYXJyaWVyIGhlcmUgc2VlbSBvZGQgYXMgd2VsbC4gSSB3b3VsZCBo
YXZlIGV4cGVjdGVkCj4gYSBiYXJyaWVyIGFmdGVyIHRoZSB1cGRhdGUgdG8gdGhlIGRhdGEgcG9p
bnRlciwgYW5kIG9ubHkgYSBzaW5nbGUgc3RvcmUKPiBidXQgbm8gcmVhZCBvZiB0aGUgc3RhdHVz
IGZsYWcgaW5zdGVhZCBvZiB0aGUgcmVhZC1tb2RpZnktd3JpdGUsCj4gc29tZXRoaW5nIGxpa2UK
Pgo+ICAgICAgIGRlc2MtPmRhdGFfcHRyID0gMDsKPiAgICAgICBkbWFfd21iKCk7IC8qIG1ha2Ug
cG9pbnRlciB1cGRhdGUgdmlzaWJsZSBiZWZvcmUgc3RhdHVzIHVwZGF0ZSAqLwo+ICAgICAgIGRl
c2MtPnN0YXR1cyA9IE1US19NQUNfREVTQ19CSVRfQ09XTiB8IChzdGF0dXMgJiBNVEtfTUFDX0RF
U0NfQklUX0VPUik7Cj4KPiA+ICsgICAgICAgcmluZy0+dGFpbCA9IChyaW5nLT50YWlsICsgMSkg
JSBNVEtfTUFDX1JJTkdfTlVNX0RFU0NTOwo+ID4gKyAgICAgICByaW5nLT5jb3VudC0tOwo+Cj4g
SSB3b3VsZCBnZXQgcmlkIG9mIHRoZSAnY291bnQnIGhlcmUsIGFzIGl0IGR1cGxpY2F0ZXMgdGhl
IGluZm9ybWF0aW9uCj4gdGhhdCBpcyBhbHJlYWR5IGtub3duIGZyb20gdGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiBoZWFkIGFuZCB0YWlsLCBhbmQgeW91Cj4gY2FuJ3QgdXBkYXRlIGl0IGF0b21pY2Fs
bHkgd2l0aG91dCBob2xkaW5nIGEgbG9jayBhcm91bmQgdGhlIGFjY2VzcyB0bwo+IHRoZSByaW5n
LiBUaGUgd2F5IEknZCBkbyB0aGlzIGlzIHRvIGhhdmUgdGhlIGhlYWQgYW5kIHRhaWwgcG9pbnRl
cnMKPiBpbiBzZXBhcmF0ZSBjYWNoZSBsaW5lcywgYW5kIHRoZW4gdXNlIFJFQURfT05DRS9XUklU
RV9PTkNFCj4gYW5kIHNtcCBiYXJyaWVycyB0byBhY2Nlc3MgdGhlbSwgd2l0aCBlYWNoIG9uZSB1
cGRhdGVkIG9uIG9uZQo+IHRocmVhZCBidXQgcmVhZCBieSB0aGUgb3RoZXIuCj4KCllvdXIgcHJl
dmlvdXMgc29sdXRpb24gc2VlbXMgbXVjaCBtb3JlIHJlbGlhYmxlIHRob3VnaC4gRm9yIGluc3Rh
bmNlCmluIHRoZSBhYm92ZTogd2hlbiB3ZSdyZSBkb2luZyB0aGUgVFggY2xlYW51cCAod2UgZ290
IHRoZSBUWCByZWFkeQppcnEsIHdlJ3JlIGl0ZXJhdGluZyBvdmVyIGRlc2NyaXB0b3JzIHVudGls
IHdlIGtub3cgdGhlcmUgYXJlIG5vIG1vcmUKcGFja2V0cyBzY2hlZHVsZWQgKGNvdW50ID09IDAp
IG9yIHdlIGVuY291bnRlciBvbmUgdGhhdCdzIHN0aWxsIG93bmVkCmJ5IERNQSksIGEgcGFyYWxs
ZWwgVFggcGF0aCBjYW4gc2NoZWR1bGUgbmV3IHBhY2tldHMgdG8gYmUgc2VudCBhbmQgSQpkb24n
dCBzZWUgaG93IHdlIGNhbiBhdG9taWNhbGx5IGNoZWNrIHRoZSBjb3VudCAodW5kZXJzdG9vZCBh
cyBhCmRpZmZlcmVuY2UgYmV0d2VlbiB0YWlsIGFuZCBoZWFkKSBhbmQgcnVuIGEgbmV3IGl0ZXJh
dGlvbiAod2hlcmUgd2UnZAptb2RpZnkgdGhlIGhlYWQgb3IgdGFpbCkgd2l0aG91dCByaXNraW5n
IHRoZSBvdGhlciBwYXRoIGdldHRpbmcgaW4gdGhlCndheS4gV2UnZCBoYXZlIHRvIGFsd2F5cyBj
aGVjayB0aGUgZGVzY3JpcHRvci4KCkkgZXhwZXJpbWVudGVkIGEgYml0IHdpdGggdGhpcyBhbmQg
Y291bGRuJ3QgY29tZSB1cCB3aXRoIGFueXRoaW5nIHRoYXQKd291bGQgcGFzcyBhbnkgc3RyZXNz
IHRlc3QuCgpPbiB0aGUgb3RoZXIgaGFuZDogc3Bpbl9sb2NrX2JoKCkgd29ya3MgZmluZSBhbmQg
SSBsaWtlIHlvdXIgYXBwcm9hY2gKZnJvbSB0aGUgcHJldmlvdXMgZS1tYWlsIC0gZXhjZXB0IGZv
ciB0aGUgd29yayBmb3IgdXBkYXRpbmcgc3RhdHMgYXMKd2UgY291bGQgcG90ZW50aWFsbHkgbG9z
ZSBzb21lIHN0YXRzIHdoZW4gd2UncmUgdXBkYXRpbmcgaW4gcHJvY2Vzcwpjb250ZXh0IHdpdGgg
UlgvVFggcGF0aHMgcnVubmluZyBpbiBwYXJhbGxlbCBpbiBuYXBpIGNvbnRleHQgYnV0IHRoYXQK
d291bGQgYmUgcmFyZSBlbm91Z2ggdG8gb3Zlcmxvb2sgaXQuCgpJIGhvcGUgdjQgd2lsbCBiZSBn
b29kIGVub3VnaCBldmVuIHdpdGggc3BpbmxvY2tzLiA6KQoKQmFydAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
