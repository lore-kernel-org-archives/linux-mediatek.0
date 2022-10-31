Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4065DECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 13:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLiZKuvP0SUtt1RsXSrtxdXyeMaEyq942pKps2yyHEI=; b=pSXfBAqzrejcWscznL8ezErGEN
	Td6mgq6m2Ey3UoolNPxEr1KHvgwKMfRpSBt2Als6nZ4i2vyXKNi9J+P86Tm0fbaJOdNHqenf6y53a
	kO52PHsXMrkrqUKibq285dT7/oWLczT80SLXpYjr1khsM6ofE3sAdLd09P4vpPsQw+EsdPDPvczhQ
	nVjY6sq25l9Qdeyo0KrZmXlVuQuC1ji+e8YfTJGtEKtxtaOI/+vm+FCiw4h4ZLuASo/bOBQRuWwYA
	xdbFZuMY4dASuHbchgMD7g+Q9MFZ6meAxX7zMtSqXFbAj3AuxZMLE2bDDkY3uBCWF4tHWhuuXZwCT
	iz2VQGsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opVE9-00C983-16; Mon, 31 Oct 2022 13:53:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opVDv-00C950-O8; Mon, 31 Oct 2022 13:53:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5E340B816D4;
	Mon, 31 Oct 2022 13:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5920C433C1;
	Mon, 31 Oct 2022 13:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667224385;
	bh=L+f9q+7arbkRsu3om4S7s3pvQcwEFSDo9OD2UXdL+YI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YVm6mCIoQSKHGVK0lw6agZNIgY/5U+amyGkJ1TWE6u/kIcOIGCR3AY8qge4B84BYb
	 OhZD4ExqRb3YKG3ocrcwIDZ+5ArzkBt6wWRtbphEg/ceaQ/pIW70lXCc8IDkB/WmjP
	 RDN2FEsOwIE9O57xKg7v+nyUwZOpO46xUVKq/1B/Fs8xccwhp5I2Ot+Kgji5LcdVsa
	 PggXqSl8fCMh/1++kF7nFrBLsfKnxyFKp7n8/wh0Y9kxXp/0RwZOZz4VcMnxv8H+b3
	 X2fe855JdpR+QWL05TrteDAUfq66l7SnlHjm/Q2Iz7xjxdvMrPufg3+nfZwOQmOnFA
	 ofAhsByK0yccA==
Date: Mon, 31 Oct 2022 13:52:59 +0000
From: Lee Jones <lee@kernel.org>
To: cy_huang <u0084500@gmail.com>
Cc: matthias.bgg@gmail.com, gene_chen@richtek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	ChiYuan Huang <cy_huang@richtek.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] mfd: mt6360: add bound check in regmap read/write
 function
Message-ID: <Y1/TO+mOrwjj3D33@google.com>
References: <1664416817-31590-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1664416817-31590-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_065307_957212_9257A93F 
X-CRM114-Status: GOOD (  14.14  )
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

On Thu, 29 Sep 2022, cy_huang wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Fix the potential risk for null pointer if bank index is over the maximum.
> 
> Refer to the discussion list for the experiment result on mt6370.
> https://lore.kernel.org/all/20220914013345.GA5802@cyhuang-hp-elitebook-840-g3.rt/
> If not to check the bound, there is the same issue on mt6360.
> 
> Fixes: 3b0850440a06c (mfd: mt6360: Merge different sub-devices I2C read/write)
> Cc: stable@vger.kernel.org
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Since v2:
> - Assign i2c bank variable after bank index is already checked.
> 
> ---
>  drivers/mfd/mt6360-core.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]

