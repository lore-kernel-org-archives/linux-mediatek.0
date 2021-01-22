Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CBBC433E9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 10:06:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0743D235E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 10:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0743D235E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z/zo1knixjBSCL6HGc+kmebZ1VNo2ouRXpsFEmFh1eU=; b=b6dW9YUOqbIocg+hZ7Q/+qWWs
	qlLhKC4QlDjOLzBBzmlUgf1346RNZhykBuirZnz3o12lVQJhB+P0dwzoDT7lKwDAh47SLdv7XndXz
	6SM7JD7lx75ESKtEONNlSHrvZporGRjQG9z92LmSQ2I/w+57WVQ6dZ2ZodMIY//MARzU6HRAfPCGE
	YqSM69Qd9BzbvJB6kbsCmrZYfKc05R6Knr4uDJzqSwh9D31B7CH73DubxrZ/QbP+7WWLkrSbuT2P6
	rBwotONL3y4UIVO+riCqiJA6rS+Te3hu3/0gvhY+sjJLmhz9H9485h3zoH6jPeecRGJgAd5u2JRUz
	KYItcqopg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2tKK-00012J-Tf; Fri, 22 Jan 2021 10:06:00 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2tKG-000119-4h; Fri, 22 Jan 2021 10:05:57 +0000
IronPort-SDR: 6R0tQiDEtQlIW8M367Xzc2IS70QliD/vsLhyc1MzilNGmQoGjkUeoVq9Bv7xFeEIMHF4g5BlRz
 JwrW2dpsIoNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="176851396"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="176851396"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 02:05:52 -0800
IronPort-SDR: GTVcV40CII561+g1c4ZQEaXgUOCdiGelZbxh/WWOVbfil8fndYoLNlP0ch3/or33rw5JoYOFYX
 F08IjTXyVxVg==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="427923843"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 02:05:47 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 22 Jan 2021 12:05:45 +0200
Date: Fri, 22 Jan 2021 12:05:45 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
Subject: Re: [PATCH v2] PCI: Re-enable downstream port LTR if it was
 previously enabled
Message-ID: <20210122100545.GL1988617@lahna.fi.intel.com>
References: <20210121223139.GA2698934@bjorn-Precision-5520>
 <1611298991.5980.42.camel@mcddlt001>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611298991.5980.42.camel@mcddlt001>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_050556_323619_B526F17E 
