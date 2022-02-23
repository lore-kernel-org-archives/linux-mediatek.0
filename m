Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2EEC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWSDVVK9iEE/3shePmJ6g2qF75LNX18BGk3ZATGnGoU=; b=WaE8PeVv971+G1
	f4Wbk2yJgsOYxk5h0m7KzXjvGlboFWU86ArmWXslgAzRFbGbC4N5FeNu+Dibt4xV/uGfwwC7R1mRd
	tgqT7KQW8xG4EhCZDjnx+26BQ+4sr1JTSjhjFaX9e2onnvrWfXBXtALWrmqNpPcF1htXZuEdzL8FR
	KIm6/nBVJFYzntAXhQ3au8ZgjJjqqBijlzNkktrW1A9BMu0n3aWo5P/fg+p2bPkjOXzGd6zHu/Q/e
	7sNowp4I/Ww6RtKmkTU0CKRf6PZPl8szDliSy2eziFmINqfGB5G2/TRQmrAzty7UAW3lDUOD9qVBb
	/Mkai2lV9NRXd2vnzA0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMnXi-00DONj-28; Wed, 23 Feb 2022 09:02:38 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMnXf-00DOLZ-FZ
 for linux-mediatek@lists.infradead.org; Wed, 23 Feb 2022 09:02:37 +0000
Received: by mail-wr1-x429.google.com with SMTP id q23so3684777wra.2
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Feb 2022 01:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=EGZBf4cf9q35A61ueYdr/S4CUHu1zPEDLp9/agKn7NI=;
 b=ufNvtEpKPdQXuHuBR1mJ7ZfGwsncQrWBH3P2BRwfmsxNOWeW6+c/9BMSyped9jhxXb
 7MHlzjtzP1wNNBBpVBNHBDLGmDjn8zZ3tDkLQiLEqJk1WmtgN0kxnU2h/+s1cEQkzWrP
 IGMVKRZW0EguNlTHlsvA1ntZr7q7TfkMZZn308VMjNAZadPiQXTk9Kh1NndUPc/9QHDl
 TW7+3T6Z1/DKuxaseWDFJVyM6qwtuDYxvmDaIJ2i/ZeGGGWwB8SlTFy7x0Dzd71MMN1E
 shIdrpu6hrgYsKe5PoSX4WNS1Z9o9sS+MmnmtfjQfcmQ0urtr40LgMlwR1ghd/Cd+EG6
 PI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EGZBf4cf9q35A61ueYdr/S4CUHu1zPEDLp9/agKn7NI=;
 b=of1gl6MWbYatedd97bM0pUD9Te4uAqXzePNdGArQWUMtBaZwlLaCVqGYU5eNkOPX9q
 Hv4KVXOVw61BV2fMOGBcc/Bdploc311vbcsdfqmgXgEAGik30WMAgLPgzT25D7fQcJua
 qyeYFcJlkco7GevFoVE5Ij+B/mF4G5z4hAl8s5PidqvMNp/8f6eRfBB6Sur3qAffuN0c
 ujNIxJ/vkBk4h/4GtVjJOBaDPl8YBjzKVDgwnKdw2BJeNQNz7oIBnslHLYafZ3ugHqVc
 MD4W1tTt/AgpizPQK676jdTD083nEQ9NpvX7BSG1mEKdGq+uEHadWXuD9jFBb3hItASP
 tZ6Q==
X-Gm-Message-State: AOAM5323tJ8mk3oelftRsbrlUMlCFwqtIjIkbp46iobzb1f30FDKjZuA
 ZJBGVPDGVOahUZKF59ImABehYw==
X-Google-Smtp-Source: ABdhPJzLOz1GtM/ULWkHOgp39Iksy7swcV80uD3anQz9/MUR3cKC0OFZyfOIUltUYWV8XfVFZgvk7w==
X-Received: by 2002:a5d:69ce:0:b0:1e3:2f7f:8f41 with SMTP id
 s14-20020a5d69ce000000b001e32f7f8f41mr22524558wrw.213.1645606953096; 
 Wed, 23 Feb 2022 01:02:33 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88])
 by smtp.gmail.com with ESMTPSA id p8sm49285543wro.106.2022.02.23.01.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 01:02:32 -0800 (PST)
