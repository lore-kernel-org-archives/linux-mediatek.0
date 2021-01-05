Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3541C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 10:06:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70260224F9
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 10:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70260224F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8kS1O1rrNm8tZETUj7LQQc8waEbl0Rn/xP4ZprdOum8=; b=rtvzrZdDBo0a93luOJ1QgIE8Z
	370MBLJ9ZlWwX3UlcqnzNxLFZ7rTASHzwpix8UVJiqgNkKMk3DRkz636jaAidu4rJOCf/7a4tx4f8
	y9RcfmqHlPWVBw+EZ/KgeXFIdKGt5Sra8MvFNkfSgiTL6fZibTP2Xm24iIqyY9yslgw6Q8EDYa7xJ
	zp4kV2yFv2Aqiup7FzUZVg6Zb60xo0r9A0HZCwpK6BhBM2xK4LgD8+oQVKzcWIN0S1rEWkmaHSu5U
	IwVVaypXn9QOnMdIjD1QY6AwTX2/ygwCB3AebgIMJTFdLGVM33EznFc6CsvhihOvSzY8yHkXBwq0i
	8FR6xLrPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwjEI-0005CU-AP; Tue, 05 Jan 2021 10:06:18 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwjEF-0005AI-Ek
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 10:06:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609841174; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iPV4BBvWfxou0064ByS5t3TW4OLKrsUABLgZaf1wgpA=;
 b=o2KLSmh238RiLFWIYrLhyrndv1Ge0Wb09dHHYo3ShEwAedq/E590COjEevBKK/SWXJyvadRi
 xx4Eo2n4+gclyMBXqBZg4lf6zeYnZvl4VmmmSI92apVURvCjihdAbicawTs0VQPPAogjepB7
 /jzG2SZ3mRvCHjqgl/YI+CjVD3E=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5ff43a15b73be0303d68ef8a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Jan 2021 10:06:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D6FC0C43467; Tue,  5 Jan 2021 10:06:13 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 48748C433ED;
 Tue,  5 Jan 2021 10:06:12 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 05 Jan 2021 18:06:12 +0800
From: Can Guo <cang@codeaurora.org>
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
In-Reply-To: <a509d1ad-617d-8160-1dae-da0dbf19652c@intel.com>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
 <e8980753-fa48-7862-e5ce-0d756d5d97a6@intel.com>
 <X/NkktFnWI48XNcp@builder.lan>
 <b82dd5f1-179c-6834-9d8f-88005b74ce51@intel.com>
 <ff2c3c4379cb8bc41580d5615b01f86a@codeaurora.org>
 <a509d1ad-617d-8160-1dae-da0dbf19652c@intel.com>
Message-ID: <bb0a37d5825eec1ec03a1ba1104fec86@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_050615_649298_FA36E31F 
X-CRM114-Status: GOOD (  21.34  )
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
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, vinholikatti@gmail.com,
 Bean Huo <beanhuo@micron.com>, Satya Tangirala <satyat@google.com>,
 jejb@linux.vnet.ibm.com, Bart Van Assche <bvanassche@acm.org>,
 linux-scsi@vger.kernel.org, Ziqi Chen <ziqichen@codeaurora.org>,
 Andy Gross <agross@kernel.org>, kernel-team@android.com, salyzyn@google.com,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, Avri Altman <avri.altman@wdc.com>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kwmad.kim@samsung.com,
 stanley.chu@mediatek.com, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, martin.petersen@oracle.com, nguyenb@codeaurora.org,
 open list <linux-kernel@vger.kernel.org>, hongwus@codeaurora.org,
 asutoshd@codeaurora.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wMS0wNSAxNTozMywgQWRyaWFuIEh1bnRlciB3cm90ZToKPiBPbiA1LzAxLzIxIDk6
