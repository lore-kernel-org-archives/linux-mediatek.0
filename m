Return-Path: <SRS0=VEyR=IR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026DBC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 00:41:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D1B164F10
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 00:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D1B164F10
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5to5WvovTQXfUxGNbGwqN+wTLLhLnkA8cSIYqUGw1gg=; b=qYmXjGWmEM/9AXPcJLMAsfWi9
	ZqZGksfhLi19keyYidwb7GTKFsevARv0v3JkGbPxbel6LPtjzOFiPZpxTExvSiJSqZzJxObPdTBR4
	cxr0wiTlheZ4hXWWKAorgyMBbnGUkAgf3V45c7cV0T6ZYY3YaDm65ucNPJdrkPO5ztcjAaTISCeae
	dkVJhWDZFcm6cNRr+skJK5ht67AzVkdAQ/TwPIsy6Uu35BtUrs7F5st8Fd0s65ogXfJvDqgSJ/3cC
	PDbor0wZIc2huR+WZgmX0izb9puqyC63Kvb5i0loNQ3SQ/qfNXp5az72Va3xZQxLqXKzb5/TwStkO
	kIsmEaIcA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN3CI-006FDn-Qi; Fri, 19 Mar 2021 00:41:03 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN3CB-006FCj-Ve
 for linux-mediatek@lists.infradead.org; Fri, 19 Mar 2021 00:41:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616114458; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=nKbpL+MXOXfmWr7OykBCzihZEQAYD28qNBi+NK46kd0=;
 b=GFJ1t84flLNG24eL+n4QyLXslj4SIvDtrSr60qJ/h5i+d88lEOH0O5yyWQ8rPPqjdztPhzTL
 mOF71T5oGXAPubRAoiylvcP8cNRVPfvJxIpoNs+KqeqWCoEgTTJboeUxxMBbPxJTD4cGwbAe
 mTpf6Gmt2G/XObhI5IjD9msRtw0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6053f30e5d70193f8858d506 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Mar 2021 00:40:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 00A43C433ED; Fri, 19 Mar 2021 00:40:45 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 43CE8C433C6;
 Fri, 19 Mar 2021 00:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 43CE8C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v10 1/2] scsi: ufs: Enable power management for wlun
To: Adrian Hunter <adrian.hunter@intel.com>,
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
 <5a01ba2f-81d8-5b0f-6224-d47bd11c9f85@intel.com>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <9ad33d49-57d1-dc48-adab-7c22c6c6f55b@codeaurora.org>
