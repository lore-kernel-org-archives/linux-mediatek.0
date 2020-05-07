Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D285C38A24
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 16:34:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB1C2073A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 16:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pzPvCZGH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Hlj6/evD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDB1C2073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WjoVaQMG2+EIXPRAEd960RrL8B42MNPl0nFD/vKmZ14=; b=pzPvCZGHRFFGdwBZd2STkiqYo
	BdJhDTLLLPmsAEuzHMpqdOhYvXMgrpggbX5yyq4Ragr/d5Tu5/pNPmuWGNA7Alo0bIuizlEV9k2hI
	WITFIO71iCSCzm/p9cc8F3yxhepA2To7YBq4LQdzuKUbooaZ/ZgSL0bYfCOQ4YZjEeX+mu3H6cp3/
	zvp9cvBbZM80a1BOCveM0RzI8vOIAGlHilBhRs4kfpkCxZeT3UD04cebz4GQg5y2ZEePaK/t+4QGL
	2cy/pYcz2Bj2/r0lMJx8nti3h9xj5WARaCDIYcEpMRlFzI5NuiC89tA0DSN0RoGF1c4H2ht3z0HRw
	Nk8axsLhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWjTA-00018b-9U; Thu, 07 May 2020 16:33:56 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWjT2-00015e-QM
 for linux-mediatek@lists.infradead.org; Thu, 07 May 2020 16:33:54 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588869233; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=wLT5CFLaqtgLB/BEi/RGwsauWrW4mdPxSqIRzxuvoL8=;
 b=Hlj6/evDDevQJ+GwoPih7LVdBCV0juxhBS/A8D5/sShb3zdfO7gpMpH+Nnmb7oFa+guQ7h4i
 /P/XxoSxcIdbvw6+7IoDGZT4iygrR7PN5BjFBLXEvIcNpXTm03Xdfce+taRlHBoFmP+0232V
 qY7EAEiCrgY1HPg+Ree+MCl0+Y8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb43865.7fc768d171b8-smtp-out-n03;
 Thu, 07 May 2020 16:33:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C2E0AC4478C; Thu,  7 May 2020 16:33:41 +0000 (UTC)
Received: from [192.168.0.106] (unknown [183.83.65.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: vbadigan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B9BCC433D2;
 Thu,  7 May 2020 16:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6B9BCC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH v5 1/5] mmc: core: Extend mmc_of_parse() to parse CQE
 bindings
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
 <1588031768-23677-2-git-send-email-chun-hung.wu@mediatek.com>
 <9bc2454f-0b42-e256-7927-2564b56f369f@codeaurora.org>
 <CAPDyKFq7ffHeWg-S41tLvScg_BXCUULig=G=EzD_to1TG0NhVg@mail.gmail.com>
From: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <f9fa0232-3945-4e47-9238-0b51f6531199@codeaurora.org>
Date: Thu, 7 May 2020 22:03:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFq7ffHeWg-S41tLvScg_BXCUULig=G=EzD_to1TG0NhVg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_093353_272701_DCFABB80 
X-CRM114-Status: GOOD (  23.25  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>, wsd_upstream@mediatek.com,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Al Cooper <alcooperx@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
 BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
 Allison Randal <allison@lohutok.net>,
 Android Kernel Team <kernel-team@android.com>, Pan Bian <bianpan2016@163.com>,
 DTML <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Chun-Hung Wu <chun-hung.wu@mediatek.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Yong Mao <yong.mao@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Ck9uIDUvNi8yMDIwIDEwOjA2IFBNLCBVbGYgSGFuc3NvbiB3cm90ZToKPiBPbiBXZWQsIDYgTWF5
IDIwMjAgYXQgMTU6MDEsIFZlZXJhYmhhZHJhcmFvIEJhZGlnYW50aQo+IDx2YmFkaWdhbkBjb2Rl
YXVyb3JhLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDQvMjgvMjAyMCA1OjI2IEFNLCBDaHVuLUh1bmcg
V3Ugd3JvdGU6Cj4+PiBQYXJzZSBDUUUgYmluZGluZ3MgInN1cHBvcnRzLWNxZSIgYW5kICJkaXNh
YmxlLWNxZS1kY21kIgo+Pj4gaW4gbW1jX29mX3BhcnNlKCkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogQ2h1bi1IdW5nIFd1IDxjaHVuLWh1bmcud3VAbWVkaWF0ZWsuY29tPgo+Pj4gLS0tCj4+PiAg
ICBkcml2ZXJzL21tYy9jb3JlL2hvc3QuYyB8IDUgKysrKysKPj4+ICAgIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvY29yZS9o
b3N0LmMgYi9kcml2ZXJzL21tYy9jb3JlL2hvc3QuYwo+Pj4gaW5kZXggYzg3Njg3Mi4uNDc1MjFj
NiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbW1jL2NvcmUvaG9zdC5jCj4+PiArKysgYi9kcml2
ZXJzL21tYy9jb3JlL2hvc3QuYwo+Pj4gQEAgLTMwMiw2ICszMDIsMTEgQEAgaW50IG1tY19vZl9w
YXJzZShzdHJ1Y3QgbW1jX2hvc3QgKmhvc3QpCj4+PiAgICAgICAgICAgICAgICBob3N0LT5jYXBz
MiB8PSBNTUNfQ0FQMl9OT19TRDsKPj4+ICAgICAgICBpZiAoZGV2aWNlX3Byb3BlcnR5X3JlYWRf
Ym9vbChkZXYsICJuby1tbWMiKSkKPj4+ICAgICAgICAgICAgICAgIGhvc3QtPmNhcHMyIHw9IE1N
Q19DQVAyX05PX01NQzsKPj4+ICsgICAgIGlmIChkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRl
diwgInN1cHBvcnRzLWNxZSIpKQo+Pj4gKyAgICAgICAgICAgICBob3N0LT5jYXBzMiB8PSBNTUNf
Q0FQMl9DUUU7Cj4+IFRoaXMgY2hhbmdlIGlzIGJyZWFraW5nIGVtbWMgZHJpdmVyIG9uIHFjb20g
cGxhdGZvcm1zIHdoZXJlIHRoaXMgZHQKPj4gcHJvcGVydHkgaXMgZGVmaW5lZC4KPj4KPj4gWyAg
ICAxLjU0MzQ1M10gIGNxaGNpX2RlYWN0aXZhdGUrMHhjLzB4MzgKPj4gWyAgICAxLjU0NTYyN10g
IHNkaGNpX21zbV9yZXNldCsweDQwLzB4NTgKPj4gWyAgICAxLjU0OTQ0N10gIHNkaGNpX2RvX3Jl
c2V0KzB4NDgvMHg3Ywo+PiBbICAgIDEuNTUzMTgwXSAgX19zZGhjaV9yZWFkX2NhcHMrMHg3Yy8w
eDIxNAo+PiBbICAgIDEuNTU2OTEzXSAgc2RoY2lfc2V0dXBfaG9zdCsweDU4LzB4Y2U4Cj4+IFsg
ICAgMS41NjA5MDVdICBzZGhjaV9tc21fcHJvYmUrMHg1ODgvMHg4YTQKPj4gWyAgICAxLjU2NDkw
MF0gIHBsYXRmb3JtX2Rydl9wcm9iZSsweDRjLzB4YjAKPj4KPj4gU28sIHdlIGNhbnQgaGF2ZSB0
aGlzIGZsYWcgZGVmaW5lZCBiZWZvcmUgc2RoY2lfc2V0dXBfaG9zdCgpLgo+Pgo+PiBJIHdpbGwg
aGF2ZSB0byBjbGVhciB0aGlzIGNhcCBhbmQgcmUtZW5hYmxlIGl0IGluIG91ciBpbml0aWFsaXph
dGlvbi4KPiBUaGFua3MgZm9yIHJlcG9ydGluZyEgSSBoYXZlIGRyb3BwZWQgYWxsIHRoZSBmb3Vy
IHBhdGNoZXMgZnJvbQo+IENodW4tSHVuZywgc28gd2UgY2FuIGZpZ3VyZSBvdXQgaG93IHRvIGZp
eCB0aGlzLgo+Cj4gUGxlYXNlIGhlbHAgdG8gcmV2aWV3IHRoZSBuZXh0IHZlcnNpb24gb2YgdGhl
IHNlcmllcy4KClRoYW5rcyBVbGYuCgpIaSBDaHVuLUh1bmcsCgpPbiBxY29tIGNvbnRyb2xsZXIg
Q1FFIGFsc28gZ2V0cyByZXNldCB3aGVuIFNESEMgaXMgcmVzZXQuIFNvIHdlIGhhdmUgdG8gCmV4
cGxpY2l0bHkgZGlzYWJsZSBDUUUKYnkgaW52b2tpbmfCoCBjcWhjaV9kZWFjdGl2YXRlKCkgZHVy
aW5nIHNkaGMgcmVzZXQKClNESEMgZ2V0cyByZXNldCBpbiBzZGhjaV9zZXR1cF9ob3N0KCkgZXZl
biBiZWZvcmUgY3FlIGlzIGluaXRpYWxpemVkLgpXaXRoIE1NQ19DQVAyX0NRRV9EQ01EIGNhcCBz
ZXQgZXZlbiBiZWZvcmUgc2RoY2lfc2V0X2hvc3QoKSwgd2UgYXJlIApnZXR0aW5nIG51bGwgcG9p
bnRlciBhY2Nlc3Mgd2l0aCBjcWhjaV9kZWFjdGl2YXRlKCkuCgpJZiBDUUUgZ2V0dGluZyByZXNl
dCB3aXRoIFNESEMgcmVzZXQgaXMgZ2VuZXJpYyAoYXBwbGljYWJsZSB0byBvdGhlciAKY29udHJv
bGxlcnMpIHRoZW4geW91IGhhdmUgcmV2aXNpdCB5b3VyIGxvZ2ljLgpJZiBpdHMgbm90IHRoZSBj
YXNlIHRoZW4gb25seSBxY29tIGRyaXZlciB3b3VsZCBnZXQgYWZmZWN0ZWQuCgpJIHNlZSB5b3Ug
YXJlIHVwZGF0aW5nIHNkaGNpLW1zbS5jIGZpbGUgYXMtd2VsbC4gSG93IGFib3V0IGluY2x1ZGlu
ZyAKYmVsb3cgY2hhbmdlIGJlc2lkZXMgeW91ciBjaGFuZ2U/CgpAQCAtMTY1OCw2ICsxNjU4LDgg
QEAgc3RhdGljIGludCBzZGhjaV9tc21fY3FlX2FkZF9ob3N0KHN0cnVjdCAKc2RoY2lfaG9zdCAq
aG9zdCwKIMKgwqDCoMKgwqDCoMKgIGlmIChob3N0LT5jYXBzICYgU0RIQ0lfQ0FOXzY0QklUKQog
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhvc3QtPmFsbG9jX2Rlc2Nfc3ogPSAxNjsK
CivCoMKgwqDCoMKgwqAgLyogQ2xlYXIgdGhlIENRRSBjYXAgZHVyaW5nIHNldHVwIGhvc3QgKi8K
K8KgwqDCoMKgwqDCoCBtc21faG9zdC0+bW1jLT5jYXBzMiAmPSB+TU1DX0NBUDJfQ1FFOworCiDC
oMKgwqDCoMKgwqDCoCByZXQgPSBzZGhjaV9zZXR1cF9ob3N0KGhvc3QpOwoKPj4+ICsgICAgIGlm
ICghZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkaXNhYmxlLWNxZS1kY21kIikpIHsK
Pj4+ICsgICAgICAgICAgICAgaG9zdC0+Y2FwczIgfD0gTU1DX0NBUDJfQ1FFX0RDTUQ7Cj4+PiAr
ICAgICB9Cj4+Pgo+Pj4gICAgICAgIC8qIE11c3QgYmUgYWZ0ZXIgIm5vbi1yZW1vdmFibGUiIGNo
ZWNrICovCj4+PiAgICAgICAgaWYgKGRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMihkZXYsICJmaXhl
ZC1lbW1jLWRyaXZlci10eXBlIiwgJmRydl90eXBlKSA9PSAwKSB7Cj4gS2luZCByZWdhcmRzCj4g
VWZmZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
