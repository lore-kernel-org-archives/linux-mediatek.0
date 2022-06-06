Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBE1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 14:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K+EHf3keKbvkCsEORj0mp8wkKh5oodSH04Et9tcauMg=; b=BTMoney1l78P/W
	JS+aAVt2Kl+DTD5L+PTxn/6IDcgatQhMBfqZg2CNGlwLaoLOXewENwepZGpDgz00YhN3B8FYq+/in
	A1Ah4n+hintN9/2XEvHOe8tVNA4ykCW2AzW9xtte8QPKV1Kddh63sSdyQC5Ft6hlGT/vHkfCMM2dq
	uJ2t40FDrtku+WgynVcb1JrWMpR+uierqNiqrz21bz9OY1e+nHGAbwZdbP3i/O+kZzyhergeWFntJ
	OOTALwUsWlG18eEiucIgxQVvMsu5JYyTvrGkv8/g1nyWmkaJM61GdsYvPkAijoeXSSQ3WQj6enxkk
	fbR7nkyF7CYOW8WXMTag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDlM-001WkA-12; Mon, 06 Jun 2022 14:31:24 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDlI-001WgP-9G
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 14:31:22 +0000
Received: by mail-ej1-x62b.google.com with SMTP id fu3so27839503ejc.7
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H9gSJdumX788ea5ymBPhF6Qx4oKS3kXqxz2HGbJIL4Q=;
        b=NDhxYiHFP2DQ/Hg/9TucNlDLLMsU/ntXpeN0g2X8O+A2BUihfdLVBLLH7RWDprBeHQ
         YwaJrLW49qHLVTYYoKNvynnJ3jb79kiSyxeSMy2uxFQjXwG+gVg48vktfIa85w7hKfQ1
         g4jx4e8LsxUAl7JSRLIBkVIW6BW0V9jVja/Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H9gSJdumX788ea5ymBPhF6Qx4oKS3kXqxz2HGbJIL4Q=;
        b=7lMUkCtsbyo3kdTduZNqL3BM17pJsusYjtOALHduHy9jC1b0aMCdYVmvV0E520totx
         XixkvNaam4h4cXQsuOnPKFDQ2gZJY1IEywmeUN8noAucwNxdJegX35j232oYLd4JRZwG
         NAXoCFxO4Fc3DSNJgUFczSv1HSsOKHy4l6wA+UUCDNja3+IgBPNdmMdQU3JTEXHybhN+
         BVE3EP+IFRJvlvniIUPnL+k/CInSU+C2jigPhDw/I/IxrKEpF6CDOoj5eUU7uFpU9lg1
         RWvh7mgpctxJp9jV051DTebcQrOltC6nvOvWf1r0N8CQU6twP3jUZYojSqKyCxcF9p0b
         7fig==
X-Gm-Message-State: AOAM530lYgcycozhw4cOxgQ74dajxMJo7lFg0+oL0q1R3Fw1Xm77iICm
	IsXmX6SFDT6Y5zF49fc9pctgl58IVMnUYQOSuxQ=
X-Google-Smtp-Source: ABdhPJwhTCAag9C/WnMAycVRh2frkN7/FqiXEe9vFfjEdXbs+o/RVWU7N1X+cfb2dmv8pdCE3PUDGQ==
X-Received: by 2002:a17:907:a064:b0:711:c819:3cbf with SMTP id ia4-20020a170907a06400b00711c8193cbfmr7141404ejc.460.1654525872814;
        Mon, 06 Jun 2022 07:31:12 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id q2-20020a17090609a200b006f3ef214e63sm6408394eje.201.2022.06.06.07.31.12
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 07:31:12 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id q15so12078672wrc.11
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 07:31:12 -0700 (PDT)
X-Received: by 2002:a05:6000:1685:b0:218:45f0:5be6 with SMTP id
 y5-20020a056000168500b0021845f05be6mr2533347wrd.301.1654525406801; Mon, 06
 Jun 2022 07:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org> <20220606044720.945964-8-hsinyi@chromium.org>
In-Reply-To: <20220606044720.945964-8-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 07:23:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7EiaYgzr57geyeqEafLJ67G2PJa8ejZwgWNV+icD0RQ@mail.gmail.com>
Message-ID: <CAD=FV=V7EiaYgzr57geyeqEafLJ67G2PJa8ejZwgWNV+icD0RQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] drm/panel: elida-kd35t133: Implement
 .get_orientation callback
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Rob Clark <robdclark@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_073120_387314_0D26877F 
X-CRM114-Status: GOOD (  10.89  )
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

Hi,

On Sun, Jun 5, 2022 at 9:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> v2->v3: add comments for notice.
> ---
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
