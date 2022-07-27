Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61AEC19F21
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 03:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjqboMjUafpTNGUy0/O4ZDtfa56hWKNu2C1XCtWQzVA=; b=Awysu8l1dRQ+m0tSelFiaYyEhn
	5vmHFMC7OE5S8X/Wiui8akGtfh8ttCMb7mHKYd0InmzJUN1WXnJk6p8UQHCa1kB4K3n7+sADwcQ0z
	yMR+abi9g8feO6aigakTxhUJIsiXyjUPP5mFg6w25im0jqkwp/kJDn7cFCTYEMyicE08xJ8dtrvt3
	uz7h7Fc1g6f8lUjlHNeMdF41MRIKpw4za0gtJFt4BiS6jvmL4jSQRQ28pbmVcNUOpx7bsGXSZw+Er
	3pmH7ROJJt72OGhuLi3oOpkTJYPdiIWLwiMYZV6eEonT3c2efEZR6d8ZxK0ZopqvRwLOMVkMcc56B
	q7x2tDxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGXT6-008Bud-1Q; Wed, 27 Jul 2022 03:12:16 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGXT3-008Bqi-QR
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 03:12:15 +0000
Received: by mail-lj1-x22c.google.com with SMTP id u17so8279050lji.5
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 20:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vjqboMjUafpTNGUy0/O4ZDtfa56hWKNu2C1XCtWQzVA=;
        b=Q5Xo+Bg4msAdmVwzpBwCtILRjoM1yJhUc972HzJcEoCaxF/JjzLsi9okJmR2dCNhnm
         GLf+ZPI3plNCoXTd0rDjKsAy/+/0giq1jUTovcZaTd1Q0f0YgTm1cQt3HeO50O9KQBei
         6eePw2J4KHWgrOvrek1LtHJUQBaHntpaTF2mNAiid10OowP2K4PE/qM49A/tlQUm89PL
         29VElTUpRzd2+CwuIdptK9G5Kr+MeiNSqsdAfHYEEYxEBADiNVC8u3x58tA9zml5XRVh
         MrANXuRRlTbZhlonGdbsWS3O75N/Qv96MXvIYitmfLlpNNME/ty9esOgEokZNkl55fzp
         cGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vjqboMjUafpTNGUy0/O4ZDtfa56hWKNu2C1XCtWQzVA=;
        b=AyX9J3oiLwt3IsDAHW4HezpBETC0VKNfXE9zdDwFUPdIkv+PoLA/TOfezfvHQNwLCH
         0Zu18RVwMSq6uYoap5/5rqNdA9Tx62uM4G+1V1DsiyzKi3PZCueu2OwKxHWXVuuWEQcp
         UjjKa4ypGo/ISRIi7BHpjPJNA6J7dQGsyc0FuqnuyR0UBd65SGsomK+1nWFb74MocsmY
         DmXNIpzLlEWNhUkJwNwtBuVywmIdUAt7eqneZ2f2hKP08HxAd9sFwZCtDDCc/yAEKVzj
         j7N1XUfvO0HSN0PPyc1f+O0Ab+nmM0TLxxMN7wPaps5ac393qvXxHiaaCI5qXsvxrDSO
         izAQ==
X-Gm-Message-State: AJIora92jQATu+sD/DTtZT5W1gwu+AulZYFoJGLQxIOf5oriuZYi51Ql
	+LokFbKTYY+qfN+Fz94n2iLwty5Q9h4wDIkr12bePqGYAw==
X-Google-Smtp-Source: AGRyM1v4Ncd9HBGYmoz4GB4ul2KRx32NDFuoju0Nas2HcyCjW1c4g23bxplhHnlVMchicE6sR/kHzTuS7vhfvbW0uG0=
X-Received: by 2002:a05:651c:1796:b0:25d:7288:ed0b with SMTP id
 bn22-20020a05651c179600b0025d7288ed0bmr6844732ljb.228.1658891527252; Tue, 26
 Jul 2022 20:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220727030526.31022-1-peter.wang@mediatek.com>
In-Reply-To: <20220727030526.31022-1-peter.wang@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Wed, 27 Jul 2022 11:11:55 +0800
Message-ID: <CAGaU9a9FG9DxNsPEC=DDE_ZENn9PGoeQy0BG9FG8p-trdmTNmQ@mail.gmail.com>
Subject: Re: [PATCH v5] ufs: core: correct ufshcd_shutdown flow
To: peter.wang@mediatek.com
Cc: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, Avri Altman <avri.altman@wdc.com>, 
	alim.akhtar@samsung.com, "James E.J. Bottomley" <jejb@linux.ibm.com>, wsd_upstream@mediatek.com, 
	linux-mediatek@lists.infradead.org, Chun-Hung Wu <chun-hung.wu@mediatek.com>, 
	alice.chao@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com, 
	jiajie.hao@mediatek.com, powen.kao@mediatek.com, qilin.tan@mediatek.com, 
	lin.gui@mediatek.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_201213_881648_ECA5CFB6 
X-CRM114-Status: UNSURE (   9.92  )
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

On Wed, Jul 27, 2022 at 11:10 AM <peter.wang@mediatek.com> wrote:
>
> From: Peter Wang <peter.wang@mediatek.com>
>
> After ufshcd_wl_shutdown set device power off and link off,
> ufshcd_shutdown could turn off clock/power.
>
> Also remove pm_runtime_get_sync.
> The reason why here can remove pm_runtime_get_sync is because,
> (1) ufshcd_wl_shutdown -> pm_runtime_get_sync, will resume hba->dev too.
> (2) device resume(turn on clk/power) is not required, even if device is in RPM_SUSPENDED.
>
> Fixes: b294ff3e3449 ("scsi: ufs: core: Enable power management for wlun")
> Cc: <stable@vger.kernel.org> # 5.15.x
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

