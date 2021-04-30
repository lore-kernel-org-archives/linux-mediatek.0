Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D73C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 07:55:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03B7A610A0
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 07:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03B7A610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/GyoF4EsipXIIJ6BjnKsJGfbZym8iK58lsowfUTW5cE=; b=hqdLwJM3v0GUM6ggDabjMvhCg
	MMMoFkgX7GMGzn5fAqsj/APmY/AD4dSycVXNL3ik/pma2WU69OUW0JXzdPJqxavIM3BeYPXWjDYD0
	rQvKQ7kuza3saiP5qzIIrd1+Gvr8ztdH3DDoFYwriJef0HluiWCbZNZhBodt1CnWBdMQzyUY6FMVs
	N333fBl4mBfKWxo9PP+zQeEoOadxyuo/RRHOaZMJnzUk3dYTYEHpvVjw7JJ6bneXJMZEKqoNjtU9J
	amdQrsQRFS//3UcDw4cgVjiyBCDNtfCz0zrst1GjvT5IiBk4gJ+o476Vd++5hGJa2E5La9w3fgjG5
	JzRpO8HcA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcNzA-007Sg2-0v; Fri, 30 Apr 2021 07:54:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcNz7-007Sfl-Cp
 for linux-mediatek@desiato.infradead.org; Fri, 30 Apr 2021 07:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=92hc+HRLu35ANa2X0DRAKPIP2CSkzjLzsir5c4y49XU=; b=cz5TYsajlZCpmhmEEZF9/6nD62
 2YqIF7X4daV7BQ1yfUY3RpRO82SW2HiXi5LPB0lTtdOHoH+cYK63P0/+fBa2gwMrDrehksJ4l4Iud
 BD4BVj0iaGfPJmifxd7p+Ubw9tgCXG6CwsWp4opgK+a+RgM5DAGfxrd/+Us4jAuAFnDh+3DkTkaBD
 FQexJrukHqeoE+shRyhgqi+WfG09sR0JVxoJs6dKrxst6M8UeeljYoZs9+kwq4u0nvkyUMpKLhsa7
 CIhFEgU2GJAT+tQ0cTS4U//tAe8IlNFgGMzWV6WOAGqIJm5+81lUSkq16CV2+E8j+ufRBojn9mDx/
 tNaD+1oQ==;
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lcNz4-001DTE-4F
 for linux-mediatek@lists.infradead.org; Fri, 30 Apr 2021 07:54:48 +0000
Received: from [192.168.1.18] ([86.243.172.93]) by mwinf5d87 with ME
 id yvn72400521Fzsu03vn7oy; Fri, 30 Apr 2021 09:47:08 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 30 Apr 2021 09:47:08 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [PATCH][next] PCI: mediatek-gen3: Add missing null pointer check
To: Colin King <colin.king@canonical.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210429110040.63119-1-colin.king@canonical.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <7a512e3a-2897-ac12-ac6e-06be28735279@wanadoo.fr>
Date: Fri, 30 Apr 2021 09:47:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210429110040.63119-1-colin.king@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_005446_463494_94948A2C 
X-CRM114-Status: GOOD (  15.49  )
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

TGUgMjkvMDQvMjAyMSDDoCAxMzowMCwgQ29saW4gS2luZyBhIMOpY3JpdMKgOgo+IEZyb206IENv
bGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gVGhlIGNhbGwgdG8g
cGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZSBjYW4gcG90ZW50aWFsbHkgcmV0dXJuIG51bGws
IHNvCj4gYWRkIGEgbnVsbCBwb2ludGVyIGNoZWNrIHRvIGF2b2lkIGEgbnVsbCBwb2ludGVyIGRl
cmVmZXJlbmNlIGlzc3VlLgo+IAo+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJEZXJlZmVyZW5jZSBu
dWxsIHJldHVybiIpCj4gRml4ZXM6IDQ0MTkwM2Q5ZThmMCAoIlBDSTogbWVkaWF0ZWstZ2VuMzog
QWRkIE1lZGlhVGVrIEdlbjMgZHJpdmVyIGZvciBNVDgxOTIiKQo+IFNpZ25lZC1vZmYtYnk6IENv
bGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gLS0tCj4gICBkcml2ZXJz
L3BjaS9jb250cm9sbGVyL3BjaWUtbWVkaWF0ZWstZ2VuMy5jIHwgMiArKwo+ICAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL3BjaWUtbWVkaWF0ZWstZ2VuMy5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ll
LW1lZGlhdGVrLWdlbjMuYwo+IGluZGV4IDIwMTY1ZTRhNzViMi4uM2M1Yjk3NzE2ZDQwIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tZWRpYXRlay1nZW4zLmMKPiAr
KysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWVkaWF0ZWstZ2VuMy5jCj4gQEAgLTcy
MSw2ICs3MjEsOCBAQCBzdGF0aWMgaW50IG10a19wY2llX3BhcnNlX3BvcnQoc3RydWN0IG10a19w
Y2llX3BvcnQgKnBvcnQpCj4gICAJaW50IHJldDsKPiAgIAo+ICAgCXJlZ3MgPSBwbGF0Zm9ybV9n
ZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAicGNpZS1tYWMiKTsKPiAr
CWlmICghcmVncykKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiAgIAlwb3J0LT5iYXNlID0gZGV2bV9p
b3JlbWFwX3Jlc291cmNlKGRldiwgcmVncyk7Cj4gICAJaWYgKElTX0VSUihwb3J0LT5iYXNlKSkg
ewo+ICAgCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBtYXAgcmVnaXN0ZXIgYmFzZVxuIik7Cj4g
CgpOaXRwaWNrOgogICAgVXNpbmcgJ2Rldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZV9ieW5h
bWUnIGlzIHNsaWdodGx5IGxlc3MgCnZlcmJvc2UgYW5kIHNob3VsZCBwbGVhc2UgQ292ZXJpdHku
CgoKQWxzbywgd2hpY2ggZ2l0IHJlcG8gYXJlIHlvdSB1c2luZz8gT24gbGludXgtbmV4dCAoWzEp
XSwgeW91ciBwcm9wb3NlZCAKcGF0Y2ggaXMgYWxyZWFkeSBwYXJ0IG9mICJQQ0k6IG1lZGlhdGVr
LWdlbjM6IEFkZCBNZWRpYVRlayBHZW4zIGRyaXZlciAKZm9yIE1UODE5MiIuCgpbMV06IApodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5l
eHQuZ2l0L2xvZy9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWVkaWF0ZWstZ2VuMy5jCgpD
SgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
