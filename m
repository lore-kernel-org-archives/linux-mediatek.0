Return-Path: <SRS0=dCaZ=2J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0C2C2D0C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 18:33:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2CC324672
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 18:33:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Huc5wq/i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glXTEz6x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2CC324672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ToLAmIpoavPvakDKoiat4H/CnGVXwF5zq3GJqukGO+E=; b=Huc5wq/i9N4YUs
	hTZbulDqVkDiaefTKHUj9RCGJWqXXMP7PKTYOqsotFSYT0Arssxmd/2wnnHtZhmdO87MaPO2EnEt5
	KW1yOgufCJmPMdgrL2SUoXmgJM1+I4hisW6tH1k9Mn/i3KBw2w2NYafV0oV1I0mlePYB2XNVaVBJQ
	zPBjJYx/Nxw8C8lmc1RsiSYKiuQBJ0AqfwvoRfM3EtpyWg31W4SOzRHwGN3LyMSW009fXtb5DPDz+
	oSs373hBaII56krDSAeQuNhPrscdlZfJO7rC12mnhAYKXsIffTrDJjmiqFsFDLC0p8CiP8KdOoAXw
	v+eOT3+K7Y5crrB3EpEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii0bf-00064I-Gx; Thu, 19 Dec 2019 18:33:03 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii0bc-00063J-CM; Thu, 19 Dec 2019 18:33:01 +0000
Received: by mail-ua1-x943.google.com with SMTP id f7so2301555uaa.8;
 Thu, 19 Dec 2019 10:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VOyymaYGcmSJ1WRzuqz4Ak0rmhgIqLCqZ8zG2kPHNMo=;
 b=glXTEz6xo8pZIYtMNXBEZKiZ6kJgRXxgzHEMYNU3S58gEmx1YdW2HvnbOPO9ixmQ1w
 JTqyRLAr76LLdCT4bxMI1SmmDS/6dXWPYgyri6gBmzDXrBgFdhKFUgezb0cIDPigANgE
 E9IZQvFNURFRyGqU7OKos8+sbog3m8xUCEzQCYb4PR/viN3IIsMviu0e1K/E5IbFVg4t
 oPHGjpJNZInKrcf3fI8mbv5IeegUQpAy8NxZ4n9nvDz3nSOZYq9q7WQZ9J6+V08tlCJl
 sylHG8fEiJAvulZsLjgf3pWqz+Jj4RgxEue9g0gKXdrtHYI/6Nz0A9v/zZ5U0kZbdVX0
 awWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VOyymaYGcmSJ1WRzuqz4Ak0rmhgIqLCqZ8zG2kPHNMo=;
 b=Ne52wCQwYU6Zwp0Sh129wGq1lQ7ymH4YaHnualW4XzuXJTa4vNV7nhwt9aNLn0euCe
 0al/YW701B6xHlki9kU1d35RcgQBI+SAmXzSZomdB1zvyiCul9XEUuth+w1COumI/K+j
 ZA9LzOyuNUI7jqGx+3l0tYPFU6JsAnm8Uf211lS7CatDqUXX9HZrJn6vCcfW53vB1g/t
 fVDYePohUVgj0KPWEjCpgS6PXlWRUSEU+JBzi5QzNC/4Vt+6bRArgMGwvc7VTYA3LP36
 yzEJz0tq9eSVtkJ/emj35EpHXMn6uiIiu753is2pMEPyZUePQPal3AY9zQtouEfJNOpc
 1RZQ==
X-Gm-Message-State: APjAAAUeLP/Te+XAWzA47GVbhxoQ//F9i2jDiSFGb7+PDHw9RTwzvQ27
 PUZFzXS/GwpLATlh7v7txJxBaDOWzNSDv/+q0jIpSVu66ts=
X-Google-Smtp-Source: APXvYqwM3UEwSjHttH0IdDl/GVqzd05+x7SvoHGEo+WgDCx2bVOHaGPhK0SsHTOHsJq/GpXPgXIoNGKQmA3xGy6FlWA=
X-Received: by 2002:ab0:7049:: with SMTP id v9mr6389360ual.95.1576780379310;
 Thu, 19 Dec 2019 10:32:59 -0800 (PST)
