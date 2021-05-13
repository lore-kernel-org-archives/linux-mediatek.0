Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1D7C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 15:08:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57E84613BF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 15:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57E84613BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+5qfZqP4dRA8atRLUaHHS7Ds/0l1GnJEltGwXx/9uy4=; b=KPByrFL34kgywGAziUt0FSh48
	7gI1/6VMorknmXJcGouPGzpH28xuiDjiTtqxWfBVh+Wl6LqOPPXZT5v78QLEJ/xxvn4XdUQEH41LD
	zlwon6aKUlWGGazyFWcp/UKBZsOeFJLG9FhyKpE0AarCh614MhkTjZiRyiNmOYa1uJqwVQRw7mP4r
	Q5xp4zKsjh8r+xFjMAp/My0N7T2ucRLKTqEw3ms8WKr8nma8ez0EFVbxZZU+OnDAGCOmq+GcjqoY+
	g4nOFtQNpDvhJf/vRaGzu6Em1bYjGZHKL8Qv6XRSu9LGj5PiEcX8dxjZj8vZCCAIfZZZZ4xkiH46z
	1+RWeoe0g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhCwJ-005pVl-H2; Thu, 13 May 2021 15:07:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhCwG-005pUg-7t
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 15:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=TLkSbdc1fw8jgiPXkD5Ij+EaQClDSHw8ek8z1tmir8s=; b=OTe07DsLHPyXGJjBZGWTusH7So
 mIUpoNHn6kskgw1quGgPK9aA2kvBlMqSg0QJBZ3aBJNpgXr3MKNZN5/Y+3wekI0MTuziqqtbg+foS
 9uI6c4fqwUS+bwuc/usCcAdFA959IYepvraRZ9JkrEt75zZWhqVDCkhcOirFMWRzyLLrQGIGxv7ir
 xd9b9zv73CLlrYu0qpiBuG+dJ7w8lWGz746aqRUIIqMVej9tM1zAi2IGI7G2EWfDeygFIDY1v4ZK6
 YOsFDqkP4fKnxu0I1O6/CvY6qIu+XuYoRwkyMBJeX4F8cWE+p6NbWBvOuFTDpYwuMJ32JVITuabzp
 TD6rwQLA==;
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhCwD-00BLO3-Dz
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 15:07:46 +0000
Received: by mail-qt1-x82f.google.com with SMTP id t7so19987452qtn.3
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 08:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=TLkSbdc1fw8jgiPXkD5Ij+EaQClDSHw8ek8z1tmir8s=;
 b=xLFFqHGJUuKACF0i4U8uJPm4Twx4FLRwFZ3bHS1rcLvjc7XLRx0eiQCtipmD/9Aj17
 qp+yYqr0XN5FRLxDmsV5BWl9A0aVboKsjGCtUP7RloVY9soeG0cvxBMt5bGg8YB87XCV
 FQUVBvw3ujSSW5spSdxqiFA4Q+e0OVlHan1ttnh5RYd968dQG5+5Lwo0Dr5PS6Ko38Mj
 LIcJ2jpay7bZ9RsUhr1z1bxmuazuKOpn//ABPNBQMBpAg7YglmRbAjj7svL0pORUVg2o
 7yuqP9/C/itpIXv1p5o34uXj01lDTBuiYfnZQeBeVWd6bYfyRb34Vr4AwjbM9+zl3lA0
 gEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=TLkSbdc1fw8jgiPXkD5Ij+EaQClDSHw8ek8z1tmir8s=;
 b=CpeWV1Owymi9Md0REjctirWZoe4l+UnDwffsMZdbihl4QnL5jqeGSdAJNamWQc1K5d
 eQdjlfUC9W63CkPVGC5RDFSh0Qm19HK3+wxnW/tfFPd1Pq30UKjvYBrJ2D075gfuZ3Yu
 Iwh5ofsRjUdKe7K1RYsJqRRDpQz9bxHSfIWHqPGDq81mor/cddfQvs6vDVIWqDbythGu
 bABWnJtP/pC15zZ7bVMeJ1U8gyFvj6XfriC/RChK+qDKRIa/oDStPkYU9MswyFfmkyR9
 NdjbQPc0DBOtaLAR9TRVCslHOkDJZMJLHOCJUVQ5ptaYvAV59azo2HQ7SkVieZyvYSoh
 Viag==
X-Gm-Message-State: AOAM533rZ2A2Xxl3Y0r75wKKGlEzmUOI4HQEajcwMNAgRNBbq2/mIgr3
 bS0Zja0Kkyq1xAy8ATQFAATamHAo489BwQ==
X-Google-Smtp-Source: ABdhPJzQjQznftnSoUznPn4Riax7X6sR3Jx0KiEsVldOVfBawDd633rhVFzGDWtrbUuPSud3+4cEsg==
X-Received: by 2002:ac8:5dcc:: with SMTP id e12mr27252202qtx.70.1620918462544; 
 Thu, 13 May 2021 08:07:42 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
 by smtp.gmail.com with ESMTPSA id
 h65sm2413773qkc.128.2021.05.13.08.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 08:07:42 -0700 (PDT)
