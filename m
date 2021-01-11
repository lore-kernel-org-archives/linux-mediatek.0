Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E285C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 10:13:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C977F22288
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 10:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C977F22288
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a1E/pTkFTcqK92uqfsKkDd1f7p+bHVc+U8WRd0G+QP0=; b=VaFPl5wH3PV1MQ0IGiu/zyHz1
	hsVola5orMAEu+/Lg7oKsbLsgpKqU5OSBOmjVF9gN2eTwtXH4VkiZECC5x+i8wAUR4yVot5dot7/3
	/dwagf30PVUYeF1FzLwesJpddgLRE2Ys7xUGkTcOfFJZ5yzZ69KQL12GenVz5tHwTCgA8ixAcjnst
	BYUeW46IamqyIEipwp6tYP1tyzuPwImq8tNQkhMh8gsCyNklu4bHyy0GmEhNHGVgsV0arDshtSpND
	dzz5KA1Md2eyTXcE6CPQ9IzJWUhJV7bpnRuf3g2XvdPY2icDutvMyN8021dnL69xHPIOxC5GOGh+3
	opXSQOhVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyuCo-0000PE-Pe; Mon, 11 Jan 2021 10:13:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyuCi-0000Mi-2Z; Mon, 11 Jan 2021 10:13:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74CC022283;
 Mon, 11 Jan 2021 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610360018;
 bh=xPveBl9oJpaTajaPhT68nWD4E5CeEL2CGF/QRffMYsU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u8BhcTDhH0mxE02xSTzL1NjSpBQXPhT0Yh1rnlj5qgoW0ztZPlYnTA6jAwpYgAsVE
 kAL1AW7HsY6nUpRCNzhAdqZqqSfuKoTiL3+XqIsxvTFybHS/3mRMiGkNGC69HPMAhJ
 d0mMs/Umk2cayrpy70VbxdcqIEvNfa9wSLkpGhx28jPrfvl2i90Zh9RIS0h9ryr5R8
 hkMmgX1gT+AAV3GfdTQYphI0vPrnlGz0rjb5g33muSZcPbJCTVrSWwoSpY8pD4vC71
 F9pImeuSLvlZWn7BDeBpAivbo+mkaZM3VfRCYelpYppM0auCVqafjqgMOxTx9dfZFO
 IjTImBya3x+yg==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kyuCl-0004P2-H2; Mon, 11 Jan 2021 11:13:43 +0100
Date: Mon, 11 Jan 2021 11:13:43 +0100
From: Johan Hovold <johan@kernel.org>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] drivers: gnss: simplify the gnss code return
 expression
Message-ID: <X/wk15eOf/gmVbe9@hovoldconsulting.com>
References: <20201210135142.1138-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210135142.1138-1-zhengyongjun3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_051340_225419_BFC6F37E 
X-CRM114-Status: GOOD (  15.32  )
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
Cc: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 johan@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 10, 2020 at 09:51:42PM +0800, Zheng Yongjun wrote:
> Simplify the return expression at diffrent .c file, fix this all.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/gnss/core.c |  7 +------
>  drivers/gnss/mtk.c  | 14 ++------------
>  drivers/gnss/ubx.c  | 14 ++------------
>  3 files changed, 5 insertions(+), 30 deletions(-)

>  static int __init gnss_module_init(void)
> diff --git a/drivers/gnss/mtk.c b/drivers/gnss/mtk.c
> index d1fc55560daf..451cb6e66ec3 100644
> --- a/drivers/gnss/mtk.c
> +++ b/drivers/gnss/mtk.c
> @@ -24,25 +24,15 @@ struct mtk_data {
>  static int mtk_set_active(struct gnss_serial *gserial)
>  {
>  	struct mtk_data *data = gnss_serial_get_drvdata(gserial);
> -	int ret;
>  
> -	ret = regulator_enable(data->vcc);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return regulator_enable(data->vcc);
>  }

These functions where written with explicit success paths on purpose so
there's nothing to "fix" here. 

Johan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
