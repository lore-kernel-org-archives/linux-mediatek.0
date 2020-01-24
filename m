Return-Path: <SRS0=meO2=3N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF3DC2D0CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jan 2020 22:57:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23C9A2071E
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jan 2020 22:57:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iwpEsYtl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="srTj1j2m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23C9A2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMJFcpNgpum9XAz0A7Gde2nhVsw3OOha/qG2QYCwq1s=; b=iwpEsYtl3/Km87
	nKNbL9omxTyxKzLyJR6kd0fuEtAzUikIPuzVELugHln2bS1bgQelbmW8Aeg+eYsEftAUSGw+ORABj
	fvK/8hoHsJlis7xwWsZ6bNgb7L2lYNcI1B2D8HJpoTwBWFhbKQXV979+tcKhU4Sb+G73yiRTdDkY0
	5mI05+NW9MDKgrtPL7INtgq9H/7WmNkwAdXaRpsGwNz8DZvoGSfRSnxR4I/3TmJW5oSPoonhRFkqG
	4SErmfWDbL+BWHbfymXJYwRqdeHiYMDTorGwYPGVTBv5zjkuZYgIbqmzBj1GPkkbflgEjBIB2rs/2
	v0FOUmjj0NfPL9UxXMZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iv7t9-0005Tx-68; Fri, 24 Jan 2020 22:57:19 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iv7sy-0005K9-Rb
 for linux-mediatek@lists.infradead.org; Fri, 24 Jan 2020 22:57:10 +0000
Received: by mail-wr1-x442.google.com with SMTP id q10so3927762wrm.11
 for <linux-mediatek@lists.infradead.org>; Fri, 24 Jan 2020 14:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fNqODm3MPzAsBSCY9n8l1wXAgR4AKgIMTb5pUp7NU0U=;
 b=srTj1j2mPK8t2sakwkD7rQEbDNeFFM9BwDp93dCsDs1Q20oZf59EZmlmAzOPPdf+4y
 YxcM9llvhHsbhRScaQhg5pfhZuQ5EK2Wiabt848H4kBft/yOeKD0KfLCT/l9W4a5Y1L4
 Ws4qptwOggL7bhfng7gBhzPp9HhaA+aTg36WNq74YBut1qhS4L/ZTMqXR3HYzj9r7FGA
 g3OhV0aJtCq6S5MwW9QcBqn3UQ760IxL5+/lie2pPtU7H3eL61wmjRFYGCWegua4o7px
 G9xsghTqHOYLmfB+t0+5wgQJi9Xa2XH6e7g4cwoQw8CdIX7jxs00HjMp1GrSPYPF2HYQ
 4/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fNqODm3MPzAsBSCY9n8l1wXAgR4AKgIMTb5pUp7NU0U=;
 b=FpmnwvvqCHPwNwfRgH45s/BtdlCSZaEfP9gIKfvWn+067bTdlu/TVY2vw3YkQFet61
 Q3QLGNPxm0Ksbu3Pq0e6MmfbEGlKTU58IbfLeZVzKX6CnanWrBlhMmqBM3wVxY4oZWGV
 O0fWrndwm7CNGL/XB1bpsxMR24HZ29YnrnRS4biBRWH4330DsDWlcvZMG1EepSVRo/RE
 B9zxqp5mhXWMA87Q0k+a9pSwo4l//tg2EbFFHeddaSOQqL/MWx7G+kcZbMB7qX3H2+9j
 /xk7ymwSXAcIOGhj0hfD5aE7hv155hv4ZETQr/nOpeTFdEtqs4DomVIg5SriYp7vHmMy
 7OmA==
X-Gm-Message-State: APjAAAXtbSDo9K6vOcWGvDD0aeuv6by2IZSXzStIGNMludrXo0hsHygo
 lpr4utXTDJ3CACLSVCX6WHNwUYIPuCD3u4dcvuHlBQ==
X-Google-Smtp-Source: APXvYqzP4FnUZ8kt/z6sTrHwXtHilzjV/goyThoHUZqMef+SOku7Q5F6lD4mv864jnI2/qV48MsRq4J931iUvo8aLpk=
X-Received: by 2002:adf:e887:: with SMTP id d7mr6634585wrm.162.1579906622211; 
 Fri, 24 Jan 2020 14:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20200120145635.GA30904@blackbody.suse.cz>
 <20200124114017.8363-1-mkoutny@suse.com>
 <20200124114017.8363-2-mkoutny@suse.com>
