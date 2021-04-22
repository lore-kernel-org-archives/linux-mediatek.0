Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3448C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 16:39:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A9536141C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 16:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A9536141C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zwBy3PVY7pDB+ICpO5DD3tl/2+Pj+ITeXnEMpHfKFDI=; b=p9fVKI91nCMjKO5PFRZUwOJ17
	B41UKOHzt+vmvsxwuc4zkzoWaNAxAXH3geROFll9mvsrnPwxLLmRAbiIVMF4RCUiLlyDOZx6V1Nx5
	PJCUFl7DxhzC0BTTd7vjNnxele7Smc/Kh4Wij0/7uLA+xcPA1rnKCZZeaTv4JazWMjgpNjAo49ptd
	zjl8zNwjQEatIc/g/V9Kx6T5bxjWJAWWrLakib1lUS+yzR/4hzjzog6i0EYduekD5o7qDQf/20o6m
	Qj/fx02WA2v0n9FU6Ldh3r5hCtUj+2FndlT4z841SQ1BQJ51zIX+aUHM3Yims2vRZ8hg/KELcXVN7
	BItbWeWOA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZcMY-00H6fb-SP; Thu, 22 Apr 2021 16:39:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZcMX-00H6fT-9s
 for linux-mediatek@desiato.infradead.org; Thu, 22 Apr 2021 16:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=/mm9WV2bjsZbhbPwSCfsNxlMTHiCooMD2kmhdaXn4IY=; b=yKcFhdMcF+vXeHzqbvi7LZHg0I
 Ny8ewCJYNcm1ITXW62S8HubU0F8XL+/X3PiPb74scaNrbMj/nnI6gkev4S9sck9ZNHifU+gvbRl2P
 XyffCwU9uAuqLk+tXDUhwpc3EUksTIx5pr8XWsX+/OUMMEdMPITtsMBbp5xMppEklDiRMLQZpeNnG
 BbkLlyka/k5kcC/Z34k/JLDjSpAua37a3yUbG2n37MFToMSOaz1C7heC8YPuW4CgU8U5OEujNU8Ci
 v2QeekLI6bl6aU2MSCBebND4fhS3EyEqBxSTvx7ZJipmz64cObtuUw5LmecI1OsrvPFuaLh3MW7Ny
 Q6VftypA==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZcMT-00Dqwp-3E
 for linux-mediatek@lists.infradead.org; Thu, 22 Apr 2021 16:39:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619109570; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=/mm9WV2bjsZbhbPwSCfsNxlMTHiCooMD2kmhdaXn4IY=;
 b=Ot7VKYBwH3GpG36JPrQZ3zGMjNsDA6gxzJLF36+LCZrw/pC2L0NI4OU68kpXnGQNbjXu9aCd
 KOpBlyd+ddH6BrS9ZAyNnXZf9h+LM1OcwTkEhYpoRQ6Mr35SpNkzwpOxKX/E4z7KwSoYCckA
 iS+hOGqZqYGRUScsOicyp3Lt5qg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6081a6a8febcffa80f1a8b44 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Apr 2021 16:39:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 37981C43148; Thu, 22 Apr 2021 16:39:03 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 71B2FC433F1;
 Thu, 22 Apr 2021 16:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 71B2FC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v20 1/2] scsi: ufs: Enable power management for wlun
To: Adrian Hunter <adrian.hunter@intel.com>, cang@codeaurora.org,
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
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <651f5d8a-5ab7-77dd-3fed-05feb3fd3e1a@codeaurora.org>
Date: Thu, 22 Apr 2021 09:38:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1bc4a73e-b22a-6bad-2583-3a0ffa979414@intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_093930_431338_CD8A45EA 
X-CRM114-Status: GOOD (  21.81  )
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

