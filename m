Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CEBC43463
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 07:22:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAEBF20C56
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 07:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zMwVJfZG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1hAU194"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAEBF20C56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wVHBRePCVLdbSVNdJwlxW2zOATXdz4p+UQpTpTIGBzA=; b=zMwVJfZG379YkoUGursRLFeFB
	sgCcZSYnevE6vBMXZUQC6WjBUgIj0EoIkNqTlHQQM+zxwKxeieRLA72WWVtSR4PPNnkIKhft56Iz+
	yMFE7vJwS7h0g7r6iaHMJD6CemZ30UpfVgOjVaKsq1+akvnlJj0Rw41uMrfptrhVHzuvxhL/CDpCX
	zSwuvb3nczm43S5f7pWnS1lBJP47xxN4zmHIKg54BuWAijmMLooMDvAYhpYyt5gPSwhoMgMyLQkwh
	/pBXbJLiXbyiGnVNQrKhjjVxZsKeSQDzpb1j4H0H3CLeFJkwzwgWs+N1lhdl41VV5cbRROUmFQOL+
	rgqBUVolQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJAic-0000L9-0F; Fri, 18 Sep 2020 07:22:06 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJAiY-0000JO-4g; Fri, 18 Sep 2020 07:22:03 +0000
Received: by mail-io1-xd44.google.com with SMTP id u6so5776310iow.9;
 Fri, 18 Sep 2020 00:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ju0TrxIs6FJ7xW3Z7H2xcox4RM+XbSHCtVVVywc+J3U=;
 b=D1hAU194FOUNNK3xN6BVA5UEh6cmkI4coh/bY3oUGjv2g5B1UPKStEj7aDce50HTSs
 reqEMLSZP3Si+OWqovmffFtQqGesmdeNnwY+kbtaSQugpsNRZgXOpJEGDiNRpihrjLG4
 hprwG222jyoiThqFbCLYtaqU8yqOnK6mJVQxxoYnw4TY/dh3cIYysMDls68PL+C8pExp
 kxfQlWxpu2r7bWWYpsi/hsIlq01sqEBOaUqG27Hnmdv13oYjw8tE5pDP4ZkygqqZ2C2E
 0imCirahv95O1NQDRZVfDPf+XoZ1A4/Ad4c6idUSuBoKof7KEtv21Uj2tOdBRRaiGCHi
 ILmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ju0TrxIs6FJ7xW3Z7H2xcox4RM+XbSHCtVVVywc+J3U=;
 b=GT0vCnxx+qltyqF5RYAu4DwR7ji6tppESYSR12jk/6MkaK91zbNUPColUvWbwPbg/S
 2N//agk9xsP5Gy5u+t8cnvZ2Z/Ax5mlLgKKq/xr41oiYmrmW4es0svxUKBybxI8d/2jO
 MYACleWp2e6vvfYbZFWR3kyaSa7DwZSbKIoqNddBJdrucxuz7Xy0/Ie3i/nwHMLRgKQg
 4+7HXrQhwKyKXXRmz1EvtGRRDskJGsCJxeVxCfDjwLXq0LEX5OnFP6+YlYZ7YYjQ79ep
 CZrs0NOw2fLDk1dePpxL38YtXuEQ76VKGiZWRMLx+6Su3Zg85hWG6AsJW3tIhSYbDS+Z
 Y54A==
X-Gm-Message-State: AOAM5328nQD7O2KQlj0BdxQhzDZbVHEgXDp4DEsUD+KQrsCDIn7z6UUN
 74rxMQn/ut6nxAQ3jTomKSi+mTNkRq6DcMiw1Qw=
