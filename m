Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F5AC54EBC
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 19:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0mrhoty+Ut/5gp43tpMbErT7DWwGt+4GLr6GpRkjbQ=; b=NcpfGMtaJCrjx50UVT+DyM2ivx
	yGRdvBzrjZmt/9DN3ut4qUgvuV2FN7LEx5GfmbnPW8LjQe19a2Oc+HKpJZDb7Fddb1InsWYFdW+3Q
	yF3cVqdGrCcjQF1eGMi+llZ/hEB6F9HV/mmFS0A/nSOi0QmQHY1roBk7VfU/AoDvGYF9z6sYGCGz6
	KzcHFo0K2HJLTL8g6y96eNQFqD9jG6h+e54clkvCO/dsRtCtuYX3O5VLd+AKFGDyK7u2611STVRXT
	1POtPbNfOJnP8NHGZwFc+QW9IvX/qgpeF/cljzbljTnhKyokmj4X5+nFUr0DB+y5VnZKSFpu0QfFn
	jvqC06zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFKJj-008IX7-Cj; Tue, 10 Jan 2023 19:29:51 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFKJg-008IUE-A5
	for linux-mediatek@lists.infradead.org; Tue, 10 Jan 2023 19:29:49 +0000
Received: by mail-lj1-x22e.google.com with SMTP id x37so13644197ljq.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jan 2023 11:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0mrhoty+Ut/5gp43tpMbErT7DWwGt+4GLr6GpRkjbQ=;
        b=i1+w0zA7s1qv8jt4zUE+emrBPpmeSdaUBPz0yCFo1nbNg9YBG5C9AAvS4RNrL0co/Y
         dqSyexwdFchejaYEPv5Wfg4lBoPaVxUCnM4E9fys7J60ul6YlINQL+lxBN5cjLvLT7fy
         V1Xpg8rHHMcctUni8OS7+vepJW4M0IZKby69k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0mrhoty+Ut/5gp43tpMbErT7DWwGt+4GLr6GpRkjbQ=;
        b=bjR5F7z8npCBiQV/xwvNGYGOQwngbq/VZGghy6B/HQNP3BSaqZvXurQqB/tPluXn9Q
         PIlLAkfGM/WIYCfBeefal/MGmzUj7xTeI0NRt2uUfdwTmg/w+khZTeJvCBo3FqUr/WFO
         h1INEN8XwKvK6xvbrLnsEEjNxCuXnAifTXTIO1S+LXC2iwAna9f7Ogjx2lfd8NCRhSl5
         B0II7H5JbSRt6KqG0TRvyRFp9pgSq3rF/FhNYm00eP3Xdo8YumSt3bXr6UyzgNZ+Z8B3
         O1A/uy+SKO4pbQshzeYPld8vkcgXhnRLysRibW8el07TGyu7WvXnEj8Mfzfp+9u5YOm2
         wEHg==
X-Gm-Message-State: AFqh2kpFU31CGXCC3txsANKQAa6CaNZZSgnxJMvCFocKFP7+LP584ydL
	9JvbZtvIY7xl0CZ13++0RYGSVZPS3EsBORvu/9SOJA==
X-Google-Smtp-Source: AMrXdXvM2MfqylLeD7zuAdCzxczA9kWaE3YYfn4AhNYhK9aWSE+eYRCCCjZP2dMjqs5j2772EMlAYv4Eqh5jwd26EBI=
X-Received: by 2002:a2e:2ac4:0:b0:27f:cc03:496a with SMTP id
 q187-20020a2e2ac4000000b0027fcc03496amr3837868ljq.359.1673378982518; Tue, 10
 Jan 2023 11:29:42 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Jan 2023 11:29:41 -0800
MIME-Version: 1.0
In-Reply-To: <Y7nV+aeFiq5aD0xU@ravnborg.org>
References: <20230106030108.2542081-1-swboyd@chromium.org> <Y7nV+aeFiq5aD0xU@ravnborg.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 10 Jan 2023 11:29:41 -0800
Message-ID: <CAE-0n50QOv_+j1Pe19xKj4Cx2Y5_Ak5Kt68UBJuZt10D-jQ44g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed
 during disable
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	yangcong <yangcong5@huaqin.corp-partner.google.com>, 
	Douglas Anderson <dianders@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>, 
	Rob Clark <robdclark@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_112948_404933_C47FBDDE 
X-CRM114-Status: GOOD (  26.63  )
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

Quoting Sam Ravnborg (2023-01-07 12:28:41)
> On Thu, Jan 05, 2023 at 07:01:08PM -0800, Stephen Boyd wrote:
> > The unprepare sequence has started to fail after moving to panel bridge
> > code in the msm drm driver (commit 007ac0262b0d ("drm/msm/dsi: switch to
> > DRM_PANEL_BRIDGE")). You'll see messages like this in the kernel logs:
> >
> >    panel-boe-tv101wum-nl6 ae94000.dsi.0: failed to set panel off: -22
> >
> > This is because boe_panel_enter_sleep_mode() needs an operating DSI link
> > to set the panel into sleep mode. Performing those writes in the
> > unprepare phase of bridge ops is too late, because the link has already
> > been torn down by the DSI controller in post_disable, i.e. the PHY has
> > been disabled, etc. See dsi_mgr_bridge_post_disable() for more details
> > on the DSI .
> >
> > Split the unprepare function into a disable part and an unprepare part.
> > For now, just the DSI writes to enter sleep mode are put in the disable
> > function. This fixes the panel off routine and keeps the panel happy.
> >
> > My Wormdingler has an integrated touchscreen that stops responding to
> > touch if the panel is only half disabled too. This patch fixes it. And
> > finally, this saves power when the screen is off because without this
> > fix the regulators for the panel are left enabled when nothing is being
> > displayed on the screen.
>
> The pattern we use in several (but not all) panel drivers are that
> errors in unprepare/disable are logged but the function do not skip
> the remainder of the function. This is to avoid that we do not disable
> power supplies etc.

Ah that would have made it so I didn't see a problem. But I wonder if
the panel gets borked if you don't disable it via DSI writes before
yanking the power?

>
> For this case we could ask ourself if the display needs to enter sleep
> mode right before we disable the regulator. But if the regulator is
> fixed, so the disable has no effect, this seems OK.

What do you mean by fixed?

>
> Please fix the unprepare to not jump out early, on top of or together
> with the other fix.

After this patch the unprepare only bails out early if the bool
'prepared' flag isn't set. Are you suggesting to get rid of that flag
and unconditionally disable the regulators? Is it possible for the
unprepare to be called multiple times without a balanced call to
prepare?

