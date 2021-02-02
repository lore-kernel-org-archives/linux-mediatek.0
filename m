Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E100C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 01:34:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA44E64ECB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 01:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA44E64ECB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nvgx1plinfzjS3am8pZE2e34NQbNPIULHWVtDfWytpM=; b=CY+sp9EhNSe1D2UanLVvT5Aiz
	BMf7hS5BQuLKN7WnVzsZuOlfWdzJYUsnY+yS81B22ohTEQ55qwpr/TZFwUyQyxuryKUrk4GGidgCu
	FBwqrLzI5jOPTSbRZBdy3hZqBYPuEEA3j592YQASnla5n6bV3r5CC3xmkVGR4Xy4AgXSK3AmFfiOL
	l407WqQVT8OsEmLPyrqnH/8l3APccgl7eK41LsmVDwtcpvzSd5uw6gzu9WqzLrbDXGFER9ABDI6ZP
	NRsXsCkPkGXIs0oht9diBc6RceljhPWRyja7suOr31lpITGXUcWZXfotkhM1ffOIq5gNYU+OZiwEI
	N8o+oBarA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6ka1-0002EP-5z; Tue, 02 Feb 2021 01:34:09 +0000
Received: from eu-shark2.inbox.eu ([195.216.236.82])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6kZw-0002E1-NV
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 01:34:06 +0000
Received: from eu-shark2.inbox.eu (localhost [127.0.0.1])
 by eu-shark2-out.inbox.eu (Postfix) with ESMTP id 8CB7C42C85E;
 Tue,  2 Feb 2021 03:34:01 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1612229641; bh=JSdLbx9dJF1SOeriTAvfNbXrmgWVUy1I+Tq81M+VDB4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=EWh8TKCZQaAdQK2Q36dGLJss3mrxmuaqnLucnTi5Ojr1y58XNbVrb+nrOdESXJc+A
 Y/42X6qhsPG0wtAX1FGCghwbaOTZA+6GjXdRYjBMLkzyh9XaOYf7AFtIkQyoH79G9D
 GCAIoLDEOnyYaKVS3vsZm/BZk2nujlohss0vwSbg=
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id 696E93E03E8;
 Tue,  2 Feb 2021 03:34:01 +0200 (EET)
Received: from pc (unknown [165.231.161.4])
 (Authenticated sender: arzamas-16@mail.ee)
 by mail.inbox.eu (Postfix) with ESMTPA id 6B49D1BE0095;
 Tue,  2 Feb 2021 03:34:00 +0200 (EET)
Date: Tue, 2 Feb 2021 04:33:55 +0300
From: Boris Lysov <arzamas-16@mail.ee>
To: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] watchdog: mtk_wdt: add support for 16-bit control
 registers
Message-ID: <20210202043355.18080818@pc>
In-Reply-To: <050f2f8e-9c3c-10e3-05ef-cd84e949b98f@roeck-us.net>
References: <20210131234425.9773-1-arzamas-16@mail.ee>
 <20210131234425.9773-3-arzamas-16@mail.ee>
 <050f2f8e-9c3c-10e3-05ef-cd84e949b98f@roeck-us.net>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: 6NpmlY9HHDysjlqlQGenZQs2qS9XXu7k5ea80QNdgAiJPFvxYip+XRWr7hJ7DSP4og==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_203404_984042_E50098F9 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

