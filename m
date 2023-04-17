Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C6DC77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 08:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYOzFsuWn1COfGneRm6WY2fOcnr/qQKQgzZ3kCyOVbM=; b=hXmJygBYJWPzWMn9nvK1U0DChR
	2P0inmlznNvXzPySS6n3YLp6sJdbsbob44wXO6oVFgSu3YwhfUKCan3rFxcEFLQlXapEh0t8pZM+/
	5nawkOJjah9dWFe1z1f7IvKSFcucCdtGh4PkEsDPPkQDDBYQGSdIZShMMOSVTewGXPdDj8Y+wHXHA
	rfhaJ2qG+n73qPsX4iJLJUCb/fKlRu0+rXf1Y2UHKMYXGKE2wDbV1pKRUbetYo4eR9HWh9QeE0dI/
	jcFdMgPoeKApJlUhDUR5X4+w5gJZ0rH7vRRt3XKZtpSIVqRK2hoTFOHNN8L6iq0+XBmSnxTWPtfsi
	THMkYW5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poJXc-00FFPE-1H;
	Mon, 17 Apr 2023 07:44:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poJXY-00FFNd-0k;
	Mon, 17 Apr 2023 07:44:45 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AD2346602F91;
	Mon, 17 Apr 2023 08:44:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681717482;
	bh=4ju2sjdECGeN8KyDD+a8vUNcwUjOKUkgswflyYi99Wg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=md97EAfMLICLqvYW/f+XUwyoMyVlvKHug1PQ/NPDtwv+z02yXSSAB24+d5spuEXxG
	 OMYX1Gt2+6g6KY/ZvjT5sQ/TQaGoQtjZFPLuQdAOW5RC/IO0eelyn/5eeOgZ5+SRDh
	 zKl1F5FCEZSyBAWVq3Td3sl0pH3wbh6IqdsCL/oRw2mM9ln1izz8BA+rdnamGIJFTL
	 +QckzYq0H5ePOVfjZ24MhoV95jSxUwF0rXH7VtLxh0Z48j1DTZGN13FkYqVwXxvmk4
	 aeQ57ikMa3pS1XWYHJIKEKSZ9F7bJxT9BJ0HVBtjksrzvwIT4sEnAyZ8bVhR/M/1yb
	 +jH9qa2cndHKQ==
Message-ID: <ad088fd1-d96e-76df-4c9d-07e0929813f7@collabora.com>
Date: Mon, 17 Apr 2023 09:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] media: mediatek: vcodec: Move a variable assignment
 behind condition checks in vdec_vp9_slice_single_decode()
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Guo Zhengkui <guozhengkui@vivo.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Haowen Bai <baihaowen@meizu.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mingjia Zhang <mingjia.zhang@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <b98dcc94-13f3-a6cb-f5bd-f1f8644d87d1@web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <b98dcc94-13f3-a6cb-f5bd-f1f8644d87d1@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_004444_394572_98B20965 
X-CRM114-Status: GOOD (  11.12  )
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

Il 14/04/23 20:30, Markus Elfring ha scritto:
> Date: Fri, 14 Apr 2023 20:07:01 +0200
> 
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the function “vdec_vp9_slice_single_decode”.
> 
> Thus avoid the risk for undefined behaviour by moving the assignment
> for the variable “pfc” behind some condition checks.
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: b0f407c19648ae9110c932c91d6e1b9381ec0aeb ("media: mediatek: vcodec: add vp9 decoder driver for mt8186")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



