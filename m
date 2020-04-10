Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99048C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 11:35:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A12020753
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 11:35:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VU5cUx4K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A12020753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3EjKZk5PreOUClWMF7NE+Ilrx+Gh6oN25h1/JL8DDRE=; b=VU5cUx4Ko7phso1KB5WEEqBy1
	pUTbdG+mNbBaiBcyxDlbixFVnVRKjDJrJu7mzEyEe7Xj6I6Sg4DxC2E+ibet8Jd5SuC9pNQt0RFtv
	XEAk9hv2nTT2A8kGGCcw6QroF/z+Gmbzu0wg2aLaSELMFXioCvrb0Af84jrFinQ8dcWmSnP0VbItC
	rugXJxxJBLRA/ilNmequcYl5B0nHk7QnuaFOqxVBjVzWNPh5wN3vl0j9aXE1sinfsCw4anjSqzbVY
	1zPquzFiZGSrmS2RNOKjC9o/XWTq5N+1Z8Bn0hjQ3ef9WVqKVzvVrRpk2hobOV6oZ7tMxQhAeVhzf
	3a9oajWvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMrwL-0000rE-Po; Fri, 10 Apr 2020 11:35:17 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMrwE-0000GU-PX; Fri, 10 Apr 2020 11:35:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B4F11FB;
 Fri, 10 Apr 2020 04:35:09 -0700 (PDT)
