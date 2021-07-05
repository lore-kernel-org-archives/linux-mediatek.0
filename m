Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F923C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 12:55:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C9E5613E1
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 12:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C9E5613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8NbbWq0Sj9BoIx75wL9tVg5JXjIMvELqORA+YmEBbk=; b=LU7HI6/hn48uAv
	Iijorfl0TQnC/Uj+NHLvv4y0tfxPRMRKGTWz5fLHYOzeXpTf2meN7jJxzMutqrT1Np5n+SKQh7UB+
	6lJL5SDF+o8DMSkxbj4DvGqSQLqzcByRSAQMXy9lCOxoxkXxCdaVqbepj2P53cY/CAhM5yRPveLDe
	IrrwkGpbnXC1g5qBHbAfLvZYVE46kaE3tau6GIMsKh2f+isU90ob05fbRq9K4Cb04N1Hq3efAaq4E
	bNtpF+7bOgc1nuWChJWY+PKcnkwqGlnt4ry937Ou68yOlTceRjSe+k3xLHdnRkAG2I8U4LszQ7c1u
	+OKCCmEWnuj9D6hIXXDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0O8P-008xCM-GJ; Mon, 05 Jul 2021 12:55:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0O86-008x9G-V1; Mon, 05 Jul 2021 12:55:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 378D5613E1;
 Mon,  5 Jul 2021 12:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625489718;
 bh=DL/qfcwl7Mep35KybLuFTSiya/Gs+1I2TD7zA77f8q8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MnWkYcT2jqvq7PjDgs2KzxLL6OQfPVobZRxWv1r3FgKMdG93QhxM4UQC9niDaUduc
 zZST0SESd6LjNo7Cigo4Txqmwrcg1XDOfAsh/OFIWTfF4/6HwFs4XycSgDLLurqMPm
 Dewv4LzkogHsJdo5gQyddmXn68J0CGkAXOSWXt91ylcXdZjkQbwjXizpehYz2V3G4F
 wFNtOdKd9T47eeI9+4/tuLBp5iV/qd+S7mnEDtuXrtrAuGRxl9MpPzlLyLFBXt447G
 GASPDQ5sVteJG886R2PiAVXYv8+pYk/kFaMiJJrbVY7Jcpa9rnosG39q0TP/XzOTl6
 Arz+9US8SfwTQ==
Received: by mail-ej1-f54.google.com with SMTP id nd37so28929448ejc.3;
 Mon, 05 Jul 2021 05:55:18 -0700 (PDT)
X-Gm-Message-State: AOAM533fXpjd9ROVlz6qpfQhiHRxlQBVb6pEbrU51NAju6hFcXfUfOaX
 9u/2BTWw1UhQ8K/75v/e5Wm7e4H1woYVueUQjw==
X-Google-Smtp-Source: ABdhPJz9geTByoPzNQSQooTOiO202kzh3UBmiiWSZZQvrpQFu4TaOlsLcSVYB+yGdIfA6X9oPf8eOjKGIf6mgQo89KE=
X-Received: by 2002:a17:907:728e:: with SMTP id
 dt14mr13157240ejc.75.1625489716804; 
 Mon, 05 Jul 2021 05:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210705033824.1934-1-chun-jie.chen@mediatek.com>
 <20210705033824.1934-3-chun-jie.chen@mediatek.com>
In-Reply-To: <20210705033824.1934-3-chun-jie.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 5 Jul 2021 20:55:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-wLsBwWaaBX0tzt2e5z+3vLO2yMmX2VrCCtO5cs=_PqQ@mail.gmail.com>
Message-ID: <CAAOTY_-wLsBwWaaBX0tzt2e5z+3vLO2yMmX2VrCCtO5cs=_PqQ@mail.gmail.com>
Subject: Re: [v12 02/20] dt-bindings: ARM: Mediatek: Add mmsys document
 binding for MT8192
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, 
 DTML <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_055519_061555_16366729 
X-CRM114-Status: GOOD (  14.14  )
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

Q2h1bi1KaWUgQ2hlbiA8Y2h1bi1qaWUuY2hlbkBtZWRpYXRlay5jb20+IOaWvCAyMDIx5bm0N+ac
iDXml6Ug6YCx5LiAIOS4iuWNiDExOjQ05a+r6YGT77yaCj4KPiBUaGlzIHBhdGNoIGFkZHMgdGhl
IG1tc3lzIGRvY3VtZW50IGJpbmRpbmcgZm9yIE1UODE5MiBTb0MuCgpSZXZpZXdlZC1ieTogQ2h1
bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTog
Q2h1bi1KaWUgQ2hlbiA8Y2h1bi1qaWUuY2hlbkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy50eHQgICAgICAg
ICAgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRl
ayxtbXN5cy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlh
dGVrL21lZGlhdGVrLG1tc3lzLnR4dAo+IGluZGV4IDc4YzUwNzMzOTg1Yy4uOTcxMmE2ODMxZmFi
IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVk
aWF0ZWsvbWVkaWF0ZWssbW1zeXMudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy50eHQKPiBAQCAtMTYsNiArMTYs
NyBAQCBSZXF1aXJlZCBQcm9wZXJ0aWVzOgo+ICAgICAgICAgLSAibWVkaWF0ZWssbXQ4MTY3LW1t
c3lzIiwgInN5c2NvbiIKPiAgICAgICAgIC0gIm1lZGlhdGVrLG10ODE3My1tbXN5cyIsICJzeXNj
b24iCj4gICAgICAgICAtICJtZWRpYXRlayxtdDgxODMtbW1zeXMiLCAic3lzY29uIgo+ICsgICAg
ICAgLSAibWVkaWF0ZWssbXQ4MTkyLW1tc3lzIiwgInN5c2NvbiIKPiAgLSAjY2xvY2stY2VsbHM6
IE11c3QgYmUgMQo+Cj4gIEZvciB0aGUgY2xvY2sgY29udHJvbCwgdGhlIG1tc3lzIGNvbnRyb2xs
ZXIgdXNlcyB0aGUgY29tbW9uIGNsayBiaW5kaW5nIGZyb20KPiAtLQo+IDIuMTguMAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
