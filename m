Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD59EC433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 09:10:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4188E6157F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 09:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4188E6157F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m1jxCmEAnF3XmmsF0RLg6V6FO8D4Na0Pv9J4Y1Hq8RI=; b=hORAPPKfOQjxKIa8B8OHNiFZE
	T/luc4FAJCtGyhykv94OFQixJk3GnRa8OwWQzS5aVkrHuIZUV+a4AimTAB4QxLEYRZ61Q5SrKP2Sa
	BYP+hkgu90oMn+sbgB0nzwACkdA1H7J7qWHpTPqCJ2xVV5CbfWSPon+K4RkONN6cSYC1Wq+MPoMna
	I48B/ODhomfA2SYOLK4OkhlRjgi9XmZqqYdSEuu7w2SLUc96t6s4TarvK1M9MHa7x+RwqeIB3FGid
	qC7Fo6vZt91EvDWhWySW7oJRghjNG1vPPWWdD8/63EgyUNLEfoa+58YGyFHEGKyU+LvMvSoAo5wbW
	oAjvu8viw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOzWb-00Gh0L-8B; Wed, 24 Mar 2021 09:10:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOzWM-00GgzO-QL; Wed, 24 Mar 2021 09:09:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D9EC619C9;
 Wed, 24 Mar 2021 09:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616576985;
 bh=jnRQ8XZk0O0MVorAp4ULBhBFeVXaOntVyd1dhKGu/08=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J9SxtN4tax4jDCHzd7N2lDjj/TnkkirePg7ebZQZFE14lMDngpFfc1MMbZ6M5yE8r
 ZU6Ta8fVY0MHn6l1LHxaI6D2AAMXJlLAkM4TVQ5Dvcu6KbTC2pPHoApRXO+X5bo1Sa
 tA9tgMnawow1GlrTJSK3cCEP0Hc+v8OgITKyw6liFGLoCmb3Xsq3zNKImNxbU1j76c
 ES1vqy2c4TYHlx3Yr/N2bgG7Ub5zFG3H2ThQztLUD2uL8cHZGyeKN3w/dhCLPeG668
 ahyRkW0k2tmt8dAU/PcQTOokqNikXMrX0K+wQvEGZCDo7QC80LmKqiBIpyAhHmBAUG
 4TKpcgPS9iGHw==
Received: by pali.im (Postfix)
 id 6F3F2A7E; Wed, 24 Mar 2021 10:09:42 +0100 (CET)
Date: Wed, 24 Mar 2021 10:09:42 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, youlin.pei@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
 sin_jieyang@mediatek.com, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com,
 Krzysztof Wilczyski <kw@linux.com>
Subject: Re: [v9,2/7] PCI: Export pci_pio_to_address() for module use
Message-ID: <20210324090942.kmhxnxzm7tz3ynuy@pali>
References: <20210324030510.29177-1-jianjun.wang@mediatek.com>
 <20210324030510.29177-3-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210324030510.29177-3-jianjun.wang@mediatek.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_090947_260365_52848FCB 
X-CRM114-Status: GOOD (  15.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wednesday 24 March 2021 11:05:05 Jianjun Wang wrote:
> This interface will be used by PCI host drivers for PIO translation,
> export it to support compiling those drivers as kernel modules.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  drivers/pci/pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 16a17215f633..12bba221c9f2 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4052,6 +4052,7 @@ phys_addr_t pci_pio_to_address(unsigned long pio)
>  
>  	return address;
>  }
> +EXPORT_SYMBOL(pci_pio_to_address);

Hello! I'm not sure if EXPORT_SYMBOL is correct because file has GPL-2.0
header. Should not be in this case used only EXPORT_SYMBOL_GPL? Maybe
other people would know what is correct?

>  
>  unsigned long __weak pci_address_to_pio(phys_addr_t address)
>  {
> -- 
> 2.25.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
