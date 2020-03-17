Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F888C10F29
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 13:34:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6AA6205ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 13:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ta27UtKI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3CzeVFO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6AA6205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+atrciVDu1hHUtpveRfuzi+5QjT0ydSjF3g6TthF+ks=; b=Ta27UtKIDR08oK
	llV3dNPpn7bch01RK2OiFm8Dk+R+TZJiDcB5Q4rPPcOQ4m+PX+8O9czAtH8QmUlq1YTfv0uXhcKRe
	5ZayHR8EyLticBvZJXb0nTpPwCBn/dsQeAhrGnAJWhnHHcqs/UHB9TaH8ZyXV23g/LSlr5XLRmze4
	4VzYuLUJdKC4ZTl0CnTbBX5TVmaCHozVa2dV+e/IZz+qm1OB0wao8LLtczYqV1ee9hGLLTOIwc33O
	uJsUazuIeXwLsQg4ux5ET09YEeXzFnApc8qr1JWckCh/vWmbPlcaNT/FFW+ImdEScGYCbNZE3xWrK
	RnafuHsLxJDuqPDecjiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jECMG-0004dI-Fo; Tue, 17 Mar 2020 13:34:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jECM4-0004UN-7X; Tue, 17 Mar 2020 13:34:04 +0000
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4956A2076B;
 Tue, 17 Mar 2020 13:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584452039;
 bh=ubR0JrKy3jQmSPnc1EN0k8pifk/MO4gNg2fiNHZs1bk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g3CzeVFOQaYZV9EheV69Kl+xkmd1VoLN2Wadwenh/r8KcYQ60hrSyk5Lbn1PK30sK
 Q4CytD2x0XH9MlGQyMissAw5uULD8w7X0phEjWX4dUJ3mwTh0hyJBtx8vSnjEQwCA+
 fIzjtRVSvLR0Q2zQu2wOaLp/d2c1uYoZYTgUNpwk=
Received: by mail-ed1-f43.google.com with SMTP id i24so22625890eds.1;
 Tue, 17 Mar 2020 06:33:59 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3iXuY2r/c1zu7l7OD1MJs+3t157F+J6QO58ThuYQfO01BYZ/DS
 H20hDOY3C+AqytGOxpvjPX8i2Nx+l/NIHzMk0Q==
X-Google-Smtp-Source: ADFU+vvl8fdjLZSjGkoy60pvuqiGdObvt/Ojt0xErZdZ41QZdboB+pIFrAwQ1zW7Jvg5alkgMZgvmRSvdeoEemfJOIo=
X-Received: by 2002:a17:906:4bc3:: with SMTP id
 x3mr4209614ejv.38.1584452037617; 
 Tue, 17 Mar 2020 06:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200311071823.117899-1-jitao.shi@mediatek.com>
 <20200311071823.117899-2-jitao.shi@mediatek.com>
 <c46e49e6-846f-4f41-a8e3-57d5503e1cd7@baylibre.com>
