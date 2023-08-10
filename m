Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B226C001DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 05:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPy+GgB9Rn2CrQzZMkbpjUhP00w0ETOf0gW/R2Mixqg=; b=qow8eHCgiBell2qfgyM1B3CG0u
	1ete2Nm7u5SnDL+7agiIGWomBlckZt9Q5Wb2fd15lJHhAasVUPAvYMGh07QMe/hPjLDSlnZSsJW+x
	r6zk9C1dq+9lUtwVx/CdNW2w11LO5gAvJWiyx/+lwh2xSWZXWtZC+st6GSyncYPGIKT2kiCUswM6l
	rkUJ4YO15WlPH2rnkRJN73jjUyTwNn187WOn62zqheAR4p6MwzrLZvb3R6Ia/KyqwL5JWZQhfroRp
	d8q06wm9eVm+ZFn4pBGZMNTSCR9TwAcPhTfsk9KVlQtchxtkZyTndj5+aMlhb8g8VtcCKmXUFOhL8
	+1hamwYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyTm-006bLy-1B;
	Thu, 10 Aug 2023 05:45:02 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyTj-006bK7-2R
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 05:45:00 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-34976c29c9cso1989875ab.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 22:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691646292; x=1692251092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPy+GgB9Rn2CrQzZMkbpjUhP00w0ETOf0gW/R2Mixqg=;
        b=j118H1So/vI4xaykh2wahXSzkfCv2++Qvibqcc3ZO8QrP2bpjF+hSMJ2+Oa3GXR5VQ
         ORhk0hxvdaftxuVDT1jY8YgPsZw3BMEgPmrKNNuoj/7nAFIZkbapxdrrgpcYr7hJ+Eye
         1a/KarSFgmBm+TW2yEM4Qu/SZU5gyVPQAjk8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691646292; x=1692251092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPy+GgB9Rn2CrQzZMkbpjUhP00w0ETOf0gW/R2Mixqg=;
        b=FHdn73Qs8C/DhsM5yIEoM8UbMh5NtGyEXaSpqNWqfOL0hEijDUwNaVegCufuN7Fiqu
         /JCRpWotTy91Auc+tn+BjnsWj/gLICrGqZ7xxCMtDtztg40aa/WtuvnQaCUQLjrHiGOJ
         sswREi03gToDczD5CJxx8FpJ8hjBThM0XYJmgggJ/149Ov3WiauQDfbPsGaNTFDkgpvH
         Ln9AWb3ubZbAVBDzHsbnktgrJ7Ya2wJAPzNI1JOW8L+Uj1xKsMf+JfjTiHPDypXaaauo
         miNiUbCW0uZoKHLqY5haEBHO0vZ8T3ZjLTi0OjXVXg9uBXJVy+9D3ec+py3W3K0yB+lz
         ZyzA==
X-Gm-Message-State: AOJu0YyCZOUEIIj8E9R6pNYihsXeZB7KBj26vBvA8QwqUaGNyZH/ZNBI
	uxJxgj7/i7UwwDfJZ6NVLYG0WyQQ4Zu09bP7fF4=
X-Google-Smtp-Source: AGHT+IEiSdtC64SjHgyUs2m4i9LHH8eRKKdBuF7/Xl0LlO2inuL53ihY1MPLKZc7ag1iFdDCMVu/jQ==
X-Received: by 2002:a05:6e02:1bed:b0:346:50ce:d602 with SMTP id y13-20020a056e021bed00b0034650ced602mr1973308ilv.1.1691646291884;
        Wed, 09 Aug 2023 22:44:51 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id t24-20020a02c498000000b0042b52dc77e3sm198888jam.158.2023.08.09.22.44.49
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 22:44:50 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-77acb04309dso18234639f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 22:44:49 -0700 (PDT)
X-Received: by 2002:a6b:5c03:0:b0:790:ff32:eb3 with SMTP id
 z3-20020a6b5c03000000b00790ff320eb3mr1894689ioh.17.1691646288713; Wed, 09 Aug
 2023 22:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com> <20230809181525.7561-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-6-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 10 Aug 2023 13:44:12 +0800
X-Gmail-Original-Message-ID: <CAC=S1njBP2uhAgz8MOm5jxHHPb5M8=UaH8powW2mCFjBWPp+FA@mail.gmail.com>
Message-ID: <CAC=S1njBP2uhAgz8MOm5jxHHPb5M8=UaH8powW2mCFjBWPp+FA@mail.gmail.com>
Subject: Re: [PATCH v9 5/7] drm/mediatek: Add connector dynamic selection
 capability for mt8188
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Eugen Hristev <eugen.hristev@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Nathan Lu <nathan.lu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_224459_794744_07FD410E 
X-CRM114-Status: GOOD (  10.39  )
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

On Thu, Aug 10, 2023 at 2:16=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Add dynamic select available connector flow in mtk_drm_crtc_create()
> and mtk_drm_crtc_atomic_enable().
>
> In mtk_drm_crtc_create(), if there is a connector routes array in drm
> driver data, all components definded in the connector routes array will
> be checked and their encoder_index will be set.
>
> In mtk_drm_crtc_atomic_enable(), crtc will check its encoder_index to
> identify which componet in the connector routes array should append.
>
> Move DDP_COMPONENT_DP_INTF0 from mt8188_mtk_ddp_main array to a
> connector routes array called mt8188_mtk_ddp_main_routes to support
> dynamic selection capability for mt8188.
>
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Tested-by: Fei Shao <fshao@chromium.org>

