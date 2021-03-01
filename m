Return-Path: <SRS0=HsXE=H7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E190AC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 19:13:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7829E64E05
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 19:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7829E64E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9ilclLMEcG7AQdxvGI3eBIna8jh4yQqSlZaGp82I7uI=; b=XuQ8V4ugaLjtCyQgNnTLVOiXz
	8057tZ3co/9IrZgICwkMXMQ4oUdjNn83QQwRXY68MKyQKiUDh03G/J/y96+o9rgWunACuh2XY0LSG
	OhYfvvwYtV82a7Du4bZejJqIqa0qCiov+sZeqQR+0DSiu86LHpquHyVEQ6Qwude42kYKZK6bp69mS
	JuUaoFfFYWFV4nwdTEXKmBau0RbUYEDB9ZpGQUyHnzwZY8J6BWKxeecZdVzu8LFEcZYXTNEi0qhRW
	V665lTT+IM9UghbkNuUAxhr7I2zEpkDtd7hiTUfoADS0THurOOzhVAfKI3pe8FtFjVZTHJ8SIjmkr
	nV45d6R4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGnyP-0002up-Rn; Mon, 01 Mar 2021 19:12:53 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGnyM-0002tm-0a; Mon, 01 Mar 2021 19:12:50 +0000
IronPort-SDR: gdhJZHHBsbKuvAMILbIiOtf003jvfhwrjkHKOfNkiB3hpon14loUONBOHYOs/OsL/XZki/Spn1
 iwhw/rt+LlYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="271571448"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="271571448"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 11:12:48 -0800
IronPort-SDR: IZHeAmha3J9FNGeaDMx1ISJgDn1JHd6fmIBKO6IXMHwxa3XdT+30OgfhOr/VVZJb8UIdH4/w7G
 turhYFrDusDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="585603646"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.76])
 ([10.237.72.76])
 by orsmga005.jf.intel.com with ESMTP; 01 Mar 2021 11:12:42 -0800
Subject: Re: [PATCH v8 1/2] scsi: ufs: Enable power management for wlun
To: Asutosh Das <asutoshd@codeaurora.org>
References: <cover.1614295674.git.asutoshd@codeaurora.org>
 <c861385023f8592a63e3edf8119af89511741c9a.1614295674.git.asutoshd@codeaurora.org>
 <e10cd03d-12cd-3d73-b9ed-a542e0b2b83c@intel.com>
 <20210301181014.GF12147@stor-presley.qualcomm.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <3b085cd7-529f-51b8-6a2f-6aa397e1acd3@intel.com>
Date: Mon, 1 Mar 2021 21:12:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210301181014.GF12147@stor-presley.qualcomm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_141250_241452_34974811 
X-CRM114-Status: GOOD (  20.75  )
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
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, cang@codeaurora.org,
 Wei Yongjun <weiyongjun1@huawei.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Lee Jones <lee.jones@linaro.org>,
 Bean Huo <beanhuo@micron.com>, "open list:ARM/SAMSUNG S3C,
 S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>,
 linux-scsi@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Satya Tangirala <satyat@google.com>, Andy Gross <agross@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-arm-msm@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Avri Altman <avri.altman@wdc.com>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, Ingo Molnar <mingo@redhat.com>,
 "moderated list:ARM/SAMSUNG S3C,
 S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
 martin.petersen@oracle.com, open list <linux-kernel@vger.kernel.org>,
 Pedro Sousa <pedrom.sousa@synopsys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMS8wMy8yMSA4OjEwIHBtLCBBc3V0b3NoIERhcyB3cm90ZToKPiBPbiBNb24sIE1hciAwMSAy
