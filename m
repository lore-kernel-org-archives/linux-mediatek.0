Return-Path: <SRS0=wYRt=DE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E0AC4346E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 09:21:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB3C02389F
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 09:21:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E5t8HRAn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vzil5VrF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB3C02389F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e3La5Mq1ZsK846DHFCI5zoePk7EKdP7fp4asSjY55wc=; b=E5t8HRAnl39T5FhNGVQ1hScud
	xSeQnrPxS5OoP2E+1rfgjzr0qxZFOPn3sVTpTQwHHvARPJR2u9knzg7Db21LjLm7XrOAG/YvSiod2
	nJrMGFuUo60BxvrXCrn1BcDAz+ZS/Igp5jT+0Pb1QtH5EBlCAovUOJIXqRkCCZ2YF76iywXzWGdbJ
	+bCNFEROAQdWtkkbc81tYWKCNYFF9de6RrPX6f1QbQpL2RWHjEOtkpKhF/mqdGk2oc8Fn4GlifEc5
	5uixMKZhbKTslBgOjHx2Tx4ZOThFm6lL5G7b6hfB2Uo8+6DCui25wWpW5sUhvTSLJonZG/TkxvCKr
	zlmHTJtNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMSsJ-0004W2-Jh; Sun, 27 Sep 2020 09:21:43 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMSsH-0004Ug-6T
 for linux-mediatek@lists.infradead.org; Sun, 27 Sep 2020 09:21:42 +0000
Received: by mail-lj1-x243.google.com with SMTP id u4so5861344ljd.10
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2020 02:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PGGQySYw8x5K8mtOeM1SZ1tR4LeJUkuWrFy4NhZyY/w=;
 b=vzil5VrFY34NJoONQtPL/nYELXxhPOtPYRZqIQS6TjdYqGIBl+564t4RHy322T73df
 xb+Hm2TrtAGryotAam/5POHXsd3Wp2r6xmMTGo2YNVFpNAGObylnM6k7KBKKnrIgJqdw
 3L39CaUnFY7fADktI+0fGUD3gYlQg8yN4+p1m1MkgeqFJ0Q9DEzK6PBN/5QZnCxnsok4
 Dy5w5nDPkqoeYuOLE00dJ9UDBzFRyUA4sEeD4vUroneXPajV8vMg3X767XPQV+YHzi+P
 ZO/YHmUzvZs/5O7fwebLYz/wMJiWKT6dWTgKj/Q2hFJzlMqVk8KHtGD24y/NmgL3RtmY
 gwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PGGQySYw8x5K8mtOeM1SZ1tR4LeJUkuWrFy4NhZyY/w=;
 b=Hlnod5poOPg/zd4nxmlIZ1TfvcmYDf+aATh9Lgyv0LTNTJfczpoLqZ2Wf6DKpxLF+H
 jUZe2Xa3t9b9JQMEP3UcuiifYmAsrlMJ3CmiJ3Pp8zyLiUW9jqC7Y/KoR8kUjktGeOHP
 +zu4aHYwekAwNKie8c41Kxj8FusXMuZVK2n8x0ZiRxWRjVkohb7JZcpOYClqNj6a1W24
 WNKKSBIHnr2qoYdzacJPlPODAMnm8Qzj1fwBfIbWgxv1BIpkEVeLD49t0tWpQ9HPlOMq
 dDLTEDaDkIbOI4UApKichNyaLSkGCPO9+y56qeCpQDqeUPwKQD35FZ70zkHxJb5MFfEI
 WOqA==
X-Gm-Message-State: AOAM532h886xePTMvmqbmV+tcTtLxfPG6sgVj9vaKocPLHXkOAe3I+Ug
 ASUvuEXcIBMT/QAd3XN77ITKtmMrryDr8tH8MG0ocA==
X-Google-Smtp-Source: ABdhPJzmJTMesMo36KW0yIQlJE605hbQVVOGBYNhbkPK1+4Pe0bOs0mJvDBCOCh5tMojSqrcInaLr7oEFgooll9kBPQ=
X-Received: by 2002:a05:651c:107b:: with SMTP id
 y27mr3197494ljm.338.1601198500091; 
 Sun, 27 Sep 2020 02:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200907110221.1691168-1-fparent@baylibre.com>
 <20200907110221.1691168-2-fparent@baylibre.com>
In-Reply-To: <20200907110221.1691168-2-fparent@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 27 Sep 2020 11:21:29 +0200
Message-ID: <CACRpkdYXHzrp0-4nhQnJHdhEpzkdSEn8+8AJnmFJhrvu8=Sbuw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Add MT8167 Pinctrl driver
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_052141_303445_79803B18 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 7, 2020 at 1:02 PM Fabien Parent <fparent@baylibre.com> wrote:

> This commit adds the pinctrl driver for the MediaTek's MT8167 SoC.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

No reaction from maintainers for 20 days so patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
