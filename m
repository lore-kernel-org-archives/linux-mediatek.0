Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00525C4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 17:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kuiOuDoqUN+LX9cDleVQRc2hrmBbqV3FFSoOhvfn0k=; b=UljD583gPjQJRUfiaoHcja5yzd
	cYiX2pJkzbjSSwAa1Q5X2Z8ZQM9xOoP+kkXwvmSNhPbHl2O9X+SCbGrPUKmsWrpNO/Mgqk7HBXepq
	tRv53AaSiILwsPrxoSyWR7LESHZNaxbQ3AKeoIZNmiwbeFae5aWzxfr1rVLAyJR3dtQbTXdLGOZ5M
	67V9kfMfisfYdkkx8+NHXLv5jJCZz5HwY8zGQZtJwVLBylorndi26cl7UXLPCohFUe2W/HKe99peR
	De+yHyS+cHvB2xKtAZgj51BK4Qxfe/IyFcLiPqwwmKF7/2Ew93HyVgBkHhYiwVBKNCPo4XuEK7enj
	UzO2WYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2TB-000000045BB-24vT;
	Mon, 05 Feb 2024 17:09:21 +0000
Received: from mail-pf1-f176.google.com ([209.85.210.176])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2T7-0000000455Z-2y4x;
	Mon, 05 Feb 2024 17:09:18 +0000
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e053919b5cso207423b3a.2;
        Mon, 05 Feb 2024 09:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707152940; x=1707757740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1kuiOuDoqUN+LX9cDleVQRc2hrmBbqV3FFSoOhvfn0k=;
        b=bCjq0cNQL1HboCCAmf7yQJMsjEPZliY6HKHvMtWdEq2xicxhUMzME0xVUkd6ob+YX0
         Mv+V+VYjVx7hiszATM2N1NbjZT0et73lg6SXruJZ4Z01kABU7O5T2e6SO+xGYJKZVyCk
         Vg3vTU421Bmer6FSvRoGoE09f/63v1Ud0X2pZ3wHPCb8tpqRzbgHPBKOyFOBSBl44OaI
         sIbmzmQjUvAaL3gSkfEyMq0nv3KcJ5XfIRPEj7oER8z0UB+h3loYH33P/Z6ajdQ9YOT4
         Do9HEtUho9xnZYBbOjDh1gwWfwMbBYo83pwZLAhZ9dRaUYD5DPEdgi4DBoL/oy7x5KwH
         H9tg==
X-Gm-Message-State: AOJu0YxvMLsNxSe7NxPvexdt3JXGx2pLmxJo0OrCuqwuL+e4S+BylvKG
	ZnrZ6GtTUocAdhC75mXzxsNd8A5UZDTch7Qkm7mNc1v1ApP6hlRy
X-Google-Smtp-Source: AGHT+IGo8WjL/bdJNre0s9vbNXMioQJbq7p0P7eat1QWk+GpzjwXOG+PVh0O+BBrUAB/OnFm8hgfVg==
X-Received: by 2002:a05:6a00:17a6:b0:6e0:3c66:cb7d with SMTP id s38-20020a056a0017a600b006e03c66cb7dmr237031pfg.3.1707152940419;
        Mon, 05 Feb 2024 09:09:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWu8XlNN/hkZ/9Zm2dU5w8AJcapRa4uNKA/c1kpyak8eUdL+cXsVcyJxRMGpC5CM71G75GPwFeDLeQ441Gw+UK5qkD00mvVvuRZ6KXXdfjQJQgg1VFURjpS3OQ9hRZTqTz2Z6n0bmgQac14QbCtItb5OPDToRBa0oSicntyXHe96ubYsyjFKaGauSqIF5zd8V/lFFi/5Yu8AvTXEMhfZgzisbMc8892fgG0BHO86Zk3lvkT35ACj0XCVRoThEYFSkEUOc01lMK0caNg1IEj5L3jtbIz4Exm+qoXYt4l7Z+V1je1qWGC77lp7d2Oqa7XSZf4wpqvj7hOKe4w2fd5E17VVsFXVgivQjIjXPyfaOXAbhs71NhY1UvbqeqHyWke52eT14ZfpDoUsHWk7pYMc4lWnZJhZ8KcJ9cAOut62wB2xDL8O4wFTNzLBBK538wgs5nSCetKQu4yzw3YZqjvDCZJc7K+XjsCEBoGUOMO0BSN024Dm2sUrCFjyvF15tyKW1PgyYeeaauFXdjsNBgajZVVMI/SqPX/WZrXE2tMh6L4yI7AySbghqGBNgFq81fnI0MslK2VvIMJmbr9QzN32Lz3BwP/YP9wXQ/vNlBPWqXD3Z6nkBvam9PcXYG17ibBWgV/3KjnuKRTsow+dctcDzNafxz79afwfzzd59FeB4QsbQhNc0qaQusNviw25q0dnh/nwS0wow==
Received: from ?IPV6:2620:0:1000:8411:be2a:6ac0:4203:7316? ([2620:0:1000:8411:be2a:6ac0:4203:7316])
        by smtp.gmail.com with ESMTPSA id x16-20020aa79a50000000b006e03be933cesm67976pfj.96.2024.02.05.09.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 09:08:27 -0800 (PST)
Message-ID: <55fa1c14-87ef-46ef-8871-f7139f86e8b7@acm.org>
Date: Mon, 5 Feb 2024 09:08:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ufs: core: fix shift issue in ufshcd_clear_cmd
Content-Language: en-US
To: alice.chao@mediatek.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 peter.wang@mediatek.com, powen.kao@mediatek.com, naomi.chu@mediatek.com,
 cc.chou@mediatek.com, tun-yu.yu@mediatek.com, chun-hung.wu@mediatek.com,
 casper.li@mediatek.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240205104905.24929-1-alice.chao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240205104905.24929-1-alice.chao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_090917_787990_011FAF6F 
X-CRM114-Status: UNSURE (   6.55  )
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

On 2/5/24 02:49, alice.chao@mediatek.com wrote:
> When task_tag > 32 (in mcq mode), 1U << task_tag will out of bound
        ^^^^^^^^^^^^^
        task_tag >= 32 and sizeof(unsigned int) == 4

> for u32 mask. Fix this bug to prevent SHIFT_ISSUE (Bitwise shifts
> that are out of bounds for their data type).

Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

