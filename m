Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FDFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 15:54:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 995D5610EA
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 15:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 995D5610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L5QTW4MD/BQLJR3n4GNRi/B9bImhS4idRZ0L1PY1oa0=; b=xAZbsm1Wsmlq6l
	U9jyqKes+lfO4jM2veHlDDLYtEP/JbmpS4zb2G0aFgA27ma0ovTE0PfeZbWhiFOczUQbtzO+SJFk6
	cydwewKdrgLy+LUHsFsXBv2XEpilz1p0RUERtmbZZWfhwn+Qz3VsTboLgBMZOamie8wyX1hFGXzdh
	2qTjCg1RkinxT3QoqWf9hBtEcaWxEgu/ddbeeLscDwp0AkZF6ss0SEwrRkmorBKpOKehz67WjbMh0
	hAV1hVBTaX5jwDl86Y/Hc52YkEninBmVMGPMmqXqs1wfwghLYkIDZuOzWUk8sxK3mi9oDqz8N7NuJ
	XBtzN3S/4+946+D2llOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1magaN-00HSTm-RI; Wed, 13 Oct 2021 15:54:31 +0000
Received: from eu-shark2.inbox.eu ([195.216.236.82])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZxNi-009wSe-Ke
 for linux-mediatek@lists.infradead.org; Mon, 11 Oct 2021 15:38:29 +0000
Received: from eu-shark2.inbox.eu (localhost [127.0.0.1])
 by eu-shark2-out.inbox.eu (Postfix) with ESMTP id 4C0E71E00603;
 Mon, 11 Oct 2021 18:38:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1633966701; bh=o7R0Au5IFBkQndLoGctiAVfvFZ84avgC7Sm8RCkpCHk=;
 h=Date:From:To:Cc:Subject;
 b=B0UNSCIfEAkXeD0imeYbLIZ2o3/77naYp9Rc0OxB3p4mxIm2950NAJVsrNwIV9XE/
 b9GNaZZXYIJloxpOmW0BMZnB51D1cc23+41PeYTumkxHoL2Xv9kyovx7F/OoPR7EAv
 B8MGHnN3GjDQrYHf+MFT1rscvze3AersbfroEQeI=
Received: from localhost (localhost [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id 42B7B1E00602;
 Mon, 11 Oct 2021 18:38:21 +0300 (EEST)
Received: from eu-shark2.inbox.eu ([127.0.0.1])
 by localhost (eu-shark2.inbox.eu [127.0.0.1]) (spamfilter, port 35)
 with ESMTP id qsX0R9Y6rPyC; Mon, 11 Oct 2021 18:38:20 +0300 (EEST)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id 9B5021E00600;
 Mon, 11 Oct 2021 18:38:20 +0300 (EEST)
Received: from pc (unknown [2.58.44.26])
 (Authenticated sender: arzamas-16@mail.ee)
 by mail.inbox.eu (Postfix) with ESMTPA id E6C001BE01A9;
 Mon, 11 Oct 2021 18:38:19 +0300 (EEST)
Date: Mon, 11 Oct 2021 18:38:14 +0300
From: Boris Lysov <arzamas-16@mail.ee>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: <linux-mediatek@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <matthias.bgg@gmail.com>, <qii.wang@mediatek.com>
Subject: Re: [PATCH v8 2/5] i2c: mediatek: Dump i2c/dma register when a
 timeout occurs
Message-ID: <20211011183814.488ed866@pc>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: +dBm1NUOBlzQh1+kSn3cDQIzqylVPp7o/vvJoxAn4GeDUSOGYE0FThSzg25wUQ==
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_083827_066341_91457E07 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 13 Oct 2021 08:54:30 -0700
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

On Sun, 10 Oct 2021 15:05:13 +0800
Kewei Xu <kewei.xu@mediatek.com> wrote:

> When a timeout error occurs in i2c transter, it is usually related
> to the i2c/dma IP hardware configuration. Therefore, the purpose of
> this patch is to dump the key register values of i2c/dma when a
> timeout occurs in i2c for debugging.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: Qii Wang <qii.wang@mediatek.com>

I would like to test this patchset on one of supported platforms, an
mt6577-powered device. This driver requires a DMA base...
> 	i2c->pdmabase = devm_ioremap_resource(&pdev->dev, res);
>	if (IS_ERR(i2c->pdmabase))
>		return PTR_ERR(i2c->pdmabase);
... however I am not sure what address should I specify in the .dts file. While
other i2c busses supported by this driver such as mt6589 [1][2] and mt6797 [3]
have designated DMA for I2C, mt6577 seems to lack dedicated DMA engine for I2C
[4][5].

Do I need to specify the Generic DMA base address [4] instead?

Worth mentioning I brought up this issue in the past [5][6].

[1] ALPS.KK1.MP5.V1.3_EASTAEON89_WET_KK source code (downstream)
[2] MT6589 HSPA+ Smartphone Application Processor Datasheet v1.0, page 869
[3] MT6797 LTE-A Smartphone Application Processor Register Table (Part 1) v1.1,
page 1796
[4] MT6577 HSPA Smartphone Application Processor Datasheet v0.94, page 547
[5] ALPS.JB.MP.V1.19_MBK77_TB_JB source code (downstream)
[6] https://marc.info/?l=devicetree&m=159949247901831&w=2
[7] https://marc.info/?l=linux-i2c&m=159939730714187&w=2

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
