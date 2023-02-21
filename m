Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E994C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 03:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abwOXxZAy2IWA1v+hcnlmlYBnF3pC1N5e091p0+kqCY=; b=MA0kOTZ0Dgflggh8KfnSFSTdAb
	6NuSIKiMfV15Odn3Av8AbP1wc+wEWAo41Q3rS3bJwT+EL4H5FDamEXgKYa/TKTBRTQlGsJnZmUgst
	tZg5WQH+vBoA3jLTvlvhBioLmab4IpOc+1S8fyUvnBxyKgSowZCTDJ3qOSsM3rb49If02wIj7CxCY
	1beYMwE40JB+112+oSpNQ+3HjoLPKM6k9iB4x1R3doGkyBbbvaTpZZsXvlgwSp8vtSh/+C6kRHIG/
	Ezf89Y3aR3gU72XOfc3f2t4uiRB7UXLxwtRAqydzz+BJiLvA+jXLdZDBgqlY/szFBLOZRof8PWwfU
	tDdgKX6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJmL-006WzK-RE; Tue, 21 Feb 2023 03:57:21 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJmI-006Wxe-Jj
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 03:57:19 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id n140so2280194vkf.9
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 19:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=abwOXxZAy2IWA1v+hcnlmlYBnF3pC1N5e091p0+kqCY=;
        b=EYsbi0WbjzmeajfB7FkE1Sjn42SiG07kszNQeO4bmzmFEM3nEblatl6GYqTtXZrNeM
         bGN+diyzDKyYVX7EBpeM8lWiVi+dOB1tlZgN6uuGW5FwTN8nabv/nGbnH9xBGZxzq3Lv
         H7hOty45Ro/kRV081gCkzdrR+rBqxUA+gBDiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abwOXxZAy2IWA1v+hcnlmlYBnF3pC1N5e091p0+kqCY=;
        b=YODLry0Sar3NreNXgft7AFR5+Ff/dNieBJOAeHkZlSNPBhxP2YTHXYLZb8JniQlM7o
         HDlDMlgFmkKRaEPHPPRoRWVgsnsZJREtR/cd+hjevmQQ8GM/Dr+Arjx6KgHkpFApV0hN
         9lfv8k0uIsheEmX7Xvvfmlb3TymERc/yHVS115ZtOuHwBGDYhb9R8iwUZV3wcdWRf7XZ
         f/f36gpLVeD40AkLFbF09ZazVZOoohrKgRNXhcBFR72ADnDB1/zTOvzYC+iakraNII9Z
         NTVo34H5JPhPkqI5BG3AwG/r2hqaAj3pFinZnwfi08pH9FbW4QaxJylnSd7HSa2OCehe
         lFvQ==
X-Gm-Message-State: AO0yUKUzYacFyN+JwzWLf4cHNrwlrvMbuwpxEejgPsuyJiK98HTP0LZ3
	WQZjsBILDLSWWzbcy10OhHvheodoD4CRt+/P2cqhfg==
X-Google-Smtp-Source: AK7set85+8uGYvX/31NEkS0PijJj9uGf3ECBO7SgPA+DVMmlvxh5qtMlrAAK6g4OzKVTncAREBChRQihS9f3vpZC++0=
X-Received: by 2002:a1f:a3c8:0:b0:40b:9:82fd with SMTP id m191-20020a1fa3c8000000b0040b000982fdmr814221vke.18.1676951837787;
 Mon, 20 Feb 2023 19:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-52-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-52-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 11:57:06 +0800
Message-ID: <CAGXv+5HjKuNLYtieHO4T1MXN7Uovz4oALqcP1DVAowY=h2c0Lg@mail.gmail.com>
Subject: Re: [PATCH v3 51/55] clk: mediatek: mt8135: Properly use
 CLK_IS_CRITICAL flag
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
X-CRM114-CacheID: sfid-20230220_195718_671805_86CE39B1 
X-CRM114-Status: UNSURE (   6.83  )
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

On Mon, Feb 20, 2023 at 11:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Instead of calling clk_prepare_enable() for clocks that shall stay
> enabled, use the CLK_IS_CRITICAL flag, which purpose is exactly that.
>
> Fixes: a8aede794843 ("clk: mediatek: Add basic clocks for Mediatek MT8135.")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

