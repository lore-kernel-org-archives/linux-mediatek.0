Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D9FC531DC
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Aug 2024 02:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3PBtFS4FGd7SCAA1CPDEsl/8k7nrplme33HqFORp+I=; b=uovzoTjMO6WS1B3tJEHWCbm9Sb
	GXU1pqPFsTWR+IVckj4D4xVZVb+ZkoJs6nbdb3p0XUeRDtcQBAvuH7StO9w1ZfpZxYNpLLhUG83Ex
	uQXHo1X0xIP5CHJdoW1wM08S8rtWQx558Kvgo6AIfz4QYRSKi1y9+r0XfYTNsc5P19kZ0/1iRHFjO
	S8ZpyPfVFEr0ctWf3Leo+G9FdLdY9hbZlrzQg2C7tPKmk8QbvVBRxtdlHBfpfvo4hrrkKJCvLm7ov
	rqE7RA0Tl0uvQAg3ldlZ+g2uiwvLYe3/cV6EkxKINPN6yEb2P6TgJr/UzImXw5tWRb5dzznuvH1UY
	aG3JxP8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf9P3-0000000EWXt-2Evw;
	Sat, 17 Aug 2024 02:42:53 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf9OM-0000000EWQ6-0CYY;
	Sat, 17 Aug 2024 02:42:12 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1723862526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t3PBtFS4FGd7SCAA1CPDEsl/8k7nrplme33HqFORp+I=;
	b=FJs1vkA1ZlGCNKZAgEddbKLErQb+R2TpueJ69yhDSU/8qvqN6yc+rb9cvSRe+hGqQIogQL
	C531SWWND+q9RZL08oOSEFLg1y1KDiqUv1XmBJk5tftvbhaq5At+MhZ/pF9+Jykv3EsRKB
	p/KusXYhHVegnH+HI86MJWEUgi3DVGiI1YuTNgwUqfpOB3z0OuaVi1zj6fGS9VJVbSFM+3
	RoCW1WPhJLbqPdoivlBRqSWHRjzC3ZiWFuhbo3uvhW0QLE8NOZcE+MEVYClMOK9wlbiPc1
	NDnCFAukjD7cI8cA+oRLGoNp0pmRfRoeKhwX4lAd/IV4djT90xKhpcfUEDgvzA==
Date: Sat, 17 Aug 2024 04:42:05 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Icenowy Zheng
 <uwu@icenowy.me>, Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Pra?=
 =?UTF-8?Q?do?= <nfraprado@collabora.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Hsin-Te Yuan
 <yuanhsinte@chromium.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] thermal/of: support thermal zones w/o trips subnode
In-Reply-To: <CAGXv+5GQixa389nudKk=U3Rh2jN8VuWQGKb9rsixhvj3KGFQDg@mail.gmail.com>
References: <20240809070822.2835371-1-wenst@chromium.org>
 <b00273d65dfc4b48cca474784184c62b@manjaro.org>
 <CAGXv+5ERoH=jQGzo=mo2K-r3Meh2-5Kgvjf9Eh7bfNgcQYfWoA@mail.gmail.com>
 <CAGXv+5GQixa389nudKk=U3Rh2jN8VuWQGKb9rsixhvj3KGFQDg@mail.gmail.com>
Message-ID: <35a2ef84aaa9f650bd63bfc25e336ef3@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_194210_814746_4C08982A 
X-CRM114-Status: GOOD (  34.69  )
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

Hello Chen-Yu,

