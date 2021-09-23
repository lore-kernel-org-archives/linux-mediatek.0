Return-Path: <SRS0=soVQ=ON=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F950C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 21:28:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0362A60F12
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 21:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0362A60F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWELN9OZoDMZiSsf8SRr1MlXXuBXh9pL5RcsoNXOoEI=; b=hpf9XiuyUvU+kN
	LYOl8uSk6iLX/l99ddRvgrmKVzUVN60vu3j3si4dcqnGMygFuq/Hk6lS2NmSak4CO6SzeNaTHGfhJ
	bhmaRk5XfchEeSCxn5dKsu8CjJsGaU/LDgZyyBiE6vOP5hBv2nvTUIw10wF/P/5/8O/f2V49d7oss
	Jc0Vjfn1bA9ZF47PKhdYouZ2OD1C8vE9E/bT8ccOnGZnGRwj0AIDwg21saXD1UoJhhyg4V8vtkIGg
	054iZykLFJhf7s/BG8NZE0UclZF7MGeXpI8TZo7MvikyFrhY54EzPX67SvPX6uweWYbBWF0lumTu/
	A7A4cIKZdH+/FYL+Mgtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTWGE-00Cd19-1i; Thu, 23 Sep 2021 21:28:06 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTWGB-00Cd0F-OZ
 for linux-mediatek@lists.infradead.org; Thu, 23 Sep 2021 21:28:05 +0000
Received: by mail-lf1-x12a.google.com with SMTP id e15so31666470lfr.10
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Sep 2021 14:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MBp78sUp/qq/D779imVL/Lbu9PeK78HM+BQnZD0lhMg=;
 b=dLMhZj2ATeDg8EvJemQy9FgJwq6XJChaKvKVxiGKZkC2ahFw9Fj48hgwfEnHh8VTef
 TPL7I+ezTKRF/ZnHsecdGreaLOpCu8Z4Iq2flgSFnWBx39Stm3/MizG30uwnXp10JvHU
 Cc/GeNUwVTlu8iRXXc+jwCAQNtjjys3yKN9BNkFiPzxpZcscgwBVyk+wLxbsOCYd8tfd
 zk8EWPQq9CWphTdO0mDwAtI5Lb/Z0wTSpWf2Q+xhaDytJQ1+SYAXty63wDD4enzYh5bu
 IOvHcfpoXXdmzKzH/EIyw6evK8wMqMqHAZoc0BnAJXBxbNiptwN0J2NMw8fwVKCaXwyl
 S9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MBp78sUp/qq/D779imVL/Lbu9PeK78HM+BQnZD0lhMg=;
 b=UkfQH1qbXD3KSNthE2U4icQXXsh+wzDG8OWJDaSk+uHl+Mx3RI6Cu0pMbyihj0fT5z
 z1L579tdBC2liAclcDJQCWW6pAPMHJVL7xUnnX2jr60zja5di1UQh1Hnuj/HTCby8zEo
 WFBjt5l+YNgK/gu1H+p+iUdrQW0qAEVOwYc+o2o2eydW3tVvflIITl2WbSU9uN5/Lhtz
 qNW8eh5NMRDIRbHdi3dDRFf6xOfHUd6JNylH9cUp7sGwcLLOjyMsTJbV5CPzTWRwBPyA
 fh/VSrQ2njZmoreX9x89tslvojgx8jfejZKkERCzOlHKtZec2CA2H6xdQUZjGwF5R+46
 lAHQ==
X-Gm-Message-State: AOAM530rr50g47hBH4THUX5rXFqMxPLRSYcaK1basZ89N75vvCoYhg1b
 uT+bcGvLBWqX/Q7MoQgpV1zM5XCxHuV2yNPGo19ijA==
X-Google-Smtp-Source: ABdhPJxk9+92vir/6aKWvwZZqvrn3BXSHMFDTsYMgToDbdsDjjA4j0yBdIAENXKur/GrAjTKej3PrD+TXbGhxxaMH2M=
X-Received: by 2002:a2e:89c9:: with SMTP id c9mr7430895ljk.288.1632432478448; 
 Thu, 23 Sep 2021 14:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210922025640.11600-1-zhiyong.tao@mediatek.com>
In-Reply-To: <20210922025640.11600-1-zhiyong.tao@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Sep 2021 23:27:47 +0200
Message-ID: <CACRpkdYASy3KMm4VXPrMyvVpONK78gwRn6kthK534pjWb5mhvA@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] Mediatek pinctrl patch on mt8195
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, 
 Light Hsieh <light.hsieh@mediatek.com>, Biao Huang <biao.huang@mediatek.com>, 
 Hongzhou Yang <hongzhou.yang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_142803_846267_28D8AB48 
X-CRM114-Status: GOOD (  12.08  )
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

On Wed, Sep 22, 2021 at 4:56 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> This series includes 5 patches:
> 1.add rsel define.
> 2.change pull up/down description
> 3.fix coding style
> 4.support rsel feature for common ICs
> 5.add rsel setting on MT8195

It appears we have consensus so I have applied this patch set for v5.16!

I had a problem with the bindings patch because the context changed because
of another patch but I think I managed to fix ut up, please check the result!

Thanks to you and Chen-Yu for working this patch set out in close cooperation.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
