Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA297C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 22:30:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C15D23A79
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 22:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C15D23A79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RfU4OjWkA8OJHJ/IO29IbqGRoJZioeu5X7n2m3IzSzw=; b=qcTpMeCC8Pe70cara8+bVRQvw
	p1WTz1VleLx/lfBDQraqPM3GeHwqhPKxnqmdWyeEblvWc9y+q6fmAztRVwJ+8CzgKXBUGfuTXp63W
	hIeMIJzjveF8pp9L8MKSsCQF4rJuYm4y7S8nrUYSAmmbQuG/SCl64NBk9f7/3HN5XD6Pxs42jbmjt
	zzMMRKe9QI6pF9kAiFj5rFTNGExSfNzfGYkT5+ib1W212fMoNA1LxOomuBBiH/iCv1nByNON7jy2X
	vw7bwPF2kFxupwVoA/v/RmfSyA64O2286nZm/bifAnasIhBnAAuesxyxaDnZjr4subXySeMO33Ui2
	t+QLYdVzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0B7g-0001jf-Aw; Thu, 14 Jan 2021 22:29:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0B7c-0001ix-HG; Thu, 14 Jan 2021 22:29:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9577A22CBE;
 Thu, 14 Jan 2021 22:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610663378;
 bh=hfhWqcDtTP7IYqbullRyMrTJ4FwI6nFHntuaG+R5yWM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FHpNKtw/tUvzI7bPgkJsDyeuR3eL0aD6jZN+X7Gjn7lvnN22N6TP35oKv9rZYX6iX
 4lx2e8hXwnhSEtgOmi+LRj0omTE8Te5twsNjEMvTS+WTPqxxbM/GMl+1A1c4JhUxJK
 xnb4ZYVndERrSFaAPmTatWz2MYKRnafcelc72dCox0YCvqMb45Df2AUfK09lJbOAzz
 yv04Fx9LAabwNWij47SZ2t6vQHlLEBhaNLc15m8sJFjl87hJ36vetsj6QA0SUYpFCw
 WopBKEAasQ2L15xLlVGrlQIegFFQBNNvG2fu9cZdrY1zgYL9fackb8bOmob4AmPfcd
 g0EAXAnuPIBUg==
Received: by mail-ej1-f52.google.com with SMTP id q22so10580394eja.2;
 Thu, 14 Jan 2021 14:29:38 -0800 (PST)
X-Gm-Message-State: AOAM531JFxXqQew5wbmdY1troV3HUc4HZQBlZErKYGR6hDUpJbfos/sY
 I7F/QSF8WQcnTDaQeZGX+6ZXlu2+z/puecF65w==
X-Google-Smtp-Source: ABdhPJxHUpNkN+T/hx5/nLUs2NhEXsLPGFPYkhav/uwL0W2GV8AyJyfJEsMZKL7rtqY1deaxIhopqVVyoecIA3WaRgE=
X-Received: by 2002:a17:906:3753:: with SMTP id
 e19mr6800550ejc.267.1610663377179; 
 Thu, 14 Jan 2021 14:29:37 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-2-git-send-email-yongqiang.niu@mediatek.com>
 <20210114191122.GA3394181@robh.at.kernel.org>
In-Reply-To: <20210114191122.GA3394181@robh.at.kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 15 Jan 2021 06:29:26 +0800
X-Gmail-Original-Message-ID: <CAAOTY_96hj0SGzSJCzGU7Z0DOFoituLpVOP_UW05E21Pt9QjfA@mail.gmail.com>
Message-ID: <CAAOTY_96hj0SGzSJCzGU7Z0DOFoituLpVOP_UW05E21Pt9QjfA@mail.gmail.com>
Subject: Re: [PATCH v3,
 01/15] dt-bindings: mediatek: add description for postmask
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_172940_635032_B7FC0A68 
X-CRM114-Status: GOOD (  11.57  )
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
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjHlubQx5pyIMTXml6Ug6YCx5LqU
IOS4iuWNiDM6MTHlr6vpgZPvvJoKPgo+IE9uIE1vbiwgMTEgSmFuIDIwMjEgMTU6NDM6MzcgKzA4
MDAsIFlvbmdxaWFuZyBOaXUgd3JvdGU6Cj4gPiBhZGQgZGVzY3JpcHRpb24gZm9yIHBvc3RtYXNr
Cj4gPiBwb3N0bWFzayBpcyB1c2VkIGNvbnRyb2wgcm91bmQgY29ybmVyIGZvciBkaXNwbGF5IGZy
YW1lCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBt
ZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCB8IDEgKwo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPgo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4K
ClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVu
a3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
