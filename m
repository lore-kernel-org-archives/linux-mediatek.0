Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB53C433E7
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 21:45:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31AD822241
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 21:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a5xBksbN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eY88cyY9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31AD822241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8E2PRDdjphWwUiwcJl+5qFAggQOICx+NGTZz0BBV5fs=; b=a5xBksbNaTRnB9WLeWt26MZ3u
	xbXMTGaF6PuLQtmNOtktL2hSpAegWTe8SRGZbn8JHFPLZpYo8GfMl15BM2wy0gkDtmDqeuF2f/W9y
	tJqGq4Qd78QdkPJB3qibr9dPSCnyJpDcU2AVzuMaJir1r+NSdOcj+bbmaZVn4sqTiGo78K12qoAHL
	S2SkAS44Du0bPa0tOEn7uKVOugkDVVyerrpUovpAREgzWv+rNJ2U6CpGaqHl2ornMBVgP0YVaOJd6
	RBE/NkbifDvbdmTgNfSAhZcZzZuLrBq/eTD4uxa8on+b33ddJJs9aC8zDr7fyfIiAlUhf7QHBaM6/
	wyCQ0x9fQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQdir-0007Jq-Qd; Thu, 08 Oct 2020 21:45:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQdil-0007HH-TQ; Thu, 08 Oct 2020 21:45:08 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 925F422241;
 Thu,  8 Oct 2020 21:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602193506;
 bh=RJhcp0P+BXeJqRJ4aZJB8+g7YQjpnpH8cPYey+OYl/0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=eY88cyY9oruEEJWjgpRtu1Diu5iIpoAHdowbKH9SkhvnG0EPmJoToewR1ioFsjuVk
 tR2x4/0YMIcEp9yRvVIq3jEqQIt2l2tR6nBW7IbaIE3d+I9iuXSCNov6AwwpFMlk6R
 1etsqt8xchrzkxcFHAIh2VV29EoQxwC0gdlj2YDY=
MIME-Version: 1.0
In-Reply-To: <1602124753.29177.7.camel@mtkswgap22>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
 <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
 <1599546314.24690.3.camel@mtkswgap22> <1601719607.774.1.camel@mtkswgap22>
 <160212240863.310579.5253840355657757088@swboyd.mtv.corp.google.com>
 <1602124753.29177.7.camel@mtkswgap22>
Subject: Re: [PATCH v10 3/3] clk: mediatek: add UART0 clock support
From: Stephen Boyd <sboyd@kernel.org>
To: Hanks Chen <hanks.chen@mediatek.com>
Date: Thu, 08 Oct 2020 14:45:05 -0700
Message-ID: <160219350512.310579.18205549684029464732@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_174508_051631_D180769A 
X-CRM114-Status: GOOD (  15.17  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Loda Chou <loda.chou@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 mtk01761 <wendell.lin@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Hanks Chen (2020-10-07 19:39:13)
> On Wed, 2020-10-07 at 19:00 -0700, Stephen Boyd wrote:
> > Quoting Hanks Chen (2020-10-03 03:06:47)
> > > Hi Michael & Stephen,
> > > 
> > > Please kindly let me know your comments about this patch.
> > > Thanks
> > > 
> > 
> > What's the base for this patch? I tried applying to v5.9-rc1 and it
> > didn't work.
> 
> Sorry, what does that mean?
> 
> Do you have encountered a merged conflict or run time failed?
> 
> I based on kernel-5.8-rc1 to add it and it can boot to kernel shell.
> 

Ah I see what it is. The email isn't actually plain text, it is base64
encoded and so git am gets confused by the CRLF line endings that are
encoded in there. Any chance you can send patches in actual plain text
format in the future?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
