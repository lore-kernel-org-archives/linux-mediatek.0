Return-Path: <SRS0=HncU=3W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05ADC3524C
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Feb 2020 14:37:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8701520679
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Feb 2020 14:37:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UOODo2jg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIVyqfkm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8701520679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qwtTlZYUGdsib6kO/Jvn1tvkSTlRztWPubew5IxfTJI=; b=UOODo2jgeoB5WV
	7LTu8sOqqICvkmq2+SFqVHLzjI19QtOCk7lREcf1xviqP9Px3FzgRqzyErdIXNPQBArYQbc+BdVMB
	3b6013n3xdv6CmyAicjcUADobMILWTrePumjINOMs48EUcahxlcdOz+PCir0whMY2izxAXEbEjh4x
	Qeh8VKAuzWn48sSybw+155OOwCWcbreDu7XMNTXp33aunLjL3O919Zm/wUU/PaVfUnILUq/jaujCi
	Rdw2+R30riWDNf27rEngGgOxmi9Uc+mKjs7D6y11iqtEp/VOLAc1RO+JvzZVyXQMcI0v63GHMZTvT
	IH953sxaSpC3/swx/Zeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyGN5-0002sn-Pu; Sun, 02 Feb 2020 14:37:11 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyGN3-0002sJ-JF; Sun, 02 Feb 2020 14:37:10 +0000
Received: by mail-ua1-x944.google.com with SMTP id g13so953898uab.7;
 Sun, 02 Feb 2020 06:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ih4Pj7LjGlqiueuD3OMdD/Ubng6cDHlRXAZYVnlfnn8=;
 b=CIVyqfkmn/pL+mv/Mec0ynNmwkLzpZOKb3nQ5xFudSemA+Gw5ekljtq6uQQ5siajF+
 nmC0DRQb6XGmv33YtbbsH4QzxWt9lXnMXAA6SRxK2WtydG4QxN0bzkrNGf2dKUWhT/rd
 jlWdKpKjuSiaeeeVpUj4fKrt88pUVVE06Msnf/BDPb1s3Av6VW4DDBKSAqnzwimwjvPP
 F7GhqRZXiCXpGOuYhW/0l8CY9xE36zvRsQtjviFByKEawdJvbdh25wxsnU7VyXJGwlxL
 SE2XUMmkq8IofSSfWsqsBWjs0LKJRxD+1VbVISBWFxNyme+y8CTiM/f6/tJICwfq9+y3
 a6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ih4Pj7LjGlqiueuD3OMdD/Ubng6cDHlRXAZYVnlfnn8=;
 b=PI7JRKbwAnHImP2sYtNNAHez47jEWjPJyfME6aiEx+MDvk5xPBYgyneHGxyiC0HcfJ
 K4kaf+5see/EzxQZegIIslNBlEl/yW/fycCAvxb8vN0smkgrzs3mKLdyvs3FwEVS8IMl
 S/DDbmBOGHCyAyavqxUoZeRYd17Ghi/DNU84OnQPigDf2W7mMPvFmVszpgWbVp90aZ+l
 co63vCUJFdwUK8MTsu+8K8hJbphJEcFiBycfwsoEhZrqmBXCirU6h4cfKuCraqmr92LK
 rGxze0Ch7Fkp3c/zFKnQZwFdyHWBfsZepSfWtHRJEB7Ldj/BTpsS2bj8nj/fM1Vfphjb
 dS2Q==
X-Gm-Message-State: APjAAAVwfQ6CiVE9013bMlbc0NAsQaE6I1jR+KZvAGBGgVVdLkE/T0e4
 poO8LG9bFA9kVeEZBPiSJL0mW1iW+P4SzYED3zg=
X-Google-Smtp-Source: APXvYqzRU5AR6Q1KzIz1EqIEz3VEXTxT65lb27mSl+ah6Nwo+0NacBNcvtSRyN8NMgiJb56Zi3AJ6vcKtpWkEZ0pmrU=
X-Received: by 2002:ab0:2881:: with SMTP id s1mr11115054uap.95.1580654228212; 
 Sun, 02 Feb 2020 06:37:08 -0800 (PST)
MIME-Version: 1.0
References: <20200129073902.5786-1-stanley.chu@mediatek.com>
 <20200129073902.5786-5-stanley.chu@mediatek.com>
