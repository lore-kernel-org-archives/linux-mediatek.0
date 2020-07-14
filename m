Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E7EC433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 21:22:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FF3720658
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 21:22:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KNKDumtX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sqzwq+M5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FF3720658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tLBmSFByny/vpzjScdDhwRoOv6bF+3HKvbuEtkiMsuc=; b=KNKDumtXwTwTSw0haOcYtrcY5
	MMVcZMn/CIaeyjblSv76JGluNiT+crfHw8TopI4PC+5QMtehqpSsfv7Aqp7++v/NDV818coK7Mf6l
	LBWPFCT7Iqqbv9saRo860nQcg7U1+Vh5qkUZGJ4jVX2JdyjT90jN2OI5QnOpkAA/19HMmiqka7DQ9
	sJA6tie42J9Qxx0ZlCBdphxf4NvWScn398pPdCWS49NzxJ0Qb2plnFFOcGHdREc7Z+WpC8PbXuuH+
	8AK52eiELuTIcSRTcvDbI/15V5jj19tyi8MkGr8RxyYOT/sknasiNcySCqleoSiS5WSjrK7WP2bUg
	913sZrBMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvSNO-0006V8-B5; Tue, 14 Jul 2020 21:22:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvSNK-0006UE-UZ
 for linux-mediatek@lists.infradead.org; Tue, 14 Jul 2020 21:22:08 +0000
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20C8920658
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Jul 2020 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594761726;
 bh=6/0IFBrDgN+8wgO5IPBg2OK08s8EFa0Q0s+1t2jxIEs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Sqzwq+M5qpINY3ryeYqbJKyXKbAfIJSZjsraIgJPuiqrGAuJpiBqLzfQo3WpAvhJZ
 jOW2QLniw0o4eNZKWk3W1tI86QqhdJrP2ncgcJpONrvdoqrYB+QaIOoRsN0I/RsY8T
 cYrwxlMH2yk4Vsl3vD1NceN08Itf58/UoCS9FEE8=
Received: by mail-io1-f53.google.com with SMTP id k23so18842093iom.10
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Jul 2020 14:22:06 -0700 (PDT)
X-Gm-Message-State: AOAM530AUMczO9vujBJUsphZghfgT8Q+4JATA7Ck4OWktSg14EFyUf9m
 4wpm1VIHJFsr6BBm0IXg5grbyckaMtOe6TnnwM0=
X-Google-Smtp-Source: ABdhPJy0DEpJHLK/adZGJZAoEd8jIax+T8YXVVxEHDKQdp5sYGZQlXtfKHcAQCFkmg6Nt6kNwA/KOq+Tu4mzedsh8hw=
X-Received: by 2002:a05:6638:250f:: with SMTP id
 v15mr8038942jat.97.1594761725616; 
 Tue, 14 Jul 2020 14:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-11-lee.jones@linaro.org>
