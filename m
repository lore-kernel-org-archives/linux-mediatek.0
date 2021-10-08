Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8660C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 14:03:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8185161039
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 14:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8185161039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2CJcbfnoX3s7g6IHfh8nvkDqd5MCQjkPNsVUIaCmAA=; b=ocGVgc696yfLiV
	bRcdXCb4O0z6OqRAGpslE64HY2jQ4E/7X7kYuHbYIdNIWNUs/7AamCYFrEr74ARG//Hrk8EWzCNmx
	r9PsVF3yQC3XE0zWO3X7PRj7C4nnqiJ8cfbt87jWCvoDReK27QGCNKDUDu4oeM7lfQJU51QfO2FEf
	czIJpUoamfOPllWviChFxqVv6JrVgVFUP6KjoseVhy3xsXvCxdAM/MXiDPnX69M8tGnm6m5SKngPB
	17Os1a9q49H1TEhRkk+Ab6/8yxsZaC7vKF0FoM+0IZWLj80DqpQCFsKZFM0GWshuAqeVHAQl383yT
	Z1nolhkl0BVOezkh6vEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYqT7-0030Tu-PJ; Fri, 08 Oct 2021 14:03:25 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYqT5-0030SJ-B4
 for linux-mediatek@lists.infradead.org; Fri, 08 Oct 2021 14:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=TYu+1zYR43xAxoHI39OSxNvmGCOL7NaMXo0mEayFmqI=; 
 t=1633701799; x=1634911399; b=sgNl2jx6R8J5CD77CnZOBv0a45pogtrbiUlyAWGn+WZsSaP
 lSpvXN/096dZ/qcf3Lz2kcs36rvR38oRnTevfTExBHYQ9VLZPfNX0mDPbuKyYha64rYre0t6L19Tq
 PmWbK16W/UQ5U5XAnUIjAzfeWUPkOkjyXj+1eFN5TZbsIcjY3cGkYVO+Au9mTLxDo8po3fiY4rvuu
 usv00+qhRZ6Laa5FVQEXXIyqcTEbU0HGarowIxt4tp/Yf6moT3Lt6NchUeuGTXJmiVsVKHE0nY+Be
 De70MVBfJDbnvbqjLRZ+ei56i6aCAMFYQl0Q1GyQJWwT488B2C7pDnxcUUSqSMxg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1mYqSt-00HE5c-Mu; Fri, 08 Oct 2021 16:03:12 +0200
Message-ID: <9298fd82e4b49b965e9f26957510b9e968e8b691.camel@sipsolutions.net>
Subject: Re: [bug report] mt76: implement functions to get the response skb
 for MCU calls
From: Johannes Berg <johannes@sipsolutions.net>
To: Dan Carpenter <dan.carpenter@oracle.com>, nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Fri, 08 Oct 2021 16:03:10 +0200
In-Reply-To: <20211008130007.GA23161@kili>
References: <20211008130007.GA23161@kili>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_070323_411394_B3DD1458 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCAyMDIxLTEwLTA4IGF0IDE2OjAwICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+
IAo+IMKgwqDCoMKgMTE0NiAgICAgICAgIHJldCA9IG10NzZfbWN1X3NlbmRfYW5kX2dldF9tc2co
JmRldi0+bXQ3NiwgTUNVX0VYVF9DTURfRUZVU0VfQUNDRVNTLCAmcmVxLAo+IMKgwqDCoMKgMTE0
NyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHJlcSksIHRy
dWUsICZza2IpOwo+IAo+IElmIG10NzZfbWN1X3NlbmRfYW5kX2dldF9tc2coKSBjYWxscyB0aGUg
ZGV2LT5tY3Vfb3BzLT5tY3Vfc2VuZF9tc2coKQo+IHRoZW4gInNrYiIgaXMgbm90IGluaXRpYWxp
emVkLgo+IAo+IMKgwqDCoMKgMTE0OCAgICAgICAgIGlmIChyZXQpCj4gwqDCoMKgwqAxMTQ5ICAg
ICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+IMKgwqDCoMKgMTE1MCAKPiAtLT4gMTE1MSAgICAg
ICAgIHJlcyA9IChzdHJ1Y3QgbXQ3OTIxX21jdV9lZXByb21faW5mbyAqKXNrYi0+ZGF0YTsKCkxv
b2tzIGxpa2UgcG9zc2libHkgJ3NrYicgaXMgYWx3YXlzIGluaXRpYWxpemVkIGlmCm10NzZfbWN1
X3NlbmRfYW5kX2dldF9tc2coKSByZXR1cm5zIDAgKHN1Y2Nlc3MpPwoKQnV0IEkgZ3Vlc3MgaXQn
ZCBiZSBuaWNlciB0byB3cml0ZSB0aGF0IHdpdGggRVJSX1BUUigpIGFuZCBhY3R1YWxseQoqcmV0
dXJuKiB0aGUgcG9pbnRlciAob3IgRVJSX1BUUiksIHJhdGhlciB0aGFuIHRoZSBvdXRwdXQgcGFy
YW1ldGVyLgoKam9oYW5uZXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
