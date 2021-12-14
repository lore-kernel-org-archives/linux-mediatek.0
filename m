Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF58EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 10:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8pWfsSSC/hfuua55mCLpz+tmoJxCMV/6dbF3/f1KECQ=; b=AjhLXFEFWHYrHqGLHibYLBBGIc
	Y+faBKUGqFjio2gUzlStr21kKzHhgj+YrlcJGsqYkgt5v1HDXughP8gosBfJ4tPgm40dZHQ9l551W
	1na4qZ8Lx0KwWIVJ1BhYGqsJb5N/0WbbIZd4yb7DpCdPYiiIg4h3hI0NluHa0DX07h5tYdYTBQ937
	2aDHAnws5GN+VfDykKvUWZlxedCZc0HOxx2EdazEgTFxBQY1ftw9XEFiEl2nOJy2+bjto6oMzjXqk
	bfEp9FsQzHlQJ+3Yl+kewPMaqh07ijurECxeh+UdZ9jOoPSKV0PyeyAqHlVNxFa6VdqaPCa3jhpWY
	lM3vXt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx4fK-00DPqi-H7; Tue, 14 Dec 2021 10:04:10 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx4f3-00DPkC-Q7; Tue, 14 Dec 2021 10:03:55 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="263083693"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="263083693"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 02:03:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="661256722"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
 by fmsmga001.fm.intel.com with ESMTP; 14 Dec 2021 02:03:49 -0800
To: Jun Li <lijun.kernel@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux USB List <linux-usb@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>,
 Eddie Hung <eddie.hung@mediatek.com>,
 Yun-Chien Yu <yun-chien.yu@mediatek.com>
References: <20211209072218.21651-1-chunfeng.yun@mediatek.com>
 <c448da77-f2f3-8b79-fc4b-b9dcff727c6e@linux.intel.com>
 <CAKgpwJXxtLwOjxjg3vFHiqS92j6rx_b1+C-bRwDnp+PBvXCMTg@mail.gmail.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: xhci: skip re-check pending port event if hibernated
Message-ID: <e7a6e45e-68ce-54a5-9632-80244dd1e4c7@linux.intel.com>
Date: Tue, 14 Dec 2021 12:05:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKgpwJXxtLwOjxjg3vFHiqS92j6rx_b1+C-bRwDnp+PBvXCMTg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_020353_882118_62E925EC 
X-CRM114-Status: GOOD (  18.83  )
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

