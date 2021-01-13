Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FBF9C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 12:54:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DD5F233F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 12:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DD5F233F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9jxnz/ZgmMJ/34/UDUALFUT0zedmfhqGPWzXTi/1VWo=; b=fl1s3NHAbFkqgIol3Lwfza+mZ
	3NR+8tqNxtohCORF2kiwlSc/F4XE8Hok79kM3tC8wv1atSPZ32Ak4KfN9CzQlxsWWeDetCnYwSmy2
	mcjW2Hk2gb4IjSSodqCWKN26hc5O++MViFh2+PFyuSLXVId8RO5lh7q9VJel/knbCBgd9/1Bjg10d
	mm/LpkFmjVqG2zY25AGd5N5yhib8RWhZKeCnl0zhQZ16pLI/tDi1AO/dPde3tg9m15Y67y1w0Zkuu
	DQGLv2kalnUPphpY8AGG5SxbOmhJD5Ur3yBcP/HxCeRkEl15RbvvBVcHPm6SSu+o0WxIr9KvSWlYc
	5BeIwCG6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzffH-00018D-Vr; Wed, 13 Jan 2021 12:54:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzffB-00015q-MJ; Wed, 13 Jan 2021 12:54:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D111233F6;
 Wed, 13 Jan 2021 12:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610542452;
 bh=XoZ3+HkveJD688OqbQa5akCHJkS2iwMRFZB5mx2FwrE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g9IbYmvjigVKlTn8edw3PK0dgtTohMoxtNPCdhRnl+MGU7m2tDz+ynHglun++V5zy
 tGIRZ8hjjK0LGMDFNoJqPdX8FVaHMUEg2EN2jm6SnIAPzM+vI95UkPgS2QB5/EHJ4K
 BQ7zRMJXSTFeiNn9JKqBRmhJkW9Xu+1/qjYwpcZDbLgwq63msdB0gntMCe1hYCEXPI
 b5/XJEoVPXosWsZaQScSkMIu0mhZH3IPjpvORmXO/lINyWAUuhGkHqZtUHV0LIiXBI
 vRL/9PlvPEYfn41Hreo8a5Ar4K79RkNgUlL6OQT/Q/z65f1qxDwAtn/zLXWNdhpFe3
 uu0ghyv3YOfWQ==
Date: Wed, 13 Jan 2021 18:24:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v5 05/11] dt-bindings: phy: convert phy-mtk-ufs.txt to
 YAML schema
Message-ID: <20210113125408.GL2771@vkoul-mobl>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
 <20201225075258.33352-5-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201225075258.33352-5-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_075413_851788_E6A22EC8 
X-CRM114-Status: UNSURE (   7.48  )
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
> Convert phy-mtk-ufs.txt to YAML schema mediatek,ufs-phy.yaml

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
