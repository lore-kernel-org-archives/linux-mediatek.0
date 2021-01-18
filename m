Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D84C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 08:29:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A69F22571
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 08:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A69F22571
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nCgjuGHXDKyawNerE+D/JdhLdXyePCGqHGKuQItBw1Q=; b=tgaHshevot6fIYacBu5fQgeKa
	t1h8IMiR78PusC3L65KXeKSYQIXvp2ppv4yBWJGyzgeIuWsjGRBtr6UMV89i1aX+1wLljC8bFQeFd
	Z4D8tjkO/TKE+DMTR1UFOUnC2wNP/HD+kBMZ5pUg3MRSobqFONh1Lo2uqzW6H3hA+C0bbQr2ZiIVQ
	sSQZ4H7CWnm+wflzYWznSBerrpczvPOWczPmUu4SHum4G8dYOIe9JO3B23Og7LqcwItAgKD++orYm
	U3ZoPiybOl8rwq1l9w8b0U9kJmgyQbjkCuTURcArtbxkYlPWpBnCrXt983IHGI3+u7ZinZ5+hXCRT
	7kjTRyiWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Pu8-0000LM-4N; Mon, 18 Jan 2021 08:28:52 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Pu4-0000Iw-EE; Mon, 18 Jan 2021 08:28:49 +0000
Received: by mail-lf1-x131.google.com with SMTP id o10so22774769lfl.13;
 Mon, 18 Jan 2021 00:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KLqGbxNa2Y//bSC/m+YoN3yy9E8IE8S0pxgJYj58niI=;
 b=Tfe7yWK4zDgBHMzIL7TOZmcC9zEBk86gzt6EuxaaK+Ya2f8nnOhvclMuu/30j1XSiL
 odccw1S4tfuCzYqsW9+c8tiQDO/Tl+gKvHR4mAMpnxAlKGSJyc+EdP72IvPJ1bHId9rl
 wzsXvsD5i7PeY0MrYhJQiHBFuRmNhqw34635KhB9eBd2qOZ0QXcrZYzaQBToN4ShM+YS
 qxWWwqOvZADYcDgzw3YOkPUrMyXdG9ozdXmdbK0YQlSDbnLJNWSI5HIfPzDjWd64F8nn
 mf6KsiE2zuhDwMSd/kGAdsklAGp/Vwu8Y5o/ChUSF9A7hx/sTIarKpaE7v5J6UVUCg1X
 MrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KLqGbxNa2Y//bSC/m+YoN3yy9E8IE8S0pxgJYj58niI=;
 b=VH0hKOvDLlJundypFaau/zAkEh/UbVweKR67U1STvskyZPVtASgH58Oy5LHGK2KwVv
 T6+ANQab2FZxQTC9jGvOIuOgZ8MIBhKtRcj8sotlHgmOfJ/1OBm507DqUVoiodoQ/yfy
 mKRE9EnPrbgh4WLIH8k9FSGexgBZSBJP1wFSvxmXVVe8kUPhr0NkcuaV0LPwVdCmRvF1
 4MIeUEqmenk1zZamGTNlQvJEp+frSrcXPalf71HOAXpAdguDlppNwjI0AJP9m9XOeHqh
 +btpWDyhB0Q7AdrFMY9z3FrioQVZWdPdfN6i3S//JI6yyLHx50w8ylw3XgpD1lPF3fV4
 l1QQ==
X-Gm-Message-State: AOAM533itRiFbTqSCLO+P/sKOPbg5TDhYIzJKjtGj4G4tPu9/WqDH3XT
 fJRzolwj2/n9+iHv1Uz+XFGsI4+fMwbScFZ16d0=
X-Google-Smtp-Source: ABdhPJzQnwoABZVMam3MBtsrDW5CKBbIRNTR8LDPVSYlnnj70IT1dmoQYSz9szEAPTqj0/sUuSA1tQIbOLR4AZgLZKk=
X-Received: by 2002:a19:991:: with SMTP id 139mr10815362lfj.637.1610958525450; 
 Mon, 18 Jan 2021 00:28:45 -0800 (PST)
