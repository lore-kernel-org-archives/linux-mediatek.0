Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B1DC05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 13:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEynChfaHuKvTCoy9nPF6GPIOsYFK2PpjzZDdptWHC8=; b=YFjqsK+Fbqv8AiAkwh79gJyK9h
	vRLJ1Qw1/fQ7EPLBO/N8llC6xRsX0XuZedPRAHE+nX+teJNjUfEeK7mXPAqt1TS5lPs9bWU2Qm/+Y
	YG6YelVYRwZrqy0rBPQLiVl0hv29zz8h4W+Q4zpwl3+ZrIbxZZFPl4HrDfodC5n05aIDv0Un/Gcdj
	xvj50yeZ56hlY1b12eM+urHdN5WzHwy6w7T+EZKni3dPOaL9E/oSbdFuyM0HND6R/7A3BD+Q0zaOa
	imIZBGbjNL0k+nUQ1bzlqiubVh047pRpLff7cs8C8k6yYjAiz5bYam0i1fcpEf/YnkcM8pwu9j4/h
	SyK5AcDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNZHh-00FwjR-0N; Thu, 02 Feb 2023 13:05:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNZHS-00FwgD-L6; Thu, 02 Feb 2023 13:05:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0538E61B20;
	Thu,  2 Feb 2023 13:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3600C433D2;
	Thu,  2 Feb 2023 13:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675343133;
	bh=KfapbWZaHoGL2lh75PlRq+/iMY1cexe2VdJrOWRjZsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YK13koIN2gnXc469qf/9k9La3ph+csCibap5vcuqGJE+8Hy2LrBEf4B2yAPV/w7h6
	 Nuf3QpHGm+Wn16/BIrp/mrc3meqhMvRZO/bPon0zGydLMWw2C6xzOQ2NkUD/+KGmut
	 QWUIdocqn55FkMzRI5oY6y12uxx497Lkt4a9n1QvhzaWZOVBcg+lQ4tPqYALwL5pfY
	 AORJMBJsJ1NmStBnwAAS1gaBjc5GwM4QQl2UsdlrS3kYdyy1N9dGEWAxIfEYs3Xu0E
	 a3vvbscn8VK1P8ciiKCuUhUk54YdUGVOOzPI5TFTCbbiW6D175bmVkvb4nI3BCYHov
	 AkChSan7JfKqw==
Date: Thu, 2 Feb 2023 18:35:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Eddie Hung <eddie.hung@mediatek.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 1/3] phy: mediatek: remove temporary variable @mask_
Message-ID: <Y9u1GXaVJ0FKXWnu@matsya>
References: <20230118084343.26913-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118084343.26913-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_050534_760559_01AECE42 
X-CRM114-Status: UNSURE (   9.12  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 18-01-23, 16:43, Chunfeng Yun wrote:
> Remove the temporary @mask_, this may cause build warning when use clang
> compiler for powerpc, but can't reproduce it when compile for arm64.
> the build warning is caused by:
> 
> "warning: result of comparison of constant 18446744073709551615 with
> expression of type (aka 'unsigned long') is always false
> [-Wtautological-constant-out-of-range-compare]"
> 
> More information provided in below lore link.
> 
> After removing @mask_, there is a "CHECK:MACRO_ARG_REUSE" when run
> checkpatch.pl, but due to @mask is constant, no reuse problem will happen.

Applied, thanks

-- 
~Vinod

