Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF18CC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:42:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64DD4610A0
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64DD4610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XgMwGhcpe+LggrQYdJHwfYYVFy3Kyojn81Orx6D2v4=; b=FBPYoVZh274dR8
	XOQp7IkhhKRgJ83X2EMQXqDp1bLuAYv+6lS9bcjc+SryQKzhiWaZVvkvM6GXElw0+WVcfG4lt2u9y
	37wYZOWAXF4v1PkBQNqUO9peukx6a1y9NgTX7g/H+jhT+lwzRgFnQLW/T1TOZduGru9FZlCpdbrL3
	QLqz4q82QVG2X+WatllJby1x2sBfHa0a2PZHZck7YQdSKmvglfH50v5aqeLTwVbGcpdoHVLOqixAa
	Ej+RO0YyHniXpIMhyWE7vUh3P8L/hlplFG/UdHWwmcDo5ecbsxrv/2f17skcSmxTpta5MFpsyvi63
	zj6TlmCFizKmXB9yo1yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Euh-00DD6H-9F; Tue, 27 Jul 2021 04:41:55 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Eue-00DD4l-SF
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:41:54 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso3183256pjo.1
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NnMeB9D1PDCqqXeMDn2tfizMDoghceb94CgirmLY5WE=;
 b=VDvbmJN73quQ8KOcHSbPXKWh4VmvtbZMrn8SdG88fNaYeJ8kGSDow9TKlVVkjkhlku
 iJshHr6RjwPTAYMNYMM2dLditJtDIzQMmBubUwgEr2i5SXxECyPiZsUChPQ5XaUTr293
 +5SNoKR3V4zVZOpMpfvC7fSOGqE6z0D+FUQPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NnMeB9D1PDCqqXeMDn2tfizMDoghceb94CgirmLY5WE=;
 b=ohIBSmFoOggxDd0l22XhSX8ynZMgwgI3sVknTGHnMDzbc6x36UwpmD7RXa9VVqCYt2
 sbLaxzRa8HA0XAtBj5yYn+uGJfixJ04FuzVYjDZ6HREMOK24zYFEU2yT05RGHBs/rcjT
 5jY0ldOZskcFzcSNjpYE/3WKrpK74nfsPCGk4hbOD3I9Aoj0+8Dn8HJTDwPXoqlAB1YY
 haaD1lkh4kOjXyrfzjHw9PVUq4vZfhOBXUNd79PnIkDCA/jaOCzkqfDXM6v5VU+TZqtg
 M8AWjPmyvrMy8HpImi6uXVxs9LLgCINB3xniJpzRNWpH5LDyT90cpCoPLcuwwElgUDMd
 6yog==
X-Gm-Message-State: AOAM533LDN8uZQSbpHYf3zKCI6+U4LFc3eHQR/JbxITx5HKauiHPE6cv
 x53FS8i5rVHxYEXQbsVFmI3ndyI9CzsfGQEfUoJoHw==
X-Google-Smtp-Source: ABdhPJxZcyF8BWfebyjk7/Qh5DO6KidriFsLda2+2nQq0/LmRyIGrEeAG4AVJ6dYzM1CxThGnf699L4x+q6Hfo+gEkw=
X-Received: by 2002:a17:90a:f3cb:: with SMTP id
 ha11mr2394863pjb.144.1627360912409; 
 Mon, 26 Jul 2021 21:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-13-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-13-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:41:41 +0800
Message-ID: <CAATdQgCJVjd2avYd-h4aQK02tNMKFJFbmfaE_waPVJHr=aJNhw@mail.gmail.com>
Subject: Re: [v14 12/21] clk: mediatek: Add MT8192 imgsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_214152_977380_91E3F65C 
X-CRM114-Status: UNSURE (   7.26  )
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

On Mon, Jul 26, 2021 at 7:12 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 imgsys and imgsys2 clock providers
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
