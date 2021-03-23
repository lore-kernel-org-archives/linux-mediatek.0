Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F69C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 19:20:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B089C6192B
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 19:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B089C6192B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7HbU6jxaH0oprVdWrQRWy+t5UQFynvNw/zYyux7LUPU=; b=MMSfC4Mf0IIyAnOON/jGvRodJ
	/85Av0kfKo755n7rNyR/0Kf6Ig6kU2Rcpn/2D9aTFOx2p7Yby60wr5CjeyjbieMOyxOug7lR5i3jn
	4lIllflRy/6Z/Ge8aMajqfTYoPFkNX1fz0uajixPwZcCFpd9TlvtGr+pUfYtkLHa0lKIweHxARela
	sHfnozgaYyAfficxGs9YLrJmn3n8wkMfoCu88xm2fZUYW/01PFLlcrfcLbI0hkQwD1LrZnhnJHfgI
	t0jOHdffzD4y+rk5algDvxpV+UaJ+TCViWKhqlPGy3IJceOkCMSYVXqd9bTKOU4N0+/6Do5oAzT3N
	0cJQCGgGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOmZA-00Faml-Qi; Tue, 23 Mar 2021 19:19:48 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOmYx-00Faly-C0; Tue, 23 Mar 2021 19:19:39 +0000
IronPort-SDR: k4CFyvOqP8I2eI2TPZ93HWZdCkScuyPJXeIQ5qZ43nfZgLodZefbzsa4mxW7EZSF/QdlfwA+0x
 JnDtWXzfOL2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="190646781"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="190646781"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 12:19:18 -0700
IronPort-SDR: tInt6khcFXo6qvuyQRrgPhhjTyaAbN5myeLF8sSsTRk2I0BAYrmpLDCbbc0Oxlfm/Wvx1ERVmI
 o9fy7V/kCaGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="452278802"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174])
 ([10.237.72.174])
 by orsmga001.jf.intel.com with ESMTP; 23 Mar 2021 12:19:11 -0700
Subject: Re: [PATCH v12 1/2] scsi: ufs: Enable power management for wlun
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>, cang@codeaurora.org,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Wei Yongjun <weiyongjun1@huawei.com>,
 Lee Jones <lee.jones@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Satya Tangirala <satyat@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>
References: <cover.1616113283.git.asutoshd@codeaurora.org>
 <56662082b6a17b448f40d87df7e52b45a5998c2a.1616113283.git.asutoshd@codeaurora.org>
 <88730ac9-d9c5-d758-d761-8c549c488aab@intel.com>
 <3268f1d9-03ae-17dd-87be-04bd6531334b@codeaurora.org>
 <e324d78e-f383-30e2-1a08-b98d442df206@intel.com>
 <834cec94-f4fc-606e-df69-853644f3d88e@codeaurora.org>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <c92bec14-8457-7992-6714-398b467b67e3@intel.com>
Date: Tue, 23 Mar 2021 21:19:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <834cec94-f4fc-606e-df69-853644f3d88e@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_191936_008412_FA55DEE6 
X-CRM114-Status: GOOD (  33.22  )
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

