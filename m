Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB22CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:23:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B716A61164
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B716A61164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HLqsksBIzi5WLJTgJg6vZyGIT0QfTtWd7AuLQozOfs=; b=BQz2fYeL/ukIks
	eXTY6u9iwCFvnMoqyOEFFl8cTpPZWleh2ctDKJYpoS7s/quUGVhDC+2Ywm9S9S0lT2oSIPaLG1lth
	gB1e6NmtjCIYyUFdVjHxxl/Exy8yR62jZvRvaeQAJBLKITKty1LoQMZRgozTpifIDyEURx3KebI7V
	nVmhSrp9QUYF2uxYCLAAixDYJjfP8RZvnH8aYlarizbog9ZgCnCnNP8k6Pb6Zq8g+wXOJF2FUHyuB
	OTdeJ3ENyiN5yzUpP5u1O9E8k7poRU0MWIYtcL4bCgZiS3vOgzm9lHs1SCMkUfdWnrAyzYxs6Pdr4
	o6zJAqYnxQzaaQ8t4HUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGpn-007Lfu-SO; Tue, 14 Sep 2021 22:23:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGlQ-007JAu-12; Tue, 14 Sep 2021 22:18:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 932226115B;
 Tue, 14 Sep 2021 22:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657931;
 bh=Z60ok01eefua5+Ef4EctBFxO37Bt6jJDaP6jyWkC2u0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=i7SdWSd8d7CSX0lZP9g3/wdqWs1FyVjHyNhu9mMbmqBYzj9+CE20nfL8GsZpkMVAO
 rO1cf/8a6UKlXAty2UnudLlkH0TRPfbXO+I09tyWMqiYzrA/MHcxH6DxGm2hdPWWF3
 Bno8ftwcDPTwYDjmH72OelRBf+JlDojNlsB+WAfIlF7yiPVhZP7xhBkXeEV6PLYc3I
 sFQoBL5vd4Ad4EOXb5ztfNsGt3u6+0Oz8PA/MWGRGAa/2Wkzzfz6eR349GPFQ4llt9
 DLPmAKaYYcnucgmM1ZZ/4oC6ilhY3DGryqpoXNsDAuSHi0uIu6llIEpnJ1l9oxzO6Z
 KSCjiCNAu84VA==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-11-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-11-chun-jie.chen@mediatek.com>
Subject: Re: [v3 10/24] clk: mediatek: Add MT8195 camsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:18:50 -0700
Message-ID: <163165793044.763609.104075678117595652@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151852_157979_CDB7D3B4 
X-CRM114-Status: UNSURE (   4.82  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:19)
> Add MT8195 camsys clock controllers which provide clock gate
> control for camera IP blocks.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
