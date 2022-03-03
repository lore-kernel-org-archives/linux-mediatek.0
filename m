Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3080FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 05:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPBXW7htHPXwfRTk5rZIJgtSViqxf4vxJt+Yge4m/Yg=; b=N8QFI53hyXgPHu
	fXJQfHsRoUoMhLrAJ7xNLTzXNwmLx+6BIfwi/te2+1mPqdTBez0nITGOOaekUGLfn2cP4gk2V4ai3
	WQ3D1jP7uyQwz5d4lxI8TVBs21RxgW+xu+OgTlU75VtZ4xfjcd/5UIxYcsPuQqu/CBdC0KpDpj5FI
	uCFBCw1KoZOrMgGPSqdosdkDiIvPfnowGrE9jMpXtntl5dL40ixsCA4FncjOzju3ciPMt4GdMnGdH
	g7dlUoGzRmE1+R1LiQh8O9TycryBGl/szU89YEBbg0neUhUXGwLFPnL0TaoxAzJmhCpSlamb+mYBl
	ZeIINa3J62JIjH6xgmNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPdp8-005Esb-5Z; Thu, 03 Mar 2022 05:16:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPdov-005EqX-O3; Thu, 03 Mar 2022 05:16:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D5C861766;
 Thu,  3 Mar 2022 05:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91609C004E1;
 Thu,  3 Mar 2022 05:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646284567;
 bh=0bq/jJdABYiYg74A+Fe0/noQNqV2iAgsmxYRoawwrlo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uZ5A5oQoJlaOFyFdgdRfHHGQkn4BIGzNHMx23tTiXbv2PzRoXTrI3YduuTBp0Mm77
 sYpOvkvXxTGeq8Xoefo30WCa2/LtCfTmCyYCStH5idHLLDLzF65JuJtbOEfeZEHNBx
 jEvxXX0p65qRHDwTJMhskS5RzBe4xTGqUDrwnGYqkthjApxEajeKwPy7DKwlP1GKTz
 60UhG2uZkUnnr+fsd1LvZZLbkzvfyDzY40t85sEXZRUdLIDdfyiESu2lpIKBAwKLjb
 dcE3UcqlzLEdrtOM6IkYdAhPattuq7VKn19JFr4w0+KP5gRIcHF424ulBCBY1lE4Sd
 lAzWmgqDd0PVg==
Date: Thu, 3 Mar 2022 13:16:03 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 trevor.wu@mediatek.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.corp-partner.google.com>
Subject: Re: [PATCH 2/2] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Message-ID: <YiBPE9z+iHU7unn7@google.com>
References: <20220301072924.24814-1-jiaxin.yu@mediatek.com>
 <20220301072924.24814-3-jiaxin.yu@mediatek.com>
 <Yh3hcQpLngg8Pnd4@google.com>
 <0b8a5c22acb87b49de0380c7cb4e49030f93d715.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b8a5c22acb87b49de0380c7cb4e49030f93d715.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_211609_871890_4B9C4814 
X-CRM114-Status: GOOD (  15.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 02, 2022 at 12:07:39PM +0800, Jiaxin Yu wrote:
> On Tue, 2022-03-01 at 17:03 +0800, Tzung-Bi Shih wrote:
> > After seeing the code, I am starting to wonder if the reuse is
> > overkill.  If
> > they (RT5682 vs. RT5682S) only have some minor differences, probably
> > it could
> > reuse more by:
> > 
> > SND_SOC_DAILINK_DEFS(i2s8, ...
> > SND_SOC_DAILINK_DEFS(i2s9, ...
> > 
> > ...
> > 
> > if (card == &mt8192_mt6359_rt1015p_rt5682s_card) {
> >         i2s8_codecs.name = RT5682S_DEV0_NAME;
> >         i2s8_codecs.dai_name = RT5682S_CODEC_DAI;
> >         ...
> > }
> > 
> > Or even uses of_device_is_compatible() if it would like to reuse the
> > struct
> > snd_soc_card.
> If we reuse the struct snd_soc_card, the card .name will be same.
> Should I change the card .name through of_device_is_compatible()?

Exactly yes.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
