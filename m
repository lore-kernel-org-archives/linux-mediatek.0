Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452EAC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 07:30:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12D8B20758
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 07:30:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GfhzXwXu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="vKwc0hm9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12D8B20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LdNPY5RMvDh1F1+11MQLSLnXq8va8Gnwp24AwL3PCa0=; b=GfhzXwXurgrLM+huaE/LgndWh
	tSy2TczxulP3VFn20JV6y3eghciznhmbI3MU2K8+CO3M9I+FKcccZmliDZSAKJqI7F4KKy6D0MTVV
	Zi+SmnNbMNQJFLEJ05FR7fFtOBfbjCYzb93WEMHyD2fClwlQGr9CyzgElNRwkKyzRD/r6Ga3tYeAP
	eRbp7VZyNaniEWGOUwEqjcZkpbx4azJ3M0II/lMejUI2de3YX6KvZ/w7modlhHRCxkFyGfpUoLH0s
	ZPNPcXpF83SORDdDF6AhTrcrEHxNNpKLnd9+FlKtOPavlj4DBfmj6iJt/8l9fEMe4A9WFW7rEEOz0
	lASBcHWTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7Zax-0002k0-AG; Mon, 17 Aug 2020 07:30:15 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7Zas-0002ig-UQ
 for linux-mediatek@lists.infradead.org; Mon, 17 Aug 2020 07:30:11 +0000
Received: by mail-io1-xd42.google.com with SMTP id a5so16570851ioa.13
 for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2020 00:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=njImXme8DvFmBmmBNjNQkbOdGSjHzwAWepRldmmnkFM=;
 b=vKwc0hm9KMhrs8R9lVS1+IPdDcR9wpOy8T7gFNt5q2QV3lOt6h/3fdoj6kEeqgp8aN
 58J0ceAUIVAOo+etWCr23cZzpX2S1j9MNwnY2cgfEKSU1kQgW1rb8mNawPAJL4/yX8ZI
 A5l3InaUTt8Trss2ZBvCyyKe76g9Y+vpkC+ac9yxPdy1RJID9vGjFt1o4WVpv4/HgNRz
 v+y4X8vu2FtjiwjaZ6h6atRbrGngkkDptjZXg2LM6devwJofRgz9k/zfdmL3Zb/cUQ1p
 dJzOX7GPWZLtp6FaHawv72tIIjSDJC/DtTRUeuECn9u3bcdSoOORu29S0KVlBclwYQUy
 tRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=njImXme8DvFmBmmBNjNQkbOdGSjHzwAWepRldmmnkFM=;
 b=T9kNOLyvnrv2wJylNtfdsh0sXQXin8jD92mY/az9ZunFDb1WnuxdusRaeppEUiLNEy
 C54omPkaGWBBQ1/Uzy0wl2W7W5i2Tgd8xB0pfQoawNbBqXu/sS2z4H+WzmMzkeEsS2H+
 g+W95vMLxvPkIiqss+bb1WxfFEBgdh7+zdfN+0halhizrR+J3mD8WW0LsVTwsOCbpIXR
 Tr/3dul2f+yyNOJCkj5OX/f6uSpp+VkU5FKOYCF7pkquwoPW12bqQ/d1+swD12/LC9P6
 J+nvuO/KpoVjw5wdncJ2N5QIsN0rsqtlmhg+F4ZOSS/iwriP4SnHINMFvYBGFO2ONVtJ
 mW0g==
X-Gm-Message-State: AOAM532zHW/XPWXDT/QWE7X3bBRskT0LyFE0EGFCrRpfIt1J5D83qv0C
 KKxkPHoKrW3glpT0qRe9gIh2EoZhvLi1tfVUwuyT6Q==
X-Google-Smtp-Source: ABdhPJwCa0E+vAfxwNpCUTPIUSspheXu7A+kHNdN+DzANKgmK0a/mh8mC9JzSsxmyLAcqGudRpVCGbTB72ZlRdctp5Y=
X-Received: by 2002:a05:6638:2515:: with SMTP id
 v21mr13267320jat.109.1597649408741; 
 Mon, 17 Aug 2020 00:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597644455-8216-3-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1597644455-8216-3-git-send-email-jiaxin.yu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Aug 2020 15:29:57 +0800
Message-ID: <CA+Px+wXSbGLb+AZnF8ETRycRUVjqk4xacm5DH6MzuMw0vh6Wzg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: mediatek: mt6359: add codec document
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_033011_314995_84ABFA43 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, bicycle.tsai@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 17, 2020 at 2:08 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
> +properties:
> +  compatible:
> +    const: mediatek,mt6359-sound

The compatible string has been removed since v3.

> +required:
> +  - compatible

The same here.

> +examples:
> +  - |
> +    mt6359codec: mt6359codec {
> +      compatible = "mediatek,mt6359-sound";

And the same here.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
