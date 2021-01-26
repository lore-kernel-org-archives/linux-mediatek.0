Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A851C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 15:00:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D7E922D58
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 15:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D7E922D58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dAVTsh8+Jj1OMEK+jWV7+G/9gDKloX1LOMM//LAY0Iw=; b=l8Lycvvrdj2tfJbEC+Gkqd8/W
	mrjZUfuBfdMOxlBb1PytNdSrFBLW5lEpfZKTzfdLVuRwl/uYjyS7jUI2zGmziVPVjm3IMH3goxOBQ
	nWQpLmTwZ5/13+rMwZMA14fDgm69kARHoMenjo/glcaDtgaYkmcGZZ3vRVVWrwiQgUf6UCt4kDyvH
	YvfH/PAm8fBV4xv2Ek+QXA1QHW3m2RdnLLK1mJSFFbmPnr7ZvKI6NPVZiucRoVgVleqb2VPZHUUC/
	4JWLMl8XhaJ7JeSNHrn5JnaXdBjjWHR6msUqNZhgF4CU9Xd1y6QV3zgT13p7E2slRqDXzm8Xrl94M
	ZR09Cu3uA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4PpQ-0007MO-PP; Tue, 26 Jan 2021 15:00:24 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4PpN-0007LE-Qb
 for linux-mediatek@lists.infradead.org; Tue, 26 Jan 2021 15:00:22 +0000
Received: by mail-lf1-x130.google.com with SMTP id a8so23101719lfi.8
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Jan 2021 07:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oou4JBBLNg89AoflcEwukaUQeMGozONrAI+ykd68abc=;
 b=CMa6kBvpR7r2i7zpxtIhNACZ2ViuaRO16BBxLI8B05cp9KOHqdEStU7xvCXZWY74SX
 9lqFxZaRm4aqr+c9UZoLdzO0SOMIUuiYyxAeIJJGdPM/fiZR4aDiStE89i/QvkPTJ04r
 UajsbqVlBJyRziIRZGuKOojtOnzJ5Q4KD2yRDbzkXpaQtXrh1M9quvjUl/9uy5spVVb5
 GO92t8QxJaHe3M7H82gYGbZA9hX7M29967sScvq3sc6d0cfSQmE9sZiJQiLeevmZHPqx
 RurYYDJ0RzvHiUwdCy41fLjd6IqcaiDE2XMbg2avVyrkBgog0Qghh8I/VRVS9XJ7SVPY
 wkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oou4JBBLNg89AoflcEwukaUQeMGozONrAI+ykd68abc=;
 b=XfSyeMEYWUewGhlDFQ5mp12dqVJc7hTZ2hXUxFsYG8fq21wCwpjj0UxCoIBpqYONUc
 gVBlqAuTcLLHKiJnqRjoJH4bXFpjbDoTp9xHL3hntxpKWxKHrpBhWytAhI9LjEyRsLLM
 WIn7pSx/IUS0njcuqeF0/mB6PFBDh9sxQ/+7yo94Zzm4G3hz4/xbJ9HnJiLRarAnSKBV
 Q8G3xedANfkLGtGc9u/1YXWMsqIJXtzefKieXmFxUziEm7nKkMsRp7tM+MM5lH5avlhN
 mpsn1BVr1rjUMzYTR6tP48xAKzfGmmQvCvW1udHKrmFYCT6edOMBERYCjWbUivaQ/b+M
 EYJw==
X-Gm-Message-State: AOAM5314IBAZp10NjnAxCNQn26rdkoz5eI3HkuGEBp4PJ9Qmld7D+OOK
 U6bwAHZS/bWRrs2iB8iqY7ZN3REcKu1JXppjfU2rjA==
X-Google-Smtp-Source: ABdhPJzrV9fkzjpZBwQ0mQ9Fy53MLqpTRDv/TPUMKddMWfeRpgkK8NEwID8Bpzlme642rYr1YhFm4FNjevHCdUpgQwY=
X-Received: by 2002:ac2:4285:: with SMTP id m5mr2664496lfh.649.1611673219946; 
 Tue, 26 Jan 2021 07:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20210126132531.2084711-1-robert.foss@linaro.org>
 <20210126132531.2084711-2-robert.foss@linaro.org>
In-Reply-To: <20210126132531.2084711-2-robert.foss@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Jan 2021 16:00:09 +0100
Message-ID: <CACRpkda4pChqJoR-RH_QGMq0NBgyWFsyhzQHthFWPZkm62qC8A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: mediatek: mt8192: Fix
 dt_binding_check warning
To: Robert Foss <robert.foss@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_100021_885900_0D41AD44 
X-CRM114-Status: UNSURE (   8.15  )
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, jiaxin.yu@mediatek.com,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 shane.chien@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 26, 2021 at 2:26 PM Robert Foss <robert.foss@linaro.org> wrote:

> Silence indentation level warning reported by dt_binding_check in
> order to reduce noise during routine checks.
>
> $ make dt_binding_check
> mt8192-mt6359-rt1015-rt5682.yaml:10:4: [warning] wrong indentation:
> expected 2 but found 3 (indentation)
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>

Patch applied!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
