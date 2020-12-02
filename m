Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B293BC64E7C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 10:16:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DD06206E3
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 10:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DD06206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2nM4QWUTBPhSALyN+iL1Qc5z0lGRZ0OrfBMGZXI1Zxg=; b=QZwvD6VJZkSnptfrSZQ0FwB7z
	VUAOq/iUO4WbJXDHDv8p0NhPvqS6yvgsj/0Gqf+4UQHLpDD1lW4H10GiFr+UP17hHDwZD3gi6bYAW
	MCotAD1fordUj3mJHD+EszzsQJsyDPDFjBl8OwWOR1/d3cN5ka2WIF8iP4yyghWr0AYa3wMpToU9P
	+k/9v8hdQlniXHBmykCKzFb6VtW/gSA92QrUxR85U31wCkc6ylLx0wq9zS1z22Yo/d1P/76ubMaiB
	N5tkjtECy4MqdbYPJzgo10VQ7J8R8l95/E2eEUDPNcfTvLzBd7Fmj1lU+FnSC1FXUXG6L3GC5Em+h
	U7UupdRFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkPBn-0000YJ-Rq; Wed, 02 Dec 2020 10:16:47 +0000
Received: from m42-5.mailgun.net ([69.72.42.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkPBk-0000XS-Sj
 for linux-mediatek@lists.infradead.org; Wed, 02 Dec 2020 10:16:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606904204; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=PtTR3K77Jj6EGHE+NEYqNB3DHE430N+l6KIpgZc7+Vg=;
 b=Cz+3ypvllGLhBmZfs3TFx1ezOnCBJlTUQOwORQEG146XEw+mrQZy7+bhZgCNA+W9RU3ST9GH
 ZeNhBM2HNjTGMtLPtw88sjMsqOTAqvh1ZWw4G8Xz1uRWmusRMn3BCHS7ytCF3iw4HLK4ysAT
 qWPqCNqaqYIu9RbeheWlui94hdU=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fc76980e084c50478307baf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Dec 2020 10:16:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 69B84C43465; Wed,  2 Dec 2020 10:16:32 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C7586C433C6;
 Wed,  2 Dec 2020 10:16:30 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 02 Dec 2020 18:16:30 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v3] scsi: ufs: Remove pre-defined initial voltage values
 of device powers
In-Reply-To: <20201202091819.22363-1-stanley.chu@mediatek.com>
References: <20201202091819.22363-1-stanley.chu@mediatek.com>
Message-ID: <3d3e5d90774423243b071b20191e9ce4@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_051644_996030_013922C8 
X-CRM114-Status: GOOD (  23.98  )
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
Cc: jiajie.hao@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cc.chou@mediatek.com, avri.altman@wdc.com,
 alice.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-12-02 17:18, Stanley Chu wrote:
> UFS specficication allows different VCC configurations for UFS devices,
> for example,
> 	(1). 2.70V - 3.60V (Activated by default in UFS core driver)
> 	(2). 1.70V - 1.95V (Activated if "vcc-supply-1p8" is declared in
>                           device tree)
> 	(3). 2.40V - 2.70V (Supported since UFS 3.x)
> 
> With the introduction of UFS 3.x products, an issue is happening that
> UFS driver will use wrong "min_uV-max_uV" values to configure the
> voltage of VCC regulator on UFU 3.x products with the configuration (3)
> used.
> 
> To solve this issue, we simply remove pre-defined initial VCC voltage
> values in UFS core driver with below reasons,
> 
> 1. UFS specifications do not define how to detect the VCC configuration
>    supported by attached device.
> 
> 2. Device tree already supports standard regulator properties.
> 
> Therefore VCC voltage shall be defined correctly in device tree, and
> shall not changed by UFS driver. What UFS driver needs to do is simply
> enable or disable the VCC regulator only.
> 
> Similar change is applied to VCCQ and VCCQ2 as well.
> 
> Note that we keep struct ufs_vreg unchanged. This allows vendors to
> configure proper min_uV and max_uV of any regulators to make
> regulator_set_voltage() works during regulator toggling flow in the
> future. Without specific vendor configurations, min_uV and max_uV will
> be NULL by default and UFS core driver will enable or disable the
> regulator only without adjusting its voltage.
> 
> Acked-by: Avri Altman <avri.altman@wdc.com>
> Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Can Guo <cang@codeaurora.org>

> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd-pltfrm.c | 19 -------------------
>  1 file changed, 19 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c 
> b/drivers/scsi/ufs/ufshcd-pltfrm.c
> index 0619cfbfbdbb..1a69949a4ea1 100644
> --- a/drivers/scsi/ufs/ufshcd-pltfrm.c
> +++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
> @@ -134,25 +134,6 @@ static int ufshcd_populate_vreg(struct device
> *dev, const char *name,
>  		dev_info(dev, "%s: unable to find %s\n", __func__, prop_name);
>  		vreg->max_uA = 0;
>  	}
> -
> -	if (!strcmp(name, "vcc")) {
> -		if (of_property_read_bool(np, "vcc-supply-1p8")) {
> -			vreg->min_uV = UFS_VREG_VCC_1P8_MIN_UV;
> -			vreg->max_uV = UFS_VREG_VCC_1P8_MAX_UV;
> -		} else {
> -			vreg->min_uV = UFS_VREG_VCC_MIN_UV;
> -			vreg->max_uV = UFS_VREG_VCC_MAX_UV;
> -		}
> -	} else if (!strcmp(name, "vccq")) {
> -		vreg->min_uV = UFS_VREG_VCCQ_MIN_UV;
> -		vreg->max_uV = UFS_VREG_VCCQ_MAX_UV;
> -	} else if (!strcmp(name, "vccq2")) {
> -		vreg->min_uV = UFS_VREG_VCCQ2_MIN_UV;
> -		vreg->max_uV = UFS_VREG_VCCQ2_MAX_UV;
> -	}
> -
> -	goto out;
> -
>  out:
>  	if (!ret)
>  		*out_vreg = vreg;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
