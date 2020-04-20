Return-Path: <SRS0=eXAR=6E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97DEC3815B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 12:35:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F978206D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 12:35:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f4NFWkcH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F978206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VsK2Jq6Fy+7bjeaNY2qxuViXSMOgMsUJeOoysEm1G0k=; b=f4NFWkcHQQiNJyOoughXFqpYp
	ekE9Zr8WrkooWwiHfD353SFbmJoO4cFzUbaLZZ5cjh08x7hoAxmGxTNLnNg5x6AdTehuoyrQkNRxN
	gbZr6eeMdlfsM9aus8MXsMwfPxeM7JHkySLkX1QRLBYzis95v3ln3WBOPcy4RJEEvfuqyn+vM7m0q
	HymZHoIcPU06gIt1CT9iSdv7TBvNJw9tBoIBSUmBTT+MXeACGstfSsHWHXD1WemfH8JYuU881Pzvc
	+EmRLRivyRwC/Lt+gGwW9309gbtsNzpmMdq2pVeMJER4WIuubKn+nQ88BlJ7SLrkpTKBR744fbkHI
	5E3686Qfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQVe7-0004bP-0w; Mon, 20 Apr 2020 12:35:31 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQVdf-0001kc-MX; Mon, 20 Apr 2020 12:35:05 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 42114F8280CD990CF8CC;
 Mon, 20 Apr 2020 20:35:01 +0800 (CST)
Received: from [127.0.0.1] (10.166.213.7) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 20 Apr 2020
 20:34:59 +0800
Subject: Re: [PATCH] staging: mt7621-pinctrl: Use correct pointer type
 argument for sizeof
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20200420123755.4353-1-yanaijie@huawei.com>
 <20200420121900.GD2659@kadam>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <c6b155a6-28ae-e0f9-b866-4d17e8a45706@huawei.com>
Date: Mon, 20 Apr 2020 20:34:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200420121900.GD2659@kadam>
X-Originating-IP: [10.166.213.7]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_053503_940758_14D4BDB2 
X-CRM114-Status: GOOD (  11.94  )
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
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 nishkadg.linux@gmail.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgrU2iAyMDIwLzQvMjAgMjA6MTksIERhbiBDYXJwZW50ZXIg0LS1wDoKPiBPbiBNb24sIEFwciAy
MCwgMjAyMCBhdCAwODozNzo1NVBNICswODAwLCBKYXNvbiBZYW4gd3JvdGU6Cj4+IEZpeCB0aGUg
Zm9sbG93aW5nIGNvY2NpY2hlY2sgd2FybmluZzoKPj4KPj4gZHJpdmVycy9zdGFnaW5nL210NzYy
MS1waW5jdHJsL3BpbmN0cmwtcnQyODgwLmM6MjIzOjE0LTM2OiBXQVJOSU5HOiBVc2UKPj4gY29y
cmVjdCBwb2ludGVyIHR5cGUgYXJndW1lbnQgZm9yIHNpemVvZgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvc3Rh
Z2luZy9tdDc2MjEtcGluY3RybC9waW5jdHJsLXJ0Mjg4MC5jIHwgMiArLQo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zdGFnaW5nL210NzYyMS1waW5jdHJsL3BpbmN0cmwtcnQyODgwLmMgYi9kcml2ZXJz
L3N0YWdpbmcvbXQ3NjIxLXBpbmN0cmwvcGluY3RybC1ydDI4ODAuYwo+PiBpbmRleCBkMGYwNjc5
MGQzOGYuLjg4ODNmMmE4ZWE1NyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL210NzYy
MS1waW5jdHJsL3BpbmN0cmwtcnQyODgwLmMKPj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL210NzYy
MS1waW5jdHJsL3BpbmN0cmwtcnQyODgwLmMKPj4gQEAgLTIyMCw3ICsyMjAsNyBAQCBzdGF0aWMg
aW50IHJ0Mjg4MF9waW5tdXhfaW5kZXgoc3RydWN0IHJ0Mjg4MF9wcml2ICpwKQo+PiAgIAkvKiBh
bGxvY2F0ZSBvdXIgZnVuY3Rpb24gYW5kIGdyb3VwIG1hcHBpbmcgaW5kZXggYnVmZmVycyAqLwo+
PiAgIAlmID0gcC0+ZnVuYyA9IGRldm1fa2NhbGxvYyhwLT5kZXYsCj4+ICAgCQkJCSAgIHAtPmZ1
bmNfY291bnQsCj4+IC0JCQkJICAgc2l6ZW9mKHN0cnVjdCBydDI4ODBfcG14X2Z1bmMpLAo+PiAr
CQkJCSAgIHNpemVvZihzdHJ1Y3QgcnQyODgwX3BteF9mdW5jICopLAo+IAo+IFllcy4gIFRoaXMg
Zml4ZXMgYSBidWcuICBXZSB3ZXJlIGFsbG9jYXRpbmcgdG9vIG11Y2ggZGF0YS4gIEJ1dCB0aGUK
PiBwcmVmZXJlZCBzdHlsZSBpczoKPiAKPiAJCQkJc2l6ZW9mKCpwLT5mdW5jKSwKPiAKPiBQbGVh
c2UgY291bGQgeW91IHJlc2VuZD8KPiAKClN1cmUsIEkgd2lsbCBjb29rIGEgbmV3IG9uZS4KCj4g
cmVnYXJkcywKPiBkYW4gY2FycGVudGVyCj4gCj4gCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
