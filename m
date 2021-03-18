Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A210C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 19:17:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C627864F01
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 19:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C627864F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fi/u5pVFx5eX2FTpocSSJDiepp51fO8e1+eec+c09+c=; b=FLvuOvCsmbvOLuh4omwhIv9W9
	6rot2LiKLghinCQf1+VLl6f1aQnVDLr6YRn803sM0V7IFN4WZrD7g9bhXqSLqXFylOZx+eVNDFhdU
	yNkxuohc3t3KWkmcLcVx+pEhMjzKE5tko7HFCCv3H9EYeW3FMAXyoIHZxliLkaFZFuNs7i9qc++fn
	yV0Kqa8cfIKEMxVjBzaSfYvL/NqIMyUFdNeESQhQp7lURpstaN2L1g3PepQBK4AcvvvkDQafJbm+W
	u54xgLiF0FGHw882tprLKS/z29L0TQeggZ2rBzSmVoUge/fHzBxzedBDvekZ8BNv7NZHHutYC1AVc
	i0dR5ADUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMy8y-005vAd-Ia; Thu, 18 Mar 2021 19:17:16 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMy8t-005vA0-59; Thu, 18 Mar 2021 19:17:14 +0000
IronPort-SDR: HuJFvnWemsA8Su86qfoq97Pk+BAqAdr1cAR44vqfm59HjpbLKjsnUr/F1X6B3WKE3dYjkvgrSv
 zopyyUDn/SfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="253762844"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="253762844"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 12:16:49 -0700
IronPort-SDR: tlY017y2ZGiXSxLvosdq6u4Cu3KxuLj4noSdWMc3URuZDELv0iG+trTQo4xFGPUyo0qOnUrBFq
 76mPUd0jkReA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="606301653"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174])
 ([10.237.72.174])
 by fmsmga005.fm.intel.com with ESMTP; 18 Mar 2021 12:16:42 -0700
Subject: Re: [PATCH v10 1/2] scsi: ufs: Enable power management for wlun
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Bart Van Assche <bvanassche@acm.org>, cang@codeaurora.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Stanley Chu
 <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Bean Huo <beanhuo@micron.com>,
 Lee Jones <lee.jones@linaro.org>, Wei Yongjun <weiyongjun1@huawei.com>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Tomas Winkler <tomas.winkler@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>, open list
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 Linux-PM mailing list <linux-pm@vger.kernel.org>
References: <cover.1614725302.git.asutoshd@codeaurora.org>
 <85086647-7292-b0a2-d842-290818bd2858@intel.com>
 <6e98724d-2e75-d1fe-188f-a7010f86c509@codeaurora.org>
 <20210306161616.GC74411@rowland.harvard.edu>
 <CAJZ5v0ihJe8rNjWRwNic_BQUvKbALNcjx8iiPAh5nxLhOV9duw@mail.gmail.com>
 <CAJZ5v0iJ4yqRTt=mTCC930HULNFNTgvO4f9ToVO6pNz53kxFkw@mail.gmail.com>
 <f1e9b21d-1722-d20b-4bae-df7e6ce50bbc@codeaurora.org>
 <2bd90336-18a9-9acd-5abb-5b52b27fc535@codeaurora.org>
 <b13086f3-eea1-51a7-2117-579d520f21fc@intel.com>
 <20cbd52d-7254-3e1c-06a3-712326c99f75@codeaurora.org>
 <c1b38327-fece-4e31-709b-84ec775c6e18@intel.com>
 <ae871d38-4865-5836-d370-e5f9b7be762c@codeaurora.org>
 <24dfb6fc-5d54-6ee2-9195-26428b7ecf8a@intel.com>
 <CAJZ5v0iOT4oi8Ez5xgN9LE0E7J=_Vb7G8a-9etmu+QTvQ1j9ew@mail.gmail.com>
 <d9ea43fd-b065-0e6e-07cb-d6ec6ef97bae@codeaurora.org>
 <CAJZ5v0iTymqf0yRrfvHoxejzKiZ7hnGH+xXYTZhbDait5ULzTQ@mail.gmail.com>
 <36864099-e9a0-83bf-8c9d-d821bb102a72@codeaurora.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <5a01ba2f-81d8-5b0f-6224-d47bd11c9f85@intel.com>
Date: Thu, 18 Mar 2021 21:16:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <36864099-e9a0-83bf-8c9d-d821bb102a72@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_191711_712140_35BF9A23 
X-CRM114-Status: GOOD (  23.31  )
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

