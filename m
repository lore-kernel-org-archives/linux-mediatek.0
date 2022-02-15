Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51397C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 13:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Amr1OtMVcp7LkPXhao+52lvC8O/7oc4jTElCYvgLX9w=; b=E+pycr7w2BHkxe
	2cSbDJl/zC2zgbfl858OaHRzJbHBsaHZU6eqrAH1CxwjR4puggBRJ6puauBiAB2znc8vKxfzHG7qS
	hW4i89SPBG2QaovcUmYevV8NFYsZLmvbSY8p+ZjYCqf2FN8MBNueJw+gAwH0Nbd89tQHtL9sZTFT3
	HEFjZw69w40aN0WcOz38/GBgP4w2VG3WBoGU/ZuWq6VCWhdXYAcn9w3x4rg1qtkDl2Zb0BPycHsDB
	MO4zl8+yRjXK0Eww44aP5lGXy9bXmjNV8xGS1YQfSTfkrKcdM9+wzfzovLl+1YxqeYRf1yivAjCkg
	XctzxdfPW/3jBIcQRECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJyJK-002vWQ-2I; Tue, 15 Feb 2022 13:56:06 +0000
Received: from mail-4018.proton.ch ([185.70.40.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJyIx-002vHL-4g
 for linux-mediatek@lists.infradead.org; Tue, 15 Feb 2022 13:55:45 +0000
Date: Tue, 15 Feb 2022 13:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1644933337;
 bh=6lNlCoTfcpMqvqhkT68B9BYySvB6qEPhyvPf8Q7RTQA=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=FV5jLIpDbsQD4XNbDQkQA59s8nRJV6faVAqWXc971NcsmVKHkV3WFz9CryCy95bLx
 5fsjgglR+qDN2pAG4VVMHRwiAW7wXc36jCrXRS53wKMt7fzTzs55bc4vbCunEn3BAO
 Tmv6nP77HGsnX02nIOQ8IrjXl+VSweaREZ7QvAy0WPIyaIHZJiF+wUQhGw9MSGBfLo
 qgnWv3NMfCuRNuSAJUdB1Fg6FknYIt7YMJoCxO4gh+GCkoF+MPbXltblCW/FsJeHuv
 NvAiabP6tolfvRebFUuddQF+PsgMjroMmSaHLkMYJmetJAyvBb3HrcDh0oks/v4+3M
 J1BM1xgrLuF9A==
To: Emil Velikov <emil.l.velikov@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
Message-ID: <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
In-Reply-To: <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_055543_806226_400EEE39 
X-CRM114-Status: GOOD (  19.04  )
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
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tuesday, February 15th, 2022 at 13:04, Emil Velikov <emil.l.velikov@gmail.com> wrote:

> Greetings everyone,
>
> Padron for joining in so late o/
>
> On Tue, 8 Feb 2022 at 08:42, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > drm_dev_register() sets connector->registration_state to
> > DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> > drm_connector_set_panel_orientation() is first called after
> > drm_dev_register(), it will fail several checks and results in following
> > warning.
> >
> > Add a function to create panel orientation property and set default value
> > to UNKNOWN, so drivers can call this function to init the property earlier
> > , and let the panel set the real value later.
> >
>
> The warning illustrates a genuine race condition, where userspace will
> read the old/invalid property value/state. So this patch masks away
> the WARNING without addressing the actual issue.
> Instead can we fix the respective drivers, so that no properties are
> created after drm_dev_register()?
>
> Longer version:
> As we look into drm_dev_register() it's in charge of creating the
> dev/sysfs nodes (et al). Note that connectors cannot disappear at
> runtime.
> For panel orientation, we are creating an immutable connector
> properly, meaning that as soon as drm_dev_register() is called we must
> ensure that the property is available (if applicable) and set to the
> correct value.

Unfortunately we can't quite do this. To apply the panel orientation quirks we
need to grab the EDID of the eDP connector, and this happened too late in my
testing.

What we can do is create the prop early during module load, and update it when
we read the EDID (at the place where we create it right now). User-space will
receive a hotplug event after the EDID is read, so will be able to pick up the
new value if any.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
