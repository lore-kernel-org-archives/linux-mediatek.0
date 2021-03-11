Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D51C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 12:39:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80613601FC
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 12:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80613601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/17ObC59LBCWt3GOu4A4aC9oW0ut3tX0RF+WkQrzGOs=; b=JOrtAD3g+28c0GzzISEqFP2mP
	hVkQVnKBybEQhLn43R7joG29+SxSvjVGM075LOSbFSLnQe0M9YYsHdWizc7QATdZROsc79qalCcSj
	SSw9gHugIm5oWFi0mXIVWlHsPc5Xi4Az3u0v+dtgcMF53kaQH7ru3fNBd2mG1eJfOsch98HAngsyY
	ZXMSxvagp7hoJ7jJGqAFXZfsgf3qvGD4a63qrU7eolbMZIrptz/9FUc7A6Ww7b2CQKg3vXLu+/AoE
	BINE8jKa/k3aUOw7H+Tn9yyRJsbCGRzYNcb/LlqJJAnctOSHelOUqei+hPt+ioFmEYsZWvHqARZvn
	jti7boQNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKKaq-00986w-LR; Thu, 11 Mar 2021 12:39:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKKaX-00982c-PE; Thu, 11 Mar 2021 12:38:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1801601FC;
 Thu, 11 Mar 2021 12:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615466328;
 bh=kiZx6X2u4fkLyNZRYPGNjVsvCuNlk6cl7UlHxmmB1sE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jJgsZKR1DIU5WZLHXgEhCqhcLpQQggquOzflc2nNlTmlTmFe+BkFxqUww+070b3wi
 j+z0snIPYD2fqtslQ8Xqh69Bsbhy2VdKjKDbYg3I+FeWIrhBzE+REU9ujYj8VLzAh+
 hEQbnLNv19tSPP1NcRrClSze0OI8yifmVNc4GfjUKlGc3Mub2axAY0fEVpr4lrfZiG
 4FxqF5g/duMRu8+oaSC7+lPoraPURFQjQp5RxQ/qKsB/Ve5DnB4BcfikdP4jsXNzC7
 zDk+Fr4WJxIU0bY040HiylXA0evyqD5L0guCEiIIbzise6wtDY/WCwPKCnW7r38KCA
 XdRVIIQBOl69w==
Received: by pali.im (Postfix)
 id 0C4E18A7; Thu, 11 Mar 2021 13:38:44 +0100 (CET)
Date: Thu, 11 Mar 2021 13:38:44 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 maz@kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Sj Huang <sj.huang@mediatek.com>, youlin.pei@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
 sin_jieyang@mediatek.com, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com
Subject: Re: [v8,3/7] PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192
Message-ID: <20210311123844.qzl264ungtk7b6xz@pali>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-4-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210224061132.26526-4-jianjun.wang@mediatek.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_123850_203389_DF01088F 
X-CRM114-Status: GOOD (  12.73  )
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

On Wednesday 24 February 2021 14:11:28 Jianjun Wang wrote:
> +static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
> +{
...
> +
> +	/* Delay 100ms to wait the reference clocks become stable */
> +	msleep(100);
> +
> +	/* De-assert PERST# signal */
> +	val &= ~PCIE_PE_RSTB;
> +	writel_relaxed(val, port->base + PCIE_RST_CTRL_REG);

Hello! This is a new driver which introduce yet another custom timeout
prior PERST# signal for PCIe card is de-asserted. Timeouts for other
drivers I collected in older email [2].

Please look at my email [1] about PCIe Warm Reset if you have any clue
about it. Lorenzo and Rob already expressed that this timeout should not
be driver specific. But nobody was able to "decode" and "understand"
PCIe spec yet about these timeouts.

> +
> +	/* Check if the link is up or not */
> +	err = readl_poll_timeout(port->base + PCIE_LINK_STATUS_REG, val,
> +				 !!(val & PCIE_PORT_LINKUP), 20,
> +				 50 * USEC_PER_MSEC);

IIRC, you need to wait at least 100ms after de-asserting PERST# signal
as it is required by PCIe specs and also because experiments proved that
some Compex wifi cards (e.g. WLE900VX) are not detected if you do not
wait this minimal time.

> +	if (err) {
> +		val = readl_relaxed(port->base + PCIE_LTSSM_STATUS_REG);
> +		dev_err(port->dev, "PCIe link down, ltssm reg val: %#x\n", val);
> +		return err;
> +	}

[1] - https://lore.kernel.org/linux-pci/20210310110535.zh4pnn4vpmvzwl5q@pali/
[2] - https://lore.kernel.org/linux-pci/20200424092546.25p3hdtkehohe3xw@pali/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
