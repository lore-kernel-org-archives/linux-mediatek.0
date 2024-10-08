Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6992CEF17D
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 14:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9oq3jezHlQMT6rg1nSIemrSZ1OTMBtx54B/fq7slMk=; b=K4KPohk2ptYBgrygZSyPHrJ2jx
	ZZ+qimJKoEpQJEuNeFbh1exaqHrdmwv0SRycZc15P9sdjY73NdLb3bz+VBbzLW5RNyPb7rjmLPpC3
	PowtV+DgHedfuD6WOA3DwOjYmcPGO5m2HXcFsD2d3EzG/NuuBRhHKFSOD9Lt8gGFPKokqptar7+Wu
	a98fEZqTo4i/tljSTpnTQ7mqjQh1+LKvP3iXkRNCsFM4pjslLiGh9YOpZeLdOCBq1WmOrI3g9dH3m
	Mk+2RWvEQNHlXwjve5VVLejd2O9reM5cGiTY27YQc3n1u5c8iwAcGJaxtcgVspR6DupoMlZ8l6nSa
	ljBLit1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syBOr-00000006DF6-2kJ4;
	Tue, 08 Oct 2024 14:41:21 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syBKb-00000006Bzo-1XBb
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 14:36:59 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e28f2a52803so569775276.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Oct 2024 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728398215; x=1729003015; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N9oq3jezHlQMT6rg1nSIemrSZ1OTMBtx54B/fq7slMk=;
        b=ZZshzoJjDzWcunQJqzGVr49IPDMbx60xFpD5vv0ezfVjcktsmM29je896l2yrjtXM8
         ie6PJa+pDHRFAOiqSe6DPmgtzPCZJebxfm+JlX1V/jsNuNt57BCrAgBcIzSZjEL739S/
         e3bsa4XFK334vu3PMJSWjXMGr/upPxfoXt2deu4AeM6wHHW0DPU0lPjG9V2nN4h8l924
         Y0rIkmmg1gIVKkiVHh+Y2CTArKASrqdG2yepH2hoTP9WnSGa7HwUO7yEZVesk1ikeOWn
         xWY3L2uTWLQyiJzqLvx3p8hZH7OUIeFboLWPw8U7A4QLwdIXTWMCE6szOMVRMBZHfJDu
         5PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398215; x=1729003015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9oq3jezHlQMT6rg1nSIemrSZ1OTMBtx54B/fq7slMk=;
        b=tRsAow1JK03q23a9BR8PgmxQF6CJlF5p0+8a6B8TkwQIMr8misXqi+ssQgkOIjL2Vb
         rospzyg4novxV/rYbNsc3jve3apEwP1ZI3wkycH3+M1vXX7Mis1H3i+lT+0xvYbDThmt
         yoqgPVvtAK7bwticsmfvgtdtWw+NdI0m3CKs34wQkZL4iNfPsC5EmtHn8xxAKor8hluM
         XPj+ZTkASSIRXDOgEdZYak8QpPLtLRYpmN5ArzCxXv5TalFgBrE4LtijXnB3Pe0SYrzA
         FGejd15oBIQulDm1IhoM/oXUiM02QtdTSN++f+Nqq8SexA3BmTRB5coGteLXouqw17Qs
         HvYg==
X-Forwarded-Encrypted: i=1; AJvYcCXR+IknmQqgpImy20v/qA7Xt0OzZIaoC0v0ur3nqgFHRgp5OKC5unP18jXaTpTu31QpHmn7a1ajKyLOmvNUDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YybY7hamChqKwRonBjfUOEHzmYKWjJS1R012F4hE2qZX8bleGg0
	fF5KWe4SAb0nuDQVJOOZW7GCdF0iYwIzJMHbsOC4wo5Oh70D3djj8i3mx2hJprEP53Qcj1VgjPI
	pUKC+QCi6UdzQi3U1wQ/uDNggakQuLn+XfZsbUQ==
X-Google-Smtp-Source: AGHT+IEjM292qoxRSTMVZiEHGGPCXwidKp0QKEL9SSYcSrYZB36fSHw7uDxBp6+cKhZ+mA+gwRbbOrFaFvtkEpLB0WY=
X-Received: by 2002:a05:6902:1a4a:b0:e28:6b10:51b4 with SMTP id
 3f1490d57ef6-e2893951ac4mr10369636276.46.1728398215648; Tue, 08 Oct 2024
 07:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240930224919.355359-1-rosenp@gmail.com>
In-Reply-To: <20240930224919.355359-1-rosenp@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Oct 2024 16:36:11 +0200
Message-ID: <CAPDyKFo69H+653J=7eDqTSm2gz_AQH-3R+axqiTWqumOPQM9GQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] mmc: mtk-sd: add some devm
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mmc@vger.kernel.org, Chaotian Jing <chaotian.jing@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_073657_522197_70014593 
X-CRM114-Status: UNSURE (   8.74  )
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

On Tue, 1 Oct 2024 at 00:49, Rosen Penev <rosenp@gmail.com> wrote:
>
> Simplifies the code. Also a bugfix with devm_clk_get_optional.
>
> Rosen Penev (3):
>   mmc: mtk-sd: use devm_mmc_alloc_host
>   mmc: mtd-sd: use devm_platform_ioremap_resource
>   mmc: mtk-sd: fix devm_clk_get_optional usage
>
>  drivers/mmc/host/mtk-sd.c | 70 ++++++++++++++-------------------------
>  1 file changed, 25 insertions(+), 45 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe

