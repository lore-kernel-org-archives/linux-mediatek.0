Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6F4ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 14:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6DICuotm8vGwjU2DpB6zrDRD6phZDhtkJSCVVMN0Rc=; b=mQgPfKZz9z3lLhdpfAP/1FPnh0
	9p7qqWv/JAux4turVnVcLfs/JoDSnU2uUdCmMIwUlPLHggcsXPP2HsS5nv6f1y0im7LDgZu+qUIHx
	/vj7JHwbNDBkXTHYlMOijRC7+Qm0ERTSNp3Nx9ZQMIzj6gsqA7EL3IFz6gYoxfNbBku7FyVRjTLWN
	ZvPY1oa81C3hX0sFxCeg2ttxQuSnsXJtkMNO99UlmCMkYbVe8eGsBaTpST+6HN1SQRavKmFAT7mV2
	t1dZyDmaqeWGnjgbfQDhIz16Erhwi3bXX4VKl1VBV6ZLJRZgv/gqVZ85O2k3Q43N5BfFItOXyn1Dk
	Oh2XmEEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaHdr-00C3va-7A; Mon, 19 Sep 2022 14:20:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaHdX-00C3pC-OD; Mon, 19 Sep 2022 14:20:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A22876601D86;
	Mon, 19 Sep 2022 15:20:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663597238;
	bh=jIZlUsaX0uvAy6EJmiw/8+y97dq2zwl8I5cLD0c39OI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SQ7VvYPduvIrRs6DMj9+FxF1aaVnxSv9+YE1wxv/WsMklK9qkdjwOKMirDr2A5/WT
	 YwtqA/RlIZkghg+Xt0Xe4Kw7UpuzjlIKETw+MAWyu8w88x3SDE0msOz1OwCMkLm2pJ
	 dw85a6RhdrmKx5zUYwgshU487wXKJi9dE2pljIATIz1/NAWwgDwoWIBZLxVtRE+0Ba
	 Ze+NqiqFCrQZJXCfQWB4JiO71p9mY2L6PhOjfH1QbAGYq8vSVKBt1UaDip+Hjkahxn
	 FdtqjTWWIqOhEsl26Lw3Kx1NyeCo/sZhZM1c0+0KvL0mS/+U2tM8j7JeoFFMUduVHH
	 rG8JRMAXxqzOw==
Message-ID: <276a4a37-a98d-c59b-a967-db9f5b220077@collabora.com>
Date: Mon, 19 Sep 2022 16:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 3/6] iommu/mediatek: Add error path for loop of
 mm_dts_parse
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, mingyuan.ma@mediatek.com,
 yf.wang@mediatek.com, libo.kang@mediatek.com, chengci.xu@mediatek.com,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 Guenter Roeck <groeck@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>
References: <20220919092405.8256-1-yong.wu@mediatek.com>
 <20220919092405.8256-4-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919092405.8256-4-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_072039_950321_23D56235 
X-CRM114-Status: GOOD (  14.12  )
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

Il 19/09/22 11:24, Yong Wu ha scritto:
> The mtk_iommu_mm_dts_parse will parse the smi larbs nodes. if the i+1
> larb is parsed fail, we should put_device for the 0..i larbs.

If any v6 will be required... you forgot to update the commit description with
"we should put_device for the i..0 larbs".

> 
> There are two places need to comment:
> 1) The larbid may be not linear mapping, we should loop whole
>     the array in the error path.
> 2) I move this line position: "data->larb_imu[id].dev = &plarbdev->dev;"
>     before "if (!plarbdev->dev.driver)", That means set
>     data->larb_imu[id].dev before the error path. then we don't need
>     "platform_device_put(plarbdev)" again in probe_defer case. All depend
>     on "put_device" of the error path in error cases.
> 
> Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

In any case....

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



