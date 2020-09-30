Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091E9C4727E
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 09:40:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F71620754
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 09:40:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NmRgfXe1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F71620754
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rw5CwbHLYnIP6flMbyaDgN7z23345tG41H+1szx4F84=; b=NmRgfXe1xupTu4g8N9eMTpnfK
	cjKlDmHPE1TQD5ykpg5+TAhBV98UqP0jJVzo6fKoaKHI4QKnVMYT6BpW/XM07QdTf6npI+se0nMdo
	M6AvTP3jFdow7gNLwUgB0R+QpXPWCtOQ0qCwynVJWVNY3HYtwIO6GX++TwRgTBvItfz84G0QpnKs1
	7niH4HBGinvt+a3GLBahFgqrZofqAViZREc2vy/FweJhIatWJqa15bEdN1X66YIhD1eYSfWS55KGp
	nscgZ/eOoydSfnkuGFNK0hzC4rWQ6CXyohiVVE5J07RbJ5HtDajj86HzOlujyKGrD8dvjVSmuUkgB
	rLKKEgeyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNYap-0007yP-ML; Wed, 30 Sep 2020 09:40:11 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNYah-0007tB-AS; Wed, 30 Sep 2020 09:40:05 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 54EA5A4AE3B61CDE5BB6;
 Wed, 30 Sep 2020 17:39:52 +0800 (CST)
Received: from [10.174.179.91] (10.174.179.91) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Wed, 30 Sep 2020 17:39:47 +0800
Subject: Re: [PATCH -next] pinctrl: mediatek: simplify the return expression
 of mtk_pinconf_bias_disable_set_rev1()
To: Linus Walleij <linus.walleij@linaro.org>
References: <20200921131056.92848-1-miaoqinglang@huawei.com>
 <CACRpkdZxgw7zmmWyVpxQ5N60Yxzj+u_LPAkRGN0qS3A4DqKNgw@mail.gmail.com>
From: miaoqinglang <miaoqinglang@huawei.com>
Message-ID: <5a88741a-15b8-e81a-0161-89442a7a1d82@huawei.com>
Date: Wed, 30 Sep 2020 17:39:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZxgw7zmmWyVpxQ5N60Yxzj+u_LPAkRGN0qS3A4DqKNgw@mail.gmail.com>
X-Originating-IP: [10.174.179.91]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_054004_157465_66A91FC6 
X-CRM114-Status: GOOD (  10.31  )
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
Cc: Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMC85LzMwIDE2OjUzLCBMaW51cyBXYWxsZWlqIOWGmemBkzoKPiBPbiBNb24sIFNl
cCAyMSwgMjAyMCBhdCAzOjEwIFBNIFFpbmdsYW5nIE1pYW8gPG1pYW9xaW5nbGFuZ0BodWF3ZWku
Y29tPiB3cm90ZToKPiAKPj4gU2ltcGxpZnkgdGhlIHJldHVybiBleHByZXNzaW9uLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBRaW5nbGFuZyBNaWFvIDxtaWFvcWluZ2xhbmdAaHVhd2VpLmNvbT4KPiAK
PiBUaGlzIHBhdGNoIGRvZXMgbm90IGFwcGx5IHRvIHRoZSBwaW5jdHJsICJkZXZlbCIgYnJhbmNo
LCBwbGVhc2UKPiByZWJhc2UgYW5kIHJlc2VuZCwgaW5jbHVkZSBTZWFuJ3MgQUNLLgo+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2xpbnVzdy9saW51eC1w
aW5jdHJsLmdpdC9sb2cvP2g9ZGV2ZWwKPiAKPiBZb3VycywKPiBMaW51cyBXYWxsZWlqCj4gLgo+
IApIaSBMaW51cywKCkkgdHJpZWQgdG8gcmViYXNlIHRoaXMgcGF0Y2ggdG8gdGhlIHBpbmN0cmwg
ImRldmVsIiBicmFuY2ggYnV0IHRoZXJlJ3MgCm5vIGNvbmZsaWN0LiBDb3VsZCB5b3UgcGxlYXNl
IHRyeSBhZ2FpbiBvciBzaG93IG1lIHNvbWUgZGV0YWlscz8KClRoYW5rcy4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
