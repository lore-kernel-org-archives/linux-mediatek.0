Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2898C64E7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 16:47:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C2D3206B7
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 16:47:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CWjVtQLL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="cbH7oSfX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C2D3206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7xaBF/J4plCHTpijaCQUgFxHf52rpX9Hrput/EsXv3I=; b=CWjVtQLL17di6PJ3PAfdCxfwc
	dUzKnWbdvrP8sxeKZIskV3UKEwhgZ3nNFK7a38nWDi55dakUSggvpez1JrQIWfDjfEttLw+iIRtR2
	wpI9iUAiv4qE2T35sDUZN1kA74MU0RA+lg/nQMt7aFVtIl9dXPj606LPlPgkVUmwvlX0eBZHMx+xP
	aijPsJGVumsa3dWA+z2Hj+GIalj+PFvjEAQoBYFehvw6ZUEBmbz9xjnYJYkp6LpgoTefTg/c9hl/A
	k7NoPwk7nRE6FayWLSwFMlwkxnWvbEEW7zZ4b/amiSYZU6/E58Dwat36QLI0lsRG4Pe5So/LSLoaw
	BefM8pKxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk8oG-00030y-Nu; Tue, 01 Dec 2020 16:47:24 +0000
Received: from m42-5.mailgun.net ([69.72.42.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk8oB-000304-O9
 for linux-mediatek@lists.infradead.org; Tue, 01 Dec 2020 16:47:21 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606841240; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=vHVerjrHrtjQ+JfG4LASvM1TDWXfkcH4kB6Bb8hWyRY=;
 b=cbH7oSfXZNymVSgXRukUO03j2KcopT/sHzt6OCr7oGBCcbQ/GHSif6/vGsqiRIuu/saXvQqf
 2UUMNOEX1uBKIp1QH1z9key/fTMHpei8oT2+I+E2ypsKnRYSA+YrjAkBCIMtluldFhgMMtkR
 9PcQGDmttAMCfRUkkzsSiBDqTQU=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fc673920f9adc18c7304871 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Dec 2020 16:47:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7E8E4C43466; Tue,  1 Dec 2020 16:47:13 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 574F9C433ED;
 Tue,  1 Dec 2020 16:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 574F9C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v3 1/2] scsi: ufs: Refactor ufshcd_setup_clocks() to
 remove skip_ref_clk
To: Can Guo <cang@codeaurora.org>
References: <1606356063-38380-1-git-send-email-cang@codeaurora.org>
 <1606356063-38380-2-git-send-email-cang@codeaurora.org>
 <f99ee6cd-6e09-4160-f9e8-2d8b04cbfa1e@codeaurora.org>
 <81ac4e5b5974cd7a21f18bf4e74213e9@codeaurora.org>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <2e27f15a-988a-fb08-9c51-913a542b7399@codeaurora.org>
Date: Tue, 1 Dec 2020 08:47:09 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <81ac4e5b5974cd7a21f18bf4e74213e9@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_114720_868100_CFD31D60 
X-CRM114-Status: GOOD (  25.02  )
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
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Satya Tangirala <satyat@google.com>,
 rnayak@codeaurora.org, saravanak@google.com, linux-scsi@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, nguyenb@codeaurora.org,
 ziqichen@codeaurora.org, Avri Altman <avri.altman@wdc.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 salyzyn@google.com, Alim Akhtar <alim.akhtar@samsung.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com,
 Bart Van Assche <bvanassche@acm.org>, hongwus@codeaurora.org,
 Bean Huo <beanhuo@micron.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMTEvMzAvMjAyMCA3OjExIFBNLCBDYW4gR3VvIHdyb3RlOgo+IE9uIDIwMjAtMTItMDEgMDc6
MDEsIEFzdXRvc2ggRGFzIChhc2QpIHdyb3RlOgo+PiBPbiAxMS8yNS8yMDIwIDY6MDEgUE0sIENh
biBHdW8gd3JvdGU6Cj4+PiBSZW1vdmUgdGhlIHBhcmFtIHNraXBfcmVmX2NsayBmcm9tIF9fdWZz
aGNkX3NldHVwX2Nsb2NrcygpLCBidXQga2VlcCAKPj4+IGEgZmxhZwo+Pj4gaW4gc3RydWN0IHVm
c19jbGtfaW5mbyB0byB0ZWxsIHdoZXRoZXIgYSBjbG9jayBjYW4gYmUgZGlzYWJsZWQgb3Igbm90
IAo+Pj4gd2hpbGUKPj4+IHRoZSBsaW5rIGlzIGFjdGl2ZS4KPj4+Cj4+PiBSZXZpZXdlZC1ieTog
SG9uZ3d1IFN1PGhvbmd3dXNAY29kZWF1cm9yYS5vcmc+Cj4+PiBSZXZpZXdlZC1ieTogQmVhbiBI
dW8gPGJlYW5odW9AbWljcm9uLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBTdGFubGV5IENodSA8c3Rh
bmxleS5jaHVAbWVkaWF0ZWsuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2FuIEd1byA8Y2FuZ0Bj
b2RlYXVyb3JhLm9yZz4KPj4+IC0tLQo+Pj4gwqAgZHJpdmVycy9zY3NpL3Vmcy91ZnNoY2QtcGx0
ZnJtLmMgfMKgIDIgKysKPj4+IMKgIGRyaXZlcnMvc2NzaS91ZnMvdWZzaGNkLmPCoMKgwqDCoMKg
wqDCoCB8IDI5ICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiDCoCBkcml2ZXJzL3Nj
c2kvdWZzL3Vmc2hjZC5owqDCoMKgwqDCoMKgwqAgfMKgIDMgKysrCj4+PiDCoCAzIGZpbGVzIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3Njc2kvdWZzL3Vmc2hjZC1wbHRmcm0uYyAKPj4+IGIvZHJpdmVycy9zY3Np
L3Vmcy91ZnNoY2QtcGx0ZnJtLmMKPj4+IGluZGV4IDNkYjBhZjYuLjg3M2VmMTQgMTAwNjQ0Cj4+
PiAtLS0gYS9kcml2ZXJzL3Njc2kvdWZzL3Vmc2hjZC1wbHRmcm0uYwo+Pj4gKysrIGIvZHJpdmVy
cy9zY3NpL3Vmcy91ZnNoY2QtcGx0ZnJtLmMKPj4+IEBAIC05Miw2ICs5Miw4IEBAIHN0YXRpYyBp
bnQgdWZzaGNkX3BhcnNlX2Nsb2NrX2luZm8oc3RydWN0IHVmc19oYmEgCj4+PiAqaGJhKQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIGNsa2ktPm1pbl9mcmVxID0gY2xrZnJlcVtpXTsKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBjbGtpLT5tYXhfZnJlcSA9IGNsa2ZyZXFbaSsxXTsKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBjbGtpLT5uYW1lID0ga3N0cmR1cChuYW1lLCBHRlBfS0VSTkVMKTsKPj4+ICvC
oMKgwqDCoMKgwqDCoCBpZiAoIXN0cmNtcChuYW1lLCAicmVmX2NsayIpKQo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY2xraS0+a2VlcF9saW5rX2FjdGl2ZSA9IHRydWU7Cj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgZGV2X2RiZyhkZXYsICIlczogbWluICV1IG1heCAldSBuYW1lICVzXG4iLCAi
ZnJlcS10YWJsZS1oeiIsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNs
a2ktPm1pbl9mcmVxLCBjbGtpLT5tYXhfZnJlcSwgY2xraS0+bmFtZSk7Cj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgbGlzdF9hZGRfdGFpbCgmY2xraS0+bGlzdCwgJmhiYS0+Y2xrX2xpc3RfaGVhZCk7
Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zY3NpL3Vmcy91ZnNoY2QuYyBiL2RyaXZlcnMvc2Nz
aS91ZnMvdWZzaGNkLmMKPj4+IGluZGV4IGE3ODU3ZjYuLjQ0MjU0YzkgMTAwNjQ0Cj4+PiAtLS0g
YS9kcml2ZXJzL3Njc2kvdWZzL3Vmc2hjZC5jCj4+PiArKysgYi9kcml2ZXJzL3Njc2kvdWZzL3Vm
c2hjZC5jCj4+PiBAQCAtMjIxLDggKzIyMSw2IEBAIHN0YXRpYyBpbnQgdWZzaGNkX2VoX2hvc3Rf
cmVzZXRfaGFuZGxlcihzdHJ1Y3QgCj4+PiBzY3NpX2NtbmQgKmNtZCk7Cj4+PiDCoCBzdGF0aWMg
aW50IHVmc2hjZF9jbGVhcl90bV9jbWQoc3RydWN0IHVmc19oYmEgKmhiYSwgaW50IHRhZyk7Cj4+
PiDCoCBzdGF0aWMgdm9pZCB1ZnNoY2RfaGJhX2V4aXQoc3RydWN0IHVmc19oYmEgKmhiYSk7Cj4+
PiDCoCBzdGF0aWMgaW50IHVmc2hjZF9wcm9iZV9oYmEoc3RydWN0IHVmc19oYmEgKmhiYSwgYm9v
bCBhc3luYyk7Cj4+PiAtc3RhdGljIGludCBfX3Vmc2hjZF9zZXR1cF9jbG9ja3Moc3RydWN0IHVm
c19oYmEgKmhiYSwgYm9vbCBvbiwKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBib29sIHNraXBfcmVmX2Nsayk7Cj4+PiDCoCBzdGF0aWMgaW50IHVmc2hjZF9zZXR1cF9jbG9j
a3Moc3RydWN0IHVmc19oYmEgKmhiYSwgYm9vbCBvbik7Cj4+PiDCoCBzdGF0aWMgaW50IHVmc2hj
ZF91aWNfaGliZXJuOF9lbnRlcihzdHJ1Y3QgdWZzX2hiYSAqaGJhKTsKPj4+IMKgIHN0YXRpYyBp
bmxpbmUgdm9pZCB1ZnNoY2RfYWRkX2RlbGF5X2JlZm9yZV9kbWVfY21kKHN0cnVjdCB1ZnNfaGJh
IAo+Pj4gKmhiYSk7Cj4+PiBAQCAtMTcwNywxMSArMTcwNSw3IEBAIHN0YXRpYyB2b2lkIHVmc2hj
ZF9nYXRlX3dvcmsoc3RydWN0IAo+Pj4gd29ya19zdHJ1Y3QgKndvcmspCj4+PiDCoMKgwqDCoMKg
wqDCoCB1ZnNoY2RfZGlzYWJsZV9pcnEoaGJhKTsKPj4+IMKgIC3CoMKgwqAgaWYgKCF1ZnNoY2Rf
aXNfbGlua19hY3RpdmUoaGJhKSkKPj4+IC3CoMKgwqDCoMKgwqDCoCB1ZnNoY2Rfc2V0dXBfY2xv
Y2tzKGhiYSwgZmFsc2UpOwo+Pj4gLcKgwqDCoCBlbHNlCj4+PiAtwqDCoMKgwqDCoMKgwqAgLyog
SWYgbGluayBpcyBhY3RpdmUsIGRldmljZSByZWZfY2xrIGNhbid0IGJlIHN3aXRjaGVkIG9mZiAq
Lwo+Pj4gLcKgwqDCoMKgwqDCoMKgIF9fdWZzaGNkX3NldHVwX2Nsb2NrcyhoYmEsIGZhbHNlLCB0
cnVlKTsKPj4+ICvCoMKgwqAgdWZzaGNkX3NldHVwX2Nsb2NrcyhoYmEsIGZhbHNlKTsKPj4+IMKg
wqDCoMKgwqDCoMKgIC8qCj4+PiDCoMKgwqDCoMKgwqAgKiBJbiBjYXNlIHlvdSBhcmUgaGVyZSB0
byBjYW5jZWwgdGhpcyB3b3JrIHRoZSBnYXRpbmcgc3RhdGUKPj4+IEBAIC03OTkwLDggKzc5ODQs
NyBAQCBzdGF0aWMgaW50IHVmc2hjZF9pbml0X2hiYV92cmVnKHN0cnVjdCB1ZnNfaGJhIAo+Pj4g
KmhiYSkKPj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+PiDCoCB9Cj4+PiDCoCAtc3RhdGljIGlu
dCBfX3Vmc2hjZF9zZXR1cF9jbG9ja3Moc3RydWN0IHVmc19oYmEgKmhiYSwgYm9vbCBvbiwKPj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIHNraXBfcmVmX2Ns
aykKPj4+ICtzdGF0aWMgaW50IHVmc2hjZF9zZXR1cF9jbG9ja3Moc3RydWN0IHVmc19oYmEgKmhi
YSwgYm9vbCBvbikKPj4+IMKgIHsKPj4+IMKgwqDCoMKgwqAgaW50IHJldCA9IDA7Cj4+PiDCoMKg
wqDCoMKgIHN0cnVjdCB1ZnNfY2xrX2luZm8gKmNsa2k7Cj4+PiBAQCAtODAwOSw3ICs4MDAyLDEy
IEBAIHN0YXRpYyBpbnQgX191ZnNoY2Rfc2V0dXBfY2xvY2tzKHN0cnVjdCAKPj4+IHVmc19oYmEg
KmhiYSwgYm9vbCBvbiwKPj4+IMKgwqDCoMKgwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnkoY2xr
aSwgaGVhZCwgbGlzdCkgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghSVNfRVJSX09SX05V
TEwoY2xraS0+Y2xrKSkgewo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHNraXBfcmVm
X2NsayAmJiAhc3RyY21wKGNsa2ktPm5hbWUsICJyZWZfY2xrIikpCj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAvKgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIERvbid0IGRpc2Fi
bGUgY2xvY2tzIHdoaWNoIGFyZSBuZWVkZWQKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KiB0byBrZWVwIHRoZSBsaW5rIGFjdGl2ZS4KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Ki8KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh1ZnNoY2RfaXNfbGlua19hY3RpdmUo
aGJhKSAmJgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbGtpLT5rZWVwX2xp
bmtfYWN0aXZlKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51
ZTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbGtfc3RhdGVfY2hhbmdlZCA9
IG9uIF4gY2xraS0+ZW5hYmxlZDsKPj4+IEBAIC04MDU0LDExICs4MDUyLDYgQEAgc3RhdGljIGlu
dCBfX3Vmc2hjZF9zZXR1cF9jbG9ja3Moc3RydWN0IAo+Pj4gdWZzX2hiYSAqaGJhLCBib29sIG9u
LAo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gwqAgfQo+Pj4gwqAgLXN0YXRpYyBpbnQg
dWZzaGNkX3NldHVwX2Nsb2NrcyhzdHJ1Y3QgdWZzX2hiYSAqaGJhLCBib29sIG9uKQo+Pj4gLXsK
Pj4+IC3CoMKgwqAgcmV0dXJuwqAgX191ZnNoY2Rfc2V0dXBfY2xvY2tzKGhiYSwgb24sIGZhbHNl
KTsKPj4+IC19Cj4+PiAtCj4+PiDCoCBzdGF0aWMgaW50IHVmc2hjZF9pbml0X2Nsb2NrcyhzdHJ1
Y3QgdWZzX2hiYSAqaGJhKQo+Pj4gwqAgewo+Pj4gwqDCoMKgwqDCoCBpbnQgcmV0ID0gMDsKPj4+
IEBAIC04NTc3LDExICs4NTcwLDcgQEAgc3RhdGljIGludCB1ZnNoY2Rfc3VzcGVuZChzdHJ1Y3Qg
dWZzX2hiYSAqaGJhLCAKPj4+IGVudW0gdWZzX3BtX29wIHBtX29wKQo+Pj4gwqDCoMKgwqDCoMKg
ICovCj4+PiDCoMKgwqDCoMKgIHVmc2hjZF9kaXNhYmxlX2lycShoYmEpOwo+Pj4gwqAgLcKgwqDC
oCBpZiAoIXVmc2hjZF9pc19saW5rX2FjdGl2ZShoYmEpKQo+Pj4gLcKgwqDCoMKgwqDCoMKgIHVm
c2hjZF9zZXR1cF9jbG9ja3MoaGJhLCBmYWxzZSk7Cj4+PiAtwqDCoMKgIGVsc2UKPj4+IC3CoMKg
wqDCoMKgwqDCoCAvKiBJZiBsaW5rIGlzIGFjdGl2ZSwgZGV2aWNlIHJlZl9jbGsgY2FuJ3QgYmUg
c3dpdGNoZWQgb2ZmICovCj4+PiAtwqDCoMKgwqDCoMKgwqAgX191ZnNoY2Rfc2V0dXBfY2xvY2tz
KGhiYSwgZmFsc2UsIHRydWUpOwo+Pj4gK8KgwqDCoCB1ZnNoY2Rfc2V0dXBfY2xvY2tzKGhiYSwg
ZmFsc2UpOwo+Pj4gwqDCoMKgwqDCoMKgwqAgaWYgKHVmc2hjZF9pc19jbGtnYXRpbmdfYWxsb3dl
ZChoYmEpKSB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaGJhLT5jbGtfZ2F0aW5nLnN0YXRlID0g
Q0xLU19PRkY7Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zY3NpL3Vmcy91ZnNoY2QuaCBiL2Ry
aXZlcnMvc2NzaS91ZnMvdWZzaGNkLmgKPj4+IGluZGV4IDY2ZTUzMzguLjZmMGYyZDQgMTAwNjQ0
Cj4+PiAtLS0gYS9kcml2ZXJzL3Njc2kvdWZzL3Vmc2hjZC5oCj4+PiArKysgYi9kcml2ZXJzL3Nj
c2kvdWZzL3Vmc2hjZC5oCj4+PiBAQCAtMjI5LDYgKzIyOSw4IEBAIHN0cnVjdCB1ZnNfZGV2X2Nt
ZCB7Cj4+PiDCoMKgICogQG1heF9mcmVxOiBtYXhpbXVtIGZyZXF1ZW5jeSBzdXBwb3J0ZWQgYnkg
dGhlIGNsb2NrCj4+PiDCoMKgICogQG1pbl9mcmVxOiBtaW4gZnJlcXVlbmN5IHRoYXQgY2FuIGJl
IHVzZWQgZm9yIGNsb2NrIHNjYWxpbmcKPj4+IMKgwqAgKiBAY3Vycl9mcmVxOiBpbmRpY2F0ZXMg
dGhlIGN1cnJlbnQgZnJlcXVlbmN5IHRoYXQgaXQgaXMgc2V0IHRvCj4+PiArICogQGtlZXBfbGlu
a19hY3RpdmU6IGluZGljYXRlcyB0aGF0IHRoZSBjbGsgc2hvdWxkIG5vdCBiZSBkaXNhYmxlZCBp
Zgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxpbmsgaXMgYWN0aXZlCj4+PiDCoMKg
ICogQGVuYWJsZWQ6IHZhcmlhYmxlIHRvIGNoZWNrIGFnYWluc3QgbXVsdGlwbGUgZW5hYmxlL2Rp
c2FibGUKPj4+IMKgwqAgKi8KPj4+IMKgIHN0cnVjdCB1ZnNfY2xrX2luZm8gewo+Pj4gQEAgLTIz
OCw2ICsyNDAsNyBAQCBzdHJ1Y3QgdWZzX2Nsa19pbmZvIHsKPj4+IMKgwqDCoMKgwqAgdTMyIG1h
eF9mcmVxOwo+Pj4gwqDCoMKgwqDCoCB1MzIgbWluX2ZyZXE7Cj4+PiDCoMKgwqDCoMKgIHUzMiBj
dXJyX2ZyZXE7Cj4+PiArwqDCoMKgIGJvb2wga2VlcF9saW5rX2FjdGl2ZTsKPj4KPj4gTml0cGlj
ayAtIEhvdyBhYm91dCAnYWx3YXlzLW9uJyBpbnN0ZWFkIG9mICdrZWVwX2xpbmtfYWN0aXZlJz8K
PiAKPiBIaSBBc3V0b3NoLAo+IAo+IEJ1dCBpdCBpcyBub3QgYWx3YXlzLW9uLCBkdXJpbmcgc3Vz
cGVuZCwgaXQgaXMgb24gd2hlbiBycG0vc3BtLWx2bCBpcyAxCj4gYW5kIDIsIG9mZiB3aGVuIHJw
bS9zcG0tbHZsIGlzIDMsIDQgYW5kIDUsIGRlcGVuZGluZyBvbiB0aGUgbGluayBzdGF0ZS4KPiAK
ClVuZGVyc3Rvb2QgJiBhZ3JlZS4KCgo+IFRoYW5rcywKPiAKPiBDYW4gR3VvLgo+IAo+Pj4gwqDC
oMKgwqDCoCBib29sIGVuYWJsZWQ7Cj4+PiDCoCB9Owo+Pj4KCgotLSAKVGhlIFF1YWxjb21tIElu
bm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIHRoZSBDb2RlIEF1cm9yYSBGb3J1
bSwKTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