X-CRM114-Status: GOOD (  24.26  )
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
Cc: linux-pci@vger.kernel.org, lambert.wang@mediatek.com,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Utkarsh H Patel <utkarsh.h.patel@intel.com>, haijun.liu@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksCgpPbiBGcmksIEphbiAyMiwgMjAyMSBhdCAwMzowMzoxMVBNICswODAwLCBNaW5nY2h1YW5n
IFFpYW8gd3JvdGU6Cj4gT24gVGh1LCAyMDIxLTAxLTIxIGF0IDE2OjMxIC0wNjAwLCBCam9ybiBI
ZWxnYWFzIHdyb3RlOgo+ID4gWytjYyBBbGV4IGFuZCBNaW5nY2h1YW5nIGV0IGFsIGZyb20KPiA+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTAxMTIwNzI3MzkuMzE2MjQtMS1taW5nY2h1
YW5nLnFpYW9AbWVkaWF0ZWsuY29tXQo+ID4gCj4gPiBPbiBUdWUsIEphbiAxOSwgMjAyMSBhdCAw
NDoxNDoxMFBNICswMzAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6Cj4gPiA+IFBDSWUgcjUuMCwg
c2VjIDcuNS4zLjE2IHNheXMgdGhhdCB0aGUgZG93bnN0cmVhbSBwb3J0cyBtdXN0IHJlc2V0IHRo
ZQo+ID4gPiBMVFIgZW5hYmxlIGJpdCBpZiB0aGUgbGluayBnb2VzIGRvd24gKHBvcnQgZ29lcyBE
TF9Eb3duIHN0YXR1cykuIE5vdywgaWYKPiA+ID4gd2UgaGFkIExUUiBwcmV2aW91c2x5IGVuYWJs
ZWQgYW5kIHRoZSBQQ0llIGVuZHBvaW50IGdldHMgaG90LXJlbW92ZWQgYW5kCj4gPiA+IHRoZW4g
aG90LWFkZGVkIGJhY2sgdGhlIC0+bHRyX3BhdGggb2YgdGhlIGRvd25zdHJlYW0gcG9ydCBpcyBz
dGlsbCBzZXQKPiA+ID4gYnV0IHRoZSBwb3J0IG5vdyBkb2VzIG5vdCBoYXZlIHRoZSBMVFIgZW5h
YmxlIGJpdCBzZXQgYW55bW9yZS4KPiA+ID4gCj4gPiA+IEZvciB0aGlzIHJlYXNvbiBjaGVjayBp
ZiB0aGUgYnJpZGdlIHVwc3RyZWFtIGhhZCBMVFIgZW5hYmxlZCBwcmV2aW91c2x5Cj4gPiA+IGFu
ZCByZS1lbmFibGUgaXQgYmVmb3JlIGVuYWJsaW5nIExUUiBmb3IgdGhlIGVuZHBvaW50Lgo+ID4g
PiAKPiA+ID4gUmVwb3J0ZWQtYnk6IFV0a2Fyc2ggSCBQYXRlbCA8dXRrYXJzaC5oLnBhdGVsQGlu
dGVsLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWlrYSBXZXN0ZXJiZXJnIDxtaWthLndlc3Rl
cmJlcmdAbGludXguaW50ZWwuY29tPgo+ID4gCj4gPiBJIHRoaW5rIHRoaXMgYW5kIE1pbmdjaHVh
bmcncyBwYXRjaCwgd2hpY2ggaXMgZXNzZW50aWFsbHkgaWRlbnRpY2FsLAo+ID4gYXJlIHJpZ2h0
IGFuZCBzb2x2ZXMgdGhlIHByb2JsZW0gZm9yIGhvdC1yZW1vdmUvaG90LWFkZC4gIEluIHRoYXQK
PiA+IHNjZW5hcmlvIHdlIGNhbGwgcGNpX2NvbmZpZ3VyZV9sdHIoKSBvbiB0aGUgaG90LWFkZGVk
IGRldmljZSwgYW5kCj4gPiB3aXRoIHRoaXMgcGF0Y2gsIHdlJ2xsIHJlLWVuYWJsZSBMVFIgb24g
dGhlIGJyaWRnZSBsZWFkaW5nIHRvIHRoZSBuZXcKPiA+IGRldmljZSBiZWZvcmUgZW5hYmxpbmcg
TFRSIG9uIHRoZSBuZXcgZGV2aWNlIGl0c2VsZi4KPiA+IAo+ID4gQnV0IGRvbid0IHdlIGhhdmUg
YSBzaW1pbGFyIHByb2JsZW0gaWYgd2Ugc2ltcGx5IGRvIGEgRnVuZGFtZW50YWwKPiA+IFJlc2V0
IG9uIGEgZGV2aWNlPyAgSSB0aGluayB0aGUgcmVzZXQgcGF0aCB3aWxsIHJlc3RvcmUgdGhlIGRl
dmljZSdzCj4gPiBzdGF0ZSwgaW5jbHVkaW5nIFBDSV9FWFBfREVWQ1RMMiwgYnV0IGl0IGRvZXNu
J3QgZG8gYW55dGhpbmcgd2l0aCB0aGUKPiA+IHVwc3RyZWFtIGJyaWRnZSwgZG9lcyBpdD8KPiA+
IAo+IAo+IFllcy4gSSB0aGluayB0aGUgc2FtZSBwcm9ibGVtIGV4aXN0cyB1bmRlciBzdWNoIHNj
ZW5hcmlvLCBhbmQgdGhhdOKAmXMgdGhlCj4gaXNzdWUgbXkgcGF0Y2ggaW50ZW5kcyB0byByZXNv
bHZlLgo+IEkgYWxzbyBwcmVwYXJlZCBhIHYyIHBhdGNoIGZvciByZXZpZXcodXBkYXRlIHRoZSBw
YXRjaCBkZXNjcmlwdGlvbikuCj4gU2hhbGwgSSBzdWJtaXQgdGhlIHYyIHBhdGNoIGZvciByZXZp
ZXc/CgpJIGxvb2tlZCBhdCB5b3VyIHBhdGNoIGFuZCBpbmRlZWQgaXQgaXMgZXNzZW50aWFsbHkg
ZG9pbmcgdGhlIHNhbWUgYXMKdGhpcyBvbmUuIFNvIGxldCdzIGZvcmdldCB0aGlzIHBhdGNoIGFu
ZCBnbyBmb3J3YXJkIHdpdGggeW91cnMgOikKCldvdWxkIHlvdSBsaWtlIHRvIGV4cGFuZCB5b3Vy
IHBhdGNoIHRvIGhhbmRsZSB0aGUgcmVzZXQgY2FzZSB0b28gdGhhdApCam9ybiBkZXNyaWJlcyBi
ZWxvdz8KCj4gPiBTbyBpZiBhIGJyaWRnZSBhbmQgYSBkZXZpY2UgYmVsb3cgaXQgYm90aCBoYXZl
IExUUiBlbmFibGVkLCBjYW4ndCB3ZQo+ID4gaGF2ZSB0aGUgZm9sbG93aW5nOgo+ID4gCj4gPiAg
IC0gYnJpZGdlIExUUiBlbmFibGVkCj4gPiAgIC0gZGV2aWNlIExUUiBlbmFibGVkCj4gPiAgIC0g
cmVzZXQgZGV2aWNlLCBlLmcuLCB2aWEgU2Vjb25kYXJ5IEJ1cyBSZXNldAo+ID4gICAtIGxpbmsg
Z29lcyBkb3duLCBicmlkZ2UgZGlzYWJsZXMgTFRSCj4gPiAgIC0gbGluayBjb21lcyBiYWNrIHVw
LCBMVFIgZGlzYWJsZWQgaW4gYm90aCBicmlkZ2UgYW5kIGRldmljZQo+ID4gICAtIHJlc3RvcmUg
ZGV2aWNlIHN0YXRlLCBpbmNsdWRpbmcgTFRSIGVuYWJsZQo+ID4gICAtIGRldmljZSBzZW5kcyBM
VFIgbWVzc2FnZQo+ID4gICAtIGJyaWRnZSByZXBvcnRzIFVuc3VwcG9ydGVkIFJlcXVlc3QKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
