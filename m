Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8CDEE0214
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 07:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WEQeu4V+fx9iKJCnc40U1Yxg0mi4iI1gNY/vsGlCk8=; b=omlnCkriALa0K2rulFFeG3qxJg
	SEjzShz2ipvsq5SKWAntGrFA4S6DOnvHacOqswB9xGhnWDVFMp8n6wEaMYwJOp0PZaM5ucLM2ABmL
	Yoq2y2Y0M865klJbDAQXN7oak2Jmfh19dsg66mOojBSxk2XivYB4U4AbQR+zxMgHcdyzAEWujKULX
	+vtXzevGNW0mqc120wCe1B1X0dNFhUNrhYt4TUweCqILSOjOm5sTrsaBHwiySL6XTIEYmtih4qHe2
	veSSS9fmHzCQtxnuBiUfppGlkd6Wo0EN6rQNnv6f7pBsGcYdqe870eEqBnIGv/vDdIat5fXy4RdXN
	EMMloYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soI80-00000008WJv-3ynF;
	Wed, 11 Sep 2024 07:51:04 +0000
Received: from a7-41.smtp-out.eu-west-1.amazonses.com ([54.240.7.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soI5n-00000008W3s-05lf;
	Wed, 11 Sep 2024 07:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726040923;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=QZzlqQNzP6BYEm08sf/8gxgY9/9MBXoce+m3v5e46j0=;
	b=gfcRmcKYk3aOU2YHCJ25TmGLGGPFcwTda8Ww0AO37TqNNVawzTrs0xAmsfUVXhJA
	ZBGKK32ivqrfeEIE8+yR+diNDPh/hJjaxCU+91M3J/Pzd1eoG9gGSzMXbCqyMq31lcU
	KSdCkCY/9wcICn9NETKdxlU+Xv2i06lK7Bu771Rf0e5E1oKFuyxdRAGTDYnlZ3e5gVr
	na2OSSW2KnodJ+770FZuDL06QQnaBNl2ymFaQvwZ8eJnGi9SxDp26Zy+WKssiuYPZsb
	s3a0X/5JjZKFgZKpPegRRwafPGb9p2TGpSfmBqWr54x918d87c/Z0p8agfhcCea4p8Z
	qfcNXzPhwA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726040923;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=QZzlqQNzP6BYEm08sf/8gxgY9/9MBXoce+m3v5e46j0=;
	b=RDLkUYag4BqylbV6bGcG3ja+A8yMKbhNBKS+SeADKME7joIpnFLoWZoKqX43xc9+
	jKw7uq7tuAVEHI1k2WiH48RiICmWhGH7MQE67Hjx783UKE+3Ds3OAq5WDCPnG9xNYA5
	XdqvToUObEA9msA3hnnqkCyCLaP1/yul5R4K+xGE=
Message-ID: <01020191e00e5b01-2762c208-54d4-459f-b81f-b9cfbf9bd569-000000@eu-west-1.amazonses.com>
Date: Wed, 11 Sep 2024 07:48:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v2] usb: musb: mediatek: Simplify code with
 dev_err_probe()
To: Lin Ruifeng <linruifeng4@huawei.com>, b-liu@ti.com, 
	gregkh@linuxfoundation.org, matthias.bgg@gmail.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240907081351.19879-1-linruifeng4@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240907081351.19879-1-linruifeng4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_004847_258473_F66037E7 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
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

Il 07/09/24 10:13, Lin Ruifeng ha scritto:
> The combination of dev_err() and the returned error code could be
> replaced by dev_err_probe() in driver's probe function.
 >

> Let's,
> converting to dev_err_probe() to make code more simple.

Convert to dev_err_probe() to simplify the code.

> 
> Signed-off-by: Lin Ruifeng <linruifeng4@huawei.com>

After which,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



