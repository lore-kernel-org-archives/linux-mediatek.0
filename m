Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD0FC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 11:45:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F8C6206F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 11:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gM93bBrC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vOYyA/g9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F8C6206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YQIw//0iKMzIHuXKyfCdBD+pT3Tv8MbNEX4H738r5wM=; b=gM93bBrCrD9ppfxvAs492SW5M
	fX/hIJUu4x2PuECzMqFwfU/z1fNx+ozMXvIHXAYsYx4j5odf281W6aXgNWWbOEdpZqh7CZbD8iDW9
	XSs5yMjXVjnbxu3nXsxovwQjTfHes/k26iUSnB4ClXqGG5uiIAzLZMVkE4mdWSMsC0rz0EMx/kjNq
	qpMOsMy794OI1WJiHouCR6Mhy9cWQPidfR2+8MqtFV6F2qVR0XGE19D1QD2tZ2yxXhTvodlURTASr
	qvXy/bhm7q9DdAmjJsxlcHYJ9aHPhnKdEjMa4C4Y2QJLoKsDSLtXjbYS6Jg7oLs123yDsqqqezD8J
	6tG7YMgnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khWkt-0004dQ-PK; Tue, 24 Nov 2020 11:45:07 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khWkr-0004ct-Et; Tue, 24 Nov 2020 11:45:06 +0000
Received: by mail-lj1-x241.google.com with SMTP id o24so21637827ljj.6;
 Tue, 24 Nov 2020 03:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lEZOg2+Pg+PWUdy2vuWhDST9DUP8pdhSxb8BJWFY9tE=;
 b=vOYyA/g9dkI4GqaR/Nzl5Toy2WtgFbuZt895POW6raPpyIeuezBIf0CpzqpKxvRtV6
 lK0UKkjbhwFrq1k/4oUdllgdW0Jt531xFbcbWPFR551BhP/1O8BpumRwUbf6K1z5AoRm
 PHAK1Gi28g7ms6y+8kLCuevenERfhEVx6HlXGWoH8t56EMgbSiPhx6B8QZAXciYn5LXT
 OQ/RrX2/DI4xdLDSy7d9N1ZpFQrc82o6Ho0uUIFW+zEDFVq1jt1QlQy/emYO2DY+UurR
 xbyXqbNUzUSRXKbUgzTCax+iQIURzo7j68eSZWnMpzZe+pD0Pami+RmIq41wCi+03ZYy
 g8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lEZOg2+Pg+PWUdy2vuWhDST9DUP8pdhSxb8BJWFY9tE=;
 b=ssoQWcIHYHjvohzBXGM+hOa4wlnKKZBtRx7X738hXc3gz8YCbJgWq+eX6+79guScWK
 OxqqqaUivTQBdQcpW2wyvAMTh6+uqWnr+DOP2Ss16Ijyg9IQtn4phtoktmEGHgr9HeEL
 040o2PYQCyIvrfVq1WYnz4HMjKB6h2HyWUEHr4yDfGxWlchHQtS0aGwCnWUAb2Tddb53
 VFMmMT3k3GbwKC1rfZuy9dIBypWUgLsQXIyqjSZ7y99LhWR8irguvvT8u38vabqhuvDe
 xCOrK3go5Lq3FlM6joHDmdBfxgOp000jqk/Icij6ZifqyI3Y6VHcK1IqDNONGPJfC5vc
 4fYA==
X-Gm-Message-State: AOAM530rpsRJASQIm6Hq/QXoiqHzVbkB7cFNf5QFHM7SbMrKtOcfjBKi
 0SNdx8RMvlYxq6g1AM06WlLuaKwgWvL0/g==
X-Google-Smtp-Source: ABdhPJyt2qxVoOO+tTtlJp1TOkO9FcEk2yiuWPPlEX8dqIesxpSd7BbAyc596g4eq07ogrDnKa6onQ==
X-Received: by 2002:a2e:3c1a:: with SMTP id j26mr1769040lja.294.1606218302727; 
 Tue, 24 Nov 2020 03:45:02 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:44aa:1e8:bf33:c8db:a3e2:c358?
 ([2a00:1fa0:44aa:1e8:bf33:c8db:a3e2:c358])
 by smtp.gmail.com with ESMTPSA id k28sm983027lfj.48.2020.11.24.03.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 03:45:02 -0800 (PST)
Subject: Re: [PATCH v3] usb: musb: remove unused variable 'devctl'
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
To: min.guo@mediatek.com, Bin Liu <b-liu@ti.com>
References: <20201124084955.30270-1-min.guo@mediatek.com>
 <c2f3f643-8514-5c4a-dd52-7abc8a6dc501@gmail.com>
