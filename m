Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F70AC4167D
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 19:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2GkHL9Asj7cZ9gDAWnYJZ3/Dq1fD/MZuGhccXlmPBI=; b=tQwPkTfCzV98vmRyoFwGxIhTIQ
	+JpnpepOd4NgsFrGweuEbUb0FpPkOVbomwW6XdBOU40cNavpGvNHuEkuCbDWymYL0sVsgurQnGnZ1
	uTszwB7IizipFyKUaG3CUU04p5kj9FnOPK167jdyfvNmiOByafFFgT+tdQ9Xnhau0eF5ETslvhf+F
	QNjorv5P7/mi6hS9v1lE0W7PBzMAciecHtR4MPG2KuvHpTymMYzu2eNwB/b4eksPvnFYHN/GRVk91
	oaueDMxcA2FbBZsvhwpmT6z9WB5rAM+HBVgf5faZbUgwBR/uezvOooJRl/3GWOk2NkLsoChmT5EEP
	yaoTOyZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0RsE-002HSg-2o;
	Tue, 07 Nov 2023 19:36:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0RsB-002HRs-1g
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Nov 2023 19:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699385785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f2GkHL9Asj7cZ9gDAWnYJZ3/Dq1fD/MZuGhccXlmPBI=;
	b=MgREWolNd1OUGwr4kUNuSSAb+3Cf4DB7DMJ6pfT8lNvGQRTQDXvOZSPCmyD+TA+kvoWMC+
	mJ0b7TkM2NU1Ut0nQ9hGr0YB9rLGnoBe9b75MZPfEQRUunLEH9wuzs01O/WRXgJcSjBXJ3
	D5QDXqEVlYuyFD9rbih1RVQyOf84Jxw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-zVLkI6aPNSWZOlmeZr87jQ-1; Tue, 07 Nov 2023 14:36:24 -0500
X-MC-Unique: zVLkI6aPNSWZOlmeZr87jQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-778b25af933so689035585a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Nov 2023 11:36:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699385784; x=1699990584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2GkHL9Asj7cZ9gDAWnYJZ3/Dq1fD/MZuGhccXlmPBI=;
        b=LPlKbFB7lEOO8n077twMmqpM096wgLn8cm5TQHVd3qq9Hon3dNhvOFmxcOdEjYk79s
         p1bLIQqfuQrjMvfT2Mrc60u5+5CVDQiIf4NFxnbyFNwPDaBQesKhjqdX6NyK8hkrjR+f
         LNc8MDyJdsFu6H97O8oQVNlPEEqCxiQzyrtvCc8guDzKr2CCkLFQF1cpKqtzzfKztJww
         3SIxwYkSO7DElG0+dSAw3jp1kLO2ksaw+emVIY9vbCAv4mtmGQUSKad5+CLeEOqW58Dk
         MLcCjyQim25c3efGPcrCNxirpbGl3eYvVXhIGvU5+qyFbhrJS3qtDaSOGbrgN7fneBuP
         l7QA==
X-Gm-Message-State: AOJu0YwbWOoQE47j+c8KeLauQ1Ffub4X51U7JsU/N+om48zoGp3IplX4
	kYxoI1eFAr1c71pnkJpA+cIAvhDMPYf9B2tXDjuYObRJjr+q+toqgv6HrdMjQpOd96FiNdhTumt
	AI+ilaEhWLx+MkQ0EUmdg9MwAhDhWGVuH
X-Received: by 2002:ad4:5ecf:0:b0:675:6a83:8084 with SMTP id jm15-20020ad45ecf000000b006756a838084mr17136092qvb.14.1699385783791;
        Tue, 07 Nov 2023 11:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCasVvUsu1Pm+2+uqpGskpzIAz52YVkupGLyfFo54ljOeoSzf1eiTLLEVSdNTLByNhDpkAJg==
X-Received: by 2002:ad4:5ecf:0:b0:675:6a83:8084 with SMTP id jm15-20020ad45ecf000000b006756a838084mr17136067qvb.14.1699385783454;
        Tue, 07 Nov 2023 11:36:23 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id k16-20020ad44210000000b0067169e210b3sm206076qvp.70.2023.11.07.11.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 11:36:23 -0800 (PST)
