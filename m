Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD10C71155
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 23:09:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB19D2076C
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 23:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YG+4TWGO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FMuoHiP0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB19D2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CrZ3htGVsoAfGZz7DRJYvkokr6kkz/wIhPZzD0eFBSQ=; b=YG+4TWGOgYkm7jkDRrguv2Zkj
	787lnQdkaJxB+O7dYmdQYDw+dNshEaWmqwzPKkZBk44eQfyQYutll8s2Z6SC0EMEqcUUZbkuieVvT
	MI0WjMqRRTBxs1JI71j4Nw+WAA6HOgc+4zVU/8m5d1WY1dywkKtDei9C9/g/AJuMPQmTbBIWCWk/b
	HijjljFNbOvCQAtNnfzUcE7y19AkYKhZYzr0tP0RHB08vs3gp1rm0AlwtEaxMoBGSf96fh6dBnpw6
	Y4TtmZabR6ahvjfk84e0DtomFoHzecJyCh2EGZ5tOma1C4c4TYIh8sJATgtU7qiDlI/WnxTOg/rWs
	wxnIhFyKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjsIh-0008GD-1Z; Mon, 30 Nov 2020 23:09:43 +0000
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjsIc-0008FF-KE
 for linux-mediatek@lists.infradead.org; Mon, 30 Nov 2020 23:09:39 +0000
Received: by mail-oo1-xc43.google.com with SMTP id w9so3013191ooh.13
 for <linux-mediatek@lists.infradead.org>; Mon, 30 Nov 2020 15:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ElQq1bkIiUYhrFnOCJXzaDWlbvoQCXiavddjZw8fCCM=;
 b=FMuoHiP05HX4Iz0WlIi5VX49F90NYlSP+7bikhMJh2BsC+xXuTlcK9Z1kZf3N5vC+w
 iY7nofNxeSeb0INIGsnvNaEMT/Jnk/cccAvTNLBvGVrltFDk65xHRGuA5rsl7QmxOhLG
 2x39e51e5VzrLbsvHMi7oIW/mOKEspqgfb3cQ5jJSbXkmSXRHDHeHpx0Z0pAj8YbcdSJ
 COvnLQpn3IcUdhEejlQQsBZiEL779czeYspfppjy3ZhsEvGP7IMmQIAx8ABlytPME2Mz
 iHZESCTK/CK33qNW2BrWgDI4EvztYXJx4wcDs+tQKF7em1iNZORrDeSB+rTEf2/U7m4N
 uAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ElQq1bkIiUYhrFnOCJXzaDWlbvoQCXiavddjZw8fCCM=;
 b=dXjJQ+4XozNT/Z+i+hxrPn/G0UkTbJFGHWdO4vykrBj3cdVh1xMF2dnBpJJ773GlYj
 bEpETxWXxuXoClvTBc34qptZgYnKWNn2MA1jzm8OZOANJpbNiSE4y379Z8qvWMvqRdVV
 fQdzSX0w+sn0ihZPVh/Plxt+sbwZWj8mij0xCGLxRXeTOY9kDpTdIlXZr3r0nX81S51o
 ySNWNkT2Ed3lHNrpY5KaH6MTY0P4rDBek0vFegYqhjR0Bzy2s6n7cPaN/X9Pphotlhtz
 h1PQ6dWTWiGa+sNPoIEtDoYAoinwnpoWz7oD7wBObif0lhn8/jbGKzgCuNNuweFv6lwB
 HnfA==
X-Gm-Message-State: AOAM532fA179ttwaMg/oYRhtducZx6y20nB60ZcpoYsjE/w/MLfsvl4V
 Ex2CYqB3PcWtZaRHfg+HdEAYqw==
X-Google-Smtp-Source: ABdhPJxGYQ4JvywSH3rS4u9MQVQ1PyCUIezE6Kx9aV63JKBzcvEBclFVAIjJGy8bzkoxOT8vS5Yi7g==
X-Received: by 2002:a4a:91de:: with SMTP id e30mr17437722ooh.58.1606777775002; 
 Mon, 30 Nov 2020 15:09:35 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id m8sm5603517otm.71.2020.11.30.15.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 15:09:34 -0800 (PST)
Date: Mon, 30 Nov 2020 17:09:32 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [RFC PATCH v1] scsi: ufs: Remove pre-defined initial VCC voltage
 values
Message-ID: <X8V7rM6GJd2IOo1f@builder.lan>
References: <20201130091610.2752-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130091610.2752-1-stanley.chu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_180938_856638_D58A9B47 
X-CRM114-Status: GOOD (  25.11  )
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
Cc: nguyenb@codeaurora.org, matthias.bgg@gmail.com, cang@codeaurora.org,
 alim.akhtar@samsung.com, beanhuo@micron.com, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, peter.wang@mediatek.com, cc.chou@mediatek.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 avri.altman@wdc.com, linux-mediatek@lists.infradead.org,
 jiajie.hao@mediatek.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, martin.petersen@oracle.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 asutoshd@codeaurora.org, alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon 30 Nov 03:16 CST 2020, Stanley Chu wrote:

> UFS specficication allows different VCC configurations for UFS devices,
> for example,
> 	(1). 2.70V - 3.60V (By default)
> 	(2). 1.70V - 1.95V (Activated if "vcc-supply-1p8" is declared in
>                           device tree)
> 	(3). 2.40V - 2.70V (Supported since UFS 3.x)
> 
> With the introduction of UFS 3.x products, an issue is happening that
> UFS driver will use wrong "min_uV/max_uV" configuration to toggle VCC
> regulator on UFU 3.x products with VCC configuration (3) used.
> 
> To solve this issue, we simply remove pre-defined initial VCC voltage
> values in UFS driver with below reasons,
> 
> 1. UFS specifications do not define how to detect the VCC configuration
>    supported by attached device.
> 
> 2. Device tree already supports standard regulator properties.
> 
> Therefore VCC voltage shall be defined correctly in device tree, and
> shall not be changed by UFS driver. What UFS driver needs to do is simply
> enabling or disabling the VCC regulator only.
> 
> This is a RFC conceptional patch. Please help review this and feel
> free to feedback any ideas. Once this concept is accepted, and then
> I would post a more completed patch series to fix this issue.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>


This is the correct thing to do and I would prefer that we did the same
for vccq and vccq2 as well - and thereby remove the min_uV and max_uV
from ufs_vreg.

Regards,
Bjorn

> ---
>  drivers/scsi/ufs/ufshcd-pltfrm.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
> index a6f76399b3ae..3965be03c136 100644
> --- a/drivers/scsi/ufs/ufshcd-pltfrm.c
> +++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
> @@ -133,15 +133,7 @@ static int ufshcd_populate_vreg(struct device *dev, const char *name,
>  		vreg->max_uA = 0;
>  	}
>  
> -	if (!strcmp(name, "vcc")) {
> -		if (of_property_read_bool(np, "vcc-supply-1p8")) {
> -			vreg->min_uV = UFS_VREG_VCC_1P8_MIN_UV;
> -			vreg->max_uV = UFS_VREG_VCC_1P8_MAX_UV;
> -		} else {
> -			vreg->min_uV = UFS_VREG_VCC_MIN_UV;
> -			vreg->max_uV = UFS_VREG_VCC_MAX_UV;
> -		}
> -	} else if (!strcmp(name, "vccq")) {
> +	if (!strcmp(name, "vccq")) {
>  		vreg->min_uV = UFS_VREG_VCCQ_MIN_UV;
>  		vreg->max_uV = UFS_VREG_VCCQ_MAX_UV;
>  	} else if (!strcmp(name, "vccq2")) {
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
