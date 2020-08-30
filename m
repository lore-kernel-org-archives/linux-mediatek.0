Return-Path: <SRS0=MWo0=CI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2213BC433E6
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Aug 2020 23:04:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3C99206F0
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Aug 2020 23:04:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IkVRQ7yS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdG2Gicf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3C99206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MjMpVGCCYPy6erNH4oLSBt2cd/tSMpLS2MQ/mfL8o7A=; b=IkVRQ7ySLAJt77QM7MWhazY/A
	lsT3sincAnCeWY2FT4OgQ1oivMb6+6Z9XGO2ygaa8GXlDpDewO06qLFpfvvAmmaC+k89NoHxLI+AX
	1CqCnTsJ2frEpuAAz0QA58f094bGL0v+1rYofMC8Umj9e2MWmr34rIyuLwnVUmJYHmwTVU2PVTRlU
	ZiWov6FfpBnxoLUiiQui8ZfbRvkXN/iK1AT0l2PfWl2l9lKItot+sjfqe6PP8NDBHV0lFVRjd8n+k
	Cdfx7/ip8FOnmLoFeOPGsl+nXkCeyu9wpgy78GrncveB/V7yuGOypJQzSDrJBMCmUiwdPQMEHabS/
	a8rO7U5Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCWMl-0003a0-SU; Sun, 30 Aug 2020 23:04:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCWMj-0003ZI-KK
 for linux-mediatek@lists.infradead.org; Sun, 30 Aug 2020 23:04:02 +0000
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94FD9208A9
 for <linux-mediatek@lists.infradead.org>; Sun, 30 Aug 2020 23:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598828640;
 bh=DBjDH6+zNvjW34pmAg6ijFdsfR7eAU1XQ0DB71Y2mMc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AdG2GicfwHXYVdmq7SKuxLonnI4a9+7yvIkyYxp3DjSRp7aFPuweycg9/1ITRS7oY
 nzNBkUZh/wFOSW1SL7FnH6wiO7DWC6oiyAr08piI9cqjGjOXzRqxdSHk4WpQRfh4mG
 efpT+VfmT+dJ8fr90dngXby4e/RbnbEu5Bb0GC7o=
Received: by mail-ed1-f42.google.com with SMTP id l63so3769938edl.9
 for <linux-mediatek@lists.infradead.org>; Sun, 30 Aug 2020 16:04:00 -0700 (PDT)
X-Gm-Message-State: AOAM5334/2ebYn9C2A/XgmtAnC0+ndj4SJsE1uMxALjavIQ9zDKhbl8K
 eMugeqxCPfhnnth8OG745i3RNkuAwOUau/pBqw==
X-Google-Smtp-Source: ABdhPJyrriOATdP4S++pL2NTqHge5RYs7u29ox2n6iMcVOciI+MvuGLn2MncSErExi+ry6qYh9bfMAMxiAAU5uTIJCs=
X-Received: by 2002:a05:6402:7d1:: with SMTP id
 u17mr8802306edy.48.1598828639253; 
 Sun, 30 Aug 2020 16:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200823014830.15962-1-chunkuang.hu@kernel.org>
 <20200823014830.15962-5-chunkuang.hu@kernel.org>
In-Reply-To: <20200823014830.15962-5-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 31 Aug 2020 07:03:47 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8_GFMa9R5CP_Vy6g3E3vEJ4qvCbZ=2vkafh4+4NTziLw@mail.gmail.com>
Message-ID: <CAAOTY_8_GFMa9R5CP_Vy6g3E3vEJ4qvCbZ=2vkafh4+4NTziLw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] MAINTAINERS: add files for Mediatek DRM drivers
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200830_190401_873683_8A901824 
X-CRM114-Status: GOOD (  17.41  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIENodW5mZW5nICYgS2lzaG9uOgoKSG93IGRvIHlvdSBmZWVsIGFib3V0IHRoaXMgcGF0Y2g/
CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5l
bC5vcmc+IOaWvCAyMDIw5bm0OOaciDIz5pelIOmAseaXpSDkuIrljYg5OjQ45a+r6YGT77yaCj4K
PiBNZWRpYXRlayBIRE1JIHBoeSBkcml2ZXIgaXMgbW92ZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsgdG8KPiBkcml2ZXJzL3BoeS9tZWRpYXRlaywgc28gYWRkIHRoZSBuZXcgZm9sZGVy
IHRvIHRoZSBNZWRpYXRlayBEUk0gZHJpdmVycycKPiBpbmZvcm1hdGlvbi4KPgo+IFNpZ25lZC1v
ZmYtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IFJldmlld2Vk
LWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+IC0tLQo+ICBN
QUlOVEFJTkVSUyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRp
ZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggZGVhYWZiNjE3MzYx
Li4xOTFiYWNmMDIyMDkgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJ
TkVSUwo+IEBAIC01NzkzLDYgKzU3OTMsNyBAQCBMOiAgICAgICAgZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+ICBTOiAgICAgU3VwcG9ydGVkCj4gIEY6ICAgICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay8KPiAgRjogICAgIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay8KPiArRjogICAgIGRyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGst
aGRtaSoKPgo+ICBEUk0gRFJJVkVSUyBGT1IgTlZJRElBIFRFR1JBCj4gIE06ICAgICBUaGllcnJ5
IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+IC0tCj4gMi4xNy4xCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
