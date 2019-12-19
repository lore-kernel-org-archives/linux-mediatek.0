Return-Path: <SRS0=dCaZ=2J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7764BC2D0D1
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 18:18:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43611227BF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 18:18:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CaXn0sMH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCS54bJd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43611227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fwe99gq4TzYjnC6siggugOYdwXUoDyAeSzpb3A5Oezg=; b=CaXn0sMH9k/GEw
	e7DLBOVI3aS2TRZNfSjZUw1V99ltKDoxPV0mi1lKuia9/TtQaE2cu9CZnABDHFN9oTui+Vob1Y56b
	OKiObhixMez9bFy7sknlcM36S2hP+5zi/3ytTXidKGjuVGWjm7fTE9qPC4k3au1L/xJ8BDH94VxcF
	skj5zOU6rsAFMaYkmF+VRyuyFsPNtbvcFmUEpFnVcVDkd/H8pSL5w4Pvo/RzT5Jw9ArAFvB6aOvK3
	rbpdV8AbDjt3Me5SjXWBsrQ8niJmTUFwSaRbDTUrOnWI6tQCuvNLQaF7j7w/pslEbZSAej2Hlw5AC
	RY7vTLbJG8kEXYTeYXzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii0Ni-0007ZA-OE; Thu, 19 Dec 2019 18:18:38 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii0Ng-0007Yg-Ni; Thu, 19 Dec 2019 18:18:38 +0000
Received: by mail-vs1-xe42.google.com with SMTP id v12so4360340vsv.5;
 Thu, 19 Dec 2019 10:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hdfl3j3PUu29KvhFJr+t8q9A7l1fLtUS6dfELY8PVLE=;
 b=tCS54bJd6f3428WApblIOzLQvg9gXUk1ry2iLEcNoz5mn+Ev/It5H2F9ixzC8H3L7O
 gy0IKkXEef1q6L0ksBFGDnOsjR/d7EBCW93dzLdMYSzBycxQDu5ezgzhvuFSzH3C8Lm/
 JlAmLHyjT024P+gfLHAh9AEPlaXfFD3YP4yLDycw9CpwqSePfClSIox4XVdEvj5Nr5Bn
 FjVC6LL8OR3gYVOQ86fmVwGRCASN1MYtioAty36QxsKkpWaLkkDWk5onwgp+d+6B+dOw
 +x6EdoeRB0BmdvaglW+aUzVAef6OztV1h6RgZVussRPpI7Udtcb9/edVA/g/XEvrPZnk
 C5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hdfl3j3PUu29KvhFJr+t8q9A7l1fLtUS6dfELY8PVLE=;
 b=UQ98q2lnx5Djit4gC4xDnOo8qAAhGsesKlxhKfX+nRP+Gguca9iCVvjmYtDaS+pARf
 6PC0EDu9Qx4miOAG27gikPRZAA+Yh1RyyJMzpd8XWayr/sh7tWanb8zTYsaj366ODkdf
 /lw1ifG0fMRtfFqDtf7C09hTkxMU0TnK9cl2d3M7hr9QuwtHSaczlJ7GBh1esgFTrJ/6
 J/6uTqh3fN3h1SAAAxwEqki+8u5d/1LFZbMDGAzHK+LugELFChJQFMW1bpkQcD0G4Ns+
 NPt64XLkKhjZ/L+zXe5yKWCMiBzy2Y5MOCQ+jg8w8bUacYH5a/h/3EGh7me06UJzMnNg
 n+bw==
X-Gm-Message-State: APjAAAWQIjK71H/a3uGOumsBepVA0oLxr+qVRPdAPsjEFORGkzVFm/tR
 1I+v9AXrF6kGi0DNmC1WiHx0v6RnPq3/dGbwAb0=
X-Google-Smtp-Source: APXvYqx2+nDxq2ixPv2h29IpGt0iubjleAq9aMOGE+An5nayL0a+8XISERr+3e5yfQuKP1zTRewKys0Qg4k4OKGNcqU=
X-Received: by 2002:a05:6102:204a:: with SMTP id
 q10mr6222578vsr.127.1576779515189; 
 Thu, 19 Dec 2019 10:18:35 -0800 (PST)
MIME-Version: 1.0
References: <1576224695-22657-1-git-send-email-stanley.chu@mediatek.com>
 <1576224695-22657-2-git-send-email-stanley.chu@mediatek.com>
In-Reply-To: <1576224695-22657-2-git-send-email-stanley.chu@mediatek.com>
From: Alim Akhtar <alim.akhtar@gmail.com>
Date: Thu, 19 Dec 2019 23:47:59 +0530
Message-ID: <CAGOxZ539Fr5Vxg8Zg=LpYhxTacwh81Ee+S9MWFybwbAPr5RgYQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] scsi: ufs-mediatek: introduce reference clock
 control
To: Stanley Chu <stanley.chu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_101836_775124_B0A568DC 
X-CRM114-Status: GOOD (  18.37  )
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
 Pedro Sousa <pedrom.sousa@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 13, 2019 at 2:23 PM Stanley Chu <stanley.chu@mediatek.com> wrote:
>
> Introduce reference clock control in MediaTek Chipset in order
> to disable it if it is not necessary by UFS device to save system power.
>
> Currently reference clock can be disabled during system suspend, runtime
> suspend and clock-gating after link enters hibernate state.
>
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

