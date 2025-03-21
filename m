Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C95CC36000
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 10:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xf5jgePRVrNAPJgRFo3kE61x88rMoUTorU0wBcZPvs8=; b=FoZ2ik9NUg6FVO1uClk8QofaIV
	a7XvCc5K6fEkWjVgTICn1I0Gyxrob8e/mZdl9foTu3S3tEg3B+VCafwSjkfGyb8rZPtuhlrGcZR2c
	r5cyAZdhcdjIuZUCW2f9q7d0W4PuA3/xxjpGfa+7jP82C46s7jr0FhuzXw0t8jw4rzDr3pCIMuk+3
	IJBydX2lKOgBYfRDn+oD3XjBFIAHiahIFx064aBRcx3ryy+eznAdH0hvDVwJWvvWzTFEkFlY6vEou
	kAj4Wn2n78IzrycjyFpYYIZ5NNOLHq/9oBqz9a/2UlCRH+c5fqtAR/AZa38KRmGuZ2vpjTzgyZ95a
	DZ7FH5vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZlC-0000000EXut-20sK;
	Fri, 21 Mar 2025 10:37:54 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZGc-0000000ETcC-2nQc
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 10:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=taNGpSsT9yLqZwW/7TUK635vZZQRd6sl6eS/ZIQodwA=; b=j
	w03JjndOyDU0V9XCF5Ag4w3qmFyQkKqaU3kNqxmn/cFJi4OFpH51NkPQnYRIqHqa
	CxmaXjUO3jSwlm3LGwfN9yOltaMRuOSK9NjDjSCH1k5ikhaKyfcNICpKydysyEgE
	vSjXCLy0yB+QX4ztKnRbPouB5dVR6pkXfe0Jrttrqo=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-111 (Coremail) ; Fri, 21 Mar 2025 18:05:33 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Fri, 21 Mar 2025 18:05:33 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: lumag@kernel.org, neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org, dianders@chromium.org,
	jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
	p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
	rfoss@kernel.org, chunkuang.hu@kernel.org,
	cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH 1/1] drm/bridge: Pass down connector to drm bridge
 detect hook
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250321-optimistic-prompt-civet-bdcdba@houat>
References: <20250321085345.136380-1-andyshrk@163.com>
 <20250321085345.136380-2-andyshrk@163.com>
 <20250321-optimistic-prompt-civet-bdcdba@houat>
X-NTES-SC: AL_Qu2fAPmevk0o5SWebOkfmkcVgOw9UcO5v/Qk3oZXOJF8jDjp4xEhV2B6MH/20uOCARCyuyGufh9t7txYW6d3eJ0gIXOvsAZyJ0cP6n6VjAxo3w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5a6bffa.a00e.195b82a4808.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bygvCgD3T37tOd1nOPOCAA--.44580W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAMXXmfdMFz-jgABsE
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_030619_074553_5B16FF41 
X-CRM114-Status: UNSURE (   8.26  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CkhpIE1heGltZe+8jAoKQXQgMjAyNS0wMy0yMSAxNzo0ODowNCwgIk1heGltZSBSaXBhcmQiIDxt
cmlwYXJkQGtlcm5lbC5vcmc+IHdyb3RlOgo+T24gRnJpLCBNYXIgMjEsIDIwMjUgYXQgMDQ6NTM6
MzhQTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6Cj4+IEZyb206IEFuZHkgWWFuIDxhbmR5LnlhbkBy
b2NrLWNoaXBzLmNvbT4KPj4gCj4+IEluIHNvbWUgYXBwbGljYXRpb24gc2NlbmFyaW9zLCB3ZSBo
b3BlIHRvIGdldCB0aGUgY29ycmVzcG9uZGluZwo+PiBjb25uZWN0b3Igd2hlbiB0aGUgYnJpZGdl
J3MgZGV0ZWN0IGhvb2sgaXMgaW52b2tlZC4KPj4gCj4+IEluIG1vc3QgY2FzZXMsIHdlIGNhbiBn
ZXQgdGhlIGNvbm5lY3RvciBieSBkcm1fYXRvbWljX2dldF9jb25uZWN0b3JfZm9yX2VuY29kZXIK
Pj4gaWYgdGhlIGVuY29kZXIgYXR0YWNoZWQgdG8gdGhlIGJyaWRnZSBpcyBlbmFibGVkLCBob3dl
dmVyIHRoZXJlIHdpbGwKPj4gc3RpbGwgYmUgc29tZSBzY2VuYXJpb3Mgd2hlcmUgdGhlIGRldGVj
dCBob29rIG9mIHRoZSBicmlkZ2UgaXMgY2FsbGVkCj4+IGJ1dCB0aGUgY29ycmVzcG9uZGluZyBl
bmNvZGVyIGhhcyBub3QgYmVlbiBlbmFibGVkIHlldC4gRm9yIGluc3RhbmNlLAo+PiB0aGlzIG9j
Y3VycyB3aGVuIHRoZSBkZXZpY2UgaXMgaG90IHBsdWcgaW4gZm9yIHRoZSBmaXJzdCB0aW1lLgo+
PiAKPj4gU2luY2UgdGhlIGNhbGwgdG8gYnJpZGdlJ3MgZGV0ZWN0IGlzIGluaXRpYXRlZCBieSB0
aGUgY29ubmVjdG9yLCBwYXNzaW5nCj4+IGRvd24gdGhlIGNvcnJlc3BvbmRpbmcgY29ubmVjdG9y
IGRpcmVjdGx5IHdpbGwgbWFrZSB0aGluZ3Mgc2ltcGxlci4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPgo+RlRSLCBJJ20gYWdhaW5zdCBp
dCBhbmQgd291bGQgaGF2ZSBhcHByZWNpYXRlZCB0aGF0IHlvdSB3YWl0IGZvciBhCj5tZWFuaW5n
ZnVsIGNsb3N1cmUgdG8gdGhlIGRpc2N1c3Npb24gd2UndmUgaGFkIG9uIHRoaXMuCgpObyBwcm9i
bGVtLiBJIGp1c3Qgd2FudCB0byBrbm93IGhvdyB0byBwcm9jZWVkIHdpdGggdGhpcy4KCgo+Cj5N
YXhpbWUK

