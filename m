Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BD5C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 07:45:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 242BC6101E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 07:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 242BC6101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GRhwm9S7cB/HtSarSfkhLqUqj8VC148ToBPMUa3pP9M=; b=meCX7Jp2NsRS5dQ7+s8rZHw+Y
	4AfKh3z2bfy8GBEF6h568/xFBkUsfocSwWaY+JV1a/W1c2/fjd2atApPlBx18rbSLXKwvC4/ExXeP
	WXKfWFZ2FePK5rHA0tTvSku75ac5aaD1fPPjMHYXG8aaJTAARwtsZQcgwvcxziwrn9HIbkdHSDn/a
	3NZhmUwBSU/59jklVw1H+TxfNT0t2miv7cPt61VZRHxZLjpilZtghNaglXEcFvxuab0tPC/VyfUl/
	7QxlF3tY8hqRDvM1KP07W2pZWMOYTmNH9pY4Az5/ZTAFYEBX/gjhHN5SlN3iGh4i7Wkhh17332TQ3
	hAX9zDquw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRs10-008p78-9X; Thu, 01 Apr 2021 07:45:18 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRs0v-008p6I-Jx; Thu, 01 Apr 2021 07:45:17 +0000
IronPort-SDR: 3959d7yvTgO5jRHyQJrOO+WbHVsw/b1hRQGcXluiQEqmtwUAzRJwMx4JBn7agqvIxUS3IaNPp3
 6dUQt3mHICEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="192200408"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="192200408"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 00:45:07 -0700
IronPort-SDR: lsbWgO8aRTgEJJiGUMpmyaRbtmcauxhMmNapB9ei3jfvohdyrNPtGYFBZQe67fxtzdYtxYWhU7
 9g+tDZ9olIrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="377598402"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174])
 ([10.237.72.174])
 by orsmga003.jf.intel.com with ESMTP; 01 Apr 2021 00:45:00 -0700
Subject: Re: [PATCH v14 1/2] scsi: ufs: Enable power management for wlun
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>, cang@codeaurora.org,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, Pedro Sousa <pedrom.sousa@synopsys.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Stanley Chu
 <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bean Huo <beanhuo@micron.com>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Yue Hu <huyue2@yulong.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Bart van Assche <bvanassche@acm.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>, open list
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>
References: <cover.1617143113.git.asutoshd@codeaurora.org>
 <16f1bcf76ff411c70fe0e3e13f84e4b0fa7d9063.1617143113.git.asutoshd@codeaurora.org>
 <a385141d-324b-680e-a19c-ab6121bd6c5d@intel.com>
 <dbac8ce8-83c6-49a5-9f4d-f5ea19d7a883@codeaurora.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <612d0f35-89a2-947b-9fa4-608624c4c032@intel.com>
Date: Thu, 1 Apr 2021 10:45:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <dbac8ce8-83c6-49a5-9f4d-f5ea19d7a883@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_084515_152243_BD6CBE36 
X-CRM114-Status: GOOD (  21.65  )
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

T24gMS8wNC8yMSA0OjQwIGFtLCBBc3V0b3NoIERhcyAoYXNkKSB3cm90ZToKPiBPbiAzLzMxLzIw
MjEgMTE6MTkgQU0sIEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4+IE9uIDMxLzAzLzIxIDE6MzEgYW0s
IEFzdXRvc2ggRGFzIHdyb3RlOgo+Pj4gRHVyaW5nIHJ1bnRpbWUtc3VzcGVuZCBvZiB1ZnMgaG9z
dCwgdGhlIHNjc2kgZGV2aWNlcyBhcmUKPj4+IGFscmVhZHkgc3VzcGVuZGVkIGFuZCBzbyBhcmUg
dGhlIHF1ZXVlcyBhc3NvY2lhdGVkIHdpdGggdGhlbS4KPj4+IEJ1dCB0aGUgdWZzIGhvc3Qgc2Vu
ZHMgU1NVIChTVEFSVF9TVE9QX1VOSVQpIHRvIHdsdW4KPj4+IGR1cmluZyBpdHMgcnVudGltZS1z
dXNwZW5kLgo+Pj4gRHVyaW5nIHRoZSBwcm9jZXNzIGJsa19xdWV1ZV9lbnRlciBjaGVja3MgaWYg
dGhlIHF1ZXVlIGlzIG5vdCBpbgo+Pj4gc3VzcGVuZGVkIHN0YXRlLiBJZiBzbywgaXQgd2FpdHMg
Zm9yIHRoZSBxdWV1ZSB0byByZXN1bWUsIGFuZCBuZXZlcgo+Pj4gY29tZXMgb3V0IG9mIGl0Lgo+
Pj4gVGhlIGNvbW1pdAo+Pj4gKGQ1NWQxNWEzMzogc2NzaTogYmxvY2s6IERvIG5vdCBhY2NlcHQg
YW55IHJlcXVlc3RzIHdoaWxlIHN1c3BlbmRlZCkKPj4+IGFkZHMgdGhlIGNoZWNrIGlmIHRoZSBx
dWV1ZSBpcyBpbiBzdXNwZW5kZWQgc3RhdGUgaW4gYmxrX3F1ZXVlX2VudGVyKCkuCj4+Pgo+Pj4g
Q2FsbCB0cmFjZToKPj4+IMKgIF9fc3dpdGNoX3RvKzB4MTc0LzB4MmM0Cj4+PiDCoCBfX3NjaGVk
dWxlKzB4NDc4LzB4NzY0Cj4+PiDCoCBzY2hlZHVsZSsweDljLzB4ZTAKPj4+IMKgIGJsa19xdWV1
ZV9lbnRlcisweDE1OC8weDIyOAo+Pj4gwqAgYmxrX21xX2FsbG9jX3JlcXVlc3QrMHg0MC8weGE0
Cj4+PiDCoCBibGtfZ2V0X3JlcXVlc3QrMHgyYy8weDcwCj4+PiDCoCBfX3Njc2lfZXhlY3V0ZSsw
eDYwLzB4MWM0Cj4+PiDCoCB1ZnNoY2Rfc2V0X2Rldl9wd3JfbW9kZSsweDEyNC8weDFlNAo+Pj4g
wqAgdWZzaGNkX3N1c3BlbmQrMHgyMDgvMHg4M2MKPj4+IMKgIHVmc2hjZF9ydW50aW1lX3N1c3Bl
bmQrMHg0MC8weDE1NAo+Pj4gwqAgdWZzaGNkX3BsdGZybV9ydW50aW1lX3N1c3BlbmQrMHgxNC8w
eDIwCj4+PiDCoCBwbV9nZW5lcmljX3J1bnRpbWVfc3VzcGVuZCsweDI4LzB4M2MKPj4+IMKgIF9f
cnBtX2NhbGxiYWNrKzB4ODAvMHgyYTQKPj4+IMKgIHJwbV9zdXNwZW5kKzB4MzA4LzB4NjE0Cj4+
PiDCoCBycG1faWRsZSsweDE1OC8weDIyOAo+Pj4gwqAgcG1fcnVudGltZV93b3JrKzB4ODQvMHhh
Ywo+Pj4gwqAgcHJvY2Vzc19vbmVfd29yaysweDFmMC8weDQ3MAo+Pj4gwqAgd29ya2VyX3RocmVh
ZCsweDI2Yy8weDRjOAo+Pj4gwqAga3RocmVhZCsweDEzYy8weDMyMAo+Pj4gwqAgcmV0X2Zyb21f
Zm9yaysweDEwLzB4MTgKPj4+Cj4+PiBGaXggdGhpcyBieSByZWdpc3RlcmluZyB1ZnMgZGV2aWNl
IHdsdW4gYXMgYSBzY3NpIGRyaXZlciBhbmQKPj4+IHJlZ2lzdGVyaW5nIGl0IGZvciBibG9jayBy
dW50aW1lLXBtLiBBbHNvIG1ha2UgdGhpcyBhcyBhCj4+PiBzdXBwbGllciBmb3IgYWxsIG90aGVy
IGx1bnMuIFRoYXQgd2F5LCB0aGlzIGRldmljZSB3bHVuCj4+PiBzdXNwZW5kcyBhZnRlciBhbGwg
dGhlIGNvbnN1bWVycyBhbmQgcmVzdW1lcyBhZnRlcgo+Pj4gaGJhIHJlc3VtZXMuCj4+Pgo+Pj4g
Q28tZGV2ZWxvcGVkLWJ5OiBDYW4gR3VvIDxjYW5nQGNvZGVhdXJvcmEub3JnPgo+Pj4gU2lnbmVk
LW9mZi1ieTogQ2FuIEd1byA8Y2FuZ0Bjb2RlYXVyb3JhLm9yZz4KPj4+IFNpZ25lZC1vZmYtYnk6
IEFzdXRvc2ggRGFzIDxhc3V0b3NoZEBjb2RlYXVyb3JhLm9yZz4KPj4+IC0tLQo+Pgo+IEhpIEFk
cmlhbgo+IFRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzLgo+PiBMb29rcyBnb29kIGJ1dCBzdGlsbCBk
b2Vzbid0IHNlZW0gdG8gYmFzZWQgb24gdGhlIGxhdGVzdCB0cmVlLgo+Pgo+IFVtbSwgaXQncyBi
YXNlZCBvbiB0aGUgYmVsb3c6Cj4gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L21rcC9zY3NpLmdpdAo+IEJyYW5jaDogcmVmcy9oZWFkcy9mb3ItbmV4dAo+IAo+
IFRoZSB0b3AgbW9zdCBjaGFuZ2UgaXMgZTI3ZjNjOCBvbiAyN3RoIE1hcmNoJzIxLgo+IFdoaWNo
IHRyZWUgYXJlIHlvdSByZWZlcnJpbmcgdG8gdGhhdCdkIGJlIGxhdGVzdD8KCkR1bm5vLCBidXQg
dGhhdCBzZWVtcyB0byBiZSBtaXNzaW5nOgoKICBjb21taXQgYWE1M2Y1ODBlNjdiNDllYzVmNGQ5
YmQxZGU4MWViOWViMGRjMDc5ZgogIEF1dGhvcjogQ2FuIEd1byA8Y2FuZ0Bjb2RlYXVyb3JhLm9y
Zz4KICBEYXRlOiAgIFR1ZSBGZWIgMjMgMjE6MzY6NDcgMjAyMSAtMDgwMAoKICAgIHNjc2k6IHVm
czogTWlub3IgYWRqdXN0bWVudHMgdG8gZXJyb3IgaGFuZGxpbmcKCndoaWNoIGlzIGluIHY1LjEy
LXJjMwoKPiAKPj4gQWxzbyBjYW1lIGFjcm9zcyB0aGUgaXNzdWUgYmVsb3c6Cj4+Cj4+IDxTTklQ
Pgo+Pgo+Pj4gKyNpZmRlZiBDT05GSUdfUE1fU0xFRVAKPj4+ICtzdGF0aWMgaW50IHVmc2hjZF93
bF9wb3dlcm9mZihzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+PiArewo+Pj4gK8KgwqDCoCB1ZnNoY2Rf
d2xfc2h1dGRvd24oZGV2KTsKPj4KPj4gVGhpcyB0dXJuZWQgb3V0IHRvIGJlIHdyb25nLsKgIFRo
aXMgaXMgYSBQTSBvcCBhbmQgU0NTSSBoYXMgYWxyZWFkeQo+PiBxdWllc2NlZCB0aGUgc2Rldidz
LsKgIEFsbCB0aGF0IGlzIG5lZWRlZCBpc09rLiBJJ2xsIGZpeCBpdCBpbiB0aGUgbmV4dCB2ZXJz
aW9uLgo+IAo+Pgo+PiDCoMKgwqDCoF9fdWZzaGNkX3dsX3N1c3BlbmQoaGJhLCBVRlNfU0hVVERP
V05fUE0pOwo+Pgo+Pj4gK8KgwqDCoCByZXR1cm4gMDsKPj4+ICt9Cj4+PiArI2VuZGlmCj4gCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