On 2024-08-15 06:45, Chen-Yu Tsai wrote:
> On Mon, Aug 12, 2024 at 12:46 PM Chen-Yu Tsai <wenst@chromium.org> 
> wrote:
>> 
>> On Mon, Aug 12, 2024 at 9:22 AM Dragan Simic <dsimic@manjaro.org> 
>> wrote:
>> >
>> > Hello Chen-Yu,
>> >
>> > Thanks for the patch.  Please see one comment below.
>> >
>> > On 2024-08-09 09:08, Chen-Yu Tsai wrote:
>> > > From: Icenowy Zheng <uwu@icenowy.me>
>> > >
>> > > Although the current device tree binding of thermal zones require the
>> > > trips subnode, the binding in kernel v5.15 does not require it, and
>> > > many
>> > > device trees shipped with the kernel, for example,
>> > > allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64,
>> > > still
>> > > comply to the old binding and contain no trips subnode.
>> > >
>> > > Allow the code to successfully register thermal zones w/o trips subnode
>> > > for DT binding compatibility now.
>> > >
>> > > Furtherly, the inconsistency between DTs and bindings should be
>> > > resolved
>> > > by either adding empty trips subnode or dropping the trips subnode
>> > > requirement.
>> > >
>> > > Fixes: d0c75fa2c17f ("thermal/of: Initialize trip points separately")
>> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
>> > > Reviewed-by: Mark Brown <broonie@kernel.org>
>> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>> > > ---
>> > > Resurrecting this patch specifically for MediaTek MT8183 Kukui devices.
>> > >
>> > > Changes since v1:
>> > > - set *ntrips at beginning of thermal_of_trips_init()
>> > > - Keep goto out_of_node_put in of_get_child_count(trips) == 0 branch
>> > > - Check return value of thermal_of_trips_init(), if it is -ENXIO, print
>> > >   warning and clear |trips| pointer
>> > > - Drop |mask| change, as the variable was removed
>> > >
>> > > I kept Mark's reviewed-by since the changes are more stylish than
>> > > functional.
>> > > ---
>> > >  drivers/thermal/thermal_of.c | 19 ++++++++++++-------
>> > >  1 file changed, 12 insertions(+), 7 deletions(-)
>> > >
>> > > diff --git a/drivers/thermal/thermal_of.c
>> > > b/drivers/thermal/thermal_of.c
>> > > index aa34b6e82e26..f237e74c92fc 100644
>> > > --- a/drivers/thermal/thermal_of.c
>> > > +++ b/drivers/thermal/thermal_of.c
>> > > @@ -128,16 +128,17 @@ static struct thermal_trip
>> > > *thermal_of_trips_init(struct device_node *np, int *n
>> > >       struct device_node *trips, *trip;
>> > >       int ret, count;
>> > >
>> > > +     *ntrips = 0;
>> > >       trips = of_get_child_by_name(np, "trips");
>> > >       if (!trips) {
>> > > -             pr_err("Failed to find 'trips' node\n");
>> > > -             return ERR_PTR(-EINVAL);
>> > > +             pr_debug("Failed to find 'trips' node\n");
>> > > +             return ERR_PTR(-ENXIO);
>> > >       }
>> > >
>> > >       count = of_get_child_count(trips);
>> > >       if (!count) {
>> > > -             pr_err("No trip point defined\n");
>> > > -             ret = -EINVAL;
>> > > +             pr_debug("No trip point defined\n");
>> > > +             ret = -ENXIO;
>> > >               goto out_of_node_put;
>> > >       }
>> > >
>> > > @@ -162,7 +163,6 @@ static struct thermal_trip
>> > > *thermal_of_trips_init(struct device_node *np, int *n
>> > >
>> > >  out_kfree:
>> > >       kfree(tt);
>> > > -     *ntrips = 0;
>> > >  out_of_node_put:
>> > >       of_node_put(trips);
>> >
>> > It might be a bit cleaner to keep the "*ntrips = 0" assignment
>> > in the error handling path(s) only, with the positions of the goto
>> > labels adjusted a bit, and then assign -ENXIO to "ret" and jump
>> > to the right label when of_get_child_by_name(np, "trips") fails,
>> > instead of returning from there.
>> >
>> > If it's unclear what I'm talking about, please let me know and
>> > I'll send back the proposed hunk.
>> 
>> I think I understand: move "*ntrips = 0" to after of_node_put() in the
>> error path, and have the "!trips" branch jump to "out_of_node_put" as
>> well. That works since of_node_put() checks the pointer first.
>> 
>> I'll wait a bit and see if there are any more comments.
> 
> Actually, Krzysztof (+CC) is cleaning up this function using scoped
> variables. So it might actually make more sense to move "*ntrips = 0"
> to the top once the error path is completely removed.

I see, it would make sense to move "*ntrips = 0" to the top, but what
bugs me with that approach a bit is that we's still have another 
instance
of "*ntrips = 0" in the error paths.  Thus, it might be cleaner to have
only one instance of "*ntrips = 0", in the error paths, and use "ret = 
..."
plus "goto ..." pairs instead of single "return ..." statements.

That way, we'd keep "*ntrips = 0" in the error pathso only, which would
clearly show that's part of the error handling only.  Though, I'd be 
also
fine with moving "*ntrips = 0" to the top, if you find that cleaner.

>> > > @@ -490,8 +490,13 @@ static struct thermal_zone_device
>> > > *thermal_of_zone_register(struct device_node *
>> > >
>> > >       trips = thermal_of_trips_init(np, &ntrips);
>> > >       if (IS_ERR(trips)) {
>> > > -             pr_err("Failed to find trip points for %pOFn id=%d\n", sensor, id);
>> > > -             return ERR_CAST(trips);
>> > > +             if (PTR_ERR(trips) != -ENXIO) {
>> > > +                     pr_err("Failed to find trip points for %pOFn id=%d\n", sensor, id);
>> > > +                     return ERR_CAST(trips);
>> > > +             }
>> > > +
>> > > +             pr_warn("Failed to find trip points for %pOFn id=%d\n", sensor, id);
>> > > +             trips = NULL;
>> > >       }
>> > >
>> > >       ret = thermal_of_monitor_init(np, &delay, &pdelay);

