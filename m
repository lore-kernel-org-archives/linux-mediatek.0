Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F23C43460
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 08:02:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCDA361261
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 08:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCDA361261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PMugTfOHe8sE9f+KRSoeDoqBjWbRYTSMcvMBYIqfP78=; b=qOVyVXu2QnRQRhCNg1MxxyMqJ
	uWC9WHAee4LynJ8j8UItxh5R9KHljdyJM0p/KWetOvtlrYQVyXTWK2j6zPOU4JA9Lmri+P+VENaE8
	x1iedNcZ6pY1pSZhxuSbM29cVJDnPghOkMlvzeg1s1fgkcHHECLkrL93bapoQcvMbPskm15lxXe8Q
	YQcojMknlgvyEoTfvqCa70P/wENUmDUpR5ZqWpugB1WnkcKa6jj4dn7sFL0DcCNWpWCXeBHHbeWO7
	is4kWbDtV2pEwcNT6Ne1ulsXYovWnVf9bItudxaTRSIysbpPkU+DKmCpuFcmHN9rUk1e+gL8UV0oU
	MplNhOx8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZqlI-0010NM-3y; Fri, 23 Apr 2021 08:02:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZql2-0010MD-Bl; Fri, 23 Apr 2021 08:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=wkVZgIEOSaetdvXFPXoJA9S5UB5LfDnQs0bXbiw7yjA=; b=uAw//q/wAwhc5FO8SQAJp4bdJi
 RXTA0NsQrG5bbgKAsjADRlSYA873BjW+xDpg07TyiddE5FWZtixCfVxnet9aLap0Vr113LT96J1UA
 aNsw4KcyjzexXOodiZ7qwLp+vBu2g2h4FSv98ZsaqiikB+/6zp77Zzgjb/XJpFIi211L86tlpOZSC
 +Aix+PTjUcpk+0AVugw084uKtdZetN2Y2lbw2/yC95KgjxEs5uyeRBOJXXEJa6v3OCngwyVoSryaC
 tixaqhQC1shJQ68i+25haZfvxAt7UQiJOiRpbBG4XWDjxAuyVKaoF+j/hZgqiubDV7nUB/h7sj879
 5hgEkAUA==;
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZqky-00EEgv-0K; Fri, 23 Apr 2021 08:01:45 +0000
IronPort-SDR: /LugQ1chfNVW8eblfzKSqV2OaHEPaq+UdtucrdBEJjMxN6wSyZITnxiFpsT0Zic3s7pBaxu+T6
 zCjn5BbweOYQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="196090847"
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; d="scan'208";a="196090847"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 01:01:33 -0700
IronPort-SDR: B+jDDshXQ4HBTrC8y4VRZeYWSWjvMI++V6PQCfLyHHJLNOkGn71O7KJZopWpcMb9PkP4ID4Z+g
 KE8SreohSb4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; d="scan'208";a="453511686"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174])
 ([10.237.72.174])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2021 01:01:26 -0700
Subject: Re: [PATCH v20 1/2] scsi: ufs: Enable power management for wlun
From: Adrian Hunter <adrian.hunter@intel.com>
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
 <efe71230-5b6a-22a8-1aef-f1cae046df22@intel.com>
 <e6f3946a-dbe7-6b42-e43c-d3f8d705c732@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <973e0bbb-ac2d-7196-2e25-37aee2b77b46@intel.com>
Date: Fri, 23 Apr 2021 11:01:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e6f3946a-dbe7-6b42-e43c-d3f8d705c732@intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_010144_114782_9BCAC5DB 
X-CRM114-Status: GOOD (  26.46  )
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

