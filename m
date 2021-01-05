Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD41C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 07:34:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0263D2065D
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 07:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0263D2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fw9CZq5K4Lz2tPbqOEdn3wKVlHQPqNu6938jznuurmg=; b=ixyh96ayMU0R6UkrqigP8WgFS
	dWtptJUA3HW17MDuvTvWvzB2gQt6H5FKMxUwuxhM88Pi1k5GYK6KO8Zxz/U9XzUwn4denoBxjnPY0
	8t4+dH9w+329utwrxhjqtfKkOTOys9rPIjgDYVZisWziGFtO5lvGwVbtZvCYddBb4NGUmzKQyqJ3s
	FGFM95LKH8/eOLR0QL4COtUCplCfQXkjQTOiMB9k9iLyF9lq5hrpJ+mxmZCs/B7xjg3xqXOQZabO3
	obHuIP2MkM4k4Rp0SrfJxNbJJk6g58SygDiNTWimmxKY+7JbKT/RTYikSiqGUH3YjhuTthOdI6Y4z
	8Nn/hTEzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwgql-0001PI-Qj; Tue, 05 Jan 2021 07:33:51 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwgqh-0001LD-BK; Tue, 05 Jan 2021 07:33:48 +0000
IronPort-SDR: ga/SPyjURFm6jidqycX77KWYA/m8lLLmTS3U1wEHZ2j9yWxl358FCN49Q/1JtveBLi2HEvbTso
 gxhovPEfeN3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="156259894"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; d="scan'208";a="156259894"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2021 23:33:44 -0800
IronPort-SDR: UxgStSIfqJrtaRejgRdQZElqt6gDSXZmA90ekirnF/Kh0JhEYyRaLS6yVcGB0Ww4TSJVzczTC9
 LvxGLwNG0JhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; d="scan'208";a="462213936"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.94])
 ([10.237.72.94])
 by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2021 23:33:36 -0800
Subject: Re: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
To: Can Guo <cang@codeaurora.org>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
 <e8980753-fa48-7862-e5ce-0d756d5d97a6@intel.com>
 <X/NkktFnWI48XNcp@builder.lan>
 <b82dd5f1-179c-6834-9d8f-88005b74ce51@intel.com>
 <ff2c3c4379cb8bc41580d5615b01f86a@codeaurora.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <a509d1ad-617d-8160-1dae-da0dbf19652c@intel.com>
Date: Tue, 5 Jan 2021 09:33:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ff2c3c4379cb8bc41580d5615b01f86a@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_023347_536309_9D6B1FA8 
X-CRM114-Status: GOOD (  23.65  )
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
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Avri Altman <avri.altman@wdc.com>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kwmad.kim@samsung.com,
 stanley.chu@mediatek.com, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, martin.petersen@oracle.com, nguyenb@codeaurora.org,
 open list <linux-kernel@vger.kernel.org>, hongwus@codeaurora.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gNS8wMS8yMSA5OjI4IGFtLCBDYW4gR3VvIHdyb3RlOgo+IE9uIDIwMjEtMDEtMDUgMTU6MTYs
IEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4+IE9uIDQvMDEvMjEgODo1NSBwbSwgQmpvcm4gQW5kZXJz
c29uIHdyb3RlOgo+Pj4gT24gTW9uIDA0IEphbiAwMzoxNSBDU1QgMjAyMSwgQWRyaWFuIEh1bnRl
ciB3cm90ZToKPj4+Cj4+Pj4gT24gMjIvMTIvMjAgMzo0OSBwbSwgWmlxaSBDaGVuIHdyb3RlOgo+
Pj4+PiBBcyBwZXIgc3BlY3MsIGUuZywgSkVTRDIyMEUgY2hhcHRlciA3LjIsIHdoaWxlIHBvd2Vy
aW5nCj4+Pj4+IG9mZi9vbiB0aGUgdWZzIGRldmljZSwgUlNUX04gc2lnbmFsIGFuZCBSRUZfQ0xL
IHNpZ25hbAo+Pj4+PiBzaG91bGQgYmUgYmV0d2VlbiBWU1MoR3JvdW5kKSBhbmQgVkNDUS9WQ0NR
Mi4KPj4+Pj4KPj4+Pj4gVG8gZmxleGlibHkgY29udHJvbCBkZXZpY2UgcmVzZXQgbGluZSwgcmVm
YWN0b3IgdGhlIGZ1bmN0aW9uCj4+Pj4+IHVmc2NoZF92b3BzX2RldmljZV9yZXNldChzdHVyY3Qg
dWZzX2hiYSAqaGJhKSB0byB1ZnNoY2RfCj4+Pj4+IHZvcHNfZGV2aWNlX3Jlc2V0KHN0dXJjdCB1
ZnNfaGJhICpoYmEsIGJvb2wgYXNzZXJ0ZWQpLiBUaGUKPj4+Pj4gbmV3IHBhcmFtZXRlciAiYm9v
bCBhc3NlcnRlZCIgaXMgdXNlZCB0byBzZXBhcmF0ZSBkZXZpY2UgcmVzZXQKPj4+Pj4gbGluZSBw
dWxsaW5nIGRvd24gZnJvbSBwdWxsaW5nIHVwLgo+Pj4+Cj4+Pj4gVGhpcyBwYXRjaCBhc3N1bWVz
IHRoZSBwb3dlciBpcyBjb250cm9sbGVkIGJ5IHZvbHRhZ2UgcmVndWxhdG9ycywgYnV0Cj4+Pj4g
Zm9yIHVzCj4+Pj4gaXQgaXMgY29udHJvbGxlZCBieSBmaXJtd2FyZSAoQUNQSSksIHNvIGl0IGlz
IG5vdCBjb3JyZWN0IHRvIGNoYW5nZSBSU1Rfbgo+Pj4+IGZvciBhbGwgaG9zdCBjb250cm9sbGVy
cyBhcyB5b3UgYXJlIGRvaW5nLgo+Pj4+Cj4+Pj4gQWxzbyB3ZSBtaWdodCBuZWVkIHRvIHVzZSBh
IGZpcm13YXJlIGludGVyZmFjZSBmb3IgZGV2aWNlIHJlc2V0LCBpbiB3aGljaAo+Pj4+IGNhc2Ug
dGhlICdhc3NlcnRlZCcgdmFsdWUgZG9lIG5vdCBtYWtlIHNlbnNlLgo+Pj4+Cj4+Pgo+Pj4gQXJl
IHlvdSBzYXlpbmcgdGhhdCB0aGUgZW50aXJlIGZsaXAtZmxvcC10aGUtcmVzZXQgaXMgYSBzaW5n
bGUgZmlybXdhcmUKPj4+IG9wZXJhdGlvbiBpbiB5b3VyIGNhc2U/Cj4+Cj4+IFllcwo+Pgo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJZiB5b3UgbG9v
ayBhdCB0aGUgTWVkaWF0ZWsgZHJpdmVyLCB0aGUKPj4+IGltcGxlbWVudGF0aW9uIG9mIHVmc19t
dGtfZGV2aWNlX3Jlc2V0X2N0cmwoKSBpcyBhIGp1bXAgdG8gZmlybXdhcmUuCj4+Pgo+Pj4KPj4+
IEJ1dCBwZXJoYXBzICJhc3NlcnRlZCIgaXNuJ3QgdGhlIGFwcHJvcHJpYXRlIEVuZ2xpc2ggd29y
ZCBmb3Igc2F5aW5nCj4+PiAidGhlIHJlc2V0IGlzIGluIHRoZSByZXNldHRpbmcgc3RhdGUiPwo+
Pj4KPj4+IEkganVzdCB3YW50ZWQgdG8gYXZvaWQgdGhlIHVzZSBvZiAiaGlnaCIvImxvIiBhcyBp
ZiB5b3UgbG9vayBhdCB0aGUKPj4+IE1lZGlhdGVrIGNvZGUgdGhleSBwYXNzIHRoZSBleHBlY3Rl
ZCBsaW5lLWxldmVsIHRvIHRoZSBmaXJtd2FyZSwgd2hpbGUKPj4+IGluIHRoZSBRdWFsY29tbSBj
b2RlIHdlIHBhc3MgdGhlIGxvZ2ljYWwgc3RhdGUgdG8gdGhlIEdQSU8gY29kZSB3aGljaCBpcwo+
Pj4gc2V0dXAgdXAgYXMgImFjdGl2ZSBsb3ciIGFuZCB0aGVyZWJ5IGZsaXAgdGhlIG1lYW5pbmcg
YmVmb3JlIGhpdHRpbmcgdGhlCj4+PiBwYWQuCj4+Pgo+Pj4+IENhbiB3ZSBsZWF2ZSB0aGUgZGV2
aWNlIHJlc2V0IGNhbGxiYWNrIGFsb25lLCBhbmQgaW5zdGVhZCBpbnRyb2R1Y2UgYSBuZXcKPj4+
PiB2YXJpYW50IG9wZXJhdGlvbiBmb3Igc2V0dGluZyBSU1RfbiB0byBtYXRjaCB2b2x0YWdlIHJl
Z3VsYXRvciBwb3dlcgo+Pj4+IGNoYW5nZXM/Cj4+Pgo+Pj4gV291bGRuJ3QgdGhpcyBuZXcgZnVu
Y3Rpb24ganVzdCBoYXZlIHRvIGxvb2sgbGlrZSB0aGUgcHJvcG9zZWQgcGF0Y2hlcz8KPj4+IElu
IHdoaWNoIGNhc2UgZm9yIGV4aXN0aW5nIHBsYXRmb3JtcyB3ZSdkIGhhdmUgYm90aD8KPj4+Cj4+
PiBIb3cgd291bGQgeW91IGltcGxlbWVudCB0aGlzLCBvciB3b3VsZCB5b3Ugc2ltcGx5IHNraXAg
aW1wbGVtZW50aW5nCj4+PiB0aGlzPwo+Pgo+PiBGdW5jdGlvbmFsbHksIGRvaW5nIGEgZGV2aWNl
IHJlc2V0IGlzIG5vdCB0aGUgc2FtZSBhcyBhZGp1c3Rpbmcgc2lnbmFsCj4+IGxldmVscyB0byBt
ZWV0IHBvd2VyIHVwL29mZiByYW1wIHJlcXVpcmVtZW50cy7CoCBIb3dldmVyLCB0aGUgaXNzdWUg
aXMgdGhhdAo+PiB3ZSBkbyBub3QgdXNlIHJlZ3VsYXRvcnMsIHNvIHRoZSBwb3dlciBpcyBub3Qg
bmVjZXNzYXJpbHkgYmVpbmcgY2hhbmdlZCBhdAo+PiB0aG9zZSBwb2ludHMsIGFuZCB3ZSBkZWZp
bml0ZWx5IGRvIG5vdCB3YW50IHRvIHJlc2V0IGluc3RlYWQgb2YgZW50ZXJpbmcKPj4gRGVlcFNs
ZWVwIGZvciBleGFtcGxlLgo+Pgo+PiBPZmYgdGhlIHRvcCBvZiBteSBoZWFkLCBJIGltYWdpbmUg
c29tZXRoaW5nIGxpa2UgYSBjYWxsYmFjayBjYWxsZWQKPj4gdWZzaGNkX3ZvcHNfcHJlcGFyZV9w
b3dlcl9yYW1wKGhiYSwgYm9vbCBvbikgd2hpY2ggaXMgY2FsbGVkIG9ubHkgaWYKPj4gaGJhLT52
cmVnX2luZm8tPnZjYyBpcyBub3QgTlVMTC4KPiAKPiBIaSBBZHJpYW4sCj4gCj4gSSBkb24ndCBz
ZWUgeW91IGhhdmUgdGhlIHZvcHMgZGV2aWNlX3Jlc2V0KCkgaW1wbGVtZW50ZWQgYW55d2hlcmUg
aW4KPiBjdXJyZW50IGNvZGUgYmFzZSwgaG93IGlzIHRoaXMgY2hhbmdlIGltcGFjdGluZyB5b3U/
IERvIEkgbWlzcyBhbnl0aGluZwo+IG9yIGFyZSB5b3UgcGxhbm5pbmcgdG8gcHVzaCBhIGNoYW5n
ZSB3aGljaCBpbXBsZW1lbnRzIGRldmljZV9yZXNldCgpIHNvb24/CgpBdCBzb21lIHBvaW50LCB5
ZXMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
