Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E47BC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:57:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00D4E6056B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00D4E6056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=az2/hsjuEO9mr6jrny8EzHMnTWZAfI2zwFDqLec22qg=; b=Sm53WwQVNZgKfa
	Dzthiz7i+dIywSBSTg5JGaPzyyhdgQBU33rASp3Lz35/4lNRQ9YJyNcwFs2H8A6ON001HKr83lcjc
	sbI/+yiDVlxdRCxg+m6zHXV5xRtP4amG4Xe34CiXjmxvPoAQmTE3IZD0SMzMr+G7Ig59crx8bPh2u
	Yw5pc02EE60EqxXgGgXF6x72Dh6pfkHMuysT6AwjWcKDvVcMDOVyLvc8BCeEXKTnGTdIulEPjHIJz
	AGQiEHbtAiZvlpBzlSxijFtAE36Zi78P/U15UCt5QH9rfVTq1Wpd6sshZAUgGaBimtojRhkx7Ym+n
	J2rqLjFDl++7zJ5AJg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RJv-00FdsZ-Bj; Tue, 27 Jul 2021 17:56:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RI5-00FcuB-2t; Tue, 27 Jul 2021 17:54:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC97D60F4F;
 Tue, 27 Jul 2021 17:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408492;
 bh=vDofES3SKsNItFQNoFLSKBjmWxTDxCuWy4CH5P1eJeM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=tjdTwlfGkepY7R75CwWAPDawT+8gCYJ+rdXZKmc6ZECrbswaR5PpjeL3McmbPb3WN
 i9kJBtOFKVBTK6GSHGKbV3tdrQOmbtuBguPIheFeYDg6v5m0pdZ4Wy4vCMi1yZdvR9
 +9EBWWOQIDHNyKU/C+Qos8QC8DA59C0Nnm5U344l5YQ71KMkkpZ6uDrJ/TyRQxxiZ3
 H+dpfLnnc7XOysXp5g5/2N/mHP09MwcP7wO+tt9cMlfR17RKdh1edluYrsvUXGWRLB
 wLmpVHtmV7Fkbr0yqUnpZFDiClxEugXsnl0q4voS7TTjx2RIVzcJHDqa8N9SYym09X
 Ku6hMiESQdkRA==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-7-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-7-chun-jie.chen@mediatek.com>
Subject: Re: [v14 06/21] clk: mediatek: Fix asymmetrical PLL enable and
 disable control
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:54:50 -0700
Message-ID: <162740849051.2368309.17691414587415743961@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105453_186953_4E8C4988 
X-CRM114-Status: GOOD (  10.05  )
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

Quoting Chun-Jie Chen (2021-07-26 03:57:04)
> In fact, the en_mask is a combination of divider enable mask
> and pll enable bit(bit0).
> Before this patch, we enabled both divider mask and bit0 in prepare(),
> but only cleared the bit0 in unprepare().
> In the future, we hope en_mask will only be used as divider enable mask.
> The enable register(CON0) will be set in 2 steps:
> first is divider mask, and then bit0 during prepare(), and vice versa.
> But considering backward compatibility, at this stage we allow en_mask
> to be a combination or a pure divider enable mask.
> And then we will make en_mask a pure divider enable mask in another
> following patch series.
> 
> Reviewed-by: Ikjoon Jang <ikjn@chromium.org>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
