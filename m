Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB14606A31E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=szcfMHHD;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=amdxvHwO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=; b=szcfMHHDALFzqIVTrQVZMmTmSc
	YMLaRM+0XJ3qXJholcxbCK7JyDwFcZemm8rSTElRggj8h/JIR46O5kt1atFKu8wCC1ov3N9h0vPbO
	yutpUMTWjMQ8qg9V5Wqu2lANzB+Gkv8NaRhkTf72pjxEaWBUQ2nroJKREcqUCQ/KDMY+dJSSMFLcZ
	XFzM/El5/S5bkrwSkX62gF6SwgFS4XCtHnMFj2ynxnmZpLOi802nZYM2wK2YRgeJEahCKJuFjm2Ok
	/skOE/0oqOQ8e1Rhkbex9JqAjE186LBBjJy/cQenklN5cPnKnVllPOae/CUnVJZHShYgNvv6te3W4
	w9QUwOPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrVf-00000006kLz-1ulZ;
	Tue, 24 Nov 2026 14:28:39 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrVd-00000006kKf-0uX5
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Nov 2026 14:28:38 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2f0414c1062so26580945ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2026 06:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530516; cv=none;
        d=google.com; s=arc-20260327;
        b=qISTiYcYd3Spk9y3qJ0rIjQkyaTjbpEKvu4AqJfxiORl7OcA7fIIdaCshVLjTpb25k
         xQDpaobsHuBDj3T3ysO06t1bqrHDfg2eTFo0/1izAkm8HmCBStz6xT1ukoiPbJRJB7J5
         fziBAeOyHTBbNs4jlFFwMMzLBtZqY4WYNZgiX5/KUeDSXE2ykoEUVieA2KLhV0UaAwRD
         6Y/V1nq9xobLXVA+GbbtFXCyuW7KoiB9AwlzA0nqC5DhdHInsZqm2zopThX+DeRwZSzC
         bmfrZ4b1zt5X2+hWC1ORCjGLcXUtpkmIMlFpoZg88g5Os1RwB3jI5AttWsxqlaNiCe5T
         Nzww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=;
        fh=5JVwE7jaZKZLy1hK0WU7Uko0hqiFbLGfS/36/oo/Wog=;
        b=QewLTbbjfcarpdO82sq51XgbFOWgM6Fzbo0S+DhamY2qetsAn8kouNq2WPzsMuFSLu
         sR9mKIhnZ9rhLEQS/h2rKVTDWnmF57deNy2i1aGPVoAMgbfIMgGijTmQQlMfcH/Tg3+k
         GSeZHG4Zx1F5q73LZLtLmH4KW/eONJWQEraU2uI1B/eW1NztHuizb7pwtET2f9jMOPH5
         w7QAPlkzxkHR4pqDAv7vgy5bSqBsT+XaTJ7MdJ4hsKdEWOBID0vgZ+nbWZFS2y5T9hp1
         YLGsTwpsMuHrOgNiZ9jOWvCWhzHSKSMxQX1UuPK0yvDAWv/1o2ipRYS+dhWiQkebiPG+
         ZGnQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795530516; x=1796135316; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=;
        b=amdxvHwOdJ6Wtdd7BieupzjKPwH1MzlPF2LCB4nOHgD3g/FMlsO9LEb3ZgMfRYqfPO
         +E+PjHhgZ5BoOS/1/aRvDivy+KU0J/ilF2eplTa78ei1+fgVEHyytMW7bHDvCAwDjIhe
         X+HUzhy3vQEWXyFmmqU0xaOnWFjNHUNwEacc2lKSAvtq2uCpV3Y+TvpnFE4FuwPGN12R
         JZJHRdK8C5tVImA72G73QSQUyXUkRkcMgOH91XDajYcAKVjtH11CrJzxe2gPxzxV5ya5
         htHGXz9hDeycxsIEYS/xsvWeK9E6TgGQ9KbDj2ur/4Zi6Hbha1riHrQQm0ON8VqKY6fS
         WpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530516; x=1796135316;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mQ2JTBOODXVLExMT4lau5wcd1i8TygMCNsmKX6gW1YI=;
        b=jHCiwp4Rq/ET+KvIzhT3FUQT/G7ijGHvj5oVMdavGPQ/qg6alNIadP0dtVkJiAPuqt
         LIWOrs5zE24Qq4hSvn+druu0NHipwIV29pn5UoB3FsEK/ef++bPpedPwY3YU1srfxpFe
         RGzufIvmTYSFlAcxYWviq08YNiJPQ8vkascDtgxKfoCcZiKKPUKdGHaSsoX93JXBfMZh
         11Hc5CNWO5N7QACF2A3G1764Md2B2hggJs9d4vykZTyXxg+Ux8gBkykkwORVUsnKqj4g
         X/eHTQyzk9Do3DZbTBdvIY7enROgW8NRagI3mxh4q6Hzn/FL4yWMIStJPGd8B/NF22x7
         dBlg==