In-Reply-To: <20200124114017.8363-2-mkoutny@suse.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 24 Jan 2020 14:56:51 -0800
Message-ID: <CAJuCfpGjC=YwY=oNnYFNDp2nCuR9YhSU95=xbbeoDEheemte+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] cgroup: Iterate tasks that did not finish do_exit()
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_145708_897859_3D2776B0 
X-CRM114-Status: GOOD (  16.56  )
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
Cc: JeiFeng Lee <linger.lee@mediatek.com>, Tom Cherry <tomcherry@google.com>,
 shuah@kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
 linux-mediatek@lists.infradead.org, linux-kselftest@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, matthias.bgg@gmail.com,
 cgroups mailinglist <cgroups@vger.kernel.org>, alex.shi@linux.alibaba.com,
 kernel-team <kernel-team@android.com>, Roman Gushchin <guro@fb.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKYW4gMjQsIDIwMjAgYXQgMzo0MCBBTSBNaWNoYWwgS291dG7DvSA8bWtvdXRueUBz
dXNlLmNvbT4gd3JvdGU6Cj4KPiBQRl9FWElUSU5HIGlzIHNldCBlYXJsaWVyIHRoYW4gYWN0dWFs
IHJlbW92YWwgZnJvbSBjc3Nfc2V0IHdoZW4gYSB0YXNrCj4gaXMgZXhpdHRpbmcuIFRoaXMgY2Fu
IGNvbmZ1c2UgY2dyb3VwLnByb2NzIHJlYWRlcnMgd2hvIHNlZSBubyBQRl9FWElUSU5HCj4gdGFz
a3MsIGhvd2V2ZXIsIHJtZGlyIGlzIGNoZWNraW5nIGFnYWluc3QgY3NzX3NldCBtZW1iZXJzaGlw
IHNvIGl0IGNhbgo+IHRyYW5zaXRpb25hbGx5IGZhaWwgd2l0aCBFQlVTWS4KPgo+IEZpeCB0aGlz
IGJ5IGxpc3RpbmcgdGFza3MgdGhhdCB3ZXJlbid0IHVubGlua2VkIGZyb20gY3NzX3NldCBhY3Rp
dmUKPiBsaXN0cy4KPiBJdCBtYXkgaGFwcGVuIHRoYXQgb3RoZXIgdXNlcnMgb2YgdGhlIHRhc2sg
aXRlcmF0b3IgKHdpdGhvdXQKPiBDU1NfVEFTS19JVEVSX1BST0NTKSBzcG90IGEgUEZfRVhJVElO
RyB0YXNrIGJlZm9yZSBjZ3JvdXBfZXhpdCgpLiBUaGlzCj4gaXMgZXF1YWwgdG8gdGhlIHN0YXRl
IGJlZm9yZSBjb21taXQgYzAzY2Q3NzM4YTgzICgiY2dyb3VwOiBJbmNsdWRlIGR5aW5nCj4gbGVh
ZGVycyB3aXRoIGxpdmUgdGhyZWFkcyBpbiBQUk9DUyBpdGVyYXRpb25zIikgYnV0IGl0IG1heSBi
ZSByZXZpZXdlZAo+IGxhdGVyLgo+Cj4gUmVwb3J0ZWQtYnk6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8
c3VyZW5iQGdvb2dsZS5jb20+Cj4gRml4ZXM6IGMwM2NkNzczOGE4MyAoImNncm91cDogSW5jbHVk
ZSBkeWluZyBsZWFkZXJzIHdpdGggbGl2ZSB0aHJlYWRzIGluIFBST0NTIGl0ZXJhdGlvbnMiKQo+
IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBLb3V0bsO9IDxta291dG55QHN1c2UuY29tPgo+IC0tLQo+
ICBpbmNsdWRlL2xpbnV4L2Nncm91cC5oIHwgIDEgKwo+ICBrZXJuZWwvY2dyb3VwL2Nncm91cC5j
IHwgMjMgKysrKysrKysrKysrKysrKy0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
Y2dyb3VwLmggYi9pbmNsdWRlL2xpbnV4L2Nncm91cC5oCj4gaW5kZXggZDdkZGViZDBjZGVjLi5l
NzVkMjE5MTIyNmIgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9jZ3JvdXAuaAo+ICsrKyBi
L2luY2x1ZGUvbGludXgvY2dyb3VwLmgKPiBAQCAtNjIsNiArNjIsNyBAQCBzdHJ1Y3QgY3NzX3Rh
c2tfaXRlciB7Cj4gICAgICAgICBzdHJ1Y3QgbGlzdF9oZWFkICAgICAgICAgICAgICAgICptZ190
YXNrc19oZWFkOwo+ICAgICAgICAgc3RydWN0IGxpc3RfaGVhZCAgICAgICAgICAgICAgICAqZHlp
bmdfdGFza3NfaGVhZDsKPgo+ICsgICAgICAgc3RydWN0IGxpc3RfaGVhZCAgICAgICAgICAgICAg
ICAqY3VyX3Rhc2tzX2hlYWQ7Cj4gICAgICAgICBzdHJ1Y3QgY3NzX3NldCAgICAgICAgICAgICAg
ICAgICpjdXJfY3NldDsKPiAgICAgICAgIHN0cnVjdCBjc3Nfc2V0ICAgICAgICAgICAgICAgICAg
KmN1cl9kY3NldDsKPiAgICAgICAgIHN0cnVjdCB0YXNrX3N0cnVjdCAgICAgICAgICAgICAgKmN1
cl90YXNrOwo+IGRpZmYgLS1naXQgYS9rZXJuZWwvY2dyb3VwL2Nncm91cC5jIGIva2VybmVsL2Nn
cm91cC9jZ3JvdXAuYwo+IGluZGV4IDczNWFmOGYxNWY5NS4uYTZlMzYxOWUwMTNiIDEwMDY0NAo+
IC0tLSBhL2tlcm5lbC9jZ3JvdXAvY2dyb3VwLmMKPiArKysgYi9rZXJuZWwvY2dyb3VwL2Nncm91
cC5jCj4gQEAgLTQ0MDQsMTIgKzQ0MDQsMTYgQEAgc3RhdGljIHZvaWQgY3NzX3Rhc2tfaXRlcl9h
ZHZhbmNlX2Nzc19zZXQoc3RydWN0IGNzc190YXNrX2l0ZXIgKml0KQo+ICAgICAgICAgICAgICAg
ICB9Cj4gICAgICAgICB9IHdoaWxlICghY3NzX3NldF9wb3B1bGF0ZWQoY3NldCkgJiYgbGlzdF9l
bXB0eSgmY3NldC0+ZHlpbmdfdGFza3MpKTsKPgo+IC0gICAgICAgaWYgKCFsaXN0X2VtcHR5KCZj
c2V0LT50YXNrcykpCj4gKyAgICAgICBpZiAoIWxpc3RfZW1wdHkoJmNzZXQtPnRhc2tzKSkgewo+
ICAgICAgICAgICAgICAgICBpdC0+dGFza19wb3MgPSBjc2V0LT50YXNrcy5uZXh0Owo+IC0gICAg
ICAgZWxzZSBpZiAoIWxpc3RfZW1wdHkoJmNzZXQtPm1nX3Rhc2tzKSkKPiArICAgICAgICAgICAg
ICAgaXQtPmN1cl90YXNrc19oZWFkID0gJmNzZXQtPnRhc2tzOwo+ICsgICAgICAgfSBlbHNlIGlm
ICghbGlzdF9lbXB0eSgmY3NldC0+bWdfdGFza3MpKSB7Cj4gICAgICAgICAgICAgICAgIGl0LT50
YXNrX3BvcyA9IGNzZXQtPm1nX3Rhc2tzLm5leHQ7Cj4gLSAgICAgICBlbHNlCj4gKyAgICAgICAg
ICAgICAgIGl0LT5jdXJfdGFza3NfaGVhZCA9ICZjc2V0LT5tZ190YXNrczsKPiArICAgICAgIH0g
ZWxzZSB7Cj4gICAgICAgICAgICAgICAgIGl0LT50YXNrX3BvcyA9IGNzZXQtPmR5aW5nX3Rhc2tz
Lm5leHQ7Cj4gKyAgICAgICAgICAgICAgIGl0LT5jdXJfdGFza3NfaGVhZCA9ICZjc2V0LT5keWlu
Z190YXNrczsKPiArICAgICAgIH0KPgo+ICAgICAgICAgaXQtPnRhc2tzX2hlYWQgPSAmY3NldC0+
dGFza3M7Cj4gICAgICAgICBpdC0+bWdfdGFza3NfaGVhZCA9ICZjc2V0LT5tZ190YXNrczsKPiBA
QCAtNDQ2NywxMCArNDQ3MSwxNCBAQCBzdGF0aWMgdm9pZCBjc3NfdGFza19pdGVyX2FkdmFuY2Uo
c3RydWN0IGNzc190YXNrX2l0ZXIgKml0KQo+ICAgICAgICAgICAgICAgICBlbHNlCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgaXQtPnRhc2tfcG9zID0gaXQtPnRhc2tfcG9zLT5uZXh0Owo+Cj4g
LSAgICAgICAgICAgICAgIGlmIChpdC0+dGFza19wb3MgPT0gaXQtPnRhc2tzX2hlYWQpCj4gKyAg
ICAgICAgICAgICAgIGlmIChpdC0+dGFza19wb3MgPT0gaXQtPnRhc2tzX2hlYWQpIHsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBpdC0+dGFza19wb3MgPSBpdC0+bWdfdGFza3NfaGVhZC0+bmV4
dDsKPiAtICAgICAgICAgICAgICAgaWYgKGl0LT50YXNrX3BvcyA9PSBpdC0+bWdfdGFza3NfaGVh
ZCkKPiArICAgICAgICAgICAgICAgICAgICAgICBpdC0+Y3VyX3Rhc2tzX2hlYWQgPSBpdC0+bWdf
dGFza3NfaGVhZDsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICBpZiAoaXQt
PnRhc2tfcG9zID09IGl0LT5tZ190YXNrc19oZWFkKSB7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgaXQtPnRhc2tfcG9zID0gaXQtPmR5aW5nX3Rhc2tzX2hlYWQtPm5leHQ7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgaXQtPmN1cl90YXNrc19oZWFkID0gaXQtPmR5aW5nX3Rhc2tzX2hlYWQ7
Cj4gKyAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgaWYgKGl0LT50YXNrX3BvcyA9
PSBpdC0+ZHlpbmdfdGFza3NfaGVhZCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBjc3NfdGFz
a19pdGVyX2FkdmFuY2VfY3NzX3NldChpdCk7Cj4gICAgICAgICB9IGVsc2Ugewo+IEBAIC00NDg5
LDExICs0NDk3LDEyIEBAIHN0YXRpYyB2b2lkIGNzc190YXNrX2l0ZXJfYWR2YW5jZShzdHJ1Y3Qg
Y3NzX3Rhc2tfaXRlciAqaXQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgZ290byByZXBlYXQ7
Cj4KPiAgICAgICAgICAgICAgICAgLyogYW5kIGR5aW5nIGxlYWRlcnMgdy9vIGxpdmUgbWVtYmVy
IHRocmVhZHMgKi8KPiAtICAgICAgICAgICAgICAgaWYgKCFhdG9taWNfcmVhZCgmdGFzay0+c2ln
bmFsLT5saXZlKSkKPiArICAgICAgICAgICAgICAgaWYgKGl0LT5jdXJfdGFza3NfaGVhZCA9PSBp
dC0+ZHlpbmdfdGFza3NfaGVhZCAmJgo+ICsgICAgICAgICAgICAgICAgICAgIWF0b21pY19yZWFk
KCZ0YXNrLT5zaWduYWwtPmxpdmUpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gcmVw
ZWF0Owo+ICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgLyogc2tpcCBhbGwgZHlp
bmcgb25lcyAqLwo+IC0gICAgICAgICAgICAgICBpZiAodGFzay0+ZmxhZ3MgJiBQRl9FWElUSU5H
KQo+ICsgICAgICAgICAgICAgICBpZiAoaXQtPmN1cl90YXNrc19oZWFkID09IGl0LT5keWluZ190
YXNrc19oZWFkKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gcmVwZWF0Owo+ICAgICAg
ICAgfQo+ICB9Cj4gLS0KPiAyLjI0LjEKPgoKVGVzdGVkLWJ5OiBTdXJlbiBCYWdoZGFzYXJ5YW4g
PHN1cmVuYkBnb29nbGUuY29tPgoKVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
