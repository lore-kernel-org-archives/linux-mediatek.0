Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFE0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 06:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOTuz/I46rCWiTOZkxqUChup6iV3i8rizFtVexR0XmM=; b=dXi3cPlX7rJZXM
	vZ+FSfuUfOelXZIvi1QqJsaMSVz7v3IC4PO5LNpeUSYByKhODUMrgREEJizK2UmiBw3hvk+NcrfJ+
	UiH7bphd0T2YREKtf765eXy2lx7DkrYKEtdj6KZ87HSIk5gRsGYmry0lNPpj8JbOu6OgNn6kjalWe
	qRbcdbnLdu4gxkaSsQLT8OIAYwnN3icjYHqqcTPV+hj0z5JpyPYd0rhls4PRFirWZ9a9ufATo0mEy
	wqH6X0DqcTcUoCYIfpOqDqz2yCnZN5doUigTkxbZwfn229D+mMwNtz2DhpmKTp+VGeZBLCARPnC6m
	RSEwOn+Z7TbJ09GHummQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCyUa-00EZJF-EX; Thu, 27 Jan 2022 06:42:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCyUJ-00EZCD-TF; Thu, 27 Jan 2022 06:42:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3681C61934;
 Thu, 27 Jan 2022 06:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF12C340E4;
 Thu, 27 Jan 2022 06:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643265750;
 bh=9qlTOBaZNbP5dnlI7UztbiokMnyc69tSR6O4YogHR7Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oT3vbOUYhUAMuY09dZB68GNBA9vykrSTmEdZdqPdCmaGpns23+JAGCt+7Q8jHM5Jg
 hhh7/0ycc13nKEdqIQcpg5Tx1rx87tbG//rOIh//8RCiHWr+YbOwTQ0ZwlwUi1aqY2
 ljGIEe65jW3s/met8orQcFc6cDFhfCGv5OlXeDfIRyJzEhN+ZlHV+Pyr+KWIM3vMRC
 GbZgIc8xk3s1DiVzgBe2TXU1V+wV4fLprAQejgCOno5Yd1RylnUizzBKx2tH6VXXYq
 gh1+6dQW5w54G8VEue2W3RTZUGsVkLnbjPRXGNFFPnNYen68bdODXneLkeuz7DSbDW
 fxHUPoWsbQBzw==
Date: Thu, 27 Jan 2022 12:12:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Wan Jiabing <wanjiabing@vivo.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, jiabing.wan@qq.com
Subject: Re: [PATCH] phy: phy-mtk-tphy: Fix dumplicated argument in
 phy-mtk-tphy
Message-ID: <YfI+0uzGZDLig+zC@matsya>
References: <20220107025050.787720-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220107025050.787720-1-wanjiabing@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_224232_012572_6FFD8804 
X-CRM114-Status: UNSURE (   7.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07-01-22, 10:50, Wan Jiabing wrote:
> Fix following coccicheck warning:
> ./drivers/phy/mediatek/phy-mtk-tphy.c:994:6-29: duplicated argument
> to && or ||
> 
> The efuse_rx_imp is duplicate. Here should be efuse_tx_imp.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
