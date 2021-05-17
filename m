Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2957FC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 08:39:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC5D161184
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 08:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC5D161184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=8HwfI02oiY/2lG2XWC3LCwTrH2Xa4lZmYdFGQv2pZok=; b=cRtnQ+vWfaBTk6JcnYAyIIxIg
	Wsv1U7eMXZS+wcX2N16bplg+aSJeEOP0DOklV93eF8M0F+b9RAzDWOHCJrM3l70CFPxOjNpOC0fvj
	fq0iXOVZw5/OYTYg6lrP18KLW2DOsHdy3oxt7Uw72DcSXvmNCvSY4Yua/lJLKOSauA/s4uwcdEOcq
	2JjClGHJuXJ05+sUogaA1VbH7hVF+MlXi0T6SyOsFijaS7A8beYwmMptwLjLISUmpY74mLP8P3b0q
	iUUV6UxEzyf2Wcsh1GPtSLpU63p1f2jB2ObejqzrBNQpiQMkwXEv7js9CrPSnHinyRljqPeduTw7k
	N5O5r7nuw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liYms-00EHwG-Nw; Mon, 17 May 2021 08:39:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liYko-00EHPb-7r; Mon, 17 May 2021 08:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Date:From:MIME-Version:In-Reply-To:
 Subject:Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:Sender:
 Reply-To:Content-ID:Content-Description:References;
 bh=c/XwTyY7ocSWQKORFrYrUtp9nq3OFvQdjbfHQB5X7Ng=; b=l5QC7L79sgd6UWwHnMdD+pdZsW
 uFlObCyS7dcrczkKd5qub36NuQ55FSQoS5Gv0Iyw1vX58NNUbEcYfgRLuZXUixD/mn3sDRdaohk4j
 9HBjbx1h6CXvdLEOR9sRhRY1qDUwxMNHkJ7u61aTWxN/hCOEopoJlclR/WcX6ZPeRQRbmXGysY7Yk
 Lduz5zEmI7BRhMU43IhHs2d8VAJPT+b6XVscp/j1RGzMJL4ZVB1zFAaiqS6vLgu/jgDjHDOb2Ixc0
 8WfB7MBt2sdfvQgm1UU0QQNQGZXyS0g8q1snVSADPcOaBsHBOOXUCn8e++4sXBIVWyH8u5PgAN2j7
 ZiotpUrQ==;
Received: from mail-m176231.qiye.163.com ([59.111.176.231])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liYkh-00DbWs-Tk; Mon, 17 May 2021 08:37:31 +0000
Received: from vivo.com (localhost [127.0.0.1])
 by mail-m176231.qiye.163.com (Hmail) with ESMTP id 0DE9D6C0101;
 Mon, 17 May 2021 16:37:21 +0800 (CST)
Message-ID: <AGAAqwBWDoTN1eybqS54h4qu.3.1621240641040.Hmail.wangqing@vivo.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSCBWOSAxLzJdIHdhdGNoZG9nOiBtdGs6IHN1cHBvcnQgcHJlLXRpbWVvdXQgd2hlbiB0aGUgYmFyayBpcnEgaXMgYXZhaWxhYmxl?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 36.152.145.182
In-Reply-To: <ac2a3762-0b5d-a406-33e0-fca3073cd5ac@roeck-us.net>
MIME-Version: 1.0
Received: from wangqing@vivo.com( [36.152.145.182) ] by ajax-webmail (
 [127.0.0.1] ) ; Mon, 17 May 2021 16:37:21 +0800 (GMT+08:00)
From: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Date: Mon, 17 May 2021 16:37:21 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUhNT1ZMGh4YHksZS0saGkhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1ISElPTU5OTkpPN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6PDo6Cgw5LD8ULzVKHgIZCihOTxNPCg5VSFVKTUlKSU9LTU9KT0tKVTMWGhIXVQwaFRwKEhUc
 Ow0SDRRVGBQWRVlXWRILWUFZSE1VSk5JVUpPTlVKQ0lZV1kIAVlBSExDTDcG
