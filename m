Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C09C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:41:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04FFC206F6
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:41:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gLPm/wTR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IL9/OsUN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04FFC206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=niEJZSLvLtcXV3rCGixBdxbcic/swL6SN1ae1EuWDkA=; b=gLPm/wTRUlC+reXlwCQDmMLzQ
	hme+gjgTLP4EVdkMraCy8wtbnrkX4DEaXlQb22jd7fAhcc4R0waXUd4Cx3/ovtzRiO9fjkAWluX20
	cqk/C5fYuR05mR14qI+M20BdnvvgH5aGnkTt3Vs8oGCJfU92PCuOLOaP5Qlcz5ukGupqrsaf9Kcwf
	D9jhvxodfngO8thkCbXHIJ6FrvBHvIg09z61UC88p/4Vtu6IiYPQEB0h56cwm23X9HlFB6pc79Obi
	J/wew/g93HXz+xkxCgSP7aYsMaUQ3oqjnP4vOVSTEkNnEkvHrJRhYnxAsM9vKy5zYt+DbS5CkfVA4
	m3ocAeHbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jslyk-00087a-Gj; Tue, 07 Jul 2020 11:41:38 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jslyi-00086h-AI
 for linux-mediatek@lists.infradead.org; Tue, 07 Jul 2020 11:41:36 +0000
Received: by mail-lf1-x144.google.com with SMTP id o4so24534915lfi.7
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2020 04:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7L/0My4Hmw0nxk/zAz7LX4pkKR6TGLRcA6CE4xPJOLM=;
 b=IL9/OsUNTSOVSExzddt4AK4CWUR/v5bZ9OfUUimh18UkjLZ40MllYFJGIB/aCN//Gi
 IO7U8JbSaPzAxcDPh7KvBZnYAiNqrhrEryPI0oYInOPF/UXH7cP1G5VbNvhqOQVFT1z1
 hadPDW9jXnUvIJJI+Pe2zao9mf6oozWnZFM/7sAYurmlmIUTC4in8iTwSGWI35ATdGpK
 dYN74HhHxd8jlOvRdiEhJ2tEiH+q8w2yXuCSDell5I+ugHXJBADKnxsluAdw4VLoju1/
 scwZVogOdt1X0Eg+J00XhrCeJl18hSU4Gyv2EUSYfrov2Aeap01RjCJ5HK0FWqDzGZld
 EYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7L/0My4Hmw0nxk/zAz7LX4pkKR6TGLRcA6CE4xPJOLM=;
 b=Uwo3gg/z3QI/akozde5jROIu1YVJIS5FTPO1TFha5pQUC3lFzwdjHuXXgjDL+pa5R6
 332M/nRXoQlZdTSahicZkaJfVdUN8dB9adGby2aTilmy+Pbv4QOE+wB+lt+XR5SS8YcH
 BWxXRhNNbooYT5llCeIjh5RtMv6IuIs6rkJx3jptNIe2UtuoUfbXItQb6/qgSTuM5NkJ
 PFSpFvYb60qhfjeZfs9RWST46Qc3AbFTaH+J28JKJywZdrSt3E/c2I7onYpTbFaFA+RP
 ZvzEOGdT8M+xhEb/c5XsHlA8A5XkvO/uXbaoSEkvtahidEtcLrk2I3/8EfrR1v0lD1vb
 BSpA==
X-Gm-Message-State: AOAM532IFpbqaChMH3QGozEdigLVUUQyNxOO48QZCi3GJCACgr8LS2lH
 Ou5Dne+Gg7+KQIguABaWIBBIAIk/k25nVjNvljf2tQ==
X-Google-Smtp-Source: ABdhPJz9qB6nG0uUcXiIt2zX4d51YOVLcslM/A8TsXvw47TLHd5sVFUK1DB4TwmcZWAd//+7rEtuzWJ593Cnx/sNKOs=
X-Received: by 2002:a19:ccd0:: with SMTP id
 c199mr32729218lfg.194.1594122095031; 
 Tue, 07 Jul 2020 04:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jul 2020 13:41:24 +0200
Message-ID: <CACRpkdY+N17VNdzidBdo-Z8rgvRGMh=576-WPULgCmmuSJyN7g@mail.gmail.com>
Subject: Re: [PATCH v7] Add basic SoC Support for Mediatek MT6779 SoC
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_074136_367412_014DBC13 
X-CRM114-Status: UNSURE (   9.03  )
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
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 2, 2020 at 2:57 PM Hanks Chen <hanks.chen@mediatek.com> wrote:

> Change since v7:
> Commit "dt-bindings: pinctrl: add bindings for MediaTek"
> -- fix typo and change order of patch
> Commit "clk: mediatek: add UART0 clock support"
> -- add fixes tag and real name
> Commit "arm64: dts: add dts nodes for MT6779"
> -- expose all three UARTs in the dtsi

Oh I see there are still development on this patch set so I took out
the patches I applied again.

Waiting for the final reviewed version.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
