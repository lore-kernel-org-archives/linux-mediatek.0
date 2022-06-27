Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D34C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 16:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuuLB19nPdoRWR6VTPDRWm0q3TcaRzfzIWmlZYHlX+I=; b=N7tpebotI8m/TvMhDkx1xWFUVg
	cciWgB0Ndpk1vSJWqA5PkU80MnSOcizPwaZ+geBmECgUTi6awO15El93Q0XbWJIbXEet7CEAsaqXB
	D+kQ3ncbiC8A22p/q05CAjyXR+TE4CRjdkjwY0gHzUsyFMZMGBSt3zcY55K/d70j4on2V3EV8eSVj
	8K9wYy9ARjTZZ6gVxJG6ZHYnwucQrqclB1STDrrVP6P2nmOP2EIj3OiTnv5wCr+PoP/O+Uy+F/syl
	pDCVMDXe/BD+DoLSylXogSTE1F19rXRp00Nz72ZcsgR5ybTLvpQ4orW3p+216NJpDMgiY5rrBs+r+
	h5rVPhDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rYr-001oRd-DV; Mon, 27 Jun 2022 16:26:05 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rYL-001oCn-42
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 16:25:36 +0000
Received: by mail-wr1-x42c.google.com with SMTP id n1so13791399wrg.12
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jun 2022 09:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EuuLB19nPdoRWR6VTPDRWm0q3TcaRzfzIWmlZYHlX+I=;
        b=iDIMSiufHbi+xgIRT5AbjsSLnfhOEsXV3kFd+8fH/quYNvQG7dlgBWGu1U0sm3BEnm
         RQJBcG7+v1RnRsxWwkMFS2H88CYK9VvDTwSfkRYvLi5+fywj/cH+XElUIc8x+ht4bLRf
         YMpg06mOK0hQnotBtt4KM3AB6QXpJxRuAtqXXuDhgZzLZnSdWDs1EY0tLS4to3F4YFAi
         UZwkYY/6X9658a5LeUujrjwO0y3HXNgnckW96rXLhFLCsOMx4iSjssdfTxDix+DcvnaV
         943KksdUMGA0W2A2iN8uxHIcK/25Gb1E2Q/P0McW3GlWkXf7WZBlBSHrA/cODWUG3swK
         moIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EuuLB19nPdoRWR6VTPDRWm0q3TcaRzfzIWmlZYHlX+I=;
        b=kWQowmYtabNPcZSZILLqEsa4Y+s3W41HjNRm4LWoxI5mr4Sf2Iq9aMs2Yvwvj9GkpT
         i7aSkzQvXdYOWMg7ZGs2BvU5Tt5dcu2TfuOAVnrRMDwumgfUKRdtNASZ6FhVmxYV3wOb
         o3p7uxEN6d7wFeLYnKNgmfWrQkUI5kPgMQIBBPHvl9PTaHykI248O69Oz0gGdYVBWE7L
         5Dw98OVJawbXEZ2lQTgZK4OmG4GO9IEFSswGm1RJUYVMPkHeK2hunThRT9nIrRMFDucc
         hpgGUjoUFakM82oVhMzjER6wKdIGwUxZ3qEXKQOqXwYLedhwvx8SV4o2XE3n3d4g6ti/
         5bOQ==
X-Gm-Message-State: AJIora9dxCF831iTzSrlNIqJt2QThCaMy7KUcsOY4J+8RI8d0ACrC32i
	cDeRCnZHyeDdMuvekR5YuylSZg==
X-Google-Smtp-Source: AGRyM1u5yKiCGRmmUpnMuvGGKabEaEMzTgNLY5p7btvY9mfVytbr0ZajDdU6octtLhEhes4aRkFqIA==
X-Received: by 2002:a05:6000:1705:b0:21b:bcff:39d3 with SMTP id n5-20020a056000170500b0021bbcff39d3mr12311802wrc.502.1656347130862;
        Mon, 27 Jun 2022 09:25:30 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id o14-20020a05600c4fce00b00397122e63b6sm14044617wmq.29.2022.06.27.09.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 09:25:30 -0700 (PDT)
Date: Mon, 27 Jun 2022 17:25:28 +0100
From: Lee Jones <lee.jones@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, johnson.wang@mediatek.com,
	hsin-hsiung.wang@mediatek.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mfd: mt6397: Add basic support for MT6331+MT6332 PMIC
Message-ID: <YrnZ+AUcYygsrQ02@google.com>
References: <20220627123954.64299-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220627123954.64299-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_092533_216128_167701C0 
X-CRM114-Status: GOOD (  14.24  )
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

On Mon, 27 Jun 2022, AngeloGioacchino Del Regno wrote:

> Add support for the MT6331 PMIC with MT6332 Companion PMIC, found
> in MT6795 Helio X10 smartphone platforms.
> 
> This combo has support for multiple devices but, for a start,
> only the following have been implemented:
> - Regulators (two instances, one in MT6331, one in MT6332)
> - RTC (MT6331)
> - Keys (MT6331)
> - Interrupts (MT6331 also dispatches MT6332's interrupts)
> 
> There's more to be implemented, especially for MT6332, which
> will come at a later stage.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
> 
> Changes in v4:
>  - Rebased on next-20220627
> 
>  drivers/mfd/mt6397-core.c            |  47 ++
>  drivers/mfd/mt6397-irq.c             |   9 +-
>  include/linux/mfd/mt6331/core.h      |  40 ++
>  include/linux/mfd/mt6331/registers.h | 584 ++++++++++++++++++++++++
>  include/linux/mfd/mt6332/core.h      |  65 +++
>  include/linux/mfd/mt6332/registers.h | 642 +++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h      |   2 +
>  7 files changed, 1388 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/mfd/mt6331/core.h
>  create mode 100644 include/linux/mfd/mt6331/registers.h
>  create mode 100644 include/linux/mfd/mt6332/core.h
>  create mode 100644 include/linux/mfd/mt6332/registers.h

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