MIME-Version: 1.0
References: <1576224695-22657-1-git-send-email-stanley.chu@mediatek.com>
 <1576224695-22657-3-git-send-email-stanley.chu@mediatek.com>
In-Reply-To: <1576224695-22657-3-git-send-email-stanley.chu@mediatek.com>
From: Alim Akhtar <alim.akhtar@gmail.com>
Date: Fri, 20 Dec 2019 00:02:22 +0530
Message-ID: <CAGOxZ52ffkFwkcrdyq+gjuXarjr-aqGRw2ck25Yu0QgppGh9hQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] scsi: ufs: export ufshcd_auto_hibern8_update for
 vendor usage
To: Stanley Chu <stanley.chu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_103300_444212_C41988E2 
X-CRM114-Status: GOOD (  15.02  )
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
Cc: linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, andy.teng@mediatek.com,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, chun-hung.wu@mediatek.com,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, Avri Altman <avri.altman@wdc.com>,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 13, 2019 at 2:07 PM Stanley Chu <stanley.chu@mediatek.com> wrote:
>
> Export ufshcd_auto_hibern8_update to allow vendors to use common
> interface to customize auto-hibernate timer.
>
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

> ---
>  drivers/scsi/ufs/ufs-sysfs.c | 20 --------------------
>  drivers/scsi/ufs/ufshcd.c    | 18 ++++++++++++++++++
>  drivers/scsi/ufs/ufshcd.h    |  1 +
>  3 files changed, 19 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/scsi/ufs/ufs-sysfs.c b/drivers/scsi/ufs/ufs-sysfs.c
> index ad2abc96c0f1..720be3f64be7 100644
> --- a/drivers/scsi/ufs/ufs-sysfs.c
> +++ b/drivers/scsi/ufs/ufs-sysfs.c
> @@ -118,26 +118,6 @@ static ssize_t spm_target_link_state_show(struct device *dev,
>                                 ufs_pm_lvl_states[hba->spm_lvl].link_state));
>  }
>
> -static void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit)
> -{
> -       unsigned long flags;
> -
> -       if (!ufshcd_is_auto_hibern8_supported(hba))
> -               return;
> -
> -       spin_lock_irqsave(hba->host->host_lock, flags);
> -       if (hba->ahit != ahit)
> -               hba->ahit = ahit;
> -       spin_unlock_irqrestore(hba->host->host_lock, flags);
> -       if (!pm_runtime_suspended(hba->dev)) {
> -               pm_runtime_get_sync(hba->dev);
> -               ufshcd_hold(hba, false);
> -               ufshcd_auto_hibern8_enable(hba);
> -               ufshcd_release(hba);
> -               pm_runtime_put(hba->dev);
> -       }
> -}
> -
>  /* Convert Auto-Hibernate Idle Timer register value to microseconds */
>  static int ufshcd_ahit_to_us(u32 ahit)
>  {
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index b5966faf3e98..589f519316aa 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -3956,6 +3956,24 @@ static int ufshcd_uic_hibern8_exit(struct ufs_hba *hba)
>         return ret;
>  }
>
> +void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit)
> +{
> +       unsigned long flags;
> +
> +       if (!(hba->capabilities & MASK_AUTO_HIBERN8_SUPPORT))
> +               return;
> +
> +       spin_lock_irqsave(hba->host->host_lock, flags);
> +       if (hba->ahit == ahit)
> +               goto out_unlock;
> +       hba->ahit = ahit;
> +       if (!pm_runtime_suspended(hba->dev))
> +               ufshcd_writel(hba, hba->ahit, REG_AUTO_HIBERNATE_IDLE_TIMER);
> +out_unlock:
> +       spin_unlock_irqrestore(hba->host->host_lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(ufshcd_auto_hibern8_update);
> +
>  void ufshcd_auto_hibern8_enable(struct ufs_hba *hba)
>  {
>         unsigned long flags;
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 2740f6941ec6..86586a0b9aa5 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -927,6 +927,7 @@ int ufshcd_query_flag(struct ufs_hba *hba, enum query_opcode opcode,
>         enum flag_idn idn, bool *flag_res);
>
>  void ufshcd_auto_hibern8_enable(struct ufs_hba *hba);
> +void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit);
>
>  #define SD_ASCII_STD true
>  #define SD_RAW false
> --
> 2.18.0



-- 
Regards,
Alim

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
