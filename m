Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB51C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 16:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyJt7U9YqDKmlnXjHPOeGFSqHew8842tyTNqo2cfPYc=; b=vfyHlIBeTkJYXIq2j4xrwZIAV/
	YqHhbAffH7TDooruJicrz4FY3CSPpenEe4GRJUdsBASsTqH91an+ymqh5pP+zjRlBSjr2/omxWCmT
	E1m5v27UtkDCJ+t5o08MpEzQMrEKXbyadIKQPK/+pgiKZ+SQx7bcgOvyIPlfhHDS083cyoWPeG58i
	ttnKV9z/WmqQvE36qSS9m3W4looguWMN8yrvhFOQhW9uiWuzZIDmOopKL6HCC5x2jgfmK4VVMnmkZ
	D1cCDtIPnktAquCyXLU5BDiAqQ/enkOQ7Vfo2+eYrUahR2b3bsBTuU8xrqo/B4cFTanl0ohwe8XaB
	o1qbJXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Jdx-0061zv-6K; Fri, 01 Jul 2022 16:37:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Jdl-0061vF-2N; Fri, 01 Jul 2022 16:37:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A046DB82DDC;
	Fri,  1 Jul 2022 16:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5645C3411E;
	Fri,  1 Jul 2022 16:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656693426;
	bh=dvn0q53TXBDnV3Qt4aSdr2WzDOqUHtfan8BhemxpCOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QkiDgZpOfaN9dOsDRrcDsbMySgGbQpKCeO+no3q1kSX+1cRgqA2x4iEzPdY/XW3UF
	 1+2xoNv9YCEy7Q2lYD4OCwmmWsdnAYTFzcCjV1CrNKS8xmZXVPb+0Uelzf5iWfWx7g
	 prCRoRfZtwtTMVw3j99tU/q+FAW+tbfcH1E/MTMPYNnmoM3XhZbgodSspBaCkRzIHH
	 eXzeCb2+JRoT7Rs2YCkucN713hRlcycMY3jm5NsgaWoDCC0dtJv6efdUljoPTbJ5Oy
	 v9buw0XVWJyeh4Dc2K3+zmhU0AgZLwv2zdi6fW/VbhS9zqdApMrLm9fSDidJRNrAH8
	 4Eut+nwcApcRQ==
Date: Fri, 1 Jul 2022 22:07:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Xiang wangx <wangxiang@cdjrlc.com>
Cc: sean.wang@mediatek.com, matthias.bgg@gmail.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: mediatek: mtk-hsdma: Fix typo in comment
Message-ID: <Yr8ircxQa4I7/jmW@matsya>
References: <20220618130120.9783-1-wangxiang@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220618130120.9783-1-wangxiang@cdjrlc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_093709_301288_B38F9109 
X-CRM114-Status: UNSURE (   6.61  )
X-CRM114-Notice: Please train this message.
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

On 18-06-22, 21:01, Xiang wangx wrote:
> Delete the redundant word 'be'.

Applied, thanks

-- 
~Vinod

