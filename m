Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7D4C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 11:41:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C4A86124C
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 11:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C4A86124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHIghRoPsHIxCNDULYQNLUdhLLQuuK04BK9EsL5ZrgQ=; b=TP9r3FBF6dbR4Yj+avx/DTr72+
	xOkqgdnb/n/Y3C/14eYpHuykSYEHmXpMzCXf+JvfBOv9DuPu33/oKuu3zO30aUcSwAcLj5ijEURKN
	Lonh4gRggKSGhAQWERTVTYlzIDj7BIgAjH/4NxCuooQ5zF9VZE7PIeNzAq48eCmvxjohqyAmkQi6H
	PXoHiwYpi+RooKxHuoaOXaLpgq0KDGBBTXtl2J3d/J6LdioSphtsHDOI5RIFo/WQtDjXAFAdxVS8W
	nI99s6BL9NBBHiGsFWps8QSiaJTI7NPZ3iE4B2/mfJXSyEV7gANkuVktwM2ALs60N809F8GcSrVDT
	gR2ujbpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml8SD-007o8E-DL; Thu, 11 Nov 2021 11:41:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml8S0-007o5J-LS; Thu, 11 Nov 2021 11:41:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 542691F45B1A
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636630861; bh=yaYinyVYYl0N0+dtMK6+ku0bg03EnhdN+DOz/1sMwr8=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=no3Uds5F4F508vhMrZab+HejB/C3NhT5KZUDZRYsQXmxZ/JLYlFoKTLKUpb2hzBxE
 BgJAwDrXf1Ado/c/hLd3dPF00AjE3S4yMfKNiC+boOLn7hAgCnr9oE1Sz4b7XXuLKE
 Bkj9qW4XxFaKRDdVC1kR+C8XyTtz7OI6LGezuDYkoHHwHsb+RKyyYpZ/pjZjJ9wr4b
 G/qwQ/2SsBlzcPSB/6g3bbBCdqJfZc1zSbcQiS0PtjKl1CsjXt1DlVoS2iu92npFrY
 LzZU/xW98Bokw+uovBd6WuIlpdjRfRGCJElGWWU5qREaviFcx5jVJWy6UiAyqzOaOJ
 8eKvxTizo/RiQ==
Subject: Re: [PATCH v8 1/7] soc: mediatek: mmsys: add support for MDP
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, tfiga@chromium.org, drinkcat@chromium.org,
 acourbot@chromium.org, pihsun@chromium.org, menghui.lin@mediatek.com,
 sj.huang@mediatek.com, allen-kh.cheng@mediatek.com, randy.wu@mediatek.com,
 srv_heupstream@mediatek.com, hsinyi@google.com
References: <20211015123832.17914-1-moudy.ho@mediatek.com>
 <20211015123832.17914-2-moudy.ho@mediatek.com>
 <31577e05-34b8-2e5e-14f0-db9949ffdd3d@collabora.com>
Message-ID: <6876d923-bd71-8f10-e5fb-1c228642a163@collabora.com>
Date: Thu, 11 Nov 2021 12:40:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <31577e05-34b8-2e5e-14f0-db9949ffdd3d@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_034104_863578_CFB0DF72 
X-CRM114-Status: GOOD (  13.95  )
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

SWwgMTgvMTAvMjEgMTU6NTAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIGhhIHNjcml0dG86
Cj4gSWwgMTUvMTAvMjEgMTQ6MzgsIE1vdWR5IEhvIGhhIHNjcml0dG86Cj4+IEZvciB0aGUgcHVy
cG9zZSBvZiBtb2R1bGUgaW5kZXBlbmRlbmNlLCByZWxhdGVkIHNldHRpbmdzIHNob3VsZCBiZSBt
b3ZlZAo+PiBmcm9tIE1EUCB0byB0aGUgY29ycmVzcG9uZGluZyBkcml2ZXIuCj4+IFRoaXMgcGF0
Y2ggYWRkcyBtb3JlIDgxODMgTURQIHNldHRpbmdzIGFuZCBpbnRlcmZhY2UuIGFuZCBNRFAKPj4g
cmVsYXRlZCBzZXR0aW5ncyBtdXN0IGJlIHNldCB2aWEgQ01EUSB0byBhdm9pZCBmcmFtZSB1bnN5
bmNocm9uaXplZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTW91ZHkgSG8gPG1vdWR5LmhvQG1lZGlh
dGVrLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvc29jL21lZGlhdGVrL0tjb25maWfCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4gwqAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXQ4MTgz
LW1tc3lzLmjCoMKgwqAgfCAyMTkgKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiDCoCBkcml2
ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuY8KgwqDCoMKgwqDCoCB8wqAgNTIgKysrKysrCj4+
IMKgIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5owqDCoMKgwqDCoMKgIHzCoMKgIDIg
Kwo+PiDCoCBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaCB8wqAgNTYgKysr
KysrKwo+PiDCoCA1IGZpbGVzIGNoYW5nZWQsIDMzMCBpbnNlcnRpb25zKCspCj4+Cj4gCgpUaGlz
IHBhdGNoIGRvZXMgbm90IGFwcGx5IGNsZWFubHkgYW55bW9yZSwgYXMgb2YgbmV4dC0yMDIxMTEx
MS4KQ2FuIHlvdSBwbGVhc2Ugc2VuZCBhIHY5IGFzYXA/CgpUaGFua3MsCkFuZ2VsbwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
