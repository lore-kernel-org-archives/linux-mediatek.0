Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ED9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 17:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbhF/f+zgLbvKuca4h5eJ5OgTZp5YXTU27owagHEOSc=; b=pYvap6gOzrOSUq
	S54al4scnm0QZoShoFUtpGNO+aUxIOd16QcTDhrSXo99DYx1/EpcvHz9e3c1qeL1JeyKGe7QruoPq
	iTqaBLbNRJzgo/94UynlmRrLAsHcVJybcJbTIaWQBAsHKeO1gm27Gul4XJUIYUHq9xvWuSqqQSrhP
	xBFgbJbArlWtYwfkoR/RwbCmXvMhuIihUIlggcQxwYeIoIEqjRdG61FvIZ+OLTxOs6eXaWLeslO5t
	KW/c8x7JtVV48YdZI0TOGZ8ayTWTE901/NqQhfOebM7gxbcl7pNiQP/LcYk/+/OW+EY/sL2Jp8tEc
	lOyVuRFttR/qObYYcIxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRdOz-005Rvk-Lx; Tue, 08 Mar 2022 17:13:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRd6j-005Loy-Fc; Tue, 08 Mar 2022 16:54:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F3B2CB81B5D;
 Tue,  8 Mar 2022 16:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6ADC36AE5;
 Tue,  8 Mar 2022 16:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646758482;
 bh=U6ODwZ0lHZ9Peu2ZCYLqVvsDYn8D4fdf3FI2MxZoZso=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XGB4ecG830EkBMf16KlND+uGxx/gj1y+F8ZFvYImcsvQz4l6+UVqn2LxgQJyA7ZvY
 itDDNY+h7dlT/ll3nCxRg0cpYXnVUiD8x6NxsuD05tPKvZf4gEJrccCrLg1M4cpGS5
 efumvdBC3fpCHTrFz5Kltk7xQa1E2fEtrnEYLiSt1WuoR4GWh9RCGUh9vYdpoBoxXz
 RrkLhTQ0DNzMilkfL9k805wlXIcWDAVCDA2bndzgZ8v9ccEfY1p7lsG3nLPKg1ISk9
 7XlFw18Z0jUyDp5NCaqWdITwZ8ICqBGZJWeq1EfiZ2Ho2ciIKCHuOKDoHAX9fiwo2q
 4H0FumZzdGOWA==
From: Arnd Bergmann <arnd@kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [GIT PULL] drivers: soc: mediatek updates for v5.18 take 2
Date: Tue,  8 Mar 2022 17:54:00 +0100
Message-Id: <164675831448.4164581.5272394005791917460.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <e1b90372-a041-db6e-f35a-d17b26069e40@gmail.com>
References: <e1b90372-a041-db6e-f35a-d17b26069e40@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_085445_717582_9A3A10AC 
X-CRM114-Status: UNSURE (   9.84  )
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

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 4 Mar 2022 11:08:45 +0100, Matthias Brugger wrote:
> Hi Olof,
> 
> This pull request fixes the compilation error in the mmsys driver. Sorry for the
> incovennience.
> 
> Regards,
> Matthias

Merged into arm/drivers, thanks!

merge commit: a2d266a8f1fc9c0576e4407c4d5dee83ee29d6f0

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
