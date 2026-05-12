Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE26ECD4851
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 10:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmFvmlOx2BLdUyJ4yewuhyKhlGjbS/4yGn66ucZ8zh4=; b=wkP4DhEXlhwxOI6G5HmXDosf5F
	x8i0b8QkYuywZy6O853us0uwXpTICYevyVpun48BsAQziERKp5sXF9g5qfi+r2qiP/5hbseZ6zlMC
	9OODmnvhm7SJ81EnehYSNOSQXcycbAzi/E3BF35xD/uEeEyFGs4941jh1GbWrw4W7Y0MRdsyO+90p
	hgMB9cSwB5XgZzjumxG/VWAd5aB2bUnKj2S7LYcsTh5P5bg2ZvQlZUMFDAh0FCW9lkkg0VsTpPaFa
	agVi/KFfuOvbjihasnUNVeKOrYykSme9GXzCihKcu5Lii08zumkzIZUUr47d2Q/HB1O1Fv/ZS/OH0
	/BYUS42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkZP-0000000GSzb-3lyT;
	Tue, 12 May 2026 10:42:35 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkZM-0000000GSyt-3oJf
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 10:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=LmFvmlOx2BLdUyJ4yewuhyKhlGjbS/4yGn66ucZ8zh4=;
	b=etIvsHbxSod4Uuck08SumNoE7SF6uTjLvqRgyoU9a5ma4K5nRaZ34QQWK+PtFw
	eGKhpc/7Pr4kEub1QkEclz8J5OY/UZdyFHXA3hPDYxr88bvftLwCw4dgqVG+wb4X
	I39ZukDllVZoh3q9raTp2KPtHyNXYFctxjpHIRmx62iTk=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wC3KAnjAwNqLBufAw--.49467S2;
	Tue, 12 May 2026 18:41:40 +0800 (CST)
Message-ID: <8e5dacab-9698-4d65-8101-f5d680760cbd@163.com>
Date: Tue, 12 May 2026 18:41:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: mediatek-gen3: fix incorrectly skipped pwrctrl error
 message
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <error27@gmail.com>
References: <20260512103347.1751080-1-wenst@chromium.org>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260512103347.1751080-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wC3KAnjAwNqLBufAw--.49467S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr15tF48tr48ur1xKrWfKrg_yoW8GF4xpa
	yDKFyfAF95trs8ZFsFk3W3u3WYgwnxurW8Gan7Ww1fArZxCFyDK342934FgF4xtrWv9w17
	X3ZFya48GrsxuF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRK-ewUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwwVV+GoDA+Wi8wAA31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_034233_305789_D8A68E44 
X-CRM114-Status: GOOD (  15.69  )
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



On 5/12/26 18:33, Chen-Yu Tsai wrote:
> When pwrctrl integration was added, the error message for when
> pci_pwrctrl_create_devices() fails was incorrectly put after the error
> goto statement, causing it to be skipped.
> 
> Move the goto statement after the dev_err_probe() call so that the
> error message actually gets printed (or saved if probe is deferred).
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/all/adjNaKB5KGpl6qIp@stanley.mountain/
> Fixes: 1a152e21940a ("PCI: mediatek-gen3: Integrate new pwrctrl API")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Hans Zhang <18255117159@163.com>

> ---
>   drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 6f0ae946d501..ef64778bbf8b 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -1221,8 +1221,8 @@ static int mtk_pcie_probe(struct platform_device *pdev)
>   
>   	err = pci_pwrctrl_create_devices(pcie->dev);
>   	if (err) {
> -		goto err_tear_down_irq;
>   		dev_err_probe(dev, err, "failed to create pwrctrl devices\n");
> +		goto err_tear_down_irq;
>   	}
>   
>   	err = mtk_pcie_setup(pcie);


