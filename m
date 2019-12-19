Return-Path: <SRS0=dCaZ=2J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B416C2D0D1
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 18:26:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A8AE24672
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 18:26:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GA9MojLn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njedkY2J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A8AE24672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvfxLeYAmSajb6IPtpIg2MUICwsWBqTXy59Vy7VSlO8=; b=GA9MojLnxYGl51
	tMjrBTm9yX6sXtroYYbmQnB18T8xskEuIUpa9nrw2AwlA/xf2ZFcLpunffmJbL2yM4ycXU3wXbhq2
	WRt4BNre6jm0w19wpMTNeGD8zA2H+NpbDpJhb1LcoRNspKJRlxjwv8gDdYpyGc9KjCbmHLUSjibAw
	1c07SOdWNYzAlxCIwDTM6GgRC6mjshQPUQy9F+Z0ui61rqMMAZAHKPOhHLr/Q8gC0p6jDBve1/iY8
	i8B+fz0TVgjR9s38imT/AJl3ePDUoCINXx/bLO91a81oD6r05FRMP7IPO7G2W/Mag5HvjXmm5p8OR
	UQX0W2Qmvt59CzGw/RHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii0VA-0004DO-Se; Thu, 19 Dec 2019 18:26:20 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii0V8-0004D0-GL; Thu, 19 Dec 2019 18:26:19 +0000
Received: by mail-vs1-xe42.google.com with SMTP id n27so4399398vsa.0;
 Thu, 19 Dec 2019 10:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rFab9TFuVyy0B0hidssVyx0Ip53fX/LaEkCJxLNWYBA=;
 b=njedkY2JO/DXhybGjAgtuJQ3ELQtSyBbr4LtklvedJ40JfEyQUuq/88wWz760rpihi
 +QPs+7JUh2ExfDnz5RJ3yVQD2clbnAeeCYgLgYcuhXKFx/trbXWgVvIHtzuyiEmHwh8U
 umfPvRs60aCXka/6STVBQOfMateoMZaMcaQtstMCwwVW4Qyja8DM8evmAdjcWrmW/WlP
 W1o0SpPgU/y0ughI3pA5oqlSyOSguwQzm/lfh9fgPHYF6ItaxFmzBhBvMX3OCu3Ka2kh
 dDp42dc9BynBuc2KdnyZo+QZ8KUWSZpBqcdXmcy9G/UA52saC7UhjAhmdqSzAG1DVI8c
 SVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rFab9TFuVyy0B0hidssVyx0Ip53fX/LaEkCJxLNWYBA=;
 b=qXkHxmgLN6AgiGBw8Frw/QmWCMXKEpHUe7RJVAULQ64m/TXgb/MOE2GMvdhua07Mcb
 LrQHRhvbZK2+z7BMUTXGInEy/bBEbz2usYXHATAjKQMYJrecYKgB7bZN5tTQs4ScoKfV
 RSaHGHLAotvUtEzm7McsOWcCKN/gqV83BcmPCWKAzU4skZGH+TY6Kgqnt2JdMeMfVUFF
 imEmeJM4/pKp9WKNJPzW0Fx736zXI1Y6FATOJ8vowk5XAZ178X/t5zACz2tY/g8USOZ8
 4zun36qHh3MyAJngF5v7BZ5Zh8Aj6W6LsAwVkZqJYT7fsmogX3aVbRuPFyI0tBtMoq+i
 F8mQ==
X-Gm-Message-State: APjAAAXYY2EjN11Ay4xYcruFa6jTygw82T74/zTfflzF4Y7WVA0rT1hC
 KQllCVvcmSbfc+MYTAwD9ZCpdGVAmZcfjx/R7Jw=
X-Google-Smtp-Source: APXvYqyLPE/PUdXmbPKj8EMXclPSXyJgYJpxajEIC9HQ1RfZo8Iy2l7Mc313mPx7rnQ5LEzufff/eY7Ua8VC1PyZ+ag=
X-Received: by 2002:a67:fb14:: with SMTP id d20mr5904491vsr.136.1576779977603; 
 Thu, 19 Dec 2019 10:26:17 -0800 (PST)
MIME-Version: 1.0
References: <1576224695-22657-1-git-send-email-stanley.chu@mediatek.com>
 <1576224695-22657-4-git-send-email-stanley.chu@mediatek.com>
In-Reply-To: <1576224695-22657-4-git-send-email-stanley.chu@mediatek.com>
From: Alim Akhtar <alim.akhtar@gmail.com>
Date: Thu, 19 Dec 2019 23:55:41 +0530
Message-ID: <CAGOxZ50orn8JYxvCv4S6ziMdnB6+BG0DSdkand=x9Vw3H-Dejw@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] scsi: ufs-mediatek: configure customized
 auto-hibern8 timer
To: Stanley Chu <stanley.chu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_102618_564677_268C8FD3 
X-CRM114-Status: GOOD (  12.90  )
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

On Fri, Dec 13, 2019 at 3:04 PM Stanley Chu <stanley.chu@mediatek.com> wrote:
>
> Configure customized auto-hibern8 timer in MediaTek Chipsets.
>
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/scsi/ufs/ufs-mediatek.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
> index 690483c78212..71e2e0e4ea11 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -7,6 +7,7 @@
>   */
>
>  #include <linux/arm-smccc.h>
> +#include <linux/bitfield.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/phy/phy.h>
> @@ -300,6 +301,13 @@ static int ufs_mtk_post_link(struct ufs_hba *hba)
>         /* enable unipro clock gating feature */
>         ufs_mtk_cfg_unipro_cg(hba, true);
>
> +       /* configure auto-hibern8 timer to 10ms */
> +       if (ufshcd_is_auto_hibern8_supported(hba)) {
> +               ufshcd_auto_hibern8_update(hba,
> +                       FIELD_PREP(UFSHCI_AHIBERN8_TIMER_MASK, 10) |
> +                       FIELD_PREP(UFSHCI_AHIBERN8_SCALE_MASK, 3));
> +       }
> +
>         return 0;
>  }
>
> --
> 2.18.0



-- 
Regards,
Alim

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
