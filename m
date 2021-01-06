Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A22C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:49:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1937C23105
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1937C23105
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELhEW+bVa9phboTcaEX/x1ENwfYkzxq7W4AhjujfCM0=; b=tFCcpem75Ih467IduEfWSh63cK
	CBezwb78B+xMERFPshBBCWHYlGRf2xZ3d8TZd71fGSt3+N2ykqx67H+0+EGn5cAnHt03aI6N9yj2A
	BHpDgDKg94wbaNQgjJYQbDFeKMCPpaNljzrSkkB3nfbGVHZC6foIkeqxZjAJmJSFc8t0otN/YyW2Z
	LcpbdTvdOJHCBn59MG+G15GkRWY/XLhGAjsmWPZemDl1k+Ju7LeXJRqO29yWJh3vjYa5xldNWSbdb
	NQsMgwdW5NCR5akIXQrmSeXLDW1SgJKYmAg/mtvPqI65Mr+Y/vY3h7ZDbLBNpY6n4qYVP7Qdoi7o/
	p3XqKiVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx6NY-0004S9-Vt; Wed, 06 Jan 2021 10:49:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx6NW-0004PG-4F
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 10:49:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 3so2223124wmg.4
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 02:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7BgdPlyabJOHA2iddd/tRY6lBkargL+ou/K0j1Targg=;
 b=MIV3/Y6BnLIx/9BjLqh+9PeknY1k8RcOh14MODBFl5oBOEep+I+ub04YpRltcG3HPM
 McBPg8CIXimIhtDrKu0jPceIN+gXyyPGzqriFdhmvTU8F9N2MWNzr9mQmmuaYWkhbSJa
 /0cg1rNQVNUegt90/xyFlkLhupWsCi3CwNXYFuJPYDpbphNox5HIKYXgQeomjNFM2EeF
 mZwDPZ3nPenMk+u2Z3DhJbrJCeuoFbtWvpRhqPUhtU4luCr/ZINNWd3H2EU4PPUruO6H
 HIdwlZLtClOiTFSBuRGNV5OnAiQIamUwV/tv+3YfN7MEzYrcDoRlnzuWZUnb3s74XbaD
 O6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7BgdPlyabJOHA2iddd/tRY6lBkargL+ou/K0j1Targg=;
 b=oGu19+wz0+MpnM19d9e2aYX+rSjSHOxa2B/qBifDuoqoxnreKJ9BPgo7A7F3KeBGPB
 5r5TXRHlbzIy0nm+IfK+yNjtqhxxdjD6L1XiJuNiBzq2+KTQUpIBihR4jNoPbBn10LGo
 IhZmEAi5ZproYR2Rn9h8dKCSFMKbKJ2u0q2dLVtntAcocWZj6sWcm/bJmdoqHuipk1Gp
 ul0CWRkSU3IOPUnuNnF0gJ/4QL91cX5TgULiyS8KPifgqeUvvW+NVGXn4TYwAUzwjHYb
 uvIXjwNv1Ok/IbbYqKrhqsW6/swaDpgO2wqY368SzbQaUav3HC+AfjfEj3todg6uIqib
 FXBA==
X-Gm-Message-State: AOAM533jtoraGil5JUCXW+KfmtWCSElrtGcNUsSScXqNfaqRGtY+znbE
 usUxHoYzQZSvZE/IhxiTEFXZoA==
X-Google-Smtp-Source: ABdhPJxixDY4BCWrLZMAzpZx1eltJSMRKmmYljJPAGn+SwxhFd7ViY1xMp0IB3OIu8r5frvCfnED/A==
X-Received: by 2002:a7b:c24d:: with SMTP id b13mr3089446wmj.151.1609930155127; 
 Wed, 06 Jan 2021 02:49:15 -0800 (PST)
Received: from dell ([91.110.221.182])
 by smtp.gmail.com with ESMTPSA id i11sm2237484wmq.10.2021.01.06.02.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 02:49:14 -0800 (PST)
Date: Wed, 6 Jan 2021 10:49:12 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gene Chen <gene_chen@richtek.com>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] mfd: Standardise MFD_CELL_* helper names
Message-ID: <20210106104912.GC1592923@dell>
References: <20201217083420.411569-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217083420.411569-1-lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_054922_485752_1ED0C1AD 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxNyBEZWMgMjAyMCwgTGVlIEpvbmVzIHdyb3RlOgoKPiBTdGFydCBhbGwgaGVscGVy
cyB3aXRoICJNRkRfQ0VMTF8iLgo+IAo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlq
QGxpbmFyby5vcmc+Cj4gQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5j
b20+Cj4gQ2M6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+IENjOiBsaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tZmQvYWI4NTAwLWNvcmUuYyAg
fCA0MiArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL21m
ZC9kYjg1MDAtcHJjbXUuYyB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL21mZC9tdDYzNjAtY29yZS5j
ICB8IDEyICsrKysrLS0tLS0tCj4gIGluY2x1ZGUvbGludXgvbWZkL2NvcmUuaCAgIHwgIDYgKysr
LS0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0p
CgpXaGF0IGEgZ3JlYXQgcGF0Y2ghIDspCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVz
IFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExp
bmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
