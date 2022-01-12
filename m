Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DCBC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 07:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTAGh14y6gZK0veUYOIl0FS8KOHaolLByB+XQonTWl4=; b=0lmxbLsMhfPOib
	5oxPE3stX6bRYJjHMXHumOfZlpB9cr2IixdONIf8+Tc3DPIkIj9nxlAqj8bwfKx1kjaTCB/p7/21M
	6+/F49Hb05havEvzFv7x77SMFzblR49+3fVSJdR/2xZsaA9tLs+2csqwf4O5cR8a0F5b2UEXGmPV1
	Sa/Lm77UNgw44lQxt4vApnfMOF00EjFvMFvfN1pQa2R4BmE+C01uR0k+dxhX/U7PlIQWWL5mZkfVC
	0C2IVYqVzIEAIvN6logIILlAsylF/N5y4q9ZZPkvujVKYu0Do0t3JjGQG89I0fZM0n55pVj+lyBNb
	p42xAIaDglB6Kp6iDyGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Xlk-001N73-5G; Wed, 12 Jan 2022 07:10:04 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Xlh-001N4o-BB
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 07:10:02 +0000
Received: by mail-ed1-x535.google.com with SMTP id 30so6088248edv.3
 for <linux-mediatek@lists.infradead.org>; Tue, 11 Jan 2022 23:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e4STGP8nx6rQ3ZHW8wIeGVs8uIWas7TIWKM1+FpYezU=;
 b=ZmTrP16zO40yngw5STTmjokex1CAtMdhbY5IbDWg95ESmBDwfuvdEC5gZIC0XLHbQq
 bfgwrEmfLj0d2IQI54C+C1JAlyj78bMJJummud0FLcJbPrE4Zl6LsbpBMwjyVE6xfuR3
 K6g3L5I6zaIlVB2Ra+IYGW+ZsHGdG81aLKjPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e4STGP8nx6rQ3ZHW8wIeGVs8uIWas7TIWKM1+FpYezU=;
 b=L92b3vIEZSneeQ1jdw00B2SSf9bKaxLqgzDae4fzNVZhHF10oQDdkENhpf1pblP7oS
 fCfzYdphP5hiAiGiuxl4a9BlV9Dm23CwsCeWdeo7sh//oTVYXfYro82v1NJLKDRpIRlw
 ZtFnKk9Yk9dcZ4UL8bWD+lEnhkNafrf4XXsUg9uDFFOzztt+rdng6mLQaRNvxRorRtAF
 9NAVQ/NRo3MRYJXKLgpf3WKVu7LieLYFCQoAbtGUilHETWUEG24OZHDCK3wHDkt8JSvD
 L8d3OKMCmxRpg+5YsDhztM+gm97pTHanQ4M1aWTKHj3h3fGzMJopW//dQbcqVAeuekiB
 p9Qw==
X-Gm-Message-State: AOAM531CX2JADFLC+Y+dXKQAVQixuJLhE/IpkehXlYOaZfXK2vIjL8Kb
 Y8IKfPhOvKrwJRiouSXqmE0VX1svYOmtPC+M/yWBBQ==
X-Google-Smtp-Source: ABdhPJyn8pZbZiDsgDpS9epZmGHtoPwtrHVrQnpxg/IvMYAfsCnSw98pwWo/FbDisciefPKFkzl0TWCxn/Uv0enkwI4=
X-Received: by 2002:a17:907:3d8e:: with SMTP id
 he14mr6365432ejc.167.1641971397535; 
 Tue, 11 Jan 2022 23:09:57 -0800 (PST)
MIME-Version: 1.0
References: <20220104095954.10313-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220104095954.10313-1-angelogioacchino.delregno@collabora.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 12 Jan 2022 12:39:46 +0530
Message-ID: <CAMty3ZAojTyw3H8VprH9aiyTyWjeL8oqPxNNr=J33_5FrcUj9Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_231001_461010_1FB845E2 
X-CRM114-Status: GOOD (  15.82  )
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

On Tue, Jan 4, 2022 at 3:30 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> DRM bridge drivers are now attaching their DSI device at probe time,
> which requires us to register our DSI host in order to let the bridge
> to probe: this recently started producing an endless -EPROBE_DEFER
> loop on some machines that are using external bridges, like the
> parade-ps8640, found on the ACER Chromebook R13.
>
> Now that the DSI hosts/devices probe sequence is documented, we can
> do adjustments to the mtk_dsi driver as to both fix now and make sure
> to avoid this situation in the future: for this, following what is
> documented in drm_bridge.c, move the mtk_dsi component_add() to the
> mtk_dsi_ops.attach callback and delete it in the detach callback;
> keeping in mind that we are registering a drm_bridge for our DSI,
> which is only used/attached if the DSI Host is bound, it wouldn't
> make sense to keep adding our bridge at probe time (as it would
> be useless to have it if mtk_dsi_ops.attach() fails!), so also move
> that one to the dsi host attach function (and remove it in detach).
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---

Eventually I've observed similar issue on other Component based DSI
controllers, hence

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
