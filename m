Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F1EC4452F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 03:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phLMwCnRovNBL2FCZmS9hb02QIovvFlxaoITzfa1zfE=; b=zH5LirGykYUxKLKlwyd1VL20+o
	rMoB93aZ60luU176/CEuSJIAX41xamSoq3qaTPV/hb2PW3C+Hww8nNCP0r+n/mxNrElPeFrSCV2Ea
	TfM/kCbiXT1URLHWrnBi0YaJj0LJ0jMd9ncpwEVDDKrdds6b+P39gBK1y49Gh/7M2a4MiE94/aaqz
	NLcbiM0hFdr+Uw7ffkCfqnxoH3IbY5Ml0wuN5Kod2/1XlJBUwlGOy5QOqneQuFv3pM004N/ckRV0u
	1AMtqEArgZrsgQ4Mhuyz+FYo7O4KFPZ8opcniQuS2rNUOOAqOq9D0Tn82e8viTF3FO8aVCzG+UcJI
	PshF80ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0sE-00000008Ine-2Gd2;
	Tue, 21 Jul 2026 03:10:26 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0sB-00000008In9-2CA5
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 03:10:25 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-81e6f2ee60bso34080917b3.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 20:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784603422; cv=none;
        d=google.com; s=arc-20260327;
        b=a+b9xT5cwCBBD9emEYpNmadS8t68dpFuKb3bOcRtn+xVepvuCa9wJocXSLtG5kjCWX
         7fsT89JAA1xl20ivNhyC+dTUeRCcZyz3vaD6oH913m5GwE49pDrFJurFEXSufGIYsS/m
         pwkXDlTtjqXc96MojPZSblCtf1hx35Jn0bjIFV/vRQscgBYatyVVIuqYdS5xqBCykeM8
         pWAutijHRCblOIozw0NzmJZqGWZtSFc+JLebk2uXLD4nNxO50MkjRGighLKJqn08Fria
         /sdq2OX3b0F9toi1ZcxQAypM/kf/F8kvBjjC9lkVYasUQkDO3b6sC/GHaXa9GR+SCle2
         sMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=phLMwCnRovNBL2FCZmS9hb02QIovvFlxaoITzfa1zfE=;
        fh=gVDOoVr2FtEHeGoeJZctNN07XqnhE5uHxzqmER4fnwA=;
        b=ppN9WBYBZrXgWVwVuQxfiUw1H/uUkjf/BwqBWtD8AcfwmBEiFLGP3DmeKaNlrFrk0m
         TkkfbIZTlVrQxBdsrPRd5KlZXfOEyXEIE0CHBzHoCqzSQPibKq6KqaIf/lRIeov71sN2
         XvbITiil/PNXtb1U27BtbIzxG+i3GI81ZPqPXunr5gJBd2whlIjGROWXaEds3YWr4Dj6
         +5MEv5u6eUpvF76urNxcgLMTPzSQ++sSldjd61B1BfMNptLGoZf0jdvC5sV85LVbG2Bn
         ic/dQRMY0QX0ls5OGjVXSiKj5xjbRPeXm4rjIMXTTb4qJmgB+MijFOHRX/5UueRwTe1A
         cWSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784603422; x=1785208222; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=phLMwCnRovNBL2FCZmS9hb02QIovvFlxaoITzfa1zfE=;
        b=Rxcl2Aae6XF7NuMwvmDiYELH8N+N8c6QVQU2nL2hXI+xKHCDz3FqE6CXpVhxPy6rXc
         JcIP/10bNAZxJmasznVJyS1zSl6Hke3nqUa2H3jaalS6RRMPoWJfJ8V+GeCcxyGF+D7f
         9YzLATA6wx7XihM9MnAGh4kqxao514PX3w7GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784603422; x=1785208222;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phLMwCnRovNBL2FCZmS9hb02QIovvFlxaoITzfa1zfE=;
        b=VUEDtqtRLlpANGKUM+kskcxjnKCnHip1HfHHVX1M2HtpXezTXQoPf1KVVSsSgmAryP
         H6FSTRk4s8fcfgQkEGnfoClMYTShsYRBVhmyiS0wPV+ipXca2g6DJJlmBXfhVfs4CJYC
         nHjdlaBwy7fUh23CwIfEtlaFvesfuFUBPxgU75pThsk7dNs9ugjjuszP2OX0z/tAgziR
         PvbmUdqAwRMCcUeJ2YWb1xBW8P6CCV/PLkRIMpFG7vzY2CfxxMS5pY+/XhO1epRzwdTJ
         f3WjZeouqDzP5IX7qOQCf50Ep+0Prc+dHfb/77zWBVCITYQpL2LYozn80oaOsaOkL8+S
         FBEA==
X-Forwarded-Encrypted: i=1; AHgh+RoHJCEABfDBCLiquT7VFGMHbHZzsBYFwRviU7247Qly48kDTI2kZOTNH5bEtO8R8C9OlJ5pzHViLUim+P6oOw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9h3qpkzPy40HvvZzjzAlxk7QkA+eDpk/Qs88asqQXJqggFMiU
	x0XCuNaiVUwLMNdqwz07ZX0uxnNFqjbanRt+nbq6O02dvhTa9Y1F34vPJftg+GPZ1BZu8rsUZyy
	kleKpBaKu5pRqPzu+HjhJjZGSBWP0J50v0EJQGs+j
