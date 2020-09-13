Return-Path: <SRS0=V4X5=CW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AABBC43461
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2020 10:18:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5244720663
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2020 10:18:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j2e7N5C5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="nyykmS9A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5244720663
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hHx4ibvrbxsnRFlpM4UaqdMZcOqRhG8xHiy0gF9je6E=; b=j2e7N5C5xMf1qIJUQ8XeStvJv
	aZC4CQFRR5xOPcJqD8oDSGAbDiTMYXulnroDE4a6QLLIwNEDuzaw2vWqU3ols5hTTEiy1VBDVNxH2
	6PUtFqYnqh/F5I4iZBDAVOrG2L5lMyFL2BNQK+UHZctsOTWiysBdb5WN3aKRhb61T3IZw6RlLI3NY
	8Jpfq+aAcVt+/atB8m2XP6abAlVadk36RU5QkdhKSfKndvxF+7flCjIP7g/kJ8eZaFsR+y2036Wm6
	nQWo2rcBebH8tPEPGUPrFRZIpq0lqLJQzbDlIe6kpHRthDk01XeVEwQR/8Rdv4EGfeY8I17llrQiK
	QLJEZW2mA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHP52-0007E4-9S; Sun, 13 Sep 2020 10:17:56 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHP4v-0007Cj-Nq
 for linux-mediatek@lists.infradead.org; Sun, 13 Sep 2020 10:17:51 +0000
Received: by mail-qk1-x744.google.com with SMTP id v123so14191953qkd.9
 for <linux-mediatek@lists.infradead.org>; Sun, 13 Sep 2020 03:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2/rTINPcp/OFtffjcOu1onBIlOhuthR1U8PEEQixv6o=;
 b=nyykmS9AkG4i9TMnFMtKZHTav1DMaE8SUFI+3OiVcdw3B0DLu+pwVWzwQ6kGDjXf+l
 K7px0dO6gMMsvi3FkubJfozBEGHG+rP93NI06PRHsQgki8OoPHqY4TXz13GUqzh7kCbd
 eNxIqk344Vpp0aL3iLW26m4v2V5FRN8BDQVamB8DMWFVrdn5Qah6vQTLKhO0Wcbgi3Lw
 nasjdseAWfh5Qv3irs0+8a5dzF3edJvciMdqoCgZAggoLv6zwMFraDCMREsb8aernu5v
 dqog9E6ULf0mB0oCupoPtZXG7qAqgf8qf6NbYBR8vFecPrkM+QmWOQrwLg7/iw0aaUS+
 w0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2/rTINPcp/OFtffjcOu1onBIlOhuthR1U8PEEQixv6o=;
 b=qvlcPej+k9vG8SUufEj22dwyp9pTOz9N0QRx0Zrvk3TJuNTuF/bDsnLOpYyEy/yd7+
 vB+ZY2Z21HAkbQL9l4eM2UVHUqnt0FnNeeCD4ZYH3ocRYolit46BlmWnh2P4vYCVa5vR
 oiPhzET1PZxoZ/l75PlwlGO0Wcq8byjJAWUzk6Y0o9Ehk7BmCsBv/VzeSyCdQTqrPeBd
 o7hVYIQMwyKfIZr8dJWo6IMyoL50LWlKoxkphAy0BD2yxwCzQS9KxczItfQDU2mITPep
 XSpqAbZc9ROm28AiJxIVIso9WpVl8iaSbcwXJzJHpSOVmbMeN3zF1Rf0NTuC5XGtTxDw
 NZYw==
X-Gm-Message-State: AOAM532RgWJrkwJHCQa7yrbgIm/afOpAtyr92jX76yLmoUhJUjZYeVSO
 150nRy5rPh0iq8y8fu/QTfuc+ek5jvc/GkaOJYksMw==
X-Google-Smtp-Source: ABdhPJwU0iwVFH+xDwbhrGpX0QTr2ldrPpq71OiTnxbsBdPs9HzLJVfQX1DW0ujxC9OEcCab5tZQ/lNJtojI2hTfw9A=
X-Received: by 2002:a37:5684:: with SMTP id k126mr8015895qkb.43.1599992264608; 
 Sun, 13 Sep 2020 03:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200825015654.27781-1-walter-zh.wu@mediatek.com>
 <CANpmjNOvj+=v7VDVDXpsUNZ9o0+KoJVJs0MjLhwr0XpYcYQZ5g@mail.gmail.com>
 <CAAeHK+yVShDPCxVKDsO_5SwoM2ZG7x7byUJ74PtB7ekY61L2YQ@mail.gmail.com>
In-Reply-To: <CAAeHK+yVShDPCxVKDsO_5SwoM2ZG7x7byUJ74PtB7ekY61L2YQ@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sun, 13 Sep 2020 12:17:33 +0200
Message-ID: <CACT4Y+b1OimWNQCx-rGvSgC1RheLAv9mv2xzRnwkn98AsdTgXA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] kasan: add workqueue and timer stack for generic
 KASAN
