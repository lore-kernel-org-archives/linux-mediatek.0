Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B62AC677F1
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 21:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5E2jUOsmFLtdYppT5Vp0YBT45RVJ+ABe3kgqhVZhkI=; b=qN7B/Rk2Rcd0CGNw8GJFBZV6iU
	JRJ2sM1FNleo8oxLN+ZIP5x05HeyRCmokKkQiCljOjbGOpqD5ZETSU8plE9D3yBWxibTkh3g7xwBR
	osALEdt3n3qXx7oX7xLeONyJ40h2fSETpPLlR50P9c/E+VmDP6HnIuOfC1OWIlMRkDUwomhYfeJOG
	9IVsKWaRZQsw1iqxDOhKzEYZf0CNyQMTsnE3cG00aTp0E18901VJ3T0Vk9ejSprtoPQ9dJJr7yfjH
	BF3WnUpTe+pcJjeDXJ5fzk0Ejda59bzKrFu6WYiigBPSLkNw9PMm800ziPlOquoxkH/CFpBx5Y52l
	IAfjB/rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRLb-004UrE-Nu; Fri, 13 Jan 2023 21:12:23 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRLQ-004Uls-D9
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 21:12:14 +0000
Received: by mail-lf1-x12b.google.com with SMTP id bu8so34782430lfb.4
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Jan 2023 13:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5E2jUOsmFLtdYppT5Vp0YBT45RVJ+ABe3kgqhVZhkI=;
        b=IkJ+FOVocZ4ttJ4pEh+dqaYc1loiq1VzM4s8rw3sfw+1LDPtVXu3+QCzwNyI/P+Oz3
         Q8GtrQlQFVgEw2AwhcdO9Y+lo70CcrUxOaUVv6K3tg9hOQIlRZure7tE16OwYGB+40y7
         IkaTssjuMdbN49fZTK+WSj6EXgdB+69XdqZus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r5E2jUOsmFLtdYppT5Vp0YBT45RVJ+ABe3kgqhVZhkI=;
        b=aMZaTVes8/0iaix6pAec3Tc1Xoqzr6GytW3MUsIDO/V5RJ6qsyV2M9uVRo/724qCvx
         WCVHp41YdNgpn0sh/LWreC81f+PV2rJG4j8vyJ70kw5YhHRk6fiuSQ3E9Ch89TCUAogH
         5Sz0e7tn3FV+s+higsmk/sxaOxmlX8zW7RkYWnfSwjJbLUatPVYuGY0cr/UHGQPjiXQB
         OCVD9ZrynArvV35b2I432ZrYdd5Rc/uTd6yUqrf1uNxK91T7SK+eFfx/YTdsfkGx3MD7
         4pl6aqGg42VJRIumYpPkgyPsh1wKAGTlaGacW5P5AvatdtkkaugzTLvdOcJq5Z4Zh6Wx
         uHDw==
X-Gm-Message-State: AFqh2kr6opuTMjHdarnofpgxV3AXTV/CPTDMBXK8kfRnZppsNwFCRDm1
	0WhfinmHgVIIZYt9g+VObI9YuNMz4ME2pgrCeyXalQ==
X-Google-Smtp-Source: AMrXdXsEHDMUikQ5Emug3xW/Z4eyYFdBuE++yVRLiUqBN6JN5+W+1CZEk4riH+MmzQZSNNRp1Leh8neGlYysREAjyE0=
X-Received: by 2002:a05:6512:4017:b0:4bd:35fd:65b5 with SMTP id
 br23-20020a056512401700b004bd35fd65b5mr8207466lfb.297.1673644328511; Fri, 13
 Jan 2023 13:12:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 13 Jan 2023 15:12:07 -0600
MIME-Version: 1.0
In-Reply-To: <CAPY8ntA=Dq6GFQ3gEOm9PzPyOa9bHTr8JrpXLibnai7xKqRbpQ@mail.gmail.com>
References: <20230106030108.2542081-1-swboyd@chromium.org> <CAPY8ntA=Dq6GFQ3gEOm9PzPyOa9bHTr8JrpXLibnai7xKqRbpQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 13 Jan 2023 15:12:07 -0600
Message-ID: <CAE-0n53UFuyYvjJUWViXy9Eex2mpBRJGtt4vGc2cbFZS9i8xFw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed
 during disable
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Clark <robdclark@chromium.org>, 
	Douglas Anderson <dianders@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>, 
	yangcong <yangcong5@huaqin.corp-partner.google.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, patches@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_131212_451890_D2CB7D50 
X-CRM114-Status: GOOD (  25.76  )
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

Quoting Dave Stevenson (2023-01-13 08:27:29)
> Hi Stephen
>
> On Fri, 6 Jan 2023 at 03:01, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > The unprepare sequence has started to fail after moving to panel bridge
> > code in the msm drm driver (commit 007ac0262b0d ("drm/msm/dsi: switch t=
o
> > DRM_PANEL_BRIDGE")). You'll see messages like this in the kernel logs:
> >
> >    panel-boe-tv101wum-nl6 ae94000.dsi.0: failed to set panel off: -22
> >
> > This is because boe_panel_enter_sleep_mode() needs an operating DSI lin=
k
> > to set the panel into sleep mode. Performing those writes in the
> > unprepare phase of bridge ops is too late, because the link has already
> > been torn down by the DSI controller in post_disable, i.e. the PHY has
> > been disabled, etc. See dsi_mgr_bridge_post_disable() for more details
> > on the DSI .
> >
> > Split the unprepare function into a disable part and an unprepare part.
> > For now, just the DSI writes to enter sleep mode are put in the disable
> > function. This fixes the panel off routine and keeps the panel happy.
>
> It is documented that the mipi_dsi_host_ops transfer function should
> be called with the host in any state [1], so the host driver is
> failing there.

Thanks for the info! It says "Drivers that need the underlying device to
be powered to perform these operations will first need to make sure it=E2=
=80=99s
been properly enabled." Does that mean the panel driver needs to make
sure the underlying dsi host device is powered? The sentence is too
ambiguous for me to understand what 'drivers' and 'underlying device'
are.

>
> This sounds like the same issue I was addressing in adding the
> prepare_prev_first flag to drm_panel, and pre_enable_prev_first to
> drm_bridge via [2].
> Defining prepare_prev_first for your panel would result in the host
> pre_enable being called before the panel prepare, and therefore the
> transfer calls from boe_panel_init_dcs_cmd boe_panel_prepare won't be
> relying on the DSI host powering up early. It will also call the panel
> unprepare before the DSI host bridge post_disable is called, and
> therefore the DSI host will still be powered up and the transfer won't
> fail.
>
> Actually I've just noted the comment at [3]. [2] is that framework fix
> that means that the magic workaround isn't required, but it will
> require this panel to opt in to the ordering change.

Cool. Glad that we can clean that up with your series.

Is it wrong to split unprepare to a disable and unprepare phase? I'm not
super keen on fixing 6.1 stable kernels by opting this driver into the
ordering change. Splitting the phase into two is small and simple and
works. I suspect changing the ordering may uncover more bugs, or be a
larger task. I'd be glad to test that series[2] from you to get rid of
[3].

>
>
> [1] https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#c.mip=
i_dsi_host_ops
> [2] https://patchwork.freedesktop.org/series/100252/
> [3] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/msm/dsi=
/dsi_manager.c#L47
>

