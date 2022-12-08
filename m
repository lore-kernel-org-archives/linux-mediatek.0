Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4806FC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 08:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQH5Uo0nZFf6VyuebjjssC83hb0ljjUFvuvb3HDCZtM=; b=DpLuM7l5KCJIW/nD2o5VlrG9XY
	0dW5oqQpvMr7t6axPulLfukoBq134IysUXwf2v0Uy2TSHiZ1ZxpK+sjUmlxP0YgGwwdIraih17a9H
	cQeZ0aWKhMydMqvvppM+SG9dDu5DTPtJhnGAbWjmwazHVhUxX4P6xCnpKpJsNf6Qij0fpIKajGIGK
	XEJQeR2EjpP/UqPweBOCq6Ivfo0sFm/AquE3HG1ZbhTumWLy0uMb25W0L9OrL0JoodDdnX1/CEInB
	BmXwI6nZwMLgSou2blOK+acjFMczIOo+tqxERm7VqgB+LW3Zg6uMu0WL2OSLQ06jHjEyosGeG3pa+
	bgQJHLAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CWt-00AG8Y-AC; Thu, 08 Dec 2022 08:45:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CWC-00AFRH-Hh
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 08:44:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E26CA61DEB;
	Thu,  8 Dec 2022 08:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE68DC433C1;
	Thu,  8 Dec 2022 08:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670489075;
	bh=4Od5jI8PP500Ivc1x21S6isQvmmiJ54/ylxZPILU1lY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cmB/sB3DU7qzYDJnJoXLMtdOhnXa8m0HkNwDuQTxzbp97f9LMuKI64O1BFjt/4Y1L
	 /7+azhbxTWvouwuGFMcEBkv371HModImESN8OTSvPxMi4+woRM9eyvHEAZltBMoN7n
	 eAaJoHY28gociiIkmWEbOQjpGat6A/eulpaKNYYzQQLEIkvYLXFgwxWIa97p8LBQgj
	 /XiTZQ4C/pu7db1KCPLxiBRS2oKVMyf/QLbea0kEXKbpJFcxFzO5ik+k/fGummT1Pg
	 XmYxtSIE52SL6tV7Skfr8elLXJVjp87PUhw+YtFlosiCMsB2WY9cbr4lCpTOpZp2o/
	 AUc4k+3Mwqlvw==
Date: Thu, 8 Dec 2022 10:44:31 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
	sujuan.chen@mediatek.com
Subject: Re: [PATCH v3 net-next 2/2] net: ethernet: mtk_wed: fix possible
 deadlock if mtk_wed_wo_init fails
Message-ID: <Y5Gj7y0412M9zNpD@unreal>
References: <cover.1670421354.git.lorenzo@kernel.org>
 <b28b55a639002a56b77c0651a4122ebede041936.1670421354.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b28b55a639002a56b77c0651a4122ebede041936.1670421354.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_004436_682008_190F99C9 
X-CRM114-Status: GOOD (  12.59  )
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

On Wed, Dec 07, 2022 at 03:04:55PM +0100, Lorenzo Bianconi wrote:
> Introduce __mtk_wed_detach() in order to avoid a deadlock in
> mtk_wed_attach routine if mtk_wed_wo_init fails since both
> mtk_wed_attach and mtk_wed_detach run holding hw_lock mutex.
> 
> Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_wed.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index 4ef23eadd69e..a6271449617f 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -577,12 +577,10 @@ mtk_wed_deinit(struct mtk_wed_device *dev)
>  }
>  

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>

