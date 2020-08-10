Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF9AC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 14:51:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8ED82083B
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 14:51:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2HrIVtac";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="Ole9foJp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8ED82083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5DDWGqGCjf4fCCpClsH+SxXCN0mfnmE/9YeHA+fZTso=; b=2HrIVtacVStJtWmOEZNtsBpBJ
	MwXpMy8IABv7oJDcyVWHoIwCQykdu7bJT9UqFbjjftj3LA8jN4cRMwnywLxHe/ND8rUCgAQm+mpxJ
	J5OMuOogeEemuXHW9jFIsxDrX6Uirjmc7jK66IaXOVVCODI3pdLAaJJ2vI5zN8RH/fcCP1Pnlx5eB
	M3p+moktscnYPOn3N7uUw9XUw0gxgglCDIAqtyvYff3cMhYIYe6UhVM6jcGrBSMmXN1tAIsUMR+bp
	bbxB79lA0HS4C9J2EU6g0PAYwfc83z9i9ahg3FIKy4ix2pKZ6vIg2ZwgmX3FGtkVusKWjr6eBh300
	ce7dfaRtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k598u-0001Ow-6L; Mon, 10 Aug 2020 14:51:16 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k598p-0001NQ-84
 for linux-mediatek@lists.infradead.org; Mon, 10 Aug 2020 14:51:12 +0000
Received: by mail-qt1-x843.google.com with SMTP id c12so6912237qtn.9
 for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2020 07:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=4aZ52qCxnYvMfbknflPb2u1mseuw+l9ZuJed3m/JJv4=;
 b=Ole9foJpZfRQzAa3/a03VZ+EvcIZf8wVs3U+mzf0dyFUFT713cS0DYrZX8hVxEL+rj
 aluj36HVLrIb5pJ7bb+OVTcit2wqyCrD4/Ta8VqFnXpVFXXiRkXxNV16TldGaWvAzYkm
 kdGIr/xGnnyh5PMl86MtyWj92TLy2WtlObTopiDtuVTsBX+TtCRql2Sc3C1PdtibvHoJ
 fRFXlohpowl2hLMG/MrCoUWlleloKfiBp2jOVw8KUvqob1anv4Vk79JyZ8hvPXgHZp5r
 rZ8MaLCMlVNxpHl39JavfaGQYq1maekj665NDxBrjiATtDYQOZ8p/X1NOLX3z2ugci4m
 Otgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=4aZ52qCxnYvMfbknflPb2u1mseuw+l9ZuJed3m/JJv4=;
 b=kUMzZ0GjOooZaAen1ibvbn6QYY0cAGsgIm84bPIjDsQk5AGAlntJN/05u75Y5GFfNO
 C9+oHZ3uub/W7UTxPrNcp5u06pABSLmHMDZMd3ft5OrBVgkIpfnIHR6/i9gtW5QurN6i
 ol2aOi3UKXrigvY7p5JLQX/gBtg24U1A4xfIYTcYJMwlv1gjR9Tw/nZEzJ6gMNYadgkU
 dLr87bgg218S9/xQ9AIiWhmxUHWtqzoCLfgfwOLq6jVCNkxNXGbeurzT+4v95Gn4d9Yh
 hOWtol6y85pyqrGyBTUGIt6dCnigzxkPwUGRzA7qSGqcxhlXc3biizxNzRoPAnLapLFi
 9x1Q==
X-Gm-Message-State: AOAM5303qdNgbVzdrHSstEWdUSlHfTmu7LkTotUIx+jF4obVOKIh+L2M
 KI7pvLf+OhjtQ5hJEBEO3MslWQ==
X-Google-Smtp-Source: ABdhPJwfxMiy6K8geUCUuwGC7Vu2zhXPaDAGpBinUKGccsGsPBodxdHZ6OQX3jnr0KG+zijtAUG9zQ==
X-Received: by 2002:ac8:5685:: with SMTP id h5mr28435277qta.378.1597071068740; 
 Mon, 10 Aug 2020 07:51:08 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id g49sm17027037qtk.74.2020.08.10.07.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 07:51:08 -0700 (PDT)
