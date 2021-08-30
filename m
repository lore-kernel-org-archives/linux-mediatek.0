Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC25C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 03:49:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 666A060F3A
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 03:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 666A060F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khDNLiXeLW6ESNn1OQXbD4VqiDmkFDQFftWPvk0GZ0o=; b=kGz9FJps53E6uU
	XvE884t411XZtL9br8ErmvrNbVeTa++e9zSTuicXxSA3wS3IdO484/ZZxDgofl9phaE78wdgDJX2u
	XgDAAZ33wspNt47pEEyp4jHVq3UdjYyUvin47hqAm2VDfaZ4H/ARrZh5oF91OejDQReP4mtlioo8E
	Nib29dmOFeUArRFGNpGIErbbFazpgeBpKRHp5ldkxlHh230wlSi7vY2Ig/yQHw/v3uyDBooDyS7Sl
	AoE9bnzORCp/s+vWB2FQhAmXonS8Nb10X3PmQfY6TgltEnvH1vXjbYRwg3tdR1qh0wKDgCmILyyD6
	yCNcJpDg02OyYsFPjzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKYIo-00GMKD-Ol; Mon, 30 Aug 2021 03:49:42 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKYIj-00GMJF-FI
 for linux-mediatek@lists.infradead.org; Mon, 30 Aug 2021 03:49:41 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso12873346pjh.5
 for <linux-mediatek@lists.infradead.org>; Sun, 29 Aug 2021 20:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xd5yJwKt1hvq4WFoSQExGBW6PX7FM9F2aTtlw2PPNgY=;
 b=ODVUQWj14e/o8PyewpgAxwqPLPtNZxpcvYC7MQqgubN1OZCRQtPlikZPOuHN8zA+IJ
 AmMTMTtAN7CuB0VSOA/tB8UnW3E3LRwBSCrC4hUcaQenqGasINce2kIBeYcVbtSdJ9cu
 1Q8b8N+K08CnfXfINsRxo+rpJvIGJR1Y7DLjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xd5yJwKt1hvq4WFoSQExGBW6PX7FM9F2aTtlw2PPNgY=;
 b=oGIOPUVEalDhYFeN30d0umGFnlBmXXwW8gsMTUurmHjYPFEh59saNA8X81TIkdA215
 RAXDDBi/pGOwhNEOlHJStGYgDtii53tnSxeznXi0iHTc4RnzVdBJMjNm/volcZgLrvBO
 SIH6hbO7crGqe2mqzmynKEF/r4954z53pub3RCJKHTllrgXCphw6HYsqlQuc/U3frBSO
 WJQkIeVTy4er8B07GimQ0i2Yy6z1XdlGl7R8PoLVSsUjuPgPEXZAAGluGhwjcW/RDUkc
 6T2gTuw/D6gGoNyxOZMD8s+xkYBgEgJoVXIO2oT1363rvbCG1TNXoJngBUyD0dsmXdiU
 vDzw==
X-Gm-Message-State: AOAM533XkBeuzvbIOyWLAwQNgI+4fBD8hVDAHXOOoZfiwP7oAps1GK1w
 T/xsa+TjCazl6rVgisKMKbuuUkKMaiKMuuD3vSvVcg==
X-Google-Smtp-Source: ABdhPJxmwutWcvcGGTYek4J59y438R2Xw4VTIh9M3kBeplPDNHz99ge8PjQssGX5CCkpqjUVqqBAm7H1m2cmZJsH460=
X-Received: by 2002:a17:902:8c83:b029:129:17e5:a1cc with SMTP id
 t3-20020a1709028c83b029012917e5a1ccmr19994569plo.49.1630295374896; Sun, 29
 Aug 2021 20:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210826025144.51992-1-chunfeng.yun@mediatek.com>
 <20210826025144.51992-3-chunfeng.yun@mediatek.com>
 <CAATdQgBD+dTtBie-cNKRJbfxEpc3haqjfUu1k26mTk8pCSOEww@mail.gmail.com>
 <72ee7a203d8a49e6e43a954b45133470ee6d5c16.camel@mediatek.com>
 <CAATdQgA+4VC7J1LMZYOZMV-OTjMGjO=9bJZ7uaCu_MMF-20T1w@mail.gmail.com>
 <18cb18d7d0ea4a3bb46921aca88c53646f1b3764.camel@mediatek.com>
