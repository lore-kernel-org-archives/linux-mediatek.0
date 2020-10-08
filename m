Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB9CC4363D
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 02:00:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76175207C3
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 02:00:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UNOOeXDR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lojukMi8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76175207C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Se73MwPx7/+ZYpxGjl+yLU2vgio7eq3pFtAEAcfyJNc=; b=UNOOeXDRKjnXgRBcGxyEr31dE
	HfpUBAZrDKRN2bf+D6/v9YCGlIimNIVYlX4itgv2BwPXqCEGD21Ec3s1hvbp+g4kkv9Ov+/RWHF1u
	JDTe1o1E2FELrHNyAzgNAzDT60qeU2znnwN3/RowPKAQ4rBWO0DP0pUIailQZFcpzmTnynLM7stT4
	4YxKbKqi/OXnZmTa9xE4c6rrBRKWRLo9Ef5i7OROBc9yJ3avKNzLwI8HYDT9D7QESiRxXwUHQGIbl
	czuekOkq/Z5T3jWWRRyN2Fuv3NAVSIM0YlMj1/Re+yMtjMssZ8iNsXjaFAmrtgLgZr2T66vWsQegR
	VA37EL6/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQLE7-000694-89; Thu, 08 Oct 2020 02:00:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQLE3-00068T-FV; Thu, 08 Oct 2020 02:00:12 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 106A5207C3;
 Thu,  8 Oct 2020 02:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602122410;
 bh=wyBO4zvjEjDcbx6nOHG1RJNNWIaPg0x7TNYULJRlR6Y=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=lojukMi8qd73ZjRWlJfe4shDOCavAlS2irrvtYg9a7bFgxx0405b5a+p0BNBiIyPG
 23BFJG6rabPwBbMOCSgfPq2NI9wiSvs5JtYuoeQYH0RT925UM9P9P8WV/OoPtwEvc4
 UQNgGBK9QBtOkvUDfWr1oyopSAuTbflq2dgX0sdU=
MIME-Version: 1.0
In-Reply-To: <1601719607.774.1.camel@mtkswgap22>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
 <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
 <1599546314.24690.3.camel@mtkswgap22> <1601719607.774.1.camel@mtkswgap22>
Subject: Re: [PATCH v10 3/3] clk: mediatek: add UART0 clock support
From: Stephen Boyd <sboyd@kernel.org>
To: Hanks Chen <hanks.chen@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed, 07 Oct 2020 19:00:08 -0700
Message-ID: <160212240863.310579.5253840355657757088@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_220011_602937_CF79D160 
X-CRM114-Status: UNSURE (   8.98  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 Andy Teng <andy.teng@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Loda Chou <loda.chou@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Hanks Chen (2020-10-03 03:06:47)
> Hi Michael & Stephen,
> 
> Please kindly let me know your comments about this patch.
> Thanks
> 

What's the base for this patch? I tried applying to v5.9-rc1 and it
didn't work.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