To: Andrey Konovalov <andreyknvl@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_061749_812206_057AFED1 
X-CRM114-Status: GOOD (  25.50  )
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
Cc: Marco Elver <elver@google.com>, John Stultz <john.stultz@linaro.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Stephen Boyd <sboyd@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Walter Wu <walter-zh.wu@mediatek.com>, kasan-dev <kasan-dev@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Tejun Heo <tj@kernel.org>,
 linux-mediatek@lists.infradead.org, Alexander Potapenko <glider@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBdWcgMjYsIDIwMjAgYXQgMjozMCBQTSAnQW5kcmV5IEtvbm92YWxvdicgdmlhIGth
c2FuLWRldgo8a2FzYW4tZGV2QGdvb2dsZWdyb3Vwcy5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBB
dWcgMjUsIDIwMjAgYXQgMTA6MjYgQU0gJ01hcmNvIEVsdmVyJyB2aWEga2FzYW4tZGV2Cj4gPGth
c2FuLWRldkBnb29nbGVncm91cHMuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIDI1IEF1ZyAy
MDIwIGF0IDAzOjU3LCBXYWx0ZXIgV3UgPHdhbHRlci16aC53dUBtZWRpYXRlay5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBTeXpib3QgcmVwb3J0cyBtYW55IFVBRiBpc3N1ZXMgZm9yIHdvcmtxdWV1
ZSBvciB0aW1lciwgc2VlIFsxXSBhbmQgWzJdLgo+ID4gPiBJbiBzb21lIG9mIHRoZXNlIGFjY2Vz
cy9hbGxvY2F0aW9uIGhhcHBlbmVkIGluIHByb2Nlc3Nfb25lX3dvcmsoKSwKPiA+ID4gd2Ugc2Vl
IHRoZSBmcmVlIHN0YWNrIGlzIHVzZWxlc3MgaW4gS0FTQU4gcmVwb3J0LCBpdCBkb2Vzbid0IGhl
bHAKPiA+ID4gcHJvZ3JhbW1lcnMgdG8gc29sdmUgVUFGIG9uIHdvcmtxdWV1ZS4gVGhlIHNhbWUg
bWF5IHN0YW5kIGZvciB0aW1lcy4KPiA+ID4KPiA+ID4gVGhpcyBwYXRjaHNldCBpbXByb3ZlcyBL
QVNBTiByZXBvcnRzIGJ5IG1ha2luZyB0aGVtIHRvIGhhdmUgd29ya3F1ZXVlCj4gPiA+IHF1ZXVl
aW5nIHN0YWNrIGFuZCB0aW1lciBzdGFjayBpbmZvcm1hdGlvbi4gSXQgaXMgdXNlZnVsIGZvciBw
cm9ncmFtbWVycwo+ID4gPiB0byBzb2x2ZSB1c2UtYWZ0ZXItZnJlZSBvciBkb3VibGUtZnJlZSBt
ZW1vcnkgaXNzdWUuCj4gPiA+Cj4gPiA+IEdlbmVyaWMgS0FTQU4gYWxzbyByZWNvcmRzIHRoZSBs
YXN0IHR3byB3b3JrcXVldWUgYW5kIHRpbWVyIHN0YWNrcyBhbmQKPiA+ID4gcHJpbnRzIHRoZW0g
aW4gS0FTQU4gcmVwb3J0LiBJdCBpcyBvbmx5IHN1aXRhYmxlIGZvciBnZW5lcmljIEtBU0FOLgo+
ID4gPgo+ID4gPiBbMV1odHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2cvc3l6a2FsbGVyLWJ1Z3Mv
c2VhcmNoP3E9JTIydXNlLWFmdGVyLWZyZWUlMjIrcHJvY2Vzc19vbmVfd29yawo+ID4gPiBbMl1o
dHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2cvc3l6a2FsbGVyLWJ1Z3Mvc2VhcmNoP3E9JTIydXNl
LWFmdGVyLWZyZWUlMjIlMjBleHBpcmVfdGltZXJzCj4gPiA+IFszXWh0dHBzOi8vYnVnemlsbGEu
a2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTk4NDM3Cj4gPiA+Cj4gPiA+IFdhbHRlciBXdSAo
Nik6Cj4gPiA+IHRpbWVyOiBrYXNhbjogcmVjb3JkIHRpbWVyIHN0YWNrCj4gPiA+IHdvcmtxdWV1
ZToga2FzYW46IHJlY29yZCB3b3JrcXVldWUgc3RhY2sKPiA+ID4ga2FzYW46IHByaW50IHRpbWVy
IGFuZCB3b3JrcXVldWUgc3RhY2sKPiA+ID4gbGliL3Rlc3Rfa2FzYW4uYzogYWRkIHRpbWVyIHRl
c3QgY2FzZQo+ID4gPiBsaWIvdGVzdF9rYXNhbi5jOiBhZGQgd29ya3F1ZXVlIHRlc3QgY2FzZQo+
ID4gPiBrYXNhbjogdXBkYXRlIGRvY3VtZW50YXRpb24gZm9yIGdlbmVyaWMga2FzYW4KPiA+Cj4g
PiBBY2tlZC1ieTogTWFyY28gRWx2ZXIgPGVsdmVyQGdvb2dsZS5jb20+Cj4KPiBSZXZpZXdlZC1i
eTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgoKUmV2aWV3ZWQtYnk6
IERtaXRyeSBWeXVrb3YgPGR2eXVrb3ZAZ29vZ2xlLmNvbT4KClRoYW5rcyEgVGhlIFVBRiByZXBv
cnRzIHdpdGggUkNVIHN0YWNrcyB0aGF0IEkgc2VlIG5vdyBhcmUganVzdCDwn5Sl8J+UpfCflKUK
Cj4gPiA+IC0tLQo+ID4gPgo+ID4gPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ID4gPiAtIG1vZGlmeSBr
YXNhbiBkb2N1bWVudCB0byBiZSBtb3JlIHJlYWRhYmxlLgo+ID4gPiAgIFRoYW5rcyBmb3IgTWFy
Y28gc3VnZ2VzdGlvbi4KPiA+ID4KPiA+ID4gQ2hhbmdlcyBzaW5jZSB2MToKPiA+ID4gLSBUaGFu
a3MgZm9yIE1hcmNvIGFuZCBUaG9tYXMgc3VnZ2VzdGlvbi4KPiA+ID4gLSBSZW1vdmUgdW5uZWNl
c3NhcnkgY29kZSBhbmQgZml4IGNvbW1pdCBsb2cKPiA+ID4gLSByZXVzZSBrYXNhbl9yZWNvcmRf
YXV4X3N0YWNrKCkgYW5kIGF1eF9zdGFjawo+ID4gPiAgIHRvIHJlY29yZCB0aW1lciBhbmQgd29y
a3F1ZXVlIHN0YWNrLgo+ID4gPiAtIGNoYW5nZSB0aGUgYXV4IHN0YWNrIHRpdGxlIGZvciBjb21t
b24gbmFtZS4KPiA+ID4KPiA+ID4gLS0tCj4gPiA+Cj4gPiA+IERvY3VtZW50YXRpb24vZGV2LXRv
b2xzL2thc2FuLnJzdCB8ICA0ICsrLS0KPiA+ID4ga2VybmVsL3RpbWUvdGltZXIuYyAgICAgICAg
ICAgICAgIHwgIDMgKysrCj4gPiA+IGtlcm5lbC93b3JrcXVldWUuYyAgICAgICAgICAgICAgICB8
ICAzICsrKwo+ID4gPiBsaWIvdGVzdF9rYXNhbi5jICAgICAgICAgICAgICAgICAgfCA1NCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4g
bW0va2FzYW4vcmVwb3J0LmMgICAgICAgICAgICAgICAgIHwgIDQgKystLQo+ID4gPiA1IGZpbGVz
IGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IC0t
Cj4gPiA+IFlvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmli
ZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMgImthc2FuLWRldiIgZ3JvdXAuCj4gPiA+IFRvIHVuc3Vi
c2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQs
IHNlbmQgYW4gZW1haWwgdG8ga2FzYW4tZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20u
Cj4gPiA+IFRvIHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgaHR0cHM6Ly9n
cm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2thc2FuLWRldi8yMDIwMDgyNTAxNTY1NC4yNzc4MS0x
LXdhbHRlci16aC53dSU0MG1lZGlhdGVrLmNvbS4KPiA+Cj4gPiAtLQo+ID4gWW91IHJlY2VpdmVk
IHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdy
b3VwcyAia2FzYW4tZGV2IiBncm91cC4KPiA+IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91
cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1haWwgdG8ga2Fz
YW4tZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20uCj4gPiBUbyB2aWV3IHRoaXMgZGlz
Y3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dp
ZC9rYXNhbi1kZXYvQ0FOcG1qTk92aiUyQiUzRHY3VkRWRFhwc1VOWjlvMCUyQktvSlZKczBNakxo
d3IwWHBZY1lRWjVnJTQwbWFpbC5nbWFpbC5jb20uCj4KPiAtLQo+IFlvdSByZWNlaXZlZCB0aGlz
IG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMg
Imthc2FuLWRldiIgZ3JvdXAuCj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBz
dG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byBrYXNhbi1kZXYr
dW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbS4KPiBUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBv
biB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9rYXNhbi1k
ZXYvQ0FBZUhLJTJCeVZTaERQQ3hWS0RzT181U3dvTTJaRzd4N2J5VUo3NFB0Qjdla1k2MUwyWVEl
NDBtYWlsLmdtYWlsLmNvbS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
