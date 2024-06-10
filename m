Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5DAC27C55
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 16:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5ZVwjIOaq5V5ku6UjCPO2SyGYT7pllWaiMtecMSfuM=; b=oc+yRyz3oj61RydsuKsweVyb8O
	QAlf/jtzA0omyuNRtAh3FKBBmZRUfWDCQ6jEfZrHeVHJBxhN9J+dWUn2gtBZcW69inWsjkztD5QsD
	5VxZaSCsKAWlqwvRQy7MdT2Gig26tZsX0b3uv+K191vVxn7bNk+JBP5hBGO0Zxs5CsAS9s1GDt9kh
	MPkvzP1j3nlmyDxfy//sY8MZA3a+sChYqpOx9gJRIHRYV08ATTphAArer4imhspW62kmbc2254rVD
	NtOwuTQMsnofNSg3fsNwdnz2FdDO6JLXn/F2Q6OjXuaDh0pIIeMSbAID8d4yh1ADB9iqQfqEKqahk
	+RrzNuEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhyV-00000005ofK-2fOg;
	Mon, 10 Jun 2024 16:34:27 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhyR-00000005odR-3XkE
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jun 2024 16:34:26 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-6c53a315c6eso3400744a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jun 2024 09:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718037259; x=1718642059; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a5ZVwjIOaq5V5ku6UjCPO2SyGYT7pllWaiMtecMSfuM=;
        b=mavs+icmds4Tr+pygKa6qZxaVUESeVLColKlPpM1l6CsvDB1wr7ypan5od1FYbwsJi
         3kR6MQMlMTe3ohPghn+NIb/DWk0v04TXZsZxmBuypcCItEJl1px3eN2bc48idZzT1P4F
         InMiRvarRBXdV/4cpi2ofDc7JUbhaPQwlLT7imvJa4HzjOxjuOm9QNA49uakyZ3wCKdB
         YV0XPNL+FYbsWiNSDjkPhvnFQ1ZhckhQAYMIkYckPx7kqA64GhKFcep/XJkjcG3x4A00
         nmb2eAnL9vKmonrfDZ8/oHA+NfVZu5pgNLlTRlzhHY/QkEL1WzDULgRQVMyhUpzRaAOy
         XBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718037259; x=1718642059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5ZVwjIOaq5V5ku6UjCPO2SyGYT7pllWaiMtecMSfuM=;
        b=UOwwX5Hq9StTWkOloDLw/ddzvnl3h3/jcqsVjJk775LtS1q0VWmU1zF+o+yBecdVEh
         eq9kN16U5sHV60W3jhoE7qoJy7OD9CMypzYgLc97AAhK0AhixjDElgFUb8r3vmHIBUxv
         DpMZRYzZiXXtyKpioF2QfrYaQpfJXAHM9SzxcmVp4ud76WCoQUuOvAHVL/ZrUYraeVc5
         6qa1AWR1yrj8cdMEPNVK5DsqYGR3Oz+TzA/UdJIHSVHOe3H0vYpI9CQGiRbIGJhJA4nX
         VUdKC7JXXbLahZHAF9Pj/V7zoKJgwTgnMG+ad0it8vg3gXOHj2NyHxz6xbG0eweDIf0X
         YM6w==
X-Forwarded-Encrypted: i=1; AJvYcCViOCPX/Vi0AEoZLE/AgePCzHu48y1yIfLEVP+WvxYj9XTbed8dE8db3eswljr+mQrLPbqC/PGSj8LYrpTHCFC7lulJDxLCqQrsfdz6xQ3U96np
X-Gm-Message-State: AOJu0YySi37v+54xHcWESOjqSaUe8ckjJteRMAMRYocRQO8xFO9zwsT5
	uX7v/XaIpkNUA/fF7JQTIPLV6uRBYYA/8Ze8z5XLe5Bmzlt79vmpsCRiDWuYcFE=
X-Google-Smtp-Source: AGHT+IFiC+4Uq+TF9IRTc1VdS1ljR22BVVSd4bbzZX2VtGNhB8sV09mNvEyNr5N0F8tE3bUBY+/nLQ==
X-Received: by 2002:a17:90b:33d0:b0:2c2:fdc5:2619 with SMTP id 98e67ed59e1d1-2c2fdc52e9bmr3594071a91.31.1718037259439;
        Mon, 10 Jun 2024 09:34:19 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9b34:fecc:a6c:e2bc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2f8fbc87asm3495711a91.47.2024.06.10.09.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 09:34:18 -0700 (PDT)
Date: Mon, 10 Jun 2024 10:34:16 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jason-ch chen <jason-ch.chen@mediatek.corp-partner.google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jason Chen <Jason-ch.Chen@mediatek.com>
Subject: Re: [PATCH] remoteproc: mediatek: Increase MT8188 SCP core0 DRAM size
Message-ID: <ZmcrCLOCo0Q0W6AU@p14s>
References: <20240606090609.3199-1-jason-ch.chen@mediatek.corp-partner.google.com>
 <bc12b046-d2fb-48ae-bd5b-a6ef6cc78c07@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc12b046-d2fb-48ae-bd5b-a6ef6cc78c07@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_093425_225237_D6B59C61 
X-CRM114-Status: GOOD (  18.09  )
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

On Thu, Jun 06, 2024 at 01:00:11PM +0200, AngeloGioacchino Del Regno wrote:
> Il 06/06/24 11:06, jason-ch chen ha scritto:
> > From: Jason Chen <Jason-ch.Chen@mediatek.com>
> > 
> > Increase MT8188 SCP core0 DRAM size for HEVC driver.

This is telling me _what_ gets done rather than _why_ it gets done.

> > 
> 
> ....so the second core only gets a maximum of 0x200000 of SRAM?
> I'm not sure how useful is the secondary SCP core, at this point, with so little
> available SRAM but... okay, as you wish.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> 
> > Signed-off-by: Jason Chen <Jason-ch.Chen@mediatek.com>
> > ---
> >   drivers/remoteproc/mtk_scp.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > index b885a9a041e4..2119fc62c3f2 100644
> > --- a/drivers/remoteproc/mtk_scp.c
> > +++ b/drivers/remoteproc/mtk_scp.c
> > @@ -1390,7 +1390,7 @@ static const struct mtk_scp_sizes_data default_scp_sizes = {
> >   };
> >   static const struct mtk_scp_sizes_data mt8188_scp_sizes = {
> > -	.max_dram_size = 0x500000,
> > +	.max_dram_size = 0x800000,

Do you require to fix a "reserved-memory" node in a device tree file to account
for this?

Thanks,
Mathieu

> >   	.ipi_share_buffer_size = 600,
> >   };
> 
> 

