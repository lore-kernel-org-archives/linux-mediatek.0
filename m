Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A751EC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Apr 2022 02:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRbUVaj1leWZ8ymAy0NstO/ZoGZj8cZPoNCPRTaiDx4=; b=CnWcrbm2R4VWF1
	3hvfOkO0bE0zhtMISLsXk2hJ29v88J/G8r7/pujkP8RUqd+akDwrLuUCEONiPqk2zTNtB73e10xaP
	em8phP1jbV1jnt7OMVTF7ZYOvt1bj3IkA+nzAAOQIZ5SvdCMUOqhEb6Vv0r/DmFdVf1GqLl/+lyqn
	17OlRpbXTk6MZHE5ufHp2ShsK83OIns/oQl2Uj+zkXCQnKbjweLPmTHNdQa3V00IYbd4d2mStsEUK
	s1RE37MWuWrVc9mKUkNQLxjwLEOrrFrG9A8lBK61ETpFFhaNFW/yCUySCJCYZgSl7dRIuiv1qTs3/
	iE/aEF4ovE3Che9sAedw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni5H2-003F27-RC; Sat, 23 Apr 2022 02:13:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni5Gs-003Ezh-6f; Sat, 23 Apr 2022 02:13:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D7953B83242;
 Sat, 23 Apr 2022 02:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C960C385A4;
 Sat, 23 Apr 2022 02:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650679991;
 bh=Dxz2nz5IwdS6rdgsSgb4TgoZxVOmysvqD1IDbEVm8/A=;
 h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
 b=aA/kYNIcc9+o/Dv3vILhiBVHGUtv230q4QshStW9Fhd4XNbsSQ4yk9RC1GFNP2ZL7
 aWOr3AZA8s621iI0mfgJlRPwNe8DagwAYWCs1QIVBlM/If9/uoIZWe4F2Wk0yLBcJF
 fLmsEhSTpo4Vb0q7R6zmdq7j4LZMg/PxK8OF/y7l5aZySt+IHC49+fbeL3ajcu5VBq
 MnWpeL7VxS8tXnPTMwmmNkuotlfMkG74s3llJJWZBJU+FHyZHww3MHWFkStqfVWHZF
 dBHC1ZAbs5fZGDzCbOUnBxohP0phnhz0yPLQIxwzkmrifmwR6IU/52JoiLi94FQ9ez
 oEyn2NxnHD7+Q==
MIME-Version: 1.0
In-Reply-To: <20220314084409.84394-3-nbd@nbd.name>
References: <20220314084409.84394-1-nbd@nbd.name>
 <20220314084409.84394-3-nbd@nbd.name>
Subject: Re: [PATCH v10 2/6] clk: en7523: Add clock driver for Airoha EN7523
 SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Felix Fietkau <nbd@nbd.name>, Michael Turquette <mturquette@baylibre.com>,
 soc@kernel.org
Date: Fri, 22 Apr 2022 19:13:08 -0700
User-Agent: alot/0.10
Message-Id: <20220423021311.8C960C385A4@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_191314_429841_5F5F9CB6 
X-CRM114-Status: UNSURE (   7.52  )
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

Quoting Felix Fietkau (2022-03-14 01:44:04)
> This driver only registers fixed rate clocks, since the clocks are fully
> initialized by the boot loader and should not be changed later, according
> to Airoha.
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
