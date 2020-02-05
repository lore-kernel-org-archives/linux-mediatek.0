Return-Path: <SRS0=voLZ=3Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EBCC35247
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 17:28:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1480720659
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 17:28:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CQSDldOb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="lJaz2HSL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1480720659
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3l6GnFei/NLbxt4E5+K9TA1OuB68knpovX1RuuhCSc=; b=CQSDldObUApop3
	vWAU1roSCvy3NmWvppiBb+hPuaHbUaBMUgTYctULRNimHdiJNtWHeE8cLYSE1T+vCYtf5C5XKy9gH
	rWnVvpNpRoo9Z2lTkVQGR6xZCnOTfnxV8eCiextxRM2jr7t0ALPwAY9U1ZOan4zf1BRfrzmP+wd1x
	P6psS74T1L26RHasCtD8TUosQsWzI1PppmtNQHBeOf/58shubhcyyA8fAC5sZTlOQtkFZ/DDje1xN
	fDzUH1CZSW33DoOLpY5y3QsePixS9o1TZt2T9ftrpCThRsOtj5w4Dg64kPLiD7NLii2pXSlU984RN
	cGsQeeGJ3QuJPqGZUOxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izOT7-0000M1-0A; Wed, 05 Feb 2020 17:28:05 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izOT4-0000Ky-6j
 for linux-mediatek@lists.infradead.org; Wed, 05 Feb 2020 17:28:03 +0000
Received: by mail-wm1-x344.google.com with SMTP id m10so4974143wmc.0
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Feb 2020 09:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/J7K6eoBY50PYm0N/u4X3+dlKUZnt64LaOlAE9qk+tY=;
 b=lJaz2HSL0GodXUnBdAWn5vXGicOnSOjlEzL6WRhsXUYvoCwf2EksV/H80DsSr0HvVU
 jf5gZF9txDXrM3yAMqWtQrJa6rF6ZxYg2ABlbXin3ylMvhed2NeSefp4yc29oR7AO7Kq
 SForPuVGtkLxc0SWSZpIfaM7l+JRe3quj6YnZtk6CLCdH6Ya1+FowX4QH8PE8atAmrxL
 2mwslJZqu1/pZH8QJ9X3mo5JZXE2zX0ovIXlKc9ZS9JoWrcs0qZi3ZNp1BsgCSehUGC7
 pVPo2EESWoXfB1s0YdZHI7GfTR2svAMgYjRNn51zpIpuaTZN19/bg1o9tYC2NLTZCylr
 L8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/J7K6eoBY50PYm0N/u4X3+dlKUZnt64LaOlAE9qk+tY=;
 b=sH02naowHNoeNBfwUUwB2BSQOXP0EwQosyirQBL4ur0JCCuGM4HaQRRu3eXR5jsF8f
 t7gHFt/DN2QwdhnDLJWE7oSYGYf5Z6Uy6/QbiO6YC17UhiSTYIRVqkCTtk8plyUB5VHM
 YKtSiZLoDucTfaZlL37gAvkDuvKEe6VucFRHk1pHUqenp3ZYzPP0SKay9xD3k0Z2bV6K
 yZivZIxxAjvGjVHq99gsfvqIBTAyMOGQg4O1B3TwBJcC4FtnuqsPJLXHPju2c1/t5mHR
 8DBUwQHjHYJsYiasXFHCFVhdH+arkkEmIHmHv2l9J48Zu34VwzgmnpKyrKFNmSymy3kw
 CPng==
X-Gm-Message-State: APjAAAUwOCcawOg2pQfI4RV14gQo/K4DAgM2AaqLTlyd8MNXUayRK0BO
 g2x7AjYk9JFVllNfb1psTAa3TkTpEym4arObySXUAw==
X-Google-Smtp-Source: APXvYqynJh5j49aSDjFF+KSFSB3CwQRk6jra7/lReDNXiogMGUoOKebQhesHur67DC3ixje/LTjLJnSEbVX+e6ufw68=
X-Received: by 2002:a1c:6a15:: with SMTP id f21mr6625580wmc.126.1580923677710; 
 Wed, 05 Feb 2020 09:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20200120145635.GA30904@blackbody.suse.cz>
 <20200124114017.8363-1-mkoutny@suse.com>
 <20200124114017.8363-2-mkoutny@suse.com>
 <CAJuCfpGjC=YwY=oNnYFNDp2nCuR9YhSU95=xbbeoDEheemte+Q@mail.gmail.com>
