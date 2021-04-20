Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D435C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 07:42:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96A9B613AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 07:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96A9B613AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J/cElvdFMe6hzFP+z5XZSxX2ql8O6dh25ZoWCn+sGac=; b=ld+NwiTtj9aqLtz5VlIzZKMrV
	qqKeH9x60wptvw3ZcxrmficxLx4dg7wS2eeS2zdhJ2qvsbtCclQkD82limLNjOCwTDpnfjQHRbIzw
	dTaz38OKeqvGbLyquqCHL50HFl11cRvoLz3nClNk9h4b/wO07DDK1pgaW4GQ6Xnj3ED5krGSsOEmZ
	8a+OSufW1BmsliqACNHSqZtc4IbFhyzapw8bMex4ppgHPVDwimexX5hjTeJkf7Cj72Zl+BQa1RwsI
	K6Zy9WcPldnC4OsmCOzF6xw1APxSsiGZgteBLXcnNvvqw4QjQWRMwQFJzWmmudEZnHU7ksCv1ptvP
	R/8suUPgg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYl1c-00BV2m-St; Tue, 20 Apr 2021 07:42:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYl1R-00BV1S-C7; Tue, 20 Apr 2021 07:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Vtaz5OojCsVg/F1NmGJlIsjnV00ZKb/NJTJ5i5aBFg0=; b=xutacL1Xdeo9ylHMD2uH6FsNic
 7JeRVeXzhjxCPAXT+PcieyIgHG0n2I5rc8IuixMG/LHKk7Yg5AWud7J+sxQm6O96gpsAyu2D8+wJ9
 1AHrm/NFfF+EuU0b+EjUHjGKLkx3tjgFJ1KAFeiA9S8VYqcgrZ6EPhG1P7nR8Dm26paoGAAYbmH7p
 ytHMTu3T2wyOnBYUtYY0FW9qIziUJiFw/h4uuqCZPrA0ej9SzpGk1LEVIMI8K5OuBGRQM8vqbfjBC
 2QiPrOdsPpyfk3J0EHn8Nlp9a3OellwTYg21Oot1Z1wIoBnEMnGW+tCkevXuO+6axEESoW+gcUjxR
 eDOY0UWQ==;
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYl1K-00BtBQ-T9; Tue, 20 Apr 2021 07:42:11 +0000
IronPort-SDR: I6s06Py/8Xjagspn1VbL1jC66z+/FuijIQyLvK0LmHA7FmD86Afkd3Dnoo2FVvQ0G3mAIwFuQV
 3tjnaBOnHq8w==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="195576103"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="195576103"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 00:42:05 -0700
IronPort-SDR: 630eycZorH3K8PN4kq3rhhrk9E4j2rPjNnDU6tsH/ECPJJuZQCjRasfUswTdXrRAyZCb5RXNvR
 nmxqLdK//Ofw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="420306465"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174])
 ([10.237.72.174])
 by fmsmga008.fm.intel.com with ESMTP; 20 Apr 2021 00:41:55 -0700
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
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <1bc4a73e-b22a-6bad-2583-3a0ffa979414@intel.com>
Date: Tue, 20 Apr 2021 10:42:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <90809796-1c32-3709-13d3-65e4d5c387cc@intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_004207_133429_9950EED8 
X-CRM114-Status: GOOD (  16.07  )
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