In-Reply-To: <18cb18d7d0ea4a3bb46921aca88c53646f1b3764.camel@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Mon, 30 Aug 2021 11:49:24 +0800
Message-ID: <CAATdQgDKuO+bM7_tMy59ghhhjrgCp53kHgYbgEciriHNF3uKuA@mail.gmail.com>
Subject: Re: [PATCH next v2 3/6] usb: xhci-mtk: update fs bus bandwidth by
 bw_budget_table
To: =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 =?UTF-8?B?WWFxaWkgV3UgKOatpuS6muWlhyk=?= <Yaqii.Wu@mediatek.com>, 
 "mathias.nyman@intel.com" <mathias.nyman@intel.com>, 
 =?UTF-8?B?RWRkaWUgSHVuZyAo5rSq5q2j6ZGrKQ==?= <Eddie.Hung@mediatek.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_204937_580915_ECB91DEE 
X-CRM114-Status: GOOD (  47.08  )
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

T24gRnJpLCBBdWcgMjcsIDIwMjEgYXQgNTo0OSBQTSBDaHVuZmVuZyBZdW4gKOS6keaYpeWzsCkK
PENodW5mZW5nLll1bkBtZWRpYXRlay5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCAyMDIxLTA4LTI3
IGF0IDE3OjE0ICswODAwLCBJa2pvb24gSmFuZyB3cm90ZToKPiA+IE9uIEZyaSwgQXVnIDI3LCAy
MDIxIGF0IDI6NDkgUE0gQ2h1bmZlbmcgWXVuICjkupHmmKXls7ApCj4gPiA8Q2h1bmZlbmcuWXVu
QG1lZGlhdGVrLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgMjAyMS0wOC0yNiBhdCAx
OTo1NCArMDgwMCwgSWtqb29uIEphbmcgd3JvdGU6Cj4gPiA+ID4gSGkgQ2h1bmZlbmcsCj4gPiA+
ID4KPiA+ID4gPiBPbiBUaHUsIEF1ZyAyNiwgMjAyMSBhdCAxMDo1MiBBTSBDaHVuZmVuZyBZdW4g
PAo+ID4gPiA+IGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+
ID4gPiA+IFVzZSBAYndfYnVkZ2V0X3RhYmxlW10gdG8gdXBkYXRlIGZzIGJ1cyBiYW5kd2lkdGgg
ZHVlIHRvCj4gPiA+ID4gPiBub3QgYWxsIG1pY3JvZnJhbWVzIGNvbnN1bWUgQGJ3X2Nvc3RfcGVy
X21pY3JvZnJhbWUsIHNlZQo+ID4gPiA+ID4gc2V0dXBfc2NoX2luZm8oKS4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRl
ay5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+IHYyOiBuZXcgcGF0Y2gsIG1vdmUgZnJvbSBh
bm90aGVyIHNlcmllcwo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgZHJpdmVycy91c2IvaG9zdC94
aGNpLW10ay1zY2guYyB8IDE3ICsrKysrKystLS0tLS0tLS0tCj4gPiA+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gPiA+ID4gPgo+ID4gPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1tdGstc2NoLmMKPiA+ID4gPiA+
IGIvZHJpdmVycy91c2IvaG9zdC94aGNpLW10ay1zY2guYwo+ID4gPiA+ID4gaW5kZXggY2ZmY2Fm
NGRmYTlmLi44M2FiZDI4MjY5Y2EgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9o
b3N0L3hoY2ktbXRrLXNjaC5jCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kt
bXRrLXNjaC5jCj4gPiA+ID4gPiBAQCAtNDU4LDggKzQ1OCw4IEBAIHN0YXRpYyBpbnQgY2hlY2tf
ZnNfYnVzX2J3KHN0cnVjdAo+ID4gPiA+ID4gbXUzaF9zY2hfZXBfaW5mbyAqc2NoX2VwLCBpbnQg
b2Zmc2V0KQo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAqIENvbXBhcmVkIHdpdGggaHMgYnVz
LCBubyBtYXR0ZXIgd2hhdCBlcAo+ID4gPiA+ID4gdHlwZSwKPiA+ID4gPiA+ICAgICAgICAgICAg
ICAgICAgKiB0aGUgaHViIHdpbGwgYWx3YXlzIGRlbGF5IG9uZSB1ZnJhbWUgdG8gc2VuZAo+ID4g
PiA+ID4gZGF0YQo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAqLwo+ID4gPiA+ID4gLSAgICAg
ICAgICAgICAgIGZvciAoaiA9IDA7IGogPCBzY2hfZXAtPmNzX2NvdW50OyBqKyspIHsKPiA+ID4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHRtcCA9IHR0LT5mc19idXNfYndbYmFzZSArIGpd
ICsgc2NoX2VwLQo+ID4gPiA+ID4gPiBid19jb3N0X3Blcl9taWNyb2ZyYW1lOwo+ID4gPiA+ID4K
PiA+ID4gPiA+ICsgICAgICAgICAgICAgICBmb3IgKGogPSAwOyBqIDwgc2NoX2VwLT5udW1fYnVk
Z2V0X21pY3JvZnJhbWVzOwo+ID4gPiA+ID4gaisrKSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICB0bXAgPSB0dC0+ZnNfYnVzX2J3W2Jhc2UgKyBqXSArIHNjaF9lcC0KPiA+ID4g
PiA+ID4gYndfYnVkZ2V0X3RhYmxlW2pdOwo+ID4gPiA+Cj4gPiA+ID4gSSdtIHdvcnJ5aW5nIGFi
b3V0IHRoaXMgY2FzZSB3aXRoIHR3byBlbmRwb2ludHMsCj4gPiA+ID4gKiBFUDFPVVQ6IGlzb2No
cm9ub3VzLCBtYXhwYWNrZXQ9MTkyOiBid19idWRnZXRfdGFibGVbXSA9IHsgMTg4LAo+ID4gPiA+
IDE4OCwKPiA+ID4gPiAwLCAuLi4gfQo+ID4gPiA+ICogRVAySU46IGludGVycnVwdCwgbWF4cGFj
a2V0PTY0OiBid19idWRnZXRfdGFibGVbXSA9IHsgMCwgMCwgNjQsCj4gPiA+ID4gNjQsCj4gPiA+
ID4gLi4uIH0KPiA+ID4gPiAoSXMgdGhpcyBjb3JyZWN0IGJ3X2J1ZGdldF90YWJsZSBjb250ZW50
cyBmb3IgdGhvc2UgZXBzPykKPiA+ID4KPiA+ID4gWWVzLCBlcDFvdXQgaXNvYyB1c2UgdHdvIHVm
cmFtZSwgZXAyaW4gaW50ciB1c2UgYSBleHRyYSBjczsKPiA+ID4gPgo+ID4gPiA+IEknbSBub3Qg
c3VyZSBpZiBpdCdzIG9rYXkgZm9yIHRob3NlIHR3byBlbmRwb2ludHMgdG8gYmUgYWxsb2NhdGVk
Cj4gPiA+ID4gb24gdGhlIHNhbWUgdS1mcmFtZSBzbG90Lgo+ID4gPiA+IENhbiB5b3UgcGxlYXNl
IGNoZWNrIGlmIHRoaXMgaXMgb2theSBmb3IgeGhjaS1tdGs/Cj4gPiA+Cj4gPiA+IEFscmVhZHkg
dGVzdCBpdCB0aGlzIGFmdGVybm9vbiwgY2FuIHRyYW5zZmVyIGRhdGEgcmlnaHRseSBvbiBvdXIK
PiA+ID4gZHZ0Cj4gPiA+IGVudi4KPiA+ID4KPiA+ID4gPiAoSSBmZWVsIGxpa2UgSSBhbHJlYWR5
IGFza2VkIHRoZSBzYW1lIHF1ZXN0aW9ucyBtYW55IHRpbWVzLikKPiA+ID4KPiA+ID4gWWVzLCBh
cyBzYWlkIGJlZm9yZSwgcHJlZmVyIHRvIHVzZSBid19idWRnZXRfdGFibGVbXSwgaWYgdGhlcmUg
aXMKPiA+ID4gaXNzdWUsIHdlIGNhbiBmaXggaXQgYnkgYnVpbGRpbmcgdGhpcyB0YWJsZS4KPiA+
Cj4gPiBTbyBkbyB5b3UgbWVhbiBzdWNoIGFuIGFsbG9jYXRpb24gc2hvdWxkbid0IGJlIGEgcHJv
YmxlbSBieSBJUAo+ID4gZGVzaWduPwo+IFllcywgYXQgbGVhc3Qgb24gb3VyIGR2dCBwbGF0Zm9y
bQoKRGlkIHlvdSBjaGVjayB0aGF0IHlvdXIgc2lkZSBhbHNvIGhhcyBhIHNpbWlsYXIgYWxsb2Nh
dGlvbgooU1NQTElULWFsbCBzaXRzIGJldHdlZW4gU1NQTElULXN0YXJ0IH4gLWVuZCBmb3IgYW5v
dGhlciBlcCk/Ck15IGF1ZGlvIGhlYWRzZXQgZG9lc24ndCB3b3JrIHByb3Blcmx5IHdpdGggdGhp
cyBzY2hlbWUuCgo+Cj4gPgo+ID4gVGhpcyBwYXRjaCBzdGFydHMgdG8gYWxsb3cgc3VjaCBhbiBh
bGxvY2F0aW9uIChhZ2FpbikuCj4gPiBCdXQgaSByZW1lbWJlciBteSBlYXJsaWVyIHRlc3RzIHNo
b3dlZCB0aGF0IHdoZW4gdGhvc2UgdHdvIGVwcwo+ID4gaW4gdGhlIGFib3ZlIGV4YW1wbGUgYXJl
IGFsbG9jYXRlZCBvbiB0aGUgc2FtZSB1LWZyYW1lIHNsb3QsCj4gPiB4aGNpLW10ayBwdXRzICJT
U1BMSVQgZm9yIEVQMiIgYmV0d2Vlbgo+ID4gIlNTUExJVC1zdGFydCBhbmQgU1NQTElULWVuZCBm
b3IgRVAxT1VUIHRyYW5zYWN0aW9uIiwKPiA+IHdoaWNoIGlzIGEgc3BlYyB2aW9sYXRpb24uCj4K
PiBXaGljaCBzZWN0aW9uIGluIHVzYjIuMCBzcGVjPwoKSSB0aGluayB0aGF0J3MganVzdCBhIGJh
c2ljIHJ1bGUgLSBpZiBzb2Z0d2FyZSB3YW50cyB0byBzZW5kIDE5MiBieXRlcwp0aHJvdWdoIGEg
ZnVsbC1zcGVlZCBidXMsIEhDIHNob3VsZCBzZW5kIE9VVC9EQVRBIDE5MiBieXRlcwpjb250aW51
b3VzbHkgd2l0aG91dCBpbnNlcnRpbmcgYW55IG90aGVyIHBhY2tldHMgZHVyaW5nIHRoYXQgMTky
IGJ5dGVzLgphbmQgdXNiMiAxMS4xNC4yIG1lbnRpb25zIHRoYXQgVFQgaGFzIHNlcGFyYXRlZApT
dGFydC1TcGxpdCBhbmQgQ29tcGxldGUtU3BsaXQgYnVmZmVycwpidXQgbm90IHRyYWNrZWQgZWFj
aCB0cmFuc2FjdGlvbiBwZXIgZW5kcG9pbnQgYmFzaXMuCgo+Cj4gPiBIdWIgd2lsbCBnZW5lcmF0
ZSBiaXQgc3R1ZmZpbmcgZXJyb3JzIG9uIHRoZQo+ID4gZnVsbC1zcGVlZCBidXMuCj4gd2hpY2gg
cGxhdGZvcm0/CgpJIHJlbWVtYmVyIGl0IHdhcyBtdDgxNzMuCgpBbmQgZm9yIGJpdCBzdHVmZmlu
ZyBlcnJvcnMgSSBtZW50aW9uZWQgaW4gdGhlIGVhcmxpZXIgbWFpbC4Kd2hlbiBJIHJlYWQgdGhl
IHNwZWMgYWdhaW4sIDExLjIxIG1lbnRpb25zIHRoYXQgYml0IHN0dWZmaW5nIGVycm9yCmlzIGdl
bmVyYXRlZCB3aGVuIF9hIG1pY3JvZnJhbWVfIHNob3VsZCBiZSBwYXNzZWQgd2l0aG91dApjb3Jy
ZXNwb25kaW5nIFNTUExJVC1taWQvZW5kLiBTbyB0aGlzIGlzIG5vdCB0aGUgY2FzZSBhbmQgYWxz
bwpJJ20gbm90IHN1cmUgd2hhdCB3aWxsIGhhcHBlbiBvbiB0aGUgZnVsbC1zcGVlZCBidXMsIHNv
cnJ5LgpJbiBteSBjYXNlIHdoYXQgSSBjYW4gYmUgc3VyZSBvZiBpcyB0aGF0IHRoZSBhdWRpbyBv
dXRwdXQgd2FzCmJyb2tlbiB3aXRoIHRob3NlIGFsbG90bWVudHMuCgpXaGF0IGlzIHRoZSB4aGNp
LW10aydzIHBvbGljeSB3aGVuIHRoZXJlIGFyZSBtb3JlIHRoYW4gdHdvIEVQcwptYXJrZWQgYXMg
dGhlIHNhbWUgdS1mcmFtZSBvZmZzZXQgbGlrZSBpbiB0aGUgYWJvdmUgZXhhbXBsZT8KCj4KPiA+
Cj4gPgo+ID4gPgo+ID4gPiBUaGFua3MKPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICBpZiAodG1wID4gRlNfUEFZTE9BRF9NQVgpCj4gPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRVNDSF9CV19PVkVSRkxPVzsKPiA+
ID4gPiA+ICAgICAgICAgICAgICAgICB9Cj4gPiA+ID4gPiBAQCAtNTM0LDIxICs1MzQsMTggQEAg
c3RhdGljIHZvaWQgdXBkYXRlX3NjaF90dChzdHJ1Y3QKPiA+ID4gPiA+IG11M2hfc2NoX2VwX2lu
Zm8gKnNjaF9lcCwgYm9vbCB1c2VkKQo+ID4gPiA+ID4gIHsKPiA+ID4gPiA+ICAgICAgICAgc3Ry
dWN0IG11M2hfc2NoX3R0ICp0dCA9IHNjaF9lcC0+c2NoX3R0Owo+ID4gPiA+ID4gICAgICAgICB1
MzIgYmFzZSwgbnVtX2VzaXQ7Cj4gPiA+ID4gPiAtICAgICAgIGludCBid191cGRhdGVkOwo+ID4g
PiA+ID4gICAgICAgICBpbnQgaSwgajsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAgIG51bV9l
c2l0ID0gWEhDSV9NVEtfTUFYX0VTSVQgLyBzY2hfZXAtPmVzaXQ7Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gLSAgICAgICBpZiAodXNlZCkKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBid191cGRhdGVk
ID0gc2NoX2VwLT5id19jb3N0X3Blcl9taWNyb2ZyYW1lOwo+ID4gPiA+ID4gLSAgICAgICBlbHNl
Cj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgYndfdXBkYXRlZCA9IC1zY2hfZXAtPmJ3X2Nvc3Rf
cGVyX21pY3JvZnJhbWU7Cj4gPiA+ID4gPiAtCj4gPiA+ID4gPiAgICAgICAgIGZvciAoaSA9IDA7
IGkgPCBudW1fZXNpdDsgaSsrKSB7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgYmFzZSA9IHNj
aF9lcC0+b2Zmc2V0ICsgaSAqIHNjaF9lcC0+ZXNpdDsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAtICAg
ICAgICAgICAgICAgZm9yIChqID0gMDsgaiA8IHNjaF9lcC0+Y3NfY291bnQ7IGorKykKPiA+ID4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHR0LT5mc19idXNfYndbYmFzZSArIGpdICs9IGJ3
X3VwZGF0ZWQ7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgZm9yIChqID0gMDsgaiA8IHNjaF9l
cC0+bnVtX2J1ZGdldF9taWNyb2ZyYW1lczsKPiA+ID4gPiA+IGorKykKPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGlmICh1c2VkKQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB0dC0+ZnNfYnVzX2J3W2Jhc2UgKyBqXSArPQo+ID4gPiA+ID4gc2NoX2Vw
LQo+ID4gPiA+ID4gPiBid19idWRnZXRfdGFibGVbal07Cj4gPiA+ID4gPgo+ID4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgZWxzZQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB0dC0+ZnNfYnVzX2J3W2Jhc2UgKyBqXSAtPQo+ID4gPiA+ID4gc2NoX2VwLQo+
ID4gPiA+ID4gPiBid19idWRnZXRfdGFibGVbal07Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAg
ICB9Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAgICBpZiAodXNlZCkKPiA+ID4gPiA+IC0tCj4g
PiA+ID4gPiAyLjE4LjAKPiA+ID4gPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
