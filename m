Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FC1C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 13:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gc3tDcNmjeuztU3xn0e0kMNbTfHy/t9nQM2+/ch4rWU=; b=rzLzRESdT71try
	wIyoT5+Y2huXpr0y4uaUAWNyCJLAohVyP+wWl5VrXzjebrrpANrtFSuUUyIbkLIMYS8LsA1XieRMQ
	79jTSfDdcsHsp7tLftdd1rndzmxbh6dfqVfVg5OpCwqQCztJlyuhBiiunlQHFCiwXrbE2qBR+SjoW
	N3j5n6U2By4hlSloxH+poNbEWbTQWzQJdIxkh9MOg+keS7xXy3XhedqfgEc+3SzyAcrqEpFEqIg2p
	v9//x3QfTtUGil64bZQFUz1JG9J6BqL/L9w0T7dbmN+lvpY8u25lsoAM7ep6FbPJXRRWUy0ouJLsk
	//eVI0lSsWuZ3cqPRvsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRwHK-008k7c-03; Wed, 09 Mar 2022 13:22:58 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRwH6-008k2z-JY
 for linux-mediatek@lists.infradead.org; Wed, 09 Mar 2022 13:22:46 +0000
Received: by mail-pl1-x635.google.com with SMTP id e13so1937823plh.3
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Mar 2022 05:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nFpUu9dr27noPEr7QirbOcRxKdELB7gGpnSLhYA/8gk=;
 b=u91UGLmWfLry7Qd6UFWNi+UaDteJUJDXdAl658I7tK+Z9YPKkYp1+M814Yrj8LoQkD
 fYknxzvizgkRxib8MSrjAxFehpP/x5dgDGjjbFsC39p+PHvkvtA1DolgdBAzPJU6SmyG
 RaNiTUBSrIFpYc1ynXq1YpI377jkv9iEDe9vE3LFtAUV29xTLMZcnaDY/25dFhcIUC+Y
 d2+TXjv2ruxUWa7In6j5dHHpL91wtEOPc64pDbVhFVS6XyZha9Kjk6E2rUiN5L0PFPmm
 cxfuvyhePMtYCF6HnQnwHwZQ6ApfixdNaTxIUggcWjdqRRzZy48cG8Nrv70E0rEbe76+
 yNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nFpUu9dr27noPEr7QirbOcRxKdELB7gGpnSLhYA/8gk=;
 b=vfA+dUr9ZqdLXp/gPESmwdFRiTWbSbaDzbdh1ZyzpB9x1v9x4XjYo0wf8ADlOqojqI
 /KWYYKa3IB411xfE5XX+xW9n/yCMT/VWk1xVcXJ5MYDLXp9VeqwCn1HBzQKKk1VTVG+v
 nkVYHOJo5n//RH4VA0RfiPVdoaG79UxQw+eWglh0j/T0MhGfX9iO60JikEHZDjBTDRMm
 iygp+II9zr8tGO2Zenk27WDm3Mxa4tjXIs9Aw5NFj8hpz/FhrL+JgTfl/w4XuBTjDqco
 OEpu4wXu0YrFThxbPmMgHx7zZDmEjUl7JOfoEZFgwpPRTOMqu86Ra1OkRdsIXYolnBGB
 5i8g==
X-Gm-Message-State: AOAM531fz7/OQTEHhpIBkIHV774iNHXIjNqD4pxxmUzFSSp8JCVc0RPq
 C6SvbAPuLBwBorDFKc2uMko+CYRVu6z/bXdOYPtL/Q==
X-Google-Smtp-Source: ABdhPJxairSjptuZC/cMBulWljGFXF9/fDim8+cVb5GOFlehI0cit3Yq/MqRNr4EydbX1nuYFckLml5X2cTV8HjYvPc=
X-Received: by 2002:a17:902:7044:b0:14e:e1b1:bb0e with SMTP id
 h4-20020a170902704400b0014ee1b1bb0emr22498860plt.65.1646832162896; Wed, 09
 Mar 2022 05:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20220309073637.3591-1-rex-bc.chen@mediatek.com>
In-Reply-To: <20220309073637.3591-1-rex-bc.chen@mediatek.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 9 Mar 2022 14:22:31 +0100
Message-ID: <CAG3jFysXP3vs0uWAykQHckE1KBZr6PfE990mOny-6n=AHP2zHA@mail.gmail.com>
Subject: Re: [RESEND V11 0/3] force hsa hbp hfp packets multiple of lanenum to
 avoid screen shift
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, chunkuang.hu@kernel.org, 
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, andrzej.hajda@intel.com, 
 narmstrong@baylibre.com, xji@analogixsemi.com, jitao.shi@mediatek.com, 
 xinlei.lee@mediatek.com, khilman@baylibre.com, 
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_052244_740434_825FDAFB 
X-CRM114-Status: GOOD (  13.24  )
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

On Wed, 9 Mar 2022 at 08:36, Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> Resend v11:
>  - Resend this series for reviewing.
>  - Rebase to 5.17-rc7.
>
> Changes since v10:
>  - Rebase to 5.17-rc3.
>  - Add more maintainers.
>
> Changes since v9:
>  - Change description of "MIPI_DSI_HS_PKT_END_ALIGNED".
>  - Use mode_flags directly instead of another variable on patch [2/3].
>  - Add explanation of implementation in mtk_dsi.c on commit message of [2/3].
>
> Changes since v8:
>  - Use mode_flags to control this limitation instead of "hs_packet_end_aligned".
>  - Add new bit definition "MIPI_DSI_HS_PKT_END_ALIGNED" for mode_flags.
>
> Changes since v7:
>  - Rebase to kernel 5.16
>  - Add tags of reviewed-by and acked-by.
>  - Add detailed commit message for flag "hs_packet_end_aligned" in DSI common driver.
>
> Changes since v6:
>  - Add "bool hs_packet_end_aligned" in "struct mipi_dsi_device" to control the dsi aligned.
>  - Config the "hs_packet_end_aligned" in ANX7725 .attach().
>
> Changes since v5:
>  - Search the anx7625 compatible as flag to control dsi output aligned.
>
> Changes since v4:
>  - Move "dt-bindings: drm/bridge: anx7625: add force_dsi_end_without_null" before
>    "drm/mediatek: force hsa hbp hfp packets multiple of lanenum to avoid".
>  - Retitle "dt-bindings: drm/bridge: anx7625: add force_dsi_end_without_null".
>
> Rex-BC Chen (3):
>   drm/dsi: transfer DSI HS packets ending at the same time
>   drm/mediatek: implement the DSI HS packets aligned
>   drm/bridge: anx7625: config hs packets end aligned to avoid screen
>     shift
>
>  drivers/gpu/drm/bridge/analogix/anx7625.c |  3 ++-
>  drivers/gpu/drm/mediatek/mtk_dsi.c        | 12 ++++++++++++
>  include/drm/drm_mipi_dsi.h                |  2 ++
>  3 files changed, 16 insertions(+), 1 deletion(-)
>
> --
> 2.18.0
>

Applied to drm-misc-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
