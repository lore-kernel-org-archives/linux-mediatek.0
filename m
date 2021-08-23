Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12DEC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:21:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFDC961078
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFDC961078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1XeWdvtFSzUB6OPN9N+u1NpUZwtvUtgTtnHF8l007Y=; b=rxE8e+fBVqzFJr
	mmkLJrzBAVnkDJUHC7WcX0llT8GRLQVDc55SFhuDQLOJHJ8H4A1607hjFkz3eDxhfzhapzinI0GY9
	YZFAk5mKmUvnucATH0BgbnnZoAXhxIKf2xSBDR5I9U644KECxocR4Owz8JFAx8kwav8VuGBa2EA1F
	4mt7t3XjhnE9A5xC2k4qgXB94mSuQQlZiNQFYqa5eX/iCRsegYKxWMb9I2pX4J2H2QAz5KGKnYzrc
	kAWZA0FgoW0mYRWEZX0LO79LkNcxrWEcMWD7EA+pe7jynvWdgmifdjqXVMs5QqdVBWJRmaEVGHTkw
	r3UVYP+avkbAPB3NCg7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI8xA-00GkMj-SK; Mon, 23 Aug 2021 12:21:24 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI8wa-00GkA3-PC
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 12:20:52 +0000
Received: by mail-lf1-x130.google.com with SMTP id i9so37485112lfg.10
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Aug 2021 05:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J/9lMngJdsO39utn1rnBXQpLcoAkKWd+nQfEyzAGaq0=;
 b=A93zXOcuEP4Kz+850M7QkS6YIvg0xSj1PenNxv1W64YmPWMa57DygFf75G6oclbkYa
 ffnVJQo3HSz4vUCXNF61F9MhY2o4RIijteGevGpyGLcXGRH637WleRHHheLDBRu0qYHH
 CnitHEo+t/IibGAfmbAcyFWPiLoUu5omC1EaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J/9lMngJdsO39utn1rnBXQpLcoAkKWd+nQfEyzAGaq0=;
 b=TfPztUJc1v8A1aLIYJA9f4L5BBdNUB15akk7qxK4ftAugJPBU3ocqXMXOxyeoRm1D9
 PgDqeDPzVSC4ZRNn+Q9CETvhUXVyyZLfhIfv36AhsDTq0Pcbgts2pH6WiS2kP/dGc2Sw
 DXWqeuitUFrMDIh3FlWP+2SpHPL5HQ7C84tR7Eh08NTlJKg8as2h2JCindbXGCfrsbv4
 lDJ3YOEvRVT5bVYE7qeuVU3cUJ/axVgujJHaBZ5RjptcJyC9dyhrv3Kq7Y9IZMA5ImCZ
 rMiWXK3RempX5oN8jWxeCMOe+q9ASKrypB3Pz1TKDevndhdphymIT0ni4Prx4ti9Xx59
 4Crg==
X-Gm-Message-State: AOAM532khQQWxnE4NS5bqnvTOI1yUzI3Y7S+jgxu+zdY6YyJI4uSdTIx
 oN1iMLzYi+s2eMsfJYcZJ36XPsfVeTWnai0iIISg/A==
X-Google-Smtp-Source: ABdhPJzZV+X+GD9FTgIY+7KEoZ0aRWDNfvAX10pwPbA9Jx1RGnfwwCvySJdrhtlRgTZ1eoaOFCpMJ/yt+XRo3rHFWRE=
X-Received: by 2002:ac2:4116:: with SMTP id b22mr25323200lfi.587.1629721235847; 
 Mon, 23 Aug 2021 05:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-14-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-14-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Aug 2021 20:20:24 +0800
Message-ID: <CAGXv+5Fj69MQroMZV5ecpEg7cBcin0rA7C6XNCZcvcHebV-HQg@mail.gmail.com>
Subject: Re: [v2 13/24] clk: mediatek: Add MT8195 ipesys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_052048_845717_1A6C4F75 
X-CRM114-Status: UNSURE (   6.69  )
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

On Fri, Aug 20, 2021 at 7:25 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 ipesys clock controller which provides clock gate
> control for ipe IP block.

Could you describe "ipe" in generic terms?

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
