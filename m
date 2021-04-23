Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92817C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 04:24:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09EB86120D
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 04:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09EB86120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vXf1aZSZNLLG6gS//v4dhqEhJub6Eyk7puRCGJZABgs=; b=CfjpMzsD9pMXx/FKHQKSV/zL1
	8rWzAcN28zE/5ZAHd1wcPovTQPr0fpL6Ct5sZHRtk/Qmp4iXeCYJMCEIKkwxdx3ewqHgIM3vxjzol
	UMXXK3ojUFHzS9Xy1gNdKbNbYIXvgGKmzFjtGMn0d3EZibhPO8bwQpoOkCxAZmErtIHKxst7Wkjwn
	UGcC/y4Y5JsBy31cTuXfCWwoWUzzSdmakmIo32N4QVt5TfnIUIMcLhNzMYb9gPkT7d/Pog3lCRent
	hRe6TT3bzVCRF9gjKWJ9yjDMclUs+t94MBHjjDwhbIdPuDCyFf/pGZLa+kCCes9TVayJNW6yUlEgW
	Ro0vMjvXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZnMV-000aMO-MU; Fri, 23 Apr 2021 04:24:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZnMF-000aK6-GW; Fri, 23 Apr 2021 04:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=CUiblx+sNmD/UMw/X1PCkq6k0BvtYXLpp2+YlvE0/g4=; b=KRvUSVb9qzi4gU8z33FxeGza5W
 jvIqxOrGoPZCs/Qb3ZCwHTXob1H6lSgGvaloIotukOh8+TKr9vGA4ZVurtoNSUYTH1JhVQCNZ8HRB
 6rQffcyIgg+YQWQgGw15YT5/Tx+KPjhpOWbGX/NZPOfFCDb9SkiNHbzfXy3wxFYJoxgrCmsFAWWI0
 EdAk4GhrDgxmlm6a9poQ7NysZr8ybYMH5+3FG4F3psOAxw4lhyvb9GbYrL7qyXKl+KI6qG+1P/KO+
 Nsn6N88/Xq1a9haM/Oq0XCtlZEgvg5i5L40bCehL93bEJiOF405m782U94eIH0M6kLN8xVVwNqasD
 sZyTMYSA==;
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZnMC-00E8j8-5F; Fri, 23 Apr 2021 04:23:57 +0000
IronPort-SDR: oEk+JV7i8ejFHLNLNs1ms0mdBAVFX9WT7PBQBDowMnYknE5XMxCidvlEUlYKAGf+p3TMVcbtvL
 K+Ye2RSir0bw==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="183144067"
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; d="scan'208";a="183144067"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 21:23:42 -0700
IronPort-SDR: JWllVoPk43r/S37hMosekdbLOWwH5eSI71rVdydNgg/A79tHqHwkYEHL+druSP8sqMtQPH6Uuo
 d36xkU6Pg8kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,244,1613462400"; d="scan'208";a="421627321"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174])
 ([10.237.72.174])
 by fmsmga008.fm.intel.com with ESMTP; 22 Apr 2021 21:23:35 -0700
Subject: Re: [PATCH v20 1/2] scsi: ufs: Enable power management for wlun
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>, cang@codeaurora.org,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bean Huo <beanhuo@micron.com>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Colin Ian King <colin.king@canonical.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Yue Hu <huyue2@yulong.com>,
 Bart van Assche <bvanassche@acm.org>,
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
References: <cover.1618600985.git.asutoshd@codeaurora.org>
 <d660b8d4e1fb192810abd09a8ff0ef4d9f6b96cd.1618600985.git.asutoshd@codeaurora.org>
 <fdadd467-b613-d800-18c5-be064396fd10@intel.com>
 <07e3ea07-e1c3-7b8c-e398-8b008f873e6d@codeaurora.org>
 <90809796-1c32-3709-13d3-65e4d5c387cc@intel.com>
 <1bc4a73e-b22a-6bad-2583-3a0ffa979414@intel.com>
 <651f5d8a-5ab7-77dd-3fed-05feb3fd3e1a@codeaurora.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <efe71230-5b6a-22a8-1aef-f1cae046df22@intel.com>
Date: Fri, 23 Apr 2021 07:23:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <651f5d8a-5ab7-77dd-3fed-05feb3fd3e1a@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_212356_266871_366528D8 
X-CRM114-Status: GOOD (  23.88  )
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

