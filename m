Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA93BCC6B1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqjGWXCGxH6TxqiYs55WRZAbjioZ8YYQzBjZCSETDew=; b=VNtRfQ2e86zw5yYLc/VBz3gvXb
	+vXmOv7+YE8ioq8BmtVpmRJeeXsolAtvYcNzc5zpC78hO0i7Iw3T1Mr2eDO289XSnnto6xb1SrBkG
	NI4TyMRpIDiJXtE9+c/x2fcsuL3eyoLaSGMPidGF5E94SZOIvpex4EBJsoRbNrRwGW/7PQBgdkO3c
	yeRCNBgdwdv3EbHacW2JwpLsU+7mBRkbxGz/3Cg/yAocwmBvHgTDL/a+m9f5+vs6zyIUzbc5NpJTT
	QfMvhNs9WlS4rVbwB2YBLMWe7mXOrPAMMga8SM7vHMOGC70QOc7Ys+J7dLwSD9GuarKN88O1To9pZ
	CmCZmkEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH13b-0000000Frxo-3nzJ;
	Wed, 14 Oct 2026 15:38:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH13a-0000000Frwm-11m7
	for linux-mediatek@bombadil.infradead.org;
	Wed, 14 Oct 2026 15:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dqjGWXCGxH6TxqiYs55WRZAbjioZ8YYQzBjZCSETDew=; b=ed8EkyiRD69eY+5rsEXmlLGfIn
	IgCDrGyhLFKmhaSWXVRcB1dCtG74WLqFxwPAcT7UirAXv3BCinywoH/jp0i4nE/SJ+iFb3Yl6F2Bl
	48kxgF2ZlHhNdXouo5E690UdFy4x4Wf09GErv6Olpk5bWm1l09R81RpiLUiiHp2RKRi5j4eedDK36
	rZWDJcFUsafTUKdvUkkxWf1VIBcLRBA2MjjXAeaKcUSO9JYMcm2WX84IzOprEYwLHYYLftibeV2jn
	+fz1TBxMYygzlGySzFUOD+F9VaSIUbAM8P993dXvFWHG/8qsXM+5mm6xYkP76LvIqEAxReiN9dToS
	wmuP3eNw==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xH13X-0000000Gx3O-2MqA
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 15:38:17 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e618db81c0so9855315ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 08:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791992293; x=1792597093; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqjGWXCGxH6TxqiYs55WRZAbjioZ8YYQzBjZCSETDew=;
        b=MSU5g1oKVAKsG5i5s1vJRppmWLWYBnNSDMqdSIeXLxay5gaodtREF6ADMF5NwN/Sy/
         PhO3tYqSCEK6QIA7dJjBNi6Ufivv1eiOnKSQEs2owe+j/uASu7YkfHnAchOi/pvT9vsW
         67aX4UPMp5gq1nQeMcxdf1E44kv6KkjxC/h36/8FD+bOldvjq2vN34zLP7ZpZ5/jRYAE
         s6AhgqmmDnZ2YQg8UednsvogeiXaSkTXjgAEBnyHP5s+s42tm5T4MKGZSGTVoMl33lGO
         meCkW7OBaOhYh5fnbutX/lQoLNJu1b4qaiO3lL/e28MiwArXjjlF1fawwrYEpdQp6Xyg
         U5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992293; x=1792597093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqjGWXCGxH6TxqiYs55WRZAbjioZ8YYQzBjZCSETDew=;
        b=Ea5Cy4XZOaLDIkg2HoXG14fjh9R2jGSN7/quJBpOaJuFdwD0BZeHFTDhpC7E4y94sf
         DY8mDxhbR19c6KL+S243lmCpq6jJLYABWn5SVJ4DTEbFIrEqHfk6okZBrZzPfOtkmy0f
         G/KuaIqdpevkpLuQqwF76bvl9MblR/i9MA3H+6R9Fhp785CTonlXt3kq+GbvSyLtr1MK
         M0HEIDtie7YacTNpnwao58YBz/exp8wlp20f5qifIbQNDsTPJ0X5zhx2ji3u+us8hiBJ
         iKZdAaL9k4gdwRrcumVJQQQk4F9nKj1MIg74/s5MBpf87Y/2HOWxtW0miwghkc0Ykf2s
         rX6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzuROQplgYu2ArFj3HV7L1LzrYDWbpbF3nMC8Q1l5oPpJNjRqybrCeGPjHgvK7C0RQBakv+7sTbg8JIsSOTtg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJAMdB1TvPWqEuj0z4NfzqRppECAxoU0RQei6DgjceDJqbWKqmJ
	WxxkLCHtfz5K9qCQIBA99nD45hPj8lSwL8r8h9+PryevI4gL1n610246/0Il6aiesSQ=
