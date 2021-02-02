Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE921C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 01:55:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EEC664EB8
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 01:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EEC664EB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u0z9l8KROTscJGKjM5U2ePlT1G6Pzyu/KPxc8zXbbX4=; b=AFg3bc0SQSS4i7Lky1YJR+pTy
	MK1QRK9iltAv/v8cLGjq/40ZBdfmnxnzQLK7XWyNPtYAdfNLZy5MOOSIbbqIXME3LqsWb+OnszK/A
	2COZauQ9vm1MMrrqSsdbOsDXDwuqZqKT0sSKpZp6va9uXBWQjIuJKTP1tCLGRBKaoctiuN8WbyRjf
	6XeSMqbwHlW3mjxQONUC5k/gk9QukweUEbgITye2cTEQxQ8rC5nH9ni4pGLjqm77nqrprBBqgDXoZ
	tWyN64W1wahg0ilBpKMGmaWjCCY9Ro/1GYgDmxzjNrxJ0Vp6zGt8kk9703BP4+KfzcR6kqSU2nS0P
	WrSujanIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6kum-00039e-2M; Tue, 02 Feb 2021 01:55:36 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6kuj-000394-Ej
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 01:55:34 +0000
Received: by mail-oi1-x231.google.com with SMTP id m13so21086908oig.8
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Feb 2021 17:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=px4xHV/lc9T/vZKpSw240zVsyEroYR5d5mfmRJgsVL4=;
 b=MpSMd2qlcU8YvSg7d9BMVHk1gBCDRLrID5u0t6xWjjQpN5tvEtlawfqbovDU52Q7SD
 +n4lMlHhSrVGyP+UoWBdsn/PA+98Ix1oxrORgEhn//t1OZ0gNn5CV5kfYF3N4JAUUr9/
 CED01+rVGVyJFozJSkQF5J9W6fipuKoI/R6Am3Zvdqh/GO60JzRCqIkVTrPX//RenK7V
 4g0GeS0wmeeq+Oti0NJvnqhj8IFRTtRBUZgnaG2nF/hCSyutdQLhEC0ZRQQya8sF+9bK
 7c00XJz/Jpw/dir4IcSxIB859IRbe87YDtm+InmHHLa5LKni+VJbcIOiGaj9tPk0cTFp
 D7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=px4xHV/lc9T/vZKpSw240zVsyEroYR5d5mfmRJgsVL4=;
 b=IWzeO3wJTgzmH608LzOxrL2wWfCCJbtFkxFaJcS6tVQFzmKvJ3EeZaieYzD/UkYwC2
 bnjR0NJ8kZH70bTTwoVZjKMwFduzOVpIGjFbz0l0WMlOQklUOVfpKLIaD5zZ3iWMdDXg
 6lDhV79Oo3mcudjGHAqRZF5tKcQ0f50Jq0kknfaU77o97ssM0u8ciXydKM7gllfsv0Qo
 5gRZAi2QrxlCVWr4RRhZgJ8Qe+LBBpdS5nj/pxZXip4sn2S5aER+ecn7IdtymH9zbiXW
 aZQ6kfrEsi/TSmMgodMtgLIlwG/tdPfM0qZsO4NK1+7SDV3A8NExUTun4G82a6/36qeX
 k3rQ==
X-Gm-Message-State: AOAM530PdLq2KWt6hZXYquWabRWTD3+qTYFFrCsppNYyVD+67Y1O2RG3
 k8SMFp0yllLo6OYZ8mgrM4W2W6pKQOQ=
X-Google-Smtp-Source: ABdhPJykgB3Hzj0A1uMVBuKxaCHUy+yp9EcWEPj4hmDH5BTGJAZYhf4s196gnuGgRSatp+TDjPac5Q==
X-Received: by 2002:aca:1e0f:: with SMTP id m15mr1169823oic.41.1612230929727; 
 Mon, 01 Feb 2021 17:55:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 x31sm4298703otb.4.2021.02.01.17.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 17:55:28 -0800 (PST)
