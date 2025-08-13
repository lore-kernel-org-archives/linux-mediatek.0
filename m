Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF3CC87FCF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Aug 2025 06:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BRD/FiSa0hIxPhbV2v5R9dmUKhZt4vQoKPKl+drGfw=; b=DoBgfkAOwBKIK5lu8GlpOhkMD0
	WU3ZwJgnWSxKj7bH0MeLtdJfShSwa+1LS7X7cNcxzmlUI2XMCp6y+1b1vy1y9hFSebj3J/2cZhBC2
	Tpw9Ext0zEDa2l7Ddnmkt8vK7z2gqAq+XIKgLev0cR9HOwqgiUvDziIpV7MlzEba1nDHeH6F3JUbp
	U0t8Chj3SpzWkKblP9s8Z6ZqTS6rfJ19ERxhmBGJzwu5cZKmbCs0WIt/n+RlCOziEPSi2rxi1yZKk
	EABolg9TXqXuW1w4beiJNqpTjCHXmJqetqSRVHPxCFK1Oj8MKmoZ2U8+MVc9hqM7WHRin0LowoTIW
	fIN/rYOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4YY-0000000Cj1i-2eV8;
	Wed, 13 Aug 2025 06:01:50 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4Sn-0000000Ci58-27es
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Aug 2025 05:55:54 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-23fe28867b7so84803645ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Aug 2025 22:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755064552; x=1755669352; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7BRD/FiSa0hIxPhbV2v5R9dmUKhZt4vQoKPKl+drGfw=;
        b=rHrSFaJWX7dTWM9ZSIGJYTgshr3LBfCrCETrrESDRqLgcyvYmd03eWpUqWtwAM2KD+
         eEe/swy7ma7uuW32IzO2wZGP/Y5kWv8mQxQG+7w3sCB9+aNyU5oCZGI3PQrOg8ajc3LY
         P98nuRjD8kGB70RgfGlaV2NQZ/R0icEb8DEMJejDrN32MBKaJhHi6IWNxTNhfNDc3cHM
         tE8HqMIr/vE/japnSqkMzavsrdSngQapdkJsMgmtlnu4rGMPToojrOX8GFjnq5OYlVDG
         L22YGAcxEuNKUn7QzbNhtBI1TfmJBMDHQjlbE2FNvx75Vr3K54zFrMHRt5WyC4kcqX5P
         qvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755064552; x=1755669352;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7BRD/FiSa0hIxPhbV2v5R9dmUKhZt4vQoKPKl+drGfw=;
        b=OA1uTUEcWzi6x78sKTrR68bfa3Hffo9ZbWDVdLUYICI5AXAOMP/XZzHd6jq+4PSOhj
         X+p4pmhgo51zP111m2PVE3ohgU8riAvyLZ7NDMAYlEethc7M+3Qn8+UZi5j4hzvnUWsG
         ML2BGZPX77TPkV/8OuDKsLIg1YwM9djfrVRo7y2AEwGgZpOj0JJPbaAEtl9VmUPuIcdE
         6esdjFVG/zyXPloTuHuEQcJiRQfzBeyPVm6Heg0pCzoCUkmf/ZPKW11utzHZWqpJvzSD
         Er1nEy8kiQLqYp5iHA36t4ggyzG9uX66HlKXIz/O0nAES1zM7mFOfFANQJK4zQs3zQ6d
         sWgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9s+QyNupAMPoHwpdVNMKyXNo9c6r0fIt8/DJ7nEFtXTOIwHJzEtoomIJc/ml1jnMlgyejSU7Rna/W/G4s1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeuUdE+UoSTFrRQEv71XkQjLgl7LfklteeF5endi4Eaff8WTWP
	FKdMYFyQzeVbYFg50rY2FUm5X389k3vheIqxc/FIGMRparPG0WomFvmZrcTstAAY/wRTOGDEG+z
	GD4FblQ==
X-Google-Smtp-Source: AGHT+IFoxYNoLghmdpptP7tDhzLk87CD3oeZhiQZUU42sNUj217+eYJVUow5Fo+S87ldA3ZHGB6RAPq/1Sw=
X-Received: from pjbsq11.prod.google.com ([2002:a17:90b:530b:b0:321:c475:716e])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e812:b0:23f:c760:fdf0
 with SMTP id d9443c01a7336-2430d1f71e5mr29923185ad.45.1755064551813; Tue, 12
 Aug 2025 22:55:51 -0700 (PDT)
Date: Wed, 13 Aug 2025 05:55:48 +0000
In-Reply-To: <20250813014819.262405-2-dqfext@gmail.com>
Mime-Version: 1.0
References: <20250813014819.262405-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.51.0.rc0.205.g4a044479a3-goog
Message-ID: <20250813055550.98488-1-kuniyu@google.com>
Subject: Re: [PATCH net v2 2/2] net: ethernet: mtk_ppe: add RCU lock around dev_fill_forward_path
From: Kuniyuki Iwashima <kuniyu@google.com>
To: dqfext@gmail.com
Cc: andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, lorenzo@kernel.org, 
	matthias.bgg@gmail.com, nbd@nbd.name, netdev@vger.kernel.org, 
	pabeni@redhat.com, sean.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_225553_539245_3CB1E410 
X-CRM114-Status: GOOD (  11.99  )
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

From: Qingfang Deng <dqfext@gmail.com>
Date: Wed, 13 Aug 2025 09:48:18 +0800
> Ensure ndo_fill_forward_path() is called with RCU lock held.
> 
> Fixes: 2830e314778d ("net: ethernet: mtk-ppe: fix traffic offload with bridged wlan")
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
> v2: New patch
> 
>  drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> index c855fb799ce1..e9bd32741983 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> @@ -101,7 +101,9 @@ mtk_flow_get_wdma_info(struct net_device *dev, const u8 *addr, struct mtk_wdma_i
>  	if (!IS_ENABLED(CONFIG_NET_MEDIATEK_SOC_WED))
>  		return -1;
>  
> +	rcu_read_lock();
>  	err = dev_fill_forward_path(dev, addr, &stack);
> +	rcu_read_unlock();

This should be squashed to patch 1 or reorded as patch 1.


>  	if (err)
>  		return err;
>  
> -- 
> 2.43.0
> 

