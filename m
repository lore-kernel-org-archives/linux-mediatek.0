Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB60606A31E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 18:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N84Feku4;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=MpRiwSiz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=; b=N84Feku4nRoNgiJCOaR+FdY/Mw
	E2AjbnOWs/64qKVXXX0URO+CeTWUcfDV7Cm9IRp7TorbrZ5dLpsvpgiFp3GC+/gEUzzcJ1t2lULrM
	GSMiOAd7LoujWwl32ljITjrl4rnrMGbhOyFr2SHSwdAEV6B1mlKLu56TON8CjXk8w3Eo2Fx02hgVH
	qZ6qF5dLcFGK9m14zzmP5ujAhsjprA4wCDLCA5eUPZaGX5DkAPClOdSiu2aSoWuHPsiNz7CuprCEo
	kFeG2jB5tbt35/MTISi/Qey+YP86lggt7e0sOuuJI+Cu8fXzp8rtTV5NuAgC6Zm6CBFfUA4KOvRCE
	jOb3mAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvRA-00000007WOj-1nWq;
	Tue, 24 Nov 2026 18:40:16 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvR6-00000007WNZ-43Ww
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Nov 2026 18:40:14 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8b2382bf051so2695838b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2026 10:40:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795545612; cv=none;
        d=google.com; s=arc-20260327;
        b=b9cg5znsye09PaK40UqQ124GPol2Otk7QleRIW5T5udy/PjlwdxXhvBQZ6z5pSOtz7
         MrQUBxAmu9L/7N8q/18a5ZTmgOAoG+nRkYZqgZPK0ZUZB834ATcl8CbWR5KEfg7Hgdlj
         cJUHWvHrrtkHg/PUCofn2Lar7mgRTIQSX7jcOa7/8mJCP8GXn6vDtXNRCAC1LACZTBwQ
         cy/WKRWNNXf6Oucuf62leqK7VdNecXOi3qu7l9/gSSMwwatlaFpoKTZWCDai1zPtLThc
         H4okpsfCZSzN/6Q20ooEtHV2Dvipfuxyg/N567PBNarP3F9gcAp0d/ad0vlMjvb+7nYI
         fk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=;
        fh=V1rLhY3dwTWCLg8RuK47YdO93Wr46aDSC+h7PAvY5iQ=;
        b=QTN2S0K5diemxbak/kQlxmYxcuOVJtbhwqFNfPSqLmX57D79uTfEB7+vHqM8qXyOb4
         NfPfvl9TWJFsk/kSXmanvr1/lzsH7wPfprIY4QGPkwfg4Bwq7cXDWYec1+ZXEtQyWq3j
         rzipKDY3NB9LND6Mwg5k6S9Ay6IkYeGVXGfBUAKyHrN9ti4Qd1Cw30CKbdcLZk+8zw9t
         KIfQrmNBERvZ3QrixiRwj3rXxbsGW/Llwv1CVBr3zGmRHUAz2Q4z8vfO+8nEwh412hQs
         1iWSabMiXrAbH/KWo0NZn+U6Ec96f/hmd2cqLhfUHCfHoEwY2W281i+buPlI5heUwLku
         A0xQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795545612; x=1796150412; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=;
        b=MpRiwSizpeq5MczaxabQ0Au87n3Z29nfosQ4IGmx2b0JFCrOG41guAd1E252CfShtN
         UYk0JfAPR8HqtuMMvmY6+dLV6g785WNoMJMk3Gp1H58vb+UZpjq7IrtPdtIYpkQrw+Bp
         uS2tlPgPqJtRJ/FavVQEPVybD0RY5xTBfVctT7obr+YdaH53c06+fUrNmSOM3hFsn3Lc
         2kG7rKTPHUmV7oQsqJGO9WdP6ALOA3Rv9BfEie3CTWzH5mSj7QtpJAznAH00Gzzr7bU3
         g9JmtdhatSlQvRjfhueguSRkmhHc0AfpX8Z9VjCRK66b+lYxWI6m/k7dSmsSfiNZn4hD
         rFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795545612; x=1796150412;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=;
        b=KXbxMszhIhqTqxkdVcqEsZW0LiWYC5B36mzPrtfzGXRJxnaXQAnJXRI3X98mPZYhUP
         nOGrK5I+YFdeStqDN4vYChvKKxP1l9eixXwd9QKJ3V+dNvL1Xfx7VElvPy88AJ+LFsGG
         eEijpCXRZ0EL/Mx45EdwKuuj1qvTe003gQiKYGkTflCQzW7hEaU+JDY6qV1qU0O2Jk81
         E4V7kvwhdMPAp9Q7vsSGCffqZQuCzdiT4aAR8LFlOnfVm7rxe5y0mAdjYkcdZsMsm6uk
         z0uMA8aOYcMlYL52tvGNaHC8nzql7LZviBsKj2Zbfy8Xgtt8TQkk3GNcu1iHNB9wQyqR
         Sqpw==
X-Forwarded-Encrypted: i=1; AL+hErGuBmWh3wH8S8Xi1+5+kQOaLb7YJECh+4jJjxavpLXDimObXau9vx4+Z+37gh6geNTEy2TF1jPy/TL+fguOmw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8UGmAPWT3Pm3qDd52UIDkt0OwKHgsk/f361N3K+myvUQ0UwHBB
	hCw/BSTx1g2rnwropZKgodpK00jRZlBLIzjikX7XoaLZw9vgYj5c9LzI0Wfl5GqfVCY1pTev11D
	xius28Y0sMQmkIT8fbpZtjHQauekbI+t6X1H9TfXddg==
