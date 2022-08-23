Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A18CC32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 11:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMk8KKCe9rIMp3pzpMFmFtVm+7RwbSn9OjNtdvs29HQ=; b=jnRviDfZZ2ZVxw9iWSUu9D1hSd
	QrfE4UMaSlRvARzu/oR2J4l4GBoL9Z1MVYV1zpQ4CPaqCZJhmP34EGsdu2E54OQ/xZO2jBgw73/De
	3Qi6vprT2ptSgKlrO7LDS4bJRfZVp4oYLQQqvmAHJtz5sVII/kEp9Jlwv5ZcRjAdZaaBCiIUGLpeq
	lxZ7jwmJJO96K6KvqPw7jT/rn3sxExa5dSrem5eG6ECbPdLTL1KoVC+yM4yWqhWqe98q9uL24FD/m
	4v6YapXpLgAq23wN8wzBjj7pUCoApV0wul7/8IVWfmmuQBpgdnF8DYettpSTu6/Vof43rXJNxy9Jo
	2fvgUHyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQSDC-005RGD-4F; Tue, 23 Aug 2022 11:36:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQSBB-005QJV-Ba; Tue, 23 Aug 2022 11:34:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 56BAECE1BB3;
	Tue, 23 Aug 2022 11:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F861C433D6;
	Tue, 23 Aug 2022 11:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661254472;
	bh=IfD1lH1wb1IrL+OUiHKFIFvNOy4QYWDWxvrxYjx7Lhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VJcXfpBVItOlFUXwRJg+CN0+F01Dx+uRRpQvM4DwDTM+8wGXfXEYuck0xbgYtSWeA
	 IEzsIWnrN4Zax2MaNPTOBKVkjoxLkJiENbR+AePsDcEhKDFZ6L2+zJAHcOSmp9p2/W
	 xQV68y5byxuDWNCGtc8kbtl4lquSQEk8Sn/eqzq1ciVj0ZycBgb1ksfR/lc82K4RpP
	 N1d/DCD9OHxGmtn8viObRJpUihNTvSnJ/lqWdF5CDNqflSbH9f1ptrxVgLQ7Cq1J13
	 4poaqJ4iaLJbixVH8P+HptzBdRyCYmDxrXwfjJfHgd25G6nB7ya4356X7nvJm1cHQ3
	 iHX8FrB1biLSg==
From: Will Deacon <will@kernel.org>
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	chinwen.chang@mediatek.com
Subject: Re: [PATCH] arm64: Fix comment typo
Date: Tue, 23 Aug 2022 12:34:19 +0100
Message-Id: <166124841460.3123906.3945586739365029922.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220721030531.21234-1-Kuan-Ying.Lee@mediatek.com>
References: <20220721030531.21234-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_043445_820032_8F3CC22D 
X-CRM114-Status: UNSURE (   7.72  )
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

On Thu, 21 Jul 2022 11:05:31 +0800, Kuan-Ying Lee wrote:
> Replace wrong 'FIQ EL1h' comment with 'FIQ EL1t'.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Fix comment typo
      https://git.kernel.org/arm64/c/729a916599ea

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