Message-ID: <83a807111f17c9e2db4e9f12a7ec1437c11d0f55.camel@ndufresne.ca>
Subject: Re: [PATCH v4 07/15] media: mtk-vcodec: vdec: add media device if
 using stateless api
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Linux Media Mailing List
 <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Date: Thu, 13 May 2021 11:07:40 -0400
In-Reply-To: <CAPBb6MUKtxCS=JbtBmvwwEovrN8NCtLmMGcTkozo_gnDMRsqHw@mail.gmail.com>
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-8-acourbot@chromium.org>
 <faa5553f-2ea5-27a5-7f85-e1418d2c7df1@xs4all.nl>
 <CAPBb6MUKtxCS=JbtBmvwwEovrN8NCtLmMGcTkozo_gnDMRsqHw@mail.gmail.com>
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_080745_489147_46AFB36F 
X-CRM114-Status: GOOD (  18.20  )
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

TGUgamV1ZGkgMTMgbWFpIDIwMjEgw6AgMTc6MDUgKzA5MDAsIEFsZXhhbmRyZSBDb3VyYm90IGEg
w6ljcml0wqA6Cj4gSGkgSGFucywgdGhhbmtzIGZvciB0aGUgcmV2aWV3IQo+IAo+IE9uIFRodSwg
QXByIDI5LCAyMDIxIGF0IDQ6MjggUE0gSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRh
bGwubmw+IHdyb3RlOgo+ID4gCj4gPiBPbiAyNy8wNC8yMDIxIDEzOjE1LCBBbGV4YW5kcmUgQ291
cmJvdCB3cm90ZToKPiA+ID4gRnJvbTogWXVuZmVpIERvbmcgPHl1bmZlaS5kb25nQG1lZGlhdGVr
LmNvbT4KPiA+ID4gCj4gPiA+IFRoZSBzdGF0ZWxlc3MgQVBJIHJlcXVpcmVzIGEgbWVkaWEgZGV2
aWNlIGZvciBpc3N1aW5nIHJlcXVlc3RzLiBBZGQgb25lCj4gPiA+IGlmIHdlIGFyZSBiZWluZyBp
bnN0YW50aWF0ZWQgYXMgYSBzdGF0ZWxlc3MgZGVjb2Rlci4KPiA+IAo+ID4gV2h5IGZvciB0aGUg
c3RhdGVsZXNzIGRlY29kZXIgb25seT8gV2h5IG5vdCBjcmVhdGUgb25lIGZvciBhbGw/Cj4gPiAK
PiA+IEl0J3Mgbm90IGEgYmxvY2tlciwgYnV0IEkgd291bGQgcmVjb21tZW5kIGxvb2tpbmcgYXQg
dGhpcy4KPiAKPiBXb3VsZCB0aGVyZSBiZSBhbnkgdXNlIGluIGNyZWF0aW5nIGEgbWVkaWEgZGV2
aWNlIGZvciBhIHN0YXRlZnVsCj4gZGVjb2RlciB0aGF0IGRvZXMgbm90IG5lZWQgdG8gdXNlIHJl
cXVlc3RzPwoKVGhlIG9ubHkgdGhpbmcgSSBjYW4gdGhpbmsgb2YgaXMgY2xhc3NpZmljYXRpb24u
IEluIEdTdHJlYW1lciBzdXBwb3J0IGZvcgpzdGF0ZWxlc3MgZGVjb2RlcnMsIEkgdXNlIHRoZSB0
b3BvbG9neSB0byBjbGFzc2lmeSB3aGF0IGlzIGEgZGVjb2RlciBieSB3YWxraW5nCnRoZSB0b3Bs
b2d5IGFuZCBtYWtpbmcgc3VyZSBpdCdzIHdoYXQgSSBleHBlY3QsIGFuZCB0aGF0IHRoZXJlIGlz
IG5vIG90aGVyCmJyYW5jaGVzIG9yIGZ1bmN0aW9ucyB0aGF0IEkgbWF5IG5vdCBzdXBwb3J0LiBU
aGlzIG1ha2VzIGl0IG1vcmUgc3RyaWN0LCBzbyBsZXNzCmxpa2VseSB0byBjb25mdXNlIGRyaXZl
ciBmdW5jdGlvbi4KCk5vdGUgdGhhdCB2NGwyLWNvbXBsaWFuY2UganVzdCB1c2UgdGhlIHNhbWUg
b2xkIGhldXJpc3RpYyB3ZSBoYXZlIHVzZWQgZm9yCnN0YXRlZnVsLCB3aGljaCBpcyB0byBjaGVj
ayB0aGF0IG9uZSBzaWRlIGhhdmUgb25seSBSQVcgZm9ybWF0LCBhbmQgdGhlIG90aGVyCnNpZGUg
aGF2ZSBvbmx5IGVuY29kZWQgZm9ybWF0cy4gSXQgd29ya3MgdG9vLCBpdCdzIGp1c3QgbGVzcyBz
dHJpY3QuCgo+IAo+IENoZWVycywKPiBBbGV4LgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
