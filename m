Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80445C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 23:31:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E89D20786
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 23:31:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BzcgWB4u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kLZPFNza"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E89D20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7xyXKABT+P7xLgtTUa2WAcacqm+OLEa+aJg7s1ODcJY=; b=BzcgWB4uUd83bTEg9Q9zVVmh+
	85D9WVVUET73LcDqzYMJCzPnJRYKmjXY5sno2VTa80ThkNFpDLCYiaP2N6ITGs3Ul01Uxl6oM+lmS
	L5XpA6y4EDkNJp1FoipaHRPfJv8eP76CAUAYcWO52C4D9Yv4FdJAznMF81OKarhjXEeB1AzE3qjtP
	SZi5rCDMhkcukTukRzkbmPQiB3peBSB3MeAAZWPQKzZ0rZ190H9gaiQp84rKYLwqo6XSij6G3wVi6
	IdHv4JMQf5nfrWWW9noCJ1Ig8QljKwuZZNbWnzLLxyiQzt03RT0EGxL/7soVZKBJEV6GbHZKtftzl
	euslUJKhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2jvQ-0002wu-FJ; Mon, 03 Aug 2020 23:31:25 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2jvN-0002vn-5Y
 for linux-mediatek@lists.infradead.org; Mon, 03 Aug 2020 23:31:22 +0000
Received: by mail-lf1-x144.google.com with SMTP id x24so4038700lfe.11
 for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2020 16:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fV01at6U179YYTkypCe1mjYEuoEGSoyCBx3vei1jsL8=;
 b=kLZPFNzaiLoIf37Ocp6yoJdmJakN2FAOgin1yWPmvyiqcRGfvkDyLIJwgFnR7SibjW
 eDY6+V7iRkT7GmQRC7Mtk5KyBDTfuD4CL/PYuTQzAyQQrWqL/YynpbMpKEODLM1f/W4J
 tTGBCULVUmvrDKbcEgpiT565Jo4ros0QWA0bYpY6RJDKjOiSUgsq1W+8rhBSuZCNVWm5
 ZvesqRzD3GSrQDRSgUP2N6M9Y3PZtprj4rkT3HM4EbsoGyagbd2z8n5C7uB4Afu2c6nU
 sWyQBZzktZkb9o84466l36KfybPylh8PrYGMkgKxsqc6rvL/aU1nDW78+MUAsnA8ldTx
 tOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fV01at6U179YYTkypCe1mjYEuoEGSoyCBx3vei1jsL8=;
 b=C3id/LIjbJyqYGS8KxMUSun4mAWYqlVdwWA3euaK1k/wDOatkzp7zSgAXLa/wMuj1R
 LVnl7nmN09UhQFQyt5nRx/p7X4H8uP9AcUzqlMpu0ANTdthseOgzyBD0b8mdHEhSsRWQ
 3JbQjnjnoIMxEP0w0PcJ/HplwK0wgdKfOu6LhYYhDWNv/TC78plgH+EHiPoIIuzqMuQJ
 hf1m4Zw0alcVwTQegkBwDCpr+ehWtItbbduKykxpd8r7OblXg/s2cNeZMdcf/hiXUfYk
 g1Ws9A2LR9Go3oAC5ZggecRSctdz1++/OIBECL1ffuCKkz4dkmrY06+CqhOeEBhve7rA
 9TtQ==
X-Gm-Message-State: AOAM532h1WbaO4WuFvXoP4dSkARyIHBA1Unk2rK2AZKo9gCMjUtm5zxH
 JH7w27HMzyBRQw/6sHtucrMAsVCcbty9SnrM2r2Zew==
X-Google-Smtp-Source: ABdhPJxWx+hfDk0lqptunggKbQMSvFYj4Ku0H41x8vXU6S8/mAV1QIwpU4LOkgKmpf8w7QdtsdTt1LUVSEoJbOHVisk=
X-Received: by 2002:ac2:5e26:: with SMTP id o6mr9486395lfg.194.1596497479493; 
 Mon, 03 Aug 2020 16:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
 <1596115816-11758-2-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1596115816-11758-2-git-send-email-hanks.chen@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Aug 2020 01:31:08 +0200
Message-ID: <CACRpkdYP1EGemHtqO_vrUf-wUyimAs=tXM5WNBD-NcL-h15ZhQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_193122_114226_338C9539 
X-CRM114-Status: UNSURE (   9.46  )
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
 <devicetree@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 YueHaibing <yuehaibing@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Loda Chou <loda.chou@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 mtk01761 <wendell.lin@mediatek.com>, linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 30, 2020 at 3:30 PM Hanks Chen <hanks.chen@mediatek.com> wrote:

> From: Andy Teng <andy.teng@mediatek.com>
>
> Add devicetree bindings for MediaTek MT6779 pinctrl driver.
>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>

I pulled out the v9 version of this patch and applied v10 instead.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
