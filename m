Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07551E77180
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2024 10:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pQiz825MeitFPjuVjV4B0S7asuM77XPpTV8GFPFpHE=; b=UJKJEDMG3z/XhOjjnQviR/f21y
	41SKisTTaPsJ5HRLHWNW2Tf76BFAAWUi8fHXpwAkY43uiyu9X4xnYvSB9hFx9i7TwkV+ZOhitkr4S
	AlUN7wgSeef+riblVQoTWeO99jzQd5y0RvkHnEhBaimoW3VxF8koU0MG+7AG7JQAwmlR+A4i3LR0F
	PxVZ6QpBCYi5dTKOJMVULPZJfWxQcmARSaoUqlXTgPjfLHaCrewIoQBlM8Uv8dhyQ/cuZkIbhrQNi
	iXQbevXwF9e0qrsfvpccNYeubuQCJkzVKxJtRYaBKde38UFPi+frpnXWzNhkx3LZaqUmCMu8iQdgn
	/W40drVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgaf-000000004ye-0IOG;
	Thu, 12 Dec 2024 10:38:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgaT-000000004wL-3uyh
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Dec 2024 10:38:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D2006A4214E;
	Thu, 12 Dec 2024 10:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41ACC4CECE;
	Thu, 12 Dec 2024 10:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733999908;
	bh=YQdkV5DZUnSTyg0vuItxQ0IsIWr/wnH96fWHGfU1Xro=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VOtY5clYgf3AJKi0hgFxSv01LHVdKWYz6q97dxS3qGQJsJoqcY3BjKu0NPM6UjHBb
	 qh5ANo1+D5hAqJR+qFb3LHorzkQpTVDPwHN26r7R4pzPwDeDSn7pchBMWrIlrhmHdq
	 rJQ2lM1wuhYOFztd3mXMLWn9BqHowI8saHQ+Zuh5rypM3TFA+KlE4uGXrPD6Z4Smlq
	 lwmN9u+iH/KxGBxyg1SUYzeH4DRACBTlQRXlv0IYuxIUQfhH6rrhR5md0DKcAVjjrX
	 WdG+sRXI0OrZHtEH9g4+Dntjuzlfb/0bBYx1Oab3AMFNWmMULsUfgcxfpmQhEvFtKl
	 8m9WrgtKNEK9g==
From: Kalle Valo <kvalo@kernel.org>
To: sean.wang@kernel.org
Cc: nbd@nbd.name,  lorenzo.bianconi@redhat.com,  sean.wang@mediatek.com,
  deren.wu@mediatek.com,  mingyen.hsieh@mediatek.com,
  linux-wireless@vger.kernel.org,  linux-mediatek@lists.infradead.org,
  "allan.wang" <allan.wang@mediatek.com>
Subject: Re: [PATCH 05/17] wifi: mt76: mt7925: Fix incorrect WCID phy_idx
 assignment
References: <20241211011926.5002-1-sean.wang@kernel.org>
	<20241211011926.5002-5-sean.wang@kernel.org>
Date: Thu, 12 Dec 2024 12:38:24 +0200
In-Reply-To: <20241211011926.5002-5-sean.wang@kernel.org> (sean wang's message
	of "Tue, 10 Dec 2024 17:19:14 -0800")
Message-ID: <874j39tcdb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_023830_033667_8C534FD5 
X-CRM114-Status: UNSURE (   5.63  )
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

sean.wang@kernel.org writes:

> From: "allan.wang" <allan.wang@mediatek.com>
>
> Fix incorrect WCID phy_idx assignment.
>
> Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
> Signed-off-by: allan.wang <allan.wang@mediatek.com>

Allan's name seems to be in wrong format both in from and s-o-b. This is
the preferred format:

> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

