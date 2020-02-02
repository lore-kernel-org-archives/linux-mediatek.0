Return-Path: <SRS0=HncU=3W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400E0C35249
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Feb 2020 14:39:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1407320679
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Feb 2020 14:39:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c2LbyqhQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uj3RBFmf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1407320679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8s0xdYbmamNFMscn289vHo5ztV+8a46wjYe2jQVgG0E=; b=c2LbyqhQYoxX4M
	yDIy6dM6Oov+xJncH+UJeqayELvH45vHLsxxoFMu+NS4LIZcAHNCR78G6KWMXw6JPBEGwH/oIOWTO
	csiB1zZwmcDjWMKrBPtHrC0IuPtJ2E+3KUbdKRGs+hRMDDyc5ipeq72kKjagwQZ3GUcwD8KEtCg2x
	SHMNkdWHuLAyqezZscpYu/18xp4FlRidR+vBn+nkT/l0i+VeuU+hUmRgtLvnnKDRrT5wAa1KoDAH3
	EBQfQAsQDBEgJ5lSNRx+1eodKqVt9KbuUSBXwaIHUHHTgZu3Vvp7u/jLVTOeuBmAm4wRWRYUu69va
	l9COB/maNiiIJzG1vorg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyGPM-0003Co-Q5; Sun, 02 Feb 2020 14:39:32 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyGPJ-0003CC-Qx; Sun, 02 Feb 2020 14:39:31 +0000
Received: by mail-vs1-xe41.google.com with SMTP id b79so7294902vsd.9;
 Sun, 02 Feb 2020 06:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F3Dg6x9hnD70y5KWc5Dl2R5pAeERtj8ATYaWnvKE23s=;
 b=Uj3RBFmff7CUg/JT7/qkMO1/Go8IME3xKzS0206G+MAG/MGh5yWGd9Rv1i5Vv9Jlx2
 WnB9pXZhcl8mRzk0o6Wbn0MDVYJpu9dgg6/TL+yni2fNUn1oMIDlp6JkYfDJKN77Z+RV
 /NRaJkxTSnGpigWW+eQtCUUxp+kc0ySTyut4D8TH0krIQfcrjppCZSgJ+CbGQiPmc59k
 WxymGpppwUH/uFFXBOMB5nsQpMiDaynKT+yJNNeHLc3uBJFhXAKWiIQZneBN/1hsbtoO
 Sl+uPEcpGOHILNrn6siLX42quB5zq59tO2DE7HCLuZAzNJfdLM6uvm7rItCcilb/vMaY
 0RJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F3Dg6x9hnD70y5KWc5Dl2R5pAeERtj8ATYaWnvKE23s=;
 b=aurSN8Cdycvdn8eVgcnrqkuqX/8DAC1RBzBiUKKhMi8BxahByxRQPz+NEzxNkFFJXe
 YKGoPtdCfqnJaX4PtAM0mpXsRRD7Lv/m5xVN0YA7B7iTHCNe/IniYT7OBZ/kXHrkcwq+
 FgSpZUTYvSexe5sFr/TnB8IDeGc3TDDOhbXTTEbOwW16boHuioPy+D9VsxuRPlukKKll
 wFjEXmB4XM6hH2r09u4Nl4mlsrQQ76xsuSQVM0ljHYqh41sX8+lkAd7wyfXLtt4QdBrv
 IEfXNEO90z01r+dQPM2dSBJ6EpSKOlcPYX9uEB49gcVD7JNev4hjS1qFeu2eaKlun8ea
 Lagg==
X-Gm-Message-State: APjAAAXksW5HK9LMoDBJQ1jBxlE55jsE/+FE9bxiJy1HILrGS6nbYcvi
 c0haD1KNWBFVGpP9+JbhjSQ4va+JCoAkOmv7EIE=
X-Google-Smtp-Source: APXvYqw6zgyNgIA2W7l7G+72km62tYoznEG8yQuAPP40j+jTysNsnG/FBCpj6ZCZhRFETBUC23O1GURk7wjvrmianrw=
X-Received: by 2002:a67:10c1:: with SMTP id 184mr11097055vsq.76.1580654368977; 
 Sun, 02 Feb 2020 06:39:28 -0800 (PST)
MIME-Version: 1.0
References: <20200129105251.12466-1-stanley.chu@mediatek.com>
In-Reply-To: <20200129105251.12466-1-stanley.chu@mediatek.com>
From: Alim Akhtar <alim.akhtar@gmail.com>
Date: Sun, 2 Feb 2020 20:08:52 +0530
Message-ID: <CAGOxZ53r7O2PbOTXAs4y9diE_Hc-yj0Q-keHLp00HUwMzjbSag@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 0/4] MediaTek UFS vendor implemenation part III
 and Auto-Hibern8 fix
To: Stanley Chu <stanley.chu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200202_063929_890734_E41686CA 
X-CRM114-Status: GOOD (  11.60  )
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

hello Stanley

On Wed, Jan 29, 2020 at 4:24 PM Stanley Chu <stanley.chu@mediatek.com> wrote:
>
> Hi,
>
> This series provides MediaTek vendor implementations and some general fixes.
>
> - General fixes
>         - Fix Auto-Hibern8 error detection
>
> - MediaTek vendor implementations
>         - Ensure UniPro is powered on before every link startup
>         - Support linkoff state during suspend
>         - Gate reference clock for Auto-Hibern8 case
>
> v3 (Resend)
>         - Fix "Fixes" tag in patch "scsi: ufs: fix Auto-Hibern8 error detection" (Greg KH)
>
> v2 -> v3
>         - Squash below patches to a single patch (Bean Huo)
>                 - scsi: ufs: add ufshcd_is_auto_hibern8_enabled facility
>                 - scsi: ufs: fix auto-hibern8 error detection
>         - Add Fixes tag in patch "scsi: ufs: fix Auto-Hibern8 error detection" (Bean Huo)
>         - Rename VS_LINK_HIBER8 to VS_LINK_HIBERN8 in patch "scsi: ufs-mediatek: gate ref-clk during Auto-Hibern8"
>
> v1 -> v2
>         - Fix and refine commit messages.
>
> Stanley Chu (4):
>   scsi: ufs-mediatek: ensure UniPro is not powered down before linkup
>   scsi: ufs-mediatek: support linkoff state during suspend
>   scsi: ufs: fix Auto-Hibern8 error detection
>   scsi: ufs-mediatek: gate ref-clk during Auto-Hibern8
>
For this series, feel free to add
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

Thanks

>  drivers/scsi/ufs/ufs-mediatek.c | 67 +++++++++++++++++++++------------
>  drivers/scsi/ufs/ufs-mediatek.h | 12 ++++++
>  drivers/scsi/ufs/ufshcd.c       |  3 +-
>  drivers/scsi/ufs/ufshcd.h       |  6 +++
>  4 files changed, 63 insertions(+), 25 deletions(-)
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
