Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E627AC38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 22:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wgYeHWDY557XtHMLRtUX7OPU/EboVT6jtNmcPBSKxk=; b=JGSREzX3fbgqJ9K5KhtzXW1Em9
	CQ8Kk819O1i9UJTCI3OUC8Ky23X3zdWaLU7XPopDkyXR3h8Geew2j8tph1mDFg4Apjy9L1oVF1DLo
	ZEzli//uXMx3YQpNf12O6It7RS2sjn5SidAMED1vxQgUL69RCgvTPTc7bsYqDrCwLBdjpLwmOr1rf
	Rs9DpnodSUqNjmd3gzJuZRCV2DoyaMuMk6QZjxUlCsC4G8pAvLszKCOcgdPDaAlJ4mnP03OIrAOkK
	tCE7QIVKKvXC6F6BJtj/tI3jyiqsjR0efHQkcSkoQ5wEe4Ommjq3qOw3CO4c/83KXfktViHEBrlDn
	gxQhE8xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5fs-003Els-8M; Mon, 24 Oct 2022 22:12:00 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5fW-003Ed3-0N
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 22:11:39 +0000
Received: by mail-qv1-xf32.google.com with SMTP id w10so1127613qvr.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Oct 2022 15:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0wgYeHWDY557XtHMLRtUX7OPU/EboVT6jtNmcPBSKxk=;
        b=ZajeYhpsV5Zdez+eRW07mbQARwemleDED0REBwglUw+M+wDur25dSDaISM+S6b3Es6
         oup67PnJPBPwupR2R5rvogQnsFM1bfaz433n7LttMdI+qoMqLCAW0lUl/52BHps/aNW/
         4s6um2wnBIb43aYtg8TtVqliJXipK3/drfa/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wgYeHWDY557XtHMLRtUX7OPU/EboVT6jtNmcPBSKxk=;
        b=lGzoo13jukyvH4z840EreVKgyL5ljBmzRJmeQuEbSire2pDv8P5AczuyTuYyf75aEy
         cq/NA9p3uFm/MXClHW6HyxZeVggeE/2CnU4oP1P2Zyp0tukNJ0L1tgE/QoxsPMPo3fVf
         x8c2hXxYHijGMy9cq7wIlluPOrbEYoJclm5pog9SCWhLYaWY0sDoRgOcobIfw5PIoBZi
         1YKyANUfNSPq2+bc+1UQsCc3bKl1vBP/s4LtqZh2dKNv8rZaxyGD66lz+3TMPyOzMJzC
         PWksdOoDkeIHjKTbZkf0H/V3TgyS/QiSG97eP097DEFjl5/LoAZZlURdV7NbuUyPl35X
         vn0w==
X-Gm-Message-State: ACrzQf0VG/L1Cy86YRLrZd5Zji9VUPIO/vsAyK0tVit8CK+frUnzGDn+
	jeRJijcWxfk/PzYtuZHN3VuoYCf4+UHUv8uKX/P0LrZhYegUoQ==
X-Google-Smtp-Source: AMsMyM4mB7pDUnJT5RpxnXEdEdWK0HwNgbfB+RNRZIgkDSL7pmpqSenH7TsBHZDWAklXfskjjMRaoRopr8Q8KHKkp7M=
X-Received: by 2002:a05:6102:38c9:b0:3a9:7206:b99e with SMTP id
 k9-20020a05610238c900b003a97206b99emr20722488vst.65.1666649482560; Mon, 24
 Oct 2022 15:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-10-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Oct 2022 15:11:11 -0700
Message-ID: <CAGXv+5HHAD_grwNXk-gVorY=p6DidHGqBgVHZhX5B2j5Vv-_Ew@mail.gmail.com>
Subject: Re: [PATCH 09/10] clk: mediatek: mt8186-mfg: Propagate rate changes
 to parent
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	miles.chen@mediatek.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, jose.exposito89@gmail.com, 
	yangyingliang@huawei.com, msp@baylibre.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_151138_058105_71D00151 
X-CRM114-Status: UNSURE (   6.87  )
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

On Mon, Oct 24, 2022 at 3:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Propagate the rate changes to MFG_BG3D's parent on MT8186 to allow
> for proper GPU DVFS.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