0JIgU3VuLCAzMSBKYW4gMjAyMSAxNjozMTowOSAtMDgwMApHdWVudGVyIFJvZWNrIDxsaW51eEBy
b2Vjay11cy5uZXQ+INC/0LjRiNC10YI6Cgo+IFdlIGNhbid0IGRvIHRoaXMuIFdpdGggdGhpcyBm
bGFnIGVuYWJsZWQsIHRoZSB3YXRjaGRvZyB3b24ndAo+IHN1cHBvcnQgb3RoZXIgU29DcywgYW5k
IHRoZXJlIGlzIG5vdGhpbmcgdGhhdCBwcmV2ZW50cyB0aGUgZmxhZwo+IGZyb20gYmVpbmcgc2V0
IGZvciB0aG9zZSBTb0NzLgo+IAo+IFRoaXMgaGFzIHRvIGJlIGhhbmRsZWQgZGlmZmVyZW50bHks
IHdpdGhvdXQgY29uZmlndXJhdGlvbgo+IGZsYWcuIE1heWJlIHVzZSByZWdtYXAgZm9yIHJlZ2lz
dGVyIGFkZHJlc3NlcywgW3NuaXBdLAo+IG9yIHVzZSBhY2Nlc3NvciBmdW5jdGlvbnMgaW4gbXRr
X3dkdF9kZXYuCgpUaGFuayB5b3UgZm9yIHJldmlld2luZyBteSBwYXRjaCEKCkkgd2lsbCBjb25z
aWRlciBzdWdnZXN0ZWQgZml4ZXMsIGFuZCBJIHdpbGwgY29tZSB1cCB3aXRoIGJldHRlciBzb2x1
dGlvbgppbiBWMi4gSSdtIGJlZ2lubmVyIGRldmVsb3BlciwgYW5kIGFtIHN0aWxsIGxlYXJuaW5n
LgoKPiB1c2UgdGhlIGNvbXBhdGlibGUgc3RyaW5nIHRvIGRldGVybWluZSB3aGljaCByZWdtYXAg
c2V0dGluZ3MgdG8gdXNlCgpJIHRoaW5rIHJlbHlpbmcgb24gaGFyZGNvZGVkICJjb21wYXRpYmxl
IHN0cmluZyAtIHNldHRpbmdzIiBwYWlycyBpbgpkcml2ZXIgaXMgbm90IGdvb2QuIFdoaWxzdCBt
b3N0IE1lZGlhdGVrIHdhdGNoZG9ncyBJJ3ZlIHNlZW4gdXNlCnNpbWlsYXIgZHJpdmVycywgbm8g
b25lIChleGNlcHQgTWVkaWF0ZWsgaXRzZWxmLCBvZiBjb3Vyc2UpIGtub3dzIGZvcgpzdXJlIGhv
dyBtYW55IGRldmljZXMgdXNlIDE2LWJpdCBtb2RlLCBhbmQgc3BlY2lmeWluZyBlYWNoIG9uZSBp
biBDCmNvZGUgbWF5IF90aGVvcmV0aWNhbGx5XyBibG9hdCBpdC4gKHdlbGwsIG9uIHRoZSBvdGhl
ciBoYW5kLCBJJ3ZlIHNlZW4Kb3RoZXIgd2F0Y2hkb2cgZHJpdmVycyB3aXRoIG1hbnkgY29tcGF0
aWJsZSBkZXZpY2VzIGxpc3RlZCBpbiBDIGNvZGUsCmFuZCB0aGV5IGRpZG4ndCBzZWVtIGJsb2F0
ZWQgYXQgYWxsKQoKV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgaW1wbGVtZW50aW5nIGEgc2ltcGxl
IGJvb2xlYW4gZmxhZyBpbgpkdC1iaW5kaW5nIGZvciBlbmFibGluZyB0aGUgMTYtYml0IG9wZXJh
dGlvbiBtb2RlPyBTb21ldGhpbmcgbGlrZQoibWVkaWF0ZWssd2F0Y2hkb2ctMTZiaXRzIiBbMV0g
LCB3aGljaCB0aGUgZHJpdmVyIHdvdWxkIGNoZWNrIGZvciBpbgp0aGUgYG10a193ZHRfcHJvYmVg
IGFuZCBzZXQgY29ycmVzcG9uZGluZyByZWdtYXBzLiBBcyByZXN1bHQsIHRoZXJlCndvbid0IGJl
IGEgbmVlZCBmb3Iga2VybmVsIGNvbmZpZ3VyYXRpb24gZmxhZywgYW5kIG90aGVyIHdhdGNoZG9n
cwp3b3VsZCBiZSBzdXBwb3J0ZWQuCgpNb3N0IGxpa2VseSB0aGlzIGlkZWEgZG9lc24ndCBzb3Vu
ZCBnb29kIGFzIEkgcG9ydHJheSBpdCwgYnV0IEkgd291bGQKc3RpbGwgbGlrZSB0byBoZWFyIHlv
dXIgb3BpbmlvbiBhYm91dCBpdC4gVGhhbmtzLgoKUmVmZXJlbmNlczoKWzFdIE1lZGlhdGVrIFVB
UlQgQVBETUEgZHJpdmVyIHVzZXMgc2ltaWxhciBmbGFnCmNhbGxlZCBgbWVkaWF0ZWssZG1hLTMz
Yml0c2AKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9tdGstdWFydC1hcGRt
YS50eHQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