T24gNC8yMC8yMDIxIDEyOjQyIEFNLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+IE9uIDIwLzA0LzIx
IDc6MTUgYW0sIEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4+IE9uIDIwLzA0LzIxIDEyOjUzIGFtLCBB
c3V0b3NoIERhcyAoYXNkKSB3cm90ZToKPj4+IE9uIDQvMTkvMjAyMSAxMTozNyBBTSwgQWRyaWFu
IEh1bnRlciB3cm90ZToKPj4+PiBPbiAxNi8wNC8yMSAxMDo0OSBwbSwgQXN1dG9zaCBEYXMgd3Jv
dGU6Cj4+Pj4+Cj4+Pj4+IENvLWRldmVsb3BlZC1ieTogQ2FuIEd1byA8Y2FuZ0Bjb2RlYXVyb3Jh
Lm9yZz4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2FuIEd1byA8Y2FuZ0Bjb2RlYXVyb3JhLm9yZz4K
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQXN1dG9zaCBEYXMgPGFzdXRvc2hkQGNvZGVhdXJvcmEub3Jn
Pgo+Pj4+PiAtLS0KPj4+Pgo+Pj4+IEkgY2FtZSBhY3Jvc3MgMyBpc3N1ZXMgd2hpbGUgdGVzdGlu
Zy7CoCBTZWUgY29tbWVudHMgYmVsb3cuCj4+Pj4KPj4+IEhpIEFkcmlhbgo+Pj4gVGhhbmtzIGZv
ciB0aGUgY29tbWVudHMuCj4+Pj4gPFNOSVA+Cj4+Pj4KPj4+Pj4gQEAgLTU3OTQsNyArNTgzOSw3
IEBAIHN0YXRpYyB2b2lkIHVmc2hjZF9lcnJfaGFuZGxpbmdfdW5wcmVwYXJlKHN0cnVjdCB1ZnNf
aGJhICpoYmEpCj4+Pj4+ICDCoMKgwqDCoMKgIGlmICh1ZnNoY2RfaXNfY2xrc2NhbGluZ19zdXBw
b3J0ZWQoaGJhKSkKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCB1ZnNoY2RfY2xrX3NjYWxpbmdf
c3VzcGVuZChoYmEsIGZhbHNlKTsKPj4+Pj4gIMKgwqDCoMKgwqAgdWZzaGNkX2NsZWFyX3VhX3ds
dW5zKGhiYSk7Cj4+Pj4KPj4+PiB1ZnNoY2RfY2xlYXJfdWFfd2x1bnMoKSBkZWFkbG9ja3MgdHJ5
aW5nIHRvIGNsZWFyIFVGU19VUElVX1JQTUJfV0xVTgo+Pj4+IGlmIHNkZXZfcnBtYiBpcyBzdXNw
ZW5kZWQgYW5kIHNkZXZfdWZzX2RldmljZSBpcyBzdXNwZW5kaW5nLgo+Pj4+IGUuZy4gdWZzaGNk
X3dsX3N1c3BlbmQoKSBpcyB3YWl0aW5nIG9uIGhvc3Rfc2VtIHdoaWxlIHVmc2hjZF9lcnJfaGFu
ZGxlcigpCj4+Pj4gaXMgcnVubmluZywgYXQgd2hpY2ggcG9pbnQgc2Rldl9ycG1iIGhhcyBhbHJl
YWR5IHN1c3BlbmRlZC4KPj4+Pgo+Pj4gVW1tLCBJIGRpZG4ndCB1bmRlcnN0YW5kIHRoaXMgZGVh
ZGxvY2suCj4+PiBXaGVuIHlvdSBzYXksIHNkZXZfcnBtYiBpcyBzdXNwZW5kZWQsIGRvZXMgaXQg
bWVhbiBydW50aW1lX3N1c3BlbmRlZD8KPj4+IHNkZXZfdWZzX2RldmljZSBpcyBzdXNwZW5kaW5n
IC0gdGhpcyBjYW4ndCBiZSBydW50aW1lX3N1c3BlbmRpbmcsIHdoaWxlIHVmc2hjZF9lcnJfaGFu
ZGxpbmdfdW5wcmVwYXJlIGlzIHJ1bm5pbmcuCj4+Pgo+Pj4gSWYgeW91J3ZlIGEgY2FsbC1zdGFj
ayBvZiB0aGlzIGRlYWRsb2NrLCBwbGVhc2UgY2FuIHlvdSBzaGFyZSBpdCB3aXRoIG1lLiBJJ2xs
IGFsc28gdHJ5IHRvIHJlcHJvZHVjZSB0aGlzLgo+Pgo+PiBZZXMgaXQgaXMgc3lzdGVtIHN1c3Bl
bmQuIHNkZXZfcnBtYiBoYXMgc3VzcGVuZGVkLCBzZGV2X3Vmc19kZXZpY2UgaXMgd2FpdGluZyBv
biBob3N0X3NlbS4KPj4gdWZzaGNkX2Vycl9oYW5kbGVyKCkgaG9sZHMgaG9zdF9zZW0uIHVmc2hj
ZF9jbGVhcl91YV93bHVuKFVGU19VUElVX1JQTUJfV0xVTikgZ2V0cyBzdHVjay4KPj4gSSB3aWxs
IGdldCBzb21lIGNhbGwtc3RhY2tzLgo+IApIaSBBZHJpYW4sCgpUaGFua3MgZm9yIHRoZSBjYWxs
IHN0YWNrcy4KIEZyb20gdGhlIGN1cnJlbnQgaW5mb3JtYXRpb24sIEkgY2FuJ3Qgc2F5IGZvciBz
dXJlIHdoeSBpdCdkIGdldCBzdHVjayAKaW4gYmxrX3F1ZXVlX2VudGVyKCkuCgpJIHRyaWVkIHJl
cHJvZHVjaW5nIHRoaXMgaXNzdWUgb24gbXkgc2V0dXAgeWVzdGVyZGF5IGJ1dCBjb3VsZG4ndC4K
SGVyZSdzIHdoYXQgSSBkaWQ6CjEuIHNkZXZfcnBtYiBpcyBSUE1fU1VTUEVOREVELCBjaGVja2Vk
IGJlZm9yZSBpbml0aWF0aW5nIHN5c3RlbSBzdXNwZW5kCjIuIHNkZXZfdWZzX2RldmljZSBpcyBS
UE1fUkVTVU1FRAozLiBJIHRyaWdnZXJlZCBzeXN0ZW0gc3VzcGVuZCAoZWNobyBtZW0gPiAvc3lz
L3Bvd2VyL3N0YXRlKSBhbmQgCnNjaGVkdWxlZCB0aGUgZXJyb3IgaGFuZGxlciBmcm9tIHVmc2hj
ZF93bF9zdXNwZW5kKCkuCjQuIFdhaXRlZCB1bnRpbCBlcnJvciBoYW5kbGVyIHJhbiBhbmQgdGhl
biB1ZnNoY2Rfd2xfc3VzcGVuZCgpIGJsb2NrcyBvbiAKaG9zdF9zZW0uCjUuIFRoZSB1ZnNoY2Rf
Y2xlYXJfd2Ffd2x1bihVRlNfVVBJVV9SUE1CX1dMVU4pIHdlbnQgdGhyb3VnaCBmaW5lLgoKRG8g
eW91J3ZlIHNvbWUgc3BlY2lmaWMgc3RlcHMgdG8gcmVwcm9kdWNlIHRoaXMgb3IgYSBzY3JpcHQs
IHBlcmhhcHM/IElmIApzbywgcGxlYXNlIGNhbiB5b3Ugc2hhcmUgaXQgd2l0aCBtZS4gSSB3aWxs
IHRyeSBhZ2Fpbi4KTXkgdGVzdCBlbnZpcm9ubWVudCBpcyBpbiA1LjEwIGtlcm5lbCB3aXRoIEFu
ZHJvaWQsIEkgc3VwcG9zZSB0aGF0IApzaG91bGQgYmUgb2sgdGhvdWdoLgoKVGhhbmtzCi1hc2QK
Cj4gSGVyZSBhcmUgdGhlIGNhbGwgc3RhY2tzCj4gCj4gWyAgIDM0LjA5NDMyMV0gV29ya3F1ZXVl
OiB1ZnNfZWhfd3FfMCB1ZnNoY2RfZXJyX2hhbmRsZXIKPiBbICAgMzQuMDk0Nzg4XSBDYWxsIFRy
YWNlOgo+IFsgICAzNC4wOTUyODFdICBfX3NjaGVkdWxlKzB4Mjc1LzB4NmMwCj4gWyAgIDM0LjA5
NTc0M10gIHNjaGVkdWxlKzB4NDEvMHhhMAo+IFsgICAzNC4wOTYyNDBdICBibGtfcXVldWVfZW50
ZXIrMHgxMGQvMHgyMzAKPiBbICAgMzQuMDk2NjkzXSAgPyB3YWl0X3dva2VuKzB4NzAvMHg3MAo+
IFsgICAzNC4wOTcxNjddICBibGtfbXFfYWxsb2NfcmVxdWVzdCsweDUzLzB4YzAKPiBbICAgMzQu
MDk3NjEwXSAgYmxrX2dldF9yZXF1ZXN0KzB4MWUvMHg2MAo+IFsgICAzNC4wOTgwNTNdICBfX3Nj
c2lfZXhlY3V0ZSsweDNjLzB4MjYwCj4gWyAgIDM0LjA5ODUyOV0gIHVmc2hjZF9jbGVhcl91YV93
bHVuLmNvbGQrMHhhNi8weDE0Ygo+IFsgICAzNC4wOTg5NzddICB1ZnNoY2RfY2xlYXJfdWFfd2x1
bnMucGFydC4wKzB4NGQvMHg5Mgo+IFsgICAzNC4wOTk0NTZdICB1ZnNoY2RfZXJyX2hhbmRsZXIr
MHg5N2EvMHg5ZmYKPiBbICAgMzQuMDk5OTAyXSAgcHJvY2Vzc19vbmVfd29yaysweDFjYy8weDM2
MAo+IFsgICAzNC4xMDAzODRdICB3b3JrZXJfdGhyZWFkKzB4NDUvMHgzYjAKPiBbICAgMzQuMTAw
ODUxXSAgPyBwcm9jZXNzX29uZV93b3JrKzB4MzYwLzB4MzYwCj4gWyAgIDM0LjEwMTMwOF0gIGt0
aHJlYWQrMHhmNi8weDEzMAo+IFsgICAzNC4xMDE3MjhdICA/IGt0aHJlYWRfcGFyaysweDgwLzB4
ODAKPiBbICAgMzQuMTAyMTg2XSAgcmV0X2Zyb21fZm9yaysweDFmLzB4MzAKPiAKPiBbICAgMzQu
NjQwNzUxXSB0YXNrOmt3b3JrZXIvdTEwOjkgICBzdGF0ZTpEIHN0YWNrOjE0NTI4IHBpZDogIDI1
NSBwcGlkOiAgICAgMiBmbGFnczoweDAwMDA0MDAwCj4gWyAgIDM0LjY0MTI1M10gV29ya3F1ZXVl
OiBldmVudHNfdW5ib3VuZCBhc3luY19ydW5fZW50cnlfZm4KPiBbICAgMzQuNjQxNzIyXSBDYWxs
IFRyYWNlOgo+IFsgICAzNC42NDIyMTddICBfX3NjaGVkdWxlKzB4Mjc1LzB4NmMwCj4gWyAgIDM0
LjY0MjY4M10gIHNjaGVkdWxlKzB4NDEvMHhhMAo+IFsgICAzNC42NDMxNzldICBzY2hlZHVsZV90
aW1lb3V0KzB4MThiLzB4MjkwCj4gWyAgIDM0LjY0MzY0NV0gID8gZGVsX3RpbWVyX3N5bmMrMHgz
MC8weDMwCj4gWyAgIDM0LjY0NDEzMV0gIF9fZG93bl90aW1lb3V0KzB4NmIvMHhjMAo+IFsgICAz
NC42NDQ1NjhdICA/IHVmc2hjZF9jbGtzY2FsZV9lbmFibGVfc2hvdysweDIwLzB4MjAKPiBbICAg
MzQuNjQ1MDE0XSAgPyBhc3luY19zY2hlZHVsZV9ub2RlX2RvbWFpbisweDE3ZC8weDE5MAo+IFsg
ICAzNC42NDU0OTZdICBkb3duX3RpbWVvdXQrMHg0Mi8weDUwCj4gWyAgIDM0LjY0NTk0N10gIHVm
c2hjZF93bF9zdXNwZW5kKzB4NzkvMHhhMAo+IFsgICAzNC42NDY0MzJdICA/IHNjbWRfcHJpbnRr
KzB4MTAwLzB4MTAwCj4gWyAgIDM0LjY0NjkxN10gIHNjc2lfYnVzX3N1c3BlbmRfY29tbW9uKzB4
NTYvMHhjMAo+IFsgICAzNC42NDc0MDVdICA/IHNjc2lfYnVzX2ZyZWV6ZSsweDEwLzB4MTAKPiBb
ICAgMzQuNjQ3ODU4XSAgZHBtX3J1bl9jYWxsYmFjaysweDQ1LzB4MTEwCj4gWyAgIDM0LjY0ODM0
N10gIF9fZGV2aWNlX3N1c3BlbmQrMHgxMTcvMHg0NjAKPiBbICAgMzQuNjQ4Nzg4XSAgYXN5bmNf
c3VzcGVuZCsweDE2LzB4OTAKPiBbICAgMzQuNjQ5MjUxXSAgYXN5bmNfcnVuX2VudHJ5X2ZuKzB4
MjYvMHgxMTAKPiBbICAgMzQuNjQ5Njc2XSAgcHJvY2Vzc19vbmVfd29yaysweDFjYy8weDM2MAo+
IFsgICAzNC42NTAxMzddICB3b3JrZXJfdGhyZWFkKzB4NDUvMHgzYjAKPiBbICAgMzQuNjUwNTYz
XSAgPyBwcm9jZXNzX29uZV93b3JrKzB4MzYwLzB4MzYwCj4gWyAgIDM0LjY1MDk5NF0gIGt0aHJl
YWQrMHhmNi8weDEzMAo+IFsgICAzNC42NTE0NTVdICA/IGt0aHJlYWRfcGFyaysweDgwLzB4ODAK
PiBbICAgMzQuNjUxODgyXSAgcmV0X2Zyb21fZm9yaysweDFmLzB4MzAKPiAKPiAKPiAKPj4KPj4+
Cj4+PiBJJ2xsIGFkZHJlc3MgdGhlIG90aGVyIGNvbW1lbnRzIGluIHRoZSBuZXh0IHZlcnNpb24u
Cj4+Pgo+Pj4KPj4+IFRoYW5rIHlvdSEKPj4+Cj4+Pj4+IC3CoMKgwqAgcG1fcnVudGltZV9wdXQo
aGJhLT5kZXYpOwo+Pj4+PiArwqDCoMKgIHVmc2hjZF9ycG1fcHV0KGhiYSk7Cj4+Pj4+ICDCoCB9
Cj4+Pj4KPj4+PiA8U05JUD4KPj4+Pgo+Pj4+PiArdm9pZCB1ZnNoY2RfcmVzdW1lX2NvbXBsZXRl
KHN0cnVjdCBkZXZpY2UgKmRldikKPj4+Pj4gK3sKPj4+Cj4+Cj4gCgoKLS0gClRoZSBRdWFsY29t
bSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiB0aGUgQ29kZSBBdXJvcmEg
Rm9ydW0sCkxpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
