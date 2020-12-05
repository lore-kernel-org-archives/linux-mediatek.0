Return-Path: <SRS0=IZYC=FJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DE3C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 16:22:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83A3D2332F
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 16:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83A3D2332F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HukidP1gZwu0SzvZyTWOMNDiYJaym5rG1R53b0hHbEw=; b=3gVJU05aljMunCffYQMlqhz5W
	WUrq8FSAvhN4cTbJ2P3zrfHcJNsMw9ATO8Z5aNruRMt+flu5L8e03NKQEE6IZ1Udh25WB4ZkUc1J5
	PzIjKL5IJf9QE/F8M46BfxO3l9zr26SbkU9YP+0iJjdexf1OUbEbeE9sM9okWQgAKdh2kttWth8qt
	yUM1GvZDF++NxI3AzDiCr7yNi1NTEcXzI8uVUudI5AztRB/kncNAT+bzOx3ceY9BsiQe9FumYp5OH
	hmKvkxpL/tqfqnHsQsu6Z8bzWCePpCSxQfa3IE5yyp7GGz14cMTcAVcGHr0S+J7QijCX7lvkpYaWO
	7ijSTlTrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klaK1-0002TV-8H; Sat, 05 Dec 2020 16:22:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klaJw-0002SN-3o; Sat, 05 Dec 2020 16:22:04 +0000
X-Gm-Message-State: AOAM5323VkhyEF2agR30oXwPPm7J+evziy+hos5g1VlvWvPieZWLs3fk
 FJkEtVYsuHPZGNnSJFE5PCEgdPfVHbdE/jYHiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607185321;
 bh=HqCL0C0fBHGxybJAYvYG5qc36iWdza1r3+6oQ7q/QYk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TtJl9McoDTm4OO627Yqz78MaeEc4lov2ZnYQKkmPATAcFuvhKtxucO2BDITPFuftx
 hVTzsMORaModcamthtXy46dRtD0/1iZ0ZY0RywfehXS/fFmj/pUpNrupP7/vKUxEV7
 EcxMLfUuEEfN4GGPYcfTlCHkjyf9NsEeaGT6EI8TgcOphkCDEl19PltzMSXEsnTM9O
 XkhXjSYZFlYQCOpNJTPKDjTOsTEUIGKPFUiKJYMuv+YRXhGnNNpz7RRdR5qZ+VM4nA
 5Bapll5WHjlNyxm62RiT+sdWeNOpNh++dzGKIGIlTnT+HZYtb3zluT0K6C/MOYLkoE
 XsSNjBsuzhKTQ==
X-Google-Smtp-Source: ABdhPJxwRKEQCMgyly92qJS7B2s5xnqRdBYASutdDp1ipsbSBixu6U9DGAGmsD6yZUvGOAiiKhKjffVVI+kTdkQiO3c=
X-Received: by 2002:a1c:790f:: with SMTP id l15mr10033938wme.188.1607185320277; 
 Sat, 05 Dec 2020 08:22:00 -0800 (PST)
MIME-Version: 1.0
References: <20201205091146.3184305-1-vkoul@kernel.org>
In-Reply-To: <20201205091146.3184305-1-vkoul@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 6 Dec 2020 00:21:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-_X98x=DeGLnSRDcZ+9wfpW2-EzpqJLQxDJ-UGoYaONw@mail.gmail.com>
Message-ID: <CAAOTY_-_X98x=DeGLnSRDcZ+9wfpW2-EzpqJLQxDJ-UGoYaONw@mail.gmail.com>
Subject: Re: [PATCH] phy: mediatek: statify mtk_hdmi_phy_driver
To: Vinod Koul <vkoul@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_112204_223012_563417CF 
X-CRM114-Status: GOOD (  12.85  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFZpbm9kOgoKVmlub2QgS291bCA8dmtvdWxAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQxMuac
iDXml6Ug6YCx5YWtIOS4i+WNiDU6MTHlr6vpgZPvvJoKPgo+IG10a19oZG1pX3BoeV9kcml2ZXIg
aXMgbm90IGRlY2xhcmVkIGFzIHN0YXRpYywgc28gc3RhdGlmeSBpdC4KPgo+IGRyaXZlcnMvcGh5
L21lZGlhdGVrL3BoeS1tdGstaGRtaS5jOjIwNDoyNDogd2FybmluZzogc3ltYm9sICdtdGtfaGRt
aV9waHlfZHJpdmVyJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+CgpB
Y2tlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+IFNpZ25l
ZC1vZmYtYnk6IFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMv
cGh5L21lZGlhdGVrL3BoeS1tdGstaGRtaS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9t
ZWRpYXRlay9waHktbXRrLWhkbWkuYyBiL2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstaGRt
aS5jCj4gaW5kZXggNDdjMDI5ZDRiMjcwLi5jNWM2MWY1YTllYTAgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1oZG1pLmMKPiArKysgYi9kcml2ZXJzL3BoeS9tZWRp
YXRlay9waHktbXRrLWhkbWkuYwo+IEBAIC0yMDEsNyArMjAxLDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2hkbWlfcGh5X21hdGNoW10gPSB7Cj4gICAgICAgICB7fSwK
PiAgfTsKPgo+IC1zdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10a19oZG1pX3BoeV9kcml2ZXIgPSB7
Cj4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10a19oZG1pX3BoeV9kcml2ZXIgPSB7
Cj4gICAgICAgICAucHJvYmUgPSBtdGtfaGRtaV9waHlfcHJvYmUsCj4gICAgICAgICAuZHJpdmVy
ID0gewo+ICAgICAgICAgICAgICAgICAubmFtZSA9ICJtZWRpYXRlay1oZG1pLXBoeSIsCj4gLS0K
PiAyLjI2LjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
