Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C88C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 03:57:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BD5E610A6
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 03:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BD5E610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSVQ7tAGaVmX+HoAyOydjI36fphbu7r83RTa3jdZMw8=; b=ghMgCfXSoKTZmi
	0r2nRjl/A0DIy2Vq8I9Y+T1CsJBmRuQJE0IZMJqJIKf/Sk/fJVg40F8Xuy7O0G96zPuDyG0QhYyoy
	s+U6lt4pRL0CiJTOnTr/osu9psH3y5kWRgW1BAdLLPd32iZFt8KWNcDRHKt9Ci55Nh9aVleKtqpO6
	L9nWeP+StwVmxz3r++JmVaK6GjRGnLSdc7c4cTCABlf5dstd+vTVxSqJPDrLQeh6OiBrkIMO44iWT
	rSj61d04kJGUYdy/pSxuoXS7KjCtg14kxHzSU2Q7eMgm0fm1pj3roM6mpC1bZ9G63pSZ6/TtFJ9Wm
	KYu6NkWHIcTizADTv+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPzZh-00478j-A6; Tue, 14 Sep 2021 03:57:37 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPzZV-004760-6M
 for linux-mediatek@lists.infradead.org; Tue, 14 Sep 2021 03:57:26 +0000
Received: by mail-lj1-x22c.google.com with SMTP id h1so21149311ljl.9
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Sep 2021 20:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Icmlo36/WeDJHtaQFlCSDhUmVMRzwC9n0IjehX7KX8s=;
 b=Q+Stt1KegkfalX84XgzXINRwOGd0RpR+6QUTPx0SZHBmm4C5qOIaMMChUxb/bvCa/q
 N+DnQnqm6E/I1cAep4msngrWAuY/dX3dTkfMWmKokV1THByzRpZo7loo3t9Et69P1DBW
 dYZRLPWhY699/X9g0RM5J+LuCSKCWqELM3ITE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Icmlo36/WeDJHtaQFlCSDhUmVMRzwC9n0IjehX7KX8s=;
 b=WQA1wP82HFQpza9TKiKhdja0G/5EkqTRd7h+T/xMFlG9IXTvcENgfu/gxYKbLKP7/L
 3eTY9mlCthjarp+uWqrgpB5dPaoy/Zlv1IKAnLfZ2kg1pAGsXbGAsOKYXUUCvS8rKsnA
 aZbgowGkfOIos+LQokoQrZhgeYH6qRGCR+yyu6BUdaUsEP3hx+/nLqFXfJBN/bPZ2z6K
 xLCR9qkUii08Vpj/h00NYD8IKd0e1YY8hbamJC5740tLTRdseO+XdwTNt4viJLrrJThm
 dPYeUg+L/p/fB/7rzCBQDQbm6dgn1RJ9KqIJCt3jH8jIYYkiu56SD7HD2IPj0lYLdZG8
 CARQ==
X-Gm-Message-State: AOAM530JYqa5Aj0efknQwgWftEuMh69WsS+ANVFxXcIfyvHo4MkAmn7Y
 LHU9q3BRLRzl+2gTUFh7YcoLfl1aRWI42jMZlSzjiA==
X-Google-Smtp-Source: ABdhPJwVMLw+Xt7TAjoKUbHM819dKKR5E2dhZV4AvzPSxkF4HY0R4Bdi6S4aV7q+wxGbdhSIIgrROZ0tkvu1zHQV7/k=
X-Received: by 2002:a2e:b52d:: with SMTP id z13mr13262840ljm.376.1631591842613; 
 Mon, 13 Sep 2021 20:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-10-chun-jie.chen@mediatek.com>
In-Reply-To: <20210914021633.26377-10-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Sep 2021 11:57:11 +0800
Message-ID: <CAGXv+5EeaodgMroPF==9ov3nNKNHs1WWHk3DqNWDRmb=Du+-Bg@mail.gmail.com>
Subject: Re: [v3 09/24] clk: mediatek: Add MT8195 infrastructure clock support
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
X-CRM114-CacheID: sfid-20210913_205725_280406_08A5473D 
X-CRM114-Status: UNSURE (   8.08  )
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
> Add MT8195 infrastructure clock controller which provides
> clock gate control for basic IP like pwm, uart, spi and so on.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