In-Reply-To: <CAJuCfpGjC=YwY=oNnYFNDp2nCuR9YhSU95=xbbeoDEheemte+Q@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 5 Feb 2020 09:27:45 -0800
Message-ID: <CAJuCfpEq9c6cdEdqZOq6KDmxSHLNzby=46psRYpGxYhDT31yew@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] cgroup: Iterate tasks that did not finish do_exit()
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_092802_266281_D45189A6 
X-CRM114-Status: GOOD (  18.28  )
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

T24gRnJpLCBKYW4gMjQsIDIwMjAgYXQgMjo1NiBQTSBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVu
YkBnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgSmFuIDI0LCAyMDIwIGF0IDM6NDAgQU0g
TWljaGFsIEtvdXRuw70gPG1rb3V0bnlAc3VzZS5jb20+IHdyb3RlOgo+ID4KPiA+IFBGX0VYSVRJ
TkcgaXMgc2V0IGVhcmxpZXIgdGhhbiBhY3R1YWwgcmVtb3ZhbCBmcm9tIGNzc19zZXQgd2hlbiBh
IHRhc2sKPiA+IGlzIGV4aXR0aW5nLiBUaGlzIGNhbiBjb25mdXNlIGNncm91cC5wcm9jcyByZWFk
ZXJzIHdobyBzZWUgbm8gUEZfRVhJVElORwo+ID4gdGFza3MsIGhvd2V2ZXIsIHJtZGlyIGlzIGNo
ZWNraW5nIGFnYWluc3QgY3NzX3NldCBtZW1iZXJzaGlwIHNvIGl0IGNhbgo+ID4gdHJhbnNpdGlv
bmFsbHkgZmFpbCB3aXRoIEVCVVNZLgo+ID4KPiA+IEZpeCB0aGlzIGJ5IGxpc3RpbmcgdGFza3Mg
dGhhdCB3ZXJlbid0IHVubGlua2VkIGZyb20gY3NzX3NldCBhY3RpdmUKPiA+IGxpc3RzLgo+ID4g
SXQgbWF5IGhhcHBlbiB0aGF0IG90aGVyIHVzZXJzIG9mIHRoZSB0YXNrIGl0ZXJhdG9yICh3aXRo
b3V0Cj4gPiBDU1NfVEFTS19JVEVSX1BST0NTKSBzcG90IGEgUEZfRVhJVElORyB0YXNrIGJlZm9y
ZSBjZ3JvdXBfZXhpdCgpLiBUaGlzCj4gPiBpcyBlcXVhbCB0byB0aGUgc3RhdGUgYmVmb3JlIGNv
bW1pdCBjMDNjZDc3MzhhODMgKCJjZ3JvdXA6IEluY2x1ZGUgZHlpbmcKPiA+IGxlYWRlcnMgd2l0
aCBsaXZlIHRocmVhZHMgaW4gUFJPQ1MgaXRlcmF0aW9ucyIpIGJ1dCBpdCBtYXkgYmUgcmV2aWV3
ZWQKPiA+IGxhdGVyLgo+ID4KPiA+IFJlcG9ydGVkLWJ5OiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1
cmVuYkBnb29nbGUuY29tPgo+ID4gRml4ZXM6IGMwM2NkNzczOGE4MyAoImNncm91cDogSW5jbHVk
ZSBkeWluZyBsZWFkZXJzIHdpdGggbGl2ZSB0aHJlYWRzIGluIFBST0NTIGl0ZXJhdGlvbnMiKQo+
ID4gU2lnbmVkLW9mZi1ieTogTWljaGFsIEtvdXRuw70gPG1rb3V0bnlAc3VzZS5jb20+Cj4gPiAt
LS0KPiA+ICBpbmNsdWRlL2xpbnV4L2Nncm91cC5oIHwgIDEgKwo+ID4gIGtlcm5lbC9jZ3JvdXAv
Y2dyb3VwLmMgfCAyMyArKysrKysrKysrKysrKysrLS0tLS0tLQo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9jZ3JvdXAuaCBiL2luY2x1ZGUvbGludXgvY2dyb3VwLmgKPiA+IGluZGV4
IGQ3ZGRlYmQwY2RlYy4uZTc1ZDIxOTEyMjZiIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51
eC9jZ3JvdXAuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9jZ3JvdXAuaAo+ID4gQEAgLTYyLDYg
KzYyLDcgQEAgc3RydWN0IGNzc190YXNrX2l0ZXIgewo+ID4gICAgICAgICBzdHJ1Y3QgbGlzdF9o
ZWFkICAgICAgICAgICAgICAgICptZ190YXNrc19oZWFkOwo+ID4gICAgICAgICBzdHJ1Y3QgbGlz
dF9oZWFkICAgICAgICAgICAgICAgICpkeWluZ190YXNrc19oZWFkOwo+ID4KPiA+ICsgICAgICAg
c3RydWN0IGxpc3RfaGVhZCAgICAgICAgICAgICAgICAqY3VyX3Rhc2tzX2hlYWQ7Cj4gPiAgICAg
ICAgIHN0cnVjdCBjc3Nfc2V0ICAgICAgICAgICAgICAgICAgKmN1cl9jc2V0Owo+ID4gICAgICAg
ICBzdHJ1Y3QgY3NzX3NldCAgICAgICAgICAgICAgICAgICpjdXJfZGNzZXQ7Cj4gPiAgICAgICAg
IHN0cnVjdCB0YXNrX3N0cnVjdCAgICAgICAgICAgICAgKmN1cl90YXNrOwo+ID4gZGlmZiAtLWdp
dCBhL2tlcm5lbC9jZ3JvdXAvY2dyb3VwLmMgYi9rZXJuZWwvY2dyb3VwL2Nncm91cC5jCj4gPiBp
bmRleCA3MzVhZjhmMTVmOTUuLmE2ZTM2MTllMDEzYiAxMDA2NDQKPiA+IC0tLSBhL2tlcm5lbC9j
Z3JvdXAvY2dyb3VwLmMKPiA+ICsrKyBiL2tlcm5lbC9jZ3JvdXAvY2dyb3VwLmMKPiA+IEBAIC00
NDA0LDEyICs0NDA0LDE2IEBAIHN0YXRpYyB2b2lkIGNzc190YXNrX2l0ZXJfYWR2YW5jZV9jc3Nf
c2V0KHN0cnVjdCBjc3NfdGFza19pdGVyICppdCkKPiA+ICAgICAgICAgICAgICAgICB9Cj4gPiAg
ICAgICAgIH0gd2hpbGUgKCFjc3Nfc2V0X3BvcHVsYXRlZChjc2V0KSAmJiBsaXN0X2VtcHR5KCZj
c2V0LT5keWluZ190YXNrcykpOwo+ID4KPiA+IC0gICAgICAgaWYgKCFsaXN0X2VtcHR5KCZjc2V0
LT50YXNrcykpCj4gPiArICAgICAgIGlmICghbGlzdF9lbXB0eSgmY3NldC0+dGFza3MpKSB7Cj4g
PiAgICAgICAgICAgICAgICAgaXQtPnRhc2tfcG9zID0gY3NldC0+dGFza3MubmV4dDsKPiA+IC0g
ICAgICAgZWxzZSBpZiAoIWxpc3RfZW1wdHkoJmNzZXQtPm1nX3Rhc2tzKSkKPiA+ICsgICAgICAg
ICAgICAgICBpdC0+Y3VyX3Rhc2tzX2hlYWQgPSAmY3NldC0+dGFza3M7Cj4gPiArICAgICAgIH0g
ZWxzZSBpZiAoIWxpc3RfZW1wdHkoJmNzZXQtPm1nX3Rhc2tzKSkgewo+ID4gICAgICAgICAgICAg
ICAgIGl0LT50YXNrX3BvcyA9IGNzZXQtPm1nX3Rhc2tzLm5leHQ7Cj4gPiAtICAgICAgIGVsc2UK
PiA+ICsgICAgICAgICAgICAgICBpdC0+Y3VyX3Rhc2tzX2hlYWQgPSAmY3NldC0+bWdfdGFza3M7
Cj4gPiArICAgICAgIH0gZWxzZSB7Cj4gPiAgICAgICAgICAgICAgICAgaXQtPnRhc2tfcG9zID0g
Y3NldC0+ZHlpbmdfdGFza3MubmV4dDsKPiA+ICsgICAgICAgICAgICAgICBpdC0+Y3VyX3Rhc2tz
X2hlYWQgPSAmY3NldC0+ZHlpbmdfdGFza3M7Cj4gPiArICAgICAgIH0KPiA+Cj4gPiAgICAgICAg
IGl0LT50YXNrc19oZWFkID0gJmNzZXQtPnRhc2tzOwo+ID4gICAgICAgICBpdC0+bWdfdGFza3Nf
aGVhZCA9ICZjc2V0LT5tZ190YXNrczsKPiA+IEBAIC00NDY3LDEwICs0NDcxLDE0IEBAIHN0YXRp
YyB2b2lkIGNzc190YXNrX2l0ZXJfYWR2YW5jZShzdHJ1Y3QgY3NzX3Rhc2tfaXRlciAqaXQpCj4g
PiAgICAgICAgICAgICAgICAgZWxzZQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaXQtPnRh
c2tfcG9zID0gaXQtPnRhc2tfcG9zLT5uZXh0Owo+ID4KPiA+IC0gICAgICAgICAgICAgICBpZiAo
aXQtPnRhc2tfcG9zID09IGl0LT50YXNrc19oZWFkKQo+ID4gKyAgICAgICAgICAgICAgIGlmIChp
dC0+dGFza19wb3MgPT0gaXQtPnRhc2tzX2hlYWQpIHsKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGl0LT50YXNrX3BvcyA9IGl0LT5tZ190YXNrc19oZWFkLT5uZXh0Owo+ID4gLSAgICAgICAg
ICAgICAgIGlmIChpdC0+dGFza19wb3MgPT0gaXQtPm1nX3Rhc2tzX2hlYWQpCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBpdC0+Y3VyX3Rhc2tzX2hlYWQgPSBpdC0+bWdfdGFza3NfaGVhZDsK
PiA+ICsgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgICAgaWYgKGl0LT50YXNrX3Bv
cyA9PSBpdC0+bWdfdGFza3NfaGVhZCkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaXQt
PnRhc2tfcG9zID0gaXQtPmR5aW5nX3Rhc2tzX2hlYWQtPm5leHQ7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBpdC0+Y3VyX3Rhc2tzX2hlYWQgPSBpdC0+ZHlpbmdfdGFza3NfaGVhZDsKPiA+
ICsgICAgICAgICAgICAgICB9Cj4gPiAgICAgICAgICAgICAgICAgaWYgKGl0LT50YXNrX3BvcyA9
PSBpdC0+ZHlpbmdfdGFza3NfaGVhZCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNzc190
YXNrX2l0ZXJfYWR2YW5jZV9jc3Nfc2V0KGl0KTsKPiA+ICAgICAgICAgfSBlbHNlIHsKPiA+IEBA
IC00NDg5LDExICs0NDk3LDEyIEBAIHN0YXRpYyB2b2lkIGNzc190YXNrX2l0ZXJfYWR2YW5jZShz
dHJ1Y3QgY3NzX3Rhc2tfaXRlciAqaXQpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IHJlcGVhdDsKPiA+Cj4gPiAgICAgICAgICAgICAgICAgLyogYW5kIGR5aW5nIGxlYWRlcnMgdy9v
IGxpdmUgbWVtYmVyIHRocmVhZHMgKi8KPiA+IC0gICAgICAgICAgICAgICBpZiAoIWF0b21pY19y
ZWFkKCZ0YXNrLT5zaWduYWwtPmxpdmUpKQo+ID4gKyAgICAgICAgICAgICAgIGlmIChpdC0+Y3Vy
X3Rhc2tzX2hlYWQgPT0gaXQtPmR5aW5nX3Rhc2tzX2hlYWQgJiYKPiA+ICsgICAgICAgICAgICAg
ICAgICAgIWF0b21pY19yZWFkKCZ0YXNrLT5zaWduYWwtPmxpdmUpKQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgZ290byByZXBlYXQ7Cj4gPiAgICAgICAgIH0gZWxzZSB7Cj4gPiAgICAgICAg
ICAgICAgICAgLyogc2tpcCBhbGwgZHlpbmcgb25lcyAqLwo+ID4gLSAgICAgICAgICAgICAgIGlm
ICh0YXNrLT5mbGFncyAmIFBGX0VYSVRJTkcpCj4gPiArICAgICAgICAgICAgICAgaWYgKGl0LT5j
dXJfdGFza3NfaGVhZCA9PSBpdC0+ZHlpbmdfdGFza3NfaGVhZCkKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGdvdG8gcmVwZWF0Owo+ID4gICAgICAgICB9Cj4gPiAgfQo+ID4gLS0KPiA+IDIu
MjQuMQo+ID4KPgo+IFRlc3RlZC1ieTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xl
LmNvbT4KPgo+IFRoYW5rcyEKCkhpIEZvbGtzLApJZiB0aGlzIG5ldyB2ZXJzaW9uIGxvb2tzIGdv
b2QgY291bGQgd2UgZ2V0IGFuIEFjayBwbGVhc2U/IEkgbmVlZCB0bwpzdGFydCBiYWNrcG9ydGlu
ZyB0aGlzIGZpeCB0byBBbmRyb2lkIGFuZCB3b3VsZCBsaWtlIGEgY29uZmlybWF0aW9uCmJlZm9y
ZSBkb2luZyBzby4KVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