MIME-Version: 1.0
References: <1610720001-15300-1-git-send-email-u0084500@gmail.com>
 <3a4a88a9-f0e3-2b65-9df4-6c1d4e3f1c14@roeck-us.net>
In-Reply-To: <3a4a88a9-f0e3-2b65-9df4-6c1d4e3f1c14@roeck-us.net>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Mon, 18 Jan 2021 16:28:34 +0800
Message-ID: <CADiBU38g_E+iH4jTwQfPvJh4=WRH4vzQ12oubGg47gj+CpTU0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb typec: tcpci: mt6360: Add vsafe0v support and
 external vbus supply control
To: Guenter Roeck <linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_032848_480016_98AD33AE 
X-CRM114-Status: GOOD (  30.15  )
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
Cc: gene_chen@richtek.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, cy_huang <cy_huang@richtek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

R3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiDmlrwgMjAyMeW5tDHmnIgxOOaXpSDp
gLHkuIAg5LiK5Y2IMTo0M+Wvq+mBk++8mgo+Cj4gT24gMS8xNS8yMSA2OjEzIEFNLCBjeV9odWFu
ZyB3cm90ZToKPiA+IEZyb206IENoaVl1YW4gSHVhbmcgPGN5X2h1YW5nQHJpY2h0ZWsuY29tPgo+
ID4KPiA+IE1UNjM2MCBub3Qgc3VwcG9ydCBmb3IgVENQQyBjb21tYW5kIHRvIGNvbnRyb2wgc291
cmNlIGFuZCBzaW5rLgo+Cj4gZG9lcyBub3QKPgpBY2sKPiA+IFVzZXMgZXh0ZXJuYWwgNVYgdmJ1
cyByZWd1bGF0b3IgYXMgdGhlIHZidXMgc291cmNlIGNvbnRyb2wuCj4gPgo+IFVzZQo+CkFjawo+
ID4gQWxzbyBhZGRzIHRoZSBjYXBhYmlsaXR5IHRvIHJlcG9ydCB2c2FmZTB2Lgo+ID4KPiBhZGQK
PgpBY2sKPiBTbyBmYXIgdGhpcyBkcml2ZXIgd29ya3Mgd2l0aG91dCByZWd1bGF0b3IuIFVubGVz
cyBJIGFtIG1pc3Npbmcgc29tZXRoaW5nLAo+IHRoaXMgcGF0Y2ggbWFrZXMgcmVndWxhdG9yIHN1
cHBvcnQgbWFuZGF0b3J5LCBtZWFuaW5nIGV4aXN0aW5nIGNvZGUgd2lsbCBmYWlsLgo+IEkgYW0g
bm90IHN1cmUgaWYgdGhhdCBpcyBhcHByb3ByaWF0ZS9hY2NlcHRhYmxlLiBDYW4gd2UgYmUgc3Vy
ZSB0aGF0IHRoaXMgd2lsbAo+IHdvcmsgZm9yIGV4aXN0aW5nIHVzZXJzIG9mIHRoaXMgZHJpdmVy
ID8KPgpZZXMsIEkgYWxyZWFkeSBjaGVja2VkIGFsbCB0aGUgc3JjL3NuayBmdW5jdGlvbmFsaXR5
IGJhc2VkIG9uICB0aGUKbGF0ZXN0IHR5cGVjIGNvZGUuCkl0J2xsIGJlIGNvbW1vbiBmb3Igb3Vy
IFRDUEMuIEl0IGRpZG4ndCBzdXBwb3J0IGZvciBUQ1BDIGNvbW1hbmQuCkZyb20gdGhlIHJlY2Vu
dCBwYXRjaGVzLCBhY3R1YWxseSwgSSBoYXZlIHRoZSBsb2NhbCBjaGFuZ2UgdG8gdGVzdCB0aGUK
c3JjIGNhcGFiaWxpdHkuCkJ1dCBJIGRpZG4ndCBzdWJtaXQgaXQuIEl0J3MgYWxtb3N0IHRoZSBz
YW1lIHRvIGFkZCBzZXRfdmJ1cyBjYWxsYmFjay4KVGhhdCdzIHdoeSBJIHN1Ym1pdCB0aGlzIGNo
YW5nZSBhZnRlciB0Y3BjaSAnc2V0X3ZidXMgY2FsbGJhY2snIGlzIGFkZGVkLgoKPiBUaGFua3Ms
Cj4gR3VlbnRlcgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGlZdWFuIEh1YW5nIDxjeV9odWFuZ0By
aWNodGVrLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2lfbXQ2
MzYwLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAyOSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3R5
cGVjL3RjcG0vdGNwY2lfbXQ2MzYwLmMgYi9kcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcGNpX210
NjM2MC5jCj4gPiBpbmRleCBmMWJkOWUwLi4wZWRmNGI2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy91c2IvdHlwZWMvdGNwbS90Y3BjaV9tdDYzNjAuYwo+ID4gKysrIGIvZHJpdmVycy91c2IvdHlw
ZWMvdGNwbS90Y3BjaV9tdDYzNjAuYwo+ID4gQEAgLTExLDYgKzExLDcgQEAKPiA+ICAjaW5jbHVk
ZSA8bGludXgvb2YuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4g
PiAgI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9yZWd1bGF0
b3IvY29uc3VtZXIuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvdXNiL3RjcG0uaD4KPiA+Cj4gPiAg
I2luY2x1ZGUgInRjcGNpLmgiCj4gPiBAQCAtMzYsNiArMzcsNyBAQCBzdHJ1Y3QgbXQ2MzYwX3Rj
cGNfaW5mbyB7Cj4gPiAgICAgICBzdHJ1Y3QgdGNwY2lfZGF0YSB0ZGF0YTsKPiA+ICAgICAgIHN0
cnVjdCB0Y3BjaSAqdGNwY2k7Cj4gPiAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gPiArICAg
ICBzdHJ1Y3QgcmVndWxhdG9yICp2YnVzOwo+ID4gICAgICAgaW50IGlycTsKPiA+ICB9Owo+ID4K
PiA+IEBAIC01MSw2ICs1MywyNyBAQCBzdGF0aWMgaW5saW5lIGludCBtdDYzNjBfdGNwY193cml0
ZTE2KHN0cnVjdCByZWdtYXAgKnJlZ21hcCwKPiA+ICAgICAgIHJldHVybiByZWdtYXBfcmF3X3dy
aXRlKHJlZ21hcCwgcmVnLCAmdmFsLCBzaXplb2YodTE2KSk7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0
aWMgaW50IG10NjM2MF90Y3BjX3NldF92YnVzKHN0cnVjdCB0Y3BjaSAqdGNwY2ksIHN0cnVjdCB0
Y3BjaV9kYXRhICpkYXRhLCBib29sIHNyYywgYm9vbCBzbmspCj4gPiArewo+ID4gKyAgICAgc3Ry
dWN0IG10NjM2MF90Y3BjX2luZm8gKm10aSA9IGNvbnRhaW5lcl9vZihkYXRhLCBzdHJ1Y3QgbXQ2
MzYwX3RjcGNfaW5mbywgdGRhdGEpOwo+ID4gKyAgICAgaW50IHJldDsKPiA+ICsKPiA+ICsgICAg
IC8qIFRvIGNvcnJlY3RseSBoYW5kbGUgdGhlIGFscmVhZHkgZW5hYmxlZCB2YnVzIGFuZCBkaXNh
YmxlIGl0cyBzdXBwbHkgZmlyc3QgKi8KPiA+ICsgICAgIGlmIChyZWd1bGF0b3JfaXNfZW5hYmxl
ZChtdGktPnZidXMpKSB7Cj4gPiArICAgICAgICAgICAgIHJldCA9IHJlZ3VsYXRvcl9kaXNhYmxl
KG10aS0+dmJ1cyk7Cj4gPiArICAgICAgICAgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsgICAgIH0KPgo+IElzIGl0IHJlYWxseSBhIGdvb2Qg
aWRlYSB0byBkaXNhYmxlIHZidXMgaWYgaXQgaGFwcGVucyB0byBiZSBhbHJlYWR5IGVuYWJsZWQK
PiBhbmQgdGhlcmUgaXMgKGFub3RoZXIgPykgcmVxdWVzdCB0byBlbmFibGUgaXQgPwo+Clllcywg
Zm9yICB0aGUgc3RhdGUgY2hhbmdlIGZyb20gc3JjX2F0dGFjaF93YWl0IHRvIHNyY19hdHRhY2gs
Ckl0IG5lZWQgdG8gbWVldCB0aGUgcmVxdWlyZW1lbnQgdGhhdCAgdGhlIHZidXMgaXMgYXQgdnNh
ZmUwdi4KU28gdG8gZGlzYWJsZSBpdCBmaXJzdCBpcyBuZWVkZWQuCkFuZCB0byBwcmV2ZW50IG90
aGVyIHVzZXJzIGZyb20gZW5hYmxpbmcvZGlzYWJsaW5nIGV4dGVybmFsIHZidXMKcmVndWxhdG9y
IGluIGFueSBjYXNlLgpJIHRoaW5rIHdlIG1heSBjaGFuZ2UgcmVndWxhdG9yX2dldCAgdG8gJ3Jl
Z3VsYXRvcl9nZXRfZXhjbHVzaXZlJy4KRnJvbSB0aGUgZGVzaWduLCA1diByZWd1bGF0b3Igb25s
eSBjYW4gYmUgY29udHJvbGxlZCB2aWEgdHlwZWMgZnJhbWV3b3JrLgpJZiBvdGhlciB1c2VyIHRv
dWNoIGl0LCBpdCdsbCBhZmZlY3QgdGhlIHR5cGVjIHN0YXRlIHRyYW5zaXRpb24uCj4gPiArCj4g
PiArICAgICBpZiAoc3JjKSB7Cj4gPiArICAgICAgICAgICAgIHJldCA9IHJlZ3VsYXRvcl9lbmFi
bGUobXRpLT52YnVzKTsKPiA+ICsgICAgICAgICAgICAgaWYgKHJldCkKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgcmV0dXJu
IDA7Cj4gPiArfQo+ID4gKwo+ID4gIHN0YXRpYyBpbnQgbXQ2MzYwX3RjcGNfaW5pdChzdHJ1Y3Qg
dGNwY2kgKnRjcGNpLCBzdHJ1Y3QgdGNwY2lfZGF0YSAqdGRhdGEpCj4gPiAgewo+ID4gICAgICAg
c3RydWN0IHJlZ21hcCAqcmVnbWFwID0gdGRhdGEtPnJlZ21hcDsKPiA+IEBAIC0xMzgsNyArMTYx
LDEzIEBAIHN0YXRpYyBpbnQgbXQ2MzYwX3RjcGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPiA+ICAgICAgIGlmIChtdGktPmlycSA8IDApCj4gPiAgICAgICAgICAgICAgIHJl
dHVybiBtdGktPmlycTsKPiA+Cj4gPiArICAgICBtdGktPnZidXMgPSBkZXZtX3JlZ3VsYXRvcl9n
ZXQoJnBkZXYtPmRldiwgInZidXMiKTsKPiA+ICsgICAgIGlmIChJU19FUlIobXRpLT52YnVzKSkK
PiA+ICsgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIobXRpLT52YnVzKTsKPiA+ICsKPiA+ICAg
ICAgIG10aS0+dGRhdGEuaW5pdCA9IG10NjM2MF90Y3BjX2luaXQ7Cj4gPiArICAgICBtdGktPnRk
YXRhLnNldF92YnVzID0gbXQ2MzYwX3RjcGNfc2V0X3ZidXM7Cj4gPiArICAgICBtdGktPnRkYXRh
LnZidXNfdnNhZmUwdiA9IDE7Cj4gPiAgICAgICBtdGktPnRjcGNpID0gdGNwY2lfcmVnaXN0ZXJf
cG9ydCgmcGRldi0+ZGV2LCAmbXRpLT50ZGF0YSk7Cj4gPiAgICAgICBpZiAoSVNfRVJSKG10aS0+
dGNwY2kpKSB7Cj4gPiAgICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0
byByZWdpc3RlciB0Y3BjaSBwb3J0XG4iKTsKPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