Subject: Re: [PATCH 2/3] watchdog: mtk_wdt: add support for 16-bit control
 registers
To: Boris Lysov <arzamas-16@mail.ee>, devicetree@vger.kernel.org
References: <20210131234425.9773-1-arzamas-16@mail.ee>
 <20210131234425.9773-3-arzamas-16@mail.ee>
 <050f2f8e-9c3c-10e3-05ef-cd84e949b98f@roeck-us.net>
 <20210202043355.18080818@pc>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <9f8ce570-50d3-d136-e1f2-3eccb567c939@roeck-us.net>
Date: Mon, 1 Feb 2021 17:55:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210202043355.18080818@pc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_205533_549749_4D318876 
X-CRM114-Status: GOOD (  23.47  )
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
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMi8xLzIxIDU6MzMgUE0sIEJvcmlzIEx5c292IHdyb3RlOgo+INCSIFN1biwgMzEgSmFuIDIw
MjEgMTY6MzE6MDkgLTA4MDAKPiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+INC/
0LjRiNC10YI6Cj4gCj4+IFdlIGNhbid0IGRvIHRoaXMuIFdpdGggdGhpcyBmbGFnIGVuYWJsZWQs
IHRoZSB3YXRjaGRvZyB3b24ndAo+PiBzdXBwb3J0IG90aGVyIFNvQ3MsIGFuZCB0aGVyZSBpcyBu
b3RoaW5nIHRoYXQgcHJldmVudHMgdGhlIGZsYWcKPj4gZnJvbSBiZWluZyBzZXQgZm9yIHRob3Nl
IFNvQ3MuCj4+Cj4+IFRoaXMgaGFzIHRvIGJlIGhhbmRsZWQgZGlmZmVyZW50bHksIHdpdGhvdXQg
Y29uZmlndXJhdGlvbgo+PiBmbGFnLiBNYXliZSB1c2UgcmVnbWFwIGZvciByZWdpc3RlciBhZGRy
ZXNzZXMsIFtzbmlwXSwKPj4gb3IgdXNlIGFjY2Vzc29yIGZ1bmN0aW9ucyBpbiBtdGtfd2R0X2Rl
di4KPiAKPiBUaGFuayB5b3UgZm9yIHJldmlld2luZyBteSBwYXRjaCEKPiAKPiBJIHdpbGwgY29u
c2lkZXIgc3VnZ2VzdGVkIGZpeGVzLCBhbmQgSSB3aWxsIGNvbWUgdXAgd2l0aCBiZXR0ZXIgc29s
dXRpb24KPiBpbiBWMi4gSSdtIGJlZ2lubmVyIGRldmVsb3BlciwgYW5kIGFtIHN0aWxsIGxlYXJu
aW5nLgo+IAo+PiB1c2UgdGhlIGNvbXBhdGlibGUgc3RyaW5nIHRvIGRldGVybWluZSB3aGljaCBy
ZWdtYXAgc2V0dGluZ3MgdG8gdXNlCj4gCj4gSSB0aGluayByZWx5aW5nIG9uIGhhcmRjb2RlZCAi
Y29tcGF0aWJsZSBzdHJpbmcgLSBzZXR0aW5ncyIgcGFpcnMgaW4KPiBkcml2ZXIgaXMgbm90IGdv
b2QuIFdoaWxzdCBtb3N0IE1lZGlhdGVrIHdhdGNoZG9ncyBJJ3ZlIHNlZW4gdXNlCgpTbyB5b3Ug
YXJlIHNheWluZyB0aGF0IHRoZSBleGlzdGluZyBtZWRpYXRlayB3YXRjaGRvZyBkcml2ZXIgaXMg
bm90IGdvb2QgPwpPciB0aGF0IGl0IGlzIGdvb2QgZm9yIHNldHRpbmcgdGhlIG51bWJlciBvZiBz
dXBwb3J0ZWQgcmVzZXQgcGlucywKYnV0IG5vdCBmb3Igc2V0dGluZyB0aGUgcmVnaXN0ZXIgd2lk
dGggPwoKPiBzaW1pbGFyIGRyaXZlcnMsIG5vIG9uZSAoZXhjZXB0IE1lZGlhdGVrIGl0c2VsZiwg
b2YgY291cnNlKSBrbm93cyBmb3IKPiBzdXJlIGhvdyBtYW55IGRldmljZXMgdXNlIDE2LWJpdCBt
b2RlLCBhbmQgc3BlY2lmeWluZyBlYWNoIG9uZSBpbiBDCj4gY29kZSBtYXkgX3RoZW9yZXRpY2Fs
bHlfIGJsb2F0IGl0LiAod2VsbCwgb24gdGhlIG90aGVyIGhhbmQsIEkndmUgc2Vlbgo+IG90aGVy
IHdhdGNoZG9nIGRyaXZlcnMgd2l0aCBtYW55IGNvbXBhdGlibGUgZGV2aWNlcyBsaXN0ZWQgaW4g
QyBjb2RlLAo+IGFuZCB0aGV5IGRpZG4ndCBzZWVtIGJsb2F0ZWQgYXQgYWxsKQo+IAo+IFdoYXQg
ZG8geW91IHRoaW5rIGFib3V0IGltcGxlbWVudGluZyBhIHNpbXBsZSBib29sZWFuIGZsYWcgaW4K
PiBkdC1iaW5kaW5nIGZvciBlbmFibGluZyB0aGUgMTYtYml0IG9wZXJhdGlvbiBtb2RlPyBTb21l
dGhpbmcgbGlrZQo+ICJtZWRpYXRlayx3YXRjaGRvZy0xNmJpdHMiIFsxXSAsIHdoaWNoIHRoZSBk
cml2ZXIgd291bGQgY2hlY2sgZm9yIGluCj4gdGhlIGBtdGtfd2R0X3Byb2JlYCBhbmQgc2V0IGNv
cnJlc3BvbmRpbmcgcmVnbWFwcy4gQXMgcmVzdWx0LCB0aGVyZQo+IHdvbid0IGJlIGEgbmVlZCBm
b3Iga2VybmVsIGNvbmZpZ3VyYXRpb24gZmxhZywgYW5kIG90aGVyIHdhdGNoZG9ncwo+IHdvdWxk
IGJlIHN1cHBvcnRlZC4KPiAKPiBNb3N0IGxpa2VseSB0aGlzIGlkZWEgZG9lc24ndCBzb3VuZCBn
b29kIGFzIEkgcG9ydHJheSBpdCwgYnV0IEkgd291bGQKPiBzdGlsbCBsaWtlIHRvIGhlYXIgeW91
ciBvcGluaW9uIGFib3V0IGl0LiBUaGFua3MuCj4gCgpJIGRvbid0IGxpa2UgaXQgYXQgYWxsLCBJ
IGRvbid0IHNlZSB5b3VyIHByb2JsZW0sIGFuZCBtZWRpYXRlayxkbWEtMzNiaXRzCnNlZW1zIHRv
IGJlIGEgY29tcGxldGVseSBkaWZmZXJlbnQgc2NvcGUgKGFsbCBpdCBkb2VzIGlzIHRvIHRyaWdn
ZXIgYSBjb3VwbGUKb2YgYWRkaXRpb25hbCB3cml0ZXMsIG5vdCBjb250cm9sIHJlZ2lzdGVyIHdp
ZHRoKS4gT24gdGhlIG90aGVyIHNpZGUsCnlvdSB3b3VsZCBoYXZlIHRvIHNlbGwgaXQgdG8gZHQg
bWFpbnRhaW5lcnMsIG5vdCB0byBtZS4KCkd1ZW50ZXIKCj4gUmVmZXJlbmNlczoKPiBbMV0gTWVk
aWF0ZWsgVUFSVCBBUERNQSBkcml2ZXIgdXNlcyBzaW1pbGFyIGZsYWcKPiBjYWxsZWQgYG1lZGlh
dGVrLGRtYS0zM2JpdHNgCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9t
dGstdWFydC1hcGRtYS50eHQKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
