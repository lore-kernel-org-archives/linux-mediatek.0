Return-Path: <SRS0=Mjju=62=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DA7C54E4B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 06:35:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E01720714
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 06:35:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C8KD+mdG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="NvN3bHID"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E01720714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g2E4iMD0VrD4ZaDqSWoT3xXUYz8OwJ1WlAOvFpku4Vg=; b=C8KD+mdGG1qdi7
	jHaXF0wMlP7rByJUz/lpmXzykwezr9tWPKf9A57EINCP+tIYhBZ83qY0VDo9v4dQKvUkvalPWcj+l
	cDXTJeoCi9uW6dOY+3mf9RTfxaEul1Qgq0KpA1Rh8IAkO+ENTYMRI5eI+Hog5XMRv8xz3xLYRDuJz
	jhZ3g/XNb6BtyKVkSklJXG2YGo50t1sl702XbqzdrDimC96ZzflwFnohD2NACZhXLZMGPMOwrg0jZ
	pts5itq7u4tDlhk/TXYVHBKMxQ5QrxkoeMKhzhIwO7dcs3/t7mQH4Kxp7maDuY2HIiVy1EPt3umO4
	8gkcHwjTo88+iJLeSj1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYOVw-0007Hs-KW; Tue, 12 May 2020 06:35:40 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYOVo-0007Ay-R6
 for linux-mediatek@lists.infradead.org; Tue, 12 May 2020 06:35:34 +0000
Received: by mail-io1-xd43.google.com with SMTP id f5so5351431iow.10
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 23:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hmqc9TQ9Quh7+US/Jmh4IXg0bVpfrPAKCJNshFYSv+Q=;
 b=NvN3bHIDGwK+p0qEwYf7zjtLlsxm2ceG5S0GYtDcV8aLAqcsJfqOTGl1gkyIlhzl56
 Z9+A/IMEvGy4ZRM0/h9CnkQShR6M/HA4DFloyhf88t+b64r/X4SaOrgaUi+rdf2GGmha
 cvaSBe+ut2HCvfoRg2GMxsWf6PqOgRKYk0l6PWeo1znnU/k7z8yLPqV2DkosG+22KThS
 +pXuvun5l0Uwje9BpaVzjG2kJpbk1JW2IVBJFyar1BKa7F61PvPqDdP1c4wfHS485XIc
 MlKgocOGFtkGz3BKYGLQ6g5TKWxZpOJYjdJlC9flK8333jlQOL1oOx4rRvibwF2SEbz1
 RWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hmqc9TQ9Quh7+US/Jmh4IXg0bVpfrPAKCJNshFYSv+Q=;
 b=kkCJmDVmrLmDvJFxva4+CqImJAhMZ0ty9ISZ7ynVaWyJ1DUTflBlNmf6DbB7etYE6C
 IcaHTkyQQN+Dulw0PypwX85pMW2miE5nJQzXbvxqz4Fsw5B8w8+Esj7uiJFfe+S2cr7m
 uXUsGYC/ZY11LhIPVn5S28nuotDbN9UVVS5iC7+fLwqz9kcW/zs0o7dXzUyHEghqslYp
 zanWRjHiCS/+9NCgBMRtzeJ0LcT28g1qUUzvNN7Xtj1Ms8cXkbwA79fg3vjO5vI4fxOZ
 MXeG/Iblg0HqiQAIpXEsGuE8vh3RrsWHy4aq0nMpnZu5JRQ0TjGBLS15aculBP98D8iJ
 amhA==
X-Gm-Message-State: AGi0PuaRhOZ+YVttO2B8ecsW5OLzlzY62cjfoYEYYIgHYa6k23/FQQRJ
 ptxR1r2i1loHF2d7GDMMI1oqirOdYx2i6xrxhbR0bw==
X-Google-Smtp-Source: APiQypLWnzw4EWWNr1vmFUqwTdjDAprfuZXfBBKAg6Df7mrHkghpjwc+KH+GGaVrIhljRYARBkWpEGcIU/MDkPlDt6c=
X-Received: by 2002:a05:6638:68f:: with SMTP id
 i15mr19299578jab.136.1589265331761; 
 Mon, 11 May 2020 23:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200511150759.18766-1-brgl@bgdev.pl>
 <20200511150759.18766-10-brgl@bgdev.pl>
 <dab80587-a196-e0ab-ae97-f8e5cc4a71d4@gmail.com>
