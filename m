Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99D0C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:59:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90BCB60F11
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90BCB60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5s8fxu78HJGzN1fkKCsBJ7JpMyyX8s4Q3vY/cQHNOA=; b=4cLcrn6X0G3pg9
	OJXbtsTdrGHZik6jc94HIYkG/5z1oSyO9DqPdzZ730LeH43pKIRwe7aZXYORtq+zLa/yEwEhcyrMJ
	RHTF4nyQceaYRtdlFG67UR+z55A19AXW2baizWwoiQ/SDGzNOa3bsZyP7xG1LBjr5gC4/rXucNSia
	huN55Ma6tJCzx/Q5ihSCcD0SdShPBEMtLjm2zjj2VfN4XAy/9WIt2xlhOluqmTv1Q4T17gX0wEztT
	faSc5sgARjBXDJuglUb31Q1EI8TsVrooksy6Vqm1b9pv+TrPPBWWTkhOXXEHLmaeCUG0O/r/dEzyj
	PwWdmaQnKnYWVPj70KiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RMD-00Ff3D-5c; Tue, 27 Jul 2021 17:59:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RId-00FdCe-K9; Tue, 27 Jul 2021 17:55:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36BB060F59;
 Tue, 27 Jul 2021 17:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408527;
 bh=MbUdLe4herOvz3VgYQxFAs3Y7/pwlqErt8k7VK8fsG0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=BMt5TzVeB9P7NWfLXzDJgUczfPSQXygcPbyrRJk8LHgvg8yMyt9doa8SEVdcaRGFm
 3nP3kPNVbXiIKxh4WMd6Z2WDTOaKj5csrbRKrkbLqunNoR45I2jbeXGilHmq0zDVsU
 8kiYSRNvjsJa4fTpBZgrAugQ3esDt4uPxXNpo8OKS8stRfVj0bto5V2BkToj1mQ5Y8
 /EFWKUm5hVsjLrS3SnuvkG1AaWGvfTV9gUNADZQVkQptz0EXIN9tfX1l33j7phenHt
 H8rBtfI1rUyRN66pQfrpEFCRK3UoR5Wmr000i+urrgakmvHsDphhon44ocu3JlmSAE
 Bx97lTFNa/4yQ==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-10-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-10-chun-jie.chen@mediatek.com>
Subject: Re: [v14 09/21] clk: mediatek: Add MT8192 basic clocks support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:55:24 -0700
Message-ID: <162740852499.2368309.12116800140443844946@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105527_733123_F778FCD7 
X-CRM114-Status: UNSURE (   5.16  )
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

Quoting Chun-Jie Chen (2021-07-26 03:57:07)
> Add MT8192 basic clock providers, include topckgen, apmixedsys,
> infracfg and pericfg.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
