Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430C8C678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 15:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9SP/9+AjaQNqqJgA/usyjVh7hC/+seg8SkazKsVVtg=; b=TRBOajwskLfc0oxGSuSwnTKl+9
	c1+AyRuBC8LgxtaWfFOWNZGvPtMfZHRIW6ZkTz9I3iXLW16h/r/rUjD0O0qiRgcj9DWMvCOMrLjC1
	BSM6Xuvrcbwd/FT8Iw4SYZpk0Xzpdnhr/MWeVdybsw+yNDG4Grt9A25aMkMsyrVBm728dRA1vH1cR
	ueRuD8UNXh4IafNPFDPi5WeCz92d1BNdf9JTeQhSLmMXz75JxHy0C798CidnyKWuJSr0JoGQz1E80
	11skGvGUsVxtQV0wyWDZi55BV7kN9aFFoGDnYfbmQQs00s84cxkdQF9uWyH6is7ww1M8zF2g6Wqkl
	ulX93ESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZw9K-005oD7-G2; Wed, 08 Mar 2023 15:56:18 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZw9F-005oBN-RE
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 15:56:16 +0000
Received: by mail-ed1-x529.google.com with SMTP id cw28so67646631edb.5
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 07:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678290969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b9SP/9+AjaQNqqJgA/usyjVh7hC/+seg8SkazKsVVtg=;
        b=CUsDAMKRuC9iHmD9Gerp7prJzQhdiUnXXeY3NrzEvh/5ifcNv9bNybLeIqepePbiZ3
         N+thrxPlDAf63TCd+SO2/3/EszYQNfJcbn2R778RyGAlXXQ32iw370g9+WEKjDgqKb16
         GpQpfs79wgKCueeMrZ4u57f7WMyt/i3CffCL09AYPcL58z2xlbPxFqhUr9toOMbEpTvh
         IOx94oCWvM1x26U29pGwLImkRyaGV34nb1892YKzmouzmia/95PiDfjo/fGj31QYuiq4
         gJ5TVBad0VIzP1S7JsNMD2OGGK9inNgTeGsAG34Ac2NLyRWAbB+AThfy9SwVSLuNiTdR
         vPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678290969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9SP/9+AjaQNqqJgA/usyjVh7hC/+seg8SkazKsVVtg=;
        b=5kipX+nW+l97hF8HTom7azAHu0O9QC1Di6aqj8E6O3mGinlKpahm4h13Z1LM/yVSzJ
         8Ke+aMj7KztRSdNN6xVsThxy2XCExoR0diQeLA5aJl5mB3+29JD3GuQ+QTBRDWkxfflw
         yRVPhvGyJ8o9z42LkWrKxfyW95hdZ1nF9vjVXeMOA1EruZkVFsbh6PXHxmUt1yh3VmJL
         V9v2gEKXMCYZ5WNaYYHGtDW/0Jh3nLSLxOpGFJaYHVpiQHydRqtoZ77m3Txs839Way/t
         5JJb/g1VoOXCRz3Ph/IjJFyYke4oZ5TQLHbHPPgxhPmTqrmR67u8AsNZHwNYPIGCw1UX
         MrIg==
X-Gm-Message-State: AO0yUKVU2Bj/KD2DL/XZPkYMvb0ZVk2c3j64hhkzO1Pum8X4Y2oKJcPj
	O3416SjF4N+xvizGfa51d0ezy6RmPpMJ+xCH9n4rfQ==
X-Google-Smtp-Source: AK7set++MSA0kJY6qFTA6KF9CSRsGNNx2sdD4u4ynmCGtlRbh9tzc4ZjvrZARqg48I/75rumD77xOAEhYfM0rWdxZ6k=
X-Received: by 2002:a50:a698:0:b0:4af:515d:5691 with SMTP id
 e24-20020a50a698000000b004af515d5691mr10629540edc.7.1678290969024; Wed, 08
 Mar 2023 07:56:09 -0800 (PST)
MIME-Version: 1.0
References: <20230307135146.86084-1-bchihi@baylibre.com>
In-Reply-To: <20230307135146.86084-1-bchihi@baylibre.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 8 Mar 2023 16:55:33 +0100
Message-ID: <CAGuA+op4n+cFrkJfty2qpcFQQ1bHaK_KbjgUL_CHsPtMx=v7kw@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: fix memcpy's
 number of bytes in lvts_calibration_init()
To: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com, error27@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_075614_150780_2654F840 
X-CRM114-Status: UNSURE (   6.45  )
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

Hi Angelo,

Could we please discuss it here in this thread?
Because the other one
"https://patchwork.kernel.org/project/linux-pm/patch/20230307134245.83599-1-bchihi@baylibre.com/"
does not contain the address of "Dan Carpenter" who reported the bug
and suggested the fix.
It was sent by mistake. sorry.

Best regards,
Balsam

