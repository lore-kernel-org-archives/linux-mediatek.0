Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CF7C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 01:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34lDDydAwAjd3gUwJRFbQoccKORNig7o9dp+cyLAa44=; b=yjgFuPe17XZ+V5hH2AyDlR7ZNP
	az9viyK+M0wxziT8oTs3HndfacWGGH224djDveexz6+KdljWMuN/e1OUPKCwilc1CeXcNK0KZ7CFx
	tFdJnDqNADaCngwGImnGOF7ymjKv5fgGBwsob4+B+srlvWXlLgyY41tmLHbAyW9WZ5veT6r7nJLEk
	icBbPEsiqo1EXAY2cOAnbePslIRoY4o1sYS4MHfteNrsD/FBCOke00YfbS3b4UOjAVk0Y2G1VYL75
	x6GWmQQsIWW5hhoXqvzdNlBEFGjLkkqVyALpBQH3iFxc2e6tPCH/m8l0skU/QSYksGfmC6YOtKqQn
	6r2Oopgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUHiK-006Dks-RT; Tue, 21 Feb 2023 01:45:04 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUHiI-006Dk3-IQ; Tue, 21 Feb 2023 01:45:03 +0000
Received: by mail-lf1-x12b.google.com with SMTP id s22so3699803lfi.9;
        Mon, 20 Feb 2023 17:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=34lDDydAwAjd3gUwJRFbQoccKORNig7o9dp+cyLAa44=;
        b=hhBJOZuMVo1ePfb3/3F68gF6BC3ON4xQ3y3JcnWFv09WbtqsPLa5Mb3U7Zh+cKDKCF
         kvO9182b9JjrjENaevcIEelP/puJZI7VtplNpyOE8UrLFtbRdBDMwal8hE7xPL0PEt7k
         ZzST/MOdeg29aK5EoPZ/TyX/hWQ2BHChevLsdy5Eo1smhAM/ZP0OoU8VYV154M60PXzR
         0icNAm/PmkJQuQDMoZm+QfP340RnMnd+p4qZ96mVU81UR7LAHyMEUPvTu7ckzT2+krv/
         K+GxG8mVqKyyAnQmuwOA5+8cO2/eUrt2Jj1bar1F4NjWhFPNYsec7Q0J4qkt+EPEFtQu
         SAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34lDDydAwAjd3gUwJRFbQoccKORNig7o9dp+cyLAa44=;
        b=TgHVO/hbiX9K2DEecmgDL2wyk+skpoT5UjSW5Vmr1bNctlxtffCG2LNhbIBLBxSmEW
         HIOeEVMNRp7kHuooKr39GJIvaqlFFnKH7C7AGi0T08EWHA3jOambhnCDxNZHRpRSInPH
         Rsh36HyQOZDJFwNtHc6d+epQg6x3kNaBAhuxvUhPszfOwhig7IHIBCFecLpdudDhNvw2
         rRMcxrVbIxpfLJj3xXvWf+9bjywn941SdYOER5GbvOCn0bpgG9LYMN3fPk171G6OB2RL
         Kr0CZ9VZfvOSa9YRSw2N6h4I3HWgtaUvPzIiX5hbsEv120XFaeNzVsFKK+1pDUH7mhBF
         WRdQ==
X-Gm-Message-State: AO0yUKULaJAIEMLhrGEaMhrtsNvoQyg2GN7S4Rt/NESKMAdNcWEP6rHH
	6EfwOOa+VaGNsH94gfhLjFVI0xN5kvB22MHN7w==
X-Google-Smtp-Source: AK7set9Iu6OicBYAy8yoZbvlxVUSUKcFs1DOnRErdCLJJTpX8gi0u3toSKpGGdcUc5c9tHFS+Lce1M8lfxi7dHbnRJc=
X-Received: by 2002:ac2:5e8c:0:b0:4db:38a7:f32f with SMTP id
 b12-20020ac25e8c000000b004db38a7f32fmr1165437lfq.4.1676943898660; Mon, 20 Feb
 2023 17:44:58 -0800 (PST)
MIME-Version: 1.0
References: <20230220142431.54589-1-frank.li@vivo.com>
In-Reply-To: <20230220142431.54589-1-frank.li@vivo.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Tue, 21 Feb 2023 09:44:47 +0800
Message-ID: <CAGaU9a-xmWFhXSZ0Zt7O2xvVz4xd-AY1giFAeKFnAxHAgUx5pw@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: guard ufs_mtk_runtime_suspend()
 and ufs_mtk_runtime_resume() w/ CONFIG_PM
To: Yangtao Li <frank.li@vivo.com>
Cc: stanley.chu@mediatek.com, jejb@linux.ibm.com, martin.petersen@oracle.com, 
	linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	zhangshida@kylinos.cn, k2ci <kernel-bot@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_174502_648592_2EC12A4D 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

Hi Yangtao,

On Mon, Feb 20, 2023 at 10:44 PM Yangtao Li <frank.li@vivo.com> wrote:
>
> To fix below compile error(CONFIG_PM set to 'n'):
>
> drivers/ufs/host/ufs-mediatek.c: In function `ufs_mtk_runtime_suspend`:
> drivers/ufs/host/ufs-mediatek.c:1623:8: error: implicit declaration of
>         function `ufshcd_runtime_suspend`; did you mean `ufs_mtk_runtime_suspend`?
>         [-Werror=implicit-function-declaration]
>  1623 |  ret = ufshcd_runtime_suspend(dev);
>       |        ^~~~~~~~~~~~~~~~~~~~~~
>       |        ufs_mtk_runtime_suspend
> drivers/ufs/host/ufs-mediatek.c: In function `ufs_mtk_runtime_resume`:
> drivers/ufs/host/ufs-mediatek.c:1638:9: error: implicit declaration of function
>         `ufshcd_runtime_resume`; did you mean `ufs_mtk_runtime_resume`?
>         [-Werror=implicit-function-declaration]
>  1638 |  return ufshcd_runtime_resume(dev);
>       |         ^~~~~~~~~~~~~~~~~~~~~
>       |         ufs_mtk_runtime_resume
> At top level:
> drivers/ufs/host/ufs-mediatek.c:1632:12: error: `ufs_mtk_runtime_resume`
>         defined but not used [-Werror=unused-function]
>  1632 | static int ufs_mtk_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> drivers/ufs/host/ufs-mediatek.c:1618:12: error: `ufs_mtk_runtime_suspend`
>         defined but not used [-Werror=unused-function]
>  1618 | static int ufs_mtk_runtime_suspend(struct device *dev)
>
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Reported-by: Shida Zhang <zhangshida@kylinos.cn>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Thanks for this fix.

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

