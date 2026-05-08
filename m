Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CE4CD3436
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2026 11:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZpR+faVPraHA5m7bCbYzhHwUcDDjjQWNsOc+BFwiWk=; b=rQcpgmqT5iUlSxxvh+OEdkBDkQ
	59j09jtya94ZIuZdOz9SE3qN8N9gaBHcFYFMwt4AGEfKTzfXgIRDoB5QKLgTJxZ5uSu/MMzgVt/Tb
	yzTHNJVVXpIRA/6C5n2oZm6pbgvxapE5lcsFs1llmnQAm2PsKTZsEzTYdoesecDAbIp5QajbuZeW/
	frcYVmyhhWTYY5Na3cO8KatPPm2EE9fL/J7nFRlwDHSq+xx60x+O52X4yvjqpAwTO1PYWv9ItnFxU
	X1AdXnEKAdD7m03Uc7+1zIoFZXZ9qnsHnSdeE9bCBEqCv5A7y+nUY+qUK72VyQJ0QPwLq0eCmNSO8
	85yE2v8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJdK-00000006Nk0-11Jg;
	Fri, 08 May 2026 11:44:42 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJdI-00000006Nhu-2zGF;
	Fri, 08 May 2026 11:44:41 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wLJd4-000000004bI-3Yr9;
	Fri, 08 May 2026 11:44:26 +0000
Date: Fri, 8 May 2026 12:44:23 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Junzhi Zhao <junzhi.zhao@mediatek.com>,
	Jie Qiu <jie.qiu@mediatek.com>, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] drm/mediatek: hdmi: report jack plugged state from
 bridge enable/disable
Message-ID: <af3Ml252DaeyXzwe@makrotopia.org>
References: <a3e22cbae528c9a38d854a586d1736b860998d41.1776265222.git.daniel@makrotopia.org>
 <c4d62fc2244fb72207855c5a366ff10fad419f2d.1776265222.git.daniel@makrotopia.org>
 <lhxivpwo6aq3ehgzsnkgxnqis5tptmey4dtbhaokyckkl7ghbn@dzaj225pnpk3>
 <afyUfcr8HuFs6EKF@makrotopia.org>
 <v343uqdgy65yg3lm7rcv57mlpkudqxrnori6lnunaiiewakhyd@wnxkqhhwwvgg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v343uqdgy65yg3lm7rcv57mlpkudqxrnori6lnunaiiewakhyd@wnxkqhhwwvgg>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_044440_750121_4C5B9B44 
X-CRM114-Status: GOOD (  25.54  )
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

On Fri, May 08, 2026 at 02:29:29PM +0300, Dmitry Baryshkov wrote:
> On Thu, May 07, 2026 at 02:32:45PM +0100, Daniel Golle wrote:
> > On Thu, May 07, 2026 at 12:51:56PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, Apr 15, 2026 at 04:04:16PM +0100, Daniel Golle wrote:
> > > > Notify hdmi-codec of the current sink plugged state from
> > > > mtk_hdmi_bridge_atomic_enable() and mtk_hdmi_bridge_atomic_disable()
> > > > via mtk_hdmi_update_plugged_status(). This matches the pattern used
> > > > by dw-hdmi, which invokes handle_plugged_change() from the bridge
> > > > enable and disable paths so that ASoC jack state stays in sync with
> > > > the actual sink presence across atomic commit cycles, and not only
> > > > on CEC HPD transitions.
> > > > 
> > > > Userspace audio daemons (e.g. pipewire) rely on the jack state to
> > > > route streams, restore per-sink volume levels, and recover the last
> > > > used device after a reconnect. Without this, those transitions are
> > > > missed whenever the sink change is driven by a mode set rather than
> > > > by a bare HPD event.
> > > 
> > > I can only hope to see mtk_hdmi to migrate to DRM_BRIDGE_OP_HDMI and
> > > DRM_BRIDGE_OP_HDMI_AUDIO...
> > > 
> > > I think the correct timing was discussed several times and the overall
> > > conclusion was that the correct time is when the actual HDMI cable is
> > > being plugged / unplugged. See the discussion around [1] and the
> > > captured response of Mark Brown.
> > 
> > Thank you for bringing this to my attention. I'll follow up on it.
> > Meanwhile, can (independent) patch 1/2 already be merged, or at least
> > get reviewed?
> 
> 
> The discussion that I pointed to suggests that the patch is incorrect.

I understand that patch 2/2 is incorrect, but (the independent fix in)
patch 1/2 as well?

