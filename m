Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC06C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 09:22:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AE3F20663
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 09:22:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cojzVpoC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="fY+iDjNc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AE3F20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oeGBO6QYBbn9o2TmcpqqA0J6r4jm4YCd1nE0hpwyV/k=; b=cojzVpoCVtTnoPUjmJfbgXWL9
	SPS+KuRR33TFo8HDiRhzv7d3WL70RqhVqZr4PsIBiseHH94U06jYs2kwYBSWs5e9b/JHsa394Dukh
	rGYVp61H02YTls8Ca+x1+BKAxgviIMFT5Ce5WigG7PlaBnbEErSEyAFvtRB05/KRdGDxx1NDn/q3A
	hwhx4ziVpQKjcY1St+n0AngumN8Dm4q8hYaxmeZxdePJE6bwNKvGFsyDTEotc+8FTRvJImQRPZt/0
	TukH3P1BXqSkbxz8J1wmQRXxtom/ztHgQR6DaFDhJF/mnBPPdKlvo7ptsRu+Rvz0wz+4N5R6vsITU
	nvgX46H1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0iHZ-0008Dn-Hk; Wed, 29 Jul 2020 09:21:53 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0iHW-0008D1-Vm
 for linux-mediatek@lists.infradead.org; Wed, 29 Jul 2020 09:21:51 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596014510; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=etwntT/UXHBGXrs4qAMnLbYZVQi1JM8geWOVCkcTuo0=;
 b=fY+iDjNcQwBZZKTi7HCkSjgMLmX0k6zWD5U8XJo9XoQHS11JatOk0M4QDdOoyxQV3BfbWsIq
 3eAnjuHkahIz+5F/5lwys+tDGWlOnm+8lTS2o8+JzTnEfkYbUSKRCST4YGI//cFlV4ss8ExP
 6OADBs9TngVSSWHPpT4ESc3ssig=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5f213fadbd0c3f0296b2baf9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 29 Jul 2020 09:21:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D42E7C433CB; Wed, 29 Jul 2020 09:21:48 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B7C02C433C6;
 Wed, 29 Jul 2020 09:21:47 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 29 Jul 2020 17:21:47 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 1/2] scsi: ufs: Introduce device quirk "DELAY_AFTER_LPM"
In-Reply-To: <20200729051840.31318-2-stanley.chu@mediatek.com>
References: <20200729051840.31318-1-stanley.chu@mediatek.com>
 <20200729051840.31318-2-stanley.chu@mediatek.com>
Message-ID: <1cf315e12d21dd91906321d7303cff99@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_052151_070660_1CE52F67 
X-CRM114-Status: GOOD (  18.96  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cc.chou@mediatek.com,
 avri.altman@wdc.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-07-29 13:18, Stanley Chu wrote:
> Some UFS devices require delay after VCC power rail is turned-off.
> Introduce a device quirk "DELAY_AFTER_LPM" to add 5ms delays after
> VCC power-off during suspend flow.
> 
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufs_quirks.h |  7 +++++++
>  drivers/scsi/ufs/ufshcd.c     | 11 +++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/scsi/ufs/ufs_quirks.h 
> b/drivers/scsi/ufs/ufs_quirks.h
> index 2a0041493e30..07f559ac5883 100644
> --- a/drivers/scsi/ufs/ufs_quirks.h
> +++ b/drivers/scsi/ufs/ufs_quirks.h
> @@ -109,4 +109,11 @@ struct ufs_dev_fix {
>   */
>  #define UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES (1 << 10)
> 
> +/*
> + * Some UFS devices require delay after VCC power rail is turned-off.
> + * Enable this quirk to introduce 5ms delays after VCC power-off 
> during
> + * suspend flow.
> + */
> +#define UFS_DEVICE_QUIRK_DELAY_AFTER_LPM        (1 << 11)
> +
>  #endif /* UFS_QUIRKS_H_ */
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index acba2271c5d3..63f4e2f75aa1 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -8111,6 +8111,8 @@ static int ufshcd_link_state_transition(struct
> ufs_hba *hba,
> 
>  static void ufshcd_vreg_set_lpm(struct ufs_hba *hba)
>  {
> +	bool vcc_off = false;
> +
>  	/*
>  	 * It seems some UFS devices may keep drawing more than sleep current
>  	 * (atleast for 500us) from UFS rails (especially from VCCQ rail).
> @@ -8139,13 +8141,22 @@ static void ufshcd_vreg_set_lpm(struct ufs_hba 
> *hba)
>  	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba) &&
>  	    !hba->dev_info.is_lu_power_on_wp) {
>  		ufshcd_setup_vreg(hba, false);
> +		vcc_off = true;
>  	} else if (!ufshcd_is_ufs_dev_active(hba)) {
>  		ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
> +		vcc_off = true;
>  		if (!ufshcd_is_link_active(hba)) {
>  			ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq);
>  			ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq2);
>  		}
>  	}
> +
> +	/*
> +	 * Some UFS devices require delay after VCC power rail is turned-off.
> +	 */
> +	if (vcc_off && hba->vreg_info.vcc &&
> +		hba->dev_quirks & UFS_DEVICE_QUIRK_DELAY_AFTER_LPM)
> +		usleep_range(5000, 5100);
>  }
> 
>  static int ufshcd_vreg_set_hpm(struct ufs_hba *hba)

Reviewed-by: Can Guo <cang@codeaurora.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
