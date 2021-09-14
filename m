Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFB1C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 04:00:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFAD9610A2
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 03:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFAD9610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/zsS8/syhxpq27k7Mc2wCC7Wzk/HXmtyKdI3zG0DAs=; b=nO6T23bknJdQKz
	4J99ANpz3ByVgc96GQIp5RzNe4zoKFPsU5ypQmzR9FvsPoQB9UWUDIOUVb90KKXc44wtrs73wr82M
	0Cmc5eBNn2828FsHRchmeo706H5Pn6BikB4lHLtWqL4reOwunOZpn0+ncUQS4sVjfJFvr7XNJPIJf
	qv6UlImfA84SihQDM4j5TAvt2Emr9m6ibtoPvibrP5PlFOQ3Sg3XlQeu0rDYu90gTH2S4OOWGLwKv
	bsU8HzRZhF/XPB29otO4OO/MI1j/YSWqmCxfmO3c+JLJu+WPN0zg3huY/gdbOH2k6252XnwgWhf5y
	DB6mtYP6GtA7gkcZLYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPzbq-0047b0-NX; Tue, 14 Sep 2021 03:59:50 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPzbo-0047Zx-Jx
 for linux-mediatek@lists.infradead.org; Tue, 14 Sep 2021 03:59:49 +0000
Received: by mail-lj1-x22a.google.com with SMTP id o11so13678634ljp.8
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Sep 2021 20:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z5OlzavEWnufbwMW9A/eR0vP7IHNpTn//InG4QBRhEw=;
 b=kdFc8tUhNaNEhrjDOP4m70m5hJq0TXdnz0rnbOzc/ALBYlv6g7fMhlS0iOw5mps4Z7
 ItZH9GoCl/rufW5wf0ao/JmKP9qoFXhL30hH2UIGMLGgxz1UBWzLlcgU+FBz2FQa87nF
 fDmExZc8hr/dL1h/RSR1yAI8TWolCjG2LFBIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z5OlzavEWnufbwMW9A/eR0vP7IHNpTn//InG4QBRhEw=;
 b=sZldiEc3HlyHVipXMUHG0eQ8YlT12HuPb9hTF+gw7Ywl66qtMyfyV+li5uemJpKRLb
 heYlSMFzahxL4D4FguHYyZa6uvcmHSRqQ3WxVHp5gZIg1NKpQfIxdUAEFxvb68ivh29P
 Q5Twq0GFLI7BYdajx7zuQ8ytSh2LlmJuZYUcgwbvSpEfeWKAMr4TVsyVAUedQpeGkCZa
 z/CsAOvgGo8UVQd49AaP6FAmwNpSm/XFhZGCRQ5JjbZoXWMvyteyeSMo4Dc64JMizzUL
 azxDy6vudpSywJCSH4cNvU064Gi0E5A74Uloj8Og5Fnq3anwHqF3TA1BPcnmMaoiW/YW
 HoOg==
X-Gm-Message-State: AOAM532kTYk2IzeRAk9GuztTSKA61m+1TZEA67vu8rPdcirMc8b2MRVa
 RFQ6cj31Ho3Els8kL09lRaIAePJUpJpePgstu/1XQg==
X-Google-Smtp-Source: ABdhPJxz3tXcGotEGCpfsh/LNJdjDfZn+6Q7wCSUUy6z0nG1j2UL769wKfHW7P19kJeUhTBkHqpbx4AG7Tp9mwO3tE8=
X-Received: by 2002:a05:651c:1505:: with SMTP id
 e5mr13491184ljf.9.1631591987302; 
 Mon, 13 Sep 2021 20:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-15-chun-jie.chen@mediatek.com>
In-Reply-To: <20210914021633.26377-15-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Sep 2021 11:59:36 +0800
Message-ID: <CAGXv+5ED0p4mgcB5sOwB3MQBy2+PYq-tcaqL7xW7FHRG07b_Yw@mail.gmail.com>
Subject: Re: [v3 14/24] clk: mediatek: Add MT8195 mfgcfg clock support
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
X-CRM114-CacheID: sfid-20210913_205948_715589_87BD6683 
X-CRM114-Status: UNSURE (   7.79  )
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
> Add MT8195 mfg clock controller which provides clock gate
> control for GPU.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
