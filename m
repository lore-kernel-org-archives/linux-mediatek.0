Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65562C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 04:15:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD2246109E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 04:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD2246109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xpMf1/3QZFAx8jqar29nzU9J3J9mFirlV36ShuEndoc=; b=cY48JFU4ITE5uGMWF3Jq8kfGM
	6lTOL47doBUTN21EdVhRUQDnOroFJEvwNml9Hk1QRBNh5g2gsJc3ib6HBWgEqzcY3ij/xVhy6soqR
	PLDj10yNyOEZMFoghMLDCQxIVXDDI+TKG+u7XiDHq067qF6l1bI7AP1hRlp1SHfGsJv7hc+kOJxTE
	mkuvcZrKkvlr5koQaaQRYIg9Nkjk6gDxi0kBl6UHosn1SN2KC/Ae5aE47R34dBNMC3QWizDcY4AlV
	EIcsQuzQfEq6+BeXuN/Irqjnhp2zyDZ0Db13pcpl1LK0aefxUjkBvBE+o4dBjlUjyAa/7u4K5brGI
	Xov5GOZlw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYhnZ-00B9LN-Lm; Tue, 20 Apr 2021 04:15:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYhnP-00B9Kk-Aw; Tue, 20 Apr 2021 04:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Hm4Z6oaQgs3twXmrYS3T+fDV5rlZoFGQ7Y/U36Iw/7c=; b=oL5xuxqZQX1CEdC/mLsveJLDTZ
 OuXDUAzqeF45ZZ263Hz54feAVatd/pokWDaaHto2yse86SzbiqC1AsCWpdT1hLTk0iCN1BF6bHfFD
 UTZQdRwnMiE8XEd3oZPCObJTcyq3CSU7D47fBX/p7Pp2fovl77lZiNlZgyVeEByxBlhHUWCKKgM2B
 XAoarleIatfBxAqisV9lZLAyWO1kmnJ8URmWZPUHV7C3K2GBZLLThcG/TvyhA7wnLy2x7m9INb/PI
 2MzlFMyf1xUvA84CPau/mAy9vuKC6pOsBmRQFosJG9XRAHxjTAxFoOpPB3zrsfrAXdYG720J37Z0j
 SieiE+sw==;
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYhnL-00BnsK-Q3; Tue, 20 Apr 2021 04:15:29 +0000
IronPort-SDR: iC/h93WLyR1syXymIefA1wBCGM8lGfInrf8BhelmUkFT3lDJSJmxBvIremFmM9JZEZhQKbK5gB
 IUO12wOwDxYw==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="195466730"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="195466730"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 21:15:16 -0700
IronPort-SDR: 6rAbk6FueexjTrFKkwcckZGJwZ+VFfmCi4dOdTEvAZsYOeRXNbxB+x28s3fHPtKOddNihST939
 DqZQceaPM7zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="420249358"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174])
 ([10.237.72.174])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2021 21:15:09 -0700
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
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <90809796-1c32-3709-13d3-65e4d5c387cc@intel.com>
Date: Tue, 20 Apr 2021 07:15:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <07e3ea07-e1c3-7b8c-e398-8b008f873e6d@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_211527_909170_C3AFB674 
X-CRM114-Status: GOOD (  18.15  )
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

