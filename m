Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78774C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 12:56:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26B6C23A84
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 12:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26B6C23A84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OTZZ9Gp4DDtw9MaWeTVDYZwTsegWVPY7EwkX9EPbrfE=; b=s/DWwq+Ge9F3JE/r+/axDly3H
	CcQ8D5Z86yp77D6XeeSfoM9hy2bk3nWzWbpwLVDc1u4++cc3WytldfEzKeLU3CGX75MntLJY+IH/I
	hImaimyePp1o+pHYFd3IzRPpVJf1/TEo/qZCRGcxbMyJ3SyzI7kHa8yY47SpRvxvImB+6+yhyujCp
	dC9vHnFzIkni5zBRsD0RewGa9I2HmWDAgPdULJdIw+7ttBaafAERog/S2MoGTKNkyM8nzE430zhl1
	/byMALLE1eNQOIq5BgurXasHNpeQCEuxDLB6XLQOAn/CEbAh9MDwJ8Xr/uMM2Ng0HC7w2NtgwWiyh
	XYYKYN1nA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmcXC-0000RK-0S; Tue, 08 Dec 2020 12:56:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmcX5-0000P1-Kf; Tue, 08 Dec 2020 12:55:56 +0000
Date: Tue, 8 Dec 2020 18:25:49 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607432154;
 bh=DwAV7zH+P8yCLLppVdnEWm7jEyFYcY0buhiThYP1IpQ=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=resxd2wxBAM0ElayHYdUDK8fD16d3qFWPlTzJ9Pa+uA4NBMOiSMCECIniE5STbceD
 p9M2qOxsWdRLIGK5SGHHryzOiwFBJI9bCZ9vpQ86EpC2U5x79WgyN8geNp96pRdRId
 3pE2mT/z9Nl5X1nEctSWVktg2oR0/sH7Ns0/1j0XjqK/Wc7z1TgxEISIgkuo/xtogQ
 Tmz8sMn6tEyk93pdykDJbIjdk0xgQ4IbsJ5ocXtf6V63eyedtzEtLrBOmst3/F0E2v
 NtFQmTOoK6tynjIH0JXY/L4zgYffzJxwjGKA8dpQN94BXgJMMg/Qicwac/1Xu9QBJV
 QsxLKmNRk8LCw==
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH][next] drm/mediatek: avoid dereferencing a null hdmi_phy
 on an error message
Message-ID: <20201208125549.GG8403@vkoul-mobl>
References: <20201207150937.170435-1-colin.king@canonical.com>
 <1607392202.23328.1.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607392202.23328.1.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_075555_750868_ECCE889D 
X-CRM114-Status: GOOD (  21.49  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 chunhui dai <chunhui.dai@mediatek.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08-12-20, 09:50, Chunfeng Yun wrote:
> On Mon, 2020-12-07 at 15:09 +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently there is a null pointer check for hdmi_phy that implies it
> > may be null, however a dev_err messages dereferences this potential null
> > pointer.  Avoid a null pointer dereference by only emitting the dev_err
> > message if hdmi_phy is non-null.  It is a moot point if the error message
> > needs to be printed at all, but since this is a relatively new piece of
> > code it may be useful to keep the message in for the moment in case there
> > are unforseen errors that need to be reported.
> > 
> > Addresses-Coverity: ("Dereference after null check")
> > Fixes: be28b6507c46 ("drm/mediatek: separate hdmi phy to different file")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/phy/mediatek/phy-mtk-hdmi.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
> > index c5c61f5a9ea0..5184054783c7 100644
> > --- a/drivers/phy/mediatek/phy-mtk-hdmi.c
> > +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> > @@ -84,8 +84,9 @@ mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
> >  	    hdmi_phy->conf->hdmi_phy_disable_tmds)
> >  		return &mtk_hdmi_phy_dev_ops;
> >  
> > -	dev_err(hdmi_phy->dev, "Failed to get dev ops of phy\n");
> > -		return NULL;
> > +	if (hdmi_phy)
> > +		dev_err(hdmi_phy->dev, "Failed to get dev ops of phy\n");
> > +			return NULL;
> indentation: one tab before return

I have applied this and fixed the indent while applying

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
