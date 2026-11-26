Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E74C606A33F
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qSq2CQIo;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=R0yjQFSy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mDPiQneaNeUi2efSk5eylep7jPHdMpeW1fG4LwrvlbE=; b=qSq2CQIohOwR82
	o1H7AMP85rCuW39C3nYdQkT5qJxPPqyLx73Mt7IR5xXGohxs9ewxF4oYp8n7c149lqBQUhP5XFyCc
	UjYO8DHl1BylnaFCquT3UEmxi5o6ZwkWPdfNRCOROcyK6gr0vQZdIMylAaBs8Q3t0OEA+wJVAxw4n
	/0sW2LLMNbugbh4E4RsV1eKHiQoVJ41hhej6tHwz5K/PonDv3KgRmlfcJWGCnYeO+YupVuVfWisW9
	Ev37Fdd8YntU7x6MBSDtQwxbi71vLiuDvxqmoHX3flEN29bzUS0Y640YKUuA3qtkMYl9TL/zO/q2p
	uRQtS5phqspP7vogZl9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUlO-0000000CNQS-22eY;
	Thu, 26 Nov 2026 08:23:32 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUlL-0000000CNPf-3ZRp
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 08:23:29 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3b43d30822fso3620768a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 00:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795681407; x=1796286207; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mDPiQneaNeUi2efSk5eylep7jPHdMpeW1fG4LwrvlbE=;
        b=R0yjQFSyIkT7lqMqW+CdBV979oDoLWtnRj1on+b9Vqt+X9DvYuvHfFhEvGYljOnmfj
         fxU6E8U5IoXBsjMjss+9yTq5xlCtP40ZdQAYheHHuYSjE+I5hOYYnmdAd+UJBaZTCE2X
         kQsCuGMDjJpLin46wfRqWduEvOKhA5za7k6Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681407; x=1796286207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDPiQneaNeUi2efSk5eylep7jPHdMpeW1fG4LwrvlbE=;
        b=o4mD92CtTO9f4Fw3e7HLrTfUhObF/v1CRU4ORNxTG+HWjJOdTr9txHMG4A196gUToT
         VJdxWO24URGUTzgzG4FuF3J3kuZpUyQtkQz2xUlqe9gNq24Z2aJasbK4YCEYQdKXw378
         /68OWiraZK8p0zN7UPHV2DVDFb4K2I3HtI464kMDnLoNc/3uz9EfzAvJjqzQp+R1wAdF
         MkUXkJyNfbuZ+n9bXjcgEouAcaPgUeWLrFGP0ngm0XqJLFZED7nw3K8eLtY4oKFfMfN7
         fpo/cvqTe8Pink+fgpNjoaqCD4k0e05JY1eS4j8rvq7E50YLr49qL5wFTwB/XiMUvt/F
         ZZWQ==
X-Forwarded-Encrypted: i=1; AL+hErFVbN4RmgZ5rLllvC/MNdz7oS2CiEZh9tFl1lVkHow/I3L84oNnrKjlJwCOMwK2/HzyBGAJJxX7BcZRHnyIIg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/uPoXjWxBDqWxMToTmO8Ty00baNoBtvWNfxdVd2kAQhZ9oK4Dc
	9X6+9zKo7QzUtD5mkKuxSOeWyKVIgFEjOxzjQaywMpCc5tNB3SQlNcmclZpzruxwM0bcI6GATwr
	/f1h3TA==
X-Gm-Gg: AZFdTZeq6S8qC2+qOk251/uj/RedfePFVpVT7WPLqxbGRVlDl8QocDLga6Smy4109uH
	HjQJo98sLiq9RIDP/nH2mveD9GPmWFNwhWb7ZTv0c/MFbYSCwbobbUwAt2nZev9olMvGS31zB+6
	HrRxEONgmwN2QNzmK9MBBoXCSQvPw5+judCAI01qKbX/efv3ZpHBWBBazrYXH9xGO0RINr5fVUf
	cZqc7Bmo8UQuhJi2sPW/Obio6NSrYQCn7ZHViMKpoGUGSCzhxqzX7yVvTPit4/mSRdcRbFPvBKy
	hWbbMYAstN1KAvg7BTHQJ2x61nHnQhDtjj8jTLpxNzpHNcEUwC9zSA7JV4JDg10ibjMIczTOzjR
	984bHS+xQCDZzBD8lo1QP+uDk6WOP7FNJ8VcrDMkboHLrIxYLAKy/Z4XvioTccVQhW+Vck4kUoh
	GG/SZzLC9lVcIxSU45KXiLeeWHe7KvxiXwB8Sz83TYrJ8fztx2jZK2SWpMdE1DEbRmPabU2+RFo
	CDiNDLI2yV5nuK8VYByMN+NbaiWP6O8pcVsbn1Us1yR/eY2/A9oSW5a6ZejcoGtNYijZOK+vbLk
	EDiuV883KhltCBs8g4+rYnKGIY3C9pLbwnF2v9YB1W8ZIcIc75VvOlxpn+poe4C57Zo=
