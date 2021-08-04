Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A53C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 23:15:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D806161029
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 23:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D806161029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnIK0mjFQsFsNG5c9MWjsWQm4Ycptv9LhQNQqCmhdIU=; b=p7MZKBuYkCJ8kT
	aDjfeuy0vm1b00Rm8KOiDoMTjyxsV1AXtSF8c27BFlDh/oROAYQotA4N6n+cvo3U7ADNOuJNy0L9N
	EPZXYgDtxfc+zclNBR9XGE61zvN6c0qjpwNNTY9/5u5+R88iQ2yZp88TbfqpanaEMsObJgYp7AOxM
	joj9i0Hd3Y1ZpYfbo8UpBVd3jvyw511I4757CcO8N0SKVY4a6JqmVPNYMzDuKu5qyVlf5Vj+xRV8N
	8aNoUom1XwMdlvmHRDOFJjxj1xTeJFXhU/u3tTIAKKe2qI50vO1uZyfhtLDvqf/XX28UhHKvY+Xjr
	/DPVZ/S7NyExk87ksnGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBQ6K-007gJn-JQ; Wed, 04 Aug 2021 23:15:04 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBQ6H-007gJD-NP
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 23:15:03 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="235990324"
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; d="scan'208";a="235990324"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2021 16:14:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,295,1620716400"; d="scan'208";a="668379256"
Received: from ltd-ie-desk03.amr.corp.intel.com ([10.212.230.170])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2021 16:14:58 -0700
Message-ID: <4e9d536cb6a7cffb829f105183f2bb5bceb4122c.camel@linux.intel.com>
Subject: Re: [PATCH v5 1/2] Bluetooth: btusb: Record debug log for Mediatek
 Chip.
From: Tedd Ho-Jeong An <tedd.an@linux.intel.com>
To: Marcel Holtmann <marcel@holtmann.org>, "\"Mark-YW Chen"
 =?UTF-8?Q?=28=E9=99=B3=E6=8F=9A=E6=96=87=29=22?=
 <Mark-YW.Chen@mediatek.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, chris.lu@mediatek.com, 
 will-cy.lee@mediatek.com, Sean Wang <sean.wang@mediatek.com>, BlueZ
 <linux-bluetooth@vger.kernel.org>, linux-mediatek@lists.infradead.org, open
 list <linux-kernel@vger.kernel.org>, Michael Sun <michaelfsun@google.com>, 
 shawnku@google.com, jemele@google.com, apusaka@google.com,
 mcchou@chromium.org
Date: Wed, 04 Aug 2021 16:14:57 -0700
In-Reply-To: <8988B918-95FD-42DE-95FA-3BAC4A144165@holtmann.org>
References: <20210804090316.12080-1-mark-yw.chen@mediatek.com>
 <8988B918-95FD-42DE-95FA-3BAC4A144165@holtmann.org>
Organization: Intel Corporation
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_161501_822238_C38DC664 
X-CRM114-Status: GOOD (  20.15  )
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

