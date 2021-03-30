Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE22EC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:08:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DB8561999
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DB8561999
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HNY3hxwE0IGU6cG9yQg8D7YQvoPKltWCh8N4qJyLYGM=; b=aaLrXMZ7bqxrfyLg17nLturDS
	eMbtyWdIrzxG7SSgEEi+DzgBs2XKgpS6dWVSsJWyEV1VLPjoXC+syCw92aGrlMy3FXOe0gI4W/oKT
	ToZXq7kpA/V3afHKFib34l0tAbZpEicccUYhmV8CJCZK/5XmvB9r6u1QMuTI1nguhJ7IyzwpZzyNQ
	zW4Y9ZvDdRW+QEG5wXfeB+/UtNdMsVqm7G9Sp2K0cIn+tc0ig2uZGODF1EKqTCEVtxRGe3uZZjPhT
	3y+J/CnwpsYrQMmxwsJuquCWkDlRlLH2gEJs7BrJikp0efsfdalOYf/J8ThSrDNO1/oTB1OEnVN7Z
	QalvJKv3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRBHw-003Lx7-Tj; Tue, 30 Mar 2021 10:07:56 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRBHh-003Lrx-P8; Tue, 30 Mar 2021 10:07:43 +0000
IronPort-SDR: WOTX3qUGJdk/s4Znit8EQ3ZxU4fOe5Cqv11qaHghnRrxACTaDaitn9TA7X/8D60OSUA69mB+xY
 ZV2BFLVm9z6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="191833905"
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; d="scan'208";a="191833905"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 03:07:39 -0700
IronPort-SDR: 49nci7WYK3KsrT0bQhPoZy9Z7uXBIPW9nzNysWInPEco8HbQavci97XkTKViGofTnQh1D074bt
 Iqo+5e81i6Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; d="scan'208";a="378442373"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174])
 ([10.237.72.174])
 by orsmga006.jf.intel.com with ESMTP; 30 Mar 2021 03:07:36 -0700
Subject: Re: [PATCH v13 0/2] Enable power management for ufs wlun
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>, cang@codeaurora.org,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <cover.1616633712.git.asutoshd@codeaurora.org>
 <e2aec2ba-b0ed-a478-7c01-1784f755a805@codeaurora.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <f9b27a18-777b-10db-71ab-90f29f79bffc@intel.com>
Date: Tue, 30 Mar 2021 13:07:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e2aec2ba-b0ed-a478-7c01-1784f755a805@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_110742_241452_B352F512 
X-CRM114-Status: GOOD (  17.45  )
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

T24gMzAvMDMvMjEgMTo0OCBhbSwgQXN1dG9zaCBEYXMgKGFzZCkgd3JvdGU6Cj4gT24gMy8yNC8y
MDIxIDY6MzkgUE0sIEFzdXRvc2ggRGFzIHdyb3RlOgo+PiBUaGlzIHBhdGNoIGF0dGVtcHRzIHRv
IGZpeCBhIGRlYWRsb2NrIGluIHVmcyB3aGlsZSBzZW5kaW5nIFNTVS4KPj4gUmVjZW50bHksIGJs
a19xdWV1ZV9lbnRlcigpIGFkZGVkIGEgY2hlY2sgdG8gbm90IHByb2Nlc3MgcmVxdWVzdHMgaWYg
dGhlCj4+IHF1ZXVlIGlzIHN1c3BlbmRlZC4gVGhhdCBsZWFkcyB0byBhIHJlc3VtZSBvZiB0aGUg
YXNzb2NpYXRlZCBkZXZpY2Ugd2hpY2gKPj4gaXMgc3VzcGVuZGVkLiBJbiB1ZnMsIHRoYXQgZGV2
aWNlIGlzIHVmcyBkZXZpY2Ugd2x1biBhbmQgaXQncyBwYXJlbnQgaXMKPj4gdWZzX2hiYS4gVGhp
cyByZXN1bWUgdHJpZXMgdG8gcmVzdW1lIHVmcyBkZXZpY2Ugd2x1biB3aGljaCBpbiB0dXJuIHRy
aWVzCj4+IHRvIHJlc3VtZSB1ZnNfaGJhLCB3aGljaCBpcyBhbHJlYWR5IGluIHRoZSBwcm9jZXNz
IG9mIHN1c3BlbmRpbmcsIHRodXMKPj4gY2F1c2luZyBhIGRlYWRsb2NrLgo+Pgo+PiBUaGlzIHBh
dGNoIHRha2VzIGNhcmUgb2Y6Cj4+ICogU3VzcGVuZGluZyB0aGUgdWZzIGRldmljZSBsdW4gb25s
eSBhZnRlciBhbGwgb3RoZXIgbHVucyBhcmUgc3VzcGVuZGVkCj4+ICogU2VuZGluZyBTU1UgZHVy
aW5nIHVmcyBkZXZpY2Ugd2x1biBzdXNwZW5kCj4+ICogQ2xlYXJpbmcgdWFjIGZvciBycG1iIGFu
ZCB1ZnMgZGV2aWNlIHdsdW4KPj4gKiBOb3Qgc2VuZGluZyBjb21tYW5kcyB0byB0aGUgZGV2aWNl
IGR1cmluZyBob3N0IHN1c3BlbmQKPj4KPj4gdjEyIC0+IHYxMzoKPj4gLSBBZGRyZXNzZWQgQWRy
aWFuJ3MgY29tbWVudHMKPj4gwqDCoCAqIFBhaXJlZCBwbV9ydW50aW1lX2dldF9ub3Jlc3VtZSgp
IHdpdGggcG1fcnVudGltZV9wdXQoKQo+PiDCoMKgICogbm8gcnBtX2F1dG9zdXNwZW5kIGZvciB1
ZnMgZGV2aWNlIHdsdW4KPj4gwqDCoCAqIE1vdmVkIHJ1bnRpbWUtcG0gaW5pdCBmdW5jdGlvbmFs
aXR5IHRvIHVmc2hjZF93bF9wcm9iZSgpCj4+IC0gQWRkcmVzc2VkIEJhcnQncyBjb21tZW50cwo+
PiDCoMKgICogRXhwYW5kZWQgYWJicmV2cyBpbiBjb21taXQgbWVzc2FnZQo+Pgo+IAo+IEhpIEFk
cmlhbgo+IEkgZGlkIGEgbGltaXRlZCB0ZXN0aW5nIG9uIHlvdXIgZml4IGluIHRoZSBwbSBmcmFt
ZXdvcmsgYWxvbmcgd2l0aCB0aGlzIHYxMyBwYXRjaHNldC4gSSBjb3VsZG4ndCByZXByb2R1Y2Ug
dGhlIGlzc3VlLgo+IAo+IEknZCBhcHByZWNpYXRlIGlmIHlvdSBjYW4gcGxlYXNlIHRha2UgYSBs
b29rIGF0IHRoZSB2MTMgY2hhbmdlcy4KPiBJZiBhbGwgbG9va3MgZ29vZCBpbiB0aGF0LCBJJ2Qg
ZG8gYW4gZXh0ZW5zaXZlIHRlc3RpbmcuCgpJIG1hZGUgYSBjb3VwbGUgb2YgY29tbWVudHMgb24g
dGhlIHBhdGNoLCBidXQgbm90aGluZyBtYWpvci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