X-HM-Tid: 0a797978f624d9a9kuws0de9d6c0101
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_013728_139857_CA7DA9D8 
X-CRM114-Status: UNSURE (   6.46  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cj5PbiA1LzUvMjEgNjo1MSBQTSwg546L5pOOIHdyb3RlOgo+PiAKPj4+IE9uIDQvMjQvMjEgNjo1
MiBQTSwgV2FuZyBRaW5nIHdyb3RlOgo+Pj4+IFVzZSB0aGUgYmFyayBpbnRlcnJ1cHQgYXMgdGhl
IHByZXRpbWVvdXQgbm90aWZpZXIgaWYgYXZhaWxhYmxlLgo+Pj4+Cj4+Pj4gV2hlbiB0aGUgd2F0
Y2hkb2cgdGltZXIgZXhwaXJlcyBpbiBkdWFsIG1vZGUsIGFuIGludGVycnVwdCB3aWxsIGJlCj4+
Pj4gdHJpZ2dlcmVkIGZpcnN0LCB0aGVuIHRoZSB0aW1pbmcgcmVzdGFydHMuIFRoZSByZXNldCBz
aWduYWwgd2lsbCBiZQo+Pj4+IGluaXRpYXRlZCB3aGVuIHRoZSB0aW1lciBleHBpcmVzIGFnYWlu
Lgo+Pj4+Cj4+Pj4gVGhlIHByZXRpbWVvdXQgbm90aWZpY2F0aW9uIHNoYWxsIG9jY3VyIGF0IHRp
bWVvdXQtc2VjLzIuCj4+Pj4KPj4+PiBWMjoKPj4+PiAtIHBhbmljKCkgYnkgZGVmYXVsdCBpZiBX
QVRDSERPR19QUkVUSU1FT1VUX0dPViBpcyBub3QgZW5hYmxlZC4KPj4+Pgo+Pj4+IFYzOgo+Pj4+
IC0gTW9kaWZ5IHRoZSBwcmV0aW1lb3V0IGJlaGF2aW9yLCBtYW51YWxseSByZXNldCBhZnRlciB0
aGUgcHJldGltZW91dAo+Pj4+IC0gaXMgcHJvY2Vzc2VkIGFuZCB3YWl0IHVudGlsIHRpbWVvdXQu
Cj4+Pj4KPj4+PiBWNDoKPj4+PiAtIFJlbW92ZSBwcmV0aW1lb3V0IHJlbGF0ZWQgcHJvY2Vzc2lu
Zy4gCj4+Pj4gLSBBZGQgZHVhbCBtb2RlIGNvbnRyb2wgc2VwYXJhdGVseS4KPj4+Pgo+Pj4+IFY1
Ogo+Pj4+IC0gRml4IHNvbWUgZm9ybWF0dGluZyBhbmQgcHJpbnRpbmcgcHJvYmxlbXMuCj4+Pj4K
Pj4+PiBWNjoKPj4+PiAtIFJlYWxpemUgcHJldGltZW91dCBwcm9jZXNzaW5nIHRocm91Z2ggZHVh
bG1vZGUuCj4+Pj4KPj4+PiBWNzoKPj4+PiAtIEFkZCBzZXRfcHJldGltZW91dCgpLgo+Pj4+Cj4+
Pj4gVjgvVjk6Cj4+Pj4gLSBGaXggc29tZSBmb3JtYXR0aW5nIHByb2JsZW1zLgo+Pj4+Cj4+Pj4g
U2lnbmVkLW9mZi1ieTogV2FuZyBRaW5nIDx3YW5ncWluZ0B2aXZvLmNvbT4KPj4+Cj4+PiBSZXZp
ZXdlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+Pj4KPj4+IE5vdGUg
dGhhdCB0aGUgdmVyc2lvbiBoaXN0b3J5IHNob3VsZCBiZSBhZnRlciAiLS0tIi4KPj4+Cj4+PiBH
dWVudGVyCj4+Pgo+PiAKPj4gVGhhbmtzLCBHdWVudGVyLgo+PiBBbmQgd2hhdCBkbyBJIG5lZWQg
dG8gZG8gaWYgSSB3YW50IG1lcmdlIGludG8gdGhlIG5leHQtdHJlZT8KPj4gCj5XaW0gc2hvdWxk
IHRha2UgY2FyZSBvZiB0aGF0Lgo+Cj5HdWVudGVyCj4KV2ltLCBjYW4geW91IGhlbHAgdG8gcGlj
ayBpdCB1cCB0byB0aGUgbmV4dC10cmVlPwoKVGhhbmtzLApRaW5nCg0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
