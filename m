Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884D7C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 08:21:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F3862311C
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 08:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F3862311C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HzIKe5uj5AXbxtrrHP2gatlGRNRnW8MdFfUljvBuqUA=; b=2k0bmcU6hLwQPJ7FLCe9Hq8TM
	S5hnU5RBvcEviPctXbIXXKF/bjSb2k9iKLhG5CPE2aWQYVbyzxJz0q3udYZlHJnK2/NGpCeS1DLZD
	rHz3gTcIK7vzvT7ghAqE67p4S51TVaD56aNMzeDq97q+oYup8W8oF2jWnCLVJvnkaExrH+AxguIAC
	zGYpx7hX+oPXntlEV4zEEpgqpKRN1qCfGnoRTjZwO98xEcTrqvt/cxEM3AUKIXGEqoqiIQatRxIwx
	iUoXCWvlxkiufsp2+CzqVSx6oEQE5g3nlCeaOHHocZAJGn0sL4g8FiknTPCn1ZllU8fHeW9fThJ9P
	6bLYW6F+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1mGS-0001OH-TF; Tue, 19 Jan 2021 08:21:24 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1mGP-0001Nc-Sz; Tue, 19 Jan 2021 08:21:22 +0000
Received: by mail-lf1-x132.google.com with SMTP id o17so27874427lfg.4;
 Tue, 19 Jan 2021 00:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NSnwppJM4RBea6rhgGGM4rDbGdYQwq/CEd9KX8c0D8U=;
 b=KKX43xE7CyF2OAHuoufRljedddmzgKGxjqqoHL0WRNIJh7aY09SxmQA88AnYR2a812
 hLSEHieWkcK1Qnyq4av0mhU1BT8vD0Voa8VgjhuwHdW3XO6OaPJymUgX5TlGksBxlJKH
 RfLZMBS8xRUo8/o4tLPTsIrdRI2qYz2odIaI6VLXwEsFi3N+YcGl1tcJdgXKg6LkFqSZ
 wbnOevLZ/MdE4bLfktG88R1UChwhJCyp+TxWrl/nCTg4rqCwar/PzykpOE8ZvJiaswVp
 1vDe+CDfuDEpfNdr8/u9Dk2Ff5RrCF0MtXcInHEn0yvJla/Mo/ltmKB0y0YcKXvNtywO
 7ciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NSnwppJM4RBea6rhgGGM4rDbGdYQwq/CEd9KX8c0D8U=;
 b=WTYQhl/ceHRA7vSXzjTVN2AbxegZFV+U4j1HnKve7HMHIJ5nJ6k2Nr4uX0FIOrqisO
 636P1e4I4klm6ktQOFbVvbVKL85zxnYKm2/RmxKFHOKHLeA2R6otbBkxTHaSvxHiKu0J
 Q8N+NMXU+CWoSne6GyEzTBFglIcVxH4EwOdkci/MZJi/KHcd04RnQAlel/AmWsSt8BgI
 5FOzmOtNtRkGJ8wl5AtfS3ModptYP7kwPWWha0/OrRzcvTeIEsAUsQTC8CNsEY91JCH7
 jKfkRChK9OmDilhz9OLshavtpxPB73E0Xt4NwGUDD4/Lt5Tzp8hekKo+UxHGN0pMiYPh
 MVeA==
X-Gm-Message-State: AOAM530Q133HKJz8m6vjrG+shS93M8QhsO9nHSXPZ9zJfFVhdZ2Wk6ST
 bsCbphv4NvAoRpuDythIc8kOgyo0MlwapJlN7xo=
X-Google-Smtp-Source: ABdhPJy7lFmGjvnX+2QdulCkZeQ6a/G+bDIiQs0QLBdf5QXWUq0IjnzT13t9tJXYesmgQNMi5ZCyMg4N+moiqesZvqc=
X-Received: by 2002:a19:ca5a:: with SMTP id h26mr1393081lfj.612.1611044480139; 
 Tue, 19 Jan 2021 00:21:20 -0800 (PST)
