Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB5BAC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 12:12:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9921F60EE6
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 12:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9921F60EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1JPdNWRniuGuabWo1GM+7yIVYn836jhKh7dBJLBgNNU=; b=TthwHCXnTGHHcw
	ms1vDaHe1Pc9sUe50WSxyGKgxhRp1W2Px8L9rIWxD8/qbI6qZBAQvyZ6CC5qeYDjPXvKs2dEBHT07
	n3o/O+ar+4TWiIR2hKRU4bX0GO1eos6hr70JT6cDhc8+CMIXo9Z8s2y8aypMBCMv8gxvnncOFVNR9
	McDpwFoe6hmt9sBIOzJD6G/4ZiT4QHnac+9smqeRbXklSibB2IkPUD095vKEbKuAXm2r99UpNUUag
	7lgFptWlnPUH8SX6TS8+3OHHE03yNjEWQkkEdZkhg+hntGvHImeIHZ0Gx5jiIK7mkE1AD9sh0hIYx
	NpFh8PMVuptpMBxAIo6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9RMs-008WbR-Ue; Fri, 30 Jul 2021 12:11:58 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9RMp-008WYf-To
 for linux-mediatek@lists.infradead.org; Fri, 30 Jul 2021 12:11:57 +0000
Received: by mail-il1-x12c.google.com with SMTP id o7so9118876ilh.11
 for <linux-mediatek@lists.infradead.org>; Fri, 30 Jul 2021 05:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4oJIeZcOcOPJ/i4mLzpMBQLS6AE+13Y8avAKoNcxP1k=;
 b=b4hXRZsxrIvCyPKxJq3eohsD6mPpTgbVVsSl0RpV8nR1xxxbYJEKpZQ3dWayQpOsjA
 vpGWfxPgwdMrJik+8vPk1we4h/If4ZARe17ciIzx61mMB4BrieDoxBOIq+5d9lt18jPE
 ol/7Yy5zR0HV7uUPAwCLDNsgO1oVqqN4gXDNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4oJIeZcOcOPJ/i4mLzpMBQLS6AE+13Y8avAKoNcxP1k=;
 b=k14aPLR60rcMdkJnx206nKj+DgLKMdgWBMgsO9jneEmDqw6FuY91UlEJuuFhZjFKmS
 gzTCHd1NFLwGyjTv+5G2zCqMy98kbC0Ow8Z/c0z1rXJGLBzX71Ex64vHZn1PzJT9sQrA
 fJy+r/BO31gK6PrDYujyQy06lYi5f4BuGtWNd+AT2U2pd1IRTijEglHBqYyhFQ/rQQfP
 22TGOCR9nUV4DF03bXLKaeCHjBTiZr9dMpegvU4ifp1VsIicQrk/57GuZ5/NSS12QUEW
 UKnPdL5JTZrZi1mm51uIrbSMdovAlEtdfez4omouX5P9Qut4C0hUeGJ+Qro/UUsjK21U
 bGpw==
X-Gm-Message-State: AOAM530jWPBr+tl63rQlSK1vU2/XFNFjdF6nEgNJ3tgyXVZx0+zsuw0r
 rj/13ofuX58bhqHQ/l/C9AU+KkvUSEQPJUgPHSdsng==
X-Google-Smtp-Source: ABdhPJzdzY/EkBXtzNbk992cCacQT8oJznIwK+0lfo184G1dL4ZfQrzWixcBHtE9NkEBCuM0gHsmDH2Vwoch4Bq+ytI=
X-Received: by 2002:a92:d441:: with SMTP id r1mr1209740ilm.106.1627647113059; 
 Fri, 30 Jul 2021 05:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210727110232.2503763-1-hsinyi@chromium.org>
 <20210727110232.2503763-3-hsinyi@chromium.org>
 <CAL_JsqJT1_TKc9QDxGKZ=WrK8_JGwke9MarMzjUvJJPJD8A5Jg@mail.gmail.com>
In-Reply-To: <CAL_JsqJT1_TKc9QDxGKZ=WrK8_JGwke9MarMzjUvJJPJD8A5Jg@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 30 Jul 2021 20:11:27 +0800
Message-ID: <CAJMQK-jnPg5bzPVRsq=9LEMooUN6CerdMqiXhgY5rZVkuB5UjQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: mediatek: convert pinctrl to yaml
To: Rob Herring <robh+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 Andy Teng <andy.teng@mediatek.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_051156_019302_6C9DB2B9 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jul 28, 2021 at 11:17 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Jul 27, 2021 at 5:02 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Convert mt65xx, mt6796, mt7622, mt8183 bindings to yaml.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
<snip>

thanks for reviewing. All comments addressed in v2.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