T24gMjMvMDMvMjEgNToxMyBwbSwgQXN1dG9zaCBEYXMgKGFzZCkgd3JvdGU6Cj4gT24gMy8yMi8y
MDIxIDExOjEyIFBNLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+PiBPbiAyMi8wMy8yMSA5OjUzIHBt
LCBBc3V0b3NoIERhcyAoYXNkKSB3cm90ZToKPj4+IE9uIDMvMTkvMjAyMSAxMDo0NyBBTSwgQWRy
aWFuIEh1bnRlciB3cm90ZToKPj4+PiBPbiAxOS8wMy8yMSAyOjM1IGFtLCBBc3V0b3NoIERhcyB3
cm90ZToKPj4+Pj4gRHVyaW5nIHJ1bnRpbWUtc3VzcGVuZCBvZiB1ZnMgaG9zdCwgdGhlIHNjc2kg
ZGV2aWNlcyBhcmUKPj4+Pj4gYWxyZWFkeSBzdXNwZW5kZWQgYW5kIHNvIGFyZSB0aGUgcXVldWVz
IGFzc29jaWF0ZWQgd2l0aCB0aGVtLgo+Pj4+PiBCdXQgdGhlIHVmcyBob3N0IHNlbmRzIFNTVSB0
byB3bHVuIGR1cmluZyBpdHMgcnVudGltZS1zdXNwZW5kLgo+Pj4+PiBEdXJpbmcgdGhlIHByb2Nl
c3MgYmxrX3F1ZXVlX2VudGVyIGNoZWNrcyBpZiB0aGUgcXVldWUgaXMgbm90IGluCj4+Pj4+IHN1
c3BlbmRlZCBzdGF0ZS4gSWYgc28sIGl0IHdhaXRzIGZvciB0aGUgcXVldWUgdG8gcmVzdW1lLCBh
bmQgbmV2ZXIKPj4+Pj4gY29tZXMgb3V0IG9mIGl0Lgo+Pj4+PiBUaGUgY29tbWl0Cj4+Pj4+IChk
NTVkMTVhMzM6IHNjc2k6IGJsb2NrOiBEbyBub3QgYWNjZXB0IGFueSByZXF1ZXN0cyB3aGlsZSBz
dXNwZW5kZWQpCj4+Pj4+IGFkZHMgdGhlIGNoZWNrIGlmIHRoZSBxdWV1ZSBpcyBpbiBzdXNwZW5k
ZWQgc3RhdGUgaW4gYmxrX3F1ZXVlX2VudGVyKCkuCj4+Pj4+Cj4+Pj4+IENhbGwgdHJhY2U6Cj4+
Pj4+IMKgwqAgX19zd2l0Y2hfdG8rMHgxNzQvMHgyYzQKPj4+Pj4gwqDCoCBfX3NjaGVkdWxlKzB4
NDc4LzB4NzY0Cj4+Pj4+IMKgwqAgc2NoZWR1bGUrMHg5Yy8weGUwCj4+Pj4+IMKgwqAgYmxrX3F1
ZXVlX2VudGVyKzB4MTU4LzB4MjI4Cj4+Pj4+IMKgwqAgYmxrX21xX2FsbG9jX3JlcXVlc3QrMHg0
MC8weGE0Cj4+Pj4+IMKgwqAgYmxrX2dldF9yZXF1ZXN0KzB4MmMvMHg3MAo+Pj4+PiDCoMKgIF9f
c2NzaV9leGVjdXRlKzB4NjAvMHgxYzQKPj4+Pj4gwqDCoCB1ZnNoY2Rfc2V0X2Rldl9wd3JfbW9k
ZSsweDEyNC8weDFlNAo+Pj4+PiDCoMKgIHVmc2hjZF9zdXNwZW5kKzB4MjA4LzB4ODNjCj4+Pj4+
IMKgwqAgdWZzaGNkX3J1bnRpbWVfc3VzcGVuZCsweDQwLzB4MTU0Cj4+Pj4+IMKgwqAgdWZzaGNk
X3BsdGZybV9ydW50aW1lX3N1c3BlbmQrMHgxNC8weDIwCj4+Pj4+IMKgwqAgcG1fZ2VuZXJpY19y
dW50aW1lX3N1c3BlbmQrMHgyOC8weDNjCj4+Pj4+IMKgwqAgX19ycG1fY2FsbGJhY2srMHg4MC8w
eDJhNAo+Pj4+PiDCoMKgIHJwbV9zdXNwZW5kKzB4MzA4LzB4NjE0Cj4+Pj4+IMKgwqAgcnBtX2lk
bGUrMHgxNTgvMHgyMjgKPj4+Pj4gwqDCoCBwbV9ydW50aW1lX3dvcmsrMHg4NC8weGFjCj4+Pj4+
IMKgwqAgcHJvY2Vzc19vbmVfd29yaysweDFmMC8weDQ3MAo+Pj4+PiDCoMKgIHdvcmtlcl90aHJl
YWQrMHgyNmMvMHg0YzgKPj4+Pj4gwqDCoCBrdGhyZWFkKzB4MTNjLzB4MzIwCj4+Pj4+IMKgwqAg
cmV0X2Zyb21fZm9yaysweDEwLzB4MTgKPj4+Pj4KPj4+Pj4gRml4IHRoaXMgYnkgcmVnaXN0ZXJp
bmcgdWZzIGRldmljZSB3bHVuIGFzIGEgc2NzaSBkcml2ZXIgYW5kCj4+Pj4+IHJlZ2lzdGVyaW5n
IGl0IGZvciBibG9jayBydW50aW1lLXBtLiBBbHNvIG1ha2UgdGhpcyBhcyBhCj4+Pj4+IHN1cHBs
aWVyIGZvciBhbGwgb3RoZXIgbHVucy4gVGhhdCB3YXksIHRoaXMgZGV2aWNlIHdsdW4KPj4+Pj4g
c3VzcGVuZHMgYWZ0ZXIgYWxsIHRoZSBjb25zdW1lcnMgYW5kIHJlc3VtZXMgYWZ0ZXIKPj4+Pj4g
aGJhIHJlc3VtZXMuCj4+Pj4+Cj4+Pj4+IENvLWRldmVsb3BlZC1ieTogQ2FuIEd1byA8Y2FuZ0Bj
b2RlYXVyb3JhLm9yZz4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2FuIEd1byA8Y2FuZ0Bjb2RlYXVy
b3JhLm9yZz4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQXN1dG9zaCBEYXMgPGFzdXRvc2hkQGNvZGVh
dXJvcmEub3JnPgo+Pj4+Cj4+Pj4gSSBoYXZlIHNvbWUgbW9yZSBjb21tZW50cyB0aGF0IG1heSBo
ZWxwIHN0cmFpZ2h0ZW4gdGhpbmdzIG91dC4KPj4+Pgo+Pj4+IEFsc28gcGxlYXNlIGxvb2sgYXQg
dWZzX2RlYnVnZnNfZ2V0X3VzZXJfYWNjZXNzKCkgYW5kCj4+Pj4gdWZzX2RlYnVnZnNfcHV0X3Vz
ZXJfYWNjZXNzKCkgdGhhdCBub3cgbmVlZCB0byBzY3NpX2F1dG9wbV9nZXQvcHV0X2RldmljZQo+
Pj4+IHNkZXZfdWZzX2RldmljZS4KPj4+Pgo+Pj4+IEl0IHdvdWxkIGFsc28gYmUgZ29vZCBpZiB5
b3UgY291bGQgcmUtYmFzZSBvbiBsaW51eC1uZXh0Lgo+Pj4+Cj4+Pgo+Pj4gSGkgQWRyaWFuCj4+
PiBUaGFua3MgZm9yIHRoZSBjb21tZW50cy4KPj4+Cj4+PiBJIGFncmVlIG1vdmluZyB0aGUgY29k
ZSB0byB3bHVuIHByb2JlIGFuZCBvdGhlciBjaGFuZ2VzLgo+Pj4gQnV0IGl0IGxvb2tzIHRvIG1l
IHRoYXQgaXQgbWF5IG5vdCBmdWxseSBzb2x2ZSB0aGUgaXNzdWUuCj4+Pgo+Pj4gUGxlYXNlIGxl
dCBtZSBleHBsYWluIG15IHVuZGVyc3RhbmRpbmcgb24gdGhpczoKPj4+Cj4+PiAoUGxlYXNlIHJl
ZmVyIHRvIHRoZSBsb2dzIGluIHYxMCkKPj4+IHNjc2lfYXV0b3BtXyooKSBhcmUgaW52b2tlZCBv
biBhIHNkZXYuCj4+PiBwbV9ydW50aW1lX2dldF9zdXBwbGllcnMoKS9ycG1fcHV0X3N1cHBsaWVy
cygpIGFyZSBvbiB0aGUgc3VwcGxpZXIgZGV2aWNlLgo+Pj4KPj4+IEZvciB0aGUgZGV2aWNlIHds
dW46Cj4+PiDCoMKgwqDCoMKgc2xhdmVfY29uZmlndXJlKCk6Cj4+PiDCoMKgwqDCoMKgwqDCoMKg
IC0gZG9lc24ndCBzZXQgdGhlIHJwbV9hdXRvc3VzcGVuZAo+Pj4gwqDCoMKgwqDCoMKgwqDCoCAt
IHBtX3J1bnRpbWVfZ2V0bm9yZXN1bWUoKQo+Pj4gwqDCoMKgwqDCoHNjc2lfc3lzZnNfYWRkX3Nk
ZXYoKToKPj4+IMKgwqDCoMKgwqDCoMKgwqAgLSBwbV9ydW50aW1lX2ZvcmJpZCgpCj4+PiDCoMKg
wqDCoMKgwqDCoMKgIC0gc2NzaV9hdXRvcG1fZ2V0X2RldmljZSgpCj4+PiDCoMKgwqDCoMKgwqDC
oMKgIC0gZGV2aWNlX2FkZCgpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSB1ZnNoY2Rf
d2xfcHJvYmUoKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCAtIHNjc2lfYXV0b3BtX3B1dF9kZXZpY2Uo
KQo+Pj4KPj4+IEZvciBhbGwgb3RoZXIgc2NzaSBkZXZpY2VzOgo+Pj4gwqDCoMKgwqDCoHNsYXZl
X2FsbG9jKCk6Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIC0gdWZzaGNkX3NldHVwX2xpbmtzKCkKPj4+
IFNheSBhbGwgbGlua19hZGQ6IHBtX3J1bnRpbWVfcHV0KCZoYmEtPnNkZXZfdWZzX2RldmljZS0+
c2Rldl9nZW5kZXYpOwo+Pgo+PiBXaXRoIERMX0ZMQUdfUlBNX0FDVElWRSwgbGlua3Mgd2lsbCAn
Z2V0JyBub3QgJ3B1dCcKPj4KPiBJJ20gcmVmZXJyaW5nIHRvIHRoZSBwbV9ydW50aW1lX3B1dChz
ZGV2X3Vmc19kZXZpY2UpIGFmdGVyIGFsbCB0aGUgbGlua3MgYXJlIHNldHVwLCB0aGF0IHlvdSBz
dWdnZXN0ZWQgdG8gYWRkLgoKT2sKCj4+PiDCoMKgwqDCoMKgc2xhdmVfY29uZmlndXJlKCk6Cj4+
PiDCoMKgwqDCoMKgwqDCoMKgIC0gc2V0IHJwbV9hdXRvc3VzcGVuZAo+Pj4gwqDCoMKgwqDCoHNj
c2lfc3lzZnNfYWRkX3NkZXYoKToKPj4+IMKgwqDCoMKgwqDCoMKgwqAgLSBzY3NpX2F1dG9wbV9n
ZXRfZGV2aWNlKCkKPj4+IMKgwqDCoMKgwqDCoMKgwqAgLSBkZXZpY2VfYWRkKCkgLT4gc2NoZWR1
bGVzIGFuIGFzeW5jIHByb2JlKCkKPj4+IMKgwqDCoMKgwqDCoMKgwqAgLSBzY3NpX2F1dG9wbV9w
dXRfZGV2aWNlKCkgLSAoMSkKPj4+Cj4+PiBOb3cgdGhlIHJwbV9wdXRfc3VwcGxpZXJzKCkgY2Fu
IGJlIGludm9rZWQgKmFmdGVyKiBwbV9ydW50aW1lX2dldF9zdXBwbGllcnMoKSBvZiB0aGUgYXN5
bmMgcHJvYmUoKSwgc2luY2UgYm90aCBhcmUgcnVubmluZyBpbiBkaWZmZXJlbnQgY29udGV4dHMu
Cj4+Cj4+IE9ubHkgaWYgdGhlIHNkIGRldmljZSBzdXNwZW5kcy4KPj4KPiBDb3JyZWN0LiBXaGF0
J2Qgc3RvcCB0aGUgc2QgZGV2aWNlIGZyb20gc3VzcGVuZGluZz8KPiBXZSBzaG91bGQgYmUgc3Rv
cHBpbmcgdGhlIHNkIGRldmljZSBmcm9tIHN1c3BlbmRpbmcgaGVyZSAtIGltaG8uCgpZb3UgbWVh
biBmb3IgcGVyZm9ybWFuY2UgcmVhc29ucy4gIFRoYXQgaXMgc29tZXRoaW5nIHdlIGNhbgpsb29r
IGF0LCBidXQgbGV0J3MgZ2V0IGl0IHdvcmtpbmcgZmlyc3QuCgo+IAo+Pj4gSW4gdGhhdCBjYXNl
LCB0aGUgdXNhZ2VfY291bnQgb2Ygc3VwcGxpZXIgd291bGQgYmUgZGVjcmVtZW50ZWQgdW50aWwg
cnBtX2FjdGl2ZSBvZiB0aGlzIGxpbmsgYmVjb21lcyAxLgo+Pgo+PiBSaWdodCwgYmVjYXVzZSB0
aGUgc2QgZGV2aWNlIHN1c3BlbmRlZC4KPj4KPj4+IE5vdyB0aGUgcG1fcnVudGltZV9nZXRfc3Vw
cGxpZXJzKCkgZXhwZWN0cyB0aGUgbGlua19hY3RpdmUgdG8gYmUgbW9yZSB0aGFuIDEuCj4+Cj4+
IE5vdCBzdXJlIHdoYXQgeW91IG1lYW4gaGVyZS4gcG1fcnVudGltZV8qcHV0Kl9zdXBwbGllcnMo
KSB3b24ndCBkbyBhbnl0aGluZyBpZiB0aGUgbGluayBjb3VudCBpcyAxLgo+IEknbSByZWZlcnJp
bmcgdG8gdGhlIGxvZ3MgdGhhdCBJIHBhc3RlZCBiZWZvcmU6Cj4gW8KgwqDCoCA2Ljk0MTI2N11b
wqDCoMKgIFQ3XSBzY3NpIDA6MDowOjQ6IHJwbV9wdXRfc3VwcGxpZXJzOiBbQkVGXSBTdXBwICgw
OjA6MDo0OTQ4OCkgdXNhZ2VfY291bnQ6IDQgcnBtX2FjdGl2ZTogMwo+IAo+IC0tLS0tLSBUMTk2
IENvbnRleHQgY29tZXMgaW4gd2hpbGUgVDcgaXMgcnVubmluZyAtLS0tLS0tLS0tCj4gW8KgwqDC
oCA2Ljk0MTQ2Nl1bwqAgVDE5Nl0gc2NzaSAwOjA6MDo0OiBwbV9ydW50aW1lX2dldF9zdXBwbGll
cnM6ICgwOjA6MDo0OTQ4OCk6IHN1cHA6IHVzYWdlX2NvdW50OiA1IHJwbV9hY3RpdmU6IDQKPiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+IAo+IFvCoMKgwqAgNy43ODgzOTddW8KgwqDCoCBUN10gc2NzaSAwOjA6MDo0OiBycG1f
cHV0X3N1cHBsaWVyczogW0FGVF0gU3VwcCAoMDowOjA6NDk0ODgpIHVzYWdlX2NvdW50OiAyIHJw
bV9hY3RpdmU6IDEKPiAKPiBJIG1lYW50IHRvIHNheSB0aGF0LCBpZiB0aGUgcnBtX3B1dF9zdXBw
bGllcnMoKSBpcyBpbnZva2VkIGFmdGVyIHRoZSBwbV9ydW50aW1lX2dldF9zdXBwbGllcnMoKSBh
cyBpcyBzZWVuIGFib3ZlIHRoZW4gdGhlIGxpbmtfYWN0aXZlIG1heSBiZWNvbWUgMSBldmVuICph
ZnRlciogcG1fcnVudGltZV9nZXRfc3VwcGxpZXJzKCkgaXMgaW52b2tlZC4KPiAKPiBJJ20gcmVm
ZXJyaW5nIHRvIHRoZSBwbV9ydW50aW1lX2dldF9zdXBwbGllcnMoKSBpbnZva2VkIGZyb206Cj4g
ZHJpdmVyX3Byb2JlX2RldmljZSgpIC0gc2F5IGZvciwgc2QgMDowOjA6eAo+IMKgwqDCoMKgfC0g
cG1fcnVudGltZV9nZXRfc3VwcGxpZXJzKCkgLSBmb3Igc2QgMDowOjA6NDk0ODgKCkkgYW0gaG9w
aW5nIHRoYXQgd2FzIHRoZSBwcm9ibGVtIHRoYXQgUmFmYWVsJ3MgcmV2ZXJ0IGRlYWx0IHdpdGgu
Cgo+Pgo+Pj4gTm93IHRoZW4sIHRoZXJlIGNvbWVzIGEgdGltZSwgdGhhdCB3aGVuIHNkX3Byb2Jl
KCkgc2NoZWR1bGVzIGEgc3VzcGVuZCwgdGhlIHN1cHBsaWVyIHVzYWdlX2NvdW50IGJlY29tZXMg
MCBhbmQgdGhlIGxpbmtfYWN0aXZlIGJlY29tZXMgMS4KPj4+IEFuZCB0aGUgc3VwcGxpZXIgc3Vz
cGVuZHMgYmVmb3JlIHRoZSBjb25zdW1lci4KPj4KPj4gc2QgcHJvYmUgZmlyc3QgcmVzdW1lcyB0
aGUgc2QgZGV2aWNlIHdoaWNoIHdpbGwgcmVzdW1lIHRoZSBzdXBwbGllci4KPj4KPiBDb3JyZWN0
LCBidXQgaXQnZCBhZ2FpbiBzY2hlZHVsZSBhIHN1c3BlbmQgKHNpbmNlIGF1dG9zdXNwZW5kIGlz
IGVuYWJsZWQgbm93KSBhdCB0aGUgZW5kIG9mIHRoZSBzZF9wcm9iZSgpLgo+IFRoZXJlYWZ0ZXIs
IHBtX3J1bnRpbWVfcHV0X3N1cHBsaWVycygpKHNkIDA6MDowOjQ5NDg4KSBpcyBpbnZva2VkIGZy
b20gZHJpdmVyX3Byb2JlX2RldmljZSgpIHdoaWNoIGhhZCBhY3R1YWxseSBpbnZva2VkIHNkX3By
b2JlKCkuCj4gVGhhdCdkIG1ha2UgdGhlIGxpbmtfYWN0aXZlIHRvIDEgZXZlbiB3aGVuIHNkIDA6
MDowOnggaXMgYWN0aXZlLgoKSWYgc2QgMDowOjA6eCBpcyBhY3RpdmUgdGhlbiBycG1fZ2V0X3N1
cHBsaWVycygpIHN0aWxsIGhhcyArMSBycG1fYWN0aXZlLiBwbV9ydW50aW1lX2dldF9zdXBwbGll
cnMoKSBhbHNvIGhhcyArMSBycG1fYWN0aXZlLgppLmUuIHJwbV9hY3RpdmUgaXMgMy4gSWYgcnBt
X3B1dF9zdXBwbGllcnMoKSBpcyBjYWxsZWQsIGl0IG1lYW5zIHNkIDA6MDowOnggaGFzIHJlYWxs
eSBydW50aW1lIHN1c3BlbmRlZCAobm90IGp1c3Qgd2FpdGluZyBmb3IgYXV0b3N1c3BlbmQuICBP
dGhlcndpc2Ugd2hlbiB0aGUgcHJvYmUgZW5kcyBwbV9ydW50aW1lX3B1dF9zdXBwbGllcnMoKSB3
aWxsIGRyb3AgcnBtX2FjdGl2ZSBmcm9tIDMgdG8gMi4KCkJ1dCBpdCBpcyBhIGJpdCB0aGVvcmV0
aWNhbC4gIExldCdzIHRyeSBpdCBhbmQgc2VlLgoKPiAKPj4+Cj4+PiBTbyBJIHdhcyB3b25kZXJp
bmcsIHdoYXQnZCBtYWtlIHN1cmUgdGhhdCB0aGUgcG1fcnVudGltZV9nZXRfc3VwcGxpZXJzKCkg
ZnJvbSBkcml2ZXJfcHJvYmVfZGV2aWNlKCkgaXMgaW52b2tlZCBhZnRlciBzY3NpX2F1dG9wbV9w
dXRfZGV2aWNlKCkgKDEpIGZpbmlzaGVzIHRoZSBycG1fcHV0X3N1cHBsaWVycygpLgo+Pj4KPj4+
IEFtIG5vdCBzdXJlIGlmIEknbSBtaXNzaW5nIHNvbWV0aGluZyBpbiB0aGlzLgo+Pj4gRG8geW91
IHRoaW5rLCB0aGUgY3VycmVudCBjaGFuZ2VzIGFsb25lIGNhbiBmaXggdGhlIGFib3ZlIGlzc3Vl
Pwo+Pgo+PiBZZXMsIGJ1dCBsZXQncyBzZWUuCj4+Cj4gRXNzZW50aWFsbHksIHdlIHNob3VsZCBz
dG9wIHRoZSBzZCBkZXZpY2UgZnJvbSBydW50aW1lIHN1c3BlbmRpbmcgdW50aWwgaXQncyBwcm9i
ZSBpcyBkb25lLiBUaGVuIGFsbG93IHRoZSBzYW1lLiBEb2VzIGl0IG1ha2Ugc2Vuc2U/Cj4gUGxl
YXNlIGxldCBtZSBrbm93IHdoYXQgeW91IHRoaW5rLgoKSSByZWFsbHkgdGhpbmsgaXQgd291bGQg
YmUgZ29vZCB0byB0cnkgdGhlIGNoYW5nZXMgdGhhdCBoYXZlIGJlZW4gaWRlbnRpZmllZCBhbmQg
c2VlIGhvdyBpdCBiZWhhdmVzLgoKVGhlbiBnbyBmcm9tIHRoZXJlLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
