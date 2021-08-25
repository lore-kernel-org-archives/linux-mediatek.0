Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB90CC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 11:01:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9FF261212
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 11:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9FF261212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClwOW3ULW+nMlX4LCDz1WC0S3bYRrBYh1FItoRSsUL8=; b=Zf0fBZVOfSfOZv
	BxW4SCuexURjKXU0b2ojyFiT+res18mfaOD7olfEqN0uvM1v/ZKSdQgxEJMQ/2ZEmpu/of6y2hWzC
	ppDH2swSM9aVJ5UPFxJq6cj5fLQ39rpYjO1VWEj8Gvxl7/Ayg5emakSFIJwdi6GonWLHtnU2TiS4a
	HSXjPaG0IVVT3zC9AwQhr6816Y/p8tLhRLC1rcCFPMnSuupR1vS2YnwVvuX4G8DyJxKunP+C8+lFM
	TvAa3rmrbcesP4DUhTKt3ptvtGcELBx6qQVjZF0Y8n4LrXYXHT2++GPx8WAecIlOKwJNaYG8VGa5Q
	LIudiFZHYlxXCRwnUJkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIqf5-006j5H-9n; Wed, 25 Aug 2021 11:01:39 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIqdt-006iSb-Nc
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 11:00:29 +0000
Received: by mail-lf1-x12d.google.com with SMTP id m28so5770113lfj.6
 for <linux-mediatek@lists.infradead.org>; Wed, 25 Aug 2021 04:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IMU+pM2QBZzK/mBgD18/2ldTcz6xSYAlm4VwhZW8Xds=;
 b=ZxFTXedcdzgllV0BdZVAIOcwxqUf0UzSNt0l9AgbF7OR686cjSpK+aNfAaHRtMelvk
 yUfJPVebJxXrzWgcVmO85ibd7OEJT1lw3qtrjt58s4CRZLvKL5IFje38BqnLzn3VxGbv
 eums4LevWEoHBjGmer+gWDYX6gm6FxLIvVpYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IMU+pM2QBZzK/mBgD18/2ldTcz6xSYAlm4VwhZW8Xds=;
 b=lsCvyFMHtKeCr3En8iPQ7qOQPK50eZfrZmqKllh1j3T3zLdYNjOcvPO0RPTSvdAAmC
 FCbdMcvaEvv+YfGj9EWIS0lX9NtjUjtQgaftU0exIrle5s18NBKVWMRBjUjoX3bNtRJR
 XElqtOi+VK90O0/0DSImFotJ4QjvfDbugaluTiYQBdReQ38crgn3+p/fybVV3cJ0wqR7
 5nmnCkYUmoJU8vXtC/TbyYl/ZHlnYyUBOVy0hTw4ffKF/c870SXJvEotEnAyxFEzStR2
 FCVdeB+177bdyUmXYhOg6XagRl3BJ76uQNwWlf7xBYRXU2Wm1eV+0Mx9y6OjtNFdCSLj
 nOtA==
X-Gm-Message-State: AOAM531H1G34ODJeghNBcbKYSepIF08rYObF8tct6tqKNGSxsAXYBBpC
 U3yFErmnLApdVc2a2BprpMV44SwWkoLZCXgiM9R2xg==
X-Google-Smtp-Source: ABdhPJz0Tnwq+6r0A94ST8UOV01W0Dny2Y9nLZLBesdNACuORbZBRKjlyxU3vEMbYXzhNU3c/9h+wD8v+Hnzoymsh68=
X-Received: by 2002:a19:ca09:: with SMTP id a9mr17326764lfg.342.1629889211438; 
 Wed, 25 Aug 2021 04:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-22-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-22-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Aug 2021 19:00:00 +0800
Message-ID: <CAGXv+5G6wKOZhBRq9J-Jesd1_vHn7Tt4eYo3acTK8-wK8-KjVw@mail.gmail.com>
Subject: Re: [v2 21/24] clk: mediatek: Add MT8195 vppsys1 clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_040025_793939_B311883D 
X-CRM114-Status: UNSURE (   7.21  )
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

On Fri, Aug 20, 2021 at 7:33 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vppsys1 clock controller which provides clock gate
> controller for Video Processor Pipe.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
