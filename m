Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54B7E77188
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2025 13:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zZbYre4rR6hCAYIs6iYSkj8WKSc3rEwh1hrEnwKeKM=; b=rlmjHphs+UBMpY7cTfSAH7EfgI
	3uyqb7TRY0/TUmLfXwjJAV/qKSvezt46IriayuGxtnIS5vySm15inlzyW3SugDSqTwgcBwywJNFZX
	IQta7QAkCU4nQ7VIzQDLjCWdEklw69Ff6TlToRgav62a2Bgas1RQsdzFRnEZP2ZpCeVTLJjUpyU/E
	VNzgdQp8q9Vv7vML+Q2kG3ODxqPfYyvxlg0pxtAUNY94mOaF48+EADZHHGL8gMWQQocqe665kcUVr
	fZWW0fjyhKMJDobjR4yZF9t2WEqyGI5hvLR6DMhqG1oXiHjEfu3oJoAomjXXSqxdkjp/8EkyVjvQj
	M44opxBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEpl-0000000FQec-3sWm;
	Fri, 10 Jan 2025 13:13:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWES5-0000000FLhm-1IlV
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jan 2025 12:49:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 10018A403A5;
	Fri, 10 Jan 2025 12:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472C8C4CED6;
	Fri, 10 Jan 2025 12:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736513364;
	bh=BjaxqsFW2eQHamCUWl9fBBDyR52alehPuwO+5heraW0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=vQN0FONrdiMgW+YF1saub6sGHrYO/UQGL/4xo8EJMcFNgfmuW5wT8zyn2djT81LU3
	 N/XarL24f6PYnY+PYvW/TsyGG/XNZnOmKES9D6smkk+0fGD1vWTT/46W9iC4x1dcKq
	 lsXAfQalHC+pBwYC8wfp+dEMU8AvqITXXJfrCAdg9FmxKC5DnwDEFntWVQY20wo6qC
	 x0GcZJDQnTLCQ3te3E/Trbh7UcEQkU2/ZHK5i70r4EQWKRwY7FXme4kMBmPLbu7H9S
	 v9MIBIRyMauXyd8kdhkV7a/wZQvn7iKRBOePQHk312Kj3xXrYD7rHLJjBpAnlpz/Mb
	 t8atha4Gx2BYw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH wireless] wifi: mt76: mt7996: fix invalid interface
 combinations
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20241007135133.5336-1-shayne.chen@mediatek.com>
References: <20241007135133.5336-1-shayne.chen@mediatek.com>
To: Shayne Chen <shayne.chen@mediatek.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <173651336034.72755.11718043686484576915.kvalo@kernel.org>
Date: Fri, 10 Jan 2025 12:49:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_044925_414168_AC8AFEF4 
X-CRM114-Status: UNSURE (   6.59  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Shayne Chen <shayne.chen@mediatek.com> wrote:

> Setting beacon_int_min_gcd and NL80211_IFTYPE_ADHOC in the same interface
> combination is invalid, which will trigger the following warning trace
> and get error returned from wiphy_register().
> 
> [   10.080325] Call trace:
> [   10.082761]  wiphy_register+0xc4/0x76c [cfg80211]
> [   10.087465]  ieee80211_register_hw+0x800/0xac4 [mac80211]
> [   10.092868]  mt76_register_device+0x16c/0x2c0 [mt76]
> [   10.097829]  mt7996_register_device+0x740/0x844 [mt7996e]
> 
> Fix this by removing unused adhoc iftype.
> 
> Fixes: 948f65249868 ("wifi: mt76: mt7996: advertize beacon_int_min_gcd")
> Reported-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> Tested-By: Frank Wunderlich <frank-w@public-files.de>

Patch applied to wireless-next.git, thanks.

89aca45f2687 wifi: mt76: mt7996: fix invalid interface combinations

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20241007135133.5336-1-shayne.chen@mediatek.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