X-Forwarded-Encrypted: i=1; AL+hErGYve/afSJrbmb2TXn826+52NXJ+jfHVXLiIa4S4jIiFvNEa/+xjcvslNUw5MXvLDi9UVLjp6UOTnMfF/pTtg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8mpHP/ToM2nGdO8MlDH/iZ5SnWpi0/dIyofeOGTrLWcmUqs9bw
	mhxfnSHgqGLoD5S2f1nW1h8qUdLoF613p6DWc2L/S2WpPcrjWfzrztNNb++a43CT/Z88fpu/tlp
	qVSwSQyHDpMMvDeN0QUp/WlMlLBD+iydkq2mtj1hrfQ==
X-Gm-Gg: AZFdTZdX3YrPzy0liRWp9/ye0KK9NLefF5gNkJoZQrBVTtWlRXsQ32Nq/Qy9HQ5+ZTG
	MSFhcmymOowXTC8ylnAaads1nH3hMw3/xJmcYEt4WGUV2Q/poPoZRigncfTRu8w+CGCHdMCnQ0v
	fZ/Dc84g8yvShCdRhxEuiGQXrXhFrf74aSwYRqgL85c/fK4krlPGKrSspdAxtE3AxA693ysz27d
	18bo06kV0f1xZ5JEeBH+Jz7EtIwyrfgK3n3qo+vJwGYg4FXSzqG84tDHAq8fDi7mJZAplJKcFPc
	ttCXoOk1JMt60sD85fgibeYzh/rC4moYKAPQvrvnFjQYSaznTOQs6WhnYsYBJO8JGCJw0PJ7O70
	J7rMLvrU8UUCZ24w1/rMU3z+bq6ux/RNbYw==
X-Received: by 2002:a17:903:19cb:b0:2e9:9a19:c5b with SMTP id
 d9443c01a7336-2f03f16d710mr139233565ad.47.1795530515765; Tue, 24 Nov 2026
 06:28:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-34-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-34-angelogioacchino.delregno@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 14:28:23 +0000
X-Gm-Features: Aa3M54rrDo3X7VrfTe9b69h24tjA9EEIAxDaPhgJEX5YWMApMtqcKA6bBO6NIJU
Message-ID: <CAPj87rO9saEC34+5NiYK8xyZiNytrVgOcszoY5uc7BpL=M4WTg@mail.gmail.com>
Subject: Re: [PATCH v2 33/46] drm/mediatek: Add support for Display Controller
 exDMA component
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_062837_293575_23625F28 
X-CRM114-Status: GOOD (  13.31  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Tue, 14 Jul 2026 at 12:45, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> +void mtk_exdma_layer_config(struct device *dev, unsigned int idx,
> +                                struct mtk_plane_state *state,
> +                                struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_exdma *priv = dev_get_drvdata(dev);
> +       struct mtk_plane_pending_state *pending = &state->pending;
> +       const struct drm_format_info *fmt_info = drm_format_info(pending->format);
> +       const u32 blend_mode = mtk_ovl_get_blend_mode(state, MTK_OVL_SUPPORT_BLEND_MODES);
> +       const bool csc_enable = (fmt_info) ? fmt_info->is_yuv : false;
> +       u32 val;
> +
> +       if (!pending->enable || pending->height == 0 || pending->width == 0 ||
> +           pending->x > OVL_EXDMA_MAX_SIZE || pending->y > OVL_EXDMA_MAX_SIZE) {

Definitely don't do this please. If exdma is asked to do something it
can't (and I'm assuming that these last two checks are intended to be
on w/h rather than x/y?), then you need to reject that in
atomic_check. Getting here with pending->enable == true and then not
enabling it, is not OK.

Relatedly, most of mtk_plane_pending_state should be deleted as
duplicative of drm_plane_state and it would be great to see a patch
series very soon to clean that up. It's been that way for the last 10
years, with seemingly no discussion ever of why it exists (my guess is
that it's a holdover from pre-atomic code), but no reason to
perpetuate the badness.

Same comment applies for the blender.

Cheers,
Daniel

