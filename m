Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E4BC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=O6iU2UBpB8WaehIdkibH+sJ5ZaABosqloMmkOnM+N80=; b=MzEU2RaMv59nzz
	jQu6HZDl6Adf14X/jtzddWYUOs88sTQ10CnW5Xu8XUJf1jVesvkQx5VXXi8mvx+SxNNAL+VMaEWnC
	0EPlAFIKuKC9q1FTLrtxQaD23r/1uCuRIvGXlAFTxS/tStRGGULkTrj+OJHEoasFSUgiGDBtGKEIR
	Ay1aiHGEohB4CR+/Y5pL+Riy/6gTKyem6kFzU5lUNsqVUeeR1ykaZtS1BGHM0y4XdNiCdsPSDMHXl
	k9+S9L69Z9Fvs2gZJduCthvuHDFwJ4vhSar4kbBM+JWDMQWo+14ekhMqsXECbWm+yUWcv84PX6R6U
	IQbbGHEH9AWMSG5PDzFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIT6-00BpeN-Ml; Wed, 04 May 2022 17:07:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmISu-00BpXt-7q; Wed, 04 May 2022 17:07:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D7066B82552;
 Wed,  4 May 2022 17:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52846C385A4;
 Wed,  4 May 2022 17:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651684020;
 bh=GLYjDWr+192rxC48wQ8VgGspiNE5r/eo1X3Mg9YC2x8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=H8Hoc5qYMvP4u27oz6zF7hCsz/eCyjoMiZuqzCfI6Tpar5ffkEgHLTBGdSLb4gliO
 rYXBbqd5/BTm7yApdjTQAdZ3KO3xyFIf060yv+VwBsSvu3aXe5Er1TLM75832BnuRN
 hoMd1RF50MYKELSn9odqDU8d8J2wdY9v+Eh28KZbkIgLaHmF0uhmTKY5IfYzDBEJ6a
 QXwpOZ4szXJMlLAmUaqmz/Z+DP6QBFa1HyNBp9TIRWl5ExYZh2fqDWKz53Lew5rASp
 HQhKuS/3hAfAptQ261aPe+LLlHkvVbDXjjV2vRQcT2fpSlnaC5EaTE+EZbJkUEB9pL
 9He7Nm+83TMDg==
Date: Wed, 4 May 2022 12:06:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: mediatek-gen3: change driver name to mtk-pcie-gen3
Message-ID: <20220504170658.GA453994@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220504100555.96007-1-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_100704_460424_DBA24CD3 
X-CRM114-Status: GOOD (  25.72  )
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

On Wed, May 04, 2022 at 12:05:55PM +0200, Felix Fietkau wrote:
> This allows it to coexist with the other mtk pcie driver in the same kernel

I assume this is a v3 of [1].  Please:

  - Follow the subject line capitalization convention, i.e.,
    "PCI: mediatek-gen3: Change ..."

  - Expand the commit log to say why this is important.  From a C
    language level, using the same "mtk-pcie" string in both drivers
    is no problem.  So please mention where it *is* a problem, e.g.,
    if it's a problem with modprobe or similar, say that.  Or if it's
    to make log messages in dmesg have different driver names, say
    that.

  - s/pcie/PCIe/ in commit log and other English text.

  - Add a period at the end of the commit log sentence.

[1] https://lore.kernel.org/r/20220422070908.14043-1-jianjun.wang@mediatek.com

> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 3e8d70bfabc6..2e665cd7e735 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -1021,7 +1021,7 @@ static struct platform_driver mtk_pcie_driver = {
>  	.probe = mtk_pcie_probe,
>  	.remove = mtk_pcie_remove,
>  	.driver = {
> -		.name = "mtk-pcie",
> +		.name = "mtk-pcie-gen3",
>  		.of_match_table = mtk_pcie_of_match,
>  		.pm = &mtk_pcie_pm_ops,
>  	},
> -- 
> 2.35.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