MIME-Version: 1.0
References: <1610720001-15300-1-git-send-email-u0084500@gmail.com>
 <3a4a88a9-f0e3-2b65-9df4-6c1d4e3f1c14@roeck-us.net>
 <1611041612.12761.9.camel@mhfsdcap03>
In-Reply-To: <1611041612.12761.9.camel@mhfsdcap03>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Tue, 19 Jan 2021 16:21:08 +0800
Message-ID: <CADiBU3-2DL9GOBesE6sZmWv_OeFNP5C5-TfrZ9tVkUXKSiV9wQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb typec: tcpci: mt6360: Add vsafe0v support and
 external vbus supply control
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_032121_973872_BC2BA0B8 
X-CRM114-Status: GOOD (  30.98  )
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
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDHmnIgx
OeaXpSDpgLHkuowg5LiL5Y2IMzozM+Wvq+mBk++8mgo+Cj4gT24gU3VuLCAyMDIxLTAxLTE3IGF0
IDA5OjQzIC0wODAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+ID4gT24gMS8xNS8yMSA2OjEzIEFN
LCBjeV9odWFuZyB3cm90ZToKPiA+ID4gRnJvbTogQ2hpWXVhbiBIdWFuZyA8Y3lfaHVhbmdAcmlj
aHRlay5jb20+Cj4gPiA+Cj4gPiA+IE1UNjM2MCBub3Qgc3VwcG9ydCBmb3IgVENQQyBjb21tYW5k
IHRvIGNvbnRyb2wgc291cmNlIGFuZCBzaW5rLgo+ID4KPiA+IGRvZXMgbm90Cj4gPgo+ID4gPiBV
c2VzIGV4dGVybmFsIDVWIHZidXMgcmVndWxhdG9yIGFzIHRoZSB2YnVzIHNvdXJjZSBjb250cm9s
Lgo+ID4gPgo+ID4gVXNlCj4gPgo+ID4gPiBBbHNvIGFkZHMgdGhlIGNhcGFiaWxpdHkgdG8gcmVw
b3J0IHZzYWZlMHYuCj4gPiA+Cj4gPiBhZGQKPiA+Cj4gPiBTbyBmYXIgdGhpcyBkcml2ZXIgd29y
a3Mgd2l0aG91dCByZWd1bGF0b3IuIFVubGVzcyBJIGFtIG1pc3Npbmcgc29tZXRoaW5nLAo+ID4g
dGhpcyBwYXRjaCBtYWtlcyByZWd1bGF0b3Igc3VwcG9ydCBtYW5kYXRvcnksIG1lYW5pbmcgZXhp
c3RpbmcgY29kZSB3aWxsIGZhaWwuCj4gSWYgZG9uJ3QgcHJvdmlkZSB2YnVzLXN1cHBseSBpbiBE
VFMsIHJlZ3VsYXRvciBmcmFtZXdvcmsgd2lsbCBwcm92aWRlIGEKPiBkdW1teSByZWd1bGF0b3Is
IHNvIHRoZSBjb2RlIHdpbGwgbm90IGZhaWwuCiBJbiB0aGUgbGFzdCByZXBseSwgSSB3aWxsIGNo
YW5nZSBmcm9tIHJlZ3VsYXRvcl9nZXQgdG8KcmVndWxhdG9yX2dldF9leGNsdXNpdmUsIGl0IHdp
bGwgcmV0dXJuIC1FTk9ERVYuClRoZSBJU19FUlIgY2FuIGNhdGNoIHRoaXMgc2l0dWF0aW9uLCBu
byBkdW1teSByZWd1bGF0b3Igd2lsbCBiZSByZXR1cm5lZC4KCkFuZCBhc3N1bWUgbm8gdmJ1cyA1
diBmb3Igc291cmNlICYgc25rIGF0dGFjaGVkLCBJdCB3aWxsIGNhdXNlIHR5cGVjCnN0YXRlIG1h
Y2hpbmUgcmVwZWF0ZWQgZnJvbQpkcnAgLT4gc3JjX2F0dGFjaF93YWl0IC0+IHNyY19hdHRhY2hl
ZCAtPiBQRF9UX1BTX1NPVVJDRV9vbiB0aW1lb3V0LgpJdCB3aWxsIGJlIHN0dWNrIGluIHRoZSBs
b29wIHVudGlsIHNuayBkZXRhY2hlZC4KCj4gPiBJIGFtIG5vdCBzdXJlIGlmIHRoYXQgaXMgYXBw
cm9wcmlhdGUvYWNjZXB0YWJsZS4gQ2FuIHdlIGJlIHN1cmUgdGhhdCB0aGlzIHdpbGwKPiA+IHdv
cmsgZm9yIGV4aXN0aW5nIHVzZXJzIG9mIHRoaXMgZHJpdmVyID8KPgo+ID4KPiA+IFRoYW5rcywK
PiA+IEd1ZW50ZXIKPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IENoaVl1YW4gSHVhbmcgPGN5X2h1
YW5nQHJpY2h0ZWsuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvdXNiL3R5cGVjL3RjcG0v
dGNwY2lfbXQ2MzYwLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2lfbXQ2MzYwLmMgYi9kcml2ZXJzL3VzYi90eXBl
Yy90Y3BtL3RjcGNpX210NjM2MC5jCj4gPiA+IGluZGV4IGYxYmQ5ZTAuLjBlZGY0YjYgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2lfbXQ2MzYwLmMKPiA+ID4g
KysrIGIvZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BjaV9tdDYzNjAuYwo+ID4gPiBAQCAtMTEs
NiArMTEsNyBAQAo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gPiA+ICAjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gPiA+ICAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+
Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+Cj4gPiA+ICAjaW5j
bHVkZSA8bGludXgvdXNiL3RjcG0uaD4KPiA+ID4KPiA+ID4gICNpbmNsdWRlICJ0Y3BjaS5oIgo+
ID4gPiBAQCAtMzYsNiArMzcsNyBAQCBzdHJ1Y3QgbXQ2MzYwX3RjcGNfaW5mbyB7Cj4gPiA+ICAg
ICBzdHJ1Y3QgdGNwY2lfZGF0YSB0ZGF0YTsKPiA+ID4gICAgIHN0cnVjdCB0Y3BjaSAqdGNwY2k7
Cj4gPiA+ICAgICBzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gPiA+ICsgICBzdHJ1Y3QgcmVndWxhdG9y
ICp2YnVzOwo+ID4gPiAgICAgaW50IGlycTsKPiA+ID4gIH07Cj4gPiA+Cj4gPiA+IEBAIC01MSw2
ICs1MywyNyBAQCBzdGF0aWMgaW5saW5lIGludCBtdDYzNjBfdGNwY193cml0ZTE2KHN0cnVjdCBy
ZWdtYXAgKnJlZ21hcCwKPiA+ID4gICAgIHJldHVybiByZWdtYXBfcmF3X3dyaXRlKHJlZ21hcCwg
cmVnLCAmdmFsLCBzaXplb2YodTE2KSk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICtzdGF0aWMgaW50
IG10NjM2MF90Y3BjX3NldF92YnVzKHN0cnVjdCB0Y3BjaSAqdGNwY2ksIHN0cnVjdCB0Y3BjaV9k
YXRhICpkYXRhLCBib29sIHNyYywgYm9vbCBzbmspCj4gPiA+ICt7Cj4gPiA+ICsgICBzdHJ1Y3Qg
bXQ2MzYwX3RjcGNfaW5mbyAqbXRpID0gY29udGFpbmVyX29mKGRhdGEsIHN0cnVjdCBtdDYzNjBf
dGNwY19pbmZvLCB0ZGF0YSk7Cj4gPiA+ICsgICBpbnQgcmV0Owo+ID4gPiArCj4gPiA+ICsgICAv
KiBUbyBjb3JyZWN0bHkgaGFuZGxlIHRoZSBhbHJlYWR5IGVuYWJsZWQgdmJ1cyBhbmQgZGlzYWJs
ZSBpdHMgc3VwcGx5IGZpcnN0ICovCj4gPiA+ICsgICBpZiAocmVndWxhdG9yX2lzX2VuYWJsZWQo
bXRpLT52YnVzKSkgewo+ID4gPiArICAgICAgICAgICByZXQgPSByZWd1bGF0b3JfZGlzYWJsZSht
dGktPnZidXMpOwo+ID4gPiArICAgICAgICAgICBpZiAocmV0KQo+ID4gPiArICAgICAgICAgICAg
ICAgICAgIHJldHVybiByZXQ7Cj4gPiA+ICsgICB9Cj4gPgo+ID4gSXMgaXQgcmVhbGx5IGEgZ29v
ZCBpZGVhIHRvIGRpc2FibGUgdmJ1cyBpZiBpdCBoYXBwZW5zIHRvIGJlIGFscmVhZHkgZW5hYmxl
ZAo+ID4gYW5kIHRoZXJlIGlzIChhbm90aGVyID8pIHJlcXVlc3QgdG8gZW5hYmxlIGl0ID8KPiA+
Cj4gPiA+ICsKPiA+ID4gKyAgIGlmIChzcmMpIHsKPiA+ID4gKyAgICAgICAgICAgcmV0ID0gcmVn
dWxhdG9yX2VuYWJsZShtdGktPnZidXMpOwo+ID4gPiArICAgICAgICAgICBpZiAocmV0KQo+ID4g
PiArICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+ICsgICB9Cj4gPiA+ICsKPiA+
ID4gKyAgIHJldHVybiAwOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICBzdGF0aWMgaW50IG10NjM2
MF90Y3BjX2luaXQoc3RydWN0IHRjcGNpICp0Y3BjaSwgc3RydWN0IHRjcGNpX2RhdGEgKnRkYXRh
KQo+ID4gPiAgewo+ID4gPiAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwID0gdGRhdGEtPnJlZ21h
cDsKPiA+ID4gQEAgLTEzOCw3ICsxNjEsMTMgQEAgc3RhdGljIGludCBtdDYzNjBfdGNwY19wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiAgICAgaWYgKG10aS0+aXJxIDwg
MCkKPiA+ID4gICAgICAgICAgICAgcmV0dXJuIG10aS0+aXJxOwo+ID4gPgo+ID4gPiArICAgbXRp
LT52YnVzID0gZGV2bV9yZWd1bGF0b3JfZ2V0KCZwZGV2LT5kZXYsICJ2YnVzIik7Cj4gPiA+ICsg
ICBpZiAoSVNfRVJSKG10aS0+dmJ1cykpCj4gPiA+ICsgICAgICAgICAgIHJldHVybiBQVFJfRVJS
KG10aS0+dmJ1cyk7Cj4gPiA+ICsKPiA+ID4gICAgIG10aS0+dGRhdGEuaW5pdCA9IG10NjM2MF90
Y3BjX2luaXQ7Cj4gPiA+ICsgICBtdGktPnRkYXRhLnNldF92YnVzID0gbXQ2MzYwX3RjcGNfc2V0
X3ZidXM7Cj4gPiA+ICsgICBtdGktPnRkYXRhLnZidXNfdnNhZmUwdiA9IDE7Cj4gPiA+ICAgICBt
dGktPnRjcGNpID0gdGNwY2lfcmVnaXN0ZXJfcG9ydCgmcGRldi0+ZGV2LCAmbXRpLT50ZGF0YSk7
Cj4gPiA+ICAgICBpZiAoSVNfRVJSKG10aS0+dGNwY2kpKSB7Cj4gPiA+ICAgICAgICAgICAgIGRl
dl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byByZWdpc3RlciB0Y3BjaSBwb3J0XG4iKTsKPiA+
ID4KPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
