Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAECC77B61
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 17:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQs82gH5EVISyPeyNZ2iMKvsiMLPelCfXsrpU3XIeTo=; b=Zc6JzYiBi7yLfbqHMGa+s8YOZE
	lJ9waLXJNik+1X6q+PELDzfTbYN0fcxS0JRKMbbGsyYeu/VRIGNlG8T3wG3GxKpZtUxelKtakpJO6
	rGOJ+uy0bTK7BlcNH0BtygKMkOUMT5Yofo0gnZpAZYi9nGWHajXqrDB2eSrEui8egituvpOmZtIuU
	7n3zPPBM6uCMsAThFpx+2kqRvhlOXg5ZzPs86nw51IehqW/Ok8nCbcCcV6fBWp1GFdChMleSArKvY
	+SbWR9vtqbPXBksoEd28gfziZh342z0JUKcEzfxq7fTpQ8mOd8fds6makx2RlGueGy9YHjXiAO910
	pXiC++9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppuWA-00BUeZ-1g;
	Fri, 21 Apr 2023 17:25:54 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppuW6-00BUde-2E;
	Fri, 21 Apr 2023 17:25:51 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1a68d61579bso20109045ad.1;
        Fri, 21 Apr 2023 10:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682097949; x=1684689949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQs82gH5EVISyPeyNZ2iMKvsiMLPelCfXsrpU3XIeTo=;
        b=ABKl+X3Xzowd5upYpggrcHRbo2deX30/7HhLIJ9HzWd8fqtoe+fxYZtdGsr+Kx6a3X
         nJBMwPQqCvm2zXJfuXOCeN6F0AS8JiO+FSkJ6bR6mOsjYfLsm2LYg2NVx/rbn+eWwgvX
         AkJ4hWXcvUWrVd6P0oLuP5xgVVjNkZb8kJoLyFspTKEREuK//RgyuxQJpKD9K6SvOzI+
         N5rWr6cZgrDoI8YetIvegotOtWmEsTGIb34zbIH+hK3ffggbeDBZ26zeLCKR5lcB42fR
         q0U4zIo/iC/zAwV8C6WRHZPpach6jMp37z6OSdIIXRxE2XcbR4yuuLfrZ1vdrfLxiA2H
         zV6w==
X-Gm-Message-State: AAQBX9fQA5C0Y3CoC5lRxfvrrdavmisUK6pwH6EzoVZI6ngUoAn337FS
	bkZLZ9Wc2q+sYmjrKxJztnKN8mxyl0U=
X-Google-Smtp-Source: AKy350YL/mh/hXPZK7lwtFCdyt+oJHtYr2JBiXgiHmnV0Gg8WVyxNewBlUw1Yp+SzWaQFH7hIwKMGw==
X-Received: by 2002:a17:902:8498:b0:19f:2328:beee with SMTP id c24-20020a170902849800b0019f2328beeemr5124487plo.11.1682097949243;
        Fri, 21 Apr 2023 10:25:49 -0700 (PDT)
Received: from [192.168.51.14] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id w15-20020a170902d70f00b001a6c58e95d7sm2973074ply.269.2023.04.21.10.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 10:25:48 -0700 (PDT)
Message-ID: <8e4a9151-10e3-28a4-3263-25e67437ffbe@acm.org>
Date: Fri, 21 Apr 2023 10:25:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/1] ufs: core: fix &hwq->cq_lock deadlock issue
Content-Language: en-US
To: Alice Chao <alice.chao@mediatek.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 quic_asutoshd@quicinc.com, quic_cang@quicinc.com, mani@kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: stanley.chu@mediatek.com, peter.wang@mediatek.com,
 chun-hung.wu@mediatek.com, powen.kao@mediatek.com, naomi.chu@mediatek.com,
 cc.chou@mediatek.com, chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, wsd_upstream@mediatek.com
References: <20230421075636.24946-1-alice.chao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230421075636.24946-1-alice.chao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_102550_730894_F5230F64 
X-CRM114-Status: GOOD (  11.05  )
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

On 4/21/23 00:56, Alice Chao wrote:
> When ufshcd_err_handler() is executed, CQ event interrupt can enter
> waiting for the same lock. It could happened in upstream code path
> ufshcd_handle_mcq_cq_events() and also in ufs_mtk_mcq_intr(). This
> warning message will be generated when &hwq->cq_lock is used in IRQ
> context with IRQ enabled. Use ufshcd_mcq_poll_cqe_lock() with
> spin_lock_irqsave instead of spin_lock to resolve the deadlock issue.

Please add a Fixes: tag.

Thanks,

Bart.