In-Reply-To: <20200713144930.1034632-11-lee.jones@linaro.org>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 14 Jul 2020 14:21:54 -0700
X-Gmail-Original-Message-ID: <CAGp9LzoQVPPPgoBVYeLTuTsWjS_Ug48wjTDh=Pk3KWdpFrLiaQ@mail.gmail.com>
Message-ID: <CAGp9LzoQVPPPgoBVYeLTuTsWjS_Ug48wjTDh=Pk3KWdpFrLiaQ@mail.gmail.com>
Subject: Re: [PATCH 10/25] pinctrl: mediatek: pinctrl-mtk-common-v2: Mark
 'mtk_default_register_base_names' as __maybe_unused
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_172207_181476_CE5C8538 
X-CRM114-Status: GOOD (  12.96  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgMTMsIDIwMjAgYXQgNzo0OSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IE5vdCBhbGwgc291cmNlZmlsZXMgd2hpY2ggZW5kIHVwIGluY2x1
ZGluZyBwaW5jdHJsLW10ay1jb21tb24tdjIuaCBtYWtlIHVzZQo+IG9mICdtdGtfZGVmYXVsdF9y
ZWdpc3Rlcl9iYXNlX25hbWVzJyBhbmQgdGhlcmUgaXMgbm93aGVyZSB3ZSBjYW4gcGxhY2UgdGhl
Cj4gZGVmaW5pdGlvbiB0byB2b2lkIHRoZSBuZWVkIGZvciBfX21heWJlX3VudXNlZCBleGNlcHQg
aXRzIG93biBoZWFkZXJmaWxlLAo+IHdoaWNoIHNlZW1zIGxpa2Ugb3ZlcmtpbGwuICBTbyBpbnN0
ZWFkIHdlIHRlbGwgdGhlIGNvbXBpbGVyIHRoYXQgaXQncyBva2F5Cj4gZm9yIGl0IHRvIGJlIHVu
dXNlZCBieSBzb21lIG9mIHRoZSBjb25zdW1lcnMuCj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9
MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPgo+ICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJp
dmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5jOjE5Ogo+ICBkcml2
ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmg6ODM6Mjc6IHdhcm5p
bmc6IOKAmG10a19kZWZhdWx0X3JlZ2lzdGVyX2Jhc2VfbmFtZXPigJkgZGVmaW5lZCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgODMgfCBzdGF0aWMgY29uc3QgY2hh
ciBjb25zdCBtdGtfZGVmYXVsdF9yZWdpc3Rlcl9iYXNlX25hbWVzW10gPSB7Cj4gIHwgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVy
cy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbW9vcmUuaDoyNSwKPiAgZnJvbSBkcml2ZXJzL3Bp
bmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tb29yZS5jOjEyOgo+ICBkcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmg6ODM6Mjc6IHdhcm5pbmc6IOKAmG10a19kZWZh
dWx0X3JlZ2lzdGVyX2Jhc2VfbmFtZXPigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWNvbnN0LXZhcmlhYmxlPV0KPiAgODMgfCBzdGF0aWMgY29uc3QgY2hhciBjb25zdCBtdGtfZGVm
YXVsdF9yZWdpc3Rlcl9iYXNlX25hbWVzW10gPSB7Cj4gIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgo+ICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9waW5jdHJsL21lZGlh
dGVrL3BpbmN0cmwtcGFyaXMuaDoyNywKPiAgZnJvbSBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsv
cGluY3RybC1wYXJpcy5jOjE1Ogo+ICBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1t
dGstY29tbW9uLXYyLmg6ODM6Mjc6IHdhcm5pbmc6IOKAmG10a19kZWZhdWx0X3JlZ2lzdGVyX2Jh
c2VfbmFtZXPigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxl
PV0KPiAgODMgfCBzdGF0aWMgY29uc3QgY2hhciBjb25zdCBtdGtfZGVmYXVsdF9yZWdpc3Rlcl9i
YXNlX25hbWVzW10gPSB7Cj4gIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICBJ
biBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFy
aXMuaDoyNywKPiAgZnJvbSBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstbXQ2
Nzk3Lmg6MTUsCj4gIGZyb20gZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2Nzk3
LmM6MTM6Cj4gIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24tdjIu
aDo4MzoyNzogd2FybmluZzog4oCYbXRrX2RlZmF1bHRfcmVnaXN0ZXJfYmFzZV9uYW1lc+KAmSBk
ZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+ICA4MyB8IHN0
YXRpYyBjb25zdCBjaGFyIGNvbnN0IG10a19kZWZhdWx0X3JlZ2lzdGVyX2Jhc2VfbmFtZXNbXSA9
IHsKPiAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gIEluIGZpbGUgaW5jbHVk
ZWQgZnJvbSBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1wYXJpcy5oOjI3LAo+ICBm
cm9tIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1tdDgxODMuaDoxMiwKPiAg
ZnJvbSBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDgxODMuYzo5Ogo+ICBkcml2
ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmg6ODM6Mjc6IHdhcm5p
bmc6IOKAmG10a19kZWZhdWx0X3JlZ2lzdGVyX2Jhc2VfbmFtZXPigJkgZGVmaW5lZCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgODMgfCBzdGF0aWMgY29uc3QgY2hh
ciBjb25zdCBtdGtfZGVmYXVsdF9yZWdpc3Rlcl9iYXNlX25hbWVzW10gPSB7Cj4gIHwgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVy
cy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuaDoyNywKPiAgZnJvbSBkcml2ZXJzL3Bp
bmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstbXQ2NzY1Lmg6MTIsCj4gIGZyb20gZHJpdmVycy9w
aW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXQ2NzY1LmM6MTA6Cj4gIGRyaXZlcnMvcGluY3RybC9t
ZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24tdjIuaDo4MzoyNzogd2FybmluZzog4oCYbXRrX2Rl
ZmF1bHRfcmVnaXN0ZXJfYmFzZV9uYW1lc+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVz
ZWQtY29uc3QtdmFyaWFibGU9XQo+ICA4MyB8IHN0YXRpYyBjb25zdCBjaGFyIGNvbnN0IG10a19k
ZWZhdWx0X3JlZ2lzdGVyX2Jhc2VfbmFtZXNbXSA9IHsKPiAgfCBefn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+Cj4KPiBDYzogU2VhbiBXYW5nIDxzZWFuLndhbmdAa2VybmVsLm9yZz4KPiBD
YzogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPiBDYzogbGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8
bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpUaG9zZSBNZWRpYVRlayBTb0NzIHdpdGggbXVsdGlwbGUg
cmVnaXN0ZXIgYmFzZXMgd291bGRuJ3QgcmVmZXIgdG8gdGhlIGFycmF5CkFja2VkLWJ5OiBTZWFu
IFdhbmcgPHNlYW4ud2FuZ0BrZXJuZWwub3JnPgoKPiAtLS0KPiAgZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5oIHwgMiArLQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
