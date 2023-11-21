Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D900C61D92
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 11:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOALcpIpY8hgZLyxZ3GmQxQrNsFB90mbX2bR61DtTWw=; b=H17gfr2zj5YHQ4vuk5DF/z9EDM
	VXVIlaNKkgJVNjSvOuvhC252j9C9x4ixH6Cw8VoFbxhfuKLQhvQSBXoxNL8x/TW0w9YN/4t0wGEP4
	3aHmWLAqzpNHWvIYQe48/qdgewGQz6HJvOmzEM228cy6RZ0Dtl/qsBQvnTDbQfCH3gR+7f6YMYQZ3
	xqdptoNjn2R/IVqn+JTnyMNxfQSAoVHeCNu/ShvACG3ibV+ZwXOdVYStrSTFEkdxCiyWhM9+l006M
	Cu7WrIy2CS+oiT6JyX00UPSZyF5EOTiR3iCrs46laqgVOXVAe9LqZgF47TV/kLlrSfo8iG8Urkuye
	qGmN9jWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PHQ-00Gbr0-0K;
	Tue, 21 Nov 2023 11:51:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PHN-00Gbqc-1n
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Nov 2023 11:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 87E5ACE1230;
	Tue, 21 Nov 2023 11:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8CFAC433C7;
	Tue, 21 Nov 2023 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700567454;
	bh=7eQWip1qheX65/nr9TveALEmgmfW2FIiutNAulouSHA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Rz8zMMY++dyndiyxej6nfDplsG+c4q5OX3GhFJKCL5UiudrrvF4mfW9tBuq2t/Uqx
	 +0kdqVZHf+ElwxMCAbTGyaLFTdr/mM0Zi7wuGjwIuSUVPiBvceZtZjL6P8GJ0DIhYc
	 q3HttFKN6Q6bJ4wuoaU91tC8HUWZgKW3FbsAkxqyoKAE9ROtrRkl9GuWBoo9eQacTC
	 37bdQeNE7jAsKB91vseaEhhcdeGI+CqG+okKAGrnsOdeqhfwidNvlWSGeYZk1T4aIf
	 lK/YYJ+3ezsVL979NqS++sz8LOuWHZ1crVCKslv4MJhvRbRe8JA9TQnQOn4lmp/gFH
	 DmyowzlHVS4Sg==
From: Kalle Valo <kvalo@kernel.org>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: <nbd@nbd.name>,  <lorenzo@kernel.org>,  <deren.wu@mediatek.com>,
  <Sean.Wang@mediatek.com>,  <Soul.Huang@mediatek.com>,
  <Leon.Yen@mediatek.com>,  <Eric-SY.Chang@mediatek.com>,
  <km.lin@mediatek.com>,  <robin.chiu@mediatek.com>,
  <ch.yeh@mediatek.com>,  <posh.sun@mediatek.com>,
  <Quan.Zhou@mediatek.com>,  <Ryder.Lee@mediatek.com>,
  <Shayne.Chen@mediatek.com>,  <linux-wireless@vger.kernel.org>,
  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/3] wifi: mt76: mt7921: fix country count limitation
 for CLC
References: <20231120111212.4478-1-mingyen.hsieh@mediatek.com>
	<20231120111212.4478-2-mingyen.hsieh@mediatek.com>
Date: Tue, 21 Nov 2023 13:50:48 +0200
In-Reply-To: <20231120111212.4478-2-mingyen.hsieh@mediatek.com> (Mingyen
	Hsieh's message of "Mon, 20 Nov 2023 19:12:10 +0800")
Message-ID: <874jhf8gvb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_035057_860888_DEBB72A0 
X-CRM114-Status: GOOD (  12.33  )
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

Mingyen Hsieh <mingyen.hsieh@mediatek.com> writes:

> From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>
> Due to the increase in the number of power tables on CLC, the variable
> nr_country is no longer sufficient to represent the total quantity.
> Therefore, we have switched to calculating the length of clc buf to
> obtain the correct power table. Additionally, the version number has
> been incremented to 1.
>
> Fixes: 23bdc5d8cadf ("wifi: mt76: mt7921: introduce Country Location Control support")
> Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
>
> v2:
>  - Convert type of buf_len from "__le16" to "u16"
>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

The changelog ('v2:....') should be after '---' line.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