In-Reply-To: <dab80587-a196-e0ab-ae97-f8e5cc4a71d4@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 May 2020 08:35:21 +0200
Message-ID: <CAMRc=MeAMHs3jYh5KpbO5pAqO_cTmc71US_aVAFqRpNBnEYVMg@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] net: ethernet: mtk-eth-mac: new driver
To: Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_233532_885170_D4293CCA 
X-CRM114-Status: GOOD (  22.39  )
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
Cc: Edwin Peer <edwin.peer@broadcom.com>,
 devicetree <devicetree@vger.kernel.org>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pedro Tsai <pedro.tsai@mediatek.com>, "David S . Miller" <davem@davemloft.net>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

cG9uLiwgMTEgbWFqIDIwMjAgbyAyMToyNCBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdt
YWlsLmNvbT4gbmFwaXNhxYIoYSk6Cj4KPgo+Cj4gT24gNS8xMS8yMDIwIDg6MDcgQU0sIEJhcnRv
c3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29s
YXN6ZXdza2lAYmF5bGlicmUuY29tPgo+ID4KPiA+IFRoaXMgYWRkcyB0aGUgZHJpdmVyIGZvciB0
aGUgTWVkaWFUZWsgRXRoZXJuZXQgTUFDIHVzZWQgb24gdGhlIE1UOCogU29DCj4gPiBmYW1pbHku
IEZvciBub3cgd2Ugb25seSBzdXBwb3J0IGZ1bGwtZHVwbGV4Lgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4gPiAt
LS0KPgo+IFtzbmlwXQo+Cj4gPiArc3RhdGljIGludCBtdGtfbWFjX3JpbmdfcG9wX3RhaWwoc3Ry
dWN0IG10a19tYWNfcmluZyAqcmluZywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgbXRrX21hY19yaW5nX2Rlc2NfZGF0YSAqZGVzY19kYXRhKQo+ID4gK3sKPiA+ICsg
ICAgIHN0cnVjdCBtdGtfbWFjX3JpbmdfZGVzYyAqZGVzYyA9ICZyaW5nLT5kZXNjc1tyaW5nLT50
YWlsXTsKPiA+ICsgICAgIHVuc2lnbmVkIGludCBzdGF0dXM7Cj4gPiArCj4gPiArICAgICAvKiBM
ZXQgdGhlIGRldmljZSByZWxlYXNlIHRoZSBkZXNjcmlwdG9yLiAqLwo+ID4gKyAgICAgZG1hX3Jt
YigpOwo+ID4gKyAgICAgc3RhdHVzID0gZGVzYy0+c3RhdHVzOwo+ID4gKwo+ID4gKyAgICAgaWYg
KCEoc3RhdHVzICYgTVRLX01BQ19ERVNDX0JJVF9DT1dOKSkKPiA+ICsgICAgICAgICAgICAgcmV0
dXJuIC0xOwo+ID4gKwo+ID4gKyAgICAgZGVzY19kYXRhLT5sZW4gPSBzdGF0dXMgJiBNVEtfTUFD
X0RFU0NfTVNLX0xFTjsKPiA+ICsgICAgIGRlc2NfZGF0YS0+ZmxhZ3MgPSBzdGF0dXMgJiB+TVRL
X01BQ19ERVNDX01TS19MRU47Cj4gPiArICAgICBkZXNjX2RhdGEtPmRtYV9hZGRyID0gZGVzYy0+
ZGF0YV9wdHI7Cj4gPiArICAgICBkZXNjX2RhdGEtPnNrYiA9IHJpbmctPnNrYnNbcmluZy0+dGFp
bF07Cj4gPiArCj4gPiArICAgICBkZXNjLT5kYXRhX3B0ciA9IDA7Cj4gPiArICAgICBkZXNjLT5z
dGF0dXMgPSBNVEtfTUFDX0RFU0NfQklUX0NPV047Cj4gPiArICAgICBpZiAoc3RhdHVzICYgTVRL
X01BQ19ERVNDX0JJVF9FT1IpCj4gPiArICAgICAgICAgICAgIGRlc2MtPnN0YXR1cyB8PSBNVEtf
TUFDX0RFU0NfQklUX0VPUjsKPgo+IERvbid0IHlvdSBuZWVkIGEgZG1hX3dtYigpIGZvciB0aGUg
ZGV2aWNlIHRvIG9ic2VydmUgdGhlIG5ldyBkZXNjcmlwdG9yCj4gaGVyZT8KPgoKSFcgaGFzIHJl
bGVhc2VkIHRoZSBkZXNjcmlwdG9yIChzZXQgdGhlIENPV04gYml0KSBhbmQgSSBqdXN0IGNsZWFy
IGFsbApvdGhlciBiaXRzIGhlcmUgcmVhbGx5LiBZZWFoLCBJIGd1ZXNzIGl0IHdvbid0IGh1cnQg
dG8gbWFrZSBzdXJlLgoKPiBbc25pcF0KPgo+ID4gK3N0YXRpYyB2b2lkIG10a19tYWNfZG1hX3Vu
bWFwX3R4KHN0cnVjdCBtdGtfbWFjX3ByaXYgKnByaXYsCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IG10a19tYWNfcmluZ19kZXNjX2RhdGEgKmRlc2NfZGF0YSkKPiA+
ICt7Cj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBtdGtfbWFjX2dldF9kZXYocHJpdik7
Cj4gPiArCj4gPiArICAgICByZXR1cm4gZG1hX3VubWFwX3NpbmdsZShkZXYsIGRlc2NfZGF0YS0+
ZG1hX2FkZHIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXNjX2RhdGEtPmxl
biwgRE1BX1RPX0RFVklDRSk7Cj4KPiBJZiB5b3Ugc3RvcmVkIGEgcG9pbnRlciB0byB0aGUgc2tf
YnVmZiB5b3UgdHJhbnNtaXR0ZWQsIHRoZW4geW91IHdvdWxkCj4gbmVlZCBhbiBleHBlbnNpdmUg
cmVhZCB0byB0aGUgZGVzY3JpcHRvciB0byBkZXRlcm1pbmUgdGhlIGFkZHJlc3MgYW5kCj4gbGVu
Z3RoLCBhbmQgeW91IHdvdWxkIGFsc28gbm90IGJlIGF0IHRoZSBtZXJjeSBvZiB0aGUgSFcgcHV0
dGluZwo+IGluY29ycmVjdCB2YWx1ZXMgdGhlcmUuCj4KCllvdSBtZWFuIHN0b3JlIHRoZSBtYXBw
ZWQgYWRkcmVzc2VzPyBZZWFoIEkgY2FuIGRvIHRoYXQgYnV0IEknbGwgc3RpbGwKbmVlZCB0byBy
ZWFkIHRoZSBkZXNjcmlwdG9yIG1lbW9yeSB0byB2ZXJpZnkgaXQgd2FzIHJlbGVhc2VkIGJ5IEhX
LgoKPiBzcAo+ID4gK3N0YXRpYyB2b2lkIG10a19tYWNfZG1hX2luaXQoc3RydWN0IG10a19tYWNf
cHJpdiAqcHJpdikKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgbXRrX21hY19yaW5nX2Rlc2MgKmRl
c2M7Cj4gPiArICAgICB1bnNpZ25lZCBpbnQgdmFsOwo+ID4gKyAgICAgaW50IGk7Cj4gPiArCj4g
PiArICAgICBwcml2LT5kZXNjc19iYXNlID0gKHN0cnVjdCBtdGtfbWFjX3JpbmdfZGVzYyAqKXBy
aXYtPnJpbmdfYmFzZTsKPiA+ICsKPiA+ICsgICAgIGZvciAoaSA9IDA7IGkgPCBNVEtfTUFDX05V
TV9ERVNDU19UT1RBTDsgaSsrKSB7Cj4gPiArICAgICAgICAgICAgIGRlc2MgPSAmcHJpdi0+ZGVz
Y3NfYmFzZVtpXTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgbWVtc2V0KGRlc2MsIDAsIHNpemVv
ZigqZGVzYykpOwo+ID4gKyAgICAgICAgICAgICBkZXNjLT5zdGF0dXMgPSBNVEtfTUFDX0RFU0Nf
QklUX0NPV047Cj4gPiArICAgICAgICAgICAgIGlmICgoaSA9PSBNVEtfTUFDX05VTV9UWF9ERVND
UyAtIDEpIHx8Cj4gPiArICAgICAgICAgICAgICAgICAoaSA9PSBNVEtfTUFDX05VTV9ERVNDU19U
T1RBTCAtIDEpKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRlc2MtPnN0YXR1cyB8PSBNVEtf
TUFDX0RFU0NfQklUX0VPUjsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIG10a19tYWNfcmlu
Z19pbml0KCZwcml2LT50eF9yaW5nLCBwcml2LT5kZXNjc19iYXNlLCAwKTsKPiA+ICsgICAgIG10
a19tYWNfcmluZ19pbml0KCZwcml2LT5yeF9yaW5nLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcHJpdi0+ZGVzY3NfYmFzZSArIE1US19NQUNfTlVNX1RYX0RFU0NTLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgTVRLX01BQ19OVU1fUlhfREVTQ1MpOwo+ID4gKwo+ID4gKyAgICAgLyog
U2V0IERNQSBwb2ludGVycy4gKi8KPiA+ICsgICAgIHZhbCA9ICh1bnNpZ25lZCBpbnQpcHJpdi0+
ZG1hX2FkZHI7Cj4KPiBZb3Ugd291bGQgcHJvYmFibHkgYWRkIGEgV0FSTl9PTigpIG9yIHNvbWV0
aGluZyB0aGF0IGNhdGNoZXMgdGhlIHVwcGVyCj4gMzItYml0cyBvZiB0aGUgZG1hX2FkZHIgYmVp
bmcgc2V0LCBzZWUgbXkgY29tbWVudCBhYm91dCB0aGUgRE1BIG1hc2sKPiBzZXR0aW5nLgo+CgpD
YW4gaXQgc3RpbGwgaGFwcGVuIGlmIEkgY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBvZiBkbWFfc2V0
X21hc2tfYW5kX2NvaGVyZW50KCk/Cgo+IFtzbmlwXQo+Cj4gPiArc3RhdGljIHZvaWQgbXRrX21h
Y190eF9jb21wbGV0ZV9hbGwoc3RydWN0IG10a19tYWNfcHJpdiAqcHJpdikKPiA+ICt7Cj4gPiAr
ICAgICBzdHJ1Y3QgbmV0X2RldmljZSAqbmRldiA9IHByaXZfdG9fbmV0ZGV2KHByaXYpOwo+ID4g
KyAgICAgc3RydWN0IG10a19tYWNfcmluZyAqcmluZyA9ICZwcml2LT50eF9yaW5nOwo+ID4gKyAg
ICAgaW50IHJldDsKPiA+ICsKPiA+ICsgICAgIGZvciAoOzspIHsKPiA+ICsgICAgICAgICAgICAg
bXRrX21hY19sb2NrKHByaXYpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICBpZiAoIW10a19tYWNf
cmluZ19kZXNjc19hdmFpbGFibGUocmluZykpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBt
dGtfbWFjX3VubG9jayhwcml2KTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+
ICsgICAgICAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgICAgICByZXQgPSBtdGtfbWFjX3R4
X2NvbXBsZXRlX29uZShwcml2KTsKPiA+ICsgICAgICAgICAgICAgaWYgKHJldCkgewo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIG10a19tYWNfdW5sb2NrKHByaXYpOwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGJyZWFrOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArCj4gPiArICAgICAgICAg
ICAgIGlmIChuZXRpZl9xdWV1ZV9zdG9wcGVkKG5kZXYpKQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIG5ldGlmX3dha2VfcXVldWUobmRldik7Cj4gPiArCj4gPiArICAgICAgICAgICAgIG10a19t
YWNfdW5sb2NrKHByaXYpOwo+ID4gKyAgICAgfQo+Cj4gV2hlcmUgZG8geW91IGluY3JlbWVudCB0
aGUgbmV0X2RldmljZSBzdGF0aXN0aWNzIHRvIGluZGljYXRlIHRoZSBieXRlcwo+IGFuZCBwYWNr
ZXRzIHRyYW5zbWl0dGVkPwo+CgpJIGRvbid0LiBJIHVzZSB0aGUgY291bnRlcnMgcHJvdmlkZWQg
YnkgSFcgZm9yIHRoYXQuCgo+IFtzbmlwXQo+Cj4gPiArICAgICBtdGtfbWFjX3NldF9tb2RlX3Jt
aWkocHJpdik7Cj4gPiArCj4gPiArICAgICBkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KGRldiwg
RE1BX0JJVF9NQVNLKDMyKSk7Cj4KPiBZb3VyIGNvZGUgYXNzdW1lcyB0aGF0IERNQSBhZGRyZXNz
ZXMgYXJlIG5vdCBnb2luZyB0byBiZSA+PSA0R0Igc28geW91Cj4gc2hvdWxkIGJlIGNoZWNraW5n
IHRoaXMgZnVuY3Rpb24ncyByZXR1cm4gY29kZSBhbmQgYWJvcnQgaGVyZSBvdGhlcndpc2UKPiB5
b3VyIGRyaXZlciB3aWxsIGZhaWwgaW4gc3VycHJpc2luZ2x5IGRpZmZpY3VsdCB3YXlzIHRvIGRl
YnVnLgoKU3VyZSwgdGhhbmtzLgoKQmFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