X-Gm-Gg: AR+sD10utWM9KuDQoL72UIG5G2y79W9XWfrI0k1jO2GAKEMq4FVUKv656GQ4TSfxWtM
	ZRDPrxD8deHGddXvMha0VbECNSRTux+JJmjE0nKmiDjyNlGFaV4dPtLJnxThepHUfzoz3zESOHd
	RrMRLRuoJRvzn1nOkVDemysKziZyn6iqPP7yWeO+Nh3MJY2ubDuuLJsUK3etOLoFHlGhJBzVjm9
	qfEHCF1Ovx1SiHZP5+6TUlrCvIy1R3CoOEIrtvoOg3v741WT8fLphWdW7dXRoND/j0JOeQtJgwZ
	ZG+2w8WDh+ifnNXg
X-Received: by 2002:a05:690c:e1c3:10b0:81e:f57f:1f8f with SMTP id
 00721157ae682-81ef57f23cemr34445977b3.6.1784603422238; Mon, 20 Jul 2026
 20:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1784600387.git.daniel@makrotopia.org> <91b40322b07b967fcf286b3e4bd11e5f821bff1c.1784600387.git.daniel@makrotopia.org>
 <20260721024147.2FEE71F000E9@smtp.kernel.org>
In-Reply-To: <20260721024147.2FEE71F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Jul 2026 11:10:11 +0800
X-Gm-Features: AUfX_mx4qcPgLK3orBZOGVBUCGLkc4lvsRzCU905dlQI4f0WIMZbU3ENBGxGpF0
Message-ID: <CAGXv+5HhSyr-q-T-JxOjPv013CsNh1wtf4QxPYxQbrf1XQcaXg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/bridge: it6505: cancel outstanding work before
 teardown in remove()
To: Daniel Golle <daniel@makrotopia.org>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_201023_578459_387F338A 
X-CRM114-Status: GOOD (  28.45  )
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

Hi Daniel,

On Tue, Jul 21, 2026 at 10:41=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] Calling cancel_work_sync() on the potentially uninitialized ex=
tcon_wq triggers a WARN_ON(!work->func) kernel splat.
>
> Pre-existing issues:
> - [High] Canceling work items without first disabling their scheduling so=
urces (IRQ and extcon notifier) leaves a race window where works can be req=
ueued, leading to a use-after-free.
> --
>
> --- Patch [1]: [PATCH v3 1/4] drm/bridge: it6505: cancel outstanding work=
 before teardown in remove() ---
> commit 06b35e4209da852ce0af8e4b1dd2aec2e9e172b4
> Author: Daniel Golle <daniel@makrotopia.org>
>
> drm/bridge: it6505: cancel outstanding work before teardown in remove()
>
> This commit adds calls to cancel_work_sync() and cancel_delayed_work_sync=
()
> in it6505_i2c_remove() to ensure background works do not dereference free=
d
> memory after the device is unbound. It notes that extcon_wq might not be
> initialized, but claims a zero-allocated work_struct is safe to cancel.
>
> > cancel_work_sync() on extcon_wq is safe even
> > when it was never INIT_WORK()'d, since it6505 is zero-allocated and a
> > zeroed work_struct is reported as not pending.
>
> [Severity: Medium]
> Is this description accurate?
>
> Looking at __flush_work() in kernel/workqueue.c, the workqueue core asser=
ts
> WARN_ON(!work->func) when flushing a work item. If the DRM bridge was nev=
er
> attached, extcon_wq remains zero-allocated.
>
> During module removal, calling cancel_work_sync(&it6505->extcon_wq) will
> unconditionally call __flush_work(work, true), which immediately triggers
> the WARN_ON because the work function is NULL. On systems with panic_on_w=
arn,
> this leads to a kernel panic.

Sashiko seems to be correct here. This is going to cause a very loud
warning, which we likely don't want.

ChenYu

> > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/brid=
ge/ite-it6505.c
> > index 8ecb43611dba8..2f349aefb7054 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > @@ -3644,6 +3644,10 @@ static void it6505_i2c_remove(struct i2c_client =
*client)
> >  {
> >       struct it6505 *it6505 =3D i2c_get_clientdata(client);
> >
> > +     cancel_work_sync(&it6505->link_works);
> > +     cancel_work_sync(&it6505->hdcp_wait_ksv_list);
> > +     cancel_delayed_work_sync(&it6505->hdcp_work);
> > +     cancel_work_sync(&it6505->extcon_wq);
>
> [Severity: High]
> This is a pre-existing issue, but does this leave a race window where the=
se
> work items could be requeued?
>
> The driver uses devres for the IRQ and extcon notifier, which remain acti=
ve
> during these cancel_work_sync() calls. Furthermore, the hardware interrup=
t
> is disabled after the works are cancelled.
>
> If we look further down in it6505_i2c_remove():
>
>         ...
>         drm_bridge_remove(&it6505->bridge);
>         drm_dp_aux_unregister(&it6505->aux);
>         it6505_debugfs_remove(it6505);
>         it6505_poweroff(it6505);
>         ...
>
> The interrupt is only disabled inside it6505_poweroff(it6505). If an
> interrupt or extcon event fires immediately after the work is cancelled b=
ut
> before it6505_poweroff() and devres cleanup, won't the handler run and
> re-queue the work via schedule_work()?
>
> This could lead to a use-after-free when devres frees the it6505 structur=
e
> while the re-queued work is still pending.
>
> >       drm_bridge_remove(&it6505->bridge);
> >       drm_dp_aux_unregister(&it6505->aux);
> >       it6505_debugfs_remove(it6505);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784600387.=
git.daniel@makrotopia.org?part=3D1