Date: Thu, 18 Mar 2021 17:40:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5a01ba2f-81d8-5b0f-6224-d47bd11c9f85@intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_004059_258251_921F7E18 
X-CRM114-Status: GOOD (  21.76  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMy8xOC8yMDIxIDEyOjE2IFBNLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+IE9uIDE4LzAzLzIx
IDc6NTggcG0sIEFzdXRvc2ggRGFzIChhc2QpIHdyb3RlOgo+PiBPbiAzLzE4LzIwMjEgMTA6NTQg
QU0sIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+Pj4gT24gVGh1LCBNYXIgMTgsIDIwMjEgYXQg
NjozMyBQTSBBc3V0b3NoIERhcyAoYXNkKQo+Pj4gPGFzdXRvc2hkQGNvZGVhdXJvcmEub3JnPiB3
cm90ZToKPj4+Pgo+Pj4+IE9uIDMvMTgvMjAyMSA3OjAwIEFNLCBSYWZhZWwgSi4gV3lzb2NraSB3
cm90ZToKPj4+Pj4gT24gV2VkLCBNYXIgMTcsIDIwMjEgYXQgNzozNyBBTSBBZHJpYW4gSHVudGVy
IDxhZHJpYW4uaHVudGVyQGludGVsLmNvbT4gd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gT24gMTYvMDMv
MjEgMTA6MzUgcG0sIEFzdXRvc2ggRGFzIChhc2QpIHdyb3RlOgo+Pj4+Pj4+IE9uIDMvMTYvMjAy
MSAxMjo0OCBBTSwgQWRyaWFuIEh1bnRlciB3cm90ZToKPj4+Pj4+Pj4gT24gMTYvMDMvMjEgMTI6
MjIgYW0sIEFzdXRvc2ggRGFzIChhc2QpIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gMy8xNC8yMDIxIDE6
MTEgQU0sIEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4+Pj4+Pj4+Pj4gT24gMTAvMDMvMjEgNTowNCBh
bSwgQXN1dG9zaCBEYXMgKGFzZCkgd3JvdGU6Cj4+Pj4+Pj4+Pj4+IE9uIDMvOS8yMDIxIDc6NTYg
QU0sIEFzdXRvc2ggRGFzIChhc2QpIHdyb3RlOgo+Pj4+Pj4+Pj4+Pj4gT24gMy84LzIwMjEgOTox
NyBBTSwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4+Pj4+Pj4+Pj4+Pj4gT24gTW9uLCBNYXIg
OCwgMjAyMSBhdCA1OjIxIFBNIFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWxAa2VybmVsLm9yZz4g
d3JvdGU6Cj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+IE9uIFNhdCwgTWFyIDYsIDIwMjEg
YXQgNToxNyBQTSBBbGFuIFN0ZXJuIDxzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1PiB3cm90ZToK
Pj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+PiBPbiBGcmksIE1hciAwNSwgMjAyMSBhdCAw
Njo1NDoyNFBNIC0wODAwLCBBc3V0b3NoIERhcyAoYXNkKSB3cm90ZToKPj4+Pj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4+Pj4+Pj4gTm93IGR1cmluZyBteSB0ZXN0aW5nIEkgc2VlIGEgd2VpcmQgaXNz
dWUgc29tZXRpbWVzICgxIGluIDcpLgo+Pj4+Pj4+Pj4+Pj4+Pj4+IFNjZW5hcmlvIC0gYm9vdHVw
cwo+Pj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+Pj4gSXNzdWU6Cj4+Pj4+Pj4+Pj4+Pj4+
Pj4gVGhlIHN1cHBsaWVyICd1ZnNfZGV2aWNlX3dsdW4gMDowOjA6NDk0ODgnIGdvZXMgaW50byBy
dW50aW1lIHN1c3BlbmQgZXZlbgo+Pj4+Pj4+Pj4+Pj4+Pj4+IHdoZW4gb25lL21vcmUgb2YgaXRz
IGNvbnN1bWVycyBhcmUgaW4gUlBNX0FDVElWRSBzdGF0ZS4KPj4+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4+Pj4+Pj4+ICpMb2c6Cj4+Pj4+Pj4+Pj4+Pj4+Pj4gW8KgwqAgMTAuMDU2Mzc5XVvCoCBU
MjA2XSBzZCAwOjA6MDoxOiBbc2RiXSBTeW5jaHJvbml6aW5nIFNDU0kgY2FjaGUKPj4+Pj4+Pj4+
Pj4+Pj4+PiBbwqDCoCAxMC4wNjI0OTddW8KgIFQxMTNdIHNkIDA6MDowOjU6IFtzZGZdIFN5bmNo
cm9uaXppbmcgU0NTSSBjYWNoZQo+Pj4+Pj4+Pj4+Pj4+Pj4+IFvCoMKgIDEwLjM1NjYwMF1bwqDC
oCBUMzJdIHNkIDA6MDowOjc6IFtzZGhdIFN5bmNocm9uaXppbmcgU0NTSSBjYWNoZQo+Pj4+Pj4+
Pj4+Pj4+Pj4+IFvCoMKgIDEwLjM2Mjk0NF1bwqAgVDE3NF0gc2QgMDowOjA6MzogW3NkZF0gU3lu
Y2hyb25pemluZyBTQ1NJIGNhY2hlCj4+Pj4+Pj4+Pj4+Pj4+Pj4gW8KgwqAgMTAuNjk2NjI3XVvC
oMKgIFQ4M10gc2QgMDowOjA6MjogW3NkY10gU3luY2hyb25pemluZyBTQ1NJIGNhY2hlCj4+Pj4+
Pj4+Pj4+Pj4+Pj4gW8KgwqAgMTAuNzA0NTYyXVvCoCBUMTcwXSBzZCAwOjA6MDo2OiBbc2RnXSBT
eW5jaHJvbml6aW5nIFNDU0kgY2FjaGUKPj4+Pj4+Pj4+Pj4+Pj4+PiBbwqDCoCAxMC45ODA2MDJd
W8KgwqDCoCBUNV0gc2QgMDowOjA6MDogW3NkYV0gU3luY2hyb25pemluZyBTQ1NJIGNhY2hlCj4+
Pj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4+PiAvKiogUHJpbnRpbmcgYWxsIHRoZSBjb25z
dW1lciBub2RlcyBvZiBzdXBwbGllciAqKi8KPj4+Pj4+Pj4+Pj4+Pj4+PiBbwqDCoCAxMC45ODcz
MjddW8KgwqDCoCBUNV0gdWZzX2RldmljZV93bHVuIDA6MDowOjQ5NDg4OiB1c2FnZS1jb3VudCBA
IHN1c3BlbmQ6IDAKPj4+Pj4+Pj4+Pj4+Pj4+PiA8LS0gdGhpcyBpcyB0aGUgdXNhZ2VfY291bnQK
Pj4+Pj4+Pj4+Pj4+Pj4+PiBbwqDCoCAxMC45OTQ0NDBdW8KgwqDCoCBUNV0gdWZzX3JwbWJfd2x1
biAwOjA6MDo0OTQ3NjogUE0gc3RhdGUgLSAyCj4+Pj4+Pj4+Pj4+Pj4+Pj4gW8KgwqAgMTEuMDAw
NDAyXVvCoMKgwqAgVDVdIHNjc2kgMDowOjA6NDk0NTY6IFBNIHN0YXRlIC0gMgo+Pj4+Pj4+Pj4+
Pj4+Pj4+IFvCoMKgIDExLjAwNTQ1M11bwqDCoMKgIFQ1XSBzZCAwOjA6MDowOiBQTSBzdGF0ZSAt
IDIKPj4+Pj4+Pj4+Pj4+Pj4+PiBbwqDCoCAxMS4wMDk5NThdW8KgwqDCoCBUNV0gc2QgMDowOjA6
MTogUE0gc3RhdGUgLSAyCj4+Pj4+Pj4+Pj4+Pj4+Pj4gW8KgwqAgMTEuMDE0NDY5XVvCoMKgwqAg
VDVdIHNkIDA6MDowOjI6IFBNIHN0YXRlIC0gMgo+Pj4+Pj4+Pj4+Pj4+Pj4+IFvCoMKgIDExLjAx
OTA3Ml1bwqDCoMKgIFQ1XSBzZCAwOjA6MDozOiBQTSBzdGF0ZSAtIDIKPj4+Pj4+Pj4+Pj4+Pj4+
PiBbwqDCoCAxMS4wMjM1OTVdW8KgwqDCoCBUNV0gc2QgMDowOjA6NDogUE0gc3RhdGUgLSAwIDw8
IFJQTV9BQ1RJVkUKPj4+Pj4+Pj4+Pj4+Pj4+PiBbwqDCoCAxMS4zNTMyOThdW8KgwqDCoCBUNV0g
c2QgMDowOjA6NTogUE0gc3RhdGUgLSAyCj4+Pj4+Pj4+Pj4+Pj4+Pj4gW8KgwqAgMTEuMzU3NzI2
XVvCoMKgwqAgVDVdIHNkIDA6MDowOjY6IFBNIHN0YXRlIC0gMgo+Pj4+Pj4+Pj4+Pj4+Pj4+IFvC
oMKgIDExLjM2MjE1NV1bwqDCoMKgIFQ1XSBzZCAwOjA6MDo3OiBQTSBzdGF0ZSAtIDIKPj4+Pj4+
Pj4+Pj4+Pj4+PiBbwqDCoCAxMS4zNjY1ODRdW8KgwqDCoCBUNV0gdWZzaGNkLXFjb20gMWQ4NDAw
MC51ZnNoYzogX191ZnNoY2Rfd2xfc3VzcGVuZCAtIDg3MDkKPj4+Pj4+Pj4+Pj4+Pj4+PiBbwqDC
oCAxMS4zNzQzNjZdW8KgwqDCoCBUNV0gdWZzX2RldmljZV93bHVuIDA6MDowOjQ5NDg4OiBfX3Vm
c2hjZF93bF9zdXNwZW5kIC0KPj4+Pj4+Pj4+Pj4+Pj4+PiAoMCkgaGFzIHJwbV9hY3RpdmUgZmxh
Z3MKPj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4gRG8geW91IG1lYW4gdGhhdCBycG1fYWN0
aXZlIG9mIHRoZSBsaW5rIGJldHdlZW4gdGhlIGNvbnN1bWVyIGFuZCB0aGUKPj4+Pj4+Pj4+Pj4+
Pj4gc3VwcGxpZXIgaXMgZ3JlYXRlciB0aGFuIDAgYXQgdGhpcyBwb2ludCBhbmQgdGhlIGNvbnN1
bWVyIGlzCj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+PiBJIG1lYW4gaXMgcnBtX2FjdGl2ZSBv
ZiB0aGUgbGluayBncmVhdGVyIHRoYW4gMSAoYmVjYXVzZSAxIG1lYW5zICJubwo+Pj4+Pj4+Pj4+
Pj4+IGFjdGl2ZSByZWZlcmVuY2VzIHRvIHRoZSBzdXBwbGllciIpPwo+Pj4+Pj4+Pj4+Pj4gSGkg
UmFmYWVsOgo+Pj4+Pj4+Pj4+Pj4gTm8gLSBpdCBpcyBub3QgZ3JlYXRlciB0aGFuIDEuCj4+Pj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gSSdtIHRyeWluZyB0byB1bmRlcnN0YW5kIHdoYXQncyBnb2lu
ZyBvbiBpbiBpdDsgd2lsbCB1cGRhdGUgd2hlbiBJJ3ZlIHNvbWV0aGluZy4KPj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4gUlBNX0FDVElWRSwgYnV0IHRoZSBzdXBwbGll
ciBzdXNwZW5kcyBzdWNjZXNzZnVsbHkgbmV2ZXJ0aGVsZXNzPwo+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4+Pj4+Pj4+IFvCoMKgIDExLjM4MzM3Nl1bwqDCoMKgIFQ1XSB1ZnNfZGV2aWNlX3dsdW4g
MDowOjA6NDk0ODg6Cj4+Pj4+Pj4+Pj4+Pj4+Pj4gdWZzaGNkX3dsX3J1bnRpbWVfc3VzcGVuZCA8
LS0gU3VwcGxpZXIgc3VzcGVuZHMgZmluZS4KPj4+Pj4+Pj4+Pj4+Pj4+PiBbwqDCoCAxMi45Nzcz
MThdW8KgIFQxNzRdIHNkIDA6MDowOjQ6IFtzZGVdIFN5bmNocm9uaXppbmcgU0NTSSBjYWNoZQo+
Pj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+Pj4gQW5kIHRoZSB0aGUgc3VzcGVuZCBvZiBz
ZGUgaXMgc3R1Y2sgbm93Ogo+Pj4+Pj4+Pj4+Pj4+Pj4+IHNjaGVkdWxlKzB4OWMvMHhlMAo+Pj4+
Pj4+Pj4+Pj4+Pj4+IHNjaGVkdWxlX3RpbWVvdXQrMHg0MC8weDEyOAo+Pj4+Pj4+Pj4+Pj4+Pj4+
IGlvX3NjaGVkdWxlX3RpbWVvdXQrMHg0NC8weDY4Cj4+Pj4+Pj4+Pj4+Pj4+Pj4gd2FpdF9mb3Jf
Y29tbW9uX2lvKzB4N2MvMHgxMDAKPj4+Pj4+Pj4+Pj4+Pj4+PiB3YWl0X2Zvcl9jb21wbGV0aW9u
X2lvKzB4MTQvMHgyMAo+Pj4+Pj4+Pj4+Pj4+Pj4+IGJsa19leGVjdXRlX3JxKzB4OTAvMHhjYwo+
Pj4+Pj4+Pj4+Pj4+Pj4+IF9fc2NzaV9leGVjdXRlKzB4MTA0LzB4MWM0Cj4+Pj4+Pj4+Pj4+Pj4+
Pj4gc2Rfc3luY19jYWNoZSsweGY4LzB4MmEwCj4+Pj4+Pj4+Pj4+Pj4+Pj4gc2Rfc3VzcGVuZF9j
b21tb24rMHg3NC8weDExYwo+Pj4+Pj4+Pj4+Pj4+Pj4+IHNkX3N1c3BlbmRfcnVudGltZSsweDE0
LzB4MjAKPj4+Pj4+Pj4+Pj4+Pj4+PiBzY3NpX3J1bnRpbWVfc3VzcGVuZCsweDY0LzB4OTQKPj4+
Pj4+Pj4+Pj4+Pj4+PiBfX3JwbV9jYWxsYmFjaysweDgwLzB4MmE0Cj4+Pj4+Pj4+Pj4+Pj4+Pj4g
cnBtX3N1c3BlbmQrMHgzMDgvMHg2MTQKPj4+Pj4+Pj4+Pj4+Pj4+PiBwbV9ydW50aW1lX3dvcmsr
MHg5OC8weGE4Cj4+Pj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4+PiBJIGFkZGVkICdETF9G
TEFHX1JQTV9BQ1RJVkUnIHdoaWxlIGNyZWF0aW5nIGxpbmtzLgo+Pj4+Pj4+Pj4+Pj4+Pj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaGJhLT5zZGV2X3Vmc19kZXZpY2UpIHsKPj4+Pj4+Pj4+
Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxpbmsgPSBkZXZp
Y2VfbGlua19hZGQoJnNkZXYtPnNkZXZfZ2VuZGV2LAo+Pj4+Pj4+Pj4+Pj4+Pj4+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICZoYmEtPnNkZXZfdWZzX2RldmljZS0+c2Rldl9nZW5kZXYsCj4+Pj4+Pj4+
Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERMX0ZMQUdfUE1fUlVOVElNRXxETF9GTEFHX1JQ
TV9BQ1RJVkUpOwo+Pj4+Pj4+Pj4+Pj4+Pj4+IEkgZGlkbid0IGV4cGVjdCB0aGlzIHRvIHJlc29s
dmUgdGhlIGlzc3VlIGFueXdheSBhbmQgaXQgZGlkbid0Lgo+Pj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+
Pj4+Pj4+Pj4+Pj4gQW5vdGhlciBpbnRlcmVzdGluZyBwb2ludCBoZXJlIGlzIHdoZW4gSSByZXN1
bWUgYW55IG9mIHRoZSBhYm92ZSBzdXNwZW5kZWQKPj4+Pj4+Pj4+Pj4+Pj4+PiBjb25zdW1lcnMs
IGl0IGFsbCBnb2VzIGJhY2sgdG8gbm9ybWFsLCB3aGljaCBpcyBraW5kIG9mIGV4cGVjdGVkLiBJ
IHRyaWVkCj4+Pj4+Pj4+Pj4+Pj4+Pj4gcmVzdW1pbmcgdGhlIGNvbnN1bWVyIGFuZCB0aGUgc3Vw
cGxpZXIgaXMgcmVzdW1lZCBhbmQgdGhlIHN1cHBsaWVyIGlzCj4+Pj4+Pj4+Pj4+Pj4+Pj4gc3Vz
cGVuZGVkIHdoZW4gYWxsIHRoZSBjb25zdW1lcnMgYXJlIHN1c3BlbmRlZC4KPj4+Pj4+Pj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pj4+IEFueSBwb2ludGVycyBvbiB0aGlzIGlzc3VlIHBsZWFzZT8K
Pj4+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pj4+IEBCYXJ0L0BBbGFuIC0gRG8geW91J3Zl
IGFueSBwb2ludGVycyBwbGVhc2U/Cj4+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pj4gSXQn
cyB2ZXJ5IG5vdGljZWFibGUgdGhhdCBhbHRob3VnaCB5b3Ugc2VlbSB0byBoYXZlIGlzb2xhdGVk
IGEgYnVnIGluCj4+Pj4+Pj4+Pj4+Pj4+PiB0aGUgcG93ZXIgbWFuYWdlbWVudCBzdWJzeXN0ZW0g
KHN1cHBsaWVyIGdvZXMgaW50byBydW50aW1lIHN1c3BlbmQKPj4+Pj4+Pj4+Pj4+Pj4+IGV2ZW4g
d2hlbiBvbmUgb2YgaXRzIGNvbnN1bWVycyBpcyBzdGlsbCBhY3RpdmUpLCB5b3UgZGlkIG5vdCBD
QyB0aGUKPj4+Pj4+Pj4+Pj4+Pj4+IHBvd2VyIG1hbmFnZW1lbnQgbWFpbnRhaW5lciBvciBtYWls
aW5nIGxpc3QuCj4+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+Pj4gSSBoYXZlIGFkZGVkIHRo
ZSBhcHByb3ByaWF0ZSBDQydzLgo+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+PiBUaGFua3Mg
QWxhbiEKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBI
ZWxsbwo+Pj4+Pj4+Pj4+PiBJICYgQ2FuICh0aGFua3MgQ2FuRykgZGVidWdnZWQgdGhpcyBmdXJ0
aGVyOgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBMb29rcyBsaWtlIHRoaXMgaXNzdWUgY2FuIG9j
Y3VyIGlmIHRoZSBzZCBwcm9iZSBpcyBhc3luY2hyb25vdXMuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4+IEVzc2VudGlhbGx5LCB0aGUgc2RfcHJvYmUoKSBpcyBkb25lIGFzeW5jaHJvbm91c2x5IGFu
ZCBkcml2ZXJfcHJvYmVfZGV2aWNlKCkgaW52b2tlcyBwbV9ydW50aW1lX2dldF9zdXBwbGllcnMo
KSBiZWZvcmUgaW52b2tpbmcgc2RfcHJvYmUoKS4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gQnV0
IHNjc2lfcHJvYmVfYW5kX2FkZF9sdW4oKSBydW5zIGluIGEgc2VwYXJhdGUgY29udGV4dC4KPj4+
Pj4+Pj4+Pj4gU28gdGhlIHNjc2lfYXV0b3BtX3B1dF9kZXZpY2UoKSBpbnZva2VkIGZyb20gc2Nz
aV9zY2FuX2hvc3QoKSBjb250ZXh0IHJlZHVjZXMgdGhlIGxpbmstPnJwbV9hY3RpdmUgdG8gMS4g
QW5kIHNkX3Byb2JlKCkgaW52b2tlcyBzY3NpX2F1dG9wbV9wdXRfZGV2aWNlKCkgYW5kIHN0YXJ0
cyBhIHRpbWVyLiBBbmQgdGhlbiBkcml2ZXJfcHJvYmVfZGV2aWNlKCkgaW52b2tlZCBmcm9tIF9f
ZGV2aWNlX2F0dGFjaF9hc3luY19oZWxwZXIgY29udGV4dCByZWR1Y2VzIHRoZSBsaW5rLT5ycG1f
YWN0aXZlIHRvIDEgdGh1cyBlbmFibGluZyB0aGUgc3VwcGxpZXIgdG8gc3VzcGVuZCBiZWZvcmUg
dGhlIGNvbnN1bWVyIHN1c3BlbmRzLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBTbyBpZjoKPj4+
Pj4+Pj4+Pj4gQ29udGV4dCBUMToKPj4+Pj4+Pj4+Pj4gWzFdIHNjc2lfcHJvYmVfYW5kX2FkZF9s
dW4oKQo+Pj4+Pj4+Pj4+PiBbMl3CoMKgwqAgfC0gc2NzaV9hdXRvcG1fcHV0X2RldmljZSgpIC0g
cmVkdWNlIHRoZSBsaW5rLT5ycG1fYWN0aXZlIHRvIDEKPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4g
Q29udGV4dCBUMjoKPj4+Pj4+Pj4+Pj4gX19kZXZpY2VfYXR0YWNoX2FzeW5jX2hlbHBlcigpCj4+
Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCB8LSBkcml2ZXJfcHJvYmVfZGV2aWNlKCkKPj4+Pj4+
Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfC0gc2RfcHJvYmUoKQo+Pj4+Pj4+Pj4+PiBJ
biBiZXR3ZWVuIFsxXSBhbmQgWzJdIHNheSwgZHJpdmVyX3Byb2JlX2RldmljZSgpIC0+IHNkX3By
b2JlKCkgaXMgaW52b2tlZCBpbiBhIHNlcGFyYXRlIGNvbnRleHQgZnJvbSBfX2RldmljZV9hdHRh
Y2hfYXN5bmNfaGVscGVyKCkuCj4+Pj4+Pj4+Pj4+IFRoZSBkcml2ZXJfcHJvYmVfZGV2aWNlKCkg
LT4gcG1fcnVudGltZV9nZXRfc3VwcGxpZXJzKCkgYnV0IFsyXSB3b3VsZCByZWR1Y2UgbGluay0+
cnBtX2FjdGl2ZSB0byAxLgo+Pj4+Pj4+Pj4+PiBUaGVuIHNkX3Byb2JlKCkgd291bGQgaW52b2tl
IHJwbV9yZXN1bWUoKSBhbmQgcHJvY2VlZCBhcyBpcy4KPj4+Pj4+Pj4+Pj4gV2hlbiBzZF9wcm9i
ZSgpIGludm9rZXMgc2NzaV9hdXRvcG1fcHV0X2RldmljZSgpIGl0J2Qgc3RhcnQgYSB0aW1lciwg
ZGV2LT5wb3dlci50aW1lcl9hdXRvc3VzcGVuZHMgPSAxLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
PiBOb3cgdGhlbiwgcG1fcnVudGltZV9wdXRfc3VwcGxpZXJzKCkgaXMgaW52b2tlZCBmcm9tIGRy
aXZlcl9wcm9iZV9kZXZpY2UoKSBhbmQgdGhhdCBtYWtlcyB0aGUgbGluay0+cnBtX2FjdGl2ZSA9
IDEuCj4+Pj4+Pj4+Pj4+IEJ1dCBieSBub3csIHRoZSBjb3JyZXNwb25kaW5nICdzZCBkZXYnIChj
b25zdW1lcikgdXNhZ2VfY291bnQgPSAwLCBzdGF0ZSA9IFJQTV9BQ1RJVkUgYW5kIGxpbmstPnJw
bV9hY3RpdmUgPSAxLgo+Pj4+Pj4+Pj4+PiBBdCB0aGlzIHBvaW50IG9mIHRpbWUsIGFsbCBvdGhl
ciAnc2QgZGV2JyAoY29uc3VtZXJzKSBfbWF5XyBiZSBzdXNwZW5kZWQgb3IgYWN0aXZlIGJ1dCB3
b3VsZCBoYXZlIHRoZSBsaW5rLT5ycG1fYWN0aXZlID0gMS4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+
IElzIHRoaXMgd2l0aCBETF9GTEFHX1JQTV9BQ1RJVkU/wqAgSW4gdGhhdCBjYXNlLCB3b3VsZG4n
dCBhY3RpdmUKPj4+Pj4+Pj4+PiBjb25zdW1lcnMgaGF2ZSBsaW5rLT5ycG1fYWN0aXZlID0gMiBh
bmQgYWxzbyBoYXZlIGluY3JlbWVudGVkCj4+Pj4+Pj4+Pj4gdGhlIHN1cHBsaWVyJ3MgdXNhZ2Vf
Y291bnQ/Cj4+Pj4+Pj4KPj4+Pj4+PiBZZXMgdGhpcyBpcyB3aXRoIERMX0ZMQUdfUlBNX0FDVElW
RS4KPj4+Pj4+Pgo+Pj4+Pj4+IFBsZWFzZSBsZXQgbWUgc2hhcmUgYSBsb2cgaGVyZToKPj4+Pj4+
PiBCRUYgbWVhbnMgLSBCZWZvcmUsIEFGVCBtZWFucyBBZnRlci4KPj4+Pj4+Pgo+Pj4+Pj4+IFvC
oMKgwqAgNi44NDM0NDVdW8KgwqDCoCBUN10gc2NzaSAwOjA6MDo0OiBbVUZTREJHXTogdWZzaGNk
X3NldHVwX2xpbmtzOjQ3Nzk6wqAgc3VwcDogdXNhZ2VfY250OiAzIExpbmsgLSAwOjA6MDo0OTQ4
OCBsaW5rLXJwbV9hY3RpdmU6IDIgYXZhaWxfbHVuczogNQo+Pj4+Pj4+IFvCoMKgwqAgNi44OTI1
NDVdW8KgwqDCoCBUN10gc2NzaSAwOjA6MDo0OiBwbV9ydW50aW1lX2dldF9zdXBwbGllcnM6ICgw
OjA6MDo0OTQ4OCk6IHN1cHA6IHVzYWdlX2NvdW50OiA1IHJwbV9hY3RpdmU6IDQKPj4+Pj4+Pgo+
Pj4+Pj4+IEluIHRoZSBhYm92ZSBsb2csIFQ3IGlzIHRoZSBjb250ZXh0IGluIHdoaWNoIHRoaXMg
c2NzaSBkZXZpY2UgaXMgYmVpbmcgYWRkZWQgLSBzY3NpX3N5c2ZzX2FkZF9zZGV2KCkKPj4+Pj4+
Pgo+Pj4+Pj4+IFvCoMKgwqAgNi45MzE4NDZdW8KgwqDCoCBUN10gdWZzX3JwbWJfd2x1biAwOjA6
MDo0OiBbVUZTREJHXTogdWZzaGNkX3JwbWJfcHJvYmU6OTY5MjogaW52b2tlZAo+Pj4+Pj4+IFvC
oMKgwqAgNi45NDEyNDZdW8KgwqDCoCBUN10gc2NzaSAwOjA6MDo0OiBwbV9ydW50aW1lX3B1dF9z
dXBwbGllcnM6IHJwbV9hY3RpdmU6IDQKPj4+Pj4+Pgo+Pj4+Pj4+IFvCoMKgwqAgNi45NDEyNDZd
W8KgwqDCoCBUN10gc2NzaSAwOjA6MDo0OiBwbV9ydW50aW1lX3B1dF9zdXBwbGllcnM6ICgwOjA6
MDo0OTQ4OCkgW0JFRl0gdXNhZ2VfY291bnQ6IDUKPj4+Pj4+PiBbwqDCoMKgIDYuOTQxMjQ3XVvC
oMKgwqAgVDddIHNjc2kgMDowOjA6NDogcG1fcnVudGltZV9wdXRfc3VwcGxpZXJzOiAoMDowOjA6
NDk0ODgpIFtBRlRdIHVzYWdlX2NvdW50OiA0IHJwbV9hY3RpdmU6IDMKPj4+Pj4+Pgo+Pj4+Pj4+
IFvCoMKgwqAgNi45NDEyNjddW8KgwqDCoCBUN10gc2NzaSAwOjA6MDo0OiBycG1fcHV0X3N1cHBs
aWVyczogW0JFRl0gU3VwcCAoMDowOjA6NDk0ODgpIHVzYWdlX2NvdW50OiA0IHJwbV9hY3RpdmU6
IDMKPj4+Pj4+Pgo+Pj4+Pj4+IC0tLS0tLSBUMTk2IENvbnRleHQgY29tZXMgaW4gd2hpbGUgVDcg
aXMgcnVubmluZyAtLS0tLS0tLS0tCj4+Pj4+Pj4gW8KgwqDCoCA2Ljk0MTQ2Nl1bwqAgVDE5Nl0g
c2NzaSAwOjA6MDo0OiBwbV9ydW50aW1lX2dldF9zdXBwbGllcnM6ICgwOjA6MDo0OTQ4OCk6IHN1
cHA6IHVzYWdlX2NvdW50OiA1IHJwbV9hY3RpdmU6IDQKPj4+Pj4+PiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4+Pj4+Cj4+
Pj4+Pj4gW8KgwqDCoCA3Ljc4ODM5N11bwqDCoMKgIFQ3XSBzY3NpIDA6MDowOjQ6IHJwbV9wdXRf
c3VwcGxpZXJzOiBbQUZUXSBTdXBwICgwOjA6MDo0OTQ4OCkgdXNhZ2VfY291bnQ6IDIgcnBtX2Fj
dGl2ZTogMQo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gLS0gCj4+Pj4+Pj4K
Pj4+Pj4+PiBUMTk2IGlzIHRoZSBjb250ZXh0IGluIHdoaWNoIHNkX3Byb2JlKCkgaXMgaW52b2tl
ZCBmb3IgdGhpcyBzY3NpIGRldmljZS4KPj4+Pj4+Pgo+Pj4+Pj4+IFvCoMKgwqAgNy45NzQ0MTBd
W8KgIFQxOTZdIHNkIDA6MDowOjQ6IFtzZGVdIEF0dGFjaGVkIFNDU0kgZGlzawo+Pj4+Pj4+IFvC
oMKgwqAgNy45ODQxODhdW8KgIFQxOTZdIHNkIDA6MDowOjQ6IHBtX3J1bnRpbWVfcHV0X3N1cHBs
aWVyczogcnBtX2FjdGl2ZTogMgo+Pj4+Pj4+IFvCoMKgwqAgNy45OTg0MjRdW8KgIFQxOTZdIHNk
IDA6MDowOjQ6IHBtX3J1bnRpbWVfcHV0X3N1cHBsaWVyczogKDA6MDowOjQ5NDg4KSBbQkVGXSB1
c2FnZV9jb3VudDogNAo+Pj4+Pj4+IFvCoMKgwqAgOC4wMTczMjBdW8KgIFQxOTZdIHNkIDA6MDow
OjQ6IHBtX3J1bnRpbWVfcHV0X3N1cHBsaWVyczogKDA6MDowOjQ5NDg4KSBbQUZUXSB1c2FnZV9j
b3VudDogMSBycG1fYWN0aXZlOiAxCj4+Pj4+Pj4KPj4+Pj4+PiBUaGUgcmVmZXJlbmNlIHRvIHRo
ZSBsaW5rIGlzIHJlbGVhc2VkIGFmdGVyIHNkX3Byb2JlKCkgaXMgY29tcGxldGVkLgo+Pj4+Pj4+
IEF0IHRoaXMgcG9pbnQsIHRoZSBycG1fYWN0aXZlIHNob3VsZCBiZSAyLiBBbmQgdGhlIHJwbV9h
Y3RpdmUgc2hvdWxkIGJlY29tZSAxIHdoZW4gc2QgMDowOjA6NCBhY3R1YWxseSBzdXNwZW5kcy4g
QnV0IGF0IHRoZSBlbmQgb2Ygc2RfcHJvYmUoKSB0aGUgc3VzcGVuZCBpcyBvbmx5IHNjaGVkdWxl
ZC4gSG93ZXZlciB0aGUgc3VwcGxpZXIgaXMgbm93IGZyZWUgdG8gc3VzcGVuZC4KPj4+Pj4+Pgo+
Pj4+Pj4+IEluIHRoaXMgbG9nLCB0aGUgdXNhZ2VfY291bnQgb2Ygc3VwcGxpZXIgYmVjb21lcyAw
IGhlcmU6Cj4+Pj4+Pj4gW8KgwqAgMTEuOTYzODg1XVvCoCBUMTE3XSBzZCAwOjA6MDo3OiBycG1f
cHV0X3N1cHBsaWVyczogW0JFRl0gU3VwcCAoMDowOjA6NDk0ODgpIHVzYWdlX2NvdW50OiAxIHJw
bV9hY3RpdmU6IDIKPj4+Pj4+PiBbwqDCoCAxMS45NzM4MjFdW8KgIFQxMTddIHNkIDA6MDowOjc6
IHJwbV9wdXRfc3VwcGxpZXJzOiBbQUZUXSBTdXBwICgwOjA6MDo0OTQ4OCkgdXNhZ2VfY291bnQ6
IDAgcnBtX2FjdGl2ZTogMQo+Pj4+Pj4+Cj4+Pj4+Pj4gSG93ZXZlciwgdGhlIGNvbnN1bWVyIHNk
IDA6MDowOjQgaXMgc3RpbGwgYWN0aXZlIGJ1dCBoYXMgcmVsZWFzZWQgdGhlIHJlZmVyZW5jZSB0
byB0aGUgc3VwcGxpZXI6Cj4+Pj4+Pgo+Pj4+Pj4gSWYgdGhhdCBpcyB0aGUgY2FzZSwgdGhlbiBp
dCBpcyBhbiBlcnJvciBpbiBQTSBub3QgVUZTLgo+Pj4+Pj4KPj4+Pj4+IEEgc2Vjb25kIGxvb2sg
YXQgdGhlIGNvZGUgYXJvdW5kIHJwbV9wdXRfc3VwcGxpZXJzKCkgZG9lcyBsb29rCj4+Pj4+PiBw
b3RlbnRpYWxseSByYWN5LCBzaW5jZSB0aGVyZSBkb2VzIG5vdCBhcHBlYXIgdG8gYmUgYW55dGhp
bmcKPj4+Pj4+IHN0b3BwaW5nIHRoZSBydW50aW1lX3N0YXR1cyBjaGFuZ2luZyBiZXR3ZWVuCj4+
Pj4+PiBzcGluX3VubG9ja19pcnEoJmRldi0+cG93ZXIubG9jaykgYW5kIGRldmljZV9saW5rc19y
ZWFkX2xvY2soKS4KPj4+Pj4+Cj4+Pj4+PiBSYWZhZWwsIGNhbiB5b3UgY29tbWVudD8KPj4+Pj4K
Pj4+Pj4gSW5kZWVkLCBpZiB0aGUgZGV2aWNlIGlzIHN1c3BlbmRpbmcsIGNoYW5naW5nIGl0cyBQ
TS1ydW50aW1lIHN0YXR1cyB0bwo+Pj4+PiBSUE1fU1VTUEVOREVEIGFuZCBkcm9wcGluZyBpdHMg
cG93ZXIubG9jayBhbGxvd3MgYSBjb25jdXJyZW50Cj4+Pj4+IHJwbV9yZXN1bWUoKSB0byBydW4g
YW5kIHJlc3VtZSB0aGUgZGV2aWNlIGJlZm9yZSB0aGUgc3VwcGxpZXJzIGNhbiBiZQo+Pj4+PiBz
dXNwZW5kZWQuCj4+Pj4+Cj4+Pj4+IFRoYXQncyBpbmNvcnJlY3QgYW5kIGhhcyBiZWVuIGludHJv
ZHVjZWQgYnkgY29tbWl0IDQ0Y2M4OWY3NjQ2NCAoIlBNOgo+Pj4+PiBydW50aW1lOiBVcGRhdGUg
ZGV2aWNlIHN0YXR1cyBiZWZvcmUgbGV0dGluZyBzdXBwbGllcnMgc3VzcGVuZCIpLgo+Pj4+Pgo+
Pj4+PiBJdCBpcyBwcm9iYWJseSBiZXR0ZXIgdG8gcmV2ZXJ0IHRoYXQgY29tbWl0IGFuZCBhZGRy
ZXNzIHRoZSBvcmlnaW5hbAo+Pj4+PiBpc3N1ZSBpbiBhIGRpZmZlcmVudCB3YXkuCj4+Pj4+Cj4+
Pj4gSGVsbG8sCj4+Pj4gT25lIGFwcHJvYWNoIHRvIGFkZHJlc3MgdGhlIG9yaWdpbmFsIGlzc3Vl
IGNvdWxkIGJlIHRvIHByZXZlbnQgdGhlIHNjc2kKPj4+PiBkZXZpY2VzIGZyb20gc3VzcGVuZGlu
ZyB1bnRpbCB0aGUgcHJvYmUgaXMgY29tcGxldGVkLCBwZXJoYXBzPwo+Pj4KPj4+IEkgd2FzIHRh
bGtpbmcgYWJvdXQgdGhlIG9yaWdpbmFsIGlzc3VlIHRoYXQgY29tbWl0IDQ0Y2M4OWY3NjQ2NAo+
Pj4gYXR0ZW1wdGVkIHRvIGFkZHJlc3MuCj4+Pgo+Pj4gSSdtIG5vdCBzdXJlIGlmIGFuZCBob3cg
aXQgaXMgcmVsYXRlZCB0byB0aGUgaXNzdWUgeW91IGhhdmUgYmVlbiBkZWJ1Z2dpbmcuCj4+Pgo+
PiBIaSBSYWZhZWwKPj4gVGhhbmtzIGZvciBjbGFyaWZ5aW5nIHRoYXQuCj4+IFVuZGVyc3Rvb2Qu
Cj4+IEkgd2FzIHJlZmVycmluZyB0byB0aGUgaXNzdWUgdGhhdCBJJ3ZlIGJlZW4gZGlzY3Vzc2lu
ZyB3aXRoIEFkcmlhbi4KPiAKPiBGb3IgdGVzdCBwdXJwb3NlcywgeW91IGNvdWxkIHRyeSByZXZl
cnRpbmcgNDRjYzg5Zjc2NDY0LCBtYWtpbmcgdGhlCj4gb3RoZXIgY2hhbmdlcyB0byB0aGUgVUZT
IGRyaXZlciwgYW5kIHNlZSBpZiB0aGUgZGV2aWNlX2xpbmtzIGlzc3VlCj4gZ29lcyBhd2F5Lgo+
IApIaSBBZHJpYW4KClRoYW5rcyBmb3IgdGhlIHJldmlldyBhbmQgY29tbWVudHMuCgpJIGFkZHJl
c3NlZCB0aGUgY29tbWVudHMgYW5kIHRlc3RlZCBpdC4gSSBzdGlsbCBzZWUgdGhlIGRldmljZV9s
aW5rcyAKaXNzdWUuIEkndmUgcHVzaGVkIHRoZSBjaGFuZ2UgdGhhdCBJIHRlc3RlZCBhcyB2MTIu
CgojIGdyZXAgLUggLiAvc3lzL2J1cy9zY3NpL2RldmljZXMvKi9wb3dlci9ydW50aW1lX3N0YXR1
cyAKICAgICAgICAgIDwKL3N5cy9idXMvc2NzaS9kZXZpY2VzLzA6MDowOjAvcG93ZXIvcnVudGlt
ZV9zdGF0dXM6c3VzcGVuZGluZyA8Ci9zeXMvYnVzL3Njc2kvZGV2aWNlcy8wOjA6MDoxL3Bvd2Vy
L3J1bnRpbWVfc3RhdHVzOnN1c3BlbmRlZAovc3lzL2J1cy9zY3NpL2RldmljZXMvMDowOjA6Mi9w
b3dlci9ydW50aW1lX3N0YXR1czpzdXNwZW5kZWQKL3N5cy9idXMvc2NzaS9kZXZpY2VzLzA6MDow
OjMvcG93ZXIvcnVudGltZV9zdGF0dXM6c3VzcGVuZGluZyA8Ci9zeXMvYnVzL3Njc2kvZGV2aWNl
cy8wOjA6MDo0L3Bvd2VyL3J1bnRpbWVfc3RhdHVzOnN1c3BlbmRpbmcgPAovc3lzL2J1cy9zY3Np
L2RldmljZXMvMDowOjA6NDk0NTYvcG93ZXIvcnVudGltZV9zdGF0dXM6c3VzcGVuZGVkCi9zeXMv
YnVzL3Njc2kvZGV2aWNlcy8wOjA6MDo0OTQ3Ni9wb3dlci9ydW50aW1lX3N0YXR1czpzdXNwZW5k
ZWQKL3N5cy9idXMvc2NzaS9kZXZpY2VzLzA6MDowOjQ5NDg4L3Bvd2VyL3J1bnRpbWVfc3RhdHVz
OnN1c3BlbmRlZCA8CgpJIHRoaW5rIGl0IGNvdWxkbid0IHJlc29sdmUgdGhlIGlzc3VlIGJlY2F1
c2Ugd2UncmUgbm90IHN0b3BwaW5nIHRoZSAKc2NzaSBkZXZpY2VzIGZyb20gc3VzcGVuZGluZyBh
ZnRlciB0aGUgYXN5bmMgcHJvYmUgaXMgc2NoZWR1bGVkLgoKLWFzZAoKLS0gClRoZSBRdWFsY29t
bSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiB0aGUgQ29kZSBBdXJvcmEg
Rm9ydW0sCkxpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
