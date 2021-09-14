Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 03:54:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5D2C60C51
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 03:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5D2C60C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZY7IyMrvZ100Lv8rvujEWhnRZKk0GIlzGkcowSAiUk=; b=SC25ZfhhzIEaZm
	N0yKxi+Yb+w3O9lrfDksfvq3ilj1Bh9sRqLAIWrErFq6O2xhe5XBeG8CSv8y4kSuZ/sHegjYFBmXr
	YHVjSY+DyZVaVm7rEPiOTHZi0DQPsQ1o63M/aGHOs5SbFl/17Piwq2WCYVQlEEUPv1XPFNKGExi5y
	IrssZp+COjFObb41uHwBjcXiUMOKP4gMx5G1VhptRsDIIvbqpAJo5x8/vsub7fywr+wE6Pirva8PB
	YnEoQ/bL3ei594wVTr0B6XJFK/DdfnWn6JSxJIkSlMRAM0S7Upb0E7JzXt5OalTmnbLdDGbZ+HbT9
	Kh7A+VLQkRUgdG5OJKpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPzWv-0046So-4n; Tue, 14 Sep 2021 03:54:45 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPzWs-0046Re-TC
 for linux-mediatek@lists.infradead.org; Tue, 14 Sep 2021 03:54:44 +0000
Received: by mail-lf1-x134.google.com with SMTP id a4so25718566lfg.8
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Sep 2021 20:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V3UGDU81U9TWNu+b+RTtkfUp8lpGdcxhRFiSbeAytI0=;
 b=CqVgi5LN+VU9Lng3wgwCbs8J7/30XsJBr33Rnghx1IM/UnhrmUqVsI0nK8UMkkTr7v
 ArllR5WC8kHE946ELuMIy4wldZrau3NxjIQLzgxEzl0dU5ttCX4IxMT0v9pYDvtRd4gI
 gnuXV3F+191DgI51Qf07etXbbLodoicx8aIQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V3UGDU81U9TWNu+b+RTtkfUp8lpGdcxhRFiSbeAytI0=;
 b=qX4DQ4PzLkrpWjUTOXq0vKMU/MpBhfqAy81pwwFlYXdlRYOAYE8H0Ij1a8XiYxyYuv
 h6HLBjUgd+K+FySt4tLrm8c5U4Jtm2ALqglUy24qbjDdVXsJAg8ZJeOJOYoKyo1YKf1/
 DbRivqBR9OtBNTi9FHI4cbTb097L7oIrve2Tg5ltJn1K+USErX3t/O3PoKNIWOa2Iir2
 sl2IRH+hFjtWiLfFbuVbUM+bAGRKgIwzZlWuo632uRwYoKsr5JklGNLf7sUSWl3BOytk
 mm8cNwTNn7Kl/UVtIduoT9sdtMagZIHKwgwVJhiRZ/npG+/fXruSQ7apohWjWUWTwSJG
 nT4w==
X-Gm-Message-State: AOAM532VFxm87Z4jz4bvuo5qfDZiHjVGjKHTw991dpermf/mQtitpgPf
 3yPTidC+maJO1eHHJfYP0lkdTPwMab+T19v1srOPqg==
X-Google-Smtp-Source: ABdhPJz06wxSNftrXxbf9gQccwFZoT4p6vzzDgTrPH3HmQOLPaulrUefmGD48EIhURQIzkD+/6vrYZupUg2JBcfAYEQ=
X-Received: by 2002:a19:c3d3:: with SMTP id t202mr9045097lff.678.1631591681299; 
 Mon, 13 Sep 2021 20:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-8-chun-jie.chen@mediatek.com>
In-Reply-To: <20210914021633.26377-8-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Sep 2021 11:54:30 +0800
Message-ID: <CAGXv+5FcTbaR2yXK3OB+iTgYy1OUpDt2FKQw7bA3nGdk4jKxZg@mail.gmail.com>
Subject: Re: [v3 07/24] clk: mediatek: Add MT8195 topckgen clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>, 
 Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_205442_997789_4C268B62 
X-CRM114-Status: UNSURE (   7.70  )
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

On Tue, Sep 14, 2021 at 10:17 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 topckgen clock controller which provides muxes, dividers
> to handle variety clock selection in other IP blocks.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
