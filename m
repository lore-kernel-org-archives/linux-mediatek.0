Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C421C77B7E
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 07:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wvv/hBwHmGpvqxO3rQDcjva4ryRFVTLpzb5zW5Sqmx8=; b=AcLrSasqhNuCqZaYzmsss1tvbs
	aJFHz5Gnli+wgCHIEb8Vjw5b0IdmBslEqV4iEZIfsf3JFeSIO13EA8rzGeZI9kbJfqQr0Ji0I+nRE
	QSNF9mVd7iRszRLIGNrR0y2p20LIct0J0NWk2ygqp/Ofd79lbm0VF4UKQRJS6nYqIXTQtE2znoa6g
	+l6Z2GtXHY49xe04ca06DlZo5vqeoKCJXJGq+AsuOYgQhuSwoWrF0TSJnkQjitTqPdwvOLc+vJVst
	VzDLlyAevbElElKAxNXHLQX4QSMWnIfzLUAxiCGYw0ncsiRKuecZIqPW3Da1zyvTClfDM7Y808CbD
	vLK2N5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptkY4-000URp-2o;
	Tue, 02 May 2023 07:35:44 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptkY1-000UQO-0m;
	Tue, 02 May 2023 07:35:42 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2a8aea2a654so33027441fa.1;
        Tue, 02 May 2023 00:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683012938; x=1685604938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wvv/hBwHmGpvqxO3rQDcjva4ryRFVTLpzb5zW5Sqmx8=;
        b=FGYEylr802NA6MTpdomm9Hftyvl+iDvM04PAu5BCQ59yI97GUTmORAQmdcMDeCDxTS
         o6eURyXC9cHCn+zwsP2nBJjGuhFiJGDN8knAiOPN+luqD25+z+8DEimQCE0PwzpZ2Oup
         7130IR5wx+Evw9fABnCWM+tIiPshztoqCHBn544aoYVsOD6k7F1/TE4UUjdIj/IGk/N2
         EyYwHliO/jkqQRw3w9Ov+LqUDPhI894BvHxK1aKeySBdigVtA0m48r5+swd5rBWsxGbR
         en61vC7TxKgBGNcLYKehjNKqlduG5UsygK1WyCA8JmFnnKgQ4CStiEgHb9NbMZIZObTc
         S3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683012938; x=1685604938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wvv/hBwHmGpvqxO3rQDcjva4ryRFVTLpzb5zW5Sqmx8=;
        b=HaM4H33By6SHgHBqK234ZyWNLF7nC1V8IoR+3ShWHkRLK9IWRmU+dCuiPvXEDRqA4e
         EiN/WCdyCoJyLWmJKrFgI1upZtc+76+ixdCLQ3xu0lqVe7rijriKwvVQOswLlfqLS3O8
         4NcgB3GF91o9oBW7IbDYi22bb2JXS0etx2LygLweBUxng2a+5MXvHHrege18ULAAobxy
         0ptw83Nm+1jdJgjkh055tbF/q/FEWIJRdS9iRXg8KrErftSnkKE1l1c62nY/si+qVYdb
         giewBNGyW8WEEtCO/4l7K5b4badTRyfgl/FJQqQlae0tZqzHsScCZMJhkax4VzkJRolI
         Wyeg==
X-Gm-Message-State: AC+VfDxJIhY/thOQXt/hk1HRZSZHB+GSiAtXDztwEfQva1b5JLfEh7CL
	WDNBbyJeWcFy2AgcSgkveQJEqKVExd7W6PReaw==
X-Google-Smtp-Source: ACHHUZ754sEATk1u8vUKBryFLLWAYu4arHBctSmd0C0Y352aDzqYtnJ0KlDtB2OPQuyahMtxy6awD4KLzSZtG6KW6eo=
X-Received: by 2002:ac2:52aa:0:b0:4ef:f088:f0e6 with SMTP id
 r10-20020ac252aa000000b004eff088f0e6mr4850445lfm.57.1683012937578; Tue, 02
 May 2023 00:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230424140839.22358-1-powen.kao@mediatek.com> <20230424140839.22358-2-powen.kao@mediatek.com>
In-Reply-To: <20230424140839.22358-2-powen.kao@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Tue, 2 May 2023 15:35:25 +0800
Message-ID: <CAGaU9a8mSx1Da5rnXDm9pc-yc8BQOrjc5KMXjotcaDdKDTXwuQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] scsi: ufs: core: Fix mcq tag calcualtion
To: Po-Wen Kao <powen.kao@mediatek.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream@mediatek.com, 
	peter.wang@mediatek.com, stanley.chu@mediatek.com, alice.chao@mediatek.com, 
	naomi.chu@mediatek.com, chun-hung.wu@mediatek.com, cc.chou@mediatek.com, 
	eddie.huang@mediatek.com, mason.zhang@mediatek.com, 
	chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_003541_281099_A72E0D59 
X-CRM114-Status: GOOD (  15.92  )
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

Hi Po-Wen,

Po-Wen Kao <powen.kao@mediatek.com> =E6=96=BC 2023=E5=B9=B44=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:13=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Transfer command descriptor is allocated in ufshcd_memory_alloc()
> and referenced by transfer request descriptor with stride size
> sizeof_utp_transfer_cmd_desc()
> instead of
> sizeof(struct utp_transfer_cmd_desc).
>
> Consequently, computing tag by address offset should also refer to the
> same stride.
>
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
> Reviewed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> ---
>  drivers/ufs/core/ufs-mcq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 31df052fbc41..3a27fa4b0024 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -265,7 +265,7 @@ static int ufshcd_mcq_get_tag(struct ufs_hba *hba,
>         addr =3D (le64_to_cpu(cqe->command_desc_base_addr) & CQE_UCD_BA) =
-
>                 hba->ucdl_dma_addr;
>
> -       return div_u64(addr, sizeof(struct utp_transfer_cmd_desc));
> +       return div_u64(addr, sizeof_utp_transfer_cmd_desc(hba));

Would you also need to consider the ufshcd_release_sdb_queue() case?

Thanks.
Stanley Chu