Date: Wed, 23 Feb 2022 09:02:30 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: robh+dt@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/4] mfd: Add support for the MediaTek MT6366 PMIC
Message-ID: <YhX4JkRtrJZDMrY2@google.com>
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
 <20220106065407.16036-2-johnson.wang@mediatek.com>
 <Ygpbl/pxEVAug6jl@google.com>
 <0e528e1649d49a04ae28590309307789563c6105.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e528e1649d49a04ae28590309307789563c6105.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_010235_535062_6C738168 
X-CRM114-Status: GOOD (  22.90  )
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

T24gV2VkLCAyMyBGZWIgMjAyMiwgSm9obnNvbiBXYW5nIHdyb3RlOgoKPiBPbiBNb24sIDIwMjIt
MDItMTQgYXQgMTM6MzkgKzAwMDAsIExlZSBKb25lcyB3cm90ZToKPiA+IE9uIFRodSwgMDYgSmFu
IDIwMjIsIEpvaG5zb24gV2FuZyB3cm90ZToKPiA+IAo+ID4gPiBUaGlzIGFkZHMgc3VwcG9ydCBm
b3IgdGhlIE1lZGlhVGVrIE1UNjM2NiBQTUlDLiBUaGlzIGlzIGEKPiA+ID4gbXVsdGlmdW5jdGlv
biBkZXZpY2Ugd2l0aCB0aGUgZm9sbG93aW5nIHN1YiBtb2R1bGVzOgo+ID4gPiAKPiA+ID4gLSBS
ZWd1bGF0b3IKPiA+ID4gLSBSVEMKPiA+ID4gLSBDb2RlYwo+ID4gPiAtIEludGVycnVwdAo+ID4g
PiAKPiA+ID4gSXQgaXMgaW50ZXJmYWNlZCB0byB0aGUgaG9zdCBjb250cm9sbGVyIHVzaW5nIFNQ
SSBpbnRlcmZhY2UKPiA+ID4gYnkgYSBwcm9wcmlldGFyeSBoYXJkd2FyZSBjYWxsZWQgUE1JQyB3
cmFwcGVyIG9yIHB3cmFwLgo+ID4gPiBNVDYzNjYgTUZEIGlzIGEgY2hpbGQgZGV2aWNlIG9mIHRo
ZSBwd3JhcC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG5zb24gV2FuZyA8am9obnNv
bi53YW5nQG1lZGlhdGVrLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL21mZC9tdDYzNTgt
aXJxLmMgICAgICAgICAgICAgfCAxICsKPiA+ID4gIGluY2x1ZGUvbGludXgvbWZkL210NjM1OC9y
ZWdpc3RlcnMuaCB8IDcgKysrKysrKwo+ID4gPiAgaW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L2Nv
cmUuaCAgICAgIHwgMSArCj4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+
ID4gCj4gPiBBcHBsaWVkLCB0aGFua3MuCj4gPiAKPiAKPiBIaSBMZWUsCj4gCj4gVGhhbmsgeW91
IGZvciB5b3VyIHJldmlldyBhbmQgcmVzcG9uc2UuCj4gCj4gSG93ZXZlciwgaXQgc2VlbXMgdGhh
dCBteSBwYXRjaGVzIGFyZSBub3QgYXBwbGllZCB5ZXQuCj4gSXMgaXQgcG9zc2libGUgdG8gbWVy
Z2UgbXkgcGF0Y2hlcyBpbnRvIG1haW5saW5lPwoKVGhhbmtzIGZvciB0aGUgbnVkZ2UuCgpJIGp1
c3QgZm91bmQgdGhlbSBvbiB0aGUgd3JvbmcgdG9waWMgYnJhbmNoLgoKVGhleSBhcmUgbm93IGFw
cGxpZWQgdG8gdGhlIGNvcnJlY3QgYnJhbmNoIGFuZCBwdXNoZWQuCgpUaGUgcGF0Y2hlcyB3aWxs
IGFycml2ZSBpbiAtbmV4dCB0b21vcnJvdy4KCkFwb2xvZ2llcyBmb3IgdGhlIGZ1c3MuCgotLSAK
TGVlIEpvbmVzIFvmnY7nkLzmlq9dClByaW5jaXBhbCBUZWNobmljYWwgTGVhZCAtIERldmVsb3Bl
ciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNv
Q3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
