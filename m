Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC839C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 06:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvEzohbThjLf0h3wsatoxrFWAD5WOAdcVplnsmd6fDY=; b=oitkUuO8TQ0slB6R9InUDGBrib
	CHUW47wnUedDX52S+1u+H1vkKP1Qyy0K4qMBw17qCxVYk5cb3IUlDkfgfjg0SdU5+mTalwQwiKYhF
	25jqt+fWaGdvO/NQXbDYw1lk6c7mlBO+KHFtUOQIOnHoBOdAbRAJjq33Ojpi9uAGAvVar7sQyffRq
	ATv5k3lAp7JCpF39Pk8haydJS1WYGM4THlZPYp5K4Hp2teQlaxFeIzFIEUfv3smFxSdyt3Ax+us0x
	bTs9qg36m3RPM1bLuuDV06coN0FjZ3jL1x9+NuemfMJpXSTBRcWKvnmEL9H2wtzG2XHQVUYJm5u+W
	rYtkOs6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3AYT-0045R7-O3; Thu, 08 Dec 2022 06:38:49 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3AU9-003ykb-UC
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 06:34:23 +0000
Received: by mail-lj1-x22e.google.com with SMTP id n1so535263ljg.3
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Dec 2022 22:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvEzohbThjLf0h3wsatoxrFWAD5WOAdcVplnsmd6fDY=;
        b=fFAVrLZXrJJ1GBpBB/tQ1n7kV1X/9Rn46h7U8vz3M4Om+TzOIrlxezxc9JnM2rzDi+
         wou1Hwh2yqzdkZamzf1utI0RyT/0QbcWSBm9s6T4H+GLlse28qsMpKxI3Y4ATR8xT9Lq
         nYYhaB0M+g3mTMeE9FYzMMpEh+TQDm11JknZp5TyxnH6LC+nw0pYfZSLELeOMCoG9mLO
         WuELI6GBZHmYiDwIAYZosinwwxA4LrYa2d0AyXyyUu68qDy/ueuPzpL90RsW3dBoqTNh
         VF50j+4kWJ8gZEgKxEb/6ts6SxZRIl4aay7hWvm8sy+xeWz9kjNlBjLxa36Iv0u7FBfM
         V0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kvEzohbThjLf0h3wsatoxrFWAD5WOAdcVplnsmd6fDY=;
        b=hXB5zhjfplEUIgXDaynqLr5hAeFsqluyK8dWCw9MsLNgbusRpeuxjBrZottGUnwQKc
         d/6bwGRwSBozCGW9NUQ8lc4wu6c2vRDGidRENMdlNQ0qHyism9fxdtC8+A3ulWvgiG6+
         qzP95JGNKcgAOR9gyhYWLfpDiFkbdmHL0cS565IfB5SOs9V/8B9nseGazybpdaRLEtMC
         qigMLI9CoGs3lCn1gFOamB1Im6ulaqWW3KhouyLeugDTS08nkj7qeDT4jfRNp16XqulQ
         Ao3v9hxmkTrKaDy+7oA+BF5M32kshD1mFda1zxfhT7g8BmjiII7CTTy5B4yqLi5pFbS9
         jebg==
X-Gm-Message-State: ANoB5pkHx/14EdIQfw4hD9EvPmvnORRg8/xCtzKedyUQoLU4U1nrgU1q
	DwGpKsuoVhXoDxx2p6y/eisUh73qE2likxnWIw==
X-Google-Smtp-Source: AA0mqf5vx1cSAeMelmy7VQm+f5BVpQcnvI/NYkPrDeRiepDck4qrGlIf2FKqYQvII4OYK7sQ/CAbbqKB43TOLPq9NJg=
X-Received: by 2002:a2e:bf09:0:b0:279:6c82:3e9a with SMTP id
 c9-20020a2ebf09000000b002796c823e9amr21501858ljr.97.1670481256983; Wed, 07
 Dec 2022 22:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20221208061037.24313-1-peter.wang@mediatek.com>
In-Reply-To: <20221208061037.24313-1-peter.wang@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Thu, 8 Dec 2022 14:34:05 +0800
Message-ID: <CAGaU9a_RCpoJggFUmtBmq-xx8EPAaabMK0ptA8y_nm5ahLTMUw@mail.gmail.com>
Subject: Re: [PATCH v5] ufs: core: wlun suspend SSU/enter hibern8 fail recovery
To: peter.wang@mediatek.com
Cc: stanley.chu@mediatek.com, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
	jejb@linux.ibm.com, wsd_upstream@mediatek.com, 
	linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com, 
	alice.chao@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com, 
	jiajie.hao@mediatek.com, powen.kao@mediatek.com, qilin.tan@mediatek.com, 
	lin.gui@mediatek.com, tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, 
	naomi.chu@mediatek.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_223422_041284_13F67C28 
X-CRM114-Status: GOOD (  17.21  )
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

Hi Peter,

Please update the patch version and bring all tags (review, ack
...etc.) to your new patch : )

On Thu, Dec 8, 2022 at 2:17 PM <peter.wang@mediatek.com> wrote:
>
> From: Peter Wang <peter.wang@mediatek.com>
>
> When SSU/enter hibern8 fail in wlun suspend flow, trigger error
> handler and return busy to break the suspend.
> If not, wlun runtime pm status become error and the consumer will
> stuck in runtime suspend status.
>
> Fixes: b294ff3e3449 ("scsi: ufs: core: Enable power management for wlun")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>  drivers/ufs/core/ufshcd.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index b1f59a5fe632..c91d58d1486a 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -106,6 +106,13 @@
>                        16, 4, buf, __len, false);                        =
\
>  } while (0)
>
> +#define ufshcd_force_error_recovery(hba) do {                           =
\
> +       spin_lock_irq(hba->host->host_lock);                            \
> +       hba->force_reset =3D true;                                       =
 \
> +       ufshcd_schedule_eh_work(hba);                                   \
> +       spin_unlock_irq(hba->host->host_lock);                          \
> +} while (0)
> +
>  int ufshcd_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
>                      const char *prefix)
>  {
> @@ -9049,6 +9056,15 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba=
, enum ufs_pm_op pm_op)
>
>                 if (!hba->dev_info.b_rpm_dev_flush_capable) {
>                         ret =3D ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_=
mode);
> +                       if (ret && pm_op !=3D UFS_SHUTDOWN_PM) {
> +                               /*
> +                                * If return err in suspend flow, IO will=
 hang.
> +                                * Trigger error handler and break suspen=
d for
> +                                * error recovery.
> +                                */
> +                               ufshcd_force_error_recovery(hba);
> +                               ret =3D -EBUSY;
> +                       }
>                         if (ret)
>                                 goto enable_scaling;
>                 }
> @@ -9060,6 +9076,15 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba=
, enum ufs_pm_op pm_op)
>          */
>         check_for_bkops =3D !ufshcd_is_ufs_dev_deepsleep(hba);
>         ret =3D ufshcd_link_state_transition(hba, req_link_state, check_f=
or_bkops);
> +       if (ret && pm_op !=3D UFS_SHUTDOWN_PM) {
> +               /*
> +                * If return err in suspend flow, IO will hang.
> +                * Trigger error handler and break suspend for
> +                * error recovery.
> +                */
> +               ufshcd_force_error_recovery(hba);
> +               ret =3D -EBUSY;
> +       }
>         if (ret)
>                 goto set_dev_active;
>
> --
> 2.18.0
>


--=20
Yours truly,

=E6=9C=B1=E5=8E=9F=E9=99=9E (Stanley Chu)