T24gMjIvMDQvMjEgNzozOCBwbSwgQXN1dG9zaCBEYXMgKGFzZCkgd3JvdGU6Cj4gT24gNC8yMC8y
MDIxIDEyOjQyIEFNLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+PiBPbiAyMC8wNC8yMSA3OjE1IGFt
LCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+Pj4gT24gMjAvMDQvMjEgMTI6NTMgYW0sIEFzdXRvc2gg
RGFzIChhc2QpIHdyb3RlOgo+Pj4+IE9uIDQvMTkvMjAyMSAxMTozNyBBTSwgQWRyaWFuIEh1bnRl
ciB3cm90ZToKPj4+Pj4gT24gMTYvMDQvMjEgMTA6NDkgcG0sIEFzdXRvc2ggRGFzIHdyb3RlOgo+
Pj4+Pj4KPj4+Pj4+IENvLWRldmVsb3BlZC1ieTogQ2FuIEd1byA8Y2FuZ0Bjb2RlYXVyb3JhLm9y
Zz4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENhbiBHdW8gPGNhbmdAY29kZWF1cm9yYS5vcmc+Cj4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBc3V0b3NoIERhcyA8YXN1dG9zaGRAY29kZWF1cm9yYS5vcmc+
Cj4+Pj4+PiAtLS0KPj4+Pj4KPj4+Pj4gSSBjYW1lIGFjcm9zcyAzIGlzc3VlcyB3aGlsZSB0ZXN0
aW5nLsKgIFNlZSBjb21tZW50cyBiZWxvdy4KPj4+Pj4KPj4+PiBIaSBBZHJpYW4KPj4+PiBUaGFu
a3MgZm9yIHRoZSBjb21tZW50cy4KPj4+Pj4gPFNOSVA+Cj4+Pj4+Cj4+Pj4+PiBAQCAtNTc5NCw3
ICs1ODM5LDcgQEAgc3RhdGljIHZvaWQgdWZzaGNkX2Vycl9oYW5kbGluZ191bnByZXBhcmUoc3Ry
dWN0IHVmc19oYmEgKmhiYSkKPj4+Pj4+IMKgwqDCoMKgwqDCoCBpZiAodWZzaGNkX2lzX2Nsa3Nj
YWxpbmdfc3VwcG9ydGVkKGhiYSkpCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1ZnNoY2Rf
Y2xrX3NjYWxpbmdfc3VzcGVuZChoYmEsIGZhbHNlKTsKPj4+Pj4+IMKgwqDCoMKgwqDCoCB1ZnNo
Y2RfY2xlYXJfdWFfd2x1bnMoaGJhKTsKPj4+Pj4KPj4+Pj4gdWZzaGNkX2NsZWFyX3VhX3dsdW5z
KCkgZGVhZGxvY2tzIHRyeWluZyB0byBjbGVhciBVRlNfVVBJVV9SUE1CX1dMVU4KPj4+Pj4gaWYg
c2Rldl9ycG1iIGlzIHN1c3BlbmRlZCBhbmQgc2Rldl91ZnNfZGV2aWNlIGlzIHN1c3BlbmRpbmcu
Cj4+Pj4+IGUuZy4gdWZzaGNkX3dsX3N1c3BlbmQoKSBpcyB3YWl0aW5nIG9uIGhvc3Rfc2VtIHdo
aWxlIHVmc2hjZF9lcnJfaGFuZGxlcigpCj4+Pj4+IGlzIHJ1bm5pbmcsIGF0IHdoaWNoIHBvaW50
IHNkZXZfcnBtYiBoYXMgYWxyZWFkeSBzdXNwZW5kZWQuCj4+Pj4+Cj4+Pj4gVW1tLCBJIGRpZG4n
dCB1bmRlcnN0YW5kIHRoaXMgZGVhZGxvY2suCj4+Pj4gV2hlbiB5b3Ugc2F5LCBzZGV2X3JwbWIg
aXMgc3VzcGVuZGVkLCBkb2VzIGl0IG1lYW4gcnVudGltZV9zdXNwZW5kZWQ/Cj4+Pj4gc2Rldl91
ZnNfZGV2aWNlIGlzIHN1c3BlbmRpbmcgLSB0aGlzIGNhbid0IGJlIHJ1bnRpbWVfc3VzcGVuZGlu
Zywgd2hpbGUgdWZzaGNkX2Vycl9oYW5kbGluZ191bnByZXBhcmUgaXMgcnVubmluZy4KPj4+Pgo+
Pj4+IElmIHlvdSd2ZSBhIGNhbGwtc3RhY2sgb2YgdGhpcyBkZWFkbG9jaywgcGxlYXNlIGNhbiB5
b3Ugc2hhcmUgaXQgd2l0aCBtZS4gSSdsbCBhbHNvIHRyeSB0byByZXByb2R1Y2UgdGhpcy4KPj4+
Cj4+PiBZZXMgaXQgaXMgc3lzdGVtIHN1c3BlbmQuIHNkZXZfcnBtYiBoYXMgc3VzcGVuZGVkLCBz
ZGV2X3Vmc19kZXZpY2UgaXMgd2FpdGluZyBvbiBob3N0X3NlbS4KPj4+IHVmc2hjZF9lcnJfaGFu
ZGxlcigpIGhvbGRzIGhvc3Rfc2VtLiB1ZnNoY2RfY2xlYXJfdWFfd2x1bihVRlNfVVBJVV9SUE1C
X1dMVU4pIGdldHMgc3R1Y2suCj4+PiBJIHdpbGwgZ2V0IHNvbWUgY2FsbC1zdGFja3MuCj4+Cj4g
SGkgQWRyaWFuLAo+IAo+IFRoYW5rcyBmb3IgdGhlIGNhbGwgc3RhY2tzLgo+IEZyb20gdGhlIGN1
cnJlbnQgaW5mb3JtYXRpb24sIEkgY2FuJ3Qgc2F5IGZvciBzdXJlIHdoeSBpdCdkIGdldCBzdHVj
ayBpbiBibGtfcXVldWVfZW50ZXIoKS4KCkkgcHJlc3VtZSBTQ1NJIGlzIGxlYXZpbmcgdGhlIFJQ
TUIgV0xVTiBkZXZpY2UgcnVudGltZSBzdXNwZW5kZWQgYW5kIGNvbnNlcXVlbnRseSB0aGUgcXVl
dWUgc3RhdHVzIGlzIFJQTV9TVVNQRU5ERUQKCj4gCj4gSSB0cmllZCByZXByb2R1Y2luZyB0aGlz
IGlzc3VlIG9uIG15IHNldHVwIHllc3RlcmRheSBidXQgY291bGRuJ3QuCj4gSGVyZSdzIHdoYXQg
SSBkaWQ6Cj4gMS4gc2Rldl9ycG1iIGlzIFJQTV9TVVNQRU5ERUQsIGNoZWNrZWQgYmVmb3JlIGlu
aXRpYXRpbmcgc3lzdGVtIHN1c3BlbmQKPiAyLiBzZGV2X3Vmc19kZXZpY2UgaXMgUlBNX1JFU1VN
RUQKPiAzLiBJIHRyaWdnZXJlZCBzeXN0ZW0gc3VzcGVuZCAoZWNobyBtZW0gPiAvc3lzL3Bvd2Vy
L3N0YXRlKSBhbmQgc2NoZWR1bGVkIHRoZSBlcnJvciBoYW5kbGVyIGZyb20gdWZzaGNkX3dsX3N1
c3BlbmQoKS4KPiA0LiBXYWl0ZWQgdW50aWwgZXJyb3IgaGFuZGxlciByYW4gYW5kIHRoZW4gdWZz
aGNkX3dsX3N1c3BlbmQoKSBibG9ja3Mgb24gaG9zdF9zZW0uCj4gNS4gVGhlIHVmc2hjZF9jbGVh
cl93YV93bHVuKFVGU19VUElVX1JQTUJfV0xVTikgd2VudCB0aHJvdWdoIGZpbmUuCj4gCj4gRG8g
eW91J3ZlIHNvbWUgc3BlY2lmaWMgc3RlcHMgdG8gcmVwcm9kdWNlIHRoaXMgb3IgYSBzY3JpcHQs
IHBlcmhhcHM/IElmIHNvLCBwbGVhc2UgY2FuIHlvdSBzaGFyZSBpdCB3aXRoIG1lLiBJIHdpbGwg
dHJ5IGFnYWluLgoKSSB3YXMgdXNpbmcgYSBkZXZpY2UgdGhhdCBnaXZlcyBvY2Nhc2lvbmFsIGVy
cm9ycywgYnV0IEkgd2lsbCB3aGF0IHNlZSBJIGNhbiBkby4KCj4gTXkgdGVzdCBlbnZpcm9ubWVu
dCBpcyBpbiA1LjEwIGtlcm5lbCB3aXRoIEFuZHJvaWQsIEkgc3VwcG9zZSB0aGF0IHNob3VsZCBi
ZSBvayB0aG91Z2guCj4gCj4gVGhhbmtzCj4gLWFzZAo+IAo+PiBIZXJlIGFyZSB0aGUgY2FsbCBz
dGFja3MKPj4KPj4gW8KgwqAgMzQuMDk0MzIxXSBXb3JrcXVldWU6IHVmc19laF93cV8wIHVmc2hj
ZF9lcnJfaGFuZGxlcgo+PiBbwqDCoCAzNC4wOTQ3ODhdIENhbGwgVHJhY2U6Cj4+IFvCoMKgIDM0
LjA5NTI4MV3CoCBfX3NjaGVkdWxlKzB4Mjc1LzB4NmMwCj4+IFvCoMKgIDM0LjA5NTc0M13CoCBz
Y2hlZHVsZSsweDQxLzB4YTAKPj4gW8KgwqAgMzQuMDk2MjQwXcKgIGJsa19xdWV1ZV9lbnRlcisw
eDEwZC8weDIzMAo+PiBbwqDCoCAzNC4wOTY2OTNdwqAgPyB3YWl0X3dva2VuKzB4NzAvMHg3MAo+
PiBbwqDCoCAzNC4wOTcxNjddwqAgYmxrX21xX2FsbG9jX3JlcXVlc3QrMHg1My8weGMwCj4+IFvC
oMKgIDM0LjA5NzYxMF3CoCBibGtfZ2V0X3JlcXVlc3QrMHgxZS8weDYwCj4+IFvCoMKgIDM0LjA5
ODA1M13CoCBfX3Njc2lfZXhlY3V0ZSsweDNjLzB4MjYwCj4+IFvCoMKgIDM0LjA5ODUyOV3CoCB1
ZnNoY2RfY2xlYXJfdWFfd2x1bi5jb2xkKzB4YTYvMHgxNGIKPj4gW8KgwqAgMzQuMDk4OTc3XcKg
IHVmc2hjZF9jbGVhcl91YV93bHVucy5wYXJ0LjArMHg0ZC8weDkyCj4+IFvCoMKgIDM0LjA5OTQ1
Nl3CoCB1ZnNoY2RfZXJyX2hhbmRsZXIrMHg5N2EvMHg5ZmYKPj4gW8KgwqAgMzQuMDk5OTAyXcKg
IHByb2Nlc3Nfb25lX3dvcmsrMHgxY2MvMHgzNjAKPj4gW8KgwqAgMzQuMTAwMzg0XcKgIHdvcmtl
cl90aHJlYWQrMHg0NS8weDNiMAo+PiBbwqDCoCAzNC4xMDA4NTFdwqAgPyBwcm9jZXNzX29uZV93
b3JrKzB4MzYwLzB4MzYwCj4+IFvCoMKgIDM0LjEwMTMwOF3CoCBrdGhyZWFkKzB4ZjYvMHgxMzAK
Pj4gW8KgwqAgMzQuMTAxNzI4XcKgID8ga3RocmVhZF9wYXJrKzB4ODAvMHg4MAo+PiBbwqDCoCAz
NC4xMDIxODZdwqAgcmV0X2Zyb21fZm9yaysweDFmLzB4MzAKPj4KPj4gW8KgwqAgMzQuNjQwNzUx
XSB0YXNrOmt3b3JrZXIvdTEwOjnCoMKgIHN0YXRlOkQgc3RhY2s6MTQ1MjggcGlkOsKgIDI1NSBw
cGlkOsKgwqDCoMKgIDIgZmxhZ3M6MHgwMDAwNDAwMAo+PiBbwqDCoCAzNC42NDEyNTNdIFdvcmtx
dWV1ZTogZXZlbnRzX3VuYm91bmQgYXN5bmNfcnVuX2VudHJ5X2ZuCj4+IFvCoMKgIDM0LjY0MTcy
Ml0gQ2FsbCBUcmFjZToKPj4gW8KgwqAgMzQuNjQyMjE3XcKgIF9fc2NoZWR1bGUrMHgyNzUvMHg2
YzAKPj4gW8KgwqAgMzQuNjQyNjgzXcKgIHNjaGVkdWxlKzB4NDEvMHhhMAo+PiBbwqDCoCAzNC42
NDMxNzldwqAgc2NoZWR1bGVfdGltZW91dCsweDE4Yi8weDI5MAo+PiBbwqDCoCAzNC42NDM2NDVd
wqAgPyBkZWxfdGltZXJfc3luYysweDMwLzB4MzAKPj4gW8KgwqAgMzQuNjQ0MTMxXcKgIF9fZG93
bl90aW1lb3V0KzB4NmIvMHhjMAo+PiBbwqDCoCAzNC42NDQ1NjhdwqAgPyB1ZnNoY2RfY2xrc2Nh
bGVfZW5hYmxlX3Nob3crMHgyMC8weDIwCj4+IFvCoMKgIDM0LjY0NTAxNF3CoCA/IGFzeW5jX3Nj
aGVkdWxlX25vZGVfZG9tYWluKzB4MTdkLzB4MTkwCj4+IFvCoMKgIDM0LjY0NTQ5Nl3CoCBkb3du
X3RpbWVvdXQrMHg0Mi8weDUwCj4+IFvCoMKgIDM0LjY0NTk0N13CoCB1ZnNoY2Rfd2xfc3VzcGVu
ZCsweDc5LzB4YTAKPj4gW8KgwqAgMzQuNjQ2NDMyXcKgID8gc2NtZF9wcmludGsrMHgxMDAvMHgx
MDAKPj4gW8KgwqAgMzQuNjQ2OTE3XcKgIHNjc2lfYnVzX3N1c3BlbmRfY29tbW9uKzB4NTYvMHhj
MAo+PiBbwqDCoCAzNC42NDc0MDVdwqAgPyBzY3NpX2J1c19mcmVlemUrMHgxMC8weDEwCj4+IFvC
oMKgIDM0LjY0Nzg1OF3CoCBkcG1fcnVuX2NhbGxiYWNrKzB4NDUvMHgxMTAKPj4gW8KgwqAgMzQu
NjQ4MzQ3XcKgIF9fZGV2aWNlX3N1c3BlbmQrMHgxMTcvMHg0NjAKPj4gW8KgwqAgMzQuNjQ4Nzg4
XcKgIGFzeW5jX3N1c3BlbmQrMHgxNi8weDkwCj4+IFvCoMKgIDM0LjY0OTI1MV3CoCBhc3luY19y
dW5fZW50cnlfZm4rMHgyNi8weDExMAo+PiBbwqDCoCAzNC42NDk2NzZdwqAgcHJvY2Vzc19vbmVf
d29yaysweDFjYy8weDM2MAo+PiBbwqDCoCAzNC42NTAxMzddwqAgd29ya2VyX3RocmVhZCsweDQ1
LzB4M2IwCj4+IFvCoMKgIDM0LjY1MDU2M13CoCA/IHByb2Nlc3Nfb25lX3dvcmsrMHgzNjAvMHgz
NjAKPj4gW8KgwqAgMzQuNjUwOTk0XcKgIGt0aHJlYWQrMHhmNi8weDEzMAo+PiBbwqDCoCAzNC42
NTE0NTVdwqAgPyBrdGhyZWFkX3BhcmsrMHg4MC8weDgwCj4+IFvCoMKgIDM0LjY1MTg4Ml3CoCBy
ZXRfZnJvbV9mb3JrKzB4MWYvMHgzMAo+Pgo+Pgo+Pgo+Pj4KPj4+Pgo+Pj4+IEknbGwgYWRkcmVz
cyB0aGUgb3RoZXIgY29tbWVudHMgaW4gdGhlIG5leHQgdmVyc2lvbi4KPj4+Pgo+Pj4+Cj4+Pj4g
VGhhbmsgeW91IQo+Pj4+Cj4+Pj4+PiAtwqDCoMKgIHBtX3J1bnRpbWVfcHV0KGhiYS0+ZGV2KTsK
Pj4+Pj4+ICvCoMKgwqAgdWZzaGNkX3JwbV9wdXQoaGJhKTsKPj4+Pj4+IMKgwqAgfQo+Pj4+Pgo+
Pj4+PiA8U05JUD4KPj4+Pj4KPj4+Pj4+ICt2b2lkIHVmc2hjZF9yZXN1bWVfY29tcGxldGUoc3Ry
dWN0IGRldmljZSAqZGV2KQo+Pj4+Pj4gK3sKPj4+Pgo+Pj4KPj4KPiAKPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