> ---
>  drivers/scsi/ufs/ufs-mediatek.c | 64 ++++++++++++++++++++++++++++++---
>  drivers/scsi/ufs/ufs-mediatek.h | 20 +++++++++--
>  2 files changed, 78 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> index 6a3ec11b16db..690483c78212 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -18,6 +18,11 @@
>  #include "unipro.h"
>  #include "ufs-mediatek.h"
>
> +#define ufs_mtk_ref_clk_notify(on, res) \
> +       arm_smccc_smc(MTK_SIP_UFS_CONTROL, \
> +                     UFS_MTK_SIP_REF_CLK_NOTIFICATION, \
> +                     on, 0, 0, 0, 0, 0, &(res))
> +
>  static void ufs_mtk_cfg_unipro_cg(struct ufs_hba *hba, bool enable)
>  {
>         u32 tmp;
> @@ -83,6 +88,49 @@ static int ufs_mtk_bind_mphy(struct ufs_hba *hba)
>         return err;
>  }
>
> +static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
> +{
> +       struct ufs_mtk_host *host = ufshcd_get_variant(hba);
> +       struct arm_smccc_res res;
> +       unsigned long timeout;
> +       u32 value;
> +
> +       if (host->ref_clk_enabled == on)
> +               return 0;
> +
> +       if (on) {
> +               ufs_mtk_ref_clk_notify(on, res);
> +               ufshcd_writel(hba, REFCLK_REQUEST, REG_UFS_REFCLK_CTRL);
> +       } else {
> +               ufshcd_writel(hba, REFCLK_RELEASE, REG_UFS_REFCLK_CTRL);
> +       }
> +
> +       /* Wait for ack */
> +       timeout = jiffies + msecs_to_jiffies(REFCLK_REQ_TIMEOUT_MS);
> +       do {
> +               value = ufshcd_readl(hba, REG_UFS_REFCLK_CTRL);
> +
> +               /* Wait until ack bit equals to req bit */
> +               if (((value & REFCLK_ACK) >> 1) == (value & REFCLK_REQUEST))
> +                       goto out;
> +
> +               usleep_range(100, 200);
> +       } while (time_before(jiffies, timeout));
> +
> +       dev_err(hba->dev, "missing ack of refclk req, reg: 0x%x\n", value);
> +
> +       ufs_mtk_ref_clk_notify(host->ref_clk_enabled, res);
> +
> +       return -ETIMEDOUT;
> +
> +out:
> +       host->ref_clk_enabled = on;
> +       if (!on)
> +               ufs_mtk_ref_clk_notify(on, res);
> +
> +       return 0;
> +}
> +
>  /**
>   * ufs_mtk_setup_clocks - enables/disable clocks
>   * @hba: host controller instance
> @@ -107,12 +155,16 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
>
>         switch (status) {
>         case PRE_CHANGE:
> -               if (!on)
> +               if (!on) {
> +                       ufs_mtk_setup_ref_clk(hba, on);
>                         ret = phy_power_off(host->mphy);
> +               }
>                 break;
>         case POST_CHANGE:
> -               if (on)
> +               if (on) {
>                         ret = phy_power_on(host->mphy);
> +                       ufs_mtk_setup_ref_clk(hba, on);
> +               }
>                 break;
>         }
>
> @@ -299,8 +351,10 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  {
>         struct ufs_mtk_host *host = ufshcd_get_variant(hba);
>
> -       if (ufshcd_is_link_hibern8(hba))
> +       if (ufshcd_is_link_hibern8(hba)) {
>                 phy_power_off(host->mphy);
> +               ufs_mtk_setup_ref_clk(hba, false);
> +       }
>
>         return 0;
>  }
> @@ -309,8 +363,10 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  {
>         struct ufs_mtk_host *host = ufshcd_get_variant(hba);
>
> -       if (ufshcd_is_link_hibern8(hba))
> +       if (ufshcd_is_link_hibern8(hba)) {
> +               ufs_mtk_setup_ref_clk(hba, true);
>                 phy_power_on(host->mphy);
> +       }
>
>         return 0;
>  }
> diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
> index b03f601d3a9e..14f8a8357c09 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.h
> +++ b/drivers/scsi/ufs/ufs-mediatek.h
> @@ -6,7 +6,21 @@
>  #ifndef _UFS_MEDIATEK_H
>  #define _UFS_MEDIATEK_H
>
> -#include <linux/bitops.h>
> +/*
> + * Vendor specific UFSHCI Registers
> + */
> +#define REG_UFS_REFCLK_CTRL         0x144
> +
> +/*
> + * Ref-clk control
> + *
> + * Values for register REG_UFS_REFCLK_CTRL
> + */
> +#define REFCLK_RELEASE              0x0
> +#define REFCLK_REQUEST              BIT(0)
> +#define REFCLK_ACK                  BIT(1)
> +
> +#define REFCLK_REQ_TIMEOUT_MS       3
>
>  /*
>   * Vendor specific pre-defined parameters
> @@ -34,7 +48,8 @@
>  /*
>   * SiP commands
>   */
> -#define UFS_MTK_SIP_DEVICE_RESET    BIT(1)
> +#define UFS_MTK_SIP_DEVICE_RESET          BIT(1)
> +#define UFS_MTK_SIP_REF_CLK_NOTIFICATION  BIT(3)
>
>  /*
>   * VS_DEBUGCLOCKENABLE
> @@ -55,6 +70,7 @@ enum {
>  struct ufs_mtk_host {
>         struct ufs_hba *hba;
>         struct phy *mphy;
> +       bool ref_clk_enabled;
>  };
>
>  #endif /* !_UFS_MEDIATEK_H */
> --
> 2.18.0



-- 
Regards,
Alim

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