In-Reply-To: <20200129073902.5786-5-stanley.chu@mediatek.com>
From: Alim Akhtar <alim.akhtar@gmail.com>
Date: Sun, 2 Feb 2020 20:06:32 +0530
Message-ID: <CAGOxZ51FwULV_XpZAWMOMd0Qn8dqv8Ea7koLmPrtn3HxU8fJuQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] scsi: ufs-mediatek: gate ref-clk during
 Auto-Hibern8
To: Stanley Chu <stanley.chu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200202_063709_631719_1DB3D350 
X-CRM114-Status: GOOD (  18.32  )
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
 Can Guo <cang@codeaurora.org>, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, asutoshd@codeaurora.org,
 Bart Van Assche <bvanassche@acm.org>, linux-arm-kernel@lists.infradead.org,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Stanley

On Wed, Jan 29, 2020 at 1:10 PM Stanley Chu <stanley.chu@mediatek.com> wrote:
>
> In current UFS driver design, hba->uic_link_state will not
> be changed after link enters Hibern8 state by Auto-Hibern8 mechanism.
> In this case, reference clock gating will be skipped unless special
> handling is implemented in vendor's callbacks.
>
> Support reference clock gating during Auto-Hibern8 period in
> MediaTek Chipsets: If link state is already in Hibern8 while
> Auto-Hibern8 feature is enabled, gate reference clock in
> setup_clocks callback.
>
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/scsi/ufs/ufs-mediatek.c | 38 +++++++++++++++++++++++----------
>  drivers/scsi/ufs/ufs-mediatek.h | 12 +++++++++++
>  2 files changed, 39 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> index d78897a14905..0ce08872d671 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -143,6 +143,17 @@ static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
>         return 0;
>  }
>
> +static u32 ufs_mtk_link_get_state(struct ufs_hba *hba)
> +{
> +       u32 val;
> +
> +       ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
> +       val = ufshcd_readl(hba, REG_UFS_PROBE);
> +       val = val >> 28;
> +
> +       return val;
> +}
> +
>  /**
>   * ufs_mtk_setup_clocks - enables/disable clocks
>   * @hba: host controller instance
> @@ -155,7 +166,7 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
>                                 enum ufs_notify_change_status status)
>  {
>         struct ufs_mtk_host *host = ufshcd_get_variant(hba);
> -       int ret = -EINVAL;
> +       int ret = 0;
>
>         /*
>          * In case ufs_mtk_init() is not yet done, simply ignore.
> @@ -165,19 +176,24 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
>         if (!host)
>                 return 0;
>
> -       switch (status) {
> -       case PRE_CHANGE:
> -               if (!on && !ufshcd_is_link_active(hba)) {
> +       if (!on && status == PRE_CHANGE) {
> +               if (!ufshcd_is_link_active(hba)) {
>                         ufs_mtk_setup_ref_clk(hba, on);
>                         ret = phy_power_off(host->mphy);
> +               } else {
> +                       /*
> +                        * Gate ref-clk if link state is in Hibern8
> +                        * triggered by Auto-Hibern8.
> +                        */
> +                       if (!ufshcd_can_hibern8_during_gating(hba) &&
> +                           ufshcd_is_auto_hibern8_enabled(hba) &&
> +                           ufs_mtk_link_get_state(hba) ==
> +                           VS_LINK_HIBERN8)
> +                               ufs_mtk_setup_ref_clk(hba, on);
>                 }
> -               break;
> -       case POST_CHANGE:
> -               if (on) {
> -                       ret = phy_power_on(host->mphy);
> -                       ufs_mtk_setup_ref_clk(hba, on);
> -               }
> -               break;
> +       } else if (on && status == POST_CHANGE) {
> +               ret = phy_power_on(host->mphy);
> +               ufs_mtk_setup_ref_clk(hba, on);
>         }
>
>         return ret;
> diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
> index fccdd979d6fb..492414e5f481 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.h
> +++ b/drivers/scsi/ufs/ufs-mediatek.h
> @@ -53,6 +53,18 @@
>  #define VS_SAVEPOWERCONTROL         0xD0A6
>  #define VS_UNIPROPOWERDOWNCONTROL   0xD0A8
>
> +/*
> + * Vendor specific link state
> + */
> +enum {
> +       VS_LINK_DISABLED            = 0,
> +       VS_LINK_DOWN                = 1,
> +       VS_LINK_UP                  = 2,
> +       VS_LINK_HIBERN8             = 3,
> +       VS_LINK_LOST                = 4,
> +       VS_LINK_CFG                 = 5,
> +};
> +
>  /*
>   * SiP commands
>   */
> --
> 2.18.0



-- 
Regards,
Alim

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
