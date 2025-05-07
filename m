Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B8EC369DC
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 May 2025 06:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxXYbJZD48dI0SPVv07NCmFRsZxS5O4mEiYyeuloddY=; b=Agl6bZ2fSCGQoqlSdZG4E/yUBd
	i+4QD1Kh0gHF+in/oDHAudPMT2W5QZ73aTLkUj7dVjUQabYQ0H6tWLqb+lCFAnx/zb60/mdlwujDy
	keMgDMUxLutu7jlh9PyuweDwToFA0NirrHNlRFb54Sj7gLaK7nyr1rJWXMT/yY8azyjYbbeQz4OYt
	KikEwnjq0mH9LLydltINI6sKKS9yT5KHCi8tUto4fMzzfYfoJ90t2803y71oLMNI+BzrZOzuzm1lA
	Re32eCMzKSUfoEK5M0+56ULfLJGHOyqrNgfu7OBTNBgNZtGx0qiCMnvWiqV9uslTnqf2B3ZNA2a0Z
	del/PbAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXz6-0000000EKyw-1sy1;
	Wed, 07 May 2025 06:10:24 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXz3-0000000EKxR-0Uhq
	for linux-mediatek@lists.infradead.org;
	Wed, 07 May 2025 06:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=PcVJcsU188XGP4XUJP8u7N7/UYZL6lmQlc06xU1P3b4=; b=I
	GXm52W9An7b66EY+bwlClR2kb61UfayXY4DJB9K8JuFRbRLOZ2TBmIn0Mq5I228Q
	hXMoTGkSq5j9dLHnAg/e/g0taBwjPkHiyVrcprvsL4N4MIIlcJ5+TYGDLoznP+oP
	NEadLyop4merzsaX1tC+JTu5O/vbf43G1vxLfbV0xM=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-104 (Coremail) ; Wed, 7 May 2025 14:09:13 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 7 May 2025 14:09:13 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
	"Maxime Ripard" <mripard@kernel.org>
Cc: lumag@kernel.org, neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org, dianders@chromium.org,
	jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
	p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
	rfoss@kernel.org, chunkuang.hu@kernel.org,
	cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re:Re: [PATCH 1/1] drm/bridge: Pass down connector to drm bridge
 detect hook
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <1bb549f4.746e.1965c8256e4.Coremail.andyshrk@163.com>
References: <20250321085345.136380-1-andyshrk@163.com>
 <20250321085345.136380-2-andyshrk@163.com>
 <20250321-optimistic-prompt-civet-bdcdba@houat>
 <1bb549f4.746e.1965c8256e4.Coremail.andyshrk@163.com>
X-NTES-SC: AL_Qu2fBPmSt0ku5SebbOkfmkcVgOw9UcO5v/Qk3oZXOJF8jC7pxyUYZFlTGWvs7PCDJim1nQiHezZt88JTXIVAZqUNHPapzRP0H9he/eEM1/JOWw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <20cd09da.5462.196a95cce13.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aCgvCgCnD4oJ+RpoUXimAA--.12567W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqA1GXmga9Zpt5QABsp
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_231021_450565_586E44D5 
X-CRM114-Status: UNSURE (   8.50  )
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

CgpQaW5nLi4uLi4uCgpBdCAyMDI1LTA0LTIyIDE1OjU5OjI3LCAiQW5keSBZYW4iIDxhbmR5c2hy
a0AxNjMuY29tPiB3cm90ZToKPgo+SGkgYWxsLAo+Cj5BdCAyMDI1LTAzLTIxIDE3OjQ4OjA0LCAi
TWF4aW1lIFJpcGFyZCIgPG1yaXBhcmRAa2VybmVsLm9yZz4gd3JvdGU6Cj4+T24gRnJpLCBNYXIg
MjEsIDIwMjUgYXQgMDQ6NTM6MzhQTSArMDgwMCwgQW5keSBZYW4gd3JvdGU6Cj4+PiBGcm9tOiBB
bmR5IFlhbiA8YW5keS55YW5Acm9jay1jaGlwcy5jb20+Cj4+PiAKPj4+IEluIHNvbWUgYXBwbGlj
YXRpb24gc2NlbmFyaW9zLCB3ZSBob3BlIHRvIGdldCB0aGUgY29ycmVzcG9uZGluZwo+Pj4gY29u
bmVjdG9yIHdoZW4gdGhlIGJyaWRnZSdzIGRldGVjdCBob29rIGlzIGludm9rZWQuCj4+PiAKPj4+
IEluIG1vc3QgY2FzZXMsIHdlIGNhbiBnZXQgdGhlIGNvbm5lY3RvciBieSBkcm1fYXRvbWljX2dl
dF9jb25uZWN0b3JfZm9yX2VuY29kZXIKPj4+IGlmIHRoZSBlbmNvZGVyIGF0dGFjaGVkIHRvIHRo
ZSBicmlkZ2UgaXMgZW5hYmxlZCwgaG93ZXZlciB0aGVyZSB3aWxsCj4+PiBzdGlsbCBiZSBzb21l
IHNjZW5hcmlvcyB3aGVyZSB0aGUgZGV0ZWN0IGhvb2sgb2YgdGhlIGJyaWRnZSBpcyBjYWxsZWQK
Pj4+IGJ1dCB0aGUgY29ycmVzcG9uZGluZyBlbmNvZGVyIGhhcyBub3QgYmVlbiBlbmFibGVkIHll
dC4gRm9yIGluc3RhbmNlLAo+Pj4gdGhpcyBvY2N1cnMgd2hlbiB0aGUgZGV2aWNlIGlzIGhvdCBw
bHVnIGluIGZvciB0aGUgZmlyc3QgdGltZS4KPj4+IAo+Pj4gU2luY2UgdGhlIGNhbGwgdG8gYnJp
ZGdlJ3MgZGV0ZWN0IGlzIGluaXRpYXRlZCBieSB0aGUgY29ubmVjdG9yLCBwYXNzaW5nCj4+PiBk
b3duIHRoZSBjb3JyZXNwb25kaW5nIGNvbm5lY3RvciBkaXJlY3RseSB3aWxsIG1ha2UgdGhpbmdz
IHNpbXBsZXIuCj4+PiAKPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxhbmR5LnlhbkByb2Nr
LWNoaXBzLmNvbT4KPj4KPj5GVFIsIEknbSBhZ2FpbnN0IGl0IGFuZCB3b3VsZCBoYXZlIGFwcHJl
Y2lhdGVkIHRoYXQgeW91IHdhaXQgZm9yIGEKPj5tZWFuaW5nZnVsIGNsb3N1cmUgdG8gdGhlIGRp
c2N1c3Npb24gd2UndmUgaGFkIG9uIHRoaXMuCj4KPkNhbiB3ZSBzdGFydCB0byByZXZpZXcgdGhp
cyBwYXRjaD8gU2luY2UgaXQncyBiZWVuIGFsbW9zdCBhIG1vbnRoIG5vdyBhbmQKPm5vIG9uZSBo
YXMgcmFpc2VkIGFueSBvYmplY3Rpb24gdG8gRG1pdHJ5J3Mgc3VnZ2VzdGlvblsxXS4KPgo+Cj5b
MV1odHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvdncybmNkb214M3J3bHRiMnhsbzZu
ZjNyYXBnY2R0Y2pjb2RvZmdtZWNyenphYmY3amlAcHlic2Z2Mjdqa3EyLwo+Cj4KPj4KPj5NYXhp
bWUK

