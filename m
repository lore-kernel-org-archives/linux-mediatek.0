Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4BFC04A6A
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 10:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVTFYmNWV1jP27+FDM4eqhSzMI/cuSd7gi5VmMNOAfg=; b=eCRpLQXdn+S5+NDpkOZMWvrSAQ
	pyxfMEr99n0ZTr33KhGwDhbJI0tXsEKICTVBj12PtPzFk9PK3JUzw09yxPB7lhxVSbyObfwBULTK2
	FL7HZR5XiKQKbGvqn+hSFSgWB2swp4wFqa2OEyPcXypYFyk2YLLrAVchMw/JlQbJF6soCdzHSFqdS
	oAODT3ZrxIqD0qbblu+ENFgDymBn8UtJ0/qN4pdF1K4Ogt40aK9f62CvUacfQOUv6BeuF4yLtCd5e
	OClYFL3CbBTEeUuXFIMFcZMs9oG/VPMGxZjU+icQ1tBCNXMFZ/o6Lbvr0WUnK7Wiq9eiNiGLH2baZ
	t+7lIX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOFe2-007Eeh-1q;
	Tue, 25 Jul 2023 10:51:58 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOFdx-007EUk-03;
	Tue, 25 Jul 2023 10:51:55 +0000
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4R9DNk1zV3zyRB;
	Tue, 25 Jul 2023 13:51:33 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1690282303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nVTFYmNWV1jP27+FDM4eqhSzMI/cuSd7gi5VmMNOAfg=;
	b=OIKPneVysIIsOt0iRF7c9GoTrhfIJR3pJ1fYanttlyHbKxBnxdV50h3BXqREUF1tnvN/8H
	ttNqApgMpAYqB7vDQZc+xH2UvgGKtx66Hw1y+pGiPqPEw8hU2G2wzUdMtgPO8868lDUEuC
	mAamey/Dq8fuzD8h9oyCJhONbjrEu28=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1690282303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nVTFYmNWV1jP27+FDM4eqhSzMI/cuSd7gi5VmMNOAfg=;
	b=B8bdNu9uBV5ZXRnWapFwaJRrCRvDVUeUl1pyKdPWhaxXOVJ824gQaLzPRbWHbGIpGc9grs
	jqcDmI9Bw1kzqTupLqxIloBqC/4NgCsOXWuXufhnKIg2jSO/0Ve1RtJU6Ax3Z+d0PLJPoe
	dAV05DsdXtLCk2N97Jcdz7E1wVO/iwM=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1690282303; a=rsa-sha256; cv=none;
	b=vct141sa+XcGyQ1kVIQejOrk1qw2TvdjLqv5zflvOIbiywY4zEj5ryKGPtYOfkQM0he69/
	7oqKcieTLFTTIM75qqs7mrU3HO4obQNPfyig41htRHqPfObXhKwFeAh5H9FyPca2wIIHTX
	Wvb5rALlBcEDu3u29PPObFj7UthU4Mw=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 304E7634C23;
	Tue, 25 Jul 2023 13:51:33 +0300 (EEST)
Date: Tue, 25 Jul 2023 10:51:33 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Joe Tessler <jrt@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Message-ID: <ZL+pNUYymeXv5EoU@valkosipuli.retiisi.eu>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <98a77653-ec58-56c4-9893-3b424f67c87e@linaro.org>
 <5afcec8b-b8f6-35b0-278a-5de185e4a7a2@xs4all.nl>
 <ZG9XJCD98VWjGjTN@valkosipuli.retiisi.eu>
 <ZG9ger4WE2VWoVEF@valkosipuli.retiisi.eu>
 <158425ec-86e8-ca3e-eed8-e14b37c42730@linaro.org>
 <ce217ae6-6dd5-26ea-2ce7-95d97ef791c4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce217ae6-6dd5-26ea-2ce7-95d97ef791c4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_035153_245245_FD1B258B 
X-CRM114-Status: GOOD (  27.73  )
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

Hi Krzysztof,

On Thu, Jul 13, 2023 at 08:46:58AM +0200, Krzysztof Kozlowski wrote:
> On 19/06/2023 16:13, Krzysztof Kozlowski wrote:
> > On 25/05/2023 15:19, Sakari Ailus wrote:
> >> Hi folks,
> >>
> >> On Thu, May 25, 2023 at 03:40:04PM +0300, Sakari Ailus wrote:
> >>> Hi Hans,
> >>>
> >>> On Sat, May 13, 2023 at 11:57:33AM +0200, Hans Verkuil wrote:
> >>>> On 12/05/2023 18:35, Krzysztof Kozlowski wrote:
> >>>>> On 12/03/2023 14:12, Krzysztof Kozlowski wrote:
> >>>>>> The driver can match only via the DT table so the table should be always
> >>>>>> used and the of_match_ptr does not have any sense (this also allows ACPI
> >>>>>> matching via PRP0001, even though it might not be relevant here).
> >>>>>>
> >>>>>>   drivers/media/cec/i2c/ch7322.c:583:34: error: ‘ch7322_of_match’ defined but not used [-Werror=unused-const-variable=]
> >>>>>>
> >>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>>> ---
> >>>>>
> >>>>> Hans, Sakari,
> >>>>>
> >>>>> Can you pick up the patchset? There was positive feedback:
> >>>>> https://patchwork.linuxtv.org/project/linux-media/patch/20230312131318.351173-1-krzysztof.kozlowski@linaro.org/
> >>>>>
> >>>>> but it seems it was not applied.
> >>>>
> >>>> I see it is delegated to Sakari in patchwork and marked Under Review, but I don't
> >>>> see a corresponding pull request for this series.
> >>>>
> >>>> Sakari, did something go wrong?
> >>>
> >>> I spotted this as Hans notified me in IRC, I wasn't cc'd. Apologies for
> >>> this --- I intended to take these but I think I must have missed something
> >>> important in the process. I'll take them now.
> >>>
> >>> Thanks.
> >>
> >> This no longer applied cleanly. Mostly there was fuzz near .of_match_table
> >> changes as probe_new (and remove_new?) changes have been recently merged.
> >> There were other issues as well, I marked a few patches in the set "not
> >> applicable" as other patches had already done equivalent changes earlier.
> >>
> >> There were substance-changing changes in the 20th patch, replied to the
> >> disuccsion there.
> >>
> >> I've pushed the result here and intend to send PR to Mauro soon if there
> >> are no issues:
> >>
> >> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=of-match-ptr>
> > 
> > One month later, I still don't see this set in the linux-next.  What's
> > happening here?
> > 
> 
> I don't think this was merged in v6.5-rc1. It's not in linux-next,
> either. Another month passed...

These are now in the media-stage tree
<URL:https://git.linuxtv.org/media_stage.git/log/>. Assuming nothing goes
wrong, these should end up in Linus's tree for 6.6.

The issues related to media tree maintenance are being addressed as we're
changing the process how the tree is maintained. The patches will
eventually get in still, also expect this to improve in the future.

-- 
Regards,

Sakari Ailus

