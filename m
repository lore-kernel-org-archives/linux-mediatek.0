Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E463AC4361B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 14:13:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 930A923A33
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 14:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 930A923A33
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YrUIJq4FZ8Qol5zvZ1JegVmF+kBYU3Ls98mKKddJDks=; b=CzquMkDj4beDGNn4d2VZqdkw6
	/c0707MfTz3Tmf8oHB4Kee8Ix32NvRfAVCTPtRD3LxiRW0m6kNm/CbAe0Y5ohVmJnmtd9Dd7o43l8
	9MO/QJT5e+qc0RWSbcb7Grmwn9nW4WaoHq5kNZTSwHs+LdB2hwrp0xWR6z42hbCgCTu/EyW5CIpL4
	FF1QxfoCEc9QVuhJFocXlylDxe8PMEn8WtrH68hCNvqkcnlCjDqoRar1bE68spE7Po+FustCh9CXq
	bN5Yr/ENMC5TyfjnDj991shU/GspYNNPswx40Xj/1YTYv+3kabdPGX4rncJzndJVQ4QrwHVartmFo
	Vk6BWBlvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmdkU-0004nm-Mv; Tue, 08 Dec 2020 14:13:50 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmdkS-0004mS-M1; Tue, 08 Dec 2020 14:13:49 +0000
Received: by mail-ed1-x542.google.com with SMTP id cw27so17713044edb.5;
 Tue, 08 Dec 2020 06:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eSPfpQbfD8TtnWjYs+6jj8qzhsWODAim1cckJ/MJTu0=;
 b=pMxp4TNM4M+N05Yx9TQgHM79zWQBDbpvpnmuI555O1zxarA53NmboJkgdjPiAvm2rk
 tA5Nxy3pEFTL8n62f5NDpQA2anFbpBzV6UuZnAmMdt23xIg1F4mQWZtvO0Ea4oWZhiqR
 Mk788rhqKcb8Z+qCwERSPi7jnRwjPYRDARTP9lDWSyID9m+1ZcJ8ccjghI6h6AZrh5C3
 2AdQvAAw5BgPumeEHZboIkxXk2yESbZyjnBCrArWoBb7TIKKaC+w3ANmYjV5CD8tdlck
 yGAsthsXggHQnxbc/Why3OhoTu2e/oBSBGMEEPYd2fLqeayYYbcl1HqO0wDamcPNgkdF
 OaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eSPfpQbfD8TtnWjYs+6jj8qzhsWODAim1cckJ/MJTu0=;
 b=IqX9qH++qbhFnYeOQZJ4BciaGHn/gbsXhMhNx7sxds1b2C8Bj/UYq538tWH/LVHx+i
 +vnPurAUVWEWvEjHfOGv0cE9jnmGIodAbbW9o/v9Otnw3wfmphVfVArg+mMRQeKGiU4J
 h8A7iH9DgqMzy3SPTLMAs5gbvLqsBkjBKSemtHC8yKE47w4zbMUktHrigpwyT1sOUm9s
 z8QmbA2EOQwjM/NDG43zWuKGkYYEr2kOWtQn8h5PZrcXPfmjFHoWd5BbdCGpfLgVcfJp
 d1FRLPxfV6fYLbGyXzX/1dORFNk6Mi1sALSTL+hRPk/mh0T5BnliKwkGHJytZww41EyY
 tjvg==
X-Gm-Message-State: AOAM533+OyvAYh/F9nxchUL8190oM3ndfxHPTWfdBqz2dEDd7T0OsvVS
 q2yYE15yqs7AT9ChLmktqMo=
X-Google-Smtp-Source: ABdhPJxT3MS0tLQzrz5zGTrmxsemf1EdNibb6+Ece9/iVj28PTNygmtdP13l0xPVSWG+mugPOMO4PA==
X-Received: by 2002:a50:fb1a:: with SMTP id d26mr25055415edq.101.1607436825849; 
 Tue, 08 Dec 2020 06:13:45 -0800 (PST)
Received: from ubuntu-laptop (ip5f5bfce9.dynamic.kabel-deutschland.de.
 [95.91.252.233])
 by smtp.googlemail.com with ESMTPSA id s5sm15577093eju.98.2020.12.08.06.13.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 08 Dec 2020 06:13:45 -0800 (PST)
Message-ID: <970af8b1abf565184bf37c3c055bf42ad760201a.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] scsi: ufs: Re-enable WriteBooster after device
 reset
From: Bean Huo <huobean@gmail.com>
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org, 
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
 jejb@linux.ibm.com
Date: Tue, 08 Dec 2020 15:13:43 +0100
In-Reply-To: <20201208135635.15326-2-stanley.chu@mediatek.com>
References: <20201208135635.15326-1-stanley.chu@mediatek.com>
 <20201208135635.15326-2-stanley.chu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_091348_758873_832FF1E2 
X-CRM114-Status: GOOD (  14.52  )
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
Cc: bjorn.andersson@linaro.org, alice.chao@mediatek.com, bvanassche@acm.org,
 andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 nguyenb@codeaurora.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-12-08 at 21:56 +0800, Stanley Chu wrote:
> index 08c8a591e6b0..36d367eb8139 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -1221,8 +1221,13 @@ static inline void
> ufshcd_vops_device_reset(struct ufs_hba *hba)
>         if (hba->vops && hba->vops->device_reset) {
>                 int err = hba->vops->device_reset(hba);
>  
> -               if (!err)
> +               if (!err) {
>                         ufshcd_set_ufs_dev_active(hba);
> +                       if (ufshcd_is_wb_allowed(hba)) {
> +                               hba->wb_enabled = false;
> +                               hba->wb_buf_flush_enabled = false;
> +                       }
> +               }

Stanley,
how do you think group wb_buf_flush_enabled and wb_enabled to the
dev_info, since they are UFS device attributes. means they are set only
when UFS device flags being set.

Reviewed-by: Bean Huo <beanhuo@micron.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
