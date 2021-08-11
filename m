Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73ACC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:25:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 868FD6056C
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 868FD6056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUviFBgns+Oc/y1hN1NAnXubgJWIY74+hBGIPSsLOOs=; b=PfZEEDTom+MsSW
	m4vQh6yHbhvm9J4Jj84sfl6IVdgGGoN1gd/uj0950CvkkbXOWC5ti33X7VtWKf/g4g6xnoGO9t7oB
	xu5phdhUGxqZpHHcfr9puwmphs42On7VSK6DalqQsTrSuLYgbG3Izp43DqHYK7owuka4BPDAwsMTG
	TYplIrmeEzCTpe61s+jutcnnPKuijQygU1NuNwDQ9TGgPmnUPSglKm0lVkdCOl046UCIo+4HZAkYS
	NvXZ2FG/wbizow0kal6spXqrzZ29xiglYH0NhCUzFUyKhwtn9RdJNjoeXLH7e5hE6MynNh0kPiPik
	NAzFBQKBnzv+H8UTa5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDkUR-006Hfr-AY; Wed, 11 Aug 2021 09:25:35 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDjze-0068Ea-Hz
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 08:53:52 +0000
Received: by mail-lf1-x12e.google.com with SMTP id c24so4094301lfi.11
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 01:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3AiCUWhgfaQ/Re4MVUqsQq5azIzJHgBMesbI0wlW/ZQ=;
 b=uCwmQccxrxGK0rbVI2asZmP3OKbsYKZ+DvVUn6w4vzMQO2hqr5ZpeMmShnvbBU8/Yr
 ZHrWLxRoxQX1pVuGeAJoOic61PhlPpiwESkj7USTzPr/1EAXEQxFAjqosz11DxT4FlFM
 bbrPVxhBxg2k5VgjesQQZC9WjuEXQz4y4fIV4eunpY/rKbK7wv13z32fDiOGlz5tlXtF
 lC15FlLulxhKFjSC41aMc28F/YM8Gy/fhV1LC5lcLoLFKfmLCcY97MdrfpTDMX36LDzg
 zLXli7upUMMfUBTLWPlXFZlU7rbgvECD5d3SbvaneR1in6XEIMcHGVMHFG3FuiJMk7Pa
 dHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3AiCUWhgfaQ/Re4MVUqsQq5azIzJHgBMesbI0wlW/ZQ=;
 b=rFlOm2XFGVkhlf1N2TJXH50diJY7QSdW5VQpaOtgjB1SDCcGTyllmiZQDUtE893aZg
 qxMWxq3NauQ+I/KHimwhUCfmH0DKJuTzYWAxef2Yi5wFN9N0MCCKLsrc/zJ4rHFcokSG
 GvIqYOwSOok5x6vVgIzNLfstEStMtR6yLi4DzpX5xoL7ZEUlQwox/EJI19A2rm87pkIh
 RLffE3PzhcFyQkodpEJnQVyC/qV6Xtyc+XcWHq++TMDGFwA8/0SQpJCkTSK6LFU7nMtK
 Tv1zDjcpHoAg7ldpJYxiyWW20326LLQ1YcvAstDf2FFMaNZksWPmtcg3FCGrV6T6+Bf/
 g6dQ==
X-Gm-Message-State: AOAM532fVuNeFVFiUW5xzM2ecXImzJ+ZgfoikmcgaoeFZaEhic63umA6
 RMdIfNQtOGb6E5rbpI71+apv0X3WWONqKUsSveftOQ==
X-Google-Smtp-Source: ABdhPJwiM31QODgSzneDy7YtTHVThH6UHiJzC+ra8IUt6YwIQr8jCgHTyTZ7OO09tzof0XpJJpPWGQJeaRRxwn8/QIA=
X-Received: by 2002:a05:6512:32a3:: with SMTP id
 q3mr13222195lfe.157.1628672020757; 
 Wed, 11 Aug 2021 01:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210804044033.3047296-1-hsinyi@chromium.org>
In-Reply-To: <20210804044033.3047296-1-hsinyi@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Aug 2021 10:53:29 +0200
Message-ID: <CACRpkdaC-vD2Op-ZzJY8uWQUoS8WH5UPd0FPpWYkExXDg-5biQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] arm: dts: mt8135: Move pinfunc to
 include/dt-bindings/pinctrl
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, 
 Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_015346_727228_4A715601 
X-CRM114-Status: UNSURE (   7.54  )
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

Hi Hsin-Yi, Matthias,

I have applied all three patches on this immutable branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-mt8135

Then I merged this branch into the pinctrl "devel" branch for
v5.15.

Matthias can pull the same branch into his MT SoC tree so
that the hashes will match up in the merge window. No rebasing.

The same patches will then come in to Torvalds in two ways
with the same hashes and match perfectly.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
