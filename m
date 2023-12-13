Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B611C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 12:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkzqMOp/Xs43tYyiFqXPDwFbT9GEi5XujDuaXczjprI=; b=c4ofqhUqhqbI0+LezY5iJyml7n
	Z75QXZPPKnZcoY849nJFD72ubF9WI4loaBk3T8zAKJGtIyRiDBjKMtg3JusqdMWiebSxUVP9S2WxJ
	nu18M0y129jbVToiXcE+D4hElQv0dTQ4UYTgy4ax3uJiOEPtUrN3mZe4AweaHIjW6KTvwbAO53PAr
	0JM+btXY0qP6pIWMMlSZMMpPzoWO8Tq2deHSaJRntrekJHtnHdJYRh8Yqbm1FiGwGtkLZ/HYpkZic
	W1e/I66qTYzdCvLKfnb4pbZw3uXCUlm6M1pxCBWuFjnnHREc/DYc1BZwkUxqsBcgB/pVIPmuQcPXB
	SkpPw6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOcp-00EdWm-06;
	Wed, 13 Dec 2023 12:46:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOcl-00EdVQ-1B
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 12:46:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DC221B81214;
	Wed, 13 Dec 2023 12:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F10FC433C7;
	Wed, 13 Dec 2023 12:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702471561;
	bh=UqFTwJlv/HHhsk51P3RSZ4bmpRtBPRMXihdAMtpeCNY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=SeA3xxHO7yrmmfB2KFZrqVJEWt2vt4NxSiFoXQXR6fpT/rmmTxIodcu3eA/bmmYkR
	 upieDGK4Hq5XJ+BtmAbg2viqMRak5Ec9zsXAsryytWiR+p+srQKVfTcPlsbBQ++en/
	 lQUenyeRjbmAWIrgpFp6a03gLgdeKCOg2Cifx9wtrdwX9VQBaDgXNmJcAObY5f5Ipw
	 h/qJvDB97QydJfmyE7AeLgmTJNaeHmIbnhiixQaNANwe/1i5O0uFkb1ypomLhKaBgy
	 BVOCu0lU8Ls+r1/fzpUJue9muW8t1xhhzZKbWOTXpgLFqf9JH3bkSySN9eTKTrSCL2
	 fons/DqBkx3zA==
From: Kalle Valo <kvalo@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,
  "Ryder Lee" <ryder.lee@mediatek.com>,  Shayne Chen
 <shayne.chen@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>,  Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Deren Wu
 <deren.wu@mediatek.com>,  Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
  Ben Greear <greearb@candelatech.com>,  "open list:MEDIATEK MT76 WIRELESS
 LAN DRIVER" <linux-wireless@vger.kernel.org>,  "open list:ARM/Mediatek SoC
 support" <linux-kernel@vger.kernel.org>,  "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,  Sultan Alsawaf
 <sultan@kerneltoast.com>
Subject: Re: [PATCH 1/2] wifi: mt76: mt7921: Disable powersaving by default
References: <20231212090852.162787-1-mario.limonciello@amd.com>
Date: Wed, 13 Dec 2023 14:45:55 +0200
In-Reply-To: <20231212090852.162787-1-mario.limonciello@amd.com> (Mario
	Limonciello's message of "Tue, 12 Dec 2023 03:08:51 -0600")
Message-ID: <874jgmnud8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_044603_536089_69FE18C5 
X-CRM114-Status: GOOD (  12.71  )
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

Mario Limonciello <mario.limonciello@amd.com> writes:

> Several users have reported awful latency when powersaving is enabled
> with certain access point combinations.

What APs are these exactly? In the past 802.11 Power Save Mode was
challenging due to badly behaving APs. But nowadays with so many mobile
devices in the market I would assume that APs work a lot better. It
would be best to investigate the issues in detail and try to fix them in
mt76, assuming the bugs are in mt76 driver or firmware.

> It's also reported that the powersaving feature doesn't provide an
> ample enough savings to justify being enabled by default with these
> issues.

Any numbers or how was this concluded?

> Introduce a module parameter that would control the power saving
> behavior.  Set it to default as disabled. This mirrors what some other
> WLAN drivers like iwlwifi do.

We have already several ways to control 802.11 power save mode:

* NL80211_CMD_SET_POWER_SAVE (for example used by 'iw set power_save')

* CONFIG_CFG80211_DEFAULT_PS (for kernel level default)

* WIPHY_FLAG_PS_ON_BY_DEFAULT (for the driver to control the default setting)

Adding module parameters as a fourth method sounds confusing so not
really a fan of this. And the bar is quite high for adding new module
parameters anyway.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

