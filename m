Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA43C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:38:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E1061050
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48E1061050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XNYi7mE1PN/hfX9tLqNkC/ZPjEdW/RbuT5ShomNuOM=; b=aIe9WQBexqtxkI
	0ZWYOwSOLPLOEiOXN0b1r778GKx2PKfhznDzZhM+EV0dUj7+50zm94G7llJu+19Pqq3xu2T0tPahx
	EQFoRze4cN2p7wnzef47n4tgEVt3nLcWgGQiN02rCED1wyrSh+ehMIztVR9k7Xl3xP7pPV6pnMJne
	RCTVEuaTfYPWGr2XAaaVxLBRkjEafIO+yMp82QVjyUCEPEzZeB781bolK1pwli/sPjfTQNgHwOZxd
	37WGK7LVmzYAJmoO+weyQlxGVT2raTwypTdtA52jvuv6iZdOueeVo9T5JXK8YH0DQHNZM6kImpEJS
	52bY6y0CyoK6LwguHshw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8ErP-00DC7P-5r; Tue, 27 Jul 2021 04:38:31 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8ErM-00DC5j-Cr
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:38:29 +0000
Received: by mail-pj1-x102a.google.com with SMTP id j1so16040833pjv.3
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hCM6aDqQlj672QNNN33XxbB1KA2gsQSovUNFK/0sjFg=;
 b=DrDU/26Z3jIjjNMzkvdGR9rNb1RDbCZPotepcGCH0snHc/AmzgHXAzzH0SdjaQ1mPy
 GY84SAdyMr7tNwk6wdulckqzhOojnOhPlp/dW/054ErgQUwYUzUSNHZfm7Pks2+gHnFQ
 klizi6BgKspN3ulK9gCMxeE/OjsQa4b5VJpiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hCM6aDqQlj672QNNN33XxbB1KA2gsQSovUNFK/0sjFg=;
 b=HXVuqNnIDQc5TNLy2z1nZuPIiMh+zJjos7lECfho3YYio8J76Lrp1WYEKTdnpV+pho
 QvczIDlYkvEqndQ++M2xnzeDiUno4OacfQXB+Pdeyq7lnoS4WJlRelnOAJbuZ5f7biDy
 9lRd1Bxf/dHmaXDcFbqzY+cVT030fcQ7qOai0IyDWtdzgwpCFC9PezzDBWKh0ZovfUpf
 2X0im1uytMUvQc1oKIaENHamIhfmzIergOFjpS4E8ZX4N6kftqghU4vZBtE3MWgHnzjp
 ViGntJnYKlJY0GzSoL0Lr3HqtiIgtXBHu5u7K9ncuEnEa4OMf8Af5su8b53+4MgvYfHf
 S/5Q==
X-Gm-Message-State: AOAM530S9kdOGadg7gxYwuol09IDRTZJnzZ6Hqw2eRr3euDjpsK5xqKB
 zxFoJC9IjDlbCV3MqjRKmstFYXiAg7C7hpPfVnN+2A==
X-Google-Smtp-Source: ABdhPJw1I0ipQcf1mUHF8PpOYbrM0NpOo6vsm3gZYflpD3/0aDHJFNjYHGyNJztuit7nHdXSI3z60HYGFeYYm9x7nKY=
X-Received: by 2002:aa7:81d8:0:b029:308:1d33:a5fa with SMTP id
 c24-20020aa781d80000b02903081d33a5famr20861701pfn.55.1627360705046; Mon, 26
 Jul 2021 21:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-9-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-9-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:38:13 +0800
Message-ID: <CAATdQgDxBeDCHKy52XCk8bGNA=fcMFMMf9Q5SZZ4L5SZO9xdYQ@mail.gmail.com>
Subject: Re: [v14 08/21] clk: mediatek: Add mtk_clk_simple_probe() to simplify
 clock providers
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
X-CRM114-CacheID: sfid-20210726_213828_465329_7790D369 
X-CRM114-Status: UNSURE (   8.91  )
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

On Mon, Jul 26, 2021 at 7:00 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Most of subsystem clock providers only need to register clock gates
> in their probe() function.
> To reduce the duplicated code by add a generic function.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
