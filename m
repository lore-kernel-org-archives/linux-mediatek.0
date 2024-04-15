Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B777C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 07:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fwRgSggVbLe6+8l2QxlodD8R4Jnj2CNVAHen8a3BPg=; b=KnsV7VDjh+JAWwUWe5ebWCCK+p
	NXP0NOGUKstcPYce1+1mIczuX3S4YgPrchtALrvHElpPEsOAC64S3S/gExB+DvrEBnpn0umPR7XJh
	rZhcqyJ8mlrWI10BBe02yvtBNK9toyHVP84/1fYfDIal/FpBPwnKBPTlh6p39Gj7OzFkC0GjOardX
	ZYuMBWs80WGTmHfoepp3U77y70i54LAHu5z2Lptyg119zb14UfcLXb+uRgvvR5ckJDaNWXyDCgqnP
	qrdnrgYGAHlS5I01V+bufhJt1lRCeMCurzjYswOjXON1+Gje+9qim//PPTVQTAEWuUJgr/9l+PdlH
	R0LAanuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwGiz-00000007KzZ-33Tn;
	Mon, 15 Apr 2024 07:25:57 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwGix-00000007KyE-3UIg;
	Mon, 15 Apr 2024 07:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713165956; x=1744701956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OqnLGYrmxL1r//qeEKxNpcsT5ecBncxRH0T2KE36LVA=;
  b=LsRkqj9xDWZ5AXGiF+wEmbxgpJXM67tK82w71Zr+rU1NPUf4jgv6AUnU
   WJd3T8l/Tjnb+3vrC3IOwx65xq+A7Epyt108Ft6RfMrmWnYrGaEX7V1/G
   x/EyUFuijJ463Dj/dIHhTJVY4krqiq2EbSN8zdbVWP6//tDD+w7UnDxja
   pftbH6joCkdnN8QsdhSrYAjO3ImNwkBZWYfRrJgtbB/RtNAePWaPJW9dX
   xPE5BjIuWeD1mgdEMbcX/19wY+3yk8wZTONctJwkfYusVVzmXnS1f89QI
   en9t4db5Vu9+xk20rmUau0BZnV2FDfE2FzElm74AxVSS652ozSIv4T84R
   Q==;
X-CSE-ConnectionGUID: hqbgTQ5GRHCXxvXqZ8axcQ==
X-CSE-MsgGUID: 29XuPfZ5QmysDsJtbKiD5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="12327839"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="12327839"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 00:25:51 -0700
X-CSE-ConnectionGUID: hNZHFNF7Stac7Np65aHCjQ==
X-CSE-MsgGUID: GHaQ/P5ASKWRbx+yYAx0zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="26628608"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 00:25:45 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 56B1311F8AF;
	Mon, 15 Apr 2024 10:25:42 +0300 (EEST)
Date: Mon, 15 Apr 2024 07:25:42 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Zhi Mao <zhi.mao@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, shengnan.wang@mediatek.com,
	yaya.chang@mediatek.com, yunkec@chromium.org, 10572168@qq.com
Subject: Re: [PATCH 2/2] media: i2c: Add GT97xx VCM driver
Message-ID: <ZhzWdmg8cc1tgtNc@kekkonen.localdomain>
References: <20240410104002.1197-1-zhi.mao@mediatek.com>
 <20240410104002.1197-3-zhi.mao@mediatek.com>
 <CAHp75VfF0pbrKXjWZg7sTr-T=_CbjP+deFQP-VLCGX8ooahctg@mail.gmail.com>
 <ZhkBIee2X0UY40yD@kekkonen.localdomain>
 <CAHp75VcKFCvzcESqsc8OQ5SVuO4gJiE5ZEUwkdoqvLzM=2PejQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcKFCvzcESqsc8OQ5SVuO4gJiE5ZEUwkdoqvLzM=2PejQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_002555_941953_D1DBC89E 
X-CRM114-Status: GOOD (  16.02  )
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

Hi Andy,

On Fri, Apr 12, 2024 at 04:43:43PM +0300, Andy Shevchenko wrote:
> On Fri, Apr 12, 2024 at 12:39 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Wed, Apr 10, 2024 at 07:00:02PM +0300, Andy Shevchenko wrote:
> > > > +static int gt97xx_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > > > +{
> > > > +       return pm_runtime_resume_and_get(sd->dev);
> > > > +}
> > > > +
> > > > +static int gt97xx_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > > > +{
> > > > +       return pm_runtime_put(sd->dev);
> > > > +}
> > >
> > > Hmm... Shouldn't v4l2 take care about these (PM calls)?
> >
> > Ideally yes. We don't have a good mechanism for this at the moment as the
> > lens isn't part of the image pipeline. Non-data links may be used for this
> > in the future but that's not implemented yet.
> 
> Aren't you using devlinks? It was designed exactly to make sure that
> the PM chain of calls goes in the correct order.

Device links are already used by the IPU bridge, but in the other
direction: the VCM requires the sensor to be powered up in this case.

-- 
Regards,

Sakari Ailus

