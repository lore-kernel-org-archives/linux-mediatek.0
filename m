Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B3CC47259
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 21:46:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC21C20752
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 21:46:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L9JJxI3Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqLgPwwX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC21C20752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zmltM9pTWvpACiZR1nZL/ccyFtANPnb2fPQTSPFAMwM=; b=L9JJxI3ZLKWsASsd9ORGap2sou
	1cPqU5pAMEmrVmw88Cxo7FZp2cBfsCyttE/fw0S5KVftrwBUtMytdWWuUllixrsQiM8U9ZTxUENKy
	QbOwXg2BZx6R9z3M/k+8TU2xVBX+l0OU3qsy0qJ5PaiqR7QQKifDbpzAlQc8onDGNpU2PdHVVpVdx
	E59rxfMslgdnYsYNFmbGJmvi99rk8ztLIMCPn0T4C0OO2jIG0N94fV5lDHg0cZFEOZdrL5nOfwR2k
	Ym/pG8h5VhNobsMCSUZKov9heWAUSZBW7hhuXkYWCg6kDlZLQpPjRTWjtwQv0nhYQIJk+eNasAo8F
	S+BM4YgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW5OA-000124-FW; Tue, 05 May 2020 21:46:06 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW5O1-0000tl-NI; Tue, 05 May 2020 21:46:00 +0000
Received: by mail-qt1-x843.google.com with SMTP id k12so3422868qtm.4;
 Tue, 05 May 2020 14:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=NpBCtXOwKgxraDAqMLQlaDGkzFixaXVJTgaJ+cTQxAU=;
 b=sqLgPwwXtoPOEBnbyVTD6cYOITJkB1ur03Mep+sRAK+XUgaNrFAyE1lDzIB00zAdlA
 6XeBSXZLSFiU0uDkHJyj6GZPTpQk8p56wyJ73XSh5t3n5bsFC5QSUMfcXSsogFI+J0jT
 xLT/Xublm0dIcBdi9dDi74+OWApLxpLXHg+HG4Gx1R3CN5yldhkFi9zffnP68om5Eg6q
 Uviv207VmRm03ls+hifi2+gaji2e/SnSxbGgpGlQM+S2DaDn06nMKEMmSoGroEg1pQ8Z
 EGooot7kZn4zrfiTkYucLr2zCOSkhfHBKx7sTeVB1Fr+Iy0mCYTrKgx+cJUpVFaEi8un
 PMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=NpBCtXOwKgxraDAqMLQlaDGkzFixaXVJTgaJ+cTQxAU=;
 b=miAgxXYcyxflEG1Kw/tdSSFuX63xXK4eTf+t5tniHQYNsODKkh1qjpWRpBlBjnoz4c
 gJdaujMTg6pB//Dfa7IHlKYfVGo7lPFUubqNMIqJpbNksrv7mzu3G+5tH7Vpk72VigA2
 9oxV5dIwnUW0Cm98JsvODWIC7mdivjrLb2nOX+2j3KVcxcwi29Jw7RcFbrgM+uUtDH0v
 GcgErnhLaQ5YagXrJZafcf58RtlaFDfYk6nBxPnVGRW7S6fT8fW9vXODcmCbv1Yu7bUr
 rB/Bv46LnUtfARkTjF1Tey7ETJMSjiJpZOgAvxYa6EPcJOM0ZHwLvIc2w5Js8M3biEAS
 ve4A==
X-Gm-Message-State: AGi0PuawRUfPvyZEGBO3kfdCAXa7FdGDiMchqa9oFpBLZWAyE7RtI2cn
 RWOCpSAVdBVsmPK9LYbW1j4YAVHXtcCgRPDPeBk=
X-Google-Smtp-Source: APiQypJ+I7qzGCg7I3XEFp+30dxyhhDaYL307MRMPZ3KJ2JDfJIaAmHE2VyjJI3pkzHl5cnzFRj2Db79lVlNOnLj3x4=
X-Received: by 2002:ac8:27cb:: with SMTP id x11mr5207636qtx.272.1588715156968; 
 Tue, 05 May 2020 14:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200505040048.132493-1-eizan@google.com>
 <20200505125042.v1.2.Ie596e59e0a18935f0b7321ff45e5c5f2ce8082b1@changeid>
In-Reply-To: <20200505125042.v1.2.Ie596e59e0a18935f0b7321ff45e5c5f2ce8082b1@changeid>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 5 May 2020 23:45:45 +0200
Message-ID: <CAFqH_52qx7g5BLUBGoUQGFTcFE9FjWGe+i9on=5p7ZqzObsB6g@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] [media] mtk-mdp: handle
 vb2_dma_contig_set_max_seg_size errors during probe
To: Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, 
 Eizan Miyamoto <eizan@google.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_144557_985190_06E24B71 
X-CRM114-Status: GOOD (  13.90  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Hi Eizan,

Thank you for your patch.

Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dt., 5 de maig
2020 a les 6:01:
>
> This is a cleanup to better handle errors during MDP probe.
>
> Signed-off-by: eizan@chromium.org
> Signed-off-by: Eizan Miyamoto <eizan@google.com>

Same comment as the first patch. You should probably fix your configuration.

> ---
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index aeaed2cf4458..c20ac7681c6f 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -193,13 +193,19 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, mdp);
>
> -       vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +       ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
> +               goto err_set_max_seg_size;

You don't need to introduce a new label, just goto err_m2m_register



> +       }
>
>         pm_runtime_enable(dev);
>         dev_dbg(dev, "mdp-%d registered successfully\n", mdp->id);
>
>         return 0;
>
> +err_set_max_seg_size:
> +
>  err_m2m_register:
>         v4l2_device_unregister(&mdp->v4l2_dev);
>
> --
> 2.26.2.526.g744177e7f7-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
