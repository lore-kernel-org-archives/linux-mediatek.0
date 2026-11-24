Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F042606A335
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Px+UdDxV;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pQ0nXaTV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=asbWuIn9ePuDPZMHSTApP9g/ewv2TUXo/89WnF//TCg=; b=Px+UdDxVumUvRG
	Xpeh+t/fyErq7/4lR4qZBtOQ/3vFmpG+LHGM+IU0JicMZP+LUgC1yY5Xy9MIlndltWxclVGRsEE+f
	HyY5NKsAX+u3oiWNdaPpyrlf/b9/ImqDjIIPLXVpnbOBQZ12I6fexFMcUK9hJR/uzdZEVuv9HbJio
	X0PYg5xXjes/7wT8xAq7RtoMnRENTh0omnvuR+c4UXW3vh+Beb83DgYykBkF0JdLHENcnbobcLE0i
	2AXLUUD4Gvq3bqJBUb5fn3cE/cZhxvgdJAJj6D4khnEmxKU5A/5KA8JxRVrBzYNeK7wHG/LwVRljE
	BBLG10APTc3/A2YsEZ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVs13-00000006ptU-0S4q;
	Tue, 24 Nov 2026 15:01:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVs10-00000006psd-2lre;
	Tue, 24 Nov 2026 15:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795532460;
	bh=dJcc5I0Ky/5T2QAptsnn0SzrB5NzoLMHaxiGnakhfhc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pQ0nXaTVwLs9PqqU6CwULXvJgEIqxRyY5bxvW5uexTE19pWE+hs+oH0u+3jukYvE9
	 y0RiUNk/bwYIkXTnHDceGFq6aIG3JnXjEQq5rEedFvSGZjxUcFFcLA5+xWhKG7epWR
	 qJLqxwsM9GYg9ZtH7cMqOvV3Z9od6sWkRCszde6pNbSSG/lngu/Fq5abAGKsFyZn/D
	 WrQFyIUZCLRCFlhW9InQy5vEfRgd/MIhHhirkWQeuRJRHThwYc5GAajSaEHCEFX+OU
	 cEXN+KgSbk/KVER94bTmr227lVs7lsLPh1T4v74ZsYxB8iBJcQhpxg1TQYcCXPrlQX
	 AO3PveeJUDSQw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A22CE17E09ED;
	Tue, 24 Nov 2026 16:00:59 +0100 (CET)
Message-ID: <14a4f698-8739-45c6-8904-496ac61e73c9@collabora.com>
Date: Tue, 24 Nov 2026 16:00:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/46] drm/mediatek: Add support for Display Controller
 exDMA component
To: Daniel Stone <daniel@fooishbar.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com,
 jason-jh.lin@mediatek.com, kernel@collabora.com
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-34-angelogioacchino.delregno@collabora.com>
 <CAPj87rO9saEC34+5NiYK8xyZiNytrVgOcszoY5uc7BpL=M4WTg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAPj87rO9saEC34+5NiYK8xyZiNytrVgOcszoY5uc7BpL=M4WTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_070102_901496_D87C0A89 
X-CRM114-Status: GOOD (  27.45  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/24/26 15:28, Daniel Stone wrote:
> Hi,
> 
> On Tue, 14 Jul 2026 at 12:45, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> +void mtk_exdma_layer_config(struct device *dev, unsigned int idx,
>> +                                struct mtk_plane_state *state,
>> +                                struct cmdq_pkt *cmdq_pkt)
>> +{
>> +       struct mtk_disp_exdma *priv = dev_get_drvdata(dev);
>> +       struct mtk_plane_pending_state *pending = &state->pending;
>> +       const struct drm_format_info *fmt_info = drm_format_info(pending->format);
>> +       const u32 blend_mode = mtk_ovl_get_blend_mode(state, MTK_OVL_SUPPORT_BLEND_MODES);
>> +       const bool csc_enable = (fmt_info) ? fmt_info->is_yuv : false;
>> +       u32 val;
>> +
>> +       if (!pending->enable || pending->height == 0 || pending->width == 0 ||
>> +           pending->x > OVL_EXDMA_MAX_SIZE || pending->y > OVL_EXDMA_MAX_SIZE) {
> 
> Definitely don't do this please. If exdma is asked to do something it
> can't (and I'm assuming that these last two checks are intended to be
> on w/h rather than x/y?), then you need to reject that in
> atomic_check. Getting here with pending->enable == true and then not
> enabling it, is not OK.
> 

That was done because mediatek-drm isn't in the best shape, and atomic_check is too
late for this check... adding support for those components is done on top of a big
restructuring, which still is not complete, as the entire mediatek-drm driver can,
and needs to, improve quite a bit.

(P.S.: yes the check was to be done on w/h)

That said, I think at this point the best I can do, without going for continuing
the entire restructuring here (I have no time for that right now, sorry) is to
duplicate this check in .atomic_check(), so that when the entire thing will be
ready, the right thing is already there waiting for the additional check to be
simply removed.

I have to recheck if there's anything "fast" I can do to make this completely
right without double checks, but I'm afraid I can't.

> Relatedly, most of mtk_plane_pending_state should be deleted as
> duplicative of drm_plane_state and it would be great to see a patch
> series very soon to clean that up.

Again, I agree mediatek-drm needs a rather big cleanup.

Lately, upstream has been a bit slow in reviewing etc for many reasons, which is
why this series has been there for months now (though things are getting unblocked
lately at least for this specific series, so that's good).

Anyway - let me see what I can do, but I can't make *big* promises - the only thing
I can say is that further *big* cleanups/restructuring is something I can do in the
next iteration (after the partial restructuring that is done in this series gets
merged, but definitely not in this series) whenever I can find some time to.

I'm all for making things perfect, but I only have two hands, unfortunately :-(

> It's been that way for the last 10
> years, with seemingly no discussion ever of why it exists (my guess is
> that it's a holdover from pre-atomic code), but no reason to
> perpetuate the badness.

It's there because the mediatek-drm codebase still nowadays has lots of technical
debt, and because there is this GCE//CMDQ programming that adds up to make things
slightly more complicated.

> 
> Same comment applies for the blender.

Noted.

Cheers,
Angelo