MDIxIGF0IDA1OjIzIC0wODAwLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+PiBPbiAyNi8wMi8yMSAx
OjM3IGFtLCBBc3V0b3NoIERhcyB3cm90ZToKPj4+IEBAIC04OTAxLDQzICs5MTI1LDE0IEBAIHN0
YXRpYyBpbnQgdWZzaGNkX3Jlc3VtZShzdHJ1Y3QgdWZzX2hiYSAqaGJhLCBlbnVtIHVmc19wbV9v
cCBwbV9vcCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHZlbmRvcl9zdXNwZW5k
Owo+Pj4gwqDCoMKgwqAgfQo+Pgo+PiBUaGUgdWZzaGNkX3Jlc2V0X2FuZF9yZXN0b3JlKCkgaW4g
dWZzaGNkX3Jlc3VtZSgpIHdpbGwgYWxzbyBjaGFuZ2UgdGhlIHBvd2VyCj4+IG1vZGUgb2YgdGhl
IFVGUyBkZXZpY2UgdG8gYWN0aXZlLsKgIFVudGlsIHRoZSBVRlMgZGV2aWNlIGlzIGFsc28gcmVz
dW1lZCBhbmQKPj4gdGhlbiBzdXNwZW5kZWQsIGl0IHdpbGwgbm90IHJldHVybiB0byBhIGxvdyBw
b3dlciBtb2RlLgo+Pgo+Pgo+IFVtbSwgc29ycnksIEkgZGlkbid0IHVuZGVyc3RhbmQgdGhpcyBj
b21tZW50Lgo+IFNheSwgdGhlIFVGUyBkZXZpY2Ugd2FzIHJlc2V0IGluIHVmc2hjZF9yZXNldF9h
bmRfcmVzdG9yZSgpIGl0J2QgYmUgYSBoYXJkd2FyZQo+IHJlc2V0IGFuZCB0aGUgVUZTIGRldmlj
ZSB3b3VsZCBtb3ZlIHRvIFBvd2VyZWQgT24gbW9kZSBhbmQgdGhlbiB0byBBY3RpdmUgcG93ZXIK
PiBtb2RlLCB3aGVuIGl0IGlzIHJlYWR5IHRvIGJlZ2luIGluaXRpYWxpemF0aW9uLiBBbmQgZnJv
bSB0aGlzIHN0YXRlIGl0IHNob3VsZAo+IG1vdmUgdG8gYWxsIG90aGVyIGxlZ2FsIHN0YXRlcy4K
PiBCZWZvcmUgZW50ZXJpbmcgc3lzdGVtIHN1c3BlbmQgdWZzaGNkX3N5c3RlbV9zdXNwZW5kKCks
IHRoZSB1ZnMgZGV2aWNlIGlzCj4gcnVudGltZSByZXN1bWVkIGluIHVmc2hjZF9zdXNwZW5kX3By
ZXBhcmUoKS4KPiAKPiBQbGVhc2UgY2FuIHlvdSBleHBsYWluIGEgYml0IG1vcmUgb24gdGhpcyBp
c3N1ZSB0aGF0IHlvdSBzZWU/CgpTYXkgeW91IHJ1bnRpbWUgcmVzdW1lIHRoZSBob3N0IGNvbnRy
b2xsZXIsIGFuZAp1ZnNoY2RfcmVzZXRfYW5kX3Jlc3RvcmUoKSBtYWtlcyB0aGUgVUZTIGRldmlj
ZSBhY3RpdmUsCmJ1dCB0aGUgVUZTIGRldmljZSBpcyBzdGlsbCBydW50aW1lIHN1c3BlbmRlZC4K
CgpFeGFtcGxlOgoKQWRkIGEgZGVidWdmcyBmaWxlIHRvIHNob3cgdGhlIGN1cnJlbnQgcG93ZXIg
bW9kZToKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Njc2kvdWZzL3Vmcy1kZWJ1Z2ZzLmMgYi9kcml2
ZXJzL3Njc2kvdWZzL3Vmcy1kZWJ1Z2ZzLmMKaW5kZXggZGVlOThkYzcyZDI5Li43MDBiODhkZjA4
NjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc2NzaS91ZnMvdWZzLWRlYnVnZnMuYworKysgYi9kcml2
ZXJzL3Njc2kvdWZzL3Vmcy1kZWJ1Z2ZzLmMKQEAgLTQ4LDYgKzQ4LDcgQEAgdm9pZCB1ZnNfZGVi
dWdmc19oYmFfaW5pdChzdHJ1Y3QgdWZzX2hiYSAqaGJhKQogewogICAgICAgIGhiYS0+ZGVidWdm
c19yb290ID0gZGVidWdmc19jcmVhdGVfZGlyKGRldl9uYW1lKGhiYS0+ZGV2KSwgdWZzX2RlYnVn
ZnNfcm9vdCk7CiAgICAgICAgZGVidWdmc19jcmVhdGVfZmlsZSgic3RhdHMiLCAwNDAwLCBoYmEt
PmRlYnVnZnNfcm9vdCwgaGJhLCAmdWZzX2RlYnVnZnNfc3RhdHNfZm9wcyk7CisgICAgICAgZGVi
dWdmc19jcmVhdGVfdTMyKCJjdXJyX2Rldl9wd3JfbW9kZSIsIDA0MDAsIGhiYS0+ZGVidWdmc19y
b290LCAodTMyICopJmhiYS0+Y3Vycl9kZXZfcHdyX21vZGUpOwogfQoKIHZvaWQgdWZzX2RlYnVn
ZnNfaGJhX2V4aXQoc3RydWN0IHVmc19oYmEgKmhiYSkKCgojIGdyZXAgLUggLiAvc3lzL2J1cy9w
Y2kvZHJpdmVycy91ZnNoY2QvMDAwMFw6MDBcOjEyLjUvcnBtKgovc3lzL2J1cy9wY2kvZHJpdmVy
cy91ZnNoY2QvMDAwMDowMDoxMi41L3JwbV9sdmw6Ngovc3lzL2J1cy9wY2kvZHJpdmVycy91ZnNo
Y2QvMDAwMDowMDoxMi41L3JwbV90YXJnZXRfZGV2X3N0YXRlOkRFRVBTTEVFUAovc3lzL2J1cy9w
Y2kvZHJpdmVycy91ZnNoY2QvMDAwMDowMDoxMi41L3JwbV90YXJnZXRfbGlua19zdGF0ZTpPRkYK
IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvdWZzaGNkLzAwMDBcOjAwXDoxMi41L2N1cnJfZGV2X3B3
cl9tb2RlCjQKIyBlY2hvIG9uID4gL3N5cy9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDoxMi41
L3Bvd2VyL2NvbnRyb2wKIyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvdWZzaGNkLzAwMDBcOjAwXDox
Mi41L2N1cnJfZGV2X3B3cl9tb2RlCjEKIyBncmVwIC1IIC4gL3N5cy9idXMvcGNpL2RyaXZlcnMv
dWZzaGNkLzAwMDBcOjAwXDoxMi41L2hvc3QqL3RhcmdldCovKi9wb3dlci9ydW50aW1lX3N0YXR1
cwovc3lzL2J1cy9wY2kvZHJpdmVycy91ZnNoY2QvMDAwMDowMDoxMi41L2hvc3QxL3RhcmdldDE6
MDowLzE6MDowOjAvcG93ZXIvcnVudGltZV9zdGF0dXM6c3VzcGVuZGVkCi9zeXMvYnVzL3BjaS9k
cml2ZXJzL3Vmc2hjZC8wMDAwOjAwOjEyLjUvaG9zdDEvdGFyZ2V0MTowOjAvMTowOjA6NDk0NTYv
cG93ZXIvcnVudGltZV9zdGF0dXM6c3VzcGVuZGVkCi9zeXMvYnVzL3BjaS9kcml2ZXJzL3Vmc2hj
ZC8wMDAwOjAwOjEyLjUvaG9zdDEvdGFyZ2V0MTowOjAvMTowOjA6NDk0NzYvcG93ZXIvcnVudGlt
ZV9zdGF0dXM6c3VzcGVuZGVkCi9zeXMvYnVzL3BjaS9kcml2ZXJzL3Vmc2hjZC8wMDAwOjAwOjEy
LjUvaG9zdDEvdGFyZ2V0MTowOjAvMTowOjA6NDk0ODgvcG93ZXIvcnVudGltZV9zdGF0dXM6c3Vz
cGVuZGVkCgpTbyBVRlMgZGV2aWNlcyBpcyBydW50aW1lIHN1c3BlbmRlZCBhbmQgc2hvdWxkIGlu
IERlZXBTbGVlcCwgYnV0IGl0IGlzIGFjdGl2ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
