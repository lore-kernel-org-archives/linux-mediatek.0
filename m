Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B76AC43464
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 08:05:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DCBF2100A
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 08:05:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OBALD3+n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DCBF2100A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=Huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VWenhejQ2LtQbqrjRhKJ0ed+1aiWIQKzxRuuuf9qgu0=; b=OBALD3+notcrH33wodr2x4RJe
	UrB9covHEOswTzbf6IM3E5r+20T167GB4MGAZXSLShDDqHAWJQ+ykAZ8v3nsh09WijboMx+orXiSp
	RxvLku+ZXxMZrNBoRoNxDGDvnpgKehrLYQT0qQR0LZVCC3vS12/Xgt0h/+gXvO2QfdHvblHJnriae
	YoowLkS7b1Qiy39WiBLypti0ZCAUV9/BqK6f7LU4JR32Kh5GmiVXQdHvgMxMLv06DzIhZyRR1xRwv
	8MzwA3qWpPPkKVwzVfZbJSB5O8PUvFcOQ/ayuKAbO43FjuZfAyBm+a7qqwhiM1aq8GZcr6IP7AjuP
	nJ4NXBZBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJBOP-00085z-Ff; Fri, 18 Sep 2020 08:05:17 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJBOH-00081y-SQ; Fri, 18 Sep 2020 08:05:11 +0000
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id D6418949A7C7C550C067;
 Fri, 18 Sep 2020 09:04:59 +0100 (IST)
Received: from localhost (10.52.125.116) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 18 Sep
 2020 09:04:59 +0100
Date: Fri, 18 Sep 2020 09:03:21 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v4 2/3] Documentation: ABI: testing: mt6360: Add ADC
 sysfs guideline
Message-ID: <20200918090321.00007f70@Huawei.com>
In-Reply-To: <CAE+NS35Pw-6UqcHPNOsUtW0GABPVEHfPineF81+qrS6A18HiyA@mail.gmail.com>
References: <1600191369-28040-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600191369-28040-3-git-send-email-gene.chen.richtek@gmail.com>
 <20200917184256.71328701@archlinux>
 <CAE+NS35Pw-6UqcHPNOsUtW0GABPVEHfPineF81+qrS6A18HiyA@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.125.116]
X-ClientProxiedBy: lhreml741-chm.china.huawei.com (10.201.108.191) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_040510_129157_C7F84F6C 
X-CRM114-Status: GOOD (  23.96  )
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
Cc: Gene Chen <gene_chen@richtek.com>, lars@metafoo.de,
 linux-iio@vger.kernel.org, Cristian Pop <cristian.pop@analog.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 pmeerw@pmeerw.net, knaack.h@gmx.de, Matthias Brugger <matthias.bgg@gmail.com>,
 Wilma.Wu@mediatek.com, Jonathan Cameron <jic23@kernel.org>,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxOCBTZXAgMjAyMCAxNToyMTo0NCArMDgwMApHZW5lIENoZW4gPGdlbmUuY2hlbi5y
aWNodGVrQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEpvbmF0aGFuIENhbWVyb24gPGppYzIzQGtlcm5l
bC5vcmc+IOaWvCAyMDIw5bm0OeaciDE45pelIOmAseS6lCDkuIrljYgxOjQz5a+r6YGT77yaCj4g
Pgo+ID4gT24gV2VkLCAxNiBTZXAgMjAyMCAwMTozNjowOCArMDgwMAo+ID4gR2VuZSBDaGVuIDxn
ZW5lLmNoZW4ucmljaHRla0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gIAo+ID4gPiBGcm9tOiBHZW5l
IENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+ID4KPiA+ID4gQWRkIEFCSSBkb2N1bWVu
dGF0aW9uIGZvciBtdDYzNjAgQURDIHN5c2ZzIGludGVyZmFjZXMuCj4gPiA+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPiAgCj4gPiBXb3VsZCB5
b3UgY29uc2lkZXIgdXNpbmcgdGhlIHByb3Bvc2VkIGxhYmVsIGF0dHJpYnV0ZSBmb3IgY2hhbm5l
bHM/Cj4gPgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaWlvLzIwMjAwOTE2MTMy
MTE1LjgxNzk1LTEtY3Jpc3RpYW4ucG9wQGFuYWxvZy5jb20vVC8jdQo+ID4KPiA+IEknbSBob3Bp
bmcgdGhhdCB3aWxsIHJlbW92ZSB0aGUgbmVlZCB0byBoYXZlIGV4dCBuYW1lIHVzZWQgaW4gdGhl
IG1ham9yaXR5IG9mCj4gPiBjYXNlcyBhbmQgd291bGQgbGlrZSB0byBrbm93IGlmIGl0IHdvdWxk
IHdvcmsgZm9yIHlvdT8KPiA+IEl0IG1heSBub3Qgd29yayBmb3IgdGhpcyBwYXJ0aWN1bGFyIGNh
c2Ugb2YgY291cnNlLgo+ID4KPiA+IE90aGVyIGNvbW1lbnRzIGlubGluZS4KPiA+ICAKPiAKPiBi
ZWNhdXNlIG9mIEFEQyBsYXlvdXQgaXMgZml4ZWQsIEkgY2FuJ3Qgc3dpdGNoIGNoYW5uZWwgdG8g
c3BlY2lmaWMKPiBwdXJwb3NlIGZvciB1c2Vyc3BhY2UuCgpUaGF0IHBhdGNoIHNldCBkb2Vzbid0
IGFsbG93IHVzZXJzcGFjZSB0byBjaGFuZ2UgdGhlIHB1cnBvc2UuIEl0IHByb3ZpZGVzCmEgKl9s
YWJlbCBhdHRyaWJ1dGUgZm9yIGVhY2ggY2hhbm5lbCB0byBhbGxvdyBmb3IgaWRlbnRpZmljYXRp
b24gb2YgdGhlIGNoYW5uZWwuClRoYXQgY2FuIGJlIHByb3ZpZGVkIGJ5IEFDUEkgLyBEVCBvciBj
YW4gYmUgcHJvdmlkZWQgYnkgdGhlIGRyaXZlciBpdHNlbGYuClRoZSBhZHZhbnRhZ2UgaXMgdGhh
dCBpdCByZW1vdmVzIHRoZSBuYXN0eSBmcmVlZm9ybSBwYXJzaW5nIHRoYXQgaXMgbmVlZGVkCnRv
IHdvcmsgb3V0IHRoZSBmaWxlbmFtZXMuCgo+IAo+ID4gPiAtLS0KPiA+ID4gIERvY3VtZW50YXRp
b24vQUJJL3Rlc3Rpbmcvc3lzZnMtYnVzLWlpby1hZGMtbXQ2MzYwIHwgODMgKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKykKPiA+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy1p
aW8tYWRjLW10NjM2MAo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9BQkkv
dGVzdGluZy9zeXNmcy1idXMtaWlvLWFkYy1tdDYzNjAgYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0
aW5nL3N5c2ZzLWJ1cy1paW8tYWRjLW10NjM2MAo+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gPiBpbmRleCAwMDAwMDAwLi40YjFjMjcwCj4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1idXMtaWlvLWFkYy1tdDYzNjAKPiA+
ID4gQEAgLTAsMCArMSw4MyBAQAo+ID4gPiArV2hhdDogICAgICAgICAgICAgICAgL3N5cy9idXMv
aWlvL2RldmljZXMvaWlvOmRldmljZVgvaW5fdm9sdGFnZV9VU0JJRF9pbnB1dCAgCj4gPgo+ID4K
PiA+IFRoZSBtaXh0dXJlIG9mIGNhc2UgaXMgYSBiaXQgdWdseS4gIENvdWxkIHdlIGRvCj4gPiBp
bl92b2x0YWdlX3VzYmluX2lucHV0Pwo+ID4gIAo+IAo+IEFDSwo+IAo+ID4gPiArS2VybmVsVmVy
c2lvbjogICAgICAgNS44LjAKPiA+ID4gK0NvbnRhY3Q6ICAgICBnZW5lX2NoZW5AcmljaHRlay5j
b20KPiA+ID4gK0Rlc2NyaXB0aW9uOgo+ID4gPiArICAgICAgICAgICAgIEluZGljYXRlZCBNVDYz
NjAgVVNCSUQgQURDIHdoaWNoIGNvbm5lY3RlZCB0byBjb25uZWN0b3IgSUQgcGluLgo+ID4gPiAr
ICAgICAgICAgICAgIFJlYWRpbmcgcmV0dXJucyB2b2x0YWdlIGluIHVWCj4gPiA+ICsKPiA+ID4g
K1doYXQ6ICAgICAgICAgICAgICAgIC9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpkZXZpY2VYL2lu
X3ZvbHRhZ2VfVkJVU0RJVjVfaW5wdXQgIAo+ID4gIAo+ID4gPiArS2VybmVsVmVyc2lvbjogICAg
ICAgNS44LjAKPiA+ID4gK0NvbnRhY3Q6ICAgICBnZW5lX2NoZW5AcmljaHRlay5jb20KPiA+ID4g
K0Rlc2NyaXB0aW9uOgo+ID4gPiArICAgICAgICAgICAgIEluZGljYXRlZCBNVDYzNjAgVkJVUyBB
REMgd2l0aCBoaWdoIGFjY3VyYWN5Cj4gPiA+ICsgICAgICAgICAgICAgUmVhZGluZyByZXR1cm5z
IHZvbHRhZ2UgaW4gdVYgIAo+ID4KPiA+IFdoeSB3b3VsZCB3ZSBldmVyIHJlYWQgdGhlIGxvdyBh
Y2N1cmFjeSB2ZXJzaW9uPwo+ID4gIAo+ID4gPiArCj4gPiA+ICtXaGF0OiAgICAgICAgICAgICAg
ICAvc3lzL2J1cy9paW8vZGV2aWNlcy9paW86ZGV2aWNlWC9pbl92b2x0YWdlX1ZCVVNESVYyX2lu
cHV0Cj4gPiA+ICtLZXJuZWxWZXJzaW9uOiAgICAgICA1LjguMAo+ID4gPiArQ29udGFjdDogICAg
IGdlbmVfY2hlbkByaWNodGVrLmNvbQo+ID4gPiArRGVzY3JpcHRpb246Cj4gPiA+ICsgICAgICAg
ICAgICAgSW5kaWNhdGVkIE1UNjM2MCBWQlVTIEFEQyB3aXRoIGxvdyBhY2N1cmFjeQo+ID4gPiAr
ICAgICAgICAgICAgIFJlYWRpbmcgcmV0dXJucyB2b2x0YWdlIGluIHVWCj4gPiA+ICsKPiA+ID4g
K1doYXQ6ICAgICAgICAgICAgICAgIC9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpkZXZpY2VYL2lu
X3ZvbHRhZ2VfVlNZU19pbnB1dAo+ID4gPiArS2VybmVsVmVyc2lvbjogICAgICAgNS44LjAKPiA+
ID4gK0NvbnRhY3Q6ICAgICBnZW5lX2NoZW5AcmljaHRlay5jb20KPiA+ID4gK0Rlc2NyaXB0aW9u
Ogo+ID4gPiArICAgICAgICAgICAgIEluZGljYXRlZCBNVDYzNjAgVlNZUyBBREMKPiA+ID4gKyAg
ICAgICAgICAgICBSZWFkaW5nIHJldHVybnMgdm9sdGFnZSBpbiB1Vgo+ID4gPiArCj4gPiA+ICtX
aGF0OiAgICAgICAgICAgICAgICAvc3lzL2J1cy9paW8vZGV2aWNlcy9paW86ZGV2aWNlWC9pbl92
b2x0YWdlX1ZCQVRfaW5wdXQKPiA+ID4gK0tlcm5lbFZlcnNpb246ICAgICAgIDUuOC4wCj4gPiA+
ICtDb250YWN0OiAgICAgZ2VuZV9jaGVuQHJpY2h0ZWsuY29tCj4gPiA+ICtEZXNjcmlwdGlvbjoK
PiA+ID4gKyAgICAgICAgICAgICBJbmRpY2F0ZWQgTVQ2MzYwIFZCQVQgQURDCj4gPiA+ICsgICAg
ICAgICAgICAgUmVhZGluZyByZXR1cm5zIHZvbHRhZ2UgaW4gdVYKPiA+ID4gKwo+ID4gPiArV2hh
dDogICAgICAgICAgICAgICAgL3N5cy9idXMvaWlvL2RldmljZXMvaWlvOmRldmljZVgvaW5fY3Vy
cmVudF9JQlVTX2lucHV0Cj4gPiA+ICtLZXJuZWxWZXJzaW9uOiAgICAgICA1LjguMAo+ID4gPiAr
Q29udGFjdDogICAgIGdlbmVfY2hlbkByaWNodGVrLmNvbQo+ID4gPiArRGVzY3JpcHRpb246Cj4g
PiA+ICsgICAgICAgICAgICAgSW5kaWNhdGVkIE1UNjM2MCBJQlVTIEFEQwo+ID4gPiArICAgICAg
ICAgICAgIFJlYWRpbmcgcmV0dXJucyBjdXJyZW50IGluIHVBICAKPiA+IEdpdmVuIHZvbHRhZ2Ug
YW5kIGN1cnJlbnQgYXJlIGFscmVhZHkgY2xlYXIgZnJvbSB0aGUgY2hhbm5lbCB0eXBlLAo+ID4g
Y291bGQgd2UgYXZvaWQgdGhlIHJlcGV0aXRpb24/Cj4gPgo+ID4gaW5fY3VycmVudF9idXNfaW5w
dXQgcGVyaGFwcz8KPiA+ICAKPiAKPiBBQ0sKPiAKPiA+ID4gKwo+ID4gPiArV2hhdDogICAgICAg
ICAgICAgICAgL3N5cy9idXMvaWlvL2RldmljZXMvaWlvOmRldmljZVgvaW5fY3VycmVudF9JQkFU
X2lucHV0Cj4gPiA+ICtLZXJuZWxWZXJzaW9uOiAgICAgICA1LjguMAo+ID4gPiArQ29udGFjdDog
ICAgIGdlbmVfY2hlbkByaWNodGVrLmNvbQo+ID4gPiArRGVzY3JpcHRpb246Cj4gPiA+ICsgICAg
ICAgICAgICAgSW5kaWNhdGVkIE1UNjM2MCBJQkFUIEFEQwo+ID4gPiArICAgICAgICAgICAgIFJl
YWRpbmcgcmV0dXJucyBjdXJyZW50IGluIHVBCj4gPiA+ICsKPiA+ID4gK1doYXQ6ICAgICAgICAg
ICAgICAgIC9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpkZXZpY2VYL2luX3ZvbHRhZ2VfQ0hHX1ZE
RFBfaW5wdXQKPiA+ID4gK0tlcm5lbFZlcnNpb246ICAgICAgIDUuOC4wCj4gPiA+ICtDb250YWN0
OiAgICAgZ2VuZV9jaGVuQHJpY2h0ZWsuY29tCj4gPiA+ICtEZXNjcmlwdGlvbjoKPiA+ID4gKyAg
ICAgICAgICAgICBJbmRpY2F0ZWQgTVQ2MzYwIENIR19WRERQIEFEQwo+ID4gPiArICAgICAgICAg
ICAgIFJlYWRpbmcgcmV0dXJucyB2b2x0YWdlIGluIHVWCj4gPiA+ICsKPiA+ID4gK1doYXQ6ICAg
ICAgICAgICAgICAgIC9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpkZXZpY2VYL2luX3RlbXBfVEVN
UF9KQ19pbnB1dAo+ID4gPiArS2VybmVsVmVyc2lvbjogICAgICAgNS44LjAKPiA+ID4gK0NvbnRh
Y3Q6ICAgICBnZW5lX2NoZW5AcmljaHRlay5jb20KPiA+ID4gK0Rlc2NyaXB0aW9uOgo+ID4gPiAr
ICAgICAgICAgICAgIEluZGljYXRlZCBNVDYzNjAgSUMganVuY3Rpb24gdGVtcGVyYXR1cmUKPiA+
ID4gKyAgICAgICAgICAgICBSZWFkaW5nIHJldHVybnMgdGVtcGVyYXR1cmUgaW4gZGVncmVlCj4g
PiA+ICsKPiA+ID4gK1doYXQ6ICAgICAgICAgICAgICAgIC9zeXMvYnVzL2lpby9kZXZpY2VzL2lp
bzpkZXZpY2VYL2luX3ZvbHRhZ2VfVlJFRl9UU19pbnB1dAo+ID4gPiArS2VybmVsVmVyc2lvbjog
ICAgICAgNS44LjAKPiA+ID4gK0NvbnRhY3Q6ICAgICBnZW5lX2NoZW5AcmljaHRlay5jb20KPiA+
ID4gK0Rlc2NyaXB0aW9uOgo+ID4gPiArICAgICAgICAgICAgIEluZGljYXRlZCBNVDYzNjAgVlJF
Rl9UUyBBREMKPiA+ID4gKyAgICAgICAgICAgICBSZWFkaW5nIHJldHVybnMgdm9sdGFnZSBpbiB1
Vgo+ID4gPiArCj4gPiA+ICtXaGF0OiAgICAgICAgICAgICAgICAvc3lzL2J1cy9paW8vZGV2aWNl
cy9paW86ZGV2aWNlWC9pbl92b2x0YWdlX1RTX2lucHV0Cj4gPiA+ICtLZXJuZWxWZXJzaW9uOiAg
ICAgICA1LjguMAo+ID4gPiArQ29udGFjdDogICAgIGdlbmVfY2hlbkByaWNodGVrLmNvbQo+ID4g
PiArRGVzY3JpcHRpb246Cj4gPiA+ICsgICAgICAgICAgICAgSW5kaWNhdGVkIE1UNjM2MCBUUyBB
REMKPiA+ID4gKyAgICAgICAgICAgICBSZWFkaW5nIHJldHVybnMgdm9sdGFnZSBpbiB1Vgo+ID4g
PiArCj4gPiA+ICtXaGF0OiAgICAgICAgICAgICAgICAvc3lzL2J1cy9paW8vZGV2aWNlcy9paW86
ZGV2aWNlWC90aW1lc3RhbXAKPiA+ID4gK0tlcm5lbFZlcnNpb246ICAgICAgIDUuOC4wCj4gPiA+
ICtDb250YWN0OiAgICAgZ2VuZV9jaGVuQHJpY2h0ZWsuY29tCj4gPiA+ICtEZXNjcmlwdGlvbjoK
PiA+ID4gKyAgICAgICAgICAgICBJbmRpY2F0ZWQgTVQ2MzYwIHRpbWVzdGFtcAo+ID4gPiArICAg
ICAgICAgICAgIFJlYWRpbmcgcmV0dXJucyBjdXJyZW50IHRpbWVzdGFtcCBpbiBtcyAgCj4gPgo+
ID4gVGhhdCdzIGFuIG9kZCBiaXQgb2YgQUJJLiAgV2h5IHdvdWxkIHdlIHdhbnQgdG8gcmVhZCB0
aGUgY3VycmVudCB0aW1lc3RhbXAgZnJvbQo+ID4gc3lzZnM/ICBUaW1lc3RhbXBzIGluIElJTyBh
bHNvIHRlbmQgdG8gYmUgaW4gbmFubyBzZWNvbmRzLgo+ID4KPiA+Cj4gPgo+ID4gIAo+IAo+IEFD
SywgSSB3aWxsIHJlbW92ZSB0aGlzLgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