T24gMTgvMDMvMjEgNzo1OCBwbSwgQXN1dG9zaCBEYXMgKGFzZCkgd3JvdGU6Cj4gT24gMy8xOC8y
MDIxIDEwOjU0IEFNLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPj4gT24gVGh1LCBNYXIgMTgs
IDIwMjEgYXQgNjozMyBQTSBBc3V0b3NoIERhcyAoYXNkKQo+PiA8YXN1dG9zaGRAY29kZWF1cm9y
YS5vcmc+IHdyb3RlOgo+Pj4KPj4+IE9uIDMvMTgvMjAyMSA3OjAwIEFNLCBSYWZhZWwgSi4gV3lz
b2NraSB3cm90ZToKPj4+PiBPbiBXZWQsIE1hciAxNywgMjAyMSBhdCA3OjM3IEFNIEFkcmlhbiBI
dW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPiB3cm90ZToKPj4+Pj4KPj4+Pj4gT24gMTYv
MDMvMjEgMTA6MzUgcG0sIEFzdXRvc2ggRGFzIChhc2QpIHdyb3RlOgo+Pj4+Pj4gT24gMy8xNi8y
MDIxIDEyOjQ4IEFNLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+Pj4+Pj4+IE9uIDE2LzAzLzIxIDEy
OjIyIGFtLCBBc3V0b3NoIERhcyAoYXNkKSB3cm90ZToKPj4+Pj4+Pj4gT24gMy8xNC8yMDIxIDE6
MTEgQU0sIEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4+Pj4+Pj4+PiBPbiAxMC8wMy8yMSA1OjA0IGFt
LCBBc3V0b3NoIERhcyAoYXNkKSB3cm90ZToKPj4+Pj4+Pj4+PiBPbiAzLzkvMjAyMSA3OjU2IEFN
LCBBc3V0b3NoIERhcyAoYXNkKSB3cm90ZToKPj4+Pj4+Pj4+Pj4gT24gMy84LzIwMjEgOToxNyBB
TSwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4+Pj4+Pj4+Pj4+PiBPbiBNb24sIE1hciA4LCAy
MDIxIGF0IDU6MjEgUE0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPiB3cm90
ZToKPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IE9uIFNhdCwgTWFyIDYsIDIwMjEgYXQgNTox
NyBQTSBBbGFuIFN0ZXJuIDxzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1PiB3cm90ZToKPj4+Pj4+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4gT24gRnJpLCBNYXIgMDUsIDIwMjEgYXQgMDY6NTQ6MjRQ
TSAtMDgwMCwgQXN1dG9zaCBEYXMgKGFzZCkgd3JvdGU6Cj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4+Pj4+PiBOb3cgZHVyaW5nIG15IHRlc3RpbmcgSSBzZWUgYSB3ZWlyZCBpc3N1ZSBzb21ldGlt
ZXMgKDEgaW4gNykuCj4+Pj4+Pj4+Pj4+Pj4+PiBTY2VuYXJpbyAtIGJvb3R1cHMKPj4+Pj4+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+PiBJc3N1ZToKPj4+Pj4+Pj4+Pj4+Pj4+IFRoZSBzdXBwbGll
ciAndWZzX2RldmljZV93bHVuIDA6MDowOjQ5NDg4JyBnb2VzIGludG8gcnVudGltZSBzdXNwZW5k
IGV2ZW4KPj4+Pj4+Pj4+Pj4+Pj4+IHdoZW4gb25lL21vcmUgb2YgaXRzIGNvbnN1bWVycyBhcmUg
aW4gUlBNX0FDVElWRSBzdGF0ZS4KPj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+PiAqTG9n
Ogo+Pj4+Pj4+Pj4+Pj4+Pj4gW8KgwqAgMTAuMDU2Mzc5XVvCoCBUMjA2XSBzZCAwOjA6MDoxOiBb
c2RiXSBTeW5jaHJvbml6aW5nIFNDU0kgY2FjaGUKPj4+Pj4+Pj4+Pj4+Pj4+IFvCoMKgIDEwLjA2
MjQ5N11bwqAgVDExM10gc2QgMDowOjA6NTogW3NkZl0gU3luY2hyb25pemluZyBTQ1NJIGNhY2hl
Cj4+Pj4+Pj4+Pj4+Pj4+PiBbwqDCoCAxMC4zNTY2MDBdW8KgwqAgVDMyXSBzZCAwOjA6MDo3OiBb
c2RoXSBTeW5jaHJvbml6aW5nIFNDU0kgY2FjaGUKPj4+Pj4+Pj4+Pj4+Pj4+IFvCoMKgIDEwLjM2
Mjk0NF1bwqAgVDE3NF0gc2QgMDowOjA6MzogW3NkZF0gU3luY2hyb25pemluZyBTQ1NJIGNhY2hl
Cj4+Pj4+Pj4+Pj4+Pj4+PiBbwqDCoCAxMC42OTY2MjddW8KgwqAgVDgzXSBzZCAwOjA6MDoyOiBb
c2RjXSBTeW5jaHJvbml6aW5nIFNDU0kgY2FjaGUKPj4+Pj4+Pj4+Pj4+Pj4+IFvCoMKgIDEwLjcw
NDU2Ml1bwqAgVDE3MF0gc2QgMDowOjA6NjogW3NkZ10gU3luY2hyb25pemluZyBTQ1NJIGNhY2hl
Cj4+Pj4+Pj4+Pj4+Pj4+PiBbwqDCoCAxMC45ODA2MDJdW8KgwqDCoCBUNV0gc2QgMDowOjA6MDog
W3NkYV0gU3luY2hyb25pemluZyBTQ1NJIGNhY2hlCj4+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
Pj4+Pj4gLyoqIFByaW50aW5nIGFsbCB0aGUgY29uc3VtZXIgbm9kZXMgb2Ygc3VwcGxpZXIgKiov
Cj4+Pj4+Pj4+Pj4+Pj4+PiBbwqDCoCAxMC45ODczMjddW8KgwqDCoCBUNV0gdWZzX2RldmljZV93
bHVuIDA6MDowOjQ5NDg4OiB1c2FnZS1jb3VudCBAIHN1c3BlbmQ6IDAKPj4+Pj4+Pj4+Pj4+Pj4+
IDwtLSB0aGlzIGlzIHRoZSB1c2FnZV9jb3VudAo+Pj4+Pj4+Pj4+Pj4+Pj4gW8KgwqAgMTAuOTk0
NDQwXVvCoMKgwqAgVDVdIHVmc19ycG1iX3dsdW4gMDowOjA6NDk0NzY6IFBNIHN0YXRlIC0gMgo+
Pj4+Pj4+Pj4+Pj4+Pj4gW8KgwqAgMTEuMDAwNDAyXVvCoMKgwqAgVDVdIHNjc2kgMDowOjA6NDk0
NTY6IFBNIHN0YXRlIC0gMgo+Pj4+Pj4+Pj4+Pj4+Pj4gW8KgwqAgMTEuMDA1NDUzXVvCoMKgwqAg
VDVdIHNkIDA6MDowOjA6IFBNIHN0YXRlIC0gMgo+Pj4+Pj4+Pj4+Pj4+Pj4gW8KgwqAgMTEuMDA5
OTU4XVvCoMKgwqAgVDVdIHNkIDA6MDowOjE6IFBNIHN0YXRlIC0gMgo+Pj4+Pj4+Pj4+Pj4+Pj4g
W8KgwqAgMTEuMDE0NDY5XVvCoMKgwqAgVDVdIHNkIDA6MDowOjI6IFBNIHN0YXRlIC0gMgo+Pj4+
Pj4+Pj4+Pj4+Pj4gW8KgwqAgMTEuMDE5MDcyXVvCoMKgwqAgVDVdIHNkIDA6MDowOjM6IFBNIHN0
YXRlIC0gMgo+Pj4+Pj4+Pj4+Pj4+Pj4gW8KgwqAgMTEuMDIzNTk1XVvCoMKgwqAgVDVdIHNkIDA6
MDowOjQ6IFBNIHN0YXRlIC0gMCA8PCBSUE1fQUNUSVZFCj4+Pj4+Pj4+Pj4+Pj4+PiBbwqDCoCAx
MS4zNTMyOThdW8KgwqDCoCBUNV0gc2QgMDowOjA6NTogUE0gc3RhdGUgLSAyCj4+Pj4+Pj4+Pj4+
Pj4+PiBbwqDCoCAxMS4zNTc3MjZdW8KgwqDCoCBUNV0gc2QgMDowOjA6NjogUE0gc3RhdGUgLSAy
Cj4+Pj4+Pj4+Pj4+Pj4+PiBbwqDCoCAxMS4zNjIxNTVdW8KgwqDCoCBUNV0gc2QgMDowOjA6Nzog
UE0gc3RhdGUgLSAyCj4+Pj4+Pj4+Pj4+Pj4+PiBbwqDCoCAxMS4zNjY1ODRdW8KgwqDCoCBUNV0g
dWZzaGNkLXFjb20gMWQ4NDAwMC51ZnNoYzogX191ZnNoY2Rfd2xfc3VzcGVuZCAtIDg3MDkKPj4+
Pj4+Pj4+Pj4+Pj4+IFvCoMKgIDExLjM3NDM2Nl1bwqDCoMKgIFQ1XSB1ZnNfZGV2aWNlX3dsdW4g
MDowOjA6NDk0ODg6IF9fdWZzaGNkX3dsX3N1c3BlbmQgLQo+Pj4+Pj4+Pj4+Pj4+Pj4gKDApIGhh
cyBycG1fYWN0aXZlIGZsYWdzCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBEbyB5b3UgbWVh
biB0aGF0IHJwbV9hY3RpdmUgb2YgdGhlIGxpbmsgYmV0d2VlbiB0aGUgY29uc3VtZXIgYW5kIHRo
ZQo+Pj4+Pj4+Pj4+Pj4+IHN1cHBsaWVyIGlzIGdyZWF0ZXIgdGhhbiAwIGF0IHRoaXMgcG9pbnQg
YW5kIHRoZSBjb25zdW1lciBpcwo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IEkgbWVhbiBpcyBy
cG1fYWN0aXZlIG9mIHRoZSBsaW5rIGdyZWF0ZXIgdGhhbiAxIChiZWNhdXNlIDEgbWVhbnMgIm5v
Cj4+Pj4+Pj4+Pj4+PiBhY3RpdmUgcmVmZXJlbmNlcyB0byB0aGUgc3VwcGxpZXIiKT8KPj4+Pj4+
Pj4+Pj4gSGkgUmFmYWVsOgo+Pj4+Pj4+Pj4+PiBObyAtIGl0IGlzIG5vdCBncmVhdGVyIHRoYW4g
MS4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gSSdtIHRyeWluZyB0byB1bmRlcnN0YW5kIHdoYXQn
cyBnb2luZyBvbiBpbiBpdDsgd2lsbCB1cGRhdGUgd2hlbiBJJ3ZlIHNvbWV0aGluZy4KPj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4gUlBNX0FDVElWRSwgYnV0IHRoZSBzdXBw
bGllciBzdXNwZW5kcyBzdWNjZXNzZnVsbHkgbmV2ZXJ0aGVsZXNzPwo+Pj4+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4+Pj4+PiBbwqDCoCAxMS4zODMzNzZdW8KgwqDCoCBUNV0gdWZzX2RldmljZV93bHVu
IDA6MDowOjQ5NDg4Ogo+Pj4+Pj4+Pj4+Pj4+Pj4gdWZzaGNkX3dsX3J1bnRpbWVfc3VzcGVuZCA8
LS0gU3VwcGxpZXIgc3VzcGVuZHMgZmluZS4KPj4+Pj4+Pj4+Pj4+Pj4+IFvCoMKgIDEyLjk3NzMx
OF1bwqAgVDE3NF0gc2QgMDowOjA6NDogW3NkZV0gU3luY2hyb25pemluZyBTQ1NJIGNhY2hlCj4+
Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pj4gQW5kIHRoZSB0aGUgc3VzcGVuZCBvZiBzZGUg
aXMgc3R1Y2sgbm93Ogo+Pj4+Pj4+Pj4+Pj4+Pj4gc2NoZWR1bGUrMHg5Yy8weGUwCj4+Pj4+Pj4+
Pj4+Pj4+PiBzY2hlZHVsZV90aW1lb3V0KzB4NDAvMHgxMjgKPj4+Pj4+Pj4+Pj4+Pj4+IGlvX3Nj
aGVkdWxlX3RpbWVvdXQrMHg0NC8weDY4Cj4+Pj4+Pj4+Pj4+Pj4+PiB3YWl0X2Zvcl9jb21tb25f
aW8rMHg3Yy8weDEwMAo+Pj4+Pj4+Pj4+Pj4+Pj4gd2FpdF9mb3JfY29tcGxldGlvbl9pbysweDE0
LzB4MjAKPj4+Pj4+Pj4+Pj4+Pj4+IGJsa19leGVjdXRlX3JxKzB4OTAvMHhjYwo+Pj4+Pj4+Pj4+
Pj4+Pj4gX19zY3NpX2V4ZWN1dGUrMHgxMDQvMHgxYzQKPj4+Pj4+Pj4+Pj4+Pj4+IHNkX3N5bmNf
Y2FjaGUrMHhmOC8weDJhMAo+Pj4+Pj4+Pj4+Pj4+Pj4gc2Rfc3VzcGVuZF9jb21tb24rMHg3NC8w
eDExYwo+Pj4+Pj4+Pj4+Pj4+Pj4gc2Rfc3VzcGVuZF9ydW50aW1lKzB4MTQvMHgyMAo+Pj4+Pj4+
Pj4+Pj4+Pj4gc2NzaV9ydW50aW1lX3N1c3BlbmQrMHg2NC8weDk0Cj4+Pj4+Pj4+Pj4+Pj4+PiBf
X3JwbV9jYWxsYmFjaysweDgwLzB4MmE0Cj4+Pj4+Pj4+Pj4+Pj4+PiBycG1fc3VzcGVuZCsweDMw
OC8weDYxNAo+Pj4+Pj4+Pj4+Pj4+Pj4gcG1fcnVudGltZV93b3JrKzB4OTgvMHhhOAo+Pj4+Pj4+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4+IEkgYWRkZWQgJ0RMX0ZMQUdfUlBNX0FDVElWRScgd2hp
bGUgY3JlYXRpbmcgbGlua3MuCj4+Pj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoaGJhLT5zZGV2X3Vmc19kZXZpY2UpIHsKPj4+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaW5rID0gZGV2aWNlX2xpbmtfYWRkKCZzZGV2LT5zZGV2
X2dlbmRldiwKPj4+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmhiYS0+c2Rldl91
ZnNfZGV2aWNlLT5zZGV2X2dlbmRldiwKPj4+Pj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IERMX0ZMQUdfUE1fUlVOVElNRXxETF9GTEFHX1JQTV9BQ1RJVkUpOwo+Pj4+Pj4+Pj4+Pj4+Pj4g
SSBkaWRuJ3QgZXhwZWN0IHRoaXMgdG8gcmVzb2x2ZSB0aGUgaXNzdWUgYW55d2F5IGFuZCBpdCBk
aWRuJ3QuCj4+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pj4gQW5vdGhlciBpbnRlcmVzdGlu
ZyBwb2ludCBoZXJlIGlzIHdoZW4gSSByZXN1bWUgYW55IG9mIHRoZSBhYm92ZSBzdXNwZW5kZWQK
Pj4+Pj4+Pj4+Pj4+Pj4+IGNvbnN1bWVycywgaXQgYWxsIGdvZXMgYmFjayB0byBub3JtYWwsIHdo
aWNoIGlzIGtpbmQgb2YgZXhwZWN0ZWQuIEkgdHJpZWQKPj4+Pj4+Pj4+Pj4+Pj4+IHJlc3VtaW5n
IHRoZSBjb25zdW1lciBhbmQgdGhlIHN1cHBsaWVyIGlzIHJlc3VtZWQgYW5kIHRoZSBzdXBwbGll
ciBpcwo+Pj4+Pj4+Pj4+Pj4+Pj4gc3VzcGVuZGVkIHdoZW4gYWxsIHRoZSBjb25zdW1lcnMgYXJl
IHN1c3BlbmRlZC4KPj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+PiBBbnkgcG9pbnRlcnMg
b24gdGhpcyBpc3N1ZSBwbGVhc2U/Cj4+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pj4gQEJh
cnQvQEFsYW4gLSBEbyB5b3UndmUgYW55IHBvaW50ZXJzIHBsZWFzZT8KPj4+Pj4+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+Pj4+Pj4gSXQncyB2ZXJ5IG5vdGljZWFibGUgdGhhdCBhbHRob3VnaCB5b3Ugc2Vl
bSB0byBoYXZlIGlzb2xhdGVkIGEgYnVnIGluCj4+Pj4+Pj4+Pj4+Pj4+IHRoZSBwb3dlciBtYW5h
Z2VtZW50IHN1YnN5c3RlbSAoc3VwcGxpZXIgZ29lcyBpbnRvIHJ1bnRpbWUgc3VzcGVuZAo+Pj4+
Pj4+Pj4+Pj4+PiBldmVuIHdoZW4gb25lIG9mIGl0cyBjb25zdW1lcnMgaXMgc3RpbGwgYWN0aXZl
KSwgeW91IGRpZCBub3QgQ0MgdGhlCj4+Pj4+Pj4+Pj4+Pj4+IHBvd2VyIG1hbmFnZW1lbnQgbWFp
bnRhaW5lciBvciBtYWlsaW5nIGxpc3QuCj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+IEkg
aGF2ZSBhZGRlZCB0aGUgYXBwcm9wcmlhdGUgQ0Mncy4KPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
Pj4+IFRoYW5rcyBBbGFuIQo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+Pj4+
Pj4+Pj4gSGVsbG8KPj4+Pj4+Pj4+PiBJICYgQ2FuICh0aGFua3MgQ2FuRykgZGVidWdnZWQgdGhp
cyBmdXJ0aGVyOgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gTG9va3MgbGlrZSB0aGlzIGlzc3VlIGNh
biBvY2N1ciBpZiB0aGUgc2QgcHJvYmUgaXMgYXN5bmNocm9ub3VzLgo+Pj4+Pj4+Pj4+Cj4+Pj4+
Pj4+Pj4gRXNzZW50aWFsbHksIHRoZSBzZF9wcm9iZSgpIGlzIGRvbmUgYXN5bmNocm9ub3VzbHkg
YW5kIGRyaXZlcl9wcm9iZV9kZXZpY2UoKSBpbnZva2VzIHBtX3J1bnRpbWVfZ2V0X3N1cHBsaWVy
cygpIGJlZm9yZSBpbnZva2luZyBzZF9wcm9iZSgpLgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gQnV0
IHNjc2lfcHJvYmVfYW5kX2FkZF9sdW4oKSBydW5zIGluIGEgc2VwYXJhdGUgY29udGV4dC4KPj4+
Pj4+Pj4+PiBTbyB0aGUgc2NzaV9hdXRvcG1fcHV0X2RldmljZSgpIGludm9rZWQgZnJvbSBzY3Np
X3NjYW5faG9zdCgpIGNvbnRleHQgcmVkdWNlcyB0aGUgbGluay0+cnBtX2FjdGl2ZSB0byAxLiBB
bmQgc2RfcHJvYmUoKSBpbnZva2VzIHNjc2lfYXV0b3BtX3B1dF9kZXZpY2UoKSBhbmQgc3RhcnRz
IGEgdGltZXIuIEFuZCB0aGVuIGRyaXZlcl9wcm9iZV9kZXZpY2UoKSBpbnZva2VkIGZyb20gX19k
ZXZpY2VfYXR0YWNoX2FzeW5jX2hlbHBlciBjb250ZXh0IHJlZHVjZXMgdGhlIGxpbmstPnJwbV9h
Y3RpdmUgdG8gMSB0aHVzIGVuYWJsaW5nIHRoZSBzdXBwbGllciB0byBzdXNwZW5kIGJlZm9yZSB0
aGUgY29uc3VtZXIgc3VzcGVuZHMuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBTbyBpZjoKPj4+Pj4+
Pj4+PiBDb250ZXh0IFQxOgo+Pj4+Pj4+Pj4+IFsxXSBzY3NpX3Byb2JlX2FuZF9hZGRfbHVuKCkK
Pj4+Pj4+Pj4+PiBbMl3CoMKgwqAgfC0gc2NzaV9hdXRvcG1fcHV0X2RldmljZSgpIC0gcmVkdWNl
IHRoZSBsaW5rLT5ycG1fYWN0aXZlIHRvIDEKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IENvbnRleHQg
VDI6Cj4+Pj4+Pj4+Pj4gX19kZXZpY2VfYXR0YWNoX2FzeW5jX2hlbHBlcigpCj4+Pj4+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqAgfC0gZHJpdmVyX3Byb2JlX2RldmljZSgpCj4+Pj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8LSBzZF9wcm9iZSgpCj4+Pj4+Pj4+Pj4gSW4gYmV0d2VlbiBbMV0g
YW5kIFsyXSBzYXksIGRyaXZlcl9wcm9iZV9kZXZpY2UoKSAtPiBzZF9wcm9iZSgpIGlzIGludm9r
ZWQgaW4gYSBzZXBhcmF0ZSBjb250ZXh0IGZyb20gX19kZXZpY2VfYXR0YWNoX2FzeW5jX2hlbHBl
cigpLgo+Pj4+Pj4+Pj4+IFRoZSBkcml2ZXJfcHJvYmVfZGV2aWNlKCkgLT4gcG1fcnVudGltZV9n
ZXRfc3VwcGxpZXJzKCkgYnV0IFsyXSB3b3VsZCByZWR1Y2UgbGluay0+cnBtX2FjdGl2ZSB0byAx
Lgo+Pj4+Pj4+Pj4+IFRoZW4gc2RfcHJvYmUoKSB3b3VsZCBpbnZva2UgcnBtX3Jlc3VtZSgpIGFu
ZCBwcm9jZWVkIGFzIGlzLgo+Pj4+Pj4+Pj4+IFdoZW4gc2RfcHJvYmUoKSBpbnZva2VzIHNjc2lf
YXV0b3BtX3B1dF9kZXZpY2UoKSBpdCdkIHN0YXJ0IGEgdGltZXIsIGRldi0+cG93ZXIudGltZXJf
YXV0b3N1c3BlbmRzID0gMS4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IE5vdyB0aGVuLCBwbV9ydW50
aW1lX3B1dF9zdXBwbGllcnMoKSBpcyBpbnZva2VkIGZyb20gZHJpdmVyX3Byb2JlX2RldmljZSgp
IGFuZCB0aGF0IG1ha2VzIHRoZSBsaW5rLT5ycG1fYWN0aXZlID0gMS4KPj4+Pj4+Pj4+PiBCdXQg
Ynkgbm93LCB0aGUgY29ycmVzcG9uZGluZyAnc2QgZGV2JyAoY29uc3VtZXIpIHVzYWdlX2NvdW50
ID0gMCwgc3RhdGUgPSBSUE1fQUNUSVZFIGFuZCBsaW5rLT5ycG1fYWN0aXZlID0gMS4KPj4+Pj4+
Pj4+PiBBdCB0aGlzIHBvaW50IG9mIHRpbWUsIGFsbCBvdGhlciAnc2QgZGV2JyAoY29uc3VtZXJz
KSBfbWF5XyBiZSBzdXNwZW5kZWQgb3IgYWN0aXZlIGJ1dCB3b3VsZCBoYXZlIHRoZSBsaW5rLT5y
cG1fYWN0aXZlID0gMS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBJcyB0aGlzIHdpdGggRExfRkxBR19S
UE1fQUNUSVZFP8KgIEluIHRoYXQgY2FzZSwgd291bGRuJ3QgYWN0aXZlCj4+Pj4+Pj4+PiBjb25z
dW1lcnMgaGF2ZSBsaW5rLT5ycG1fYWN0aXZlID0gMiBhbmQgYWxzbyBoYXZlIGluY3JlbWVudGVk
Cj4+Pj4+Pj4+PiB0aGUgc3VwcGxpZXIncyB1c2FnZV9jb3VudD8KPj4+Pj4+Cj4+Pj4+PiBZZXMg
dGhpcyBpcyB3aXRoIERMX0ZMQUdfUlBNX0FDVElWRS4KPj4+Pj4+Cj4+Pj4+PiBQbGVhc2UgbGV0
IG1lIHNoYXJlIGEgbG9nIGhlcmU6Cj4+Pj4+PiBCRUYgbWVhbnMgLSBCZWZvcmUsIEFGVCBtZWFu
cyBBZnRlci4KPj4+Pj4+Cj4+Pj4+PiBbwqDCoMKgIDYuODQzNDQ1XVvCoMKgwqAgVDddIHNjc2kg
MDowOjA6NDogW1VGU0RCR106IHVmc2hjZF9zZXR1cF9saW5rczo0Nzc5OsKgIHN1cHA6IHVzYWdl
X2NudDogMyBMaW5rIC0gMDowOjA6NDk0ODggbGluay1ycG1fYWN0aXZlOiAyIGF2YWlsX2x1bnM6
IDUKPj4+Pj4+IFvCoMKgwqAgNi44OTI1NDVdW8KgwqDCoCBUN10gc2NzaSAwOjA6MDo0OiBwbV9y
dW50aW1lX2dldF9zdXBwbGllcnM6ICgwOjA6MDo0OTQ4OCk6IHN1cHA6IHVzYWdlX2NvdW50OiA1
IHJwbV9hY3RpdmU6IDQKPj4+Pj4+Cj4+Pj4+PiBJbiB0aGUgYWJvdmUgbG9nLCBUNyBpcyB0aGUg
Y29udGV4dCBpbiB3aGljaCB0aGlzIHNjc2kgZGV2aWNlIGlzIGJlaW5nIGFkZGVkIC0gc2NzaV9z
eXNmc19hZGRfc2RldigpCj4+Pj4+Pgo+Pj4+Pj4gW8KgwqDCoCA2LjkzMTg0Nl1bwqDCoMKgIFQ3
XSB1ZnNfcnBtYl93bHVuIDA6MDowOjQ6IFtVRlNEQkddOiB1ZnNoY2RfcnBtYl9wcm9iZTo5Njky
OiBpbnZva2VkCj4+Pj4+PiBbwqDCoMKgIDYuOTQxMjQ2XVvCoMKgwqAgVDddIHNjc2kgMDowOjA6
NDogcG1fcnVudGltZV9wdXRfc3VwcGxpZXJzOiBycG1fYWN0aXZlOiA0Cj4+Pj4+Pgo+Pj4+Pj4g
W8KgwqDCoCA2Ljk0MTI0Nl1bwqDCoMKgIFQ3XSBzY3NpIDA6MDowOjQ6IHBtX3J1bnRpbWVfcHV0
X3N1cHBsaWVyczogKDA6MDowOjQ5NDg4KSBbQkVGXSB1c2FnZV9jb3VudDogNQo+Pj4+Pj4gW8Kg
wqDCoCA2Ljk0MTI0N11bwqDCoMKgIFQ3XSBzY3NpIDA6MDowOjQ6IHBtX3J1bnRpbWVfcHV0X3N1
cHBsaWVyczogKDA6MDowOjQ5NDg4KSBbQUZUXSB1c2FnZV9jb3VudDogNCBycG1fYWN0aXZlOiAz
Cj4+Pj4+Pgo+Pj4+Pj4gW8KgwqDCoCA2Ljk0MTI2N11bwqDCoMKgIFQ3XSBzY3NpIDA6MDowOjQ6
IHJwbV9wdXRfc3VwcGxpZXJzOiBbQkVGXSBTdXBwICgwOjA6MDo0OTQ4OCkgdXNhZ2VfY291bnQ6
IDQgcnBtX2FjdGl2ZTogMwo+Pj4+Pj4KPj4+Pj4+IC0tLS0tLSBUMTk2IENvbnRleHQgY29tZXMg
aW4gd2hpbGUgVDcgaXMgcnVubmluZyAtLS0tLS0tLS0tCj4+Pj4+PiBbwqDCoMKgIDYuOTQxNDY2
XVvCoCBUMTk2XSBzY3NpIDA6MDowOjQ6IHBtX3J1bnRpbWVfZ2V0X3N1cHBsaWVyczogKDA6MDow
OjQ5NDg4KTogc3VwcDogdXNhZ2VfY291bnQ6IDUgcnBtX2FjdGl2ZTogNAo+Pj4+Pj4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
Pj4+Pj4+Cj4+Pj4+PiBbwqDCoMKgIDcuNzg4Mzk3XVvCoMKgwqAgVDddIHNjc2kgMDowOjA6NDog
cnBtX3B1dF9zdXBwbGllcnM6IFtBRlRdIFN1cHAgKDA6MDowOjQ5NDg4KSB1c2FnZV9jb3VudDog
MiBycG1fYWN0aXZlOiAxCj4+Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gLS0gCj4+Pj4+
Pgo+Pj4+Pj4gVDE5NiBpcyB0aGUgY29udGV4dCBpbiB3aGljaCBzZF9wcm9iZSgpIGlzIGludm9r
ZWQgZm9yIHRoaXMgc2NzaSBkZXZpY2UuCj4+Pj4+Pgo+Pj4+Pj4gW8KgwqDCoCA3Ljk3NDQxMF1b
wqAgVDE5Nl0gc2QgMDowOjA6NDogW3NkZV0gQXR0YWNoZWQgU0NTSSBkaXNrCj4+Pj4+PiBbwqDC
oMKgIDcuOTg0MTg4XVvCoCBUMTk2XSBzZCAwOjA6MDo0OiBwbV9ydW50aW1lX3B1dF9zdXBwbGll
cnM6IHJwbV9hY3RpdmU6IDIKPj4+Pj4+IFvCoMKgwqAgNy45OTg0MjRdW8KgIFQxOTZdIHNkIDA6
MDowOjQ6IHBtX3J1bnRpbWVfcHV0X3N1cHBsaWVyczogKDA6MDowOjQ5NDg4KSBbQkVGXSB1c2Fn
ZV9jb3VudDogNAo+Pj4+Pj4gW8KgwqDCoCA4LjAxNzMyMF1bwqAgVDE5Nl0gc2QgMDowOjA6NDog
cG1fcnVudGltZV9wdXRfc3VwcGxpZXJzOiAoMDowOjA6NDk0ODgpIFtBRlRdIHVzYWdlX2NvdW50
OiAxIHJwbV9hY3RpdmU6IDEKPj4+Pj4+Cj4+Pj4+PiBUaGUgcmVmZXJlbmNlIHRvIHRoZSBsaW5r
IGlzIHJlbGVhc2VkIGFmdGVyIHNkX3Byb2JlKCkgaXMgY29tcGxldGVkLgo+Pj4+Pj4gQXQgdGhp
cyBwb2ludCwgdGhlIHJwbV9hY3RpdmUgc2hvdWxkIGJlIDIuIEFuZCB0aGUgcnBtX2FjdGl2ZSBz
aG91bGQgYmVjb21lIDEgd2hlbiBzZCAwOjA6MDo0IGFjdHVhbGx5IHN1c3BlbmRzLiBCdXQgYXQg
dGhlIGVuZCBvZiBzZF9wcm9iZSgpIHRoZSBzdXNwZW5kIGlzIG9ubHkgc2NoZWR1bGVkLiBIb3dl
dmVyIHRoZSBzdXBwbGllciBpcyBub3cgZnJlZSB0byBzdXNwZW5kLgo+Pj4+Pj4KPj4+Pj4+IElu
IHRoaXMgbG9nLCB0aGUgdXNhZ2VfY291bnQgb2Ygc3VwcGxpZXIgYmVjb21lcyAwIGhlcmU6Cj4+
Pj4+PiBbwqDCoCAxMS45NjM4ODVdW8KgIFQxMTddIHNkIDA6MDowOjc6IHJwbV9wdXRfc3VwcGxp
ZXJzOiBbQkVGXSBTdXBwICgwOjA6MDo0OTQ4OCkgdXNhZ2VfY291bnQ6IDEgcnBtX2FjdGl2ZTog
Mgo+Pj4+Pj4gW8KgwqAgMTEuOTczODIxXVvCoCBUMTE3XSBzZCAwOjA6MDo3OiBycG1fcHV0X3N1
cHBsaWVyczogW0FGVF0gU3VwcCAoMDowOjA6NDk0ODgpIHVzYWdlX2NvdW50OiAwIHJwbV9hY3Rp
dmU6IDEKPj4+Pj4+Cj4+Pj4+PiBIb3dldmVyLCB0aGUgY29uc3VtZXIgc2QgMDowOjA6NCBpcyBz
dGlsbCBhY3RpdmUgYnV0IGhhcyByZWxlYXNlZCB0aGUgcmVmZXJlbmNlIHRvIHRoZSBzdXBwbGll
cjoKPj4+Pj4KPj4+Pj4gSWYgdGhhdCBpcyB0aGUgY2FzZSwgdGhlbiBpdCBpcyBhbiBlcnJvciBp
biBQTSBub3QgVUZTLgo+Pj4+Pgo+Pj4+PiBBIHNlY29uZCBsb29rIGF0IHRoZSBjb2RlIGFyb3Vu
ZCBycG1fcHV0X3N1cHBsaWVycygpIGRvZXMgbG9vawo+Pj4+PiBwb3RlbnRpYWxseSByYWN5LCBz
aW5jZSB0aGVyZSBkb2VzIG5vdCBhcHBlYXIgdG8gYmUgYW55dGhpbmcKPj4+Pj4gc3RvcHBpbmcg
dGhlIHJ1bnRpbWVfc3RhdHVzIGNoYW5naW5nIGJldHdlZW4KPj4+Pj4gc3Bpbl91bmxvY2tfaXJx
KCZkZXYtPnBvd2VyLmxvY2spIGFuZCBkZXZpY2VfbGlua3NfcmVhZF9sb2NrKCkuCj4+Pj4+Cj4+
Pj4+IFJhZmFlbCwgY2FuIHlvdSBjb21tZW50Pwo+Pj4+Cj4+Pj4gSW5kZWVkLCBpZiB0aGUgZGV2
aWNlIGlzIHN1c3BlbmRpbmcsIGNoYW5naW5nIGl0cyBQTS1ydW50aW1lIHN0YXR1cyB0bwo+Pj4+
IFJQTV9TVVNQRU5ERUQgYW5kIGRyb3BwaW5nIGl0cyBwb3dlci5sb2NrIGFsbG93cyBhIGNvbmN1
cnJlbnQKPj4+PiBycG1fcmVzdW1lKCkgdG8gcnVuIGFuZCByZXN1bWUgdGhlIGRldmljZSBiZWZv
cmUgdGhlIHN1cHBsaWVycyBjYW4gYmUKPj4+PiBzdXNwZW5kZWQuCj4+Pj4KPj4+PiBUaGF0J3Mg
aW5jb3JyZWN0IGFuZCBoYXMgYmVlbiBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCA0NGNjODlmNzY0NjQg
KCJQTToKPj4+PiBydW50aW1lOiBVcGRhdGUgZGV2aWNlIHN0YXR1cyBiZWZvcmUgbGV0dGluZyBz
dXBwbGllcnMgc3VzcGVuZCIpLgo+Pj4+Cj4+Pj4gSXQgaXMgcHJvYmFibHkgYmV0dGVyIHRvIHJl
dmVydCB0aGF0IGNvbW1pdCBhbmQgYWRkcmVzcyB0aGUgb3JpZ2luYWwKPj4+PiBpc3N1ZSBpbiBh
IGRpZmZlcmVudCB3YXkuCj4+Pj4KPj4+IEhlbGxvLAo+Pj4gT25lIGFwcHJvYWNoIHRvIGFkZHJl
c3MgdGhlIG9yaWdpbmFsIGlzc3VlIGNvdWxkIGJlIHRvIHByZXZlbnQgdGhlIHNjc2kKPj4+IGRl
dmljZXMgZnJvbSBzdXNwZW5kaW5nIHVudGlsIHRoZSBwcm9iZSBpcyBjb21wbGV0ZWQsIHBlcmhh
cHM/Cj4+Cj4+IEkgd2FzIHRhbGtpbmcgYWJvdXQgdGhlIG9yaWdpbmFsIGlzc3VlIHRoYXQgY29t
bWl0IDQ0Y2M4OWY3NjQ2NAo+PiBhdHRlbXB0ZWQgdG8gYWRkcmVzcy4KPj4KPj4gSSdtIG5vdCBz
dXJlIGlmIGFuZCBob3cgaXQgaXMgcmVsYXRlZCB0byB0aGUgaXNzdWUgeW91IGhhdmUgYmVlbiBk
ZWJ1Z2dpbmcuCj4+Cj4gSGkgUmFmYWVsCj4gVGhhbmtzIGZvciBjbGFyaWZ5aW5nIHRoYXQuCj4g
VW5kZXJzdG9vZC4KPiBJIHdhcyByZWZlcnJpbmcgdG8gdGhlIGlzc3VlIHRoYXQgSSd2ZSBiZWVu
IGRpc2N1c3Npbmcgd2l0aCBBZHJpYW4uCgpGb3IgdGVzdCBwdXJwb3NlcywgeW91IGNvdWxkIHRy
eSByZXZlcnRpbmcgNDRjYzg5Zjc2NDY0LCBtYWtpbmcgdGhlCm90aGVyIGNoYW5nZXMgdG8gdGhl
IFVGUyBkcml2ZXIsIGFuZCBzZWUgaWYgdGhlIGRldmljZV9saW5rcyBpc3N1ZQpnb2VzIGF3YXku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
