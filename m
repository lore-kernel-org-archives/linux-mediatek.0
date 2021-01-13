Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADA7C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 12:54:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A88C2233F6
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 12:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A88C2233F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fDONPYQFyctL1YHwxHGWHG4dEtfespHAF2o43GmHlps=; b=OV2W3UnsNn+hdkQTfNOiZz/Ly
	nrheOYWGy4HBrVB9DbpWX64SX6zUbJuxWW5sAMpf861bVh60EWbsb7PWs0OoV7d5ZxurUumrkUEEV
	wXVoURMKzJNP3G6MtK9mGrfTHmhohcS14yY50TaYiZJzbvbLvgSQ8yFiUeK/VPiGHzsAvKhi+RpcJ
	GqL6V1tOwubd/SQTPgxZwvJO0PWxC0ZmEqr52IXzbNTcGKFEyjbneNcM/1dE9vAN3qKdvsIf6SLNN
	TDxN2IhWexq+24jiwbXA7a3in0f1uIhdmBYqwJBsIYIXFGhibVuIvd+qKa0/NNNFb9qSAErI0WS/S
	5VUlF08pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzffb-0001Fh-TH; Wed, 13 Jan 2021 12:54:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzffV-0001DG-Fs; Wed, 13 Jan 2021 12:54:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4E32222F9;
 Wed, 13 Jan 2021 12:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610542472;
 bh=ha4DGgePmLUz5DawJjbkL39gsXdnG9tY1EHFdTU1Pm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ow7pz/hS8zbpvP8E0oy4yive0IVP0A+4IlWeVlUaWJboi4zm1/f5ZZkcWHW7rmZ2i
 nqhdOxXT/5HMclwSrI9qtK1feBzX9qNvn4XqLiwRVeNeZ4g0dXiw19sUtaYF0SE3HY
 Oqq5nCk57pjy+YcHvpovnh2u8w82wffWnXJ70dRZYmG5TWyi7ZsHOheVI1yVoyKi5p
 N/SIrIvnGGpEPxgb3r40QNghtTzDP53r+mt9ehoyTk3bGpV1lJUJfSuM/3M/aj6hR0
 jFPjj2Xhe4xQ1WQOSxW8hTzA/78zidUkTqriu6eY8oHozZueELfGctE6HLB8beG75x
 JTaGQ+PByZ2RA==
Date: Wed, 13 Jan 2021 18:24:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v5 06/11] dt-bindings: phy: convert HDMI PHY binding to
 YAML schema
Message-ID: <20210113125427.GM2771@vkoul-mobl>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
 <20201225075258.33352-6-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201225075258.33352-6-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_075433_709166_23D442F9 
X-CRM114-Status: UNSURE (   7.26  )
X-CRM114-Notice: Please train this message.
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
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Min Guo <min.guo@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 25-12-20, 15:52, Chunfeng Yun wrote:
> Convert HDMI PHY binding to YAML schema mediatek,hdmi-phy.yaml

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
