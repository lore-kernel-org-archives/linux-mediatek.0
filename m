Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F36C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 14:14:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24623207D3
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 14:14:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oFB3xJ0t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AiijIRJ4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24623207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1Qw/cG2lbHU3GaprvzZhSgaE2jw2B1G2Uf4j2yX998=; b=oFB3xJ0tyNntEg
	goXHBPHPPFeHWV3sn/1MRoOqMEU9rslO28qpIwYH8k+n16jfcWseSIESIiWKGcnrL1QR9p58e4xAP
	Z8OEjKnf+OnWC1HH6P2pWRd4qtjhgHK9hDoM518X8UdmYxAFeNo0eS35tlQ/Cu49Ykr2rmn4e8AFl
	u/VJ4MuVSYQvJWRSGlmnBOmmD6purcUPoLePd1u+fNAwZ8teaEY1ai4meGVIMHBFd1TBSth/kgXVf
	KWKnfb+G2enBxvmhkBtPdGzJUHfsed+uDGrsAkXAFJPYTGdxC9egf0MmwACjHydRHwSBOOYQwm0jJ
	6Iz7JeieTKmqNeuZW41w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkpsg-0004W9-8M; Mon, 15 Jun 2020 14:14:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkpsU-0004N0-OU; Mon, 15 Jun 2020 14:14:24 +0000
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 160D02081A;
 Mon, 15 Jun 2020 14:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592230462;
 bh=JhVFELtq+HwraQ3txLeGpqQa4Z+hkTxpQj+aKFCyq6E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AiijIRJ4UelIyRo8/cpDKwnsCXTi60e0OblHB5dgoqQJFc1umpeUq0T4qsRSY8IQC
 AQ+DkaMeEuDi9q2oJr3+LU+F6cqqNPWBvfNZErGZ/st/OsfkVeEpi3FddDIr5HQUra
 /CeyW7hcqNKLdH+vYCM3mgiYQr8OYjr5gVgyKlqg=
Received: by mail-ej1-f51.google.com with SMTP id mb16so17624681ejb.4;
 Mon, 15 Jun 2020 07:14:22 -0700 (PDT)
X-Gm-Message-State: AOAM530qTkmFgk2UCQkP+hrvXBzjAfF4GbfWhapz9iT99k5EDkljOEZH
 8ru0ZPi6mwhq3Odt2UIz4w4vMYiY8Rm2aK0u4g==
X-Google-Smtp-Source: ABdhPJwz27xE0KprBz5Dxp0dk0PPSCniY+U8AR+9K4YZY3mAfmaN8khieD0hZijXEp2z/lCS73kpijNWPZrLwz9p0aI=
X-Received: by 2002:a17:906:3041:: with SMTP id
 d1mr26425865ejd.7.1592230460539; 
 Mon, 15 Jun 2020 07:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <1591698261-22639-1-git-send-email-neal.liu@mediatek.com>
 <1591698261-22639-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_8W7FLrjKbNt+WHXjsBzgn_E7n5stKjv94RBnF7ktVuiA@mail.gmail.com>
 <1592188994.18525.11.camel@mtkswgap22>
