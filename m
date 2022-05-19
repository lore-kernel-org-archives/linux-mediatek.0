Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE684C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hv57aTzC1JBkPkBIZXDqCYtD8wCRnDrISz3bPj7dSaw=; b=zckOF/mqDpfDsb
	wQozGHwVeWeug5k9MwOUaeOyN9m+o/K1rNYGLaUBBMd/0uaqXSKweeV9IUqetGqOWyYtXiWkD5pd6
	f42h9908D4bvz7bUs5BOULunUqr99CFmmJ/OvmiTSD/AH8gZ/ReL+yCOozBIBV70/5UBcLQX70pGB
	HyF0yuctIuowF2iIhoS8wjhsY5t4w4b7qAAWOrdJOJUS+P2iHnDTUNxOyKIcHykCq9tTWCdK0XmCi
	KMxNPs3BkVc6KzCQMO7ysXmiaDvCJrWMmwKsFQpamRdu7xeNm4TipmmH7MFZneeOcJSmRQfT2yXyq
	iOYYnAfd+kUIMosslodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nradG-005Yjb-3d; Thu, 19 May 2022 07:31:38 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrad9-005YgC-Vw
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 07:31:33 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so4455784pjq.2
 for <linux-mediatek@lists.infradead.org>; Thu, 19 May 2022 00:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OwZHQWeHwkceIr3VPipXqZlSRdGU9Cp44aK09dkAXQ4=;
 b=ZfrlKzFubXl7Ax5rrOTUWAD6WI9V00fCklFg2MD3EIMDXt/PtQjRbT26EHodNSpTNV
 AX9Aer1pwoT0ikA70AULQvI5kKBX57JJHKPslNI3MtZ6F9ITCfsGN/mszWWDHnj+BTk/
 98x/aMgMtQPYV9znZWBh9LexcUXhKgxxFX6RYlAIylFiw1YAj+gLFGo4x3hEGgX+nGSV
 wIGQ9JSsXhg10zJtfZg/+pW19vg9sTFH1M4mWjxTZ4JjE6o6vhknwn4IksH8YhRmgsH6
 kPUhd0l9TkMWys7yaR2K91dV7IqoUpGmZ5eEzt8YgNHxuGA7UmqQIjaZCPCbIRoAja/c
 O0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OwZHQWeHwkceIr3VPipXqZlSRdGU9Cp44aK09dkAXQ4=;
 b=XZe3yQO2AcYeDfHCVH33Mr5Ix0m8lD/2P/DwvLgtBQEQQmxhICdVmoHZIpgaYftp51
 UOXhy2dRXXyEmRD97JiUlYyuv6XAMKJXdKuhrYnwhbge+lgVGe5bjK1So0dUaHwP47Xk
 LHwKZFDys6hCLQMfmBDqoOEII8YOfUj0DpaSrN3/lnnMrCCtaNdJN4dMw3QKeJYPjAlV
 cI4H2SUk3p2iVTLoXs2GybFI5Y4bzBZWmY+KpwuaFBomu/6DMbeld95ruFSWU2DV98Am
 gMsgJ4rxnkKPMoXbzhAqsQ+nFjFQIzrTcvqQppgiAfnxkbk7b6DuO1aTDSvREa89lDbM
 bf9Q==
X-Gm-Message-State: AOAM531MxvCAHbLsw6NwGUqHVjvGPL4b01QveGIDA/+u4/owxhqp9PaZ
 scy3WWxffWeTocokBvL+Sg2pzPSnB9pNtygcPHdGyg==
X-Google-Smtp-Source: ABdhPJx02nFN2qgr+o8vGAgbIUFFcbcCpjZpAllvzp+6oTibISA0iFbIS9uLs92u2/tRzTq/Ks6EdvlCCkk7q7e48lc=
X-Received: by 2002:a17:90a:4209:b0:1df:b907:ed3d with SMTP id
 o9-20020a17090a420900b001dfb907ed3dmr3808743pjg.40.1652945485756; Thu, 19 May
 2022 00:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220519032108.2996400-1-yangyingliang@huawei.com>
In-Reply-To: <20220519032108.2996400-1-yangyingliang@huawei.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Thu, 19 May 2022 09:30:49 +0200
Message-ID: <CAMZdPi8E7pMR22SyXbtCe5Wtb-jLfF-ZD+-qEAW5KFiJ6FP6Pg@mail.gmail.com>
Subject: Re: [PATCH -next v2] net: wwan: t7xx: use GFP_ATOMIC under spin lock
 in t7xx_cldma_gpd_set_next_ptr()
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 haijun.liu@mediatek.com, chandrashekar.devegowda@intel.com, 
 ricardo.martinez@linux.intel.com, davem@davemloft.net, kuba@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_003132_068899_589EBC37 
X-CRM114-Status: UNSURE (   7.31  )
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

On Thu, 19 May 2022 at 05:10, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> Sometimes t7xx_cldma_gpd_set_next_ptr() is called under spin lock,
> so add 'gfp_mask' parameter in t7xx_cldma_gpd_set_next_ptr() to pass
> the flag.
>
> Fixes: 39d439047f1d ("net: wwan: t7xx: Add control DMA interface")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
