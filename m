Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22ED9C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 23:26:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7D4A610A1
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 23:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7D4A610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n98T88BhIIj0WgBn81iWoxZ8wwAc13Cy7ZaqwTRVZvE=; b=A215XeIT87Chan
	WmrduVQX9lqEhmuhy4FRjTZnS9f5l3LRcGCj0p/BEjeyKvjRvkrXSGMjyCEyEw06yU9U9iQ/lEbPA
	yAqMJ72X4wSP1kiwOkU9fJg9uuZuDj5qrnPuhj9VBuAVxdIDGWqEEJNBwzcsKVvdQTMBqTVatM5OC
	Q0N78np8Z6FpdhqbJjOoECiAxdfMvnVFvzudQws8TkiESK3o/Z5FtUeiqZWGbgh87bhe05tQb+c5R
	e/9B9WBXs0GAMDB9FUoLlimb+O32iuTJitKWRLgX/Uyy1OutRB68xyqv/yElNemMnoSFm72gaLz4I
	k9xs9YHDTDafUc1VE0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGrPz-009jrI-8Z; Thu, 19 Aug 2021 23:25:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGrPl-009joe-Et; Thu, 19 Aug 2021 23:25:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EEB7610A1;
 Thu, 19 Aug 2021 23:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629415537;
 bh=lDfLcMkKaHulnTMCEIwuK3Wkmz0K0OakW2zzDWc2MXQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FY0wZTfrZOjvTnYhmIPdjOI29K571ATtN2aYf4k/tGQKyIwJwp+Ygjb0ZymaDAJF0
 4KfTUAUg6RRvQbQI6nhYkj88XF8OGaGzYo7hTA+l+tO6n7FOiSOYrBvRJ4gPstlQc+
 /A7as4FtfgWNv1csr6zGnv6paUBj4MEi+8Kfo+kErXzeCnPWNfKba2Be16HBcBOQyb
 nG3NFuy+HTKrRvHKm006BGLR41CPqAukZsRLH5i5NbQ6M3mX9z7l2TnmwTrhcJyQLi
 q8Dw9mgcwuCaI7Kwo5LUt3bIpNZ7CUeVKZljDag08xUJo8XToCrOApmbdEeBoFdjkz
 b1MKB8+gfkviA==
Received: by mail-ed1-f52.google.com with SMTP id q3so11244345edt.5;
 Thu, 19 Aug 2021 16:25:36 -0700 (PDT)
X-Gm-Message-State: AOAM530cpdnMiMyX1NdWCrfHD7kPaL1PdCS6LnvyhUH8FGNigdv3rXs3
 oim3qWsVdTklu2lSQ+oHKAGadUYW6Js8jTLWkg==
X-Google-Smtp-Source: ABdhPJyqRKlKwq4wRR1ZLhH+D2awtd0tuQOpfkaT7U6/ZK+Er3r1zuqlZaXZ1G3+33lsQ6QF7lMQ2EOc1u8R/uHA4WA=
X-Received: by 2002:aa7:c7c2:: with SMTP id o2mr18981861eds.166.1629415535694; 
 Thu, 19 Aug 2021 16:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
 <20210818091847.8060-3-nancy.lin@mediatek.com>
In-Reply-To: <20210818091847.8060-3-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 20 Aug 2021 07:25:24 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-mJ0WHK0pXqASprrc7GW0R_ZTRmJ8Yo8pu9js-cQ5HAw@mail.gmail.com>
Message-ID: <CAAOTY_-mJ0WHK0pXqASprrc7GW0R_ZTRmJ8Yo8pu9js-cQ5HAw@mail.gmail.com>
Subject: Re: [PATCH v3 02/15] dt-bindings: mediatek: add vdosys1 MERGE
 definition for mt8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_162537_559594_980DF999 
X-CRM114-Status: GOOD (  12.49  )
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

SGksIE5hbmN5OgoKTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDjmnIgxOOaXpSDpgLHkuIkg5LiL5Y2INToxOOWvq+mBk++8mgo+Cj4gQWRkIHZkb3N5czEgTUVS
R0UgZGVmaW5pdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IE5hbmN5LkxpbiA8bmFuY3kubGluQG1l
ZGlhdGVrLmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxtZXJnZS55YW1sICAgIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWVyZ2UueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1lcmdlLnlh
bWwKPiBpbmRleCAxYTI3YjAzNzA4NmIuLmJhMWUwYzgzNzk4OCAxMDA2NDQKPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxt
ZXJnZS55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWVyZ2UueWFtbAo+IEBAIC0yMyw2ICsyMyw4IEBAIHByb3Bl
cnRpZXM6Cj4gICAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxNzMtZGlzcC1tZXJnZQo+
ICAgICAgICAtIGl0ZW1zOgo+ICAgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTk1LWRp
c3AtbWVyZ2UKPiArICAgICAgLSBpdGVtczoKPiArICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVr
LG10ODE5NS12ZG8xLW1lcmdlCgpJIGRvbid0IGtub3cgd2h5IGNyZWF0ZSBhIG5ldyBtZXJnZSBm
b3IgbXQ4MTk1LiBQcm92aWRlIG1vcmUKaW5mb3JtYXRpb24gYWJvdXQgdGhlIGRpZmZlcmVuY2Ug
b2YgdGhlc2UgdHdvIG1lcmdlLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiAgICByZWc6Cj4g
ICAgICBtYXhJdGVtczogMQo+IC0tCj4gMi4xOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
