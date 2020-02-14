Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2EDC2BA83
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 07:35:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82B3222314
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 07:35:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DowR9YYl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="UZ6fDAw4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82B3222314
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNsI2i3+1KST1iew6XyZJtOgeaC+fYfKfpV0d8vIoXA=; b=DowR9YYl/gZATB
	SCfBpkgh7nkmOfgX4earIHXkS6vF0lw8/4mbrG27N5HurLtPxT1Tz9rbN2Q1T8ZRPJWGhN+JwnCDi
	FQj8MA+OPsq/DwfDP18lZU3fTj5tJ7/d9hVqqUSBYcBJCWG+ud9ZkDFhV6z6T1D2/8uJRxjoPNCKC
	iFAq15cXQLP9DjgTuMgfhlqp7TIlU26LSP0Eo9LaV7pPA2UACw+QGx1lmCOXOTaJ7P01BoakYiTvM
	BNVJo6x+7nOhA9pHyVu+keN4Ul2m4bHFUVExIBLNFJocCG7YFcIT2ykX/md4SXxGypITEPpUaTZCp
	vZGTVIrEaIE1toKCTfFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2VVk-0007Z1-LQ; Fri, 14 Feb 2020 07:35:40 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2VVa-0007Qx-BR
 for linux-mediatek@lists.infradead.org; Fri, 14 Feb 2020 07:35:31 +0000
Received: by mail-il1-x144.google.com with SMTP id v13so7288729iln.4
 for <linux-mediatek@lists.infradead.org>; Thu, 13 Feb 2020 23:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I1eG2NiwnMHcD+8ZEBk/TQZkr1ocwevoK5Q1stsGPh0=;
 b=UZ6fDAw4oN8KlRZPMnBhJd0Ev8dZAqA7G1U4REXYuJiWgp0PEusoKpzvbadHqnAz/M
 KuGdLZbhYZ1znnKIXK1Dvcdh+8gFSkQq1PS3X2WfvZ/h91VHULyySwO0TTPA/H4LgRxR
 KiY61A4PCh63xBcYTtdEEow9lR9sIb0KkJ1E4V7ei5bxq4/XqhxVv1ZftYgq8/Zgb/rt
 ZH/X8w3p0MKGOrspJqJm4+U+8EBBU7ghgaJkhkORbSfzHDTqMxihRLzWwt2y4YrjlvDk
 l9myA1r5rLq84wDBjMMRPmYwWrpLwKsCG5Udq8zQeW1I5ivieU3AxYA805kVSpDOu3S/
 Yfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I1eG2NiwnMHcD+8ZEBk/TQZkr1ocwevoK5Q1stsGPh0=;
 b=EsxbQrjP3D+ybLQgySbwQ9s50f4ntbrjp6xbth8cuPnS9YRHLGeqTmS+cEtDvFNCrp
 HnQZJpWbbcGg71G33BCIiJHe3AycWHUghBUqEJqS2EmBJFzowShb3U5k/eHm3gSJ+2u3
 dnuyLGVe4bwWQmzdmj/AJsMny3eyDKySGuw3YwSMzUo2S8Ghf1MEISX0cEfbkC52m4cv
 tk9MGM1EzpQJOhm9fCgvIqKK0zaQjHeV9TDPfURtuVVpmgmGVsPqBIwf0pvZ1qjNztjl
 s12BuDYNTyw9zLUYcADJIJSMB2k82P89U21TVhwZyMI/iiIaEzI+COMeRWYsOZKA0M/k
 w9rA==
X-Gm-Message-State: APjAAAWqpk0sWbFrnX9Amjy/7iGEqSoBu1OKrhrpCwwtyoKiZ4Zoj9nd
 8of7rgUm5z4xwDKhDdXR7hd2/LwkPsCuU5zwYvNvXQ==
X-Google-Smtp-Source: APXvYqzd5x9vUof79ss9P8ZSwc9sQuJX+BQLK7R4MtTtWZfQ+G1G0z3XtZitNmw0tqejxBn+XcigB+3jeNXBx5X/tnM=
X-Received: by 2002:a92:9c52:: with SMTP id h79mr1618052ili.213.1581665726341; 
 Thu, 13 Feb 2020 23:35:26 -0800 (PST)
MIME-Version: 1.0
References: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
 <1581664042.20487.4.camel@mtksdaap41>
In-Reply-To: <1581664042.20487.4.camel@mtksdaap41>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 14 Feb 2020 15:35:15 +0800
Message-ID: <CA+Px+wW0BWz0-8L_UXJ-OYbwG6W9vmCWRr7kevpk0yokp+NKKg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: fix race condition for HDMI jack status
 reporting
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_233530_417723_B1A7542D 
X-CRM114-Status: UNSURE (   6.23  )
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
Cc: ALSA development <alsa-devel@alsa-project.org>, p.zabel@pengutronix.de,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Dylan Reid <dgreid@google.com>, linux-arm-kernel@lists.infradead.org,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 14, 2020 at 3:07 PM CK Hu <ck.hu@mediatek.com> wrote:
> I think sound driver could be removed for some reason, and fn should be
> set to NULL before sound driver removed. In this case, codec_dev != NULL
> and fn == NULL.

No..if you see sound/soc/codecs/hdmi-codec.c, plugged_cb is statically
allocated.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
