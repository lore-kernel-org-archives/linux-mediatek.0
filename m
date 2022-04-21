Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE83C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AY9bf4kg0kJRXalp1cNAxm4JacimJl4vfY293P9MCDM=; b=2Ees0Vbp48Xeft
	HwHFqfauEhGGNi/ZHWU4aUdco7MtX9TRdtBF45eeOm1c9Frdn6jiGVtstaMats5ODKZxzxHaWEAS2
	cQpJbSPldSebDbkLAnb0BUAaIhanbyuMR8BLQ7CAI0xjr24tCfh3dGqdySHzrFXBNJvRrxtFRVzwj
	XLp/52484rrxc/VCtUBoRIT3nJh3pESozMOAX2z0uP7H2QujohRJmSo3QXHz37xgZ/dkdVu5I0dNU
	7T7SP6EnnKVrMac+vpfmV1Xi25455RNiXs3bUX4/Ocs2C0xzobLgMmVsgKb+KroSfY6NCVR+yebOB
	JlwjbwddyOCFwpnSMQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhStx-00Cemm-94; Thu, 21 Apr 2022 09:15:01 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSts-00Cejn-CN
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 09:14:57 +0000
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2ec0bb4b715so45357517b3.5
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Apr 2022 02:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V1uWVuZ6+A0BASrhtcS2ivTUwFpVOwbpQq4d16gjWgQ=;
 b=KfviBbNUxTMiBSnCXE3OrnaDK39G+p2hghIMD25j0KUp7ZLrh+Bw0OZCCeC1hIrSfM
 pTwQMys9R1SkEgZPN+U1YplF3DXwzr61jkkU3Mwwa78nUXpDeRMWrFKrBUAfDTLhyPsM
 ciErq4lfgYuxNGVDSG40Gj/QRvjJLmtgAGJLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V1uWVuZ6+A0BASrhtcS2ivTUwFpVOwbpQq4d16gjWgQ=;
 b=X0yQe/KwMPuRGdhymSE0qier2QbNPme9tgLRMfMUnCsNeLJSs7BiOSuBkrYQsZvM8X
 pzI+tXfhoY0JCf2U/gOD/AfViSEg3YCwRpb8C0bnC2kJlD74dZTyYO4wy7TDCo4IVIUi
 eVeEp92rQVyF1/r+YHEfoyS6Far1CSHbB99xyjFdFw7xAMAE9PHmhPLzBzE7mtRSB19n
 OC78xHlE7C3PvQMnxYrIF510PwusvINNQDZagZ9Zhhz5OVSD3+sr4Tbq9kzEaNdLPC+a
 QNW4qvY2SCbQI1bp0BK9QJTjm4FlJbLILGI+MvjFpcFVrljvLf+MrYuni6BOqrfWjDxy
 ft5A==
X-Gm-Message-State: AOAM530BqF3W4wMzu3Iv5LRTXlBq/wz6hGamvIvEiN4lwhrjMZ5nLY4b
 YFqRPSls4rfPm0cgNwQOPJxjNJhTG28kEGGdCPyBhA==
X-Google-Smtp-Source: ABdhPJy9nYqH8i9c1NYzIrrrk2RUAbZ7bXTS0+WD7NPVL44tYER6HZDSPvwCms4t/XCM0TjMDZvIAjxJ9Py7xiUDcss=
X-Received: by 2002:a0d:eb46:0:b0:2ef:4946:544 with SMTP id
 u67-20020a0deb46000000b002ef49460544mr25008925ywe.286.1650532494832; Thu, 21
 Apr 2022 02:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-6-rex-bc.chen@mediatek.com>
 <90ad46a5-8b67-e9ca-25df-2a7cc6110bff@collabora.com>
In-Reply-To: <90ad46a5-8b67-e9ca-25df-2a7cc6110bff@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 21 Apr 2022 17:14:43 +0800
Message-ID: <CAGXv+5FL=YdjonwBWV9ZkRf3jstCsxCEonmH02g2+1PAopObYg@mail.gmail.com>
Subject: Re: [PATCH V2 05/12] clk: mediatek: reset: Add reset.h
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, 
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, 
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, 
 allen-kh.cheng@mediatek.com, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_021456_483204_507779C4 
X-CRM114-Status: GOOD (  15.94  )
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

On Thu, Apr 21, 2022 at 5:07 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> > Add a new file "reset.h" to place some definitions for clock reset.
> >
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
>
> Right now, you're adding the enum mtk_reset_version and *then* you're
> moving it to the new reset.h header, but does that really make sense?
>
> I think that this series would be cleaner if you add this header from
> the start, so that you place the aforementioned enumeration directly
> in here...
>
> ...so we would have a commit that moves the mtk_clk_register_rst_ctrl()
> function from clk-mtk.h to a newly created reset.h, mentioning in the
> commit description that it's all about preparing for a coming cleanup,
> then the addition of enum mtk_reset_version would be in
> `clk: mediatek: reset: Merge and revise reset register function` directly
> into reset.h.

And probably name it mtk-reset.h ? 'reset.h' is a bit too generic, and
I'm sure there are multiple files with the same name throughout the
kernel source tree.

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