T24gMjAvMDQvMjEgMTI6NTMgYW0sIEFzdXRvc2ggRGFzIChhc2QpIHdyb3RlOgo+IE9uIDQvMTkv
MjAyMSAxMTozNyBBTSwgQWRyaWFuIEh1bnRlciB3cm90ZToKPj4gT24gMTYvMDQvMjEgMTA6NDkg
cG0sIEFzdXRvc2ggRGFzIHdyb3RlOgo+Pj4KPj4+IENvLWRldmVsb3BlZC1ieTogQ2FuIEd1byA8
Y2FuZ0Bjb2RlYXVyb3JhLm9yZz4KPj4+IFNpZ25lZC1vZmYtYnk6IENhbiBHdW8gPGNhbmdAY29k
ZWF1cm9yYS5vcmc+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBc3V0b3NoIERhcyA8YXN1dG9zaGRAY29k
ZWF1cm9yYS5vcmc+Cj4+PiAtLS0KPj4KPj4gSSBjYW1lIGFjcm9zcyAzIGlzc3VlcyB3aGlsZSB0
ZXN0aW5nLsKgIFNlZSBjb21tZW50cyBiZWxvdy4KPj4KPiBIaSBBZHJpYW4KPiBUaGFua3MgZm9y
IHRoZSBjb21tZW50cy4KPj4gPFNOSVA+Cj4+Cj4+PiBAQCAtNTc5NCw3ICs1ODM5LDcgQEAgc3Rh
dGljIHZvaWQgdWZzaGNkX2Vycl9oYW5kbGluZ191bnByZXBhcmUoc3RydWN0IHVmc19oYmEgKmhi
YSkKPj4+IMKgwqDCoMKgwqAgaWYgKHVmc2hjZF9pc19jbGtzY2FsaW5nX3N1cHBvcnRlZChoYmEp
KQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHVmc2hjZF9jbGtfc2NhbGluZ19zdXNwZW5kKGhiYSwg
ZmFsc2UpOwo+Pj4gwqDCoMKgwqDCoCB1ZnNoY2RfY2xlYXJfdWFfd2x1bnMoaGJhKTsKPj4KPj4g
dWZzaGNkX2NsZWFyX3VhX3dsdW5zKCkgZGVhZGxvY2tzIHRyeWluZyB0byBjbGVhciBVRlNfVVBJ
VV9SUE1CX1dMVU4KPj4gaWYgc2Rldl9ycG1iIGlzIHN1c3BlbmRlZCBhbmQgc2Rldl91ZnNfZGV2
aWNlIGlzIHN1c3BlbmRpbmcuCj4+IGUuZy4gdWZzaGNkX3dsX3N1c3BlbmQoKSBpcyB3YWl0aW5n
IG9uIGhvc3Rfc2VtIHdoaWxlIHVmc2hjZF9lcnJfaGFuZGxlcigpCj4+IGlzIHJ1bm5pbmcsIGF0
IHdoaWNoIHBvaW50IHNkZXZfcnBtYiBoYXMgYWxyZWFkeSBzdXNwZW5kZWQuCj4+Cj4gVW1tLCBJ
IGRpZG4ndCB1bmRlcnN0YW5kIHRoaXMgZGVhZGxvY2suCj4gV2hlbiB5b3Ugc2F5LCBzZGV2X3Jw
bWIgaXMgc3VzcGVuZGVkLCBkb2VzIGl0IG1lYW4gcnVudGltZV9zdXNwZW5kZWQ/Cj4gc2Rldl91
ZnNfZGV2aWNlIGlzIHN1c3BlbmRpbmcgLSB0aGlzIGNhbid0IGJlIHJ1bnRpbWVfc3VzcGVuZGlu
Zywgd2hpbGUgdWZzaGNkX2Vycl9oYW5kbGluZ191bnByZXBhcmUgaXMgcnVubmluZy4KPiAKPiBJ
ZiB5b3UndmUgYSBjYWxsLXN0YWNrIG9mIHRoaXMgZGVhZGxvY2ssIHBsZWFzZSBjYW4geW91IHNo
YXJlIGl0IHdpdGggbWUuIEknbGwgYWxzbyB0cnkgdG8gcmVwcm9kdWNlIHRoaXMuCgpZZXMgaXQg
aXMgc3lzdGVtIHN1c3BlbmQuIHNkZXZfcnBtYiBoYXMgc3VzcGVuZGVkLCBzZGV2X3Vmc19kZXZp
Y2UgaXMgd2FpdGluZyBvbiBob3N0X3NlbS4KdWZzaGNkX2Vycl9oYW5kbGVyKCkgaG9sZHMgaG9z
dF9zZW0uIHVmc2hjZF9jbGVhcl91YV93bHVuKFVGU19VUElVX1JQTUJfV0xVTikgZ2V0cyBzdHVj
ay4KSSB3aWxsIGdldCBzb21lIGNhbGwtc3RhY2tzLgoKPiAKPiBJJ2xsIGFkZHJlc3MgdGhlIG90
aGVyIGNvbW1lbnRzIGluIHRoZSBuZXh0IHZlcnNpb24uCj4gCj4gCj4gVGhhbmsgeW91IQo+IAo+
Pj4gLcKgwqDCoCBwbV9ydW50aW1lX3B1dChoYmEtPmRldik7Cj4+PiArwqDCoMKgIHVmc2hjZF9y
cG1fcHV0KGhiYSk7Cj4+PiDCoCB9Cj4+Cj4+IDxTTklQPgo+Pgo+Pj4gK3ZvaWQgdWZzaGNkX3Jl
c3VtZV9jb21wbGV0ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+PiArewo+IAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