Date: Tue, 7 Nov 2023 13:36:20 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Can Guo <cang@qti.qualcomm.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org, 
	stanley.chu@mediatek.com, adrian.hunter@intel.com, beanhuo@micron.com, avri.altman@wdc.com, 
	junwoo80.lee@samsung.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, 
	Alim Akhtar <alim.akhtar@samsung.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Brian Masney <bmasney@redhat.com>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>, 
	"open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] scsi: ufs: host: Rename structure ufs_dev_params
 to ufs_host_params
Message-ID: <fcovysoo6vxvqdrypfbnfyclrmifibio46rne5zhiqnmqhzd7k@5ltemasdhfxp>
References: <1699332374-9324-1-git-send-email-cang@qti.qualcomm.com>
 <1699332374-9324-2-git-send-email-cang@qti.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <1699332374-9324-2-git-send-email-cang@qti.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_113627_675676_A97A8D6C 
X-CRM114-Status: GOOD (  21.38  )
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

On Mon, Nov 06, 2023 at 08:46:07PM -0800, Can Guo wrote:
> From: Can Guo <quic_cang@quicinc.com>
> 
> Structure ufs_dev_params is actually used in UFS host vendor drivers to
> declare host specific power mode parameters, like ufs_<vendor>_params or
> host_cap, which makes the code not very straightforward to read. Rename the
> structure ufs_dev_params to ufs_host_params and unify the declarations in
> all vendor drivers to host_params.
> 
> In addition, rename the two functions ufshcd_init_dev_pwr_param() and

nit: s/ufshcd_init_dev_pwr_param/ufshcd_init_pwr_dev_param/

> ufshcd_get_dev_pwr_param() which work based on the ufs_host_params to

nit: s/ufshcd_get_dev_pwr_param/ufshcd_get_pwr_dev_param/

> ufshcd_init_host_param() and ufshcd_negotiate_pwr_param() respectively to
> avoid confusions.
> 
> This change does not change any functionalities or logic.
> 
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/ufs/host/ufs-exynos.c    |  7 +++---
>  drivers/ufs/host/ufs-hisi.c      | 11 ++++-----
>  drivers/ufs/host/ufs-mediatek.c  | 12 ++++------
>  drivers/ufs/host/ufs-qcom.c      | 12 ++++------
>  drivers/ufs/host/ufshcd-pltfrm.c | 49 ++++++++++++++++++++--------------------
>  drivers/ufs/host/ufshcd-pltfrm.h | 10 ++++----
>  6 files changed, 47 insertions(+), 54 deletions(-)
> 

<snip>

> diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
> index da2558e..6e65b61 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.c
> +++ b/drivers/ufs/host/ufshcd-pltfrm.c
> @@ -285,17 +285,17 @@ static int ufshcd_parse_operating_points(struct ufs_hba *hba)
>  }
>  
>  /**
> - * ufshcd_get_pwr_dev_param - get finally agreed attributes for
> + * ufshcd_negotiate_pwr_param - get finally agreed attributes for
>   *                            power mode change
> - * @pltfrm_param: pointer to platform parameters
> + * @host_param: pointer to platform parameters
>   * @dev_max: pointer to device attributes
>   * @agreed_pwr: returned agreed attributes
>   *
>   * Return: 0 on success, non-zero value on failure.
>   */
> -int ufshcd_get_pwr_dev_param(const struct ufs_dev_params *pltfrm_param,
> -			     const struct ufs_pa_layer_attr *dev_max,
> -			     struct ufs_pa_layer_attr *agreed_pwr)
> +int ufshcd_negotiate_pwr_param(const struct ufs_host_params *host_param,
> +			       const struct ufs_pa_layer_attr *dev_max,
> +			       struct ufs_pa_layer_attr *agreed_pwr)
>  {
>  	int min_pltfrm_gear;

If you're going to change pltfrm -> host, maybe do so for
min_pltfrm_gear too? I think this all reads nicer with the functions
changed as is, but the consistency would be nice in my opinion.

Outside of those nits, I think this reads nicer now as well.

Acked-by: Andrew Halaney <ahalaney@redhat.com>


