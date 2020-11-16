Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58973C55ABD
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:46:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8E4A221F9
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2Vs4KqRV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cF2NsUGs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8E4A221F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zFO28w/H2DhspmUDLMonkUMHTzTvz/vcFvm9EtDK060=; b=2Vs4KqRVkaxhjZMVidWYRuDJ8
	CDItEyN0dzDMyFqiplENTSTEdCycha/lSbFJpQyY45mscBT9x6SyNKe/kIOpOsutuFCr3bAv0LU0x
	GG0pU5QzxZ+PpXS15DcRFw3WcZnOMdfSxzzobnxDirD8IIGmiQ5xujZ8CcHlXyUjB58G+1HjGD2zz
	DV/zFvm2anMaKRjFPyTPJ4rzXAxp3CUQr1NUcJ2jW32XpZPRLc6F1Ek2QvizinD42dsO8tueIbGH5
	qur0Y1iAzhhh+0PiHRelr7MYs6BdRRnOucpxqNgwbk3/BMe6ZXeR2P4btTeqeUwZA2wDczE3Bk0nI
	zukZBFETw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kea9q-0004xs-CL; Mon, 16 Nov 2020 08:46:42 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kea9l-0004u6-JZ; Mon, 16 Nov 2020 08:46:38 +0000
Received: by mail-ej1-x644.google.com with SMTP id 7so23247222ejm.0;
 Mon, 16 Nov 2020 00:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mCofBzJy30fhjMWH00xS2hq/jknrv2dfs6NyvbseoFQ=;
 b=cF2NsUGse1hW5wog8Dq0U2TGCaUVhqzE3884hcp6wAXvED/krAr2Ix/jOrSD6KlO52
 daxM3IW8Vu7LKLxCHjNX10SXtQrafdintDb9tT17PS+9uAA+4XWEDKqTgWLR7gnJ9Mkw
 sz1KB/BAr8EpO6aS9T6QZvlL6i5reWJAYt/GqhXgnSraoqMfP7KuXiMUnb9VT4Fp90Bi
 fzhr+/6HyojcHkLQhNvkzTJfiL5EOvvQxnKmZKhfdWK+kbQfjR7L1zhXYpuH8Ti126ku
 lcaUbLMdifRoLHlhykcq2eueEWDErBWBtYKRWVmXOk+eqEsrjqP6dOPIIp4pUE8y20Dh
 iDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mCofBzJy30fhjMWH00xS2hq/jknrv2dfs6NyvbseoFQ=;
 b=m5Wk2+lKSdqVgkxNa60kcNeMS3PuVyLWk7wPw61iZhUWF88CV2Q3Elkf+F2eHbkJIr
 E9r6N3MwcWOJL8xT9Vvaa26CGQ1JOVscYlIW20CIT9jw/KqpRDDNY1LotYA9lCuSB5hD
 XquJt1d2WwunUm9XyL+X3CNK2zSz6A2GDMNo9PAD/NR6ddy4ebKznkMJBbC+O/MdKh+/
 rVK0wN32L1xAG29/0FSJvb+UzS6/ZTjxSaAdbA2C4xy8nfFx6bAe3jHlfcOo+0QWhf2B
 8IfSRWmKH4W8ePUiuhJ32d3ktbZDRu3hh3gOBpsf4SA5OdhVY/KVLKixjKz/7ofr8tQJ
 cV4g==
X-Gm-Message-State: AOAM531JcaJnaWzjNe7AKE1UY59eP2FlEcJmR+PieDS7cjWnC4woEpQS
 bEKcu9bSSbfmT5o/ydAdA1M=
X-Google-Smtp-Source: ABdhPJwLUUiqwOrEc50Ra9NiKEF2Cm/Ktj5Ut9whQJY21mzZcz2RIKdMsxfQo2Kk8N9rTYtN4B7RSQ==
X-Received: by 2002:a17:906:b749:: with SMTP id
 fx9mr4956570ejb.0.1605516394490; 
 Mon, 16 Nov 2020 00:46:34 -0800 (PST)
Received: from ubuntu-laptop (ip5f5bee22.dynamic.kabel-deutschland.de.
 [95.91.238.34])
 by smtp.googlemail.com with ESMTPSA id nd5sm10128807ejb.37.2020.11.16.00.46.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Nov 2020 00:46:34 -0800 (PST)
Message-ID: <40d184834e6953982ac31b719d9803c81b3d61f4.camel@gmail.com>
Subject: Re: [PATCH v1 0/9] scsi: ufs: Refactoring and cleanups
From: Bean Huo <huobean@gmail.com>
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org, 
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
 jejb@linux.ibm.com
Date: Mon, 16 Nov 2020 09:46:32 +0100
In-Reply-To: <20201116065054.7658-1-stanley.chu@mediatek.com>
References: <20201116065054.7658-1-stanley.chu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_034637_747960_18F9104D 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: chun-hung.wu@mediatek.com, alice.chao@mediatek.com, andy.teng@mediatek.com,
 cc.chou@mediatek.com, peter.wang@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, kwmad.kim@samsung.com, jiajie.hao@mediatek.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org, liwei213@huawei.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-11-16 at 14:50 +0800, Stanley Chu wrote:
> Hi,
> This series simply do some refactoring and cleanups in UFS drivers.
> 
> Stanley Chu (9):
>   scsi: ufs-mediatek: Refactor performance scaling functions
>   scsi: ufs: Introduce device parameter initialization function
>   scsi: ufs-mediatek: Use device parameter initialization function
>   scsi: ufs-qcom: Use device parameter initialization function
>   scsi: ufs-exynos: Use device parameter initialization function
>   scsi: ufs-hisi: Use device parameter initialization function
>   scsi: ufs: Refactor ADAPT configuration function
>   scsi: ufs-mediatek: Use common ADAPT configuration function
>   scsi: ufs-qcom: Use common ADAPT configuration function
> 
>  drivers/scsi/ufs/ufs-exynos.c    | 15 +---------
>  drivers/scsi/ufs/ufs-exynos.h    | 13 --------
>  drivers/scsi/ufs/ufs-hisi.c      | 13 +-------
>  drivers/scsi/ufs/ufs-hisi.h      | 13 --------
>  drivers/scsi/ufs/ufs-mediatek.c  | 51 ++++++++++++++--------------
> ----
>  drivers/scsi/ufs/ufs-mediatek.h  | 16 ----------
>  drivers/scsi/ufs/ufs-qcom.c      | 27 +++--------------
>  drivers/scsi/ufs/ufs-qcom.h      | 11 -------
>  drivers/scsi/ufs/ufshcd-pltfrm.c | 17 +++++++++++
>  drivers/scsi/ufs/ufshcd-pltfrm.h |  1 +
>  drivers/scsi/ufs/ufshcd.c        | 16 ++++++++++
>  drivers/scsi/ufs/ufshcd.h        |  3 ++
>  12 files changed, 65 insertions(+), 131 deletions(-)
> 

This series looks good to me, thanks.

Reviewed-by: Bean Huo <beanhuo@micron.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
