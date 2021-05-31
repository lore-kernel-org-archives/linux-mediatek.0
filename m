Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23135C4708F
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 08:21:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBD2560C40
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 08:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBD2560C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7Ymt/SMdRe8+ZXVL4AcfP8/pdFqBJ4Csa8qkKgtxOg=; b=I4xyJenLMMYvOf
	7humrQxIXKGxD37Rhp2J7nOt3HOfP0se10eMPBU98rqUazQxcN0QI3bHuuHBe1FdYa5HyCe9l8Ama
	upMPyOXJhIvHA99cBimNeM0fqgRQSNgtMTbrvTR9AIlXXkyp6Myw0siTwl5yL6R1hTEJlSlzU6SR9
	83sWeLgLvIOY6wHPRvdRlT+eS3gQ7zeLO1YNyCJd+69rKhGTZAF9HTinxpwIOBpOao+u0QI+Xxqw+
	59o2dYHNiOSN7L2zPaakvAT73bDQR+p8asvYo3dYvvPboicdKdhmG4Z3E3POMhA7wFX3TVu2ifXdP
	f8H1GSxdQLqUNB6Yva2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lndAr-00BOvU-9k; Mon, 31 May 2021 08:21:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lndAR-00BOoe-2U; Mon, 31 May 2021 08:21:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8292610C9;
 Mon, 31 May 2021 08:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622449258;
 bh=vmUYIKjdjo41zxqujXvd+GFZFYx6lGao8+TVeZyaifM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Csd/qFZwR19rLihTqVQpvB8jY3zmR6QqcwHIcGFZmNFEV9FmgVD1NcdGx87JpdQZJ
 EAt/wJhqUwVk4QxAPeiTkedBfLZLEaIFWrhN2SvWGbFduVujW7TLNZqkw4OTdSYrj4
 bxEUfCElwoJ8qsEPUQWndpiXWKKLweQVkfWiuTWR4tezJAly9YiNZDG8Er6LcylwNk
 XPScmbtMWwg5GkHtsZIb+49y5pR/Ev1NM5Nb0OK6Qw6rcNioLsGTXbEZuzRLdYzYq8
 paI7dkV1S8Llm+b2F/JnnCH11+x+Z2Vy3s7MPceXXd0vZutiYZluCoA6XPm7580wzf
 Du2M8S2WSfc/g==
Date: Mon, 31 May 2021 13:50:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] phy: qcom-qmp: remove redundant error of clock bulk
Message-ID: <YLScZ07aLTBMVwK8@vkoul-mobl.Dlink>
References: <1621229841-22984-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621229841-22984-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_012059_157764_7A59A53D 
X-CRM114-Status: UNSURE (   5.52  )
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

On 17-05-21, 13:37, Chunfeng Yun wrote:
> There is error log in clk_bulk_prepare/enable()
> 

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
