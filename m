Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72194C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 08:54:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A4166137A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 08:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A4166137A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAZcQ8FRxHWRxI8f6drCgIGTby6o+kF3ombXFymp77I=; b=dfgNqvxTlI0+CQ
	3Tfyav/ChU9EuwZpvZeyYcgr8dawdHwcCFfXwm0jm0O8PuAVUty2O7i21n1G6rBfOJ0SdTn+VsSFs
	Y6QSu7y0yRIBvEP34RGmVmAd71tu9KM0ExC052cljhFHAmTofRMFfTxcrDrcaIPbPBeeR7mLfSy2V
	EMFdMWwCR2AcFBNBkXbiWvSvwAjKb0SwX0TcFQvWb+WNYy1Q3ZflKV3PNgSITFEs76T2mFpSvSgse
	AcQ9NL9cyjgA0IT2ARBbms3kQHiPW531r+qYeTArN3QHxhp0g7DN0ouYWPqHu93NuGS3n0isqy22s
	1iM77UNmkOaQX5Cr6uAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVrp7-00DUGf-WD; Thu, 30 Sep 2021 08:53:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVrov-00DUEY-At; Thu, 30 Sep 2021 08:53:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED8F26137A;
 Thu, 30 Sep 2021 08:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632992016;
 bh=ipv+Kb1lDn3reuFyXjezzOrNiWEsOoZgP7hBJo18ULA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pdZkh/0sTVGhG4O8RK8rDOeLE6CF2bFroexLs+UMiDl8j3ZYnORz9xaCI+hWyphyh
 Vahk20qaPmTV66veFgiGFkTzfDzjQi/QY7u6H/xnmFZq8kAjtrgtfFgczQ5RVBrKLU
 iGwD97nEomfeq5FATr7mWRUog/o99d+iGRLDv0J27V1APsNQgBxMF7DhzxTFoIKS0U
 Su6xEZGRfZarPKZHiWwv5KtZcII0aARwjWsqzvPX04mWJQyLJSVASt1wExPfa+Y58s
 33Xa8Zzctik1HUBGKSKEzgSudjlDxQnLc2fgEXmUSbtA1jzvAW8TTe+crXhDnE2OL4
 YldMLDaNq9o5Q==
From: Will Deacon <will@kernel.org>
To: yee.lee@mediatek.com,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 Will Deacon <will@kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Kuan-Ying.lee@mediatek.com,
 nicholas.Tang@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 chinwen.chang@mediatek.com
Subject: Re: [PATCH v2] scs: Release kasan vmalloc poison in scs_free process
Date: Thu, 30 Sep 2021 09:53:31 +0100
Message-Id: <163299104851.1259041.949139290018170136.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930081619.30091-1-yee.lee@mediatek.com>
References: <20210930081619.30091-1-yee.lee@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_015337_416064_CD260CAE 
X-CRM114-Status: UNSURE (   6.90  )
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

On Thu, 30 Sep 2021 16:16:13 +0800, yee.lee@mediatek.com wrote:
> From: Yee Lee <yee.lee@mediatek.com>
> 
> Since scs allocation is moved to vmalloc region, the
> shadow stack is protected by kasan_posion_vmalloc.
> However, the vfree_atomic operation needs to access
> its context for scs_free process and causes kasan error
> as the dump info below.
> 
> [...]

Applied to arm64 (for-next/scs), thanks!

[1/1] scs: Release kasan vmalloc poison in scs_free process
      https://git.kernel.org/arm64/c/528a4ab45300

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
