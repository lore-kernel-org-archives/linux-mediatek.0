Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87837C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 21:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7GYyfSwkm+4DGAU9Lygito/OdzlDHYxrWBhfAcAcU0=; b=vQ8OwqUxtSuBtC
	yQCuc10y/C/1eeov7/8MayosO3iavBTwkRmHhXTuNWfD4jLQfcJZvbSvU9uxsYl/Qzqr5Cpms0adM
	wD3DASK+Ad01/7ap8FceK42yO0oXQWg/RQWNcWCmZC2rJcPoYaYzbSS7pX5Vwyjjo6wDiOnETxNfL
	bbTjisHbadnMO17Vz7BKzbFPSn05GYba4ZsBvRNwZk2jg8VQVY24l06YPNJQ3vciVBr0DocjDVfhx
	TcmTmk0aice3T8A5uo0e2vfLxVrJtyAmr1Ndr58NBwzYKTI5JN/ayvJdbPWcDCyfzN+Rh0qaIYkA1
	cA5Cj0ISOktryBk1fuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrRUW-0044W8-I7; Wed, 18 May 2022 21:46:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrRUL-0044VC-L0; Wed, 18 May 2022 21:45:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E63D0B821BC;
 Wed, 18 May 2022 21:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30FEC385A5;
 Wed, 18 May 2022 21:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652910346;
 bh=8ycTWVvX6puDTwUNj5c6I9dNAAzsSHDh5Ka/xeEnI9E=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=hWuW8UDwTfv0LOlg3CyRoDs8RmNiVuXq0WUcLqmXOUror4WQhUTbUN5tSE/pRSC/O
 k3T17CqC9B4sCpL0Ct/PDfImMKDXmfJNtzTUG2nM34k/JsudmBEjW4KDFtQFoFilmj
 WtiFub+zvVC3bvI0hY2cmgZDmtk3w3YBmn+N1lVm2ddBzcQ0ayfUOTVTN8WGpLafKF
 KknqABLM1ejmCaSlojhWPC+3tn3sKTV5QLRcqOG0WNPO+UuLUIsUXyoIoVo95DcnIH
 BvYfSPh1pGmw/22W3nl6D7KW2mrs+HRKbl7qoI1N4cqljxy7e6DQ3Cd42xnWSIyhaY
 dXnLbmrARS9hg==
MIME-Version: 1.0
In-Reply-To: <20220510104804.544597-1-wenst@chromium.org>
References: <20220510104804.544597-1-wenst@chromium.org>
Subject: Re: [PATCH v2 00/11] clk: mediatek: Move to struct clk_hw provider
 APIs
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Date: Wed, 18 May 2022 14:45:44 -0700
User-Agent: alot/0.10
Message-Id: <20220518214546.A30FEC385A5@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_144549_876264_C193D887 
X-CRM114-Status: GOOD (  11.52  )
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

Quoting Chen-Yu Tsai (2022-05-10 03:47:53)
> 
> Patch 10 fixes, by hand, a build error from a call site that was not covered
> by the previous patch.
> 
> Patch 11 converts the last usage of clk_register*() in the MediaTek clk
> drivers.
> 
> As mentioned above, this series includes parts that don't build, but are
> split out for clarity. These are patches 3~8 and 9+10. Once the patches
> are reviewed, they can be squashed together.

Sounds ok to me. Please resend with the squash and I'll apply them.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