MjggYW0sIENhbiBHdW8gd3JvdGU6Cj4+IE9uIDIwMjEtMDEtMDUgMTU6MTYsIEFkcmlhbiBIdW50
ZXIgd3JvdGU6Cj4+PiBPbiA0LzAxLzIxIDg6NTUgcG0sIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToK
Pj4+PiBPbiBNb24gMDQgSmFuIDAzOjE1IENTVCAyMDIxLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+
Pj4+IAo+Pj4+PiBPbiAyMi8xMi8yMCAzOjQ5IHBtLCBaaXFpIENoZW4gd3JvdGU6Cj4+Pj4+PiBB
cyBwZXIgc3BlY3MsIGUuZywgSkVTRDIyMEUgY2hhcHRlciA3LjIsIHdoaWxlIHBvd2VyaW5nCj4+
Pj4+PiBvZmYvb24gdGhlIHVmcyBkZXZpY2UsIFJTVF9OIHNpZ25hbCBhbmQgUkVGX0NMSyBzaWdu
YWwKPj4+Pj4+IHNob3VsZCBiZSBiZXR3ZWVuIFZTUyhHcm91bmQpIGFuZCBWQ0NRL1ZDQ1EyLgo+
Pj4+Pj4gCj4+Pj4+PiBUbyBmbGV4aWJseSBjb250cm9sIGRldmljZSByZXNldCBsaW5lLCByZWZh
Y3RvciB0aGUgZnVuY3Rpb24KPj4+Pj4+IHVmc2NoZF92b3BzX2RldmljZV9yZXNldChzdHVyY3Qg
dWZzX2hiYSAqaGJhKSB0byB1ZnNoY2RfCj4+Pj4+PiB2b3BzX2RldmljZV9yZXNldChzdHVyY3Qg
dWZzX2hiYSAqaGJhLCBib29sIGFzc2VydGVkKS4gVGhlCj4+Pj4+PiBuZXcgcGFyYW1ldGVyICJi
b29sIGFzc2VydGVkIiBpcyB1c2VkIHRvIHNlcGFyYXRlIGRldmljZSByZXNldAo+Pj4+Pj4gbGlu
ZSBwdWxsaW5nIGRvd24gZnJvbSBwdWxsaW5nIHVwLgo+Pj4+PiAKPj4+Pj4gVGhpcyBwYXRjaCBh
c3N1bWVzIHRoZSBwb3dlciBpcyBjb250cm9sbGVkIGJ5IHZvbHRhZ2UgcmVndWxhdG9ycywgCj4+
Pj4+IGJ1dAo+Pj4+PiBmb3IgdXMKPj4+Pj4gaXQgaXMgY29udHJvbGxlZCBieSBmaXJtd2FyZSAo
QUNQSSksIHNvIGl0IGlzIG5vdCBjb3JyZWN0IHRvIGNoYW5nZSAKPj4+Pj4gUlNUX24KPj4+Pj4g
Zm9yIGFsbCBob3N0IGNvbnRyb2xsZXJzIGFzIHlvdSBhcmUgZG9pbmcuCj4+Pj4+IAo+Pj4+PiBB
bHNvIHdlIG1pZ2h0IG5lZWQgdG8gdXNlIGEgZmlybXdhcmUgaW50ZXJmYWNlIGZvciBkZXZpY2Ug
cmVzZXQsIGluIAo+Pj4+PiB3aGljaAo+Pj4+PiBjYXNlIHRoZSAnYXNzZXJ0ZWQnIHZhbHVlIGRv
ZSBub3QgbWFrZSBzZW5zZS4KPj4+Pj4gCj4+Pj4gCj4+Pj4gQXJlIHlvdSBzYXlpbmcgdGhhdCB0
aGUgZW50aXJlIGZsaXAtZmxvcC10aGUtcmVzZXQgaXMgYSBzaW5nbGUgCj4+Pj4gZmlybXdhcmUK
Pj4+PiBvcGVyYXRpb24gaW4geW91ciBjYXNlPwo+Pj4gCj4+PiBZZXMKPj4+IAo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSWYgeW91IGxvb2sgYXQg
dGhlIE1lZGlhdGVrIGRyaXZlciwgdGhlCj4+Pj4gaW1wbGVtZW50YXRpb24gb2YgdWZzX210a19k
ZXZpY2VfcmVzZXRfY3RybCgpIGlzIGEganVtcCB0byBmaXJtd2FyZS4KPj4+PiAKPj4+PiAKPj4+
PiBCdXQgcGVyaGFwcyAiYXNzZXJ0ZWQiIGlzbid0IHRoZSBhcHByb3ByaWF0ZSBFbmdsaXNoIHdv
cmQgZm9yIHNheWluZwo+Pj4+ICJ0aGUgcmVzZXQgaXMgaW4gdGhlIHJlc2V0dGluZyBzdGF0ZSI/
Cj4+Pj4gCj4+Pj4gSSBqdXN0IHdhbnRlZCB0byBhdm9pZCB0aGUgdXNlIG9mICJoaWdoIi8ibG8i
IGFzIGlmIHlvdSBsb29rIGF0IHRoZQo+Pj4+IE1lZGlhdGVrIGNvZGUgdGhleSBwYXNzIHRoZSBl
eHBlY3RlZCBsaW5lLWxldmVsIHRvIHRoZSBmaXJtd2FyZSwgCj4+Pj4gd2hpbGUKPj4+PiBpbiB0
aGUgUXVhbGNvbW0gY29kZSB3ZSBwYXNzIHRoZSBsb2dpY2FsIHN0YXRlIHRvIHRoZSBHUElPIGNv
ZGUgCj4+Pj4gd2hpY2ggaXMKPj4+PiBzZXR1cCB1cCBhcyAiYWN0aXZlIGxvdyIgYW5kIHRoZXJl
YnkgZmxpcCB0aGUgbWVhbmluZyBiZWZvcmUgaGl0dGluZyAKPj4+PiB0aGUKPj4+PiBwYWQuCj4+
Pj4gCj4+Pj4+IENhbiB3ZSBsZWF2ZSB0aGUgZGV2aWNlIHJlc2V0IGNhbGxiYWNrIGFsb25lLCBh
bmQgaW5zdGVhZCBpbnRyb2R1Y2UgCj4+Pj4+IGEgbmV3Cj4+Pj4+IHZhcmlhbnQgb3BlcmF0aW9u
IGZvciBzZXR0aW5nIFJTVF9uIHRvIG1hdGNoIHZvbHRhZ2UgcmVndWxhdG9yIAo+Pj4+PiBwb3dl
cgo+Pj4+PiBjaGFuZ2VzPwo+Pj4+IAo+Pj4+IFdvdWxkbid0IHRoaXMgbmV3IGZ1bmN0aW9uIGp1
c3QgaGF2ZSB0byBsb29rIGxpa2UgdGhlIHByb3Bvc2VkIAo+Pj4+IHBhdGNoZXM/Cj4+Pj4gSW4g
d2hpY2ggY2FzZSBmb3IgZXhpc3RpbmcgcGxhdGZvcm1zIHdlJ2QgaGF2ZSBib3RoPwo+Pj4+IAo+
Pj4+IEhvdyB3b3VsZCB5b3UgaW1wbGVtZW50IHRoaXMsIG9yIHdvdWxkIHlvdSBzaW1wbHkgc2tp
cCBpbXBsZW1lbnRpbmcKPj4+PiB0aGlzPwo+Pj4gCj4+PiBGdW5jdGlvbmFsbHksIGRvaW5nIGEg
ZGV2aWNlIHJlc2V0IGlzIG5vdCB0aGUgc2FtZSBhcyBhZGp1c3RpbmcgCj4+PiBzaWduYWwKPj4+
IGxldmVscyB0byBtZWV0IHBvd2VyIHVwL29mZiByYW1wIHJlcXVpcmVtZW50cy7CoCBIb3dldmVy
LCB0aGUgaXNzdWUgaXMgCj4+PiB0aGF0Cj4+PiB3ZSBkbyBub3QgdXNlIHJlZ3VsYXRvcnMsIHNv
IHRoZSBwb3dlciBpcyBub3QgbmVjZXNzYXJpbHkgYmVpbmcgCj4+PiBjaGFuZ2VkIGF0Cj4+PiB0
aG9zZSBwb2ludHMsIGFuZCB3ZSBkZWZpbml0ZWx5IGRvIG5vdCB3YW50IHRvIHJlc2V0IGluc3Rl
YWQgb2YgCj4+PiBlbnRlcmluZwo+Pj4gRGVlcFNsZWVwIGZvciBleGFtcGxlLgo+Pj4gCj4+PiBP
ZmYgdGhlIHRvcCBvZiBteSBoZWFkLCBJIGltYWdpbmUgc29tZXRoaW5nIGxpa2UgYSBjYWxsYmFj
ayBjYWxsZWQKPj4+IHVmc2hjZF92b3BzX3ByZXBhcmVfcG93ZXJfcmFtcChoYmEsIGJvb2wgb24p
IHdoaWNoIGlzIGNhbGxlZCBvbmx5IGlmCj4+PiBoYmEtPnZyZWdfaW5mby0+dmNjIGlzIG5vdCBO
VUxMLgo+PiAKPj4gSGkgQWRyaWFuLAo+PiAKPj4gSSBkb24ndCBzZWUgeW91IGhhdmUgdGhlIHZv
cHMgZGV2aWNlX3Jlc2V0KCkgaW1wbGVtZW50ZWQgYW55d2hlcmUgaW4KPj4gY3VycmVudCBjb2Rl
IGJhc2UsIGhvdyBpcyB0aGlzIGNoYW5nZSBpbXBhY3RpbmcgeW91PyBEbyBJIG1pc3MgCj4+IGFu
eXRoaW5nCj4+IG9yIGFyZSB5b3UgcGxhbm5pbmcgdG8gcHVzaCBhIGNoYW5nZSB3aGljaCBpbXBs
ZW1lbnRzIGRldmljZV9yZXNldCgpIAo+PiBzb29uPwo+IAo+IEF0IHNvbWUgcG9pbnQsIHllcy4K
Ck9LLCB0aGVuIHdlIGRvbid0IGV2ZW4gaGF2ZSB0byBhZGQgYSBuZXcgdm9wcywganVzdCBnbyBi
YWNrIHRvIHZlcnNpb24gCiMxIHRvCnVzZSB1ZnNoY2Rfdm9wc19zdXNwZW5kKCkgdG8gY29udHJv
bCB0aGUgZGV2aWNlX3Jlc2V0LiBXZSB0b29rIHRoZSBoYXJkIAp3YXkKYmVjYXVzZSB3ZSB3YW50
ZWQgdG8gZml4IGl0IGZvciBhbGwgdXNlcnMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