X-Google-Smtp-Source: ABdhPJwqcSkueCL7FLHnuStVDeja8i2Qt8zOn2Xu7ScPuOCLAgvoImXvNC5T9JzSZr2CsBY3QpgPcmFL4IyV+AaVF6s=
X-Received: by 2002:a5e:8e0a:: with SMTP id a10mr26830525ion.200.1600413718688; 
 Fri, 18 Sep 2020 00:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <1600191369-28040-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600191369-28040-3-git-send-email-gene.chen.richtek@gmail.com>
 <20200917184256.71328701@archlinux>
In-Reply-To: <20200917184256.71328701@archlinux>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Fri, 18 Sep 2020 15:21:44 +0800
Message-ID: <CAE+NS35Pw-6UqcHPNOsUtW0GABPVEHfPineF81+qrS6A18HiyA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] Documentation: ABI: testing: mt6360: Add ADC sysfs
 guideline
To: Jonathan Cameron <jic23@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_032202_196829_91025641 
X-CRM114-Status: GOOD (  21.48  )
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
 benjamin.chao@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 pmeerw@pmeerw.net, knaack.h@gmx.de, Matthias Brugger <matthias.bgg@gmail.com>,
 Wilma.Wu@mediatek.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sm9uYXRoYW4gQ2FtZXJvbiA8amljMjNAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQ55pyIMTjml6Ug
