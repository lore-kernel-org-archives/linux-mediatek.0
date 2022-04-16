Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65F7C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Apr 2022 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAY5UoLlgNjwZZ5bFlzub/Scgl8WVkWus1OpbgkWRjo=; b=g3BUD8IHq2i6j1
	kOCTKRS2D0ZFhoDEOpEAKua0Qyt8rooXID9XOvokA+31g0kTDfHO7nrc4JWxxHf+jULF+EnTxycjc
	qKimWY4msHwUUuph1VbOThRQf6AVfzP25VPTN41lsiVV3640xp8WTcagLV9gJ87meLmQFCP61lBFm
	3F457W3B1ocFj/y3oue+uG82rKmgTKxc1UauE1egNwVM06MjK3MSCZF8lY3IzX7hKpdJeu2D+2Tn4
	zUOzulOqCxYDQSsHgCeqP3R7Kqi7ibYS7aMf3gDAvXumUU+fN4M9dhJyMu2jWFufGMA9qY3+Iz9n+
	IPIqK1zkVW18hEUJ7Klg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfjIL-00D5jA-Hd; Sat, 16 Apr 2022 14:21:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfjI9-00D5g4-HC; Sat, 16 Apr 2022 14:20:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2EBAA60F4F;
 Sat, 16 Apr 2022 14:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890E0C385A1;
 Sat, 16 Apr 2022 14:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650118847;
 bh=cWFwLZ0gsVucA5Es4p84LruYFLWbrqoMEwSN0TuIkzU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XDzfBSksXEI8qGNWOHFtln3WMB9rNV8dHxdESNVd28Tycyp8gxI14j+GAueK0vdoo
 x52nmuvKOi1hSqYc4FyW+ZiFl8k9MsO6fSGIxXICkqa6xj2UgMJf5g8fpAvC7hc3Qm
 6rf3JtbNezGuA1rUkmYwsSVbkciLwK3jKixYXM7M3VFWOjiTTOM7OJuwHxIGmN6cKe
 7SmTLyrYHEoJrDm01TEbyaZQsSC4a+KXjSLcnqqvQOz2juxXRUqxltuzwlYBj2pg7S
 jFrMzs+50pBrPEHMhJYcpE1TjyCDemN3Sd0etL4BxaocQo/aNlKeyMr6pZhU2jH7Rr
 TxBv3XBppqQgA==
Received: by mail-ed1-f43.google.com with SMTP id 21so12924988edv.1;
 Sat, 16 Apr 2022 07:20:47 -0700 (PDT)
X-Gm-Message-State: AOAM530YQo9lkbmq+eWrknHy47J6350UvY4FUw5P3c97jfMhRZ0gkg55
 zHbYNgZpcOvSlA7qtKOhhyORTfoHKyrLeBtECQ==
X-Google-Smtp-Source: ABdhPJwQkbTe35To395M3KGFQV4l935J7hGJqs1dYrMx9rEk+J0ELzSpWfOjk+VIW7myhFOyzkXfRd5cnptK29wlYcI=
X-Received: by 2002:a05:6402:350d:b0:419:547f:134a with SMTP id
 b13-20020a056402350d00b00419547f134amr3964452edd.405.1650118845815; Sat, 16
 Apr 2022 07:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220411035843.19847-1-rex-bc.chen@mediatek.com>
 <20220411035843.19847-2-rex-bc.chen@mediatek.com>
 <YldWhNA6SwNBGXa8@robh.at.kernel.org>
In-Reply-To: <YldWhNA6SwNBGXa8@robh.at.kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 16 Apr 2022 22:20:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8L1EVvAOvD757o3kTq=AKf20yAsDGbuHFQ_mdkfoKwOg@mail.gmail.com>
Message-ID: <CAAOTY_8L1EVvAOvD757o3kTq=AKf20yAsDGbuHFQ_mdkfoKwOg@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] dt-bindings: display: mediatek: Update disp_aal
 binding for MT8183
To: Rob Herring <robh@kernel.org>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, allen-kh.cheng@mediatek.com, 
 linux-kernel <linux-kernel@vger.kernel.org>, krzk+dt@kernel.org, 
 David Airlie <airlied@linux.ie>, DTML <devicetree@vger.kernel.org>, 
 Nancy Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_072049_692332_02731D1C 
X-CRM114-Status: GOOD (  18.11  )
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

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjLlubQ05pyIMTTml6Ug6YCx5Zub
IOS4iuWNiDc6MDLlr6vpgZPvvJoKPgo+IE9uIE1vbiwgMTEgQXByIDIwMjIgMTE6NTg6NDEgKzA4
MDAsIFJleC1CQyBDaGVuIHdyb3RlOgo+ID4gVGhlIGRyaXZlciBkYXRhIG9mIE1UODE4MyBhbmQg
TVQ4MTczIGFyZSBkaWZmZXJlbnQuCj4gPgo+ID4gRm9yIE1UODE3MywgdGhlIGdhbW1hIG1vZHVs
ZSBpcyBpbnNpZGUgZGlzcF9hYWwuIFdoZW4gd2UgbmVlZCB0byBhZGp1c3QKPiA+IGdhbW1hIHZh
bHVlLCB3ZSBuZWVkIHRvIHVzZSAiaGFzX2dhbW1hIiB0byBjb250cm9sIGdhbW1hIGZ1bmN0aW9u
Cj4gPiBpbnNpZGUgZGlzcF9hYWwgdG8gYWRqdXN0IHRoZSBnYW1tYSB2YWx1ZS4KPiA+Cj4gPiBG
b3Igc3VjY2Vzc29ycyBsaWtlIE1UODE4MywgZGlzcF9nYW1tYSBpcyBzZXBhcmF0ZWQgZnJvbSBk
aXNwX2FhbC4gV2UKPiA+IGp1c3QgbmVlZCB0byBjb250cm9sIGRpc3BfZ2FtbWEgZGlyZWN0bHkg
YW5kIGRvbid0IG5lZWQgdG8gY29udHJvbCBnYW1tYQo+ID4gZnVuY3Rpb24gaW5zaWRlIGRpc3Bf
YWFsLgo+ID4KPiA+IFdpdGggdGhpcyBtb2RpZmljYXRpb24sIHRoZSBkcml2ZXIgZG9lc24ndCBy
ZXF1aXJlIGFueSBmdW5jdGlvbmFsIGNoYW5nZXMuCj4gPiBXZSBvbmx5IHVwZGF0ZSB0aGUgZHQt
YmluZGluZyBhbmQgRFRTIG5vZGUgdG8gbWFrZSBpdCBjbGVhci4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBSZXgtQkMgQ2hlbiA8cmV4LWJjLmNoZW5AbWVkaWF0ZWsuY29tPgo+ID4gUmV2aWV3ZWQt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25v
QGNvbGxhYm9yYS5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLGFhbC55YW1sICB8IDYgKysrLS0tCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4KPiBBY2tlZC1ieTog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5l
eHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5l
eHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