In-Reply-To: <1592188994.18525.11.camel@mtkswgap22>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 15 Jun 2020 22:14:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8EFYoAtuAugkYuG=F6kkbu3yeBnyoKBGTnHzPJKHQ5EQ@mail.gmail.com>
Message-ID: <CAAOTY_8EFYoAtuAugkYuG=F6kkbu3yeBnyoKBGTnHzPJKHQ5EQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: mediatek: devapc: add devapc-mt6873 driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_071422_840169_CB90A1D3 
X-CRM114-Status: GOOD (  22.05  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDbm
nIgxNeaXpSDpgLHkuIAg5LiK5Y2IMTA6NDPlr6vpgZPvvJoKPgo+IEhpIENodW4tS3VhbmcsCj4K
Pgo+IE9uIFN1biwgMjAyMC0wNi0xNCBhdCAxMToyNiArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90
ZToKPiA+IEhpLCBOZWFsOgo+ID4KPiA+IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+
IOaWvCAyMDIw5bm0NuaciDnml6Ug6YCx5LqMIOS4i+WNiDY6MjXlr6vpgZPvvJoKPiA+ID4KPiA+
ID4gTVQ2ODczIGJ1cyBmcmFicmljIHByb3ZpZGVzIFRydXN0Wm9uZSBzZWN1cml0eSBzdXBwb3J0
IGFuZCBkYXRhCj4gPiA+IHByb3RlY3Rpb24gdG8gcHJldmVudCBzbGF2ZXMgZnJvbSBiZWluZyBh
Y2Nlc3NlZCBieSB1bmV4cGVjdGVkCj4gPiA+IG1hc3RlcnMuCj4gPiA+IFRoZSBzZWN1cml0eSB2
aW9sYXRpb25zIGFyZSBsb2dnZWQgYW5kIHNlbnQgdG8gdGhlIHByb2Nlc3NvciBmb3IKPiA+ID4g
ZnVydGhlciBhbmFseXNpcyBvciBjb3VudGVybWVhc3VyZXMuCj4gPiA+Cj4gPiA+IEFueSBvY2N1
cnJlbmNlIG9mIHNlY3VyaXR5IHZpb2xhdGlvbiB3b3VsZCByYWlzZSBhbiBpbnRlcnJ1cHQsIGFu
ZAo+ID4gPiBpdCB3aWxsIGJlIGhhbmRsZWQgYnkgZGV2YXBjLW10Njg3MyBkcml2ZXIuIFRoZSB2
aW9sYXRpb24KPiA+ID4gaW5mb3JtYXRpb24gaXMgcHJpbnRlZCBpbiBvcmRlciB0byBmaW5kIHRo
ZSBtdXJkZXJlci4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTmVhbCBMaXUgPG5lYWwubGl1
QG1lZGlhdGVrLmNvbT4KPiA+ID4gLS0tCj4gPgo+ID4gW3NuaXBdCj4gPgo+ID4gPiArCj4gPiA+
ICsgICAgICAgLyogNTAgKi8KPiA+ID4gKyAgICAgICB7LTEsIC0xLCA1MCwgIk9PQl93YXlfZW4i
LCB0cnVlfSwKPiA+ID4gKyAgICAgICB7LTEsIC0xLCA1MSwgIk9PQl93YXlfZW4iLCB0cnVlfSwK
PiA+ID4gKyAgICAgICB7LTEsIC0xLCA1MiwgIk9PQl93YXlfZW4iLCB0cnVlfSwKPiA+ID4gKyAg
ICAgICB7LTEsIC0xLCA1MywgIk9PQl93YXlfZW4iLCB0cnVlfSwKPiA+ID4gKyAgICAgICB7LTEs
IC0xLCA1NCwgIk9PQl93YXlfZW4iLCB0cnVlfSwKPiA+ID4gKyAgICAgICB7LTEsIC0xLCA1NSwg
Ik9PQl93YXlfZW4iLCB0cnVlfSwKPiA+ID4gKyAgICAgICB7LTEsIC0xLCA1NiwgIkRlY29kZV9l
cnJvciIsIHRydWV9LAo+ID4gPiArICAgICAgIHstMSwgLTEsIDU3LCAiRGVjb2RlX2Vycm9yIiwg
dHJ1ZX0sCj4gPiA+ICsgICAgICAgey0xLCAtMSwgNTgsICJESVNQX1BXTSIsIGZhbHNlfSwKPiA+
ID4gKyAgICAgICB7LTEsIC0xLCA1OSwgIklNUF9JSUNfV1JBUCIsIGZhbHNlfSwKPiA+ID4gKwo+
ID4gPiArICAgICAgIC8qIDYwICovCj4gPiA+ICsgICAgICAgey0xLCAtMSwgNjAsICJERVZJQ0Vf
QVBDX1BFUklfUEFSX19BTyIsIGZhbHNlfSwKPiA+ID4gKyAgICAgICB7LTEsIC0xLCA2MSwgIkRF
VklDRV9BUENfUEVSSV9QQVJfUEROIiwgZmFsc2V9LAo+ID4KPiA+IFlvdSBkb2VzIG5vdCBwcm9j
ZXNzIHRoZSBpdGVtIHdob3NlIGVuYWJsZV92aW9faXJxIGlzIGZhbHNlLCBzbyBJCj4gPiB0aGlu
ayB5b3Ugc2hvdWxkIHJlbW92ZSB0aGVzZSBpdGVtcyBhbmQgcmVtb3ZlIGVuYWJsZV92aW9faXJx
IGJlY2F1c2UKPiA+IHRoZSByZXN0IGl0ZW0ncyBlbmFibGVfdmlvX2lycSB3b3VsZCBhbHdheXMg
YmUgdHJ1ZS4KPgo+IEluIHNvbWUgdXNlcnMsIHRoZXkgY2FuIGRlY2lkZSB3aGljaCBzbGF2ZXMg
dGhleSB3YW50IHRvIGVuYWJsZSBvcgo+IGRpc2FibGUgdmlvbGF0aW9uIGlycSBpbiBkaWZmZXJl
bnQgcHJvZHVjdC4gV2UgcmVtYWluIHRoaXMgcHJvcGVydHkgZm9yCj4gY29tcGF0aWJpbGl0eS4K
CkkgdGhpbmsgaW4gdXBzdHJlYW0gdmVyc2lvbiwgeW91IGNvdWxkIHN0aWxsIHJlbW92ZSBlbmFi
bGVfdmlvX2lycSBhbmQKcHJvY2VzcyBhbGwgaXRlbXMuIEZvciBkb3duc3RyZWFtIGNhc2UsIHVz
ZXJzIGNvdWxkIHJlbW92ZSBpdGVtcyB0aGV5CmRvZXMgbm90IGludGVyZXN0IGluLgoKPgo+ID4K
PiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgbXRrX2RldmljZV9udW0gbXRr
Njg3M19kZXZpY2VzX251bVtdID0gewo+ID4gPiArICAgICAgIHtTTEFWRV9UWVBFX0lORlJBLCBW
SU9fU0xBVkVfTlVNX0lORlJBfSwKPiA+ID4gKyAgICAgICB7U0xBVkVfVFlQRV9QRVJJLCBWSU9f
U0xBVkVfTlVNX1BFUkl9LAo+ID4gPiArICAgICAgIHtTTEFWRV9UWVBFX1BFUkkyLCBWSU9fU0xB
VkVfTlVNX1BFUkkyfSwKPiA+ID4gKyAgICAgICB7U0xBVkVfVFlQRV9QRVJJX1BBUiwgVklPX1NM
QVZFX05VTV9QRVJJX1BBUn0sCj4gPiA+ICt9Owo+ID4gPiArCj4gPiA+ICtzdGF0aWMgc3RydWN0
IFBFUklBWElfSURfSU5GTyBwZXJpX21pX2lkX3RvX21hc3RlcltdID0gewo+ID4gPiArICAgICAg
IHsiVEhFUk0yIiwgICAgICAgeyAwLCAwLCAwIH0gfSwKPiA+ID4gKyAgICAgICB7IlNQTSIsICAg
ICAgICAgIHsgMCwgMSwgMCB9IH0sCj4gPiA+ICsgICAgICAgeyJDQ1UiLCAgICAgICAgICB7IDAs
IDAsIDEgfSB9LAo+ID4gPiArICAgICAgIHsiVEhFUk0iLCAgICAgICAgeyAwLCAxLCAxIH0gfSwK
PiA+ID4gKyAgICAgICB7IlNQTV9EUkFNQyIsICAgIHsgMSwgMSwgMCB9IH0sCj4gPgo+ID4gVGhl
IGJpdHMgeyAxLCAxLCAwIH0gZXF1YWwgdG8gYSBudW1iZXIgMHgzLCBJIHRoaWluayB5b3Ugc2hv
dWxkIHVzZSBhCj4gPiBudW1iZXIgaW5zdGVhZCBvZiBiaXRzIGFuZCBldmVyeXRoaW5nIHdvdWxk
IGJlIG1vcmUgZWFzeS4KPgo+IFdlIHdvdWxkIGxpa2UgdG8ga2VlcCBpdCBiZWNhdXNlIHRoZSBi
aXQgdmFsdWUgY29udGFpbnMgbW9yZSB0aGFuIDAvMSwKPiBpdCBtaWdodCBiZSAnMicgaW4gc29t
ZSBjYXNlcy4gJzInIG1lYW5zIGl0IGNhbiBiZSAwIG9yIDEuIFRoaXMgdG90YWxseQo+IGJ5IGhh
cmR3YXJlIGRlc2lnbiAmIGltcGxlbWVudGF0aW9uLgoKVXBzdHJlYW0gdGhlIHBhdGNoIHRoYXQg
aGFzIGRvbnQtY2FyZS1iaXRzLCBvdGhlcndpc2UsIHVzZSBhIG51bWJlciBmb3IgdGhpcy4KRXZl
biB0aGVyZSBpcyBkb250LWNhcmUtYml0cywgSSBoYXZlIGEgYmV0dGVyIHdheSB0byBwcm9jZXNz
IGl0LiBIZXJlCmlzIGFuIGV4YW1wbGUgdGhhdCBoYXMgZG9udC1jYXJlLWJpdHM6CgorIHsiVGlu
eXN5cyIsICAgICAgICAgeyAwLCAxLCAwLCAwLCAyLCAyLCAyLCAyLCAyLCAyLCAwLCAwLCAwLCAw
IH0gfSwKCkkgY291bGQgdXNlIGEgeyB2YWx1ZSwgbWFzayB9IHBhaXIgZm9yIHRoaXMgY2FzZSwK
CnZhbHVlID0gMHgwMDAyOyAvKiB2YWx1ZSBmb3IgY2FyZSBiaXRzICovCm1hc2sgPSAweDNjMDI7
IC8qIG1hc2sgZm9yIGNhcmUgYml0cyAqLwoKU28gdGhlIGNvbXBhcmUgc3RhdGVtZW50IHdvdWxk
IGJlCgppZiAoKGJ1c19pZCAmIG1hc2spID09IHZhbHVlKQoKU28geW91IGNvdWxkIGdldCByaWQg
b2YgdGhlIHNlY29uZCBmb3ItbG9vcCBhbmQgcmVkdWNlIHRoZSBwcm9jZXNzaW5nCnRpbWUgaW4g
aXJxIGhhbmRsZXIuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