6YCx5LqUIOS4iuWNiDE6NDPlr6vpgZPvvJoKPgo+IE9uIFdlZCwgMTYgU2VwIDIwMjAgMDE6MzY6
MDggKzA4MDAKPiBHZW5lIENoZW4gPGdlbmUuY2hlbi5yaWNodGVrQGdtYWlsLmNvbT4gd3JvdGU6
Cj4KPiA+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4KPiA+IEFk
ZCBBQkkgZG9jdW1lbnRhdGlvbiBmb3IgbXQ2MzYwIEFEQyBzeXNmcyBpbnRlcmZhY2VzLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+IFdv
dWxkIHlvdSBjb25zaWRlciB1c2luZyB0aGUgcHJvcG9zZWQgbGFiZWwgYXR0cmlidXRlIGZvciBj
aGFubmVscz8KPgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWlpby8yMDIwMDkxNjEz
MjExNS44MTc5NS0xLWNyaXN0aWFuLnBvcEBhbmFsb2cuY29tL1QvI3UKPgo+IEknbSBob3Bpbmcg
dGhhdCB3aWxsIHJlbW92ZSB0aGUgbmVlZCB0byBoYXZlIGV4dCBuYW1lIHVzZWQgaW4gdGhlIG1h
am9yaXR5IG9mCj4gY2FzZXMgYW5kIHdvdWxkIGxpa2UgdG8ga25vdyBpZiBpdCB3b3VsZCB3b3Jr
IGZvciB5b3U/Cj4gSXQgbWF5IG5vdCB3b3JrIGZvciB0aGlzIHBhcnRpY3VsYXIgY2FzZSBvZiBj
b3Vyc2UuCj4KPiBPdGhlciBjb21tZW50cyBpbmxpbmUuCj4KCmJlY2F1c2Ugb2YgQURDIGxheW91
dCBpcyBmaXhlZCwgSSBjYW4ndCBzd2l0Y2ggY2hhbm5lbCB0byBzcGVjaWZpYwpwdXJwb3NlIGZv
ciB1c2Vyc3BhY2UuCgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNm
cy1idXMtaWlvLWFkYy1tdDYzNjAgfCA4MyArKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1idXMtaWlvLWFkYy1tdDYzNjAKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1idXMtaWlvLWFkYy1t
dDYzNjAgYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy1paW8tYWRjLW10NjM2
MAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAuLjRiMWMyNzAKPiA+
IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMt
YnVzLWlpby1hZGMtbXQ2MzYwCj4gPiBAQCAtMCwwICsxLDgzIEBACj4gPiArV2hhdDogICAgICAg
ICAgICAgICAgL3N5cy9idXMvaWlvL2RldmljZXMvaWlvOmRldmljZVgvaW5fdm9sdGFnZV9VU0JJ
RF9pbnB1dAo+Cj4KPiBUaGUgbWl4dHVyZSBvZiBjYXNlIGlzIGEgYml0IHVnbHkuICBDb3VsZCB3
ZSBkbwo+IGluX3ZvbHRhZ2VfdXNiaW5faW5wdXQ/Cj4KCkFDSwoKPiA+ICtLZXJuZWxWZXJzaW9u
OiAgICAgICA1LjguMAo+ID4gK0NvbnRhY3Q6ICAgICBnZW5lX2NoZW5AcmljaHRlay5jb20KPiA+
ICtEZXNjcmlwdGlvbjoKPiA+ICsgICAgICAgICAgICAgSW5kaWNhdGVkIE1UNjM2MCBVU0JJRCBB
REMgd2hpY2ggY29ubmVjdGVkIHRvIGNvbm5lY3RvciBJRCBwaW4uCj4gPiArICAgICAgICAgICAg
IFJlYWRpbmcgcmV0dXJucyB2b2x0YWdlIGluIHVWCj4gPiArCj4gPiArV2hhdDogICAgICAgICAg
ICAgICAgL3N5cy9idXMvaWlvL2RldmljZXMvaWlvOmRldmljZVgvaW5fdm9sdGFnZV9WQlVTRElW
NV9pbnB1dAo+Cj4gPiArS2VybmVsVmVyc2lvbjogICAgICAgNS44LjAKPiA+ICtDb250YWN0OiAg
ICAgZ2VuZV9jaGVuQHJpY2h0ZWsuY29tCj4gPiArRGVzY3JpcHRpb246Cj4gPiArICAgICAgICAg
ICAgIEluZGljYXRlZCBNVDYzNjAgVkJVUyBBREMgd2l0aCBoaWdoIGFjY3VyYWN5Cj4gPiArICAg
ICAgICAgICAgIFJlYWRpbmcgcmV0dXJucyB2b2x0YWdlIGluIHVWCj4KPiBXaHkgd291bGQgd2Ug
ZXZlciByZWFkIHRoZSBsb3cgYWNjdXJhY3kgdmVyc2lvbj8KPgo+ID4gKwo+ID4gK1doYXQ6ICAg
ICAgICAgICAgICAgIC9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpkZXZpY2VYL2luX3ZvbHRhZ2Vf
VkJVU0RJVjJfaW5wdXQKPiA+ICtLZXJuZWxWZXJzaW9uOiAgICAgICA1LjguMAo+ID4gK0NvbnRh
Y3Q6ICAgICBnZW5lX2NoZW5AcmljaHRlay5jb20KPiA+ICtEZXNjcmlwdGlvbjoKPiA+ICsgICAg
ICAgICAgICAgSW5kaWNhdGVkIE1UNjM2MCBWQlVTIEFEQyB3aXRoIGxvdyBhY2N1cmFjeQo+ID4g
KyAgICAgICAgICAgICBSZWFkaW5nIHJldHVybnMgdm9sdGFnZSBpbiB1Vgo+ID4gKwo+ID4gK1do
YXQ6ICAgICAgICAgICAgICAgIC9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpkZXZpY2VYL2luX3Zv
bHRhZ2VfVlNZU19pbnB1dAo+ID4gK0tlcm5lbFZlcnNpb246ICAgICAgIDUuOC4wCj4gPiArQ29u
dGFjdDogICAgIGdlbmVfY2hlbkByaWNodGVrLmNvbQo+ID4gK0Rlc2NyaXB0aW9uOgo+ID4gKyAg
ICAgICAgICAgICBJbmRpY2F0ZWQgTVQ2MzYwIFZTWVMgQURDCj4gPiArICAgICAgICAgICAgIFJl
YWRpbmcgcmV0dXJucyB2b2x0YWdlIGluIHVWCj4gPiArCj4gPiArV2hhdDogICAgICAgICAgICAg
ICAgL3N5cy9idXMvaWlvL2RldmljZXMvaWlvOmRldmljZVgvaW5fdm9sdGFnZV9WQkFUX2lucHV0
Cj4gPiArS2VybmVsVmVyc2lvbjogICAgICAgNS44LjAKPiA+ICtDb250YWN0OiAgICAgZ2VuZV9j
aGVuQHJpY2h0ZWsuY29tCj4gPiArRGVzY3JpcHRpb246Cj4gPiArICAgICAgICAgICAgIEluZGlj
YXRlZCBNVDYzNjAgVkJBVCBBREMKPiA+ICsgICAgICAgICAgICAgUmVhZGluZyByZXR1cm5zIHZv
bHRhZ2UgaW4gdVYKPiA+ICsKPiA+ICtXaGF0OiAgICAgICAgICAgICAgICAvc3lzL2J1cy9paW8v
ZGV2aWNlcy9paW86ZGV2aWNlWC9pbl9jdXJyZW50X0lCVVNfaW5wdXQKPiA+ICtLZXJuZWxWZXJz
aW9uOiAgICAgICA1LjguMAo+ID4gK0NvbnRhY3Q6ICAgICBnZW5lX2NoZW5AcmljaHRlay5jb20K
PiA+ICtEZXNjcmlwdGlvbjoKPiA+ICsgICAgICAgICAgICAgSW5kaWNhdGVkIE1UNjM2MCBJQlVT
IEFEQwo+ID4gKyAgICAgICAgICAgICBSZWFkaW5nIHJldHVybnMgY3VycmVudCBpbiB1QQo+IEdp
dmVuIHZvbHRhZ2UgYW5kIGN1cnJlbnQgYXJlIGFscmVhZHkgY2xlYXIgZnJvbSB0aGUgY2hhbm5l
bCB0eXBlLAo+IGNvdWxkIHdlIGF2b2lkIHRoZSByZXBldGl0aW9uPwo+Cj4gaW5fY3VycmVudF9i
dXNfaW5wdXQgcGVyaGFwcz8KPgoKQUNLCgo+ID4gKwo+ID4gK1doYXQ6ICAgICAgICAgICAgICAg
IC9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpkZXZpY2VYL2luX2N1cnJlbnRfSUJBVF9pbnB1dAo+
ID4gK0tlcm5lbFZlcnNpb246ICAgICAgIDUuOC4wCj4gPiArQ29udGFjdDogICAgIGdlbmVfY2hl
bkByaWNodGVrLmNvbQo+ID4gK0Rlc2NyaXB0aW9uOgo+ID4gKyAgICAgICAgICAgICBJbmRpY2F0
ZWQgTVQ2MzYwIElCQVQgQURDCj4gPiArICAgICAgICAgICAgIFJlYWRpbmcgcmV0dXJucyBjdXJy
ZW50IGluIHVBCj4gPiArCj4gPiArV2hhdDogICAgICAgICAgICAgICAgL3N5cy9idXMvaWlvL2Rl
dmljZXMvaWlvOmRldmljZVgvaW5fdm9sdGFnZV9DSEdfVkREUF9pbnB1dAo+ID4gK0tlcm5lbFZl
cnNpb246ICAgICAgIDUuOC4wCj4gPiArQ29udGFjdDogICAgIGdlbmVfY2hlbkByaWNodGVrLmNv
bQo+ID4gK0Rlc2NyaXB0aW9uOgo+ID4gKyAgICAgICAgICAgICBJbmRpY2F0ZWQgTVQ2MzYwIENI
R19WRERQIEFEQwo+ID4gKyAgICAgICAgICAgICBSZWFkaW5nIHJldHVybnMgdm9sdGFnZSBpbiB1
Vgo+ID4gKwo+ID4gK1doYXQ6ICAgICAgICAgICAgICAgIC9zeXMvYnVzL2lpby9kZXZpY2VzL2lp
bzpkZXZpY2VYL2luX3RlbXBfVEVNUF9KQ19pbnB1dAo+ID4gK0tlcm5lbFZlcnNpb246ICAgICAg
IDUuOC4wCj4gPiArQ29udGFjdDogICAgIGdlbmVfY2hlbkByaWNodGVrLmNvbQo+ID4gK0Rlc2Ny
aXB0aW9uOgo+ID4gKyAgICAgICAgICAgICBJbmRpY2F0ZWQgTVQ2MzYwIElDIGp1bmN0aW9uIHRl
bXBlcmF0dXJlCj4gPiArICAgICAgICAgICAgIFJlYWRpbmcgcmV0dXJucyB0ZW1wZXJhdHVyZSBp
biBkZWdyZWUKPiA+ICsKPiA+ICtXaGF0OiAgICAgICAgICAgICAgICAvc3lzL2J1cy9paW8vZGV2
aWNlcy9paW86ZGV2aWNlWC9pbl92b2x0YWdlX1ZSRUZfVFNfaW5wdXQKPiA+ICtLZXJuZWxWZXJz
aW9uOiAgICAgICA1LjguMAo+ID4gK0NvbnRhY3Q6ICAgICBnZW5lX2NoZW5AcmljaHRlay5jb20K
PiA+ICtEZXNjcmlwdGlvbjoKPiA+ICsgICAgICAgICAgICAgSW5kaWNhdGVkIE1UNjM2MCBWUkVG
X1RTIEFEQwo+ID4gKyAgICAgICAgICAgICBSZWFkaW5nIHJldHVybnMgdm9sdGFnZSBpbiB1Vgo+
ID4gKwo+ID4gK1doYXQ6ICAgICAgICAgICAgICAgIC9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpk
ZXZpY2VYL2luX3ZvbHRhZ2VfVFNfaW5wdXQKPiA+ICtLZXJuZWxWZXJzaW9uOiAgICAgICA1Ljgu
MAo+ID4gK0NvbnRhY3Q6ICAgICBnZW5lX2NoZW5AcmljaHRlay5jb20KPiA+ICtEZXNjcmlwdGlv
bjoKPiA+ICsgICAgICAgICAgICAgSW5kaWNhdGVkIE1UNjM2MCBUUyBBREMKPiA+ICsgICAgICAg
ICAgICAgUmVhZGluZyByZXR1cm5zIHZvbHRhZ2UgaW4gdVYKPiA+ICsKPiA+ICtXaGF0OiAgICAg
ICAgICAgICAgICAvc3lzL2J1cy9paW8vZGV2aWNlcy9paW86ZGV2aWNlWC90aW1lc3RhbXAKPiA+
ICtLZXJuZWxWZXJzaW9uOiAgICAgICA1LjguMAo+ID4gK0NvbnRhY3Q6ICAgICBnZW5lX2NoZW5A
cmljaHRlay5jb20KPiA+ICtEZXNjcmlwdGlvbjoKPiA+ICsgICAgICAgICAgICAgSW5kaWNhdGVk
IE1UNjM2MCB0aW1lc3RhbXAKPiA+ICsgICAgICAgICAgICAgUmVhZGluZyByZXR1cm5zIGN1cnJl
bnQgdGltZXN0YW1wIGluIG1zCj4KPiBUaGF0J3MgYW4gb2RkIGJpdCBvZiBBQkkuICBXaHkgd291
bGQgd2Ugd2FudCB0byByZWFkIHRoZSBjdXJyZW50IHRpbWVzdGFtcCBmcm9tCj4gc3lzZnM/ICBU
aW1lc3RhbXBzIGluIElJTyBhbHNvIHRlbmQgdG8gYmUgaW4gbmFubyBzZWNvbmRzLgo+Cj4KPgo+
CgpBQ0ssIEkgd2lsbCByZW1vdmUgdGhpcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