X-Gm-Gg: AYBFou3uYKhnDg3NycgKMpVLFdK8/5tnRsvM3NgUMstRQI3e6Kwowv17CPRsm7xx84s
	stuM/jUYyi1W23JMjtrWSI6O5i7vhbg0OVafYfC+baILtCKPu1WWJCGcu9l3AejRCtGp0csQ4Ui
	iYJ+F4V/upFrGLWPMztq/Vy9DJ09ns9JdrOhIUPV5eJpKbZMyEBknkRRfQlkglIpDNSMbf2qro2
	CsQ/fOuCGMAVT+FjEW2655H3b8vRiCWCXadInFz8GRzYVOa7bNgQVlFhwnM/Wvj3M1kEGKfBJg/
	5y/WADY+an7ywqCMDuf2uA4KO7oYhflzloreLh0nvi9odMpCkdApxA4wd3K9JolWbAzRqNZYEli
	Z+A7aUoWwU4jSvd7TQINPiClLTd1zKQRt9d2fpeTKI4tc8zYNayvVvaVNfNH/LTarVYXJI/lUKk
	/fKA2TAo1ExYGnCUV3NSJCVYo1PVMzQ7sGP3KVTWTBo9P/BuwZxdNCyylokzTYURpVCTxFtl1bx
	zC5oLWn5BT4
X-Received: by 2002:a17:902:74cc:b0:2e9:cb4:b345 with SMTP id d9443c01a7336-2e90cb4b71dmr35035725ad.55.1791992292750;
        Wed, 14 Oct 2026 08:38:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d009:9564:b54e:1fa2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16casm73740635ad.40.2026.10.14.08.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:38:12 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:38:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pi-Hsun Shih <pihsun@chromium.org>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: mtk: release channel OF node on device teardown
Message-ID: <as-h4Xg2KTvI7hiw@p14s>
References: <20261013074744.942560-1-thnkslprpt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013074744.942560-1-thnkslprpt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_163815_687779_177A9F23 
X-CRM114-Status: GOOD (  17.39  )
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

On Tue, Oct 13, 2026 at 10:47:44AM +0300, Avi Weiss wrote:
> mtk_rpmsg_match_device_subnode() returns a referenced OF child
> node, which is stored in rpdev->dev.of_node.
> 
> mtk_rpmsg_release_device() later frees the containing allocation
> without dropping that ref.
> 
> Release the OF node when the RPMsg device is destroyed.
> 
> Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  drivers/rpmsg/mtk_rpmsg.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> index 1b670ed54cfa2..430a9b2aa7bb9 100644
> --- a/drivers/rpmsg/mtk_rpmsg.c
> +++ b/drivers/rpmsg/mtk_rpmsg.c
> @@ -168,6 +168,7 @@ static void mtk_rpmsg_release_device(struct device *dev)
>  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>  	struct mtk_rpmsg_device *mdev = to_mtk_rpmsg_device(rpdev);
>  
> +	of_node_put(dev->of_node);
>  	kfree(mdev);
>  }

Applied.

Thanks,
Mathieu

>  
> 
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> -- 
> 2.43.0
> 

