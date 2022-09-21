Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFB9C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 12:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkE0WAM5mBu4ol1yLPj+NtrxueZJIQFbjIxfnKHOi+c=; b=Zx+SkmNUqNhMiL9dWVkCMX/F61
	paQlcchVOah5YpxibgrgWOTGb8vgVMoBGntZyaE3gimy4gNEIXEYOOAlg3UXGTZPl1Ayp/XtvambQ
	Im18bmG5/OeZdQhMMMCF1I2N/6bq7QBjgzMHjyd3LvcY+pxYLtVNztGDTaNxc15VVwg6l/4d8SlzC
	9qhsy6ugpxbgiVW5nA3mPsA7m4FvOmvb9T0gw9FFxpMfc2vd9DxlpCx6NvgQwJdRwPa3FQQ5BkIa4
	XUPQ9gaEg1JToeVHUVYqeKic8g80ukSJiCMVVx/4z1+EVlkZx+bolA+942RVKO6hj2yHI7aJpKFTu
	i81EHtgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oazAA-00BLFl-HU; Wed, 21 Sep 2022 12:49:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oazA7-00BLER-QX
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 12:49:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id cc5so9723728wrb.6
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Sep 2022 05:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=DkE0WAM5mBu4ol1yLPj+NtrxueZJIQFbjIxfnKHOi+c=;
        b=fkVqEcFGM0lszd7i6ZN54hIQLat5l7oCgnekCg8Mcp/xH8bm7jzzBSm/8T99t2FJpm
         UKhvOZnolU1mC8n/A6PxqziXzyL7dAJLfd5NYb3bGkMxCYDIcJCPVRl+ayHTFOWfSc8E
         ldcjbDqKIUHYfP8yaCj4r+mYgHsOBVhohcQOuJMDo04q/WBQPawhodmaZKr+uGD7df5m
         tB7bhZ5p6+nkIzqzXHMPdlS13HXKDcN/RZULhLmYtQWlEB/UXVstJrFY2X/wAhSdLKWP
         /VCUzReL1oxF3uIcnbK4JNfF2diQdvfxYI5/cZYemamcINcXuts5x2LyDZxoDJmPQdW5
         mwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=DkE0WAM5mBu4ol1yLPj+NtrxueZJIQFbjIxfnKHOi+c=;
        b=f+OCJSEeLpYjgmOCrd9JkfptFKtAYa4lAydE2TBSdRAEh/nvoHxLbmFFjDOL7k89Na
         qh0Z4KROsZJVQk1qujwPYuHBBMU8ZQXJ0YF+xxxlakFnILVTVE+2BUe1Zy18/gsGQZqg
         qrKXHJRf2iP3J5Tt9G+In3cjChx78YcC4nAPmcXU2oJSv5AZLdAn3LeRO4wqpa3Pm2Nz
         A1q7C0f6gzP3HZ50dBcICu+HVXZAOnI8RDZcjQAQM7OFwAHDWmUHoo8tgs+2ZPE7LmnD
         2O+yoQLhK9cYr7rLhEP8SpSXCYr0yBzjJcQ1D2MWKYhR4YQFP93dTyoRYNKw2Rf8GZDS
         cDFA==
X-Gm-Message-State: ACrzQf0VAhsssL7v1jL3f6AVn9UeLGAxyQybA7Vr4K1ZyZs3LApHI+Zc
	ggxQTEmWYtk2OnDxP/WqXE1KKfLqTMIoE93A8lMx2w==
X-Google-Smtp-Source: AMsMyM5tYRcSdHsIUm8rGqjJOQIruirH3/EfGzk0TsgEMAGJo3vw/I8EmT0b8+R2yFAUfQhs7u3SxGVqCTZda41+Yeo=
X-Received: by 2002:a5d:6c6f:0:b0:22a:7778:6ea2 with SMTP id
 r15-20020a5d6c6f000000b0022a77786ea2mr17780311wrz.15.1663764549512; Wed, 21
 Sep 2022 05:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220915120923.86038-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915120923.86038-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 21 Sep 2022 14:48:32 +0200
Message-ID: <CAPDyKFpQxTjFruj3Hm_xtiPTKcH9aQ=wFYvpRR2mnnqiHVGtdQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] MMC/SD support for MediaTek MT6795 Helio X10
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chaotian.jing@mediatek.com, matthias.bgg@gmail.com, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_054911_956058_4C8DDB2A 
X-CRM114-Status: GOOD (  12.06  )
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

On Thu, 15 Sept 2022 at 14:09, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This series adds support for the MMC/SD controller found on the
> MediaTek Helio X10 (MT6795).
> While at it, I've also made the compatibles and plat data ordering
> consistent.
>
> P.S.: There's no dt-bindings addition because that was already merged
>       and it's present [1] in next-20220915
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20220915&id=55e7dceee83ca6584a08bd876ed0ec38de5b13ce
>
> Tested on a MT6795 Sony Xperia M5 smartphone
>
> AngeloGioacchino Del Regno (2):
>   mmc: mtk-sd: Reorder of_device_id and platform data by name
>   mmc: mtk-sd: Add support for MT6795 Helio X10
>
>  drivers/mmc/host/mtk-sd.c | 109 ++++++++++++++++++++++----------------
>  1 file changed, 62 insertions(+), 47 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe

