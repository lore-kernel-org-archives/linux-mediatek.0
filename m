Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDCFC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 13:42:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5C2E2065D
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 13:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qI8lnR4f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W9caSxE1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5C2E2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zsBPrsOz2+f1yc8PWWIqU1BSHfhtAgCAkhhZRD8Dq2o=; b=qI8lnR4f1mHaBF61tsR7jvmb6
	+1xvy2uy4AJcAOud69dFa2uOsl08P086UN2vf/nY4WMrT9qTsw8T0Tu59uL2ONfXog1u30O32mL/o
	ivqjq1J/H2VMkG529UzndOPlCo/w7sZifDXsWLyEc/hMXCqtE9iSxB8OSZX/lvlXFvFMiQwJ+D43a
	y5NV3Hnl0ehKs3nR2VCLRnmOM6Lihx4Yp9biUMaRW3taeWQCUOXuIxg5rHPfiRyLKVXXIl5O17EQL
	OtnDjIKm9HECHkN9c33KmWmQH1/KfshBvgrVFP1vYBGnlcwouwijq5mpModCDkPI5JffxssDIZQ3q
	1HIoibzHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb20N-0006p3-Nx; Fri, 06 Nov 2020 13:42:15 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb1ys-00060p-C5
 for linux-mediatek@lists.infradead.org; Fri, 06 Nov 2020 13:40:43 +0000
Received: by mail-lf1-x142.google.com with SMTP id e27so1966925lfn.7
 for <linux-mediatek@lists.infradead.org>; Fri, 06 Nov 2020 05:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JfCJQ0jO5eraFDJbfYizUOVGWnEdmH9dyGuSSJLkvIw=;
 b=W9caSxE1LFwmaV36thpbhx25S8CmHaMDJztjs2sJYmrOs3KwLI8SmDCv/KzE1u8Kp1
 0J7/gWiX8hSRB7kFATEZR6NZS05ooJj3LxmWxh5FMqoF1IfZrnJfeq8GNvYUivZtD3he
 oZVCrBqwPhpB5NeWR9YZqcmtu+71j/NYe5UZW+8Mt2MEXlddTWqFdGdH/eQmrFczPHxJ
 FWuMhj2cD744AvRU7RDD1xhDM4jhs+OVwZhwnR2qvtDIIp6DSkGJ8I1l0fEWYfti7t2B
 tOKxCTQCnAZa/XYxdl1+oRSk/P057E0JWqYJG86FgoWxzygd6R8CKuAPgFfLCtpRvEOE
 Nonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JfCJQ0jO5eraFDJbfYizUOVGWnEdmH9dyGuSSJLkvIw=;
 b=sqFmGnwOXCr9V6nsxbklrAzIkj5n2BAN3f+BILhUkhRbgK7RziC0qWcgAM1pj7QAbZ
 WIkvv1Z9LBfbbNkXAEzpgJZQ3eeYkv29G0CwZyAERwfzhf383/Ta0GGCA54c4BsuU1fS
 d+jnohBMq1xLcMICykohsxS6VyBXWPng9/URbJdptHE16VpwHGg96kkdEmPld1JjvOuo
 9iotSjEyf0GxIhFaAi993E7MLTwpMIUoPCGL5ZYmCFHL0xsUIcAf/50Oj1a8Ogj1c5Pq
 GVPb2Ikof2GiK669gStVB/BuUiMQB+fswIsU+Nn/T3fIEewSIsBaEbFQpDek1kkYeYjF
 LnRw==
X-Gm-Message-State: AOAM530Lk+yStg2RbxLPZZQVfEWD9ot7Li1GbfOdWhWQWKeqvqVcpknb
 v5gKWsAbtawJI1KmhVG0c14bLskpfRG/nr5Oh+sGMw==
X-Google-Smtp-Source: ABdhPJwZytu/TucMs/LzjMgrHms4raPSqPz486Urbgq99iCqReLz35olpz8fmr6pdMYLedtRThpCSPblGeiM1QLNkGQ=
X-Received: by 2002:a05:6512:3225:: with SMTP id
 f5mr871293lfe.441.1604670040988; 
 Fri, 06 Nov 2020 05:40:40 -0800 (PST)
MIME-Version: 1.0
References: <20201016204019.2606-1-linux@fw-web.de>
 <20201016204019.2606-4-linux@fw-web.de>
In-Reply-To: <20201016204019.2606-4-linux@fw-web.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 6 Nov 2020 14:40:30 +0100
Message-ID: <CACRpkdbjp87VH0Jq8SCtcMs1xaaKy3P+DPzMN8J=cuDad-YSvw@mail.gmail.com>
Subject: Re: [RFC 3/3] pinctl: mt7622: drop pwm ch7 as mt7622 only has 6
 channels
To: Frank Wunderlich <linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_084042_533547_ED8405E1 
X-CRM114-Status: UNSURE (   9.34  )
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
 <devicetree@vger.kernel.org>, Frank Wunderlich <frank-w@public-files.de>,
 Sean Wang <sean.wang@kernel.org>,
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

On Fri, Oct 16, 2020 at 10:40 PM Frank Wunderlich <linux@fw-web.de> wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> mt7622 is reported by mediatek to have only 6 pwm channels
> so drop pindefines for 7th channel
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

This patch (3/3) applied to the pinctrl tree.

Please apply 1-2 to the ARM SoC tree.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