X-Gm-Gg: AZFdTZflTrEFqxZ/OkIta3OOUEQgBzRIHm/2iQdcu4n0CUFEFxPgDiL0u60FAwEh8oO
	pE68BQmFdbH3jyjNO1BIv5ALi7uUxYlRvtvx71cnahejwIooTZ2kxG5IhbJJkHAYFgaxaHWUQIA
	V3zCU4vPX4aezuc8jO2UlvCEVHCfgQ2MMk6R6eUawKXGV2qk/j2R3r5UKjh9/qSuiuN5Olo5jvY
	M26IpHC0jqNiZE2gQiDj0mPWqPIKDuiGuK/uFd095rWQt/XIa65zuh46Z2v8iXdM0Fte0FZMlFS
	OMAGD+EtcLA51zoGV2KFZ3Ff0hlpOreLa9rXfd8+j9F/UOkXPqjvXSpojcm7kPIEYYiLozpvVyP
	bHuTbEc0nTLdLMEu0TmyZq2xPzCvL/JOQ/f3d
X-Received: by 2002:a05:6a21:3e04:b0:3d3:ae40:51e6 with SMTP id
 adf61e73a8af0-4014bb52da7mr14240670637.26.1795545611912; Tue, 24 Nov 2026
 10:40:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-34-angelogioacchino.delregno@collabora.com>
 <CAPj87rO9saEC34+5NiYK8xyZiNytrVgOcszoY5uc7BpL=M4WTg@mail.gmail.com> <14a4f698-8739-45c6-8904-496ac61e73c9@collabora.com>
In-Reply-To: <14a4f698-8739-45c6-8904-496ac61e73c9@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 18:40:00 +0000
X-Gm-Features: Aa3M54qIEgHVmsqq4DxWvUflQF2v_NEZOm-dewWZxD6n7rtVG1aK5-HIk_WFDp4
Message-ID: <CAPj87rPtL1nDrEF34LTmQDr9V4GbX0s8SR3wwwWWp4r0yQ2hag@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261124_104013_069868_5C50D4FB 
X-CRM114-Status: GOOD (  35.73  )
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

Hi there,

On Tue, 24 Nov 2026 at 15:01, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> On 11/24/26 15:28, Daniel Stone wrote:
> > On Tue, 14 Jul 2026 at 12:45, AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >> +       if (!pending->enable || pending->height == 0 || pending->width == 0 ||
> >> +           pending->x > OVL_EXDMA_MAX_SIZE || pending->y > OVL_EXDMA_MAX_SIZE) {
> >
> > Definitely don't do this please. If exdma is asked to do something it
> > can't (and I'm assuming that these last two checks are intended to be
> > on w/h rather than x/y?), then you need to reject that in
> > atomic_check. Getting here with pending->enable == true and then not
> > enabling it, is not OK.
>
> That was done because mediatek-drm isn't in the best shape, and atomic_check is too
> late for this check... adding support for those components is done on top of a big
> restructuring, which still is not complete, as the entire mediatek-drm driver can,
> and needs to, improve quite a bit.

Hmmm, too late? I don't quite follow - there is the layer_check()
which should presumably stop such a state from being generated within
atomic_check() - is there something I'm missing which means that this
couldn't work?

> > Relatedly, most of mtk_plane_pending_state should be deleted as
> > duplicative of drm_plane_state and it would be great to see a patch
> > series very soon to clean that up.
>
> Again, I agree mediatek-drm needs a rather big cleanup.
>
> Lately, upstream has been a bit slow in reviewing etc for many reasons, which is
> why this series has been there for months now (though things are getting unblocked
> lately at least for this specific series, so that's good).
>
> Anyway - let me see what I can do, but I can't make *big* promises - the only thing
> I can say is that further *big* cleanups/restructuring is something I can do in the
> next iteration (after the partial restructuring that is done in this series gets
> merged, but definitely not in this series) whenever I can find some time to.
>
> I'm all for making things perfect, but I only have two hands, unfortunately :-(

Sure, that makes sense. I think this series is already a really good
step in the right direction.

There's still a lot more to be done though: if I was looking at this
as a new driver, the state management alone would be a hard reject
until it was fixed. It looks like it was a pre-atomic driver with its
own state management, which then had an atomic implementation bolted
on in a way you wouldn't do it if you were starting from scratch, that
has then had three different hardware-programming mechanisms (shadow,
direct, and CMDQ/GCE) pushed into it.

I'm sure there could be more to be done with the vfunc forest and the
way all the components are modelled. I'm sure any specific 'why not do
it like this?' suggestions I would have would be very wrong in some
way, but as an exercise, sit down with someone who understands display
hardware and KMS drivers for half an hour. Start by spending 3-5
minutes explaining the MTK block & routing model to them, then go
directly to attempting to explain mtk_crtc_num_comp_planes(). A lot of
the questions and confusion that comes out of that would probably feed
into what a different design might look like.

Right now, it feels like the top-level DDP implementation is so
generic and flexible that it's extremely difficult to reason about and
think through, but then it's so abstract that we end up not being able
to use any of the hardware blocks in anything other than passthrough
mode, which is pretty much the worst of both worlds. Hopefully we can
come up with a better path forward that means we can support more
hardware and expose more of the functionality as a nice present for
next Christmas.

Cheers,
Daniel

