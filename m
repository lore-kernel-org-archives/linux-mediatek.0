Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459E1ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 13:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igQJP4wt7FLsaM5QhhlevlmdlBDTw13brfXZnP8ec9w=; b=sthA28fgiVXVOW6TKIFj6ri00f
	ZsYzg/g1+2vKXmN56+LqAnlHi7/4iQ/LiMfJNcHkcaJsmymIaeVwdEJyLDSABsBmm4eTJ9zaqlusI
	3q0y2f8QvYrgLNHVIRXF84fWKK7v+g37WPfqxGvJ+4GzhHD7jXF/Ii7eedPV5OOyV6yw4OBhrVS0A
	2a7y41IYIdOWVz4YqVyE8XbLcGU8ibi8HK3n5r6eF0yzIEglHyO9W5U73y6G8YIAhMHrke77GShOx
	t2UoST7CVvVouOivUP80t+ZgdbRl00Hyu+jGaDkwnzjwxe8e+ytRqiMM1nbQV/VbudOQPMi9Jf0IZ
	UFfVllkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRZPR-00413z-2R; Fri, 26 Aug 2022 13:30:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRZPD-0040ma-GS; Fri, 26 Aug 2022 13:29:53 +0000
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 224F16601B24;
	Fri, 26 Aug 2022 14:29:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661520587;
	bh=+m7sis5b7W8J1KdNle4N0fSBG5qi9iWA0tl/U2ExgXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kbcQ27OiXN4L4WS3AG+PvOv7ae/3Eg8kbk7YBuBUC451fN1xBzRc0WTGIhVkh8HRA
	 TjnnsPne5t5aFubjmIdbgMCnPSfBYMq8B8N/2i44+DEE6HFX0XI3/J/PLASYLlqRan
	 ib9M6x+PUgv0jJrNhDpSem+wsnOeqLeBE2sJ9VpHNavFzGqM2JPtCYIkVj1pcaeDu4
	 0Hac8gIJTwbgOy1YeeL0/8fYXgSET8355QagOgJ5ViauNhJ7lMU0DgJeGQ5OiH/g5n
	 YPZpygzbV8XhLtZmaV05NRDhq41G9pTlFIIBEeRjmHgfcmjQP2jhjQ4yw/g0B9WM7z
	 mt2K9gggrZFrA==
Date: Fri, 26 Aug 2022 09:29:42 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "xinlei.lee" <xinlei.lee@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
	rex-bc.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com, yongqiang.niu@mediatek.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v3,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
Message-ID: <20220826132942.k2rnlz5wwi62tity@notapiano>
References: <1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com>
 <20220823201758.ffbgb5t5odoicgir@notapiano>
 <b0f6a3c6-8fef-8983-fb69-6157a9859afd@gmail.com>
 <30f536c754829011e78239a9a400945faa4580e4.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30f536c754829011e78239a9a400945faa4580e4.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_062951_930499_A9FD0A8D 
X-CRM114-Status: GOOD (  22.84  )
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

On Fri, Aug 26, 2022 at 02:12:00PM +0800, xinlei.lee wrote:
> On Thu, 2022-08-25 at 17:04 +0200, Matthias Brugger wrote:
> > 
> > On 23/08/2022 22:17, Nícolas F. R. A. Prado wrote:
> > > On Tue, Aug 23, 2022 at 02:38:22PM +0800, xinlei.lee@mediatek.com
> > > wrote:
> > > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > > 
> > > > Add mmsys function to manipulate dpi output format configuration
> > > > for MT8186.
> > > > 
> > > > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > > 
> > 
> > Patch looks fine, I'll wait for v4 as there is still some discussion
> > on the DRM 
> > part. Please try to fix the threading problem you had in sending this
> > series.
> > 
> > Thanks,
> > Matthias
> 
> Hi Matthias:
> 
> Thanks for your review.
> 
> Before I send the next version, do you mean the treading problem you
> are talking about is the problem I'm discussing in another patch in
> this series, or something else?

Hi Xinlei,

no, the threading problem Matthias is referring to is the fact that this version
of your series had two cover letters (patch 0) and a patch 2 [1], while patch 1
was sent in a different email thread [2]. The whole series (cover letter,
patches 1 and 2), should have been in the same email thread. Also, I noticed
that your cover letter lists the patches with incorrect prefixes "FROMLIST".

So something weird happened when you sent this version of the series. It was ok
in the previous version. So just make sure this is fixed when you send the next
version of the series (after we finish the discussion on patch 2).

[1] https://lore.kernel.org/linux-mediatek/1661235517-23699-1-git-send-email-xinlei.lee@mediatek.com/
[2] https://lore.kernel.org/linux-mediatek/1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com/

Thanks,
Nícolas