Date: Mon, 10 Aug 2020 10:51:05 -0400
From: Qian Cai <cai@lca.pw>
To: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH 0/5] kasan: add workqueue and timer stack for generic KASAN
Message-ID: <20200810145104.GB5307@lca.pw>
References: <20200810072115.429-1-walter-zh.wu@mediatek.com>
 <B873B364-FF03-4819-8F9C-79F3C4EF47CE@lca.pw>
 <1597060257.13160.11.camel@mtksdccf07>
 <20200810124430.GA5307@lca.pw>
 <1597069882.13160.23.camel@mtksdccf07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597069882.13160.23.camel@mtksdccf07>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_105111_431548_784FC1BC 
X-CRM114-Status: GOOD (  32.71  )
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
Cc: John Stultz <john.stultz@linaro.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-mm@kvack.org,
 Stephen Boyd <sboyd@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 Tejun Heo <tj@kernel.org>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBdWcgMTAsIDIwMjAgYXQgMTA6MzE6MjJQTSArMDgwMCwgV2FsdGVyIFd1IHdyb3Rl
Ogo+IE9uIE1vbiwgMjAyMC0wOC0xMCBhdCAwODo0NCAtMDQwMCwgUWlhbiBDYWkgd3JvdGU6Cj4g
PiBPbiBNb24sIEF1ZyAxMCwgMjAyMCBhdCAwNzo1MDo1N1BNICswODAwLCBXYWx0ZXIgV3Ugd3Jv
dGU6Cj4gPiA+IE9uIE1vbiwgMjAyMC0wOC0xMCBhdCAwNzoxOSAtMDQwMCwgUWlhbiBDYWkgd3Jv
dGU6Cj4gPiA+ID4gCj4gPiA+ID4gPiBPbiBBdWcgMTAsIDIwMjAsIGF0IDM6MjEgQU0sIFdhbHRl
ciBXdSA8d2FsdGVyLXpoLnd1QG1lZGlhdGVrLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiAKPiA+ID4g
PiA+IO+7v1N5emJvdCByZXBvcnRzIG1hbnkgVUFGIGlzc3VlcyBmb3Igd29ya3F1ZXVlIG9yIHRp
bWVyLCBzZWUgWzFdIGFuZCBbMl0uCj4gPiA+ID4gPiBJbiBzb21lIG9mIHRoZXNlIGFjY2Vzcy9h
bGxvY2F0aW9uIGhhcHBlbmVkIGluIHByb2Nlc3Nfb25lX3dvcmsoKSwKPiA+ID4gPiA+IHdlIHNl
ZSB0aGUgZnJlZSBzdGFjayBpcyB1c2VsZXNzIGluIEtBU0FOIHJlcG9ydCwgaXQgZG9lc24ndCBo
ZWxwCj4gPiA+ID4gPiBwcm9ncmFtbWVycyB0byBzb2x2ZSBVQUYgb24gd29ya3F1ZXVlLiBUaGUg
c2FtZSBtYXkgc3RhbmQgZm9yIHRpbWVzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGlzIHBhdGNo
c2V0IGltcHJvdmVzIEtBU0FOIHJlcG9ydHMgYnkgbWFraW5nIHRoZW0gdG8gaGF2ZSB3b3JrcXVl
dWUKPiA+ID4gPiA+IHF1ZXVlaW5nIHN0YWNrIGFuZCB0aW1lciBxdWV1ZWluZyBzdGFjayBpbmZv
cm1hdGlvbi4gSXQgaXMgdXNlZnVsIGZvcgo+ID4gPiA+ID4gcHJvZ3JhbW1lcnMgdG8gc29sdmUg
dXNlLWFmdGVyLWZyZWUgb3IgZG91YmxlLWZyZWUgbWVtb3J5IGlzc3VlLgo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBHZW5lcmljIEtBU0FOIHdpbGwgcmVjb3JkIHRoZSBsYXN0IHR3byB3b3JrcXVldWUg
YW5kIHRpbWVyIHN0YWNrcywKPiA+ID4gPiA+IHByaW50IHRoZW0gaW4gS0FTQU4gcmVwb3J0LiBJ
dCBpcyBvbmx5IHN1aXRhYmxlIGZvciBnZW5lcmljIEtBU0FOLgo+ID4gPiA+ID4gCj4gPiA+ID4g
PiBJbiBvcmRlciB0byBwcmludCB0aGUgbGFzdCB0d28gd29ya3F1ZXVlIGFuZCB0aW1lciBzdGFj
a3MsIHNvIHRoYXQKPiA+ID4gPiA+IHdlIGFkZCBuZXcgbWVtYmVycyBpbiBzdHJ1Y3Qga2FzYW5f
YWxsb2NfbWV0YS4KPiA+ID4gPiA+IC0gdHdvIHdvcmtxdWV1ZSBxdWV1ZWluZyB3b3JrIHN0YWNr
cywgdG90YWwgc2l6ZSBpcyA4IGJ5dGVzLgo+ID4gPiA+ID4gLSB0d28gdGltZXIgcXVldWVpbmcg
c3RhY2tzLCB0b3RhbCBzaXplIGlzIDggYnl0ZXMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IE9yaWdu
aWFsIHN0cnVjdCBrYXNhbl9hbGxvY19tZXRhIHNpemUgaXMgMTYgYnl0ZXMuIEFmdGVyIGFkZCBu
ZXcKPiA+ID4gPiA+IG1lbWJlcnMsIHRoZW4gdGhlIHN0cnVjdCBrYXNhbl9hbGxvY19tZXRhIHRv
dGFsIHNpemUgaXMgMzIgYnl0ZXMsCj4gPiA+ID4gPiBJdCBpcyBhIGdvb2QgbnVtYmVyIG9mIGFs
aWdubWVudC4gTGV0IGl0IGdldCBiZXR0ZXIgbWVtb3J5IGNvbnN1bXB0aW9uLgo+ID4gPiA+IAo+
ID4gPiA+IEdldHRpbmcgZGVidWdnaW5nIHRvb2xzIGNvbXBsaWNhdGVkIHN1cmVseSBpcyB0aGUg
YmVzdCB3YXkgdG8ga2lsbCBpdC4gSSB3b3VsZCBhcmd1ZSB0aGF0IGl0IG9ubHkgbWFrZSBzZW5z
ZSB0byBjb21wbGljYXRlIGl0IGlmIGl0IGlzIHVzZWZ1bCBtb3N0IG9mIHRoZSB0aW1lIHdoaWNo
IEkgbmV2ZXIgZmVlbCBvciBoZWFyIHRoYXQgaXMgdGhlIGNhc2UuIFRoaXMgcmVtaW5kcyBtZSB5
b3VyIHJlY2VudCBjYWxsX3JjdSgpIHN0YWNrcyB0aGF0IG1vc3Qgb2YgdGltZSBqdXN0IG1ha2Vz
IHBhcnNpbmcgdGhlIHJlcG9ydCBjdW1iZXJzb21lLiBUaHVzLCBJIHVyZ2UgdGhpcyBleGVyY2lz
ZSB0byBvdmVyLWVuZ2luZWVyIG9uIHNwZWNpYWwgY2FzZXMgbmVlZCB0byBzdG9wIGVudGlyZWx5
Lgo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gQSBnb29kIGRlYnVnIHRvb2wgaXMgdG8gaGF2ZSBjb21w
bGV0ZSBpbmZvcm1hdGlvbiBpbiBvcmRlciB0byBzb2x2ZQo+ID4gPiBpc3N1ZS4gV2Ugc2hvdWxk
IGZvY3VzIG9uIGlmIEtBU0FOIHJlcG9ydHMgYWx3YXlzIHNob3cgdGhpcyBkZWJ1Zwo+ID4gPiBp
bmZvcm1hdGlvbiBvciBjcmVhdGUgYSBvcHRpb24gdG8gZGVjaWRlIGlmIHNob3cgaXQuIEJlY2F1
c2UgdGhpcwo+ID4gPiBmZWF0dXJlIGlzIERpbWl0cnkncyBzdWdnZXN0aW9uLiBzZWUgWzFdLiBT
byBJIHRoaW5rIGl0IG5lZWQgdG8gYmUKPiA+ID4gaW1wbGVtZW50ZWQuIE1heWJlIHdlIGNhbiB3
YWl0IGhpcyByZXNwb25zZS4gCj4gPiA+IAo+ID4gPiBbMV1odHRwczovL2xrbWwub3JnL2xrbWwv
MjAyMC82LzIzLzI1Ngo+ID4gCj4gPiBJIGRvbid0IGtub3cgaWYgaXQgaXMgRG1pdHJ5J3MgcGlw
ZS1kcmVhbSB3aGljaCBldmVyeSBLQVNBTiByZXBvcnQgd291bGQgZW5hYmxlCj4gPiBkZXZlbG9w
ZXJzIHRvIGZpeCBpdCB3aXRob3V0IHJlcHJvZHVjaW5nIGl0LiBJdCBpcyBhbHdheXMgYW4gb25n
b2luZyBzdHJ1Z2dsaW5nCj4gPiBiZXR3ZWVuIHRvIG1ha2Uga2VybmVsIGVhc2llciB0byBkZWJ1
ZyBhbmQgdGhlIHRoaW5ncyBsZXNzIGN1bWJlcnNvbWUuCj4gPiAKPiA+IE9uIHRoZSBvdGhlciBo
YW5kLCBEbWl0cnkncyBzdWdnZXN0aW9uIG1ha2VzIHNlbnNlIG9ubHkgaWYgdGhlIHByaWNlIHdl
IGFyZQo+ID4gZ29pbmcgdG8gcGF5IGlzIGZhaXIuIFdpdGggdGhlIGN1cnJlbnQgZGlmZnN0YXQg
YW5kIHRoZSByZWNlbnQgZXhwZXJpZW5jZSBvZgo+ID4gY2FsbF9yY3UoKSBzdGFja3MgIndhc3Rl
IiBzY3JlZW4gc3BhY2VzIGFzIGEgaGVhdnkgS0FTQU4gdXNlciBteXNlbGYsIEkgY2FuJ3QKPiA+
IHJlYWxseSBnZXQgdGhhdCBleGNpdGluZyBmb3IgcHVzaGluZyB0aGUgbGltaXQgYWdhaW4gYXQg
YWxsLgo+ID4gCj4gCj4gSWYgeW91IGFyZSBjb25jZXJuZWQgdGhhdCB0aGUgcmVwb3J0IGlzIGxv
bmcsIG1heWJlIHdlIGNhbiBjcmVhdGUgYW4KPiBvcHRpb24gZm9yIHRoZSB1c2VyIGRlY2lkZSB3
aGV0aGVyIHByaW50IHRoZW0gKGluY2x1ZGUgY2FsbF9yY3UpLgo+IFNvIHRoaXMgc2hvdWxkIHNh
dGlzZnkgZXZlcnlvbmU/CgpBZGRpbmcga2VybmVsIGNvbmZpZyBvcHRpb25zIGlzIGp1c3QgYW5v
dGhlciB3YXkgdG8gYWRkIGNvbXBsaWNhdGlvbnMgd2l0aCByZWFsCmNvc3QuIFRoZSBvbmx5IG90
aGVyIHdheSBJIGNhbiB0aGluayBvZiByaWdodCBub3cgaXMgdG8gY3JlYXRlIHNvbWUga2luZHMg
b2YKcGx1Z2luIHN5c3RlbXMgZm9yIGthc2FuIHRvIGJlIGFibGUgdG8gcnVuIGVicGYgc2NyaXB0
cyAoZm9yIGV4YW1wbGUpIHRvIGRlYWwKd2l0aCB0aG9zZSBzcGVjaWFsIGNhc2VzLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
