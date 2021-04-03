Return-Path: <SRS0=kWN9=JA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA26EC433B4
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Apr 2021 02:43:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64F896115C
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Apr 2021 02:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64F896115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fHlmIIvOHRAEgfAWy0S8iHWAEwKjcfo426NgCAONOug=; b=frdr5Q49NckcS8R91oobiB/2+
	kjnd+J3ywwsx/Wn8ncMfj5vdPoLgHfg1Slj+umZ+X2z4jrE5fcXoO6liHtdqpPI161qFfvsoMNDgf
	MYxYX0Jj5Gsgh2u6L5IZ5IbjGco9Nm5GxNf8DHXkiJs35j8P3SDhqCcJl4nYd3GCRtUH1CAjaARPa
	rSYeyROu/kRlk5UpnlHY54sX1m6S/b3xyXZomRI7hFD7smkz8mBz18OFe0oJhN0mnTEniVKjur14a
	nG0uXcZmIZGv8pnd0g7BYjalgpkMmDBpQSYvIQ8vuO2D+evSh0Lhv0Gwb/JwYOLVfgCj7oBKaOG0b
	T9zfAz4zA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSWFq-00EBRZ-CM; Sat, 03 Apr 2021 02:43:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSWFc-00EBQP-MR; Sat, 03 Apr 2021 02:43:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C61B1611C0;
 Sat,  3 Apr 2021 02:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617417781;
 bh=aNMELlBUL3U9rUGH+ATD1Xz3WuM8CEMeyY0C6yKRUtA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cuCud8GY0iktgDSRI4xfGJ33gE36wrqpLlpJnRZiDI1ictGBTheAX5cBdZ1IFSqYY
 MhjaitWn43EqYaTVfy8hHCxuSHi7t2phu/vaEybuOLTP8Qnfv00ftT15UmbXxY4XZo
 I0pV2cYS9AOAzEMgeddW4qUCgpUpcJ+DUXXLq5AHhaHgGIALPv1XX7710r8N4YsYNT
 UUgIrWG7AuBSzlS/JmKTks8CqQYRdpNe1hFp0v9f8vFqov8EwW+7iOnGnuexhmDy8/
 NXeVi8QuxUnbl4ie8HfcmV+Kscyx+hEmCAXYqLHToLcSBPUhu3++8eYO6SOWJsy5OW
 Yp7PcoyFPHZmw==
Received: by mail-ej1-f53.google.com with SMTP id r12so9530569ejr.5;
 Fri, 02 Apr 2021 19:43:00 -0700 (PDT)
X-Gm-Message-State: AOAM530M4iT0+ij97yO8x4Hub6+7VPqr97JN+/styDpy2OgGC2Mv3oRo
 /WR4TfXa+u9qtBAu8vXtL7PJT6RGN4bP3IEg5Q==
X-Google-Smtp-Source: ABdhPJzRV4BcVclnftx3MZaVEOZmxecuymiOeLqckYtOn66OeMun4ixu6zDGHI8xJMXwUsPxgb/m8Nl6YvcJsOi4ZaA=
X-Received: by 2002:a17:906:9888:: with SMTP id
 zc8mr17244941ejb.310.1617417779374; 
 Fri, 02 Apr 2021 19:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210314233323.23377-1-chunkuang.hu@kernel.org>
In-Reply-To: <20210314233323.23377-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 3 Apr 2021 10:42:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY__SvoLJ7aPhuiNLXBd_JhbuzF=bTABG-MHc7bvHuQJi0w@mail.gmail.com>
Message-ID: <CAAOTY__SvoLJ7aPhuiNLXBd_JhbuzF=bTABG-MHc7bvHuQJi0w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Refine mtk-cmdq-mailbox callback mechanism
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210403_034304_997806_6D8204CB 
X-CRM114-Status: GOOD (  10.64  )
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

SGksIEphc3NpOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAy
MDIx5bm0M+aciDE15pelIOmAseS4gCDkuIrljYg3OjMz5a+r6YGT77yaCj4KPiBtdGstY21kcS1t
YWlsYm94IHVzZSBwcm9wcmlldGFyeSBjYWxsYmFjayBtZWNoYW5pc20gYW5kIHByb3ByaWV0YXJ5
Cj4gZXJyb3IgbnVtYmVyLCBidXQgdGhlc2UgY291bGQgYmUgcmVwbGFjZWQgYnkgc3RhbmRhcmQg
Y2FsbGJhY2sKPiBtZWNoYW5pc20gYW5kIHN0YW5kYXJkIGVycm9yIG51bWJlci4gSW4gYWRkaXRp
b24sIHVzZSBjbWRxX3BrdCBhcwo+IGNhbGxiYWNrIGRhdGEgdG8gcHJldmVudCByZWR1bmRuYXQg
YXNzaWdubWVudC4KPgo+IEJlY2F1c2UgY2xpZW50IGRyaXZlciBzdGlsbCB1c2UgcHJvcHJpZXRh
cnkgbWVjaGFuaXNtLCBzbyBrZWVwCj4gcHJvcHJpZXRhcnkgbWVjaGFuaXNtIHVudGlsIGNsaWVu
dCBkcml2ZXIgdXNlIHRoZSBzdGFuZGFyZCBvbmUuCgpIb3cgZG8geW91IHRoaW5rIGFib3V0IHRo
aXMgc2VyaWVzPwoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBDaHVuLUt1YW5nIEh1ICgzKToK
PiAgIG1haWxib3g6IG10ay1jbWRxOiBSZW1vdmUgY21kcV9jYl9zdGF0dXMKPiAgIG1haWxib3g6
IG10ay1jbWRxOiBVc2UgbWFpbGJveCByeF9jYWxsYmFjawo+ICAgbWFpbGJveDogbXRrLWNtZHE6
IEFkZCBzdHJ1Y3QgY21kcV9wa3QgaW4gc3RydWN0IGNtZHFfY2JfZGF0YQo+Cj4gIGRyaXZlcnMv
bWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgICAgICAgfCAyNCArKysrKysrKysrKysrKystLS0t
LS0tLS0KPiAgaW5jbHVkZS9saW51eC9tYWlsYm94L210ay1jbWRxLW1haWxib3guaCB8ICA4ICsr
LS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25z
KC0pCj4KPiAtLQo+IDIuMTcuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
