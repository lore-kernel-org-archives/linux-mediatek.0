Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84773C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 21:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBTdEaMEquzGdtE2SVb08phk2G37dgthWhMmnNyIQXQ=; b=dr72YWYtc+VNnSUzGd58nZbzgv
	FXnkyD4WoEU8a9LAStkFM/eVmqw2ri0IYiAaD+X2SpdUckHn0gALusJKihX7ftecFSLbSygTTkyp4
	Vtz7BdOw5rvWoxiUGqOwmw2IHOy0y3yDkWCT7npHxAPnSqBZ+/tKKwFxl9YtPneUPlPzF/MDzUp9T
	3YFcggjIuv6yWHwE512ltDTKPaQV20edjOzh4iQmns/LkRgfxKRp4P6LqzpcZptQz+xpJDsrIxQpG
	KSU5ByNUZ12u507+SbFKyiJV31BHUafB+GmNcsAGSWbk53dRCSyMmoQbZL6jfkoD3ZS+/NQuV/Evb
	0+QQQ5QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHBVm-00Et6d-Vw; Thu, 28 Jul 2022 21:57:42 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHBVk-00Et5Y-7H
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 21:57:41 +0000
Received: by mail-ej1-x62f.google.com with SMTP id mf4so5379132ejc.3
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 14:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=tBTdEaMEquzGdtE2SVb08phk2G37dgthWhMmnNyIQXQ=;
        b=qik0nU5JmZ2hSKOH6hggscV2BAG/9N43fjICFDnIr6Oh/1KThVNlL8CfCushErjX/d
         IwWpVHdXnlq//A+OM/PmZ1AuA6B8VEUNNWISmAN9OXwBLbiBWPNTG++yr54nLElqx3SG
         cg6LPIb7J6kqStPN5zyIcNMEb4G/hfniIqXzOtVyFaVv2gGgshZLIt9EWOPRLDYIBTkQ
         VCoUDBWQ2YOmtPlc3tBLIKPBINlS4D4JUbh11vm9x/mo+i+rNwj0RBfqBkSTAAyGEn6N
         so4OQLRl8f+9W6Bn0IsHelSLP6d5vugbxdW3pSru/XvDy9Nwp1bRg0cse35SadiK6mlZ
         XOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=tBTdEaMEquzGdtE2SVb08phk2G37dgthWhMmnNyIQXQ=;
        b=Tp8wCRoEHwPtQSBjwhlMeGBPwlMoXQBcYsYwEPwLPJEHWHd1vWGI4ASvrbrRaKkRKC
         wbF7mqgsbf+sHCakTZg54tu9WeRWnt0ySOSTYRkTvQClpCUEKvtYHYeNApducD/XGStd
         3pJpH6ojF6WWNdq1lE7HxPFN1PHTxApQ5op9KjWbpVO11jH4hVwmHEWVOH8TmogA5GWT
         4b3/c2lznGg7Nrkdq31DFj4HhrgTAcSlYfch9G99sY03armLlGDm4UcWveSPw9IYgL/v
         jTkdKCFt62XchwHihqrwA8I8NI+PKzR2D+7X1uPSUKDY3I/f1+GEqMTnliItrQukJrxc
         sxoQ==
X-Gm-Message-State: AJIora9/jVzTLVwEP1STbzUR3R1m4zlZMOaMQuHBhEonzoKFMtRhNqkG
	w8K9IvuI3adJqfRuq7IVUGs=
X-Google-Smtp-Source: AGRyM1vYCId71UEtdFiUSjVInECfR19OlxaAJET7OeqVtqFaeLICO+T9alMwOQ0yumwgipWSgA9SbQ==
X-Received: by 2002:a17:907:6e13:b0:72b:509e:bd6b with SMTP id sd19-20020a1709076e1300b0072b509ebd6bmr688038ejc.202.1659045458144;
        Thu, 28 Jul 2022 14:57:38 -0700 (PDT)
Received: from p200300c5870e1483ac11a16c0f4ae195.dip0.t-ipconnect.de (p200300c5870e1483ac11a16c0f4ae195.dip0.t-ipconnect.de. [2003:c5:870e:1483:ac11:a16c:f4a:e195])
        by smtp.googlemail.com with ESMTPSA id y6-20020a50eb86000000b0043bd192e826sm1377247edr.17.2022.07.28.14.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 14:57:37 -0700 (PDT)
Message-ID: <ea3b173cb2575dbb81cb416469880c50dd536bd0.camel@gmail.com>
Subject: Re: [PATCH v1 2/2] ufs: host: support wb toggle with clock scaling
From: Bean Huo <huobean@gmail.com>
To: peter.wang@mediatek.com, stanley.chu@mediatek.com, 
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 avri.altman@wdc.com,  alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com, 
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 powen.kao@mediatek.com,  qilin.tan@mediatek.com, lin.gui@mediatek.com
Date: Thu, 28 Jul 2022 23:57:37 +0200
In-Reply-To: <20220728071637.22364-3-peter.wang@mediatek.com>
References: <20220728071637.22364-1-peter.wang@mediatek.com>
	 <20220728071637.22364-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_145740_323255_516B5027 
X-CRM114-Status: GOOD (  13.83  )
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

On Thu, 2022-07-28 at 15:16 +0800, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
>=20
> Set UFSHCD_CAP_WB_WITH_CLK_SCALING for qcom to compatible legacy
> design.
>=20
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
> =C2=A0drivers/ufs/host/ufs-qcom.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-
> qcom.c
> index f10d4668814c..f8c9a78e7776 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -869,7 +869,7 @@ static void ufs_qcom_set_caps(struct ufs_hba
> *hba)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ufs_qcom_host *hos=
t =3D ufshcd_get_variant(hba);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hba->caps |=3D UFSHCD_CAP=
_CLK_GATING |
> UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hba->caps |=3D UFSHCD_CAP_CLK_=
SCALING;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hba->caps |=3D UFSHCD_CAP_CLK_=
SCALING |
> UFSHCD_CAP_WB_WITH_CLK_SCALING;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hba->caps |=3D UFSHCD_CAP=
_AUTO_BKOPS_SUSPEND;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hba->caps |=3D UFSHCD_CAP=
_WB_EN;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hba->caps |=3D UFSHCD_CAP=
_CRYPTO;

Hi peter,=20

If WB is on/off based on clk scaling up/down is legacy design, maybe
you have a more advanced design. It is true there is an issue since we
didn't differentiate the read or write. WB is only for write. How to
know this time clk scaling is for write from driver level, not possible
now.

Kind regards,
Bean