X-Received: by 2002:a17:90b:5109:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3b41c92ca38mr19205816a91.24.1795681406729;
        Thu, 26 Nov 2026 00:23:26 -0800 (PST)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com. [74.125.82.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fc28asm15227454a91.1.2026.11.26.00.23.26
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:23:26 -0800 (PST)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3863db981d4so9497483eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 00:23:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGEyQgmyQ+AzGIDvHZWquuhNLq40L4aHdaeAUakGhtg2PcvheSoYQ/SVKF96nhNn5RwyCOJnFTQFi/KpBGzLw==@lists.infradead.org
X-Received: by 2002:a05:7300:a986:b0:386:c6e4:5732 with SMTP id
 5a478bee46e88-386c6e458eamr8946070eec.3.1795681404503; Thu, 26 Nov 2026
 00:23:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-22-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-22-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 16:22:46 +0800
X-Gmail-Original-Message-ID: <CAC=S1njgbFAsOruyi3tPecJTNnSM9xkeLqM6buvrvSTJXv1c-g@mail.gmail.com>
X-Gm-Features: Aa3M54rE91WEZuEtmgUF0iLv3_PtSqqif-lCGzmC6rPCZG5AI3LqYIpHVgEKyRo
Message-ID: <CAC=S1njgbFAsOruyi3tPecJTNnSM9xkeLqM6buvrvSTJXv1c-g@mail.gmail.com>
Subject: Re: [PATCH v2 21/46] soc: mediatek: mtk-mutex: Add new functions to
 add/remove triggers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_002327_922488_1850DF14 
X-CRM114-Status: GOOD (  21.20  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Jul 14, 2026 at 7:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add new mtk_mutex_add_trigger() and mtk_mutex_remove_trigger() to
> replace, in the near future, their older style equivalents such as
> mtk_mutex_add_comp() and mtk_mutex_remove_comp() for the Display
> Controller related MuteX triggers.
>
> The same functions will be used to also replace the Media Data
> Path 3 (MDP3) specific mtk_mutex_write_mod(), unifying the MuteX
> handling across all of the currently supported multimedia-related
> drivers for MediaTek SoCs.
>
> While at it, this also takes into account the upcoming refactoring
> of mtk_mmsys and mediatek-drm, which are about to migrate to a new
> Component "Type -> Hardware ID" mapping, by adding a new function
> parameter "hw_inst_id" to support that.
>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/soc/mediatek/mtk-mutex.c       | 60 ++++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mutex.h |  6 +++
>  2 files changed, 66 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-=
mutex.c
> index eb5d381ff5af..ef8e77f7e2f6 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -887,6 +887,65 @@ void mtk_mutex_unprepare(struct mtk_mutex *mutex)
>  }
>  EXPORT_SYMBOL_GPL(mtk_mutex_unprepare);
>
> +static enum mtk_mutex_sof_id mtk_mutex_get_sof_trig(enum mtk_ddp_comp_ty=
pe type,
> +                                                   unsigned int hw_inst_=
id)
> +{
> +       switch (type) {
> +       case MTK_DISP_DSI:
> +               return MUTEX_SOF_DSI0 + hw_inst_id;

Unfortunately, DPI / DSI IDs are not continuous in enum
mtk_mutex_sof_id. There are MUTEX_SOF_DPI0 and MUTEX_SOF_DPI1 between
MUTEX_SOF_DSI1 and MUTEX_SOF_DSI2, so this may point to an unrelated
SOF ID, Also, an out-of-range hw_inst_id (if ever possible) can also
map to a wrong SOF ID.
You might need to explicitly enumerate and map each valid (type,
hw_inst_id) pair and return DDP_MUTEX_SOF_MAX otherwise. I don't know
if there are easier way to work around this as reordering
mtk_mutex_sof_id breaks older SoCs.

Regards,
Fei

> +       case MTK_DISP_DPI:
> +               return MUTEX_SOF_DPI0 + hw_inst_id;
> +       case MTK_DISP_DP_INTF:
> +               return MUTEX_SOF_DP_INTF0 + hw_inst_id;
> +       default:
> +               break;
> +       }
> +
> +       return DDP_MUTEX_SOF_MAX;
> +}

