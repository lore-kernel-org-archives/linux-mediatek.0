Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3087C2BD05
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 11:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rI9nc12Dtl6fT48tRwNbwVy6dpdXAX6/GLUfyLFIgPI=; b=A/kHrRMQlLfuzkteb5ZKF7f8Qw
	3ir2M28Khe9SCmK5Jp3QijGkWAPQoJkFabKvqetRZ5z94uzUwRkR4Y34F97mybLJJ4FYQViObQriz
	lCkJjSYpB92fb5oI3WOcqQ9dCkEuYw6EJBZJPsYFTqDDCCR9DHB9h6ZJuUNZR6eL8zxO5gZg+11Vb
	dEM4Qj0MCmBNE8+G6SfCIPJS5KUhfjo+o71BFacLF8pNMHncORNXnjCX4cHJKjaq/DxsmrwvpGkH7
	iIAijEqYy2Qlw0YT7+OFiGpo8ktbvYF7qyOIBgb4nO29X88Qtg+/SHukiwFjyGGqOXROKXj90MKXn
	Kkxlj/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhy3-0000000GcyN-03qu;
	Mon, 24 Jun 2024 11:34:39 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhxw-0000000GcvS-1ZCO;
	Mon, 24 Jun 2024 11:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719228871;
	bh=YLhTWK6igYJuPvZyPGLIMWGPCfN4vQMIvMus5EY3xto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cbfG0/9OvAfM0klxsGM6D/6s7rhg2rwR4bxDE2ioVTZxtCrPkBdS8olFDK7/n2l2Y
	 5/+V+LDSkOvfUWs5X1Qf76/KyO+fVQk1TuLGLMw7G7ub+GafZtKnDKThb4Qy5NmSrt
	 cICuYf61w9t22Tx2xqs01glNX3mIyXIMsotyV8NIt23aS+cm5TaIuu0lHksqSRZptQ
	 ov/96GNysovLsUnMgpjOdMtBLKS2ervVFiBwmsCg4WW41AFsxcCYhMr6vMeXQW5vcc
	 ulbZjeU7LU/n15eAavqaEelm+znFmvRpnBN4R2zEKsZp1djp0IG+iyUGaNGsLdWUVm
	 biDXYud5GoVRA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8857437804C6;
	Mon, 24 Jun 2024 11:34:30 +0000 (UTC)
Message-ID: <05841850-aeb6-47b6-916b-f4889d971d5c@collabora.com>
Date: Mon, 24 Jun 2024 13:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: mtk-cmdq: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20240608-md-drivers-mailbox-v1-1-6ce5d6f924ad@quicinc.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240608-md-drivers-mailbox-v1-1-6ce5d6f924ad@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_043432_582592_397039B0 
X-CRM114-Status: GOOD (  10.44  )
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

Il 08/06/24 18:31, Jeff Johnson ha scritto:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mailbox/mtk-cmdq-mailbox.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 4aa394e91109..8247584bcbeb 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -790,4 +790,5 @@ static void __exit cmdq_drv_exit(void)
>   subsys_initcall(cmdq_drv_init);
>   module_exit(cmdq_drv_exit);
>   
> +MODULE_DESCRIPTION("Mediatek Command Queue(CMDQ) driver");

MODULE_DESCRIPTION("MediaTek Command Queue (CMDQ) Mailbox driver");

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



