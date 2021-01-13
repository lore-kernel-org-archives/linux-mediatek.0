Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40C6C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 12:53:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96427233F8
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 12:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96427233F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NrJzZjXE/uAVDux343Jbbi7rqvklHcdfbNAFGqONbws=; b=peS5/zTgqq0dD1wvH6WbYaacW
	6UyuB4g0LOO4Hu1N+VA55UvHumV4qUY2xq7bgg6ZJLybAuPSmbl4IiOU7s6T8WiM6GS3lOIzp7WHC
	C2r7c7NKKopi6RtOBA2jetQndNmb6SdHIMsEc4NF0ht6NLFpoL/XxvIO77y+9XWPUkuMPCi4zcSNa
	I6GiU97pDaHBBKaQmfW/Elb6uR5WSvgkqbsLxnU1G0PiiYWjKOI+F8DKCA/+6s4l/+iHQ7gQ9Erxw
	noHU5uAXvMegmbYy9WH8JFgs1T9AEWpwBHlDPVdPVAtoD7OvYlOkKWlxiD++h4pH7G9BqhTU6skam
	L40p0VajQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzfe0-0000se-9F; Wed, 13 Jan 2021 12:53:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzfdv-0000rS-WE; Wed, 13 Jan 2021 12:52:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF664233F6;
 Wed, 13 Jan 2021 12:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610542373;
 bh=K7rfJRt7FTyScHAF7Dc1SebMYXDZ9njQhTE1qfF4ZUc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l3zntwyUARbT34Zn/5cgDiko7uTG+bQ0XokCI4osKNhDgqKgLoy0CmYnemvogSu00
 TMZ0e7XiyjGU2WF06hXeW+bWerZDkuPTrzmRFd2bx6/Va9J81cwgmHJTTsiUnwKqVu
 YMO/IlSkqrmsPZaxiWbnpQYjgcvGG5ZmBlASJT/RTB2N2eTd/lYLVg86sasG/Y4KtO
 CF5auJsOgsqrrP6fYDUfl56IZaQi9R0DOF8TFMkLEJNJsX+WwzlRf/3AeiRRFeSWCi
 GQwFk4ljSf3dhg0i8JLBoqBd3cmxQWp3Czctpu8TWE0pVvrx/PqO3M4mh8W07xY1lu
 AEnGW/dr4Z0MA==
Date: Wed, 13 Jan 2021 18:22:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v5 03/11] dt-bindings: phy: convert phy-mtk-xsphy.txt to
 YAML schema
Message-ID: <20210113125242.GJ2771@vkoul-mobl>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
 <20201225075258.33352-3-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201225075258.33352-3-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_075256_139236_B415C0E9 
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
> Convert phy-mtk-xsphy.txt to YAML schema mediatek,xsphy.yaml

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
