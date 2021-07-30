Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8201CC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 16:25:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F03860F4B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 16:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F03860F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VtjWwTqt2oUJ+LfzEZcOFNOsyGo8d/KKeLMZvGMIgLk=; b=sLDZKBpnPnN9qa
	4bDdBj91tcV49rJSFy8sPU0h3qIz9JFuxq6U3qI1ZVYQH08i7D8c8va2dxgwKzurgmSns2N1CTpHL
	LnKA2KiLtefCPtMnjfi/PMKbww1Z0Yv/N1icqoVuoP9V1nIzHllnUUusm4vUw02ldh99PlzcDoEOT
	P4NBQ7GuLhviE8w8G+RdmvHY3SG8KSwTEy2lqxRyNoZ9vHFkqXo29TiEeWejWwe7vK9WX47Is68j2
	qeQCQw5Ky0clcJByR/d1+sD0Qfi0powdgnoe/O0GAfRnnZUCearMuT7VFU56DicADmIvzMV4Welc6
	OuHd9fMaxCr7k4bXh+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9VJj-009UIT-Go; Fri, 30 Jul 2021 16:24:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9VJT-009UDI-Hr; Fri, 30 Jul 2021 16:24:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 372A56101C;
 Fri, 30 Jul 2021 16:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627662283;
 bh=rJGnm55O1tNTXXwwxOhfbNirfLkXYq7zue02n7Tdz6g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oiGzBHlg862uFecdCPxiopLytEgtT9H1q/AcThot49jQjIX0/d5bVk+dLn37KqRGH
 BEJyH+6mdVrVF0tRLmWiO7o1PbM8jL0YVqZBN0Q4rgb8dRbSi6L1bRLPH1ocjzoirT
 cp4r77MxFGSCqexTnykNH+UpxKj1SWzfg2c9j4wGfiHUB1Zsgm0+hrqZHFv/k3w0EC
 brPZJ9F45MuY4VagEY4q4F5W3wJwcH4JZaEQn+s4lzkoQYAkZNpNUCoRGdaKecfPhc
 mB7/zX7jbSUiVl6llFHL6nxGTUpZIzevCYu5z12RyOwZTDTUa7hkbcCp+FiAIJlPj0
 rjsgnSxSRyVKg==
Received: by mail-ed1-f53.google.com with SMTP id j2so13912820edp.11;
 Fri, 30 Jul 2021 09:24:43 -0700 (PDT)
X-Gm-Message-State: AOAM531xXx4zcLHlUSH+CgcPwPbg3EwQ+KO3z1OcUZl4tQPLF5gqtNJK
 5bTXLy/VUD2KPAjA4p8wXE9eeW4GogIIlswE3w==
X-Google-Smtp-Source: ABdhPJyA06qzYSh+f7EEVqAUfFRLkrZuqD1G+Hvft9QlGEOSN9ieg2X5H3Hxms9/ORgFt0VU+fGNT3l+kVqqUAMyCdw=
X-Received: by 2002:a50:d71e:: with SMTP id t30mr3917906edi.72.1627662281812; 
 Fri, 30 Jul 2021 09:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <1627459111-2907-1-git-send-email-chunfeng.yun@mediatek.com>
 <1627459111-2907-8-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1627459111-2907-8-git-send-email-chunfeng.yun@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 31 Jul 2021 00:24:31 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8XCeWbiHziB9=2EdUFmOg1m6eOi1qTN1QppqRKaS07xA@mail.gmail.com>
Message-ID: <CAAOTY_8XCeWbiHziB9=2EdUFmOg1m6eOi1qTN1QppqRKaS07xA@mail.gmail.com>
Subject: Re: [PATCH 8/9] phy: phy-mtk-mipi-dsi: remove dummy assignment of
 error number
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-phy@lists.infradead.org, 
 DTML <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eddie Hung <eddie.hung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_092443_659001_B7971629 
X-CRM114-Status: GOOD (  13.23  )
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

SGksIENodW5mZW5nOgoKQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMeW5tDfmnIgyOOaXpSDpgLHkuIkg5LiL5Y2IMzo1OeWvq+mBk++8mgo+Cj4gUmV0dXJu
IHRoZSBlcnJvciBudW1iZXIgZGlyZWN0bHkgd2l0aG91dCBhc3NpZ25tZW50CgpBY2tlZC1ieTog
Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1i
eTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL3BoeS9tZWRpYXRlay9waHktbXRrLW1pcGktZHNpLmMgfCA2ICsrLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstbWlwaS1kc2kuYyBiL2RyaXZlcnMvcGh5L21l
ZGlhdGVrL3BoeS1tdGstbWlwaS1kc2kuYwo+IGluZGV4IDAxY2YzMTYzMzAxOS4uNjFjOTQyZmJm
NGExIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstbWlwaS1kc2ku
Ywo+ICsrKyBiL2RyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGstbWlwaS1kc2kuYwo+IEBAIC0y
MDMsMTAgKzIwMyw4IEBAIHN0YXRpYyBpbnQgbXRrX21pcGlfdHhfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgICAgICAgIHBoeV9zZXRfZHJ2ZGF0YShwaHksIG1pcGlfdHgp
Owo+Cj4gICAgICAgICBwaHlfcHJvdmlkZXIgPSBkZXZtX29mX3BoeV9wcm92aWRlcl9yZWdpc3Rl
cihkZXYsIG9mX3BoeV9zaW1wbGVfeGxhdGUpOwo+IC0gICAgICAgaWYgKElTX0VSUihwaHlfcHJv
dmlkZXIpKSB7Cj4gLSAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIocGh5X3Byb3ZpZGVyKTsK
PiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAtICAgICAgIH0KPiArICAgICAgIGlmIChJ
U19FUlIocGh5X3Byb3ZpZGVyKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocGh5
X3Byb3ZpZGVyKTsKPgo+ICAgICAgICAgbWlwaV90eC0+ZGV2ID0gZGV2Owo+Cj4gLS0KPiAyLjE4
LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
