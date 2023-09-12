Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2599CA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 10:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XS9Lyuf96Cfo7/4OBhUsL7dzFqpU4NVFzrPQtL97l1I=; b=YeEmvUicPVg3S+RMMKyBel4ykA
	XaUg0jl9PJ+Qzm3nsPKxEyIK6FUts5hE8LZjcwfA0qyBFXyIkb/Cg3mhl8JsvWMDU834Iiq7fedfX
	wi0whpDGT5V6q1Z/z3JxWmqEbBJOYQhuE+sLTfqhIwpkuSEN9wgaYw2NIazolKdWnUFvk0XcGA+PP
	jr2Gw3rW0KYgmtm56AWyeDWJOxTLpje7WZq1pzIdARuSJcKsKqxiKoNCgycg+pyoGbuqqHQXunVli
	1qYyrIbZO01NIzJKN5gssbsnMuY9XjI+SkCi9U2xyeD7EKtMjX1jZQ2Wim7EBhjnWqbI0mbxPQFXB
	f4C2UI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0EW-002qjG-25;
	Tue, 12 Sep 2023 10:03:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0EU-002qiE-2I;
	Tue, 12 Sep 2023 10:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XS9Lyuf96Cfo7/4OBhUsL7dzFqpU4NVFzrPQtL97l1I=; b=AX30h5NT/yqUDJrQC2mdPalmks
	itqnTBBw7vJxw7Hzj1PUUMn+azQcNGwZelq7g3i7g5A0od2AnQNfB9wj0UZiQlKsXmzyWZ1YCXL1s
	W8DkvZJ2fpItq7C8jI+GYPyAAstFqIwoh7HwTpkaZbeYy5biGzI88KEXZqaECyjCuKyyz+As+8aaT
	3rDKx9xBpVEFmxJ8JWtWg8mYdXZ+SmSTrDYCwfYoYdpkDcs3k2qzh/Jd2lVvyzdsFn/cPvcB7iDfr
	uyPOh7C3QBo48pwiQHa5yCZYvtvC8jVAP4DtojV73NSN638e/gITvQ1X0qRMPS21YSjddYQHouThD
	q7/cXZHw==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0EG-0060zk-0F;
	Tue, 12 Sep 2023 10:02:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8E98B660731F;
	Tue, 12 Sep 2023 11:02:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694512964;
	bh=hlC/1svFIdbWKp9qBrWrxSwCb206P2KQbs899SSIBEM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=axNIzIf8fBuLT7XaoCVuCcBtpEjRhM5FGjyx4Q6VZtCqsKPfDZiAcjQUqfPmhqAJi
	 Cj0KGiBZHvSxw72C4kkMeaJYMNFdi3vU1JrT04eHb6UvMhPdrVszZx9Z5tMtMIkEnj
	 /IbD91PoMWitD+vAyU2wal1Hv4vK5HQjXlH0pQd0IEPfNTQEAmVHS/mD3ov+07imLi
	 Ks6uu0JcRWDFVccA9mimOWMqPzsp+ASkh1PAlEqMpB3FJQvJIejacO1UmMCaUNXM2z
	 4PS8Sy7UH5QGNreiqs5YvZ1QXac5aOYufl2TtepfvmE3JVDhXX1MJUgDERdZij9n3/
	 fviC+8FSErEGg==
Message-ID: <e066650a-edd3-2c53-7041-50f4fbd272cb@collabora.com>
Date: Tue, 12 Sep 2023 12:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/5] clk: mediatek: clk-mt6765: Add check for
 mtk_alloc_clk_data
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, wenst@chromium.org,
 msp@baylibre.com, amergnat@baylibre.com, frank.li@vivo.com, robh@kernel.org,
 owen.chen@mediatek.com, mars.cheng@mediatek.com, macpaul.lin@mediatek.com,
 cw00.choi@samsung.com, u.kleine-koenig@pengutronix.de,
 wendell.lin@mediatek.com, luca.ceresoli@bootlin.com,
 kevin-cw.chen@mediatek.com, ryder.lee@mediatek.com, wenzhen.yu@mediatek.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230912093407.21505-1-jiasheng@iscas.ac.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230912093407.21505-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_110247_005311_519CD33D 
X-CRM114-Status: UNSURE (   8.89  )
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

Il 12/09/23 11:34, Jiasheng Jiang ha scritto:
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
> 
> Fixes: 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


