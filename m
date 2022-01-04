Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5278C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 08:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56/HeK+im6StLBjZ+siKouNj8RwWB0AZmIInpsRveY4=; b=SxO9uwMZK2YIlJ
	2Xg253PkKje/Vwp+/VaUPbpstef7oUBKx2zMHFfC1ha5xB+Yq9GLO80bQrESI4/SPgh8cnsWEHTHc
	2gkeEz67UCTHLrctQNcXq3DSxQl7/5odmhyFKibqasNwYhgB93oMuRVx0XovnJ0MzXO/EosZu/tt9
	yy6I9cDPHVbTD1+8zwsAJzzxsimgf1LCaQU4C1VafD/nXQjR2I1XlUK40yb7HoR+aJ6MESiea0GIa
	gUo7+zKB2njOXs8TepGPLG8ygAtq7RV35VxzJWLrcoUlI4Tv43OyByElJHo7ti36cKg900YdqP6No
	TXxZpdbDKAk4pbyUvfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4evY-00AfiM-Rg; Tue, 04 Jan 2022 08:12:16 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4eqK-00AcuR-7m
 for linux-mediatek@lists.infradead.org; Tue, 04 Jan 2022 08:06:53 +0000
Received: by mail-lj1-x236.google.com with SMTP id t14so30976037ljh.8
 for <linux-mediatek@lists.infradead.org>; Tue, 04 Jan 2022 00:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OFt24hZdmLGBoCAYYI7T4sXVcct/Z/1btjjZtC3SaEk=;
 b=JHCZ1jlAjkhd6dHGLCwhkYZP51ipfK7egRYiv0m/LWibZyiBUZWF2UrS+L0ciOOD84
 DcHwR2c/sCT+nBsKci37WgxNafQ7YdifqUOvxRWw5UdE/dmVL+23yBXabTSTCLkV4CjO
 71Bukk9tt/qPLBfSYyc/W9cczGfHyfD6MzdHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OFt24hZdmLGBoCAYYI7T4sXVcct/Z/1btjjZtC3SaEk=;
 b=UUV1GdGW8bvsdz9K9uqstqd34qa4omCKf1oFXiGXq2OTh+ANf2qZsDZCwEaFJPSKHq
 H7rbL58QodzHD6yKzr9eHmN6qGb5x1wV94ZXLwA4S2I+XqdWUma1Ro2YcBzDIrwIN6Po
 z+9WM8dU/YdHbp+yFo3yhOC0qbpWRm3LP0LpRY29S3B808om0eKX1U5qE7cCs/EyR/Q4
 ZCFvj7fZ6DEccJKkpyCJwSioO8+QZndrSn6CDZWSLixMkDIPhpG46zoIwP5Ct5cK2r1I
 a2nOUz5AOK/Uz5vtheBcPvr/g2vFH9zcnDZmivQLXRIXyNBpEkh1fypH3DRnvjhYcVNS
 ka1g==
X-Gm-Message-State: AOAM531MErNTWHKEMwm82t6b+xztdn8PyNLJSmbct2QGixuUiN5tr6zd
 JQ0l2RRhm9RQHnREMjSDiPbCOEWsCEVGzsUgYKzCxA==
X-Google-Smtp-Source: ABdhPJyDWPb1tmSlbkoDWfLqNb8n+G5kXWkiZum/N3TQDjsU7yZm39wuLSP0bo2TErL1wUNKZBQWNuR7Metm6xYrieg=
X-Received: by 2002:a2e:2a84:: with SMTP id
 q126mr36158428ljq.457.1641283610448; 
 Tue, 04 Jan 2022 00:06:50 -0800 (PST)
MIME-Version: 1.0
References: <20220103143712.46675-1-angelogioacchino.delregno@collabora.com>
 <20220103143712.46675-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220103143712.46675-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 4 Jan 2022 16:06:39 +0800
Message-ID: <CAGXv+5FPG=cRmDzo5P7axHuV22RA0UNBJr3KtjZ5ThYw8XVB0g@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: mediatek: clk-gate: Use regmap_{set/clear}_bits
 helpers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
 miles.chen@mediatek.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_000652_344971_D8F446EE 
X-CRM114-Status: UNSURE (   6.82  )
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

On Mon, Jan 3, 2022 at 10:38 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Appropriately change calls to regmap_update_bits() with regmap_set_bits()
> and regmap_clear_bits() for improved readability.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