T24gMjMvMDQvMjEgOToxOCBhbSwgQWRyaWFuIEh1bnRlciB3cm90ZToKPiBPbiAyMy8wNC8yMSA3
OjIzIGFtLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+PiBPbiAyMi8wNC8yMSA3OjM4IHBtLCBBc3V0
b3NoIERhcyAoYXNkKSB3cm90ZToKPj4+IE9uIDQvMjAvMjAyMSAxMjo0MiBBTSwgQWRyaWFuIEh1
bnRlciB3cm90ZToKPj4+PiBPbiAyMC8wNC8yMSA3OjE1IGFtLCBBZHJpYW4gSHVudGVyIHdyb3Rl
Ogo+Pj4+PiBPbiAyMC8wNC8yMSAxMjo1MyBhbSwgQXN1dG9zaCBEYXMgKGFzZCkgd3JvdGU6Cj4+
Pj4+PiBPbiA0LzE5LzIwMjEgMTE6MzcgQU0sIEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4+Pj4+Pj4g
T24gMTYvMDQvMjEgMTA6NDkgcG0sIEFzdXRvc2ggRGFzIHdyb3RlOgo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBDby1kZXZlbG9wZWQtYnk6IENhbiBHdW8gPGNhbmdAY29kZWF1cm9yYS5vcmc+Cj4+Pj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IENhbiBHdW8gPGNhbmdAY29kZWF1cm9yYS5vcmc+Cj4+Pj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEFzdXRvc2ggRGFzIDxhc3V0b3NoZEBjb2RlYXVyb3JhLm9yZz4KPj4+Pj4+
Pj4gLS0tCj4+Pj4+Pj4KPj4+Pj4+PiBJIGNhbWUgYWNyb3NzIDMgaXNzdWVzIHdoaWxlIHRlc3Rp
bmcuwqAgU2VlIGNvbW1lbnRzIGJlbG93Lgo+Pj4+Pj4+Cj4+Pj4+PiBIaSBBZHJpYW4KPj4+Pj4+
IFRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzLgo+Pj4+Pj4+IDxTTklQPgo+Pj4+Pj4+Cj4+Pj4+Pj4+
IEBAIC01Nzk0LDcgKzU4MzksNyBAQCBzdGF0aWMgdm9pZCB1ZnNoY2RfZXJyX2hhbmRsaW5nX3Vu
cHJlcGFyZShzdHJ1Y3QgdWZzX2hiYSAqaGJhKQo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqAgaWYgKHVm
c2hjZF9pc19jbGtzY2FsaW5nX3N1cHBvcnRlZChoYmEpKQo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1ZnNoY2RfY2xrX3NjYWxpbmdfc3VzcGVuZChoYmEsIGZhbHNlKTsKPj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgIHVmc2hjZF9jbGVhcl91YV93bHVucyhoYmEpOwo+Pj4+Pj4+Cj4+Pj4+Pj4g
dWZzaGNkX2NsZWFyX3VhX3dsdW5zKCkgZGVhZGxvY2tzIHRyeWluZyB0byBjbGVhciBVRlNfVVBJ
VV9SUE1CX1dMVU4KPj4+Pj4+PiBpZiBzZGV2X3JwbWIgaXMgc3VzcGVuZGVkIGFuZCBzZGV2X3Vm
c19kZXZpY2UgaXMgc3VzcGVuZGluZy4KPj4+Pj4+PiBlLmcuIHVmc2hjZF93bF9zdXNwZW5kKCkg
aXMgd2FpdGluZyBvbiBob3N0X3NlbSB3aGlsZSB1ZnNoY2RfZXJyX2hhbmRsZXIoKQo+Pj4+Pj4+
IGlzIHJ1bm5pbmcsIGF0IHdoaWNoIHBvaW50IHNkZXZfcnBtYiBoYXMgYWxyZWFkeSBzdXNwZW5k
ZWQuCj4+Pj4+Pj4KPj4+Pj4+IFVtbSwgSSBkaWRuJ3QgdW5kZXJzdGFuZCB0aGlzIGRlYWRsb2Nr
Lgo+Pj4+Pj4gV2hlbiB5b3Ugc2F5LCBzZGV2X3JwbWIgaXMgc3VzcGVuZGVkLCBkb2VzIGl0IG1l
YW4gcnVudGltZV9zdXNwZW5kZWQ/Cj4+Pj4+PiBzZGV2X3Vmc19kZXZpY2UgaXMgc3VzcGVuZGlu
ZyAtIHRoaXMgY2FuJ3QgYmUgcnVudGltZV9zdXNwZW5kaW5nLCB3aGlsZSB1ZnNoY2RfZXJyX2hh
bmRsaW5nX3VucHJlcGFyZSBpcyBydW5uaW5nLgo+Pj4+Pj4KPj4+Pj4+IElmIHlvdSd2ZSBhIGNh
bGwtc3RhY2sgb2YgdGhpcyBkZWFkbG9jaywgcGxlYXNlIGNhbiB5b3Ugc2hhcmUgaXQgd2l0aCBt
ZS4gSSdsbCBhbHNvIHRyeSB0byByZXByb2R1Y2UgdGhpcy4KPj4+Pj4KPj4+Pj4gWWVzIGl0IGlz
IHN5c3RlbSBzdXNwZW5kLiBzZGV2X3JwbWIgaGFzIHN1c3BlbmRlZCwgc2Rldl91ZnNfZGV2aWNl
IGlzIHdhaXRpbmcgb24gaG9zdF9zZW0uCj4+Pj4+IHVmc2hjZF9lcnJfaGFuZGxlcigpIGhvbGRz
IGhvc3Rfc2VtLiB1ZnNoY2RfY2xlYXJfdWFfd2x1bihVRlNfVVBJVV9SUE1CX1dMVU4pIGdldHMg
c3R1Y2suCj4+Pj4+IEkgd2lsbCBnZXQgc29tZSBjYWxsLXN0YWNrcy4KPj4+Pgo+Pj4gSGkgQWRy
aWFuLAo+Pj4KPj4+IFRoYW5rcyBmb3IgdGhlIGNhbGwgc3RhY2tzLgo+Pj4gRnJvbSB0aGUgY3Vy
cmVudCBpbmZvcm1hdGlvbiwgSSBjYW4ndCBzYXkgZm9yIHN1cmUgd2h5IGl0J2QgZ2V0IHN0dWNr
IGluIGJsa19xdWV1ZV9lbnRlcigpLgo+Pgo+PiBJIHByZXN1bWUgU0NTSSBpcyBsZWF2aW5nIHRo
ZSBSUE1CIFdMVU4gZGV2aWNlIHJ1bnRpbWUgc3VzcGVuZGVkIGFuZCBjb25zZXF1ZW50bHkgdGhl
IHF1ZXVlIHN0YXR1cyBpcyBSUE1fU1VTUEVOREVECj4+Cj4+Pgo+Pj4gSSB0cmllZCByZXByb2R1
Y2luZyB0aGlzIGlzc3VlIG9uIG15IHNldHVwIHllc3RlcmRheSBidXQgY291bGRuJ3QuCj4+PiBI
ZXJlJ3Mgd2hhdCBJIGRpZDoKPj4+IDEuIHNkZXZfcnBtYiBpcyBSUE1fU1VTUEVOREVELCBjaGVj
a2VkIGJlZm9yZSBpbml0aWF0aW5nIHN5c3RlbSBzdXNwZW5kCj4+PiAyLiBzZGV2X3Vmc19kZXZp
Y2UgaXMgUlBNX1JFU1VNRUQKPj4+IDMuIEkgdHJpZ2dlcmVkIHN5c3RlbSBzdXNwZW5kIChlY2hv
IG1lbSA+IC9zeXMvcG93ZXIvc3RhdGUpIGFuZCBzY2hlZHVsZWQgdGhlIGVycm9yIGhhbmRsZXIg
ZnJvbSB1ZnNoY2Rfd2xfc3VzcGVuZCgpLgo+Pj4gNC4gV2FpdGVkIHVudGlsIGVycm9yIGhhbmRs
ZXIgcmFuIGFuZCB0aGVuIHVmc2hjZF93bF9zdXNwZW5kKCkgYmxvY2tzIG9uIGhvc3Rfc2VtLgo+
Pj4gNS4gVGhlIHVmc2hjZF9jbGVhcl93YV93bHVuKFVGU19VUElVX1JQTUJfV0xVTikgd2VudCB0
aHJvdWdoIGZpbmUuCj4+Pgo+Pj4gRG8geW91J3ZlIHNvbWUgc3BlY2lmaWMgc3RlcHMgdG8gcmVw
cm9kdWNlIHRoaXMgb3IgYSBzY3JpcHQsIHBlcmhhcHM/IElmIHNvLCBwbGVhc2UgY2FuIHlvdSBz
aGFyZSBpdCB3aXRoIG1lLiBJIHdpbGwgdHJ5IGFnYWluLgo+Pgo+PiBJIHdhcyB1c2luZyBhIGRl
dmljZSB0aGF0IGdpdmVzIG9jY2FzaW9uYWwgZXJyb3JzLCBidXQgSSB3aWxsIHdoYXQgc2VlIEkg
Y2FuIGRvLgo+IAo+IEkgaGF2ZSBhdHRhY2hlZCAyIHBhdGNoZXMgdG8gcmVwcm9kdWNlIHRoZSBp
c3N1ZSwgYW5kIHRoZSB0ZXN0IHNjcmlwdCBJIHVzZWQuCj4gTm90ZSBpdCBpcyB1c2luZyBkb3du
X3RpbWVvdXQoKSBzbyBpdCBkb2Vzbid0IGxvY2sgdXAgY29tcGxldGVseS4KPiBUaGUga2VybmVs
IG1lc3NhZ2VzIGFyZToKPiAKPiBbICAgNzkuMzg1NDU2XSB1ZnNoY2Rfd2xfc3VzcGVuZDogZG9p
bmcgdWZzaGNkX3NjaGVkdWxlX2VoX3dvcmsKPiBbICAgNzkuMzg1NTExXSB1ZnNoY2Rfd2xfc3Vz
cGVuZDogc2xlZXBpbmcgMTAwMCBtcwo+IFsgICA3OS4zODY5MTZdIHVmc2hjZF9lcnJfaGFuZGxl
cjogc3RhcnQKPiBbICAgNzkuMzg2OTc5XSB1ZnNoY2RfZXJyX2hhbmRsZXI6IGdvdCBzZW0KPiBb
ICAgNzkuMzg3MDUzXSB1ZnNoY2RfZXJyX2hhbmRsaW5nX3VucHJlcGFyZTogc3RhcnQKPiBbICAg
NzkuMzg3MzAyXSB1ZnNoY2RfY2xlYXJfdWFfd2x1bnM6IGJlZm9yZSB1ZnNoY2RfY2xlYXJfdWFf
d2x1bihoYmEsIFVGU19VUElVX1JQTUJfV0xVTikKPiBbICAgODAuNDM1ODc4XSB1ZnNoY2Rfd2xf
c3VzcGVuZDogdHJ5aW5nIHRvIGdldCBzZW0KPiBbICAgODUuNjgzODc2XSB1ZnNoY2Rfd2xfc3Vz
cGVuZDogZmFpbGVkIHRvIGdldCBzZW0KPiBbICAgODUuNjgzOTkzXSB1ZnNfZGV2aWNlX3dsdW4g
MDowOjA6NDk0ODg6IFBNOiBmYWlsZWQgdG8gc3VzcGVuZCBhc3luYzogZXJyb3IgLTIyCj4gWyAg
IDg1LjY4NjkwMV0gdWZzaGNkX2NsZWFyX3VhX3dsdW5zOiBhZnRlciB1ZnNoY2RfY2xlYXJfdWFf
d2x1bihoYmEsIFVGU19VUElVX1JQTUJfV0xVTiksIHJldCAwCj4gWyAgIDg1LjY4NzAyNV0gdWZz
aGNkX2Vycl9oYW5kbGluZ191bnByZXBhcmU6IGZpbmlzaAo+IFsgICA4NS42ODcwOTBdIHVmc2hj
ZF9lcnJfaGFuZGxlcjogZmluaXNoIAo+IAo+IAoKSSB0aGluayB3ZSBhbHNvIG5lZWQgdG8gcnVu
dGltZSByZXN1bWUgUlBNQiBXTFVOIGJlZm9yZSBzeXN0ZW0gc3VzcGVuZC4KZS5nLgoKK3N0YXRp
YyBpbnQgdWZzaGNkX3JwbWJfcnBtX2dldF9zeW5jKHN0cnVjdCB1ZnNfaGJhICpoYmEpCit7CisJ
cmV0dXJuIHBtX3J1bnRpbWVfZ2V0X3N5bmMoJmhiYS0+c2Rldl9ycG1iLT5zZGV2X2dlbmRldik7
Cit9CisKK3N0YXRpYyBpbnQgdWZzaGNkX3JwbWJfcnBtX3B1dChzdHJ1Y3QgdWZzX2hiYSAqaGJh
KQoreworCXJldHVybiBwbV9ydW50aW1lX3B1dCgmaGJhLT5zZGV2X3JwbWItPnNkZXZfZ2VuZGV2
KTsKK30KKwogdm9pZCB1ZnNoY2RfcmVzdW1lX2NvbXBsZXRlKHN0cnVjdCBkZXZpY2UgKmRldikK
IHsKIAlzdHJ1Y3QgdWZzX2hiYSAqaGJhID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAKKwlpZiAo
aGJhLT5ycG1iX2NvbXBsZXRlX3B1dCkgeworCQloYmEtPnJwbWJfY29tcGxldGVfcHV0ID0gZmFs
c2U7CisJCXVmc2hjZF9ycG1iX3JwbV9wdXQoaGJhKTsKKwl9CiAJaWYgKGhiYS0+Y29tcGxldGVf
cHV0KSB7CiAJCWhiYS0+Y29tcGxldGVfcHV0ID0gZmFsc2U7CiAJCXVmc2hjZF9ycG1fcHV0KGhi
YSk7CkBAIC05NjExLDYgKzk2MjUsMTEgQEAgaW50IHVmc2hjZF9zdXNwZW5kX3ByZXBhcmUoc3Ry
dWN0IGRldmljZSAqZGV2KQogCQlyZXR1cm4gcmV0OwogCX0KIAloYmEtPmNvbXBsZXRlX3B1dCA9
IHRydWU7CisKKwlpZiAoaGJhLT5zZGV2X3JwbWIpIHsKKwkJdWZzaGNkX3JwbWJfcnBtX2dldF9z
eW5jKGhiYSk7CisJCWhiYS0+cnBtYl9jb21wbGV0ZV9wdXQgPSB0cnVlOworCX0KIAlyZXR1cm4g
MDsKIH0KClRoYXQgYWxzbyBhdm9pZHMgYW5vdGhlciBpc3N1ZTogaWYgUlBNQiBXTFVOIGlzIHJ1
bnRpbWUgc3VzcGVuZGVkIGF0IHN5c3RlbSByZXN1bWUsIHdlIGhhdmUgdG8gc2tpcCBjbGVhcmlu
ZyBVQUMsIGJ1dCBTQ1NJIFBNIHdpbGwgZm9yY2UgdGhlIHJ1bnRpbWUgc3RhdHVzIHRvIFJQTV9B
Q1RJVkUgYWZ0ZXIgc3lzdGVtIHJlc3VtZSwgc28gdGhlIFVBQyBuZXZlciBnZXRzIGNsZWFyZWQg
aW4gdGhhdCBjYXNlLgoKRnVydGhlcm1vcmUsIGl0IHNlZW1zIGJldHRlciBub3QgdG8gcmVwb3J0
IGVycm9ycyBmcm9tIFJQTUIgcmVzdW1lIGFuZCBpbnN0ZWFkIGxldCB0aGUgZXJyb3IgaGFuZGxl
ciBzb3J0IGl0IG91dC4KU28sIHdpdGggdGhlIGFib3ZlIGNoYW5nZSwgd2UgY2FuIHNpbXBsaWZ5
IGEgYml0OgoKLXN0YXRpYyBpbnQgdWZzaGNkX3JwbWJfcnVudGltZV9yZXN1bWUoc3RydWN0IGRl
dmljZSAqZGV2KQotewotCXN0cnVjdCB1ZnNfaGJhICpoYmEgPSB3bHVuX2Rldl90b19oYmEoZGV2
KTsKLQotCWlmIChoYmEtPnNkZXZfcnBtYikKLQkJcmV0dXJuIHVmc2hjZF9jbGVhcl9ycG1iX3Vh
YyhoYmEpOwotCXJldHVybiAwOwotfQotCiBzdGF0aWMgaW50IHVmc2hjZF9ycG1iX3Jlc3VtZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IHVmc19oYmEgKmhiYSA9IHdsdW5fZGV2X3Rv
X2hiYShkZXYpOwogCi0JaWYgKGhiYS0+c2Rldl9ycG1iICYmICFwbV9ydW50aW1lX3N1c3BlbmRl
ZChkZXYpKQotCQlyZXR1cm4gdWZzaGNkX2NsZWFyX3JwbWJfdWFjKGhiYSk7CisJaWYgKGhiYS0+
c2Rldl9ycG1iKQorCQl1ZnNoY2RfY2xlYXJfcnBtYl91YWMoaGJhKTsKIAlyZXR1cm4gMDsKIH0K
IAogc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIHVmc19ycG1iX3BtX29wcyA9IHsKLQlT
RVRfUlVOVElNRV9QTV9PUFMoTlVMTCwgdWZzaGNkX3JwbWJfcnVudGltZV9yZXN1bWUsIE5VTEwp
CisJU0VUX1JVTlRJTUVfUE1fT1BTKE5VTEwsIHVmc2hjZF9ycG1iX3Jlc3VtZSwgTlVMTCkKIAlT
RVRfU1lTVEVNX1NMRUVQX1BNX09QUyhOVUxMLCB1ZnNoY2RfcnBtYl9yZXN1bWUpCiB9OwoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