T24gMjAvMDQvMjEgNzoxNSBhbSwgQWRyaWFuIEh1bnRlciB3cm90ZToKPiBPbiAyMC8wNC8yMSAx
Mjo1MyBhbSwgQXN1dG9zaCBEYXMgKGFzZCkgd3JvdGU6Cj4+IE9uIDQvMTkvMjAyMSAxMTozNyBB
TSwgQWRyaWFuIEh1bnRlciB3cm90ZToKPj4+IE9uIDE2LzA0LzIxIDEwOjQ5IHBtLCBBc3V0b3No
IERhcyB3cm90ZToKPj4+Pgo+Pj4+IENvLWRldmVsb3BlZC1ieTogQ2FuIEd1byA8Y2FuZ0Bjb2Rl
YXVyb3JhLm9yZz4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDYW4gR3VvIDxjYW5nQGNvZGVhdXJvcmEu
b3JnPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFzdXRvc2ggRGFzIDxhc3V0b3NoZEBjb2RlYXVyb3Jh
Lm9yZz4KPj4+PiAtLS0KPj4+Cj4+PiBJIGNhbWUgYWNyb3NzIDMgaXNzdWVzIHdoaWxlIHRlc3Rp
bmcuwqAgU2VlIGNvbW1lbnRzIGJlbG93Lgo+Pj4KPj4gSGkgQWRyaWFuCj4+IFRoYW5rcyBmb3Ig
dGhlIGNvbW1lbnRzLgo+Pj4gPFNOSVA+Cj4+Pgo+Pj4+IEBAIC01Nzk0LDcgKzU4MzksNyBAQCBz
dGF0aWMgdm9pZCB1ZnNoY2RfZXJyX2hhbmRsaW5nX3VucHJlcGFyZShzdHJ1Y3QgdWZzX2hiYSAq
aGJhKQo+Pj4+IMKgwqDCoMKgwqAgaWYgKHVmc2hjZF9pc19jbGtzY2FsaW5nX3N1cHBvcnRlZCho
YmEpKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB1ZnNoY2RfY2xrX3NjYWxpbmdfc3VzcGVuZCho
YmEsIGZhbHNlKTsKPj4+PiDCoMKgwqDCoMKgIHVmc2hjZF9jbGVhcl91YV93bHVucyhoYmEpOwo+
Pj4KPj4+IHVmc2hjZF9jbGVhcl91YV93bHVucygpIGRlYWRsb2NrcyB0cnlpbmcgdG8gY2xlYXIg
VUZTX1VQSVVfUlBNQl9XTFVOCj4+PiBpZiBzZGV2X3JwbWIgaXMgc3VzcGVuZGVkIGFuZCBzZGV2
X3Vmc19kZXZpY2UgaXMgc3VzcGVuZGluZy4KPj4+IGUuZy4gdWZzaGNkX3dsX3N1c3BlbmQoKSBp
cyB3YWl0aW5nIG9uIGhvc3Rfc2VtIHdoaWxlIHVmc2hjZF9lcnJfaGFuZGxlcigpCj4+PiBpcyBy
dW5uaW5nLCBhdCB3aGljaCBwb2ludCBzZGV2X3JwbWIgaGFzIGFscmVhZHkgc3VzcGVuZGVkLgo+
Pj4KPj4gVW1tLCBJIGRpZG4ndCB1bmRlcnN0YW5kIHRoaXMgZGVhZGxvY2suCj4+IFdoZW4geW91
IHNheSwgc2Rldl9ycG1iIGlzIHN1c3BlbmRlZCwgZG9lcyBpdCBtZWFuIHJ1bnRpbWVfc3VzcGVu
ZGVkPwo+PiBzZGV2X3Vmc19kZXZpY2UgaXMgc3VzcGVuZGluZyAtIHRoaXMgY2FuJ3QgYmUgcnVu
dGltZV9zdXNwZW5kaW5nLCB3aGlsZSB1ZnNoY2RfZXJyX2hhbmRsaW5nX3VucHJlcGFyZSBpcyBy
dW5uaW5nLgo+Pgo+PiBJZiB5b3UndmUgYSBjYWxsLXN0YWNrIG9mIHRoaXMgZGVhZGxvY2ssIHBs
ZWFzZSBjYW4geW91IHNoYXJlIGl0IHdpdGggbWUuIEknbGwgYWxzbyB0cnkgdG8gcmVwcm9kdWNl
IHRoaXMuCj4gCj4gWWVzIGl0IGlzIHN5c3RlbSBzdXNwZW5kLiBzZGV2X3JwbWIgaGFzIHN1c3Bl
bmRlZCwgc2Rldl91ZnNfZGV2aWNlIGlzIHdhaXRpbmcgb24gaG9zdF9zZW0uCj4gdWZzaGNkX2Vy
cl9oYW5kbGVyKCkgaG9sZHMgaG9zdF9zZW0uIHVmc2hjZF9jbGVhcl91YV93bHVuKFVGU19VUElV
X1JQTUJfV0xVTikgZ2V0cyBzdHVjay4KPiBJIHdpbGwgZ2V0IHNvbWUgY2FsbC1zdGFja3MuCgpI
ZXJlIGFyZSB0aGUgY2FsbCBzdGFja3MKClsgICAzNC4wOTQzMjFdIFdvcmtxdWV1ZTogdWZzX2Vo
X3dxXzAgdWZzaGNkX2Vycl9oYW5kbGVyClsgICAzNC4wOTQ3ODhdIENhbGwgVHJhY2U6ClsgICAz
NC4wOTUyODFdICBfX3NjaGVkdWxlKzB4Mjc1LzB4NmMwClsgICAzNC4wOTU3NDNdICBzY2hlZHVs
ZSsweDQxLzB4YTAKWyAgIDM0LjA5NjI0MF0gIGJsa19xdWV1ZV9lbnRlcisweDEwZC8weDIzMApb
ICAgMzQuMDk2NjkzXSAgPyB3YWl0X3dva2VuKzB4NzAvMHg3MApbICAgMzQuMDk3MTY3XSAgYmxr
X21xX2FsbG9jX3JlcXVlc3QrMHg1My8weGMwClsgICAzNC4wOTc2MTBdICBibGtfZ2V0X3JlcXVl
c3QrMHgxZS8weDYwClsgICAzNC4wOTgwNTNdICBfX3Njc2lfZXhlY3V0ZSsweDNjLzB4MjYwClsg
ICAzNC4wOTg1MjldICB1ZnNoY2RfY2xlYXJfdWFfd2x1bi5jb2xkKzB4YTYvMHgxNGIKWyAgIDM0
LjA5ODk3N10gIHVmc2hjZF9jbGVhcl91YV93bHVucy5wYXJ0LjArMHg0ZC8weDkyClsgICAzNC4w
OTk0NTZdICB1ZnNoY2RfZXJyX2hhbmRsZXIrMHg5N2EvMHg5ZmYKWyAgIDM0LjA5OTkwMl0gIHBy
b2Nlc3Nfb25lX3dvcmsrMHgxY2MvMHgzNjAKWyAgIDM0LjEwMDM4NF0gIHdvcmtlcl90aHJlYWQr
MHg0NS8weDNiMApbICAgMzQuMTAwODUxXSAgPyBwcm9jZXNzX29uZV93b3JrKzB4MzYwLzB4MzYw
ClsgICAzNC4xMDEzMDhdICBrdGhyZWFkKzB4ZjYvMHgxMzAKWyAgIDM0LjEwMTcyOF0gID8ga3Ro
cmVhZF9wYXJrKzB4ODAvMHg4MApbICAgMzQuMTAyMTg2XSAgcmV0X2Zyb21fZm9yaysweDFmLzB4
MzAKClsgICAzNC42NDA3NTFdIHRhc2s6a3dvcmtlci91MTA6OSAgIHN0YXRlOkQgc3RhY2s6MTQ1
MjggcGlkOiAgMjU1IHBwaWQ6ICAgICAyIGZsYWdzOjB4MDAwMDQwMDAKWyAgIDM0LjY0MTI1M10g
V29ya3F1ZXVlOiBldmVudHNfdW5ib3VuZCBhc3luY19ydW5fZW50cnlfZm4KWyAgIDM0LjY0MTcy
Ml0gQ2FsbCBUcmFjZToKWyAgIDM0LjY0MjIxN10gIF9fc2NoZWR1bGUrMHgyNzUvMHg2YzAKWyAg
IDM0LjY0MjY4M10gIHNjaGVkdWxlKzB4NDEvMHhhMApbICAgMzQuNjQzMTc5XSAgc2NoZWR1bGVf
dGltZW91dCsweDE4Yi8weDI5MApbICAgMzQuNjQzNjQ1XSAgPyBkZWxfdGltZXJfc3luYysweDMw
LzB4MzAKWyAgIDM0LjY0NDEzMV0gIF9fZG93bl90aW1lb3V0KzB4NmIvMHhjMApbICAgMzQuNjQ0
NTY4XSAgPyB1ZnNoY2RfY2xrc2NhbGVfZW5hYmxlX3Nob3crMHgyMC8weDIwClsgICAzNC42NDUw
MTRdICA/IGFzeW5jX3NjaGVkdWxlX25vZGVfZG9tYWluKzB4MTdkLzB4MTkwClsgICAzNC42NDU0
OTZdICBkb3duX3RpbWVvdXQrMHg0Mi8weDUwClsgICAzNC42NDU5NDddICB1ZnNoY2Rfd2xfc3Vz
cGVuZCsweDc5LzB4YTAKWyAgIDM0LjY0NjQzMl0gID8gc2NtZF9wcmludGsrMHgxMDAvMHgxMDAK
WyAgIDM0LjY0NjkxN10gIHNjc2lfYnVzX3N1c3BlbmRfY29tbW9uKzB4NTYvMHhjMApbICAgMzQu
NjQ3NDA1XSAgPyBzY3NpX2J1c19mcmVlemUrMHgxMC8weDEwClsgICAzNC42NDc4NThdICBkcG1f
cnVuX2NhbGxiYWNrKzB4NDUvMHgxMTAKWyAgIDM0LjY0ODM0N10gIF9fZGV2aWNlX3N1c3BlbmQr
MHgxMTcvMHg0NjAKWyAgIDM0LjY0ODc4OF0gIGFzeW5jX3N1c3BlbmQrMHgxNi8weDkwClsgICAz
NC42NDkyNTFdICBhc3luY19ydW5fZW50cnlfZm4rMHgyNi8weDExMApbICAgMzQuNjQ5Njc2XSAg
cHJvY2Vzc19vbmVfd29yaysweDFjYy8weDM2MApbICAgMzQuNjUwMTM3XSAgd29ya2VyX3RocmVh
ZCsweDQ1LzB4M2IwClsgICAzNC42NTA1NjNdICA/IHByb2Nlc3Nfb25lX3dvcmsrMHgzNjAvMHgz
NjAKWyAgIDM0LjY1MDk5NF0gIGt0aHJlYWQrMHhmNi8weDEzMApbICAgMzQuNjUxNDU1XSAgPyBr
dGhyZWFkX3BhcmsrMHg4MC8weDgwClsgICAzNC42NTE4ODJdICByZXRfZnJvbV9mb3JrKzB4MWYv
MHgzMAoKCgo+IAo+Pgo+PiBJJ2xsIGFkZHJlc3MgdGhlIG90aGVyIGNvbW1lbnRzIGluIHRoZSBu
ZXh0IHZlcnNpb24uCj4+Cj4+Cj4+IFRoYW5rIHlvdSEKPj4KPj4+PiAtwqDCoMKgIHBtX3J1bnRp
bWVfcHV0KGhiYS0+ZGV2KTsKPj4+PiArwqDCoMKgIHVmc2hjZF9ycG1fcHV0KGhiYSk7Cj4+Pj4g
wqAgfQo+Pj4KPj4+IDxTTklQPgo+Pj4KPj4+PiArdm9pZCB1ZnNoY2RfcmVzdW1lX2NvbXBsZXRl
KHN0cnVjdCBkZXZpY2UgKmRldikKPj4+PiArewo+Pgo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
