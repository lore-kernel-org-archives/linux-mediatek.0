Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A3CC11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:28:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70BF761CD0
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70BF761CD0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqI3IuhVhzVmbBdRCEjOVjd2zc5eq8C5nTAeprcNx+k=; b=mcf03RTbLnO9bL
	gx+hxYBzKyGkejD/LgGzqxeL6UIazuhMnh6SEa85oBUOA+hpjvhD01V8l6Tc8mU1PLQnRMyGSydas
	0oqZMMfbZHtgqHy5PsLclanCRDbkhn1gyEdDXLnAb6OruaPxTW8raTsx1TI+XBJ3p6aQuviwfrZDL
	3wRRpfKZIslhtd5P4ONqR1wj5uYxIoUoPbYwt4mbdxPSEgoKKK2pfAJS9/xUnhFpEPy2sKoekt7FE
	XKlqhN7mpJUhTXLbZN/z/Dk+2nLPg95rkxMcUyRhuAUt4wRRgkoZujyR0dyUVDAE1lmsCsKaPOXSl
	JIcNHqK8xKh5s0EA3mAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUdW-00D2cV-QL; Wed, 30 Jun 2021 07:27:54 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUdK-00D2an-GR
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 07:27:43 +0000
Received: by mail-lf1-x135.google.com with SMTP id n14so3284671lfu.8
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Jun 2021 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PqChqbCdyi7I3z8ajBtnm4crKLtFjV3f+EdiX7z1gfA=;
 b=jUr7gIdpi/tS//Cxavgazy26slgxlenoY/rYuBZMS2ddK3JRhqdExl4YEthPBGhICK
 fOkzphay2TG+9GeCjQmi0rQFmeSuQpoAdedd5f3yGg3Bf2z49YdsPst0opNI99Cg/XER
 aMbmzWgpadDHUOAW+GlV0oh7XiUJAVKdxrQhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PqChqbCdyi7I3z8ajBtnm4crKLtFjV3f+EdiX7z1gfA=;
 b=bKG8T6jNo9r2P8kga6ZJ9f5i8Bq4ia/Aa8Z6YNcQSpEw1pgELrkX1ny1v3pJ9hn10M
 rTVREv6bwiT7P9ayxJc9X1JY4wuv0klgbs6YRw2R55zHKF1iNsLlDIDD/3cRUDfBICbh
 tlhabGgPb/y23UfCuKJouQRS4+PtpxWp6Flp1sZkHE8Xk8Kc7lExxcAiS0G5P0xgiD/C
 kqrPe7EG0v6QT2XoAXHo6C3vCAPoHvi6oJY+GiEwumuHXCTHiqAnO2eFtieSRmGR4oMS
 C2q+GGDxJSNWzmkXmB7fVrZB5sg3W+7KJ33qp2iYfhEDH7p8vYxHZybwiCPFuAvIMG9R
 ieTA==
X-Gm-Message-State: AOAM533U4sR3RYaFaXPHAL1AUzviPzGzC5PGwd8/MMnLlIacfO39ygVS
 0nCBJKIpKjaqSQ+17/3NZb5hLD+i5ErUVucLBMP3vA==
X-Google-Smtp-Source: ABdhPJwXTLvf7WkEdKH0kiRYx7KjKKymzqJOW8pf4v4ankygH2rmshV2ToQvOyzTvFQ05hkpl8KgHD/m3A3riEJ7Rts=
X-Received: by 2002:ac2:5a11:: with SMTP id q17mr26529672lfn.479.1625038059798; 
 Wed, 30 Jun 2021 00:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210630035443.2144958-1-hsinyi@chromium.org>
In-Reply-To: <20210630035443.2144958-1-hsinyi@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Jun 2021 15:27:28 +0800
Message-ID: <CAGXv+5ERomKaid2wQ5Sz9CB-q+DVLMzWq08b+rkkh5=3WnG5Vg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: kukui: use generic pin configs for
 i2c pins
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, zhiyong.tao@mediatek.com, 
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_002742_573744_B8E99E0F 
X-CRM114-Status: GOOD (  10.33  )
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

On Wed, Jun 30, 2021 at 11:55 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> mt8183 i2c pins don't support PUPD register, so change to use generic
> pin configs instead of let it fail and fallback.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

On a side note, the `mediatek,pull-up-adv` property probably should be
merged into `bias-pull-up` with an argument.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
