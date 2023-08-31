Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E5CC83F2B
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 07:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0uJEXICar/m6wRe8rgnaCoFUj0NDUfeIIguEQQrQtA=; b=ijnV39rNEHXB+gqSfaXOJNSM00
	VnziG9FxcuOT4g07r0z1egbePvUbOb6MH4err12/IKjw35rZ5UNvuz1zY7bWGz6goSOU210LKPhGT
	rNLsffjuipdWyPCjsi3gXu428VvlobON90Dw+1Csi76mXKS+lboJcfzStXFmAMkk11iqYVFsHLEBv
	dAG0GV2l3aq6+rLwC7Q2ZTMIeHKWDpT614qVFQ2BjaN7BYh1uXc5C5gSg9ehjGd1f3llyEbhyRDM3
	si8BwmNPtadR5STw+I4RVUj+xo4INbliKNs6sZ9YZcolBI5OPsO2YJy3SZOX3hpzaUsJmjSHWt8zm
	FrLXTiCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbbs4-00Enqz-24;
	Thu, 31 Aug 2023 07:13:40 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbbs0-00EnoN-18
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Aug 2023 07:13:38 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7928dc54896so19919739f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 31 Aug 2023 00:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693466013; x=1694070813; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0uJEXICar/m6wRe8rgnaCoFUj0NDUfeIIguEQQrQtA=;
        b=lsT6uo9m8zFV3mVkwHsmX/7RVJ0VA9ptiZA6fZBr96pUjqBHnw9C3L73HbRYtzh/fG
         l0nIca/+rEEKqadczorJCN0QswIB1fZt6Qbnhycwf0cJPsCasflLvkCd3/jXhm0Q7Pq0
         c/Ixa1gNY31jRvT6z4GHCILoMapiqlDINZK+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693466013; x=1694070813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0uJEXICar/m6wRe8rgnaCoFUj0NDUfeIIguEQQrQtA=;
        b=kez6UZvVCc9GaomJ/ua2PbCCqHCx9s1Q2P6jkeqOsiXh7vcO/BWWJFz6Cw2KYkaHWC
         f3OMlcNQqRIWPipkQAyRf5+p5ghYPCO0bI4OhY/8psbd7WT7kmwxi8grLGv1z+mcxU/J
         EHKdME0wF3hgXls2iksRyahzS1OUiqHTnuzQNamgfGBLV4sIzTB4nBY6u9JKSM/Qgtim
         +1HQzUnyKy0m6E6QtXjCjgVGjAmHyt6yTiZ/miihccUZIu2GE0/2S2AcX7AoaHh849GJ
         ve+i7ykFfMEa36ZSeXHN2BhXwPWS0M2RdZMDBcCttjIrTgdAZ8oY/59X1iIvDP1suEfW
         UotQ==
X-Gm-Message-State: AOJu0YzJ9jtx6RZIWj4Ty11hjO0GMUAKQtL7bZj7NyQL3K+6ICVb02Ah
	6dAg4Da5Nlb/ZfblHfJmyJLD4BqJM1d/cJSUBj4=
X-Google-Smtp-Source: AGHT+IFwLXVmTL9vymO14l0gwIlIpkJkq615yjMqi5HyiGCBvMiNIBHzIFHNetZD8QoJmY85Lgj5HQ==
X-Received: by 2002:a6b:d213:0:b0:795:183b:1e3 with SMTP id q19-20020a6bd213000000b00795183b01e3mr4296511iob.6.1693466013745;
        Thu, 31 Aug 2023 00:13:33 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id x20-20020a056602211400b007836e9ff198sm277650iox.55.2023.08.31.00.13.32
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 00:13:32 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-794cd987ea6so19806239f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 31 Aug 2023 00:13:32 -0700 (PDT)
X-Received: by 2002:a05:6602:2768:b0:783:4f8d:4484 with SMTP id
 l8-20020a056602276800b007834f8d4484mr4957838ioe.2.1693466011946; Thu, 31 Aug
 2023 00:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230822132646.9811-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20230822132646.9811-1-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 31 Aug 2023 16:12:55 +0900
X-Gmail-Original-Message-ID: <CAC=S1njUVqt969Wv+dMc5wD3Uyu-2Cm4qCUwkp7kfeG_uBbpVw@mail.gmail.com>
Message-ID: <CAC=S1njUVqt969Wv+dMc5wD3Uyu-2Cm4qCUwkp7kfeG_uBbpVw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add spinlock for setting vblank event in atomic_begin
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Eugen Hristev <eugen.hristev@collabora.com>, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_001336_389289_DB3CF8C1 
X-CRM114-Status: UNSURE (   7.66  )
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

On Tue, Aug 22, 2023 at 10:27=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> Add spinlock protection to avoid race condition on vblank event
> between mtk_drm_crtc_atomic_begin() and mtk_drm_finish_page_flip().
>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

