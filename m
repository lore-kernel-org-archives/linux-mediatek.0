Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E547C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 05:59:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02C4561042
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 05:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02C4561042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZNe9FJnvxfXYOMi2evDHlvrs8qBWaMGZiNK0thxGrJY=; b=rzOiKTz8riw40U
	TebR3sXFYQ/a4vpdUCzThqXVPJNfcxH0wItpKOz0hON+B6vtMMdZD7UNfSBPtuZk0JFIL8vHT6ufz
	DbOJtNdnMYRDShgk7TUxxvj2z2DlDfL+kPBpImj7q+UWaYrwZqkIPiSUQpGVaKqbR2FwoWvPjRmwZ
	coLgerZZjXr9qq6dnhC9K9mCmhVOi0bOmqSLsQ1/7xQx5QQDO25ResBP4MwLyHxBvM7GmsFK+Y95t
	RK6RZbI7H1fcBbsx+Opsd+B/vF0QU/Sp3vsZpZsJEuAubQU98gRtYygT5dG/MbW22lyqbKwzqtRss
	vUGgJSg5SYUTf/EWBP6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8z4M-003BdO-5n; Thu, 29 Jul 2021 05:58:58 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8z48-003BbQ-Gs
 for linux-mediatek@lists.infradead.org; Thu, 29 Jul 2021 05:58:45 +0000
Received: by mail-io1-xd2b.google.com with SMTP id l126so5534423ioa.12
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Jul 2021 22:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QpDRWGFIK+Oln4PWA6QkkpVe40JSJ8McnR2s+RnmGkE=;
 b=mmEdZWH9QO6nTwu1Vap8c1ufo0haYzJ8+AoIt9koR+Oq6F9tciWkxYwiyOr/1kks/t
 +wKXMxFzePzvH3ebDbbHnYTXduaI5UNG9WqujvKrMq0oix+whigIbboTajwuo5SArw9r
 xA/96OufmolG8tE1YH1ypC4LDe3rKlEtDr8TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QpDRWGFIK+Oln4PWA6QkkpVe40JSJ8McnR2s+RnmGkE=;
 b=Y/uW9fCeH10OsQQWIrA7BTJzrmUc2noVTkqw0pUea3NEnSk+nfIC82gVGSntw/4ipA
 u6CKqZJp2evnZBdYvN8yU5V6rgBNELnnm3pNqeXvHKb9npOuf6wtjRu4Jb3wInvMRcaq
 bj17L8yuc3rZ50nrZ0uMvsaczYD/eqxx40xxFQwI1kt4J1blS1waPDgwNL4WswyaoOwC
 WT/xKDnoTisg1lRTT+vYaT2bAplZ6fOlptwbH+4Ox9VEACKeXmyFTT9o8KnYpERaBnsM
 1nt8w7zX/4bgGckP94oq7og44L8V/S+6dTcYvn39dXQsDdMxtuFLnSiD5+3YikQd/1eY
 WwHA==
X-Gm-Message-State: AOAM532q6hJqmx/9SJ+gAsba7XspUZIDlZS53iZ19qmfad8T4mTSgCAe
 hJ1avu39qkW4ibOyeDdLnD6/M7C+G89TndnFIlIg7lj5+yQ=
X-Google-Smtp-Source: ABdhPJyuGOXvEqwUIs3qU6ruO+/WOCDkqKZfKJc8oEGOVFJCqgihZ7D+ruxIRmlxDQfsEfCMhexgtinohW6+4bJCHhU=
X-Received: by 2002:a6b:c9d3:: with SMTP id z202mr2669436iof.44.1627538323171; 
 Wed, 28 Jul 2021 22:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210727174025.10552-1-linux@fw-web.de>
 <CAJMQK-g8g5QJbBkU-A6th1VSWafxVv2fGtym+enQa_hDVaVoBw@mail.gmail.com>
 <97C4FA94-B28A-4F0E-9CD3-4E33B01BA353@fw-web.de>
 <CAJMQK-gQeMidjBZ1E=ReMmffC5G8oiFawB4Ey1PNb2ZWXw_1Bg@mail.gmail.com>
 <6BFE13A3-6A42-455E-BDF7-CD285CC6C66D@fw-web.de>
In-Reply-To: <6BFE13A3-6A42-455E-BDF7-CD285CC6C66D@fw-web.de>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 29 Jul 2021 13:58:17 +0800
Message-ID: <CAJMQK-iHfJWnGQRq299pZ9B9ABMsXPEkptyCrGtQqkEyc=HNFg@mail.gmail.com>
Subject: Re: [PATCH] soc: mmsys: mediatek: add mask to mmsys routes
To: Frank Wunderlich <linux@fw-web.de>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, 
 stable@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_225844_636934_56BC09CD 
X-CRM114-Status: GOOD (  16.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 29, 2021 at 1:54 PM Frank Wunderlich <linux@fw-web.de> wrote:
>
> Am 29. Juli 2021 07:47:03 MESZ schrieb Hsin-Yi Wang <hsinyi@chromium.org>:
> >On Thu, Jul 29, 2021 at 1:40 PM Frank Wunderlich <linux@fw-web.de>
> >wrote:
> >>
> >
> >>
> > struct mtk_mmsys_routes {
> >         u32 from_comp;
> >         u32 to_comp;
> >         u32 addr;
> > +       u32 mask;
> >         u32 val;
> >  };
> >mask is not the last element, and mmsys_mt8183_routing_table = {
> >  {
> >    DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
> >    MT8183_DISP_OVL0_MOUT_EN, MT8183_OVL0_MOUT_EN_OVL0_2L
> >  }
> >...
> >so the mask and val will be wrong. CK, do you know what mask we should
> >set for mt8183? Or can we just set a dummy 0 mask.
>
> Ahhh...mt8183 has own mmsys-table and
> i had only changed the default one,so
> value is now missing because value is now the mask. I have used same order as
> CK to avoid confusion and make it easier
> to review.
> Afaik you could use same value as value to reset same bits...did this in default routing table too.
>
Should I create another patch based on this or can you help update the
mt8183 table in this patch?

Thanks

> regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