SGkgTWFyaywKCkkgY2Fubm90IGZpbmQgdGhlIG9yaWdpbmFsIHBhdGNoIGVtYWlsIGFuZCBDSSBy
ZXBvcnQsIGhvd2V2ZXIgdGhpcyBwYXRjaCB0aHJvd3MgdGhpcyB3YXJuaW5nLgoKZHJpdmVycy9i
bHVldG9vdGgvYnR1c2IuYzogSW4gZnVuY3Rpb24g4oCYYnR1c2JfcmVjdl9hY2xfbXRr4oCZOgpk
cml2ZXJzL2JsdWV0b290aC9idHVzYi5jOjQwMzM6Mzogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQg
bWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCiA0MDMzIHwgICB1c2Jf
ZGlzYWJsZV9hdXRvc3VzcGVuZChkYXRhLT51ZGV2KTsKICAgICAgfCAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+CmRyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmM6NDAzNDoyOiBu
b3RlOiBoZXJlCiA0MDM0IHwgIGNhc2UgMHgwNWZmOiAgLyogRmlybXdhcmUgZGVidWcgbG9nZ2lu
ZyAxICovCiAgICAgIHwgIF5+fn4KCgpSZWdhcmRzLApUZWRkCgoKT24gV2VkLCAyMDIxLTA4LTA0
IGF0IDE2OjQ4ICswMjAwLCBNYXJjZWwgSG9sdG1hbm4gd3JvdGU6Cj4gSGkgTWFyaywKPiAKPiA+
IE1lZGlhdGVrIEJsdWV0b290aCBjb250cm9sbGVyIHNlbmRzIHRoZSBGVyBsb2cgYW5kIEZXIGR1
bXAgdmlhIEVQMi4KPiA+IFRoaXMgcGF0Y2ggY3JlYXRlcyBhbiBNVEsgc3BlY2lmaWVkIGNhbGxi
YWNrKGJ0dXNiX3JlY3ZfYWNsX210aykgdG8KPiA+IHJlcGxhY2UgdGhlIG9yaWdpbmFsIG9uZSAo
aGNpX3JlY3ZfZnJhbWUpIHdoZW4gYW4gTVRLIGNvbnRyb2xsZXIgaXMKPiA+IGRldGVjdGVkLiBU
aGUgbmV3IGNhbGxiYWNrIHdpbGwgc2VwYXJhdGUgdGhlIGZpcm13YXJlIGR1bXAgdHJhZmZpY3MK
PiA+IGZyb20gdGhlIEFDTCBkYXRhIHRvIGhhdmUgdGhlbSBwcm9jZXNzIHNlcGFyYXRlbHkuCj4g
PiAKPiA+IDEuIEFkZCBhIG5ldyBmaWVsZCAocmVjdl9hY2wpIHRvIHRoZSBidHVzYl9kYXRhIHN0
cnVjdCB0byBzdG9yZQo+ID4gdmVuZG9yLXNwZWNpZmljIEFDTCBjYWxsYmFjayBoYW5kbGVyLgo+
ID4gMi4gQWRkIHRoZSBNVEstc3BlY2lmaWMgQUNMIGNhbGxiYWNrIGhhbmRsZXIgKGJ0dXNiX3Jl
Y3ZfYWNsX210aykgdG8KPiA+IHByb2Nlc3MgQUNMIGRhdGEsIGRlYnVnIGxvZywgYW5kIGZpcm13
YXJlIGR1bXAuCj4gPiAzLiBUaGUgZGVidWcgbG9nIHRyYWNlcyBMTVAvTEwgZXZlbnRzIGFuZCBj
b25uZWN0aW9uIHF1YWxpdHkgcmVwb3J0cy4KPiA+IDQuIFRoZSB1cHBlciBsYXllciBjYW4gdXNl
IGhjaV9jaGFubmVsX21vbml0b3IgdG8gcmVjZWl2ZSB0aGVzZQo+ID4gcGFja2V0cy4KPiA+IAo+
ID4gRXhhbXBsZSBidG1vbjogZmlybXdhcmUgZGVidWcgbG9nLgo+ID4gMS4gRW5hYmxlIGZpcm13
YXJlIGRlYnVnIGxvZy4KPiA+IDwgSENJIENvbW1hbmQ6IFZlbmRvciAoMHgzZnwweDAwNWQpIHBs
ZW4gNAo+ID4gICAgICAgIDAwIDAwIDAyIDAyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAuLi4uCj4gPiA+IEhDSSBFdmVudDogQ29tbWFuZCBDb21wbGV0ZSAoMHgwZSkgcGxl
biA4Cj4gPiAgICAgIFZlbmRvciAoMHgzZnwweDAwNWQpIG5jbWQgMQo+ID4gICAgICAgIFN0YXR1
czogU3VjY2VzcyAoMHgwMCkKPiA+ICAgICAgICAwMCAwMCAwMiAwMiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLi4uLgo+ID4gMi4gRGlhZ25vc3RpYyBwYWNrZXQgZnJvbSBj
b250cm9sbGVyCj4gPiA9IFZlbmRvciBEaWFnbm9zdGljIChsZW4gNTAwKQo+ID4gICAgICAgICAg
ZmYgMDUgZjAgMDEgZmQgZmYgMDIgMGUgMDggMDEgNWQgZmMgMDAgMDAgMDAgMDIKPiA+ICAgICAg
ICAgIDAyIGFhIGFhIGFhIGNiIGUzIGYwIDE1IGIwIDBjIDVmIDAxIDAwIGQxIDBmIDMzCj4gPiAg
ICAgICAgICAwMSA3ZiAwMCAwOCA1NyA2MSAwYyAwMCAwMCAwMCAwMCAwMCAyMyAzNyAxNyAwMAo+
ID4gICAgICAgICAgZmQgZmYgMDAgMDAgMjkgNjAgZmYgZmYgYjEgNTYgZTggMDAgNTcgNDAgMGEg
NDAKPiA+ICAgICAgICAgIDM5IDk1IGYyIDAwIDQ3IDQwIDQzIDAwIGZjIGYwIDE2IDAwIDU3IDYx
IDBjIDAwCj4gPiAgICAgICAgICAwMCAwMCAwMCAwMCAyMyAzNyAxNyAwMCBmZCBmZiAwMCAwMCAy
OSA2MCBmZiBmZgo+ID4gICAgICAgICAgNjUgOTUgZjIgMDAgNTcgNDAgMGEgNDAgZWMgZDMgZmMg
MDAgNDcgNDAgM2IgMDAKPiA+ICAgICAgICAgIDJjIGYxIDE3IDAwIDU3IDYxIDBjIDAwIDAwIDAw
IDAwIDAwIDIzIDM3IDE3IDAwCj4gPiAgICAgICAgICBmZCBmZiAwMCAwMCAyOSA2MCBmZiBmZiAx
OSBkNCBmYyAwMCA1NyA0MCA3NiAxYwo+ID4gICAgICAgICAgYjIgNjEgMDEgMDEgNDcgNDAgYjMg
MDQgMGIgNjMgMTggMDAgZmUgZmYgMDIgMDEKPiA+ICAgICAgICAgIDA0IDA1IDMzIDhiIDllIDA4
IDAwIGFhIGFhIGFhIGFhIGFhIDI3IDM4IDAxIDAyCj4gPiAgICAgICAgICAwMSAwMCAwMCAwMCAw
MiBlMCAxMCAwMCAyMCAwMCAyMCAwMCAyYSAwOCA0MCAwMAo+ID4gICAgICAgICAgMjAgMDAgMjAg
MDggMmEgMDggMDIgMDAgNDAgMDAgMDAgMDEgMmUgMDggNDAgMDAKPiA+ICAgICAgICAgIDAxIDY3
IGIwIGMyIDJlIDA4IDNlIDA3IGZmIGZmIGZmIGZmIDQwIDA4IDAxIDAwCj4gPiAgICAgICAgICAw
MiAwMCAwMCAwMCAzNCAwOCBhMyAwMCAwMCAwMCAwMCAwMCAzNCAwOCBhMyAwMAo+ID4gICAgICAg
ICAgMDAgMDAgMDAgMDAgMzUgMDggNDUgMDEgMDAgMDAgMDAgMDAgMmUgMDggNDAgMDAKPiA+ICAg
ICAgICAgIDAxIDY3IGIwIGMyIDMwIDM1IDAxIDAyIDAwIDAwIDAwIDAwIDJjIDMxIDAxIDAwCj4g
PiAgICAgICAgICAwMiAwMCAwMCA0MCAyZCAxOSAwMyAwMCAwMCA0MCAwMCAwMCBmZCBmZiAwMiAw
Zgo+ID4gICAgICAgICAgMDQgMDAgMDEgMDEgMDQgYWEgYWEgYWEgYWEgYWEgYWEgYWEgNTcgNjEg
MGMgMDAKPiA+ICAgICAgICAgIDAwIDAwIDAwIDAwIDIzIDQ2IDMyIDAwIDAxIDAwIDAwIDAwIDJm
IDM1IDAwIDAyCj4gPiAgICAgICAgICAwMCAwMCAwMCAwMCAyOSAzNSBmZiAwMiAwMCAyMiAwMCAw
MCAyZCAzMSBhNiAwMgo+ID4gICAgICAgICAgMDIgMDAgMDAgMDAgMzEgNmMgNDAgMDAgMTQgNjMg
MTggMWIgMzEgNmMgNDAgMDAKPiA+ICAgICAgICAgIDE0IDYzIDE4IDIzIDUxIDA4IDUzIDAwIDEy
IDYzIDE4IDAwIDJjIDM1IDEyIDAxCj4gPiAgICAgICAgICBmZSAwMCAwMCAwMCAyYiAzNSBmZSAw
MiAwMiAwMCAwMCAwMCAyZiAzMSAyMSAwMAo+ID4gICAgICAgICAgMDAgMDAgMDIgMDAgNzUgNjEg
MDEgMDAgNGMgMWIgOTMgMDAgNzkgNjEgMDEgMDAKPiA+ICAgICAgICAgIDAwIDAwIDAwIDAwIDEy
IGUzIDYzIDE4IDIwIDMxIDg2IDAxIDc0IDYxIDY4IDAzCj4gPiAgICAgICAgICAwMCAwMCAwNCAw
MCBhMSA3MyBmZiAwMCBiOSAwMSAwMCAwMCBhMSA3MyAwNCAwMAo+ID4gICAgICAgICAgMDAgMDAg
MDAgMDAgYTEgNzMgMDAgMDAgMDAgMDAgMDAgMDAgYTEgNzMgMDAgMDAKPiA+ICAgICAgICAgIDAy
IDAwIDAwIDAwIDMxIDZjIDQwIDAwIDE2IDYzIDE4IDBjIDMxIDZjIDQwIDAwCj4gPiAgICAgICAg
ICAxNiA2MyAxOCAxYyA3NyA2MSA0MCAwMCA0OCAzMyA0MCAwMCAxNCBlMyA2MyAxOAo+ID4gICAg
ICAgICAgNDAgMzEgODYgMDEgMDAgZDEgMDIgYzUgMDcgMjMgYTEgMzQgNzMgNjEgMzcgMDIKPiA+
ICAgICAgICAgIDAyIDAwIDAwIGExCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IG1hcmsteXcuY2hl
biA8bWFyay15dy5jaGVuQG1lZGlhdGVrLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBNaWNoYWVsIFN1
biA8bWljaGFlbGZzdW5AZ29vZ2xlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBcmNoaWUgUHVzYWth
IDxhcHVzYWthQGNocm9taXVtLm9yZz4KPiA+IC0tLQo+ID4gZHJpdmVycy9ibHVldG9vdGgvYnR1
c2IuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+IDEgZmlsZSBjaGFuZ2VkLCAy
NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gcGF0Y2ggaGFzIGJlZW4gYXBwbGll
ZCB0byBibHVldG9vdGgtbmV4dCB0cmVlLgo+IAo+IFJlZ2FyZHMKPiAKPiBNYXJjZWwKPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