T24gMTQuMTIuMjAyMSAxMC4wMCwgSnVuIExpIHdyb3RlOgo+IE1hdGhpYXMgTnltYW4gPG1hdGhp
YXMubnltYW5AbGludXguaW50ZWwuY29tPiDkuo4yMDIx5bm0MTLmnIgxMeaXpeWRqOWFrSAwMTo1
NuWGmemBk++8mgo+Pgo+PiBPbiA5LjEyLjIwMjEgOS4yMiwgQ2h1bmZlbmcgWXVuIHdyb3RlOgo+
Pj4gV2hlbiB4SENJIGNvbnRyb2xsZXIgaGliZXJuYXRlZCwgdGhlIHJvb3QgaHViIGxvc3QgcG93
ZXIsIGlmIGNvbnRyb2xsZXIKPj4+IHN1cHBvcnQgUG9ydCBQb3dlciBDb250cm9sIChQUEMpLCBQ
UCBpcyBub3Qgc2V0IGF0IHhoY2lfcmVzdW1lKCkgYW5kCj4+PiBzZXQgYnkgaHViX3Jlc2V0X3Jl
c3VtZSgpIGxhdGVyLCBzbyBubyBuZWVkIGNoZWNrIHBlbmRpbmcgcG9ydCBldmVudC4KPj4+IElm
IFBQQyBpcyBub3Qgc3VwcG9ydGVkLCBkZXZpY2UgaXMgZGlzY29ubmVjZWQsIHNlZW1zIGRvIG5v
dCBzZW5kIG91dAo+Pj4gVTMgTEZQUyB3YWtlIHNpZ25hbCwgbm8gbmVlZCByZS1jaGVjayBhZ2Fp
biBhbmQgZHJvcCAxMjBtcyBkZWxheSB0bwo+Pj4gc2F2ZSByZXN1bWUgdGltZS4KPj4+Cj4+PiBS
ZXBvcnRlZC1ieTogWXVuLUNoaWVuIFl1IDx5dW4tY2hpZW4ueXVAbWVkaWF0ZWsuY29tPgo+Pj4g
U2lnbmVkLW9mZi1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPgo+
Pj4gLS0tCj4+Cj4+IFRoYW5rcywgYWRkaW5nCj4gCj4gSGkgTWF0aGlhcywgQ2h1bmZlbmcKPiAK
PiBJIGhhdmUgYSBxdWVzdGlvbiBvbiB0aGlzLCBpZiB0aGVyZSBpcyBubyBhbnkgdXNiIGRldmlj
ZXMgY29ubmVjdGVkCj4gYmVmb3JlIHN1c3BlbmQsIGRvIHdlIG5lZWQgdGhpcyAxMjBtcyBkZWxh
eSB0byBjaGVjayBhZ2Fpbj8KPiBTbyBkbyB3ZSBuZWVkIG9uZSBtb3JlIGNvbmRpdGlvbiB0byBs
aW1pdCB0aGlzIGxpa2U/Cj4gaWYgKCFwZW5kaW5nX3BvcnRldmVudCAmJiAhaGliZXJuYXRlZCAm
JiB4aGNpX2hhc19jaGlsZF9kZXZpY2UoKSkKClRoZSAxMjBtcyBkZWxheSB3YXMgYWRkZWQgdG8g
bWFrZSBzdXJlIHdlIGNhdGNoIHRoZSBzZWNvbmQgd2FrZSBzaWduYWwKZnJvbSBhIGRldmljZSBp
biBjYXNlIGhvc3QgbWlzc2VkIHRoZSBmaXJzdCBVMyBleGl0IExGUFMgd2FrZXVwIHNpZ25hbC4K
CkV2ZW4gaWYgbm8gZGV2aWNlcyBhcmUgY29ubmVjdGVkIHRoaXMgbWlnaHQgYmUgaGVscGZ1bCBp
ZiBhIGRldmljZSBpcwpjb25uZWN0ZWQgd2hpbGUgaG9zdCBpcyBzdXNwZW5kZWQuCkkgaGF2ZW4n
dCBjaGVja2VkIGFueSB0aW1pbmcgZm9yIHRoZSBsaW5rIHRyYWluaW5nIGR1cmluZyBlbnVtZXJh
dGlvbiwKYnV0IGl0IGFsc28gdXNlcyBMRlBTIHNpZ25hbGxpbmcsIGFuZCBjb25uZWN0ZWQgZGV2
aWNlIGlzbid0IHZpc2libGUgdG8KZHJpdmVyIHVudGlsIGxpbmsgaXMgc3VjY2Vzc2Z1bGx5IHRy
YWluZWQuCgpTbyB0aGUgb3JpZ2luYWwgMTIwbXMgZGVsYXkgcGF0Y2ggbWlnaHQgYXMgYSBwb3Np
dGl2ZSBzaWRlIGVmZmVjdCBlbnN1cmUKZHJpdmVyIGRvZXNuJ3Qgc3VzcGVuZCBob3N0IG1pZCBk
ZXZpY2UgZW51bWVyYXRpb24uCgpDb3VsZCBiZSBsb29rZWQgaW50byBtb3JlLCBidXQgSSBkb24n
dCB0aGluayB3ZSBzaG91bGQgdGhpcyBwYXRjaCBieQpDaHVuZmVuZwoKVGhhbmtzCk1hdGhpYXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
