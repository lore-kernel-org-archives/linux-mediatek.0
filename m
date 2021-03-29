Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ADDC433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 17:01:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 436D76191F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 17:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 436D76191F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4uJ9iUIda+SFQU5spIworhD4mwmfnfxvIIzpLcFINek=; b=Y62+1vHZRB0LuE0PbziP53Izu
	z6CU1Xz1t8lCwMZ0mpVtScSTcOGByDFlsBkqE2CbDJJZMJsJ9bMXLryEYvjDkTC6W82ODUgcGXWhj
	BPz5bNy5tjwoygTT5A9c1Wk/EOWxmjrucsNsDRaEJIqdFjgSv/X2dFrK7lyRt8bFZwKtspw6rDUT3
	3Un680wT8TbwXSYFNFSwdcIaMgnaNbuWX956+zgvCNQVqP+OZB8+lxP4d6Uu12BiD78eX/uG4CMez
	RHKQolUROpbPmkB5oeygxs995JKYASuk3xrTD7cdCbuUnUA4TEgyHZL1scVEb+mTdmvvcVIwh6ath
	bNIt4nTEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQvG9-000oyf-2F; Mon, 29 Mar 2021 17:01:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQokY-000Z0B-IZ; Mon, 29 Mar 2021 10:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Date:
 Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=7PbKX+CA0VkUvlQX5OOqhCXAF/fUaELJtK0/FYts2zs=; b=cpsHY++TWzf1SW9iaIdJeDBbRm
 +uvxP1+YdlBEBNB6n0T7ruRby6nDt1BzvPbSZ/m++vThaixiGRNE22bddECLiRw+eD+jtuWpEUv9S
 tcsYON+9AQn6ZyV5KygsaxWSceY9mHh3qCwtepBHWtkR9SdsqQkNZAhKKm/KlXF/Usy/0xKZ6ysuL
 QurfVWBegE7oFUoZLKliJhacaIdhNgFLrAnu8iBow1H5V7OYzPAITNjsZaZAJL40qJIttvFcH+20q
 F0+FO0f/lXeL7bxuCWqqWzwHiZ6uyP8vwNtZVI1V5bGCjlD9OgG0dplQPn95aylUWqsSccmaTNnAg
 JKSjYoLw==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQgQ7-000ohK-3m; Mon, 29 Mar 2021 01:10:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id BEA5761951;
 Mon, 29 Mar 2021 01:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616980209;
 bh=zxQ+ZIrauQfx6GNAIlXEkCWtWQkdo2pHRfdWo9A4qdY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hqvWkiVI9tnXfhugPZBa7EdOI4pI+qXJEaeOFSsd4+SnPQbMofHcLNwK0FpeoIIQx
 E3beZGFdEWYLK7mShVghnDvSqaApPpQxqC1s4/InVQGLhc+0YWIArZby4osuV4uRDh
 X7eTWio5QkdNboZi5x/sjvzd5UvldKdwIB54Bu9mpFvnsOwGbuhWj4EvPLmZCj3aQ/
 4FptFmeXgdSqtOGbyHdJTNVJDWJz0X5YEUoqPxrt1HuEt1WCCveMTfcgoCVLnHKHh2
 1FOrVCY1d2hNm76tSJdEaKy6JvASv8cxHKx9OHM+iCJrxeko0uBdbZzvELIYqdELbc
 MoalEJNHIMYsw==
MIME-Version: 1.0
Subject: Re: [PATCH] mt76: Convert to DEFINE_SHOW_ATTRIBUTE
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161698020972.2631.5798600875086816841.git-patchwork-notify@kernel.org>
Date: Mon, 29 Mar 2021 01:10:09 +0000
References: <20210327095617.1222-1-angkery@163.com>
In-Reply-To: <20210327095617.1222-1-angkery@163.com>
To: angkery <angkery@163.com>
Cc: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, shayne.chen@mediatek.com, yiwei.chung@mediatek.com,
 ap420073@gmail.com, sean.wang@mediatek.com, Soul.Huang@mediatek.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, yangjunlin@yulong.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_021023_406573_83139AA6 
X-CRM114-Status: UNSURE (   6.72  )
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

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Sat, 27 Mar 2021 17:56:17 +0800 you wrote:
> From: Junlin Yang <yangjunlin@yulong.com>
> 
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> 
> Signed-off-by: Junlin Yang <yangjunlin@yulong.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7915/debugfs.c    | 36 ++++------------------
>  .../net/wireless/mediatek/mt76/mt7921/debugfs.c    | 18 ++---------
>  2 files changed, 9 insertions(+), 45 deletions(-)

Here is the summary with links:
  - mt76: Convert to DEFINE_SHOW_ATTRIBUTE
    https://git.kernel.org/netdev/net-next/c/8d93a4f9ccfd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
