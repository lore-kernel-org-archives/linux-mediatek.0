Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E744C4708F
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 08:30:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CF72611EE
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 08:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CF72611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97VhVAv2gdOjwh6kiKaR4edq2HfnzewuraS8rSnx62Y=; b=PZnQnTn4qLqydH
	lGUGTFgaS0GNcZhVtLJfwLba4by6HGhWtbKqfkXP6FkdCYpvA4sQccLacurEFMsjHsvHgFA/TX9tg
	nSCrp7k0XYhnwGVwxrX/BvlZReREdH9TfRBmLv6IoiT7LCD7guID44oUbH0VxH7UBw2QRtFQGN703
	vgIFi0tIT0PRqT0UOMAj9WkDIEVAwZIcBIzWwjjblKKPEAtMZFWWEGlWQDmgMyGWsFrIbaHS9L25I
	e6VVF5mkXj+RLUB6pdiw66CBlIwEWUuNaSCT++6+q1QylX3gVS755nEq4NY36NTFSGIBVTcVD/fAz
	IYgSmEQUZtU2H+CWTYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lndJ4-00BSEz-0K; Mon, 31 May 2021 08:29:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lndHr-00BRqi-AT; Mon, 31 May 2021 08:28:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 09ECE611EE;
 Mon, 31 May 2021 08:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622449718;
 bh=CyJbfMGzwJNZlA99CLSRuq+u4eO2mAC1TIdyj8Vg2c4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yc19KuZdghby4ebCgT8IgUem4RbTm7z710VqZLx649KokwndqDrJbUOJa2QZUr5zh
 FS2RoHhYXAOHScLRfGXgNRaCaWjD8seNnVMrqu0BXxt3jw+0FDPfMROB/zQ1fzWx8B
 QuH3szbvhO9WZp90Xzyq7VDtcY3zPE5ibvLju1o5CCS/JJxI40us/t5JzierdtzwDv
 5CO32MLUqvNajPf8qhti1IMeBA9TIj4WEBwsD7c8pSBtjJmbnaAnQIS0MGoBSvj6br
 RPF602gI6acx5wG/fiRy5y8jPOZbQnS6DRzBVkcQpVSqtvsgnfMawyEHJ1lWwPMMGa
 OhZoozrcqOvkg==
Date: Mon, 31 May 2021 13:58:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, lkp@intel.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Heiko Stuebner <heiko@sntech.de>, kbuild@lists.01.org
Subject: Re: [PATCH v2] phy: phy-mtk-tphy: Fix some resource leaks in
 mtk_phy_init()
Message-ID: <YLSeM/yWWQC81UUs@vkoul-mobl.Dlink>
References: <1621420659-15858-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621420659-15858-1-git-send-email-yangtiezhu@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_012839_409592_8A49CB9A 
X-CRM114-Status: UNSURE (   5.34  )
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

On 19-05-21, 18:37, Tiezhu Yang wrote:
> Use clk_disable_unprepare() in the error path of mtk_phy_init() to fix
> some resource leaks.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
