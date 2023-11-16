Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2557EC47071
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 03:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVLnet6UeJJKAgG9HzM7O27P98+CfXEuM0uNw2AJ9I4=; b=IcD2zSRV3RFpvAoYQDqTyS6iiV
	MavG89qV3TmFYqrIC0lBsKkx+5x2XZkwjUIEA8/X9dpxM5bDXbkId/AfNePO6BlTvouCDgMcY7zx0
	GkWuKf6VxNPfMeUe9myfTWDPQ2GfpzK63yfkC+N+aVqKaR20iLgTa+4xEF7ZE0pXXty6zsSjtsUsi
	IGBSN4+HI8lIvcJI20Yf8KQ14wGZZbZ07q0+fu6B1JUKTlw6/sjnVyHCju0SwmwhCm3OGE39NrARh
	JjfsifMg5JF4kWnWKM2t6jgZRD3Ue5WZ3VK9gLXmF55t8UnuHcfzuydb3tnznZNthrORekLvaLAXZ
	b6t2MApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3TOp-002L9W-09;
	Thu, 16 Nov 2023 03:50:39 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3TOl-002L8K-2P
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Nov 2023 03:50:37 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5098e423ba2so494637e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 19:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700106632; x=1700711432; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVLnet6UeJJKAgG9HzM7O27P98+CfXEuM0uNw2AJ9I4=;
        b=Ss1ivoVtkMaGeAuG4UE+jMq2RtEaL7LyHu5p0gHYEa/BQLlY/RSWla5xxQ36oY7Gz4
         6j1emMjmbdv9gSPoq08PbsdeO8I/5s+RLa2j3DPmGTQtZPC2wNGTWr+RvsItS6IoZkwE
         gjAC9CfmIOo5c8ursd1JNHd3M2J73PhsGWmVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700106632; x=1700711432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVLnet6UeJJKAgG9HzM7O27P98+CfXEuM0uNw2AJ9I4=;
        b=pO1OOgQ1hg4CNDNdMyaE+fxY7MNb9H6VQAezrP/9tsytityKkPtFSxfWAbk89V4MaN
         SyHOXdPBfG+lUzl+7Gi4nE87nBtx7gN6sZb2txxQju470g191ZqJ/D+v48u4LNwhyAcW
         +7KrVdeLNZrVGK2sCcup6LgdUwP5/xr6LpMxfY269DziVeAmCW34hbp6ABHbYBxjfHqY
         VruUDDIAPa31t8AhjAYaz1AWxp62vZYmlsFdhI/D6ILyO2UzjpZ0hl1J1mHWAoiq07a6
         GTwmWJYrqeF1Yo0emKvIw0x0aVDajGVsEV0qNAlpnZisX4+djhDS/uqWuUhq3pBhlPrX
         /l1Q==
X-Gm-Message-State: AOJu0YzIh4v42uvuFNINf688BLNyHDiBhlCIPgWwTkwbSyUKknUUTNMS
	3qw9aQrlD1O1dEnxIsXDAozalaf5BMGwuafu29I0Tw==
X-Google-Smtp-Source: AGHT+IG/HPn5kbZcT3Q0iuyPk7qJavc3LozqD5Z4W7c9maxr4cL7n62LD0Sl69ivAeU3gezgeKzgoerfVPGQMrrf94Y=
X-Received: by 2002:a05:6512:684:b0:509:4439:9b57 with SMTP id
 t4-20020a056512068400b0050944399b57mr1030248lfe.38.1700106632004; Wed, 15 Nov
 2023 19:50:32 -0800 (PST)
MIME-Version: 1.0
References: <CAKpemQKo2gigO44amj=eFUXgUnUeSmiOoTbS8GdXMx3O07N1vg@mail.gmail.com>
 <638afac6-0d2f-4bb1-8101-b58fdc03e303@sirena.org.uk>
In-Reply-To: <638afac6-0d2f-4bb1-8101-b58fdc03e303@sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Nov 2023 11:50:20 +0800
Message-ID: <CAGXv+5GHSK7nAagZ3iuSvcfbjFHJ1F+OYUr8KmaPbp6RyCgUhg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] regulator: mt6358: Add output voltage fine tuning
 to variable LDOs
To: Mark Brown <broonie@kernel.org>
Cc: Bret Joseph <bretjoseph@gmail.com>, angelogioacchino.delregno@collabora.com, 
	matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, 
	zhiyong.tao@mediatek.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_195035_807555_49DD7AD9 
X-CRM114-Status: UNSURE (   9.58  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 16, 2023 at 4:15=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Nov 15, 2023 at 06:52:12PM +0200, Bret Joseph wrote:
> > *In mt6358-regulator.c*
>
> I only have patch 3/3 from this series, what's going on with
> dependencies and so on?

You already applied the series in September and the changes are already in
v6.7-rc1.

I'll take a look at the report by Bret.

ChenYu

