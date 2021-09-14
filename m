Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE93DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:20:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 812EA6115B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 812EA6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Qg/WCwFxSviASVKeBTxZDCTvFKi+GdeytGCxM4xpPs=; b=tYtjwhY4TtD9NE
	MpRPRxJ9VX2xN+00EvphkaqbBUAQW5lU6vjW8I6n3+K8f6F5qHWeCDGuojMhxdObX2s9CRX70RhcH
	HP9OFUX72pR+JlGQPkO+PGSsxrrLzigTFQJ5xZOCMR3XkBJ9MnxM2c1V5Ya179odz975NsKqrpEGP
	zyq+vHCDmocNV/3iK3MoXfVJ/ZOqyJVsjjvQwSEtI2Cq3JaccROKhwfHGQpgdq259xewpgcZnFqMj
	P1IFDA/mdY403P7cDlAff2iGL2Ly7Z7+5FF83XwboIDFdd6S5ff1SFGQqP/5optrIUUjnd6oJ6sRh
	r0w1BeSCR2IpsgJ/IlDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGmV-007Jl1-Cw; Tue, 14 Sep 2021 22:19:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGkq-007Iv1-6l; Tue, 14 Sep 2021 22:18:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4D4B61166;
 Tue, 14 Sep 2021 22:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657895;
 bh=MsfbPxyCjoEu5YUx1VmHVZqWv0E2F1FKz9dVKhBh8hA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=sAyf6CTyt0HYu+rueK6LyANOUU4YOC2+33uvMxxIjDW1ov3nG5VGKDw62Jgx4yUtH
 onaWb3RrZByps3KigJVkbU7niJQWS7exz5QaIsHWVYrmhxIIS/wMSYDsvIYeC9WhJq
 SAkumAhzA/Uw+m8G2goCNuWAMyrg8UWC0AOTQe274xEMGPjb1EQFeiyVbJsp/oPDoW
 7iy7Us8o9ANp4s3YIvfvw1QZLLAbkAKtzjzPGLlddupcmgYdRAf6UonUGy6UFM+X5F
 nbRVAJBi7A8MC4UAgLzB2llnfq+mLDjlFdtRwt2rp54fYcm3LDHe9lXfzdG9gnaEXA
 hr+UXhWtQgSgQ==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-6-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-6-chun-jie.chen@mediatek.com>
Subject: Re: [v3 05/24] clk: mediatek: Fix resource leak in
 mtk_clk_simple_probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:18:14 -0700
Message-ID: <163165789454.763609.3729811744499552764@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151816_324164_E6814192 
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

Quoting Chun-Jie Chen (2021-09-13 19:16:14)
> Release clock data when clock driver probe fail to fix
> possible resource leak.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
