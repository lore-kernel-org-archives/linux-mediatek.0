Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D445FC2B9F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:14:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DCAF613C9
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DCAF613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyQKpA9Pi2aqREpwNdZmI91WeS/oQWNePgVe8yx80zw=; b=P5POhcLlMzrW5k
	u5+PAYXPvGSVZUA7bxHMn2/U+w99U0ley4u44kRuEWYcZ0n46D1OMZHNAINJEMo5JasfjblfB8Exk
	oAB07hq0HQTKkttdsFS7Z/SB8hu81vYxM1n2PqMiothSGTKEFzpZ129HgidKUaQ5LEOR0ZK4RPmbf
	P8kT9ZyVyngCcUTi4A+8K0xVSGe2Me4Evk8VwkQNs2ADbil3fu01+bEi2754EMMBLba8m7uQCuzcf
	Ktb295P017tQO49z0STEiyvU47pOiM/WvdBGn/dvKv9vt9hwp7s+QBNdGku9W113yquJgu8QuwlKs
	Ro6Ji/rmhi4DYTrZZA4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llmnf-00BVNB-GU; Wed, 26 May 2021 06:13:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llmnA-00BV3L-F7; Wed, 26 May 2021 06:13:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7D8D613BA;
 Wed, 26 May 2021 06:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622009599;
 bh=WxE/nYoBUew8cawmtyFnT6QVxlwzsMB2VH8N97o6ILU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=W3wmXVbSCTKRrh02KjzmgFG4xDxdQvFsQ8BRhOvsYhx4YIhnQzhtBrtSCZ6rmupLX
 2hPltBRfEJfTXVN096eCrGrYOSHihBuiGhQ/kEHPNNInc3nZuzbRAZK2hgMiY6YSFm
 UjiH8J/vaygafiK9n7NKBcBiad5SLElkFFvBB7QXXAYmGvoYnLyAh0bDI1qp63qYrb
 LkvPvJJZu+Rh7/luN4lc35naRJZii4R1NmJge+7D9LG1Z+VGFO6bUjGMAP/oVqt8V7
 ict6/b1lko3IvMadDgXR4yYGvjPCGzHYTtIAyGOGfaElKOHBror8bpvb1wqHwbwv6C
 Wz3xx2rv5Pa7A==
Received: by mail-ej1-f51.google.com with SMTP id f18so537102ejq.10;
 Tue, 25 May 2021 23:13:19 -0700 (PDT)
X-Gm-Message-State: AOAM530dN1Jd1qWiwIm7h8uHm5JUbYAIbeh0yDAL4FYLspsUjOpUn64i
 RaARdEPPQF8RQuU0lffWQ1nUW44tBu8OzSGnOQ==
X-Google-Smtp-Source: ABdhPJyLkSEaneCrl0B8Uo6KH8eSMCLLi627Il/INpXPMrNKeFajtofiTGol2XS5McwtUI0QbMI+UZjmQsFpzFQne2Q=
X-Received: by 2002:a17:906:b0cb:: with SMTP id
 bk11mr32693838ejb.310.1622009598186; 
 Tue, 25 May 2021 23:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210314233323.23377-1-chunkuang.hu@kernel.org>
In-Reply-To: <20210314233323.23377-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 26 May 2021 14:13:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9fksAnZc2pqmbHtBiPQgQhX9iX0349K8T9zCG8mH3ZSQ@mail.gmail.com>
Message-ID: <CAAOTY_9fksAnZc2pqmbHtBiPQgQhX9iX0349K8T9zCG8mH3ZSQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Refine mtk-cmdq-mailbox callback mechanism
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_231320_571392_43A31E59 
X-CRM114-Status: GOOD (  10.84  )
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

KyBZb25ncWlhbmcuCgpDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g5pa8
IDIwMjHlubQz5pyIMTXml6Ug6YCx5LiAIOS4iuWNiDc6MzPlr6vpgZPvvJoKPgo+IG10ay1jbWRx
LW1haWxib3ggdXNlIHByb3ByaWV0YXJ5IGNhbGxiYWNrIG1lY2hhbmlzbSBhbmQgcHJvcHJpZXRh
cnkKPiBlcnJvciBudW1iZXIsIGJ1dCB0aGVzZSBjb3VsZCBiZSByZXBsYWNlZCBieSBzdGFuZGFy
ZCBjYWxsYmFjawo+IG1lY2hhbmlzbSBhbmQgc3RhbmRhcmQgZXJyb3IgbnVtYmVyLiBJbiBhZGRp
dGlvbiwgdXNlIGNtZHFfcGt0IGFzCj4gY2FsbGJhY2sgZGF0YSB0byBwcmV2ZW50IHJlZHVuZG5h
dCBhc3NpZ25tZW50Lgo+Cj4gQmVjYXVzZSBjbGllbnQgZHJpdmVyIHN0aWxsIHVzZSBwcm9wcmll
dGFyeSBtZWNoYW5pc20sIHNvIGtlZXAKPiBwcm9wcmlldGFyeSBtZWNoYW5pc20gdW50aWwgY2xp
ZW50IGRyaXZlciB1c2UgdGhlIHN0YW5kYXJkIG9uZS4KPgo+IENodW4tS3VhbmcgSHUgKDMpOgo+
ICAgbWFpbGJveDogbXRrLWNtZHE6IFJlbW92ZSBjbWRxX2NiX3N0YXR1cwo+ICAgbWFpbGJveDog
bXRrLWNtZHE6IFVzZSBtYWlsYm94IHJ4X2NhbGxiYWNrCj4gICBtYWlsYm94OiBtdGstY21kcTog
QWRkIHN0cnVjdCBjbWRxX3BrdCBpbiBzdHJ1Y3QgY21kcV9jYl9kYXRhCj4KPiAgZHJpdmVycy9t
YWlsYm94L210ay1jbWRxLW1haWxib3guYyAgICAgICB8IDI0ICsrKysrKysrKysrKysrKy0tLS0t
LS0tLQo+ICBpbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oIHwgIDggKyst
LS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMo
LSkKPgo+IC0tCj4gMi4xNy4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
