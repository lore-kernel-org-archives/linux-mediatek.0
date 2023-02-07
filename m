Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B64EC6379F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 06:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5I8DVYK4b9McA/r3M/11XMbXDM1r/KOU7F9x3+nTK8=; b=zDQDbuo3MRLdfDqA2V//tm6RBh
	1gJtviWaZsKO9/4T8XhGwy4aWfF5c3NCS0CDmPZifNGCfFR/TuiKXcemON5OiYgmfaUA1iLgY+iWx
	S6M9X2w5y8s75tCKUo7ieWRvX/n7NRk/hGHf0zr/i3NIuwmykN1u/19bMGVkwM0QfOubcaluYm9pv
	x2ZUd5/aP6cm5N0KNPJQTiO+1gZSry5zXqoQ+W+T4f+2UgqiAEMKoJmKCt5OuhARGZ58irl3BsrUA
	zM39NhBxxUDrXQLTn3nHpfAfKnaxCvuw+tGETuAvuTyYad1+up+jlbVIuDZ9/caY646HqfibTPswQ
	729RE0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHwS-00B330-RC; Tue, 07 Feb 2023 06:59:00 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHwI-00B30n-BV
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 06:58:51 +0000
Received: by mail-ua1-x92e.google.com with SMTP id g13so1310872uan.7
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 22:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R5I8DVYK4b9McA/r3M/11XMbXDM1r/KOU7F9x3+nTK8=;
        b=i4IRGldyz7bsyO1yl+IwS+9uwH6TMyV3ZceFsE+hkKuyuOx0ipHR+mGOTj/7GGhHqg
         JEWMJKhl/Y0LbmgZVsPIr1PB5uzwtSDsxCwqa9Ay+JfcnsJnD4o7x8oQ/0RZZVdj7NGe
         /l4QjrMriXwrW86obfM26x68oowkuCTXt5VYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5I8DVYK4b9McA/r3M/11XMbXDM1r/KOU7F9x3+nTK8=;
        b=TZUvvcqTJmc4UWSNBuemectvDn7m3xPfshsvmHNi0zYQMy47IBmXpPkPexQzH041X+
         hgBTpJwG1x0AWQ/kGukUhjj4awH9+Wja7Cvk9+nHXQhYnJTjWS1KEvZCD6PYW/+lYGR3
         aSh7naZEXmJ8d0R80z6K+lqLGOWNDgICkEGDbV0u8zQTimw6BepuxsroirGkdJfzTA7l
         h+FiLEnN2JA5iLwb7xwZgMNitl+qVQ65fAQ47yuXvz/JOBLDKlZbV4HaZFexp41druEh
         kSq1Levza6+fI1xhj+JDPsCH2sZvSZBVbfs8SueYlz6AD2YGPAvv8EmGzltMtyr1yEFo
         ifuQ==
X-Gm-Message-State: AO0yUKUIKQn9qKoIuN8j51PATeDNREXsaYxufydecFc29aOCgNU2nuo5
	X5LiGuPlG+sRQ3Bxtu0HD3GKG2WJlulfUPRuir4PjA==
X-Google-Smtp-Source: AK7set+78b7Dxso6dKCLZowVq0wZELWdMYO62DUcepaqgTDKO3R5fnsrULG8pV1lDnlXoMYJn3L42i8V4EcTZgbjRSw=
X-Received: by 2002:ab0:2bd5:0:b0:5e6:3536:22e4 with SMTP id
 s21-20020ab02bd5000000b005e6353622e4mr378300uar.55.1675753129141; Mon, 06 Feb
 2023 22:58:49 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-7-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 14:58:38 +0800
Message-ID: <CAGXv+5HiWU6MxSCqW8a_7xKA=-HKQSnC9EvT5eCtbpAqguq7tQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/45] clk: mediatek: mt2712: Compress clock arrays
 entries to 90 columns
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_225850_428338_96905366 
X-CRM114-Status: UNSURE (   7.65  )
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

On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Compress the clock arrays entries to allow a maximum of 90 columns:
> this greatly increases readability and also generously reduces the
> amount of lines.
> While at it, also fix some indentation here and there.
>
> This is a cosmetic change. No functional changes.

wdiff agrees.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

