Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93FAC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:39:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA7A6206F6
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:39:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T0Y2mBwx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NYzj/o6y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA7A6206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=97Id67FkrylRM/ySDUCRieHKfcv0zT0u81q+1QVxc7I=; b=T0Y2mBwxm8/tpjq/NO7sRaQm/
	cNi6Gpdqx21Wa/5V7q7Xgd/O84DNBvN6SayM8n0MG1N215zrkVI04pVRhrRdd6diWwooWbbjIkl7g
	upwaenxYOT0q98M36VaettwI24aJIVumzf5/qvmVwRyj0ra1gvQyke6hrqfEMTzsg1/duSAG/Wp/C
	Hnk6pWs3HID+I1gbO+mAJ7HdY7VWRoQ+1sPz2mOgNkyOb1SB3OuVidqnzhObA+nZh7STZThLbO1vM
	7gfJ70FEwjqxLdREd2DfeNSK4TEkeDOWKXFuVHTKX9dCEaa3pNm6p6YqcZLivgZWei0CYyvuoe3V8
	25JjtSs1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jslwe-0007aI-Oj; Tue, 07 Jul 2020 11:39:28 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jslwb-0007Z8-Ck
 for linux-mediatek@lists.infradead.org; Tue, 07 Jul 2020 11:39:26 +0000
Received: by mail-lj1-x241.google.com with SMTP id j11so754917ljo.7
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2020 04:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AB79oSGoei4/jVAVNUIel30W4YNtDlT0qF8qJNgQrv8=;
 b=NYzj/o6y2s9Z+eCQgmRYfSgsgU7i2HsuCMcPIod16JgB0/R/Bp8K5TCpEG+jy+bcgs
 ZeWixYF2ok3de8HvQOPk2q8rgIBZzWFC0mNPOVLWT6rbSD+GQswrYk/COzA1BzWJTS0y
 drlNb9cBsjk6f3wweib0e8CQxPQBi+sIlqBDP8H9T9s4aZi38GCvzy1ivpwPO1RFCqDw
 TjSHlhqypVPuC7Pb0P50dC7mEjFGIXvCXjSG/GQxWvFPcZ++jU5mQN6Ide3Q+e/v2VlF
 reom+VCXprUs4I5+pCDFnZNjMgq7tRgBCHRMqtD75VEibK88tGJtAMoDnCZipsfMypao
 zqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AB79oSGoei4/jVAVNUIel30W4YNtDlT0qF8qJNgQrv8=;
 b=qioI+iCQzhxuJACzP5lwzDoBLbD/TolTLqoinZAOsPEFrHfDqPyrRLktBveCVTl/ZU
 Hhbm7kZQeG9LRSNp1mZi0wf9UDBSG2DpnS00NicrR9fUBDAEfpo3FTob1WPy8fvZOOzf
 BfMF5U1S0DrqUEQI2sVejyCgckmkE10Eg+aJQaEdkxqsWifnsYL9/MnLbr+brkR91cZR
 xBuslFKYfOJEuMC95fOIT5OgriRr+eB2nbcYP3GxcIBy+oj19aYxLxW5y1rL/2Qi2jjB
 gRwkPsAzicpfT4ljho9MlDqjnBJvSOfgGPLS7+GPNfrCY/yawaLQHTv+/e0Tt/GDJnma
 +0ww==
X-Gm-Message-State: AOAM532l068rpFEH81JXmkxt8T89rsDiW7OyWGwy8tbpZwYxa7+8tJax
 5IOzz4HBmbTxDQgnlCpaz9mroMfT88WfOrAgE8S7+Q==
X-Google-Smtp-Source: ABdhPJzaNV7qDX5ofVny2CYGichkvvyZwwCuYiY/DXFU9tcXKWyULk7QdWCDcj7Zwb2TtLbaWFduqFOHtHKtVZ06ol4=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr15946172ljg.100.1594121963989; 
 Tue, 07 Jul 2020 04:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
 <1592480018-3340-3-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1592480018-3340-3-git-send-email-hanks.chen@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jul 2020 13:39:13 +0200
Message-ID: <CACRpkdZAjwcHURd6wCQPrjHjEgiEiUApqVUff+70nwjRPyAwBw@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] pinctrl: mediatek: update pinmux definitions for
 mt6779
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_073925_457830_75F3962E 
X-CRM114-Status: UNSURE (   5.73  )
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
 wsd_upstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
 Loda Chou <loda.chou@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mars Cheng <mars.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 18, 2020 at 1:34 PM Hanks Chen <hanks.chen@mediatek.com> wrote:

> Add devicetree bindings for Mediatek mt6779 SoC Pin Controller.
>
> Acked-by: Sean Wang <sean.wang@kernel.org>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
