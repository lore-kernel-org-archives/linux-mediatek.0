Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17764C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 10:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGrUsGmEyzfhhFC6yht8UK4tIhUB5L2Yyj7VtUSkBjg=; b=DT9MytYNzOvmWA/pHjShXmDqkz
	zYM20IFka2jzR+ZctPtWjrnHEYmJDWrDpihb4SGKb0sFyowH+DelbQCoE/EleygzooII9c1qkGaye
	r75Cn3P/LXDq4a3hpTLWNwc6Fv28yr86r4Ihvmd7Ql93DWCuSD3GGq+rd9XTnD48PkSRLoWjwEPw2
	mS1cj3qHaMrjufndjYDbHmiwwmpYSG6NFHtLq4c6xVpLmsuBwqAUGHL0nh6BF4gyF+MAtQE8SSJNe
	CL8B98CqchQAt6rtG6H8wFPmYIyyVsCgYQsX1e5qiZtDr6MzNdZaOSKxW00OnHqNxWKCerfFSmSvw
	x33TxHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDNyz-00CSEi-JG; Mon, 18 Jul 2022 10:28:09 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDNym-00CS8D-ER
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 10:27:58 +0000
Received: by mail-ej1-x633.google.com with SMTP id mf4so20373349ejc.3
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Jul 2022 03:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aGrUsGmEyzfhhFC6yht8UK4tIhUB5L2Yyj7VtUSkBjg=;
        b=O1fWCAkBCBjaVHiCup0ZmH/N0dZjjnk8aMiNo1KKm0RxB6jzXedELhA6uI/knC6r9L
         0MKPBFWRTYiA27OzzbGTrKW+tNpF/1xlJz1QmqJyJrDjwKgNxl8GGghjaa/y8/vj8LfV
         MQhg462eUZuNrg68b5LDq+awrYHNUF70ZvgFSJL23xr+/54PP0W/0CfAKWPm/vBaDm5P
         N3/+gCpP8BDS4q9hT3D/nnz+aOW20DH+MJ/qUK1BoSPXricdeu0/a8nlDMAw/8t5nHBq
         b2RuCbmDv19ABez4bnNHBHaPetb4YrpuhtTXsu8pFGwuStJngTetANyB+kLSO+C6FjBa
         hhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aGrUsGmEyzfhhFC6yht8UK4tIhUB5L2Yyj7VtUSkBjg=;
        b=cKnQBDsUb3Xl3OK652bxXmCrZxYGLX2qfRy986MPWSfMXV7iatpZn00dmtLpTXDfhp
         EJFvP0EiUcJBhCJWz/Vr9pcxhn09IPSgdXXExsGHjc6nX9f5Ob0nK51Z9FwciW6iapyg
         SLpQYojkMX2JbGSij/IarnyrGq7XFkvWxsxolsHOZspqxdD1vapSi2ES6I9zpmcuapns
         LFLch8HbX/iiP8EMu7BxavlDQIieklZGiZKZeMAAZw8GuSnCbsfdD63xIk3pYIdtvY8y
         ugexHPmpYZSUvIJtf5vcn38As1uF/hAZ3IqogoEFTg9tg1L2sSFdfKFNpVBg0lmwLsiX
         OLIw==
X-Gm-Message-State: AJIora/wWv4aGlySSZml9P/+SMdbSADSgYNPR+pTu/GiPsEQSw1fLrRK
	BIHVZ8HPomkCN/s+Z7nlR9GccJtdZTr76xO0Kp9MBA==
X-Google-Smtp-Source: AGRyM1u8XN9HbZjR0yF63PO6LoPm+22MOk00Hd+2NOztBbWpmbYZ5KNQImOwAhfM8IGdUgjC9z/6Om+NlLM6ztosZFU=
X-Received: by 2002:a17:907:96a4:b0:72b:647e:30fd with SMTP id
 hd36-20020a17090796a400b0072b647e30fdmr24418029ejc.723.1658140072536; Mon, 18
 Jul 2022 03:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-5-sam@ravnborg.org>
In-Reply-To: <20220717175801.78668-5-sam@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 18 Jul 2022 11:27:37 +0100
Message-ID: <CAPY8ntB2gXoUbUJhDLWVX3szaEKKKhnOO-qsKRZkMp1jDOt0Qg@mail.gmail.com>
Subject: Re: [PATCH v1 12/12] drm/todo: Add bridge related todo items
To: Sam Ravnborg <sam@ravnborg.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, David Airlie <airlied@linux.ie>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Philip Chen <philipchen@chromium.org>, linux-renesas-soc@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Cai Huoqing <cai.huoqing@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_032756_492455_3CD99563 
X-CRM114-Status: GOOD (  18.82  )
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

Hi Sam

On Sun, 17 Jul 2022 at 18:58, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Add todo in the hope someone will help updating the bridge drivers.
>
> v2:
>   - Updated descriptions in todo.rst
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  Documentation/gpu/todo.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 10bfb50908d1..fbcc232e0bc1 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -480,6 +480,26 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
>
>  Level: Starter
>
> +Drop use of deprecated operations in bridge drivers
> +--------------------------------------------------
> +
> +&struct drm_bridge_funcs contains a number of deprecated operations
> +which can be replaced by the atomic variants.
> +
> +The following is more or less 1:1 replacements with the arguments
> +and names adjusted:
> +* pre_enable => atomic_pre_enable
> +* enable => atomic_enable
> +* disable => atomic_disable
> +* post_disable => atomic_post_disable
> +
> +* mode_set is no longer required and the implementation shall be merged
> +  with atomic_enable.

The dw-mipi-dsi and msm DSI host controller bridge drivers are
currently relying on mode_set as a convenient hook to power up the DSI
host prior to pre_enable of the bridge chain. Removing it is therefore
going to break those.

There is a proposed mechanism to allow for the removal of this hack
[1], but it's still waiting on R-B tags and/or discussion from bridge
maintainers (gentle nudge as you are one of those maintainers).

And do you mean merge with atomic_enable, or merge with
atomic_pre_enable? atomic_pre_enable would be more applicable for
almost all the bridges I'm aware of as they want to be configured
before video starts.

Cheers,
  Dave

[1] https://lists.freedesktop.org/archives/dri-devel/2022-March/345466.html

> +Contact: bridge maintainers, Sam Ravnborg <sam@ravnborg.org>,
> +         Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +Level: Beginner or intermediate (depending on the driver)
>
>  Core refactorings
>  =================
> --
> 2.34.1
>