Received: from [10.37.12.30] (unknown [10.37.12.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB3573F73D;
 Fri, 10 Apr 2020 04:34:58 -0700 (PDT)
Subject: Re: [PATCH v6 04/10] PM / EM: add support for other devices than CPUs
 in Energy Model
To: Luis Gerhorst <linux-kernel@luisgerhorst.de>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-5-lukasz.luba@arm.com>
 <87ftdboaqr.fsf@luis-debian.luis-debian-domain>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <56053904-0314-340e-fdaa-4a8f649d7b6f@arm.com>
Date: Fri, 10 Apr 2020 12:34:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87ftdboaqr.fsf@luis-debian.luis-debian-domain>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_043510_923312_3C99E3B9 
X-CRM114-Status: GOOD (  19.26  )
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, festevam@gmail.com, mka@chromium.org,
 robh@kernel.org, amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 b.zolnierkie@samsung.com, kernel@pengutronix.de, sudeep.holla@arm.com,
 patrick.bellasi@matbug.net, shawnguo@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiA0LzEwLzIwIDEyOjEyIFBNLCBMdWlzIEdlcmhvcnN0IHdyb3RlOgo+IAo+IEx1a2FzeiBM
dWJhIHdyaXRlczoKPiAKPj4gKy8qKgo+PiArICogZW1fZGV2X3VucmVnaXN0ZXJfcGVyZl9kb21h
aW4oKSAtIFVucmVnaXN0ZXIgRW5lcmd5IE1vZGVsIChFTSkgZm9yIAo+PiBhIGRldmljZQo+PiAr
ICogQGRldsKgwqDCoMKgwqDCoMKgIDogRGV2aWNlIGZvciB3aGljaCB0aGUgRU0gaXMgcmVnaXN0
ZXJlZAo+PiArICoKPj4gKyAqIFRyeSB0byB1bnJlZ2lzdGVyIHRoZSBFTSBmb3IgdGhlIHNwZWNp
ZmllZCBkZXZpY2UgKGl0IGNoZWNrcyBjdXJyZW50Cj4+ICsgKiByZWZlcmVuY2UgY291bnRlciku
IFRoZSBFTSBmb3IgQ1BVcyB3aWxsIG5vdCBiZSBmcmVlZC4KPj4gKyAqLwo+PiArdm9pZCBlbV9k
ZXZfdW5yZWdpc3Rlcl9wZXJmX2RvbWFpbihzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+ICt7Cj4+ICvC
oMKgwqAgc3RydWN0IGVtX2RldmljZSAqZW1fZGV2LCAqdG1wOwo+PiArCj4+ICvCoMKgwqAgaWYg
KElTX0VSUl9PUl9OVUxMKGRldikpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+ICsKPj4g
K8KgwqDCoCAvKiBXZSBkb24ndCBzdXBwb3J0IGZyZWVpbmcgQ1BVIHN0cnVjdHVyZXMgaW4gaG90
cGx1ZyAqLwo+PiArwqDCoMKgIGlmIChfaXNfY3B1X2RldmljZShkZXYpKSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoCBkZXZfZGJnX29uY2UoZGV2LCAiRU06IHRoZSBzdHJ1Y3R1cmVzIGFyZSBub3QgZ29p
bmcgdG8gYmUgCj4+IHJlbW92ZWRcbiIpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+PiAr
wqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIG11dGV4X2xvY2soJmVtX3BkX211dGV4KTsKPj4gKwo+
PiArwqDCoMKgIGlmIChsaXN0X2VtcHR5KCZlbV9wZF9kZXZfbGlzdCkpIHsKPj4gK8KgwqDCoMKg
wqDCoMKgIG11dGV4X3VubG9jaygmZW1fcGRfbXV0ZXgpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuOwo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2Fm
ZShlbV9kZXYsIHRtcCwgJmVtX3BkX2Rldl9saXN0LCAKPj4gZW1fZGV2X2xpc3QpIHsKPj4gK8Kg
wqDCoMKgwqDCoMKgIGlmIChlbV9kZXYtPmRldiA9PSBkZXYpIHsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAga3JlZl9wdXQoJmVtX2Rldi0+a3JlZiwgX2VtX3JlbGVhc2UpOwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4gK8KgwqDCoCB9
Cj4+ICsKPj4gK8KgwqDCoCBtdXRleF91bmxvY2soJmVtX3BkX211dGV4KTsKPj4gK30KPj4gK0VY
UE9SVF9TWU1CT0xfR1BMKGVtX2Rldl91bnJlZ2lzdGVyX3BlcmZfZG9tYWluKTsKPiAKPiBPaywg
c28gZW1fZGV2X3VucmVnaXN0ZXJfcGVyZl9kb21haW4oKSBkb2VzIG5vdCBzdXBwb3J0IHRoZSBD
UFUgZGV2aWNlCj4gYW5kIGEgc3Vic2VxdWVudCBlbV9yZWdpc3Rlcl9wZXJmX2RvbWFpbigpIHdp
bGwgZmFpbCB3aXRoIEVFWElTVC4KCkNvcnJlY3QuIEF0IHRoZSBjdXJyZW50IG1haW5saW5lIEVu
ZXJneSBNb2RlbCB3ZSBkb24ndCBldmVuIGhhdmUKZW1fdW5yZWdpc3Rlcl9wZXJmX2RvbWFpbiBm
dW5jdGlvbi4gSSBoYWQgdG8gaW50cm9kdWNlIGl0IGluIG9yZGVyCnRvIHN1cHBvcnQgb3RoZXIg
ZGV2aWNlcyB3aGljaCBtaWdodCBoYXZlIGRyaXZlcnMgbG9hZGVkL3VubG9hZGVkCmFzIG1vZHVs
ZXMuCgoKPiAKPiBJcyB0aGVyZSBhIHdheSB0byB1bnJlZ2lzdGVyL2NoYW5nZSB0aGUgQ1BVJ3Mg
ZW5lcmd5IG1vZGVsIGR1cmluZwo+IHJ1bnRpbWUgd2l0aG91dCByZXN0YXJ0aW5nIHRoZSB3aG9s
ZSBzeXN0ZW0/CgpOb3QgZm9yIHRoZSBDUFUgZm9yIG5vdy4KCkl0IGlzIHBvc3NpYmxlIGZvciBv
dGhlciBkZXZpY2VzLiBXaGVuIHlvdSBoYXZlIGkuZS4gYSBtb2R1bGUgZHJpdmVyIGZvcgphIGRl
dmljZSBhbmQgaW4geW91ciBjb2RlIHRoZXJlIGlzIGEgKCphY3RpdmVfcG93ZXIpKCksIHRoZW4g
aXQgaXMKcG9zc2libGUgdG8gY2hhbmdlIEVNIGJ5IHVubG9hZGluZy9sb2FkaW5nIHRoZSBtb2R1
bGUuCgpGb3IgdGhlIENQVSB3ZSBkb24ndCBoYXZlIHRoaXMgcmVxdWlyZW1lbnQgZm9yIHByb2R1
Y3Rpb24gY29kZS4gSSB3aWxsCmFkZCB5b3UgdG8gQ0MgbGlzdCB3aGVuIHNvbWV0aGluZyBsaWtl
IHRoaXMgd291bGQgcG9wLXVwIGZvciBhCnByb3RvdHlwaW5nL2V4cGVyaW1lbnRhdGlvbiBjb2Rl
LiBXZSBoYXZlIGJlZW4gYW5hbHl6aW5nIHNvbWUgb3B0aW9ucy4KClJlZ2FyZHMsCkx1a2FzegoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
