Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB41C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 18:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39BPbN0smWcDZ2lm4R39HPEK2re9Dz2vc9CevX7LcLA=; b=fOOYmQyeuHMASPJyxyO7VV7Ko8
	PUysp+jzmvLGKeVaMlbngsTvwAHqBLiBN2xhoMaSGmzklSiG4m0ufrr72TSCnDitMvAECls9jIjX3
	+0j0mNZewuHznzW+/C7CHgad9I1ZfbLVBEAFzE/vVXQ8jcQFPLNLJGjpmL2+fZ/omGDTvS2QRW4cG
	LFFnIWMpwAvNeXnzR9RbTzy4H0WpLtK98/h0QjYfoRBcnAFMZyhcEzn/qQDm3fMRFAIOf6aZJluc8
	XpwXyymUW/wz+PusY1nGHkWELLg+XMs4vJJDrRHw04+AE5NHdiykTRPy7ypyZXfBQdwFRo2VeOyaa
	mmA2vSGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeo7-00H1J5-2u; Thu, 02 Feb 2023 18:59:39 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeo3-00H1Hv-Pm
	for linux-mediatek@lists.infradead.org; Thu, 02 Feb 2023 18:59:37 +0000
Received: by mail-pj1-x1032.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so2118489pjp.0
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 10:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=39BPbN0smWcDZ2lm4R39HPEK2re9Dz2vc9CevX7LcLA=;
        b=bEOFscDKsWeiSBzpi36ddl+0X9WUI1rBgKUP+gIgKte2yJuqBAuN61dsDtqnG5RbT4
         FY6so8Ax0l9cznfL7eX6g5uh89Zde819T1dwcvySrLxT8B/INbxsz6tNRRjtNnPtZbnE
         0eW0N4yMVRoYa0O7j8OK7FvIc4+XUfyZ1Ty54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39BPbN0smWcDZ2lm4R39HPEK2re9Dz2vc9CevX7LcLA=;
        b=Mlvrse/c3e7ujTHknVyhQhQUtBNFP3odJgyjxSngzCNv5y7J6iwLu3u0cTokZd7xO3
         E9NuWf/YDu4RHjOKh/k9JCDWFCM80MuzqTJmVR5vh7gVlT7teUJFb5vX0K60lftdKepz
         LVSuQ59tGAye3iXJ8l5F+hYK/aco5k0oZCMLJRR/C8emk8nmCmxHu6awyvD9UlfXXlcw
         HXCXPKDgcuEaDfwE5SY3yic85bmjxcTHO3R+WFPlht7vOAtIRPd6iO8TaWfKCxS+V/NT
         pe/e9DcRSA14/MwWm+YbfxFas+/DjeaqiCUPzIpFtY663WqPiI6S84JVP1dGQ2DKryF1
         25Gw==
X-Gm-Message-State: AO0yUKW0f9o/f7ZbX2okNici6rDrBfi+XgqNVdE3wYKpq4t9xj8ZEj3R
	8qWjgntXKYwja3PTDcrmj7NAlIkIrxe4Z+AqQ8HWUugIZGwkdQ==
X-Google-Smtp-Source: AK7set97b7VPGw7HhJiw6iQIHN0soW6YLRSRHIPLLIiJZM1ui9C2RKGR/kE/k35IIF810Iiq7vn4cCqX9gGHHGnP0XE=
X-Received: by 2002:a17:90b:2342:b0:22b:fbc3:d3b1 with SMTP id
 ms2-20020a17090b234200b0022bfbc3d3b1mr795288pjb.102.1675364372222; Thu, 02
 Feb 2023 10:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20230201170210.1253505-1-greenjustin@chromium.org>
 <20230201170210.1253505-2-greenjustin@chromium.org> <e96bd735-cf36-0dbd-cf93-446c1ab28778@gmail.com>
In-Reply-To: <e96bd735-cf36-0dbd-cf93-446c1ab28778@gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Thu, 2 Feb 2023 13:59:21 -0500
Message-ID: <CAHC42Rf8+yS45VBUc_dDuvCydg4ttKYuGwdgFshZRUZWzGiXRQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/mediatek: Refactor pixel format logic
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch, 
	daniel@fooishbar.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_105935_872450_08CBD8BA 
X-CRM114-Status: GOOD (  11.57  )
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

Hi Matthias,

> mt8173_formats are the same as the old struct formats. Maybe we should use that
> and only overwrite where we actually use a different array.
I think this was sort of how the original patch worked, but we wanted
to add some flexibility to allow different components to support
different formats. In patch 3 of the series, we actually overwrite
this field with mt8195_formats.

> Why can't we use ARRAY_SIZE(formats) here like we did before?
I think ARRAY_SIZE is just a macro for getting the length of
statically allocated arrays. Because we won't know until runtime which
list of pixel formats we will be using, I'm not sure we can use that
in this circumstance?

Regards,
Justin

