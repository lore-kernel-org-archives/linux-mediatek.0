Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C21C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 15:22:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 037BA20878
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 15:22:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3ZM0pCA4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLX8Vr/+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 037BA20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z0f8T+jd9fH6Ajf3T/m/TOGQFNmW4J7kIP1MKRSvcW8=; b=3ZM0pCA42dLVZ38ieOXEvxbNb
	XZho1lAKFonPybYPSBP/cSlUvL44mxap5a7ZNILeu+lhRjF+S74KQOzoR+Xs9I4mcUI7PcijssLfe
	xlMijWZeTUvRFuxyuh2FFY8adQuA5fkzxeg1R9TvbuVTLQKn4M2/WyVJl9CO2fxptw4tWDZvcVqEg
	Vml0NRxlpMDRksqxD9WqkWqDBe13Hz8nyiSVH4kmHdmjdbWVeCM50mABiDx1BF6VuvQFK8BWGmyfd
	kHmrvyFWk+80c1gqXi/3PYqAYVpOFvggsopyNKyOegZ5I7fdJ9aRPCbiAZlmQAfGFe5B+NtgnGmqH
	oG3x6M8YQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRzer-0006rs-TL; Mon, 12 Oct 2020 15:22:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRzen-0006pz-2m; Mon, 12 Oct 2020 15:22:38 +0000
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94B9E20BED;
 Mon, 12 Oct 2020 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602516154;
 bh=5C/jmTpz0PKuGny4/s3SbSc4Irgi9NI62ZqH3ELIX7s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aLX8Vr/+ckwRva0GmI4m4s/4wxSqmx0xqfMUrdDEM+fCprnL6NTcrZ+naQvF0e4eY
 zWkWUxdyTPmg/GLZ1qz0vTlhsD42q25Wl9SQ1DQi3GpB3+NEg6BXYn4jkrbiLaDa5g
 wOpkbxvdAoMzjsEH/3QEXKZ8zv++QgW2Lt0sPrOg=
Received: by mail-ed1-f42.google.com with SMTP id cq12so17402932edb.2;
 Mon, 12 Oct 2020 08:22:34 -0700 (PDT)
X-Gm-Message-State: AOAM531rqHxf73Qi3l39+P/8mLouZseGC9uzJZm+ilJYrD2fxc9M1CiJ
 Rm2APQkphZ7Rb2PDa/o6RSaepyxHdZvn0uwl+w==
X-Google-Smtp-Source: ABdhPJwu3cOwmieaIPSGaFSoyA4Wc/3ksuAi+VNzjSghjBXRfe60ms0JWtONwlY6z7lgezHab9z1uAotOlywDThS1cE=
X-Received: by 2002:a05:6402:1cbb:: with SMTP id
 cz27mr14412016edb.38.1602516153075; 
 Mon, 12 Oct 2020 08:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201010070910.11294-1-jitao.shi@mediatek.com>
In-Reply-To: <20201010070910.11294-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 12 Oct 2020 23:22:21 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-qZni-o11HJeymH74PAFSJw-0Awdz0wdjiQ0u7Ga1MGA@mail.gmail.com>
Message-ID: <CAAOTY_-qZni-o11HJeymH74PAFSJw-0Awdz0wdjiQ0u7Ga1MGA@mail.gmail.com>
Subject: Re: [v4 PATCH 0/2] fix scrolling of panel with small hfp or hbp
To: Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_112237_213347_B63C26FD 
X-CRM114-Status: GOOD (  16.51  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDEw5pyIMTDml6Ug6YCx5YWtIOS4i+WNiDM6MDnlr6vpgZPvvJoKPgo+IENoYW5nZXMgc2luY2Ug
djM6Cj4gIC0gUmV2ZXJ0IHYyLCBmb3IgdjIgd2lsbCBjYXVzZSBzb21lIGJyaWRnZSBpYyBubyBv
dXRwdXQuIHRoZSBjYXVzZQo+ICAgIHRoZSB2aWRlbyBsaW5ldGltZSBkb2Vzbid0IG1hdGNoIGRp
c3BsYXkgbW9kZSBmcm9tIGdldCBtb2RlLgo+ICAtIE1ha2Ugc3VyZSB0aGUgaG9yaXpvbnRhbF9m
cm9udHBvcmNoX2J5dGUgYW5kIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUKPiAgICBhcmUgPiAw
LgoKQmVjYXVzZSB2MiBpcyBtZXJnZWQgaW50byBtYWlubGluZSwgSSB0aGluayB5b3Ugc2hvdWxk
IG1lcmdlIDEvMiBhbmQKMi8yIHRvIG9uZSBwYXRjaCB3aGljaCBmaXggdGhlIHByb2JsZW0gY2F1
c2VkIGJ5IHYyLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBKaXRhbyBTaGkgKDIpOgo+ICAg
UmV2ZXJ0ICJkcm0vbWVkaWF0ZWs6IGRzaTogRml4IHNjcm9sbGluZyBvZiBwYW5lbCB3aXRoIHNt
YWxsIGhmcCBvcgo+ICAgICBoYnAiCj4gICBkcm0vbWVkaWF0ZWs6IGRzaTogZml4IHNjcm9sbGlu
ZyBvZiBwYW5lbCB3aXRoIHNtYWxsIGhmcCBvciBoYnAKPgo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RzaS5jIHwgNjUgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQo+
Cj4gLS0KPiAyLjEyLjUKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
