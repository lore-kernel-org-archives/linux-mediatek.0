Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1056C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 18:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Na6xMADEzYhZzXrlHJxxzhXM5YRKt3/PwZV0GUrKKGc=; b=Yl6Iacma/qRZD/GWuxHewtvVb3
	xaT3RHOp+i4T6HnFrDxDnikC7zB6zirgQPF+xtjoERPKtMi8M4A4g0FS7HTEx61zn1Bqaq2dvBKWR
	6pJDkSgpFU4B0pECQLFt7XWru9SaGmeSFRfmuqyT242NbgqjNGiPlD2FRMOyVIlq4siNManfeB+EQ
	+Erj1a1IjiJAZzRZ8G6+AjikeaycnRpLwJhEd14b8tNnE3HX347CWInZV7luRsd35pTQQhahosMJO
	3UTGGHaPP7zmLyBDqkbtgoSZx8Y/5fC1U8N95kADHZhl/uiE10TnK6CAJSsLTsGUBeIJvfMA3sfrp
	hXwS/Xbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pID7A-002IRd-EP; Wed, 18 Jan 2023 18:24:48 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pID76-002IOk-9j
	for linux-mediatek@lists.infradead.org; Wed, 18 Jan 2023 18:24:46 +0000
Received: by mail-lf1-x136.google.com with SMTP id a11so12815528lfg.0
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Jan 2023 10:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Na6xMADEzYhZzXrlHJxxzhXM5YRKt3/PwZV0GUrKKGc=;
        b=FtbWDIbw43u/20f6aUHdQZhGNF5q7hwzxM44DWYHHZguw4CyS+ovFhwIGEtmOHfbj9
         I94uNKk6/UXOxgfSZKCPkOSVywK307UXAxAhrHPaBiplbKj8UD7F85O5zsEjYiafZ4eP
         vTQhrJ/8od1gBb2UvbLmF2hi3hTlYVOQ84Jp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Na6xMADEzYhZzXrlHJxxzhXM5YRKt3/PwZV0GUrKKGc=;
        b=7Vve7KQ6wGbaU3eoRYDNOWoQ7GIloWaBaQiTtZo7OJIAbCupT4jtD8HJvXtHldcsBJ
         tlNN3Fc2ZnDOy/9TsDSKgGwtU200ClMlk+yYqQuMUFzV3m4e1q/QbF5ZRpM+ImbvQLQz
         igLFwg1bXJarno+epeAnCFrvL0Q4XjUhRMTwCLssf9Q9JoCShXeY5x/tCaLXt+GFN618
         tLJD3FpgIuz8erBwd238biDD+AARbC8g7o6LjUxzTvWWOX6ZGtP/bSv2HUVtWsKywaHC
         CBO/hSn8qFsLUjvcOoPIaaGms+AJwU56ldKQd+rrG2Hz/mWtmdD/pQ95A7nOSeW6+qR5
         eBAA==
X-Gm-Message-State: AFqh2krV2sgbCwkpPCpyw7Z/XZi48vihzNwpYrjuY9EUGdhyhLQGbgpU
	NlgQncidpeEdtAKPHsSV6KeCf9c88G0qYhC7+wC3cQ==
X-Google-Smtp-Source: AMrXdXu8H4rHNVOE2wtoG3S0Z9KJVoxXo4Da1sSK6RbMP0C1hgRXWtHRAK5N7Qtj8aQOi1yS8Qs1CTyTfwDonhSoIJg=
X-Received: by 2002:a05:6512:2114:b0:4bd:35fd:65b5 with SMTP id
 q20-20020a056512211400b004bd35fd65b5mr759204lfr.297.1674066281456; Wed, 18
 Jan 2023 10:24:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Jan 2023 12:24:40 -0600
MIME-Version: 1.0
In-Reply-To: <CAE-0n51XmyzSeKuGNn2BsJew3fK_cEHNoDpVVRqStNAF+Zzp1A@mail.gmail.com>
References: <20230106030108.2542081-1-swboyd@chromium.org> <Y7nV+aeFiq5aD0xU@ravnborg.org>
 <CAE-0n50QOv_+j1Pe19xKj4Cx2Y5_Ak5Kt68UBJuZt10D-jQ44g@mail.gmail.com>
 <Y8FwGTWeYtX0j8MX@ravnborg.org> <CAE-0n51XmyzSeKuGNn2BsJew3fK_cEHNoDpVVRqStNAF+Zzp1A@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 18 Jan 2023 12:24:40 -0600
Message-ID: <CAE-0n51HAkYAcGdsJ=0gbV7JRJSGt9cZ_vHPC3kDepa4rooyvg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230118_102444_427255_EBC6D825 
X-CRM114-Status: GOOD (  11.17  )
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

Quoting Stephen Boyd (2023-01-13 12:49:43)
> Quoting Sam Ravnborg (2023-01-13 06:52:09)
> > Hi Stephen,
> > On Tue, Jan 10, 2023 at 11:29:41AM -0800, Stephen Boyd wrote:
> > >
> > > After this patch the unprepare only bails out early if the bool
> > > 'prepared' flag isn't set.
> > OK, then everything is fine.
> >
>
> Doug pointed out that enable isn't symmetric because it doesn't do the
> DSI writes. I've updated the patch and I'll send a v2.

Turns out that splitting prepare into prepare and enable breaks the
display even more for me. For now this is the best patch I have and it
fixes the regression I see in v6.1 kernels. Can I get your Reviewed-by
on this patch?