Message-ID: <df11df93-f2ab-157c-22ea-cb8b8a0d9969@gmail.com>
Date: Tue, 24 Nov 2020 14:45:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <c2f3f643-8514-5c4a-dd52-7abc8a6dc501@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_064505_523219_D50D7DD9 
X-CRM114-Status: GOOD (  19.05  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, chunfeng.yun@mediatek.com,
 Alan Stern <stern@rowland.harvard.edu>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMTEvMjQvMjAgMTI6MTMgUE0sIFNlcmdlaSBTaHR5bHlvdiB3cm90ZToKClsuLi5dCj4+IEZy
b206IE1pbiBHdW8gPG1pbi5ndW9AbWVkaWF0ZWsuY29tPgo+Pgo+PiBSZW1vdmUgdW51c2VkICdk
ZXZjdGwnIHZhcmlhYmxlIHRvIGZpeCBjb21waWxlIHdhcm5pbmdzOgo+Pgo+PiDCoMKgwqDCoCBk
cml2ZXJzL3VzYi9tdXNiL211c2Joc2RtYS5jOiBJbiBmdW5jdGlvbiAnZG1hX2NvbnRyb2xsZXJf
aXJxJzoKPj4gwqDCoMKgwqAgZHJpdmVycy91c2IvbXVzYi9tdXNiaHNkbWEuYzozMjQ6ODogd2Fy
bmluZzogdmFyaWFibGUgJ2RldmN0bCcgc2V0Cj4+IMKgwqDCoMKgIGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWluIEd1byA8bWlu
Lmd1b0BtZWRpYXRlay5jb20+Cj4+IC0tLQo+PiBjaGFuZ2VzIGluIHYzCj4+IHN1Z2dlc3RlZCBi
eSBHcmVnIEtyb2FoLUhhcnRtYW46Cj4+IEFkZCBhIGNvbW1lbnQuCj4+Cj4+IGNoYW5nZXMgaW4g
djIKPj4gc3VnZ2VzdGVkIGJ5IEFsYW4gU3Rlcm46Cj4+IEFkZCB2b2lkIGJlZm9yZSBtdXNiX3Jl
YWQgdG8gaW5kaWNhdGUgdGhhdCB0aGUgcmVnaXN0ZXIgTVVTQl9ERVZDVEwKPj4gd2FzIGludGVu
ZGVkIHRvIGJlIHJlYWQgYW5kIGRpc2NhcmRlZC4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvdXNiL211
c2IvbXVzYmhzZG1hLmMgfCA4ICsrKysrLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9t
dXNiL211c2Joc2RtYS5jIGIvZHJpdmVycy91c2IvbXVzYi9tdXNiaHNkbWEuYwo+PiBpbmRleCAw
YWFjZmM4YmU1YTEuLjJhMzQ1YjRhZDAxNSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy91c2IvbXVz
Yi9tdXNiaHNkbWEuYwo+PiArKysgYi9kcml2ZXJzL3VzYi9tdXNiL211c2Joc2RtYS5jCj4gWy4u
Ll0KPj4gQEAgLTMzNiw3ICszMzQsMTEgQEAgaXJxcmV0dXJuX3QgZG1hX2NvbnRyb2xsZXJfaXJx
KGludCBpcnEsIHZvaWQgKnByaXZhdGVfZGF0YSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCBtdXNiX2NoYW5uZWwtPmxlbikgPwo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIj0+IHJlY29uZmlnIDAiIDog
Ij0+IGNvbXBsZXRlIik7Cj4+IMKgIC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2
Y3RsID0gbXVzYl9yZWFkYihtYmFzZSwgTVVTQl9ERVZDVEwpOwo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC8qCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IFNvbWUgaGFyZHdhcmUgbWF5IG5lZWQgdG8gcmVhZCB0aGUKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICogTVVTQl9ERVZDVEwgcmVnaXN0ZXIgb25jZSB0byB0YWtlIGVmZmVj
dC4KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKHZvaWQpbXVzYl9yZWFkYihtYmFzZSwgTVVTQl9ERVZDVEwp
Owo+IAo+IMKgwqAgSG0sIGZvcmNpYmx5IHJlYWRpbmcgRGV2Q3RsIGluIHRoZSBETUEgZHJpdmVy
Li4uIHNvdW5kcyBxdWl0ZSBub25zZW5zaWNhbGx5LiBMZW1tZSB0YWtlIGEgbG9vay4uLgoKICAg
SW5kZWVkLCBwcmlvciB0byBjb21taXQgYzQxOGZkNmMwMWZiYzU1MTZhMmNkMWVhZjFkZjFlYzg2
ODY5MDI4YSAoInVzYjogZ2FkZ2V0OiBtdXNiOiBmaXggc2hvcnQKaXNvYyBwYWNrZXRzIHdpdGgg
aW52ZW50cmEgZG1hIikgdGhlIERldkN0bCByZWFkIHdhcyBkb25lIGluIG9yZGVyIHRvIGNoZWNr
IHRoZSBEZXZDdGwuSG9zdE1vZGUgYml0IC0tCnRoaXMgdGVzdCB3YXMgcmVtb3ZlZCBidXQgdGhl
IERldkN0bCByZWFkIHdhcyBsZWZ0IGludGFjdC4uLiBzbyBteSB2b3RlIGdvZXMgZm9yIGRlbGV0
aW5nIGJvdGggdGhlCnJlYWQgYW5kIHRoZSB2YXJpYWJsZS4uLgoKPiBbLi4uXQoKTUJSLCBTZXJn
ZWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
