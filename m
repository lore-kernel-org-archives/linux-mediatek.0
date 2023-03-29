Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBCFC76196
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 01:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+bl2jOqAxhapHDrn1yb1EQ5+zvuHUKPCi6FQtw5dMg=; b=ySdHssysOccczLwmVZwBsa8EMR
	66tpAoH8dY92KvnCJRVGB5H6tBQelDjMK88jCWEKqwJ6mxYyp2KpYVTvuVGr/bq6SvNOICQ3+XqOc
	DNlti8apvMmExRG5Q+tRAuYsktRNmaDMI/1RcgJpVP1mccaR3o77OPEKlXyvh0u78kxqdVuFiUYV+
	vSt/YfZIl2rZ1Z5XQ2F7rJV94qb0IloE8EEUyaFEoFGOoIUMPlkVxVfXKeDphF9EM/CAcfsymvbc1
	m3Ww4MOV76yJoEtv8eH8LM30AIJLcERnTUFdZkAxuRnvP+YocpJdBnlYsFTgLE52azCg6tRSBip9q
	rWvgexzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phKgA-00GHEi-34;
	Wed, 29 Mar 2023 01:32:46 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phKg7-00GHD9-0W;
	Wed, 29 Mar 2023 01:32:44 +0000
Received: by mail-lf1-x12c.google.com with SMTP id x17so18194324lfu.5;
        Tue, 28 Mar 2023 18:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680053560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+bl2jOqAxhapHDrn1yb1EQ5+zvuHUKPCi6FQtw5dMg=;
        b=YA40+Qhla2B04rSM3SnBmkaxakoM4INVok5CAbJ2EXY+z3ICXnU1c1M5qRym2sQrDF
         TIFApfhL0AXhR+DabzE0zHoX8Pl+gJgkm7oyeLFnB7r1RPULHEgeZJGggPw2tQVqN/tI
         9AZOiYQQOxkG0CwdxnN98dCVMdc9cRTGg4bfysvN6ScLDZfHrSYbkEPior8lH7dfPsEH
         tceSvz5H9IzTvM0F/NBRJsZeNTI+Gu9PqcYxgiGPqxteD1znbtt7nw3amlen0ImgV+OT
         gbpk2dblyx422jTvGFbM9ZlhDJ9ddrOJfT1/mqVFav/7o/IHMl/87+mgbsgDCXF16lMJ
         KtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680053560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+bl2jOqAxhapHDrn1yb1EQ5+zvuHUKPCi6FQtw5dMg=;
        b=A7UTrfeuaWzGumy5K852mLwTkZdtMcVEhnMIrZRvBhiVFXga25cuM9MnLKSlVdXdJW
         K1pXJpFGLR2e4+EEPHrSPEvtLVXiMU4NcwFVjfdh/pBslb7QABwEjl0N21K7yfcQNbil
         2q1eawKA5+jzxku4gls5tKKghygbX3WiS1QcImcj3TIvLfsuhVNR/lYmzKHeALkuMQwe
         rAvKUZkrXjyhknlUY0bwIHtHPKQF2NPUwnXQfSeLR1Jsp6vbwaXA0GpwpRr1uRMVU8+M
         u2skmkAQHrZurb1q98tMnzRBcizgaigIYrjM9WjKsn+P6kkBm0tRByOc+JzivQmDY3ed
         FEzg==
X-Gm-Message-State: AAQBX9c/zdGx2KKGcuLPf9+OtRoa+t1cCs5dE+OhFiPPUFYqqAGTO65t
	UldojOnSt3AmFWUMI2x98Stv7v1wjZx5N1oliA==
X-Google-Smtp-Source: AKy350ZJ9jIcLlIPvnGyeqDurFEL4h5eLrfQa1R7Mv2CsUszEPgG4iU/d/cmPNe4aFnJMdQZM7nB7di2+4aaCIXKVyc=
X-Received: by 2002:a05:6512:159e:b0:4e8:4409:bb76 with SMTP id
 bp30-20020a056512159e00b004e84409bb76mr309412lfb.2.1680053559678; Tue, 28 Mar
 2023 18:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230328103801.11198-1-powen.kao@mediatek.com> <20230328103801.11198-2-powen.kao@mediatek.com>
In-Reply-To: <20230328103801.11198-2-powen.kao@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Wed, 29 Mar 2023 09:32:28 +0800
Message-ID: <CAGaU9a8f37ZyMjVyYnonNCro55UQJ033Ns+LoaOcWDUg3Gp=3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] scsi: ufs: ufs-mediatek: Add UFSHCD_QUIRK_MCQ_BROKEN_INTR
 quirk
To: Po-Wen Kao <powen.kao@mediatek.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Stanley Chu <stanley.chu@mediatek.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream@mediatek.com, 
	peter.wang@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com, 
	chun-hung.wu@mediatek.com, cc.chou@mediatek.com, eddie.huang@mediatek.com, 
	mason.zhang@mediatek.com, chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_183243_201231_D49687E4 
X-CRM114-Status: GOOD (  14.01  )
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

On Tue, Mar 28, 2023 at 6:42=E2=80=AFPM Po-Wen Kao <powen.kao@mediatek.com>=
 wrote:
>
> Set UFSHCD_QUIRK_MCQ_BROKEN_INTR for mtk driver
>
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
> ---
>  drivers/ufs/host/ufs-mediatek.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-media=
tek.c
> index 73e217260390..b4a4a580ad37 100644
> --- a/drivers/ufs/host/ufs-mediatek.c
> +++ b/drivers/ufs/host/ufs-mediatek.c
> @@ -901,6 +901,8 @@ static int ufs_mtk_init(struct ufs_hba *hba)
>         hba->caps |=3D UFSHCD_CAP_CLK_SCALING;
>
>         hba->quirks |=3D UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL;
> +       hba->quirks |=3D UFSHCD_QUIRK_MCQ_BROKEN_INTR;
> +
>         hba->vps->wb_flush_threshold =3D UFS_WB_BUF_REMAIN_PERCENT(80);
>
>         if (host->caps & UFS_MTK_CAP_DISABLE_AH8)
> --
> 2.18.0
>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

