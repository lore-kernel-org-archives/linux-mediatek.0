Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86D3C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrg8wwpA92kjivH0TKg4TZtfTIvVrn3ddePAYWoa0qw=; b=Pndz8lw+l0jKF8F4scuRcSnTmn
	xgY4Df260GGmNA6T2LlyFbNbQkxFxdLxVmhzM6micP5HcpktdV0vmKPhbfOG5r8A4YDRJG20MbX+P
	8TG20NNzP03uX/0borIKV0gL+V9cXXovfkp+GOsSOkzXzJ8NWGyXpdTu2qoMFCVYGszB2pFMH6mIH
	RD3HTi6KCcxiR8W8cGfOZktR6MSxSYson5Ag7v/uF24hZeKbFr0ymyfY2n6GIK9sy0m6uqM3h9nZw
	XO4HcKbdCudsNZr7Q8yJRQXL9IIUd4AmMShXXYcp5NYu7xNGga7YlxrjZ1unIOt64hBESfy7PdR07
	pO6sRkyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzevF-00000004pQM-3lsk;
	Wed, 24 Apr 2024 15:52:37 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzevC-00000004pOl-0X6R
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Apr 2024 15:52:35 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso4947046a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Apr 2024 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713973952; x=1714578752; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rrg8wwpA92kjivH0TKg4TZtfTIvVrn3ddePAYWoa0qw=;
        b=TDcUQmYbprhcB6A8cg9MPn0gdAVVWh8H2ZYKbb1KZOs3z00/T2Tyj8ON1qxL5AvP3L
         DMd/QXnC8/HDpk11K8jN2rGWHG8WWhCZNPq7n1ro3eMQnocpTNqVvTpT5pboUyMqg1dh
         Cal7v4tvHF5CY4YMiylOI2PDsv52jLzETzRY5FC8ortXDhXRbXrf8/F46xq051mci2Lm
         pTLeT14teTVQqoduV0GQfbdhNfvB4OBTKnMhDiAxWn1P1UsaX4c7YZxIsFBGGW1Z4N7e
         hyd6Vs8loumQ/YPRq1901JbNfDCnHQoelUrvEkv9xr47DIpn5rmsxyo+tQf3uw42buz9
         B1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713973952; x=1714578752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rrg8wwpA92kjivH0TKg4TZtfTIvVrn3ddePAYWoa0qw=;
        b=kFDPzOZL1+1qx6KzD9/N5kRcdaKpwxFX7B1GW6pm1UmWfr8eMmkmkj0dMkOgBHcgTl
         TL2pL2UI0ExOUQaNQtoKMVgkwSW12I4cGtEmAkUdVsKnErjMQ1/73qPetwPFVkxH76zd
         WAoqwcodogWGqc698nrqPBfh3ThNTdiD864ETha26prGaXtyZXCdY8j4oaIJ3jNo4jb9
         B3yHoRrca5/dy6+FSRZWMOH/jB1RDqyNAR7vtjCUuGAwMJte92DzpK2ix7iDpyG0wh2R
         6xVhwk7kBZjNG9m6Ncue627MOCABoPn9adSJIh8ekpEsQ92y1N05kGie/qkjB1uJlfgf
         FFzw==
X-Forwarded-Encrypted: i=1; AJvYcCURrasNzFAshKft3dR9nUGSzmZDkF92+fZfUTSO0HVOcFEiHTsrMLkgWH87EQV3pDLZu04/ZYm4IAM/fKwyX2XQMFUEKe2KSmXR/+nF9YFfNTQV
X-Gm-Message-State: AOJu0Ywm6/U8S2a8lYQgNurlMMlayuUEe1odnulwGoP+YMYWpwu1J1yn
	vBxNsOyF1GG1xshfrJmOiwz/0WC3pb3FVwNpDSpI6JupYyFPD2WqB3m3OnpvRw0=
X-Google-Smtp-Source: AGHT+IFJz2davFxl/umAykqWCqyRrrGNTJwfxgAOiKqEZ16/Hd7Gt5Q+2HCcbgUlPTtL3ULXGxROYQ==
X-Received: by 2002:a05:6a21:33a0:b0:1aa:6167:b6d6 with SMTP id yy32-20020a056a2133a000b001aa6167b6d6mr3249147pzb.42.1713973951946;
        Wed, 24 Apr 2024 08:52:31 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e523:8f5:a4a3:fdaf])
        by smtp.gmail.com with ESMTPSA id v22-20020aa78516000000b006f03a06314esm11614021pfn.195.2024.04.24.08.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 08:52:31 -0700 (PDT)
Date: Wed, 24 Apr 2024 09:52:28 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Olivia Wen <olivia.wen@mediatek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	jason-ch.chen@mediatek.com, yaya.chang@mediatek.com,
	teddy.chen@mediatek.com
Subject: Re: [PATCH v3 4/4] media: mediatek: imgsys: Support image processing
Message-ID: <ZikqvOwh5aHi6iug@p14s>
References: <20240424030351.5294-1-olivia.wen@mediatek.com>
 <20240424030351.5294-5-olivia.wen@mediatek.com>
 <ba25cb7b-ff93-4fcb-b943-154e960d45a0@collabora.com>
 <fd24398f-a915-4e9a-9c19-4eb644178987@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd24398f-a915-4e9a-9c19-4eb644178987@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_085234_406776_9A52E90C 
X-CRM114-Status: GOOD (  22.17  )
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

On Wed, Apr 24, 2024 at 12:04:54PM +0200, AngeloGioacchino Del Regno wrote:
> Il 24/04/24 12:02, AngeloGioacchino Del Regno ha scritto:
> > Il 24/04/24 05:03, Olivia Wen ha scritto:
> > > Integrate the imgsys core architecture driver for image processing on
> > > the MT8188 platform.
> > > 
> > > Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
> > 
> > This should be reordered before introducing the 8188 scp core 1 support commit,
> > but let's check with Mathieu before sending a v4.
> > 

I don't have a strong preference.

> > With that reordered,
> > 
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Wait, no. Sorry. I just noticed that the commit message is totally wrong.
> 
> This is not a media commit, but remoteproc, and you're not adding support for
> image processing with this commit - not in media at least.
> Also, you're not adding any imgsys core architecture driver.
> 
> Please fix both commit description and title.
> 

I agree.

> Regards,
> Angelo
> 
> > 
> > > ---
> > >   include/linux/remoteproc/mtk_scp.h | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
> > > index 7c2b7cc9..344ff41 100644
> > > --- a/include/linux/remoteproc/mtk_scp.h
> > > +++ b/include/linux/remoteproc/mtk_scp.h
> > > @@ -43,6 +43,7 @@ enum scp_ipi_id {
> > >       SCP_IPI_CROS_HOST_CMD,
> > >       SCP_IPI_VDEC_LAT,
> > >       SCP_IPI_VDEC_CORE,
> > > +    SCP_IPI_IMGSYS_CMD,
> > >       SCP_IPI_NS_SERVICE = 0xFF,
> > >       SCP_IPI_MAX = 0x100,
> > >   };
> > 
> 

