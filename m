Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955E5C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:01:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E9A60EB2
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60E9A60EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8RdTfAEshL7WwolgRiv/dbELpiJqEQaHoAyFfTTooU=; b=FrYMaj9r1Ivgjn
	k954mjjZjIL/iJWRCvfIP4VV/Ty29uVGVvpVCEEdEeEjswsKSpaE9Lcvo3GnEiQw3SwPXnJnB3qSf
	FE65PUEAdly2iy/4yuQ0+mnGynu/AGnsQKiwe3KBktRfZjH5IJKhTRuaVLGulWaj6PEAZfehzQhXC
	86D7JufDpS8N5xTq92nYXvkKgEyoVAyaP8KxZ2/DoUUCyiq892+LGm94xZIC8dfohrpf48aivi/Oy
	pGj0Tz8x39dz+6veRR2QQFUc5fZ0XkYHG+Dtq11gzWYaXN+P/maXY9NT2Z9hEBemh2y5XZXG6/SHa
	JmWBoisEG4hsIGUqGSCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8ROh-00FgHi-0g; Tue, 27 Jul 2021 18:01:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RJ3-00FdQU-St; Tue, 27 Jul 2021 17:55:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DA7160F4F;
 Tue, 27 Jul 2021 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408553;
 bh=smtLvJcO48Cr/GlWu76S6GyKdMQWmXLPX4mM+AmMsz0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=WDJ5yAKAMlaNc1PLD6ysHyk7TZKNO84xYEiCby/fN7nt87Ruirn1XczOlPcFPLMV/
 m42mRZtFs3CV3YLQvrQ2mRhh4fVCPwJvtH1ynyroRPBBGnu3doaR+luAALZCTPKd3b
 t8dj1QuMzSK/xnL1tq7wAzk1uCem+M1xtabxUOZ/QaNTZUStxRD0aP8x/rZXGPu5T7
 BXzj6e8pXvA/vp9PShuEYfHUNuCKE56M/3tvw/7tAFYIgsYcGoFc6Uq2FamUbL6HZI
 JszK7NQO4TeGUGACrnvoKyOJCpH5FMXoy332oHNe3HXtJG09W8//1iIQxvwEqGQ2Vt
 evgB/ksU82KzA==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-12-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-12-chun-jie.chen@mediatek.com>
Subject: Re: [v14 11/21] clk: mediatek: Add MT8192 camsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:55:51 -0700
Message-ID: <162740855126.2368309.16697502176155707933@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105554_008422_B8F0B523 
X-CRM114-Status: UNSURE (   5.03  )
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

Quoting Chun-Jie Chen (2021-07-26 03:57:09)
> Add MT8192 camsys and camsys raw clock providers
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