In-Reply-To: <c46e49e6-846f-4f41-a8e3-57d5503e1cd7@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 17 Mar 2020 21:33:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8B+AS9uUvazfg_OtvnaW8kJVbyNB-FVUYh5MPMuJnf8g@mail.gmail.com>
Message-ID: <CAAOTY_8B+AS9uUvazfg_OtvnaW8kJVbyNB-FVUYh5MPMuJnf8g@mail.gmail.com>
Subject: Re: [PATCH v13 1/6] dt-bindings: media: add pclk-sample dual edge
 property
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_063402_916981_6CA112B7 
X-CRM114-Status: GOOD (  18.94  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEppdGFvOgoKSSBhZ3JlZSB3aXRoIE5laWwsIHNvIHBsZWFzZSBiYXNlIG9uIEJvcmlzJyBl
ZmZvcnQgdG8gbmVnb3RpYXRlIHdpdGggYnJpZGdlLgoKUmVnYXJkcywKQ2h1bi1LdWFuZyBIdQoK
TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiDmlrwgMjAyMOW5tDPmnIgx
MeaXpSDpgLHkuIkg5LiL5Y2IOTo1M+Wvq+mBk++8mgoKPgo+IEhpLAo+Cj4gT24gMTEvMDMvMjAy
MCAwODoxOCwgSml0YW8gU2hpIHdyb3RlOgo+ID4gU29tZSBjaGlwcydzIHNhbXBsZSBtb2RlIGFy
ZSByaXNpbmcsIGZhbGxpbmcgYW5kIGR1YWwgZWRnZSAoYm90aAo+ID4gZmFsbGluZyBhbmQgcmlz
aW5nIGVkZ2UpLgo+ID4gRXh0ZXJuIHRoZSBwY2xrLXNhbXBsZSBwcm9wZXJ0eSB0byBzdXBwb3J0
IGR1YWwgZWRnZS4KPiA+Cj4gPiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4KPiA+IFJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+ID4gU2lnbmVk
LW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gPiAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMu
dHh0IHwgNCArKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0Cj4gPiBpbmRleCBmODg0YWRh
MGJmZmMuLmRhOWFkMjQ5MzVkYiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dAo+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0Cj4g
PiBAQCAtMTE4LDggKzExOCw4IEBAIE9wdGlvbmFsIGVuZHBvaW50IHByb3BlcnRpZXMKPiA+ICAt
IGRhdGEtZW5hYmxlLWFjdGl2ZTogc2ltaWxhciB0byBIU1lOQyBhbmQgVlNZTkMsIHNwZWNpZmll
cyB0aGUgZGF0YSBlbmFibGUKPiA+ICAgIHNpZ25hbCBwb2xhcml0eS4KPiA+ICAtIGZpZWxkLWV2
ZW4tYWN0aXZlOiBmaWVsZCBzaWduYWwgbGV2ZWwgZHVyaW5nIHRoZSBldmVuIGZpZWxkIGRhdGEg
dHJhbnNtaXNzaW9uLgo+ID4gLS0gcGNsay1zYW1wbGU6IHNhbXBsZSBkYXRhIG9uIHJpc2luZyAo
MSkgb3IgZmFsbGluZyAoMCkgZWRnZSBvZiB0aGUgcGl4ZWwgY2xvY2sKPiA+IC0gIHNpZ25hbC4K
PiA+ICstIHBjbGstc2FtcGxlOiBzYW1wbGUgZGF0YSBvbiByaXNpbmcgKDEpLCBmYWxsaW5nICgw
KSBvciBib3RoIHJpc2luZyBhbmQKPiA+ICsgIGZhbGxpbmcgKDIpIGVkZ2Ugb2YgdGhlIHBpeGVs
IGNsb2NrIHNpZ25hbC4KPiA+ICAtIHN5bmMtb24tZ3JlZW4tYWN0aXZlOiBhY3RpdmUgc3RhdGUg
b2YgU3luYy1vbi1ncmVlbiAoU29HKSBzaWduYWwsIDAvMSBmb3IKPiA+ICAgIExPVy9ISUdIIHJl
c3BlY3RpdmVseS4KPiA+ICAtIGRhdGEtbGFuZXM6IGFuIGFycmF5IG9mIHBoeXNpY2FsIGRhdGEg
bGFuZSBpbmRleGVzLiBQb3NpdGlvbiBvZiBhbiBlbnRyeQo+ID4KPgo+IFRoaXMgY2hhbmdlcyB0
aGUgYnVzIGZvcm1hdCwgYnV0IHdlIHJlY2VudGx5IGludHJvZHVjZWQgYSBidXMgZm9ybWF0IG5l
Z29jaWF0aW9uCj4gYmV0d2VlbiBicmlkZ2VzIHRvIGF2b2lkIGFkZGluZyBzdWNoIHByb3BlcnRp
ZXMgaW50byBEVCwgYW5kIG1ha2UgYnVzIGZvcm1hdCBzZXR1cAo+IGR5bmFtaWMgYmV0d2VlbiBh
biBlbmNvZGVyIGFuZCBhIGJyaWRnZS4KPgo+IEl0IHdvdWxkIGJlIGdyZWF0IHRvIHVzZSB0aGF0
IGluc3RlYWQuCj4KPiBOZWlsCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
