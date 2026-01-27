Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629D4D2F000
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jan 2026 12:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnKUNKgC9n1L+52LDMIVaUnP6eSUd3P3loql+K+A3bM=; b=qlZ4pK1Ltq1xnXXNnuI3Iwf+yY
	zxefd6yiQBadB9AZ1Jjxzb/fFeuCxnviVSFP14KVSOXsga0K78bpQMPxvoW2UJQhK6N1T9GoYfMHA
	Mos3j+sjUFcFgGIZESXnY24FF37mk20+IaEvF9BqaLenqVr7hn6i7BHoPqjDyT4DhtUFg+UsKoXUO
	4VTxxSpJ8Dc075Z4goXqu+7/3ZrLWL/G02Nod2PXLtm+sdv6DdWdrPyvRa0Pw6CDJWVkt6MM+dXsH
	JbTV30/2pMEDGzyLI0AUo0L9l7J/XgphmOlr5SvbPuwqDsi/pvGr8LfuHfl9O7j1Vno9wBv+S+t0z
	3wLOFeAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhr4-0000000ECIV-3BBQ;
	Tue, 27 Jan 2026 12:07:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhqx-0000000ECFe-3EyP;
	Tue, 27 Jan 2026 12:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769515644;
	bh=iQwdKKLixb7SvytVlVxclzM1hBQ6drnDy7bqpBAZJAk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jImLZCb+b5FuItJJDxwiMl1V5WBvIQrrt2p2NvSNCEBggCN6aTE7w0ifR8sYTnEAm
	 C7R64H6K1eiKOxAnofCeLdeeQBIAva2iJVQta17ecxXQRb0RmWtYN1Zs9U6y2Eeen+
	 OGcBljM1jdFMp6p6G9qijeAzuvsQfe6ZPdmCrpL9uXB2TlwouB9cv6wj0JwoS/1Wq8
	 E9Ntm2tUBNc9f+6L2jXsFyfUmGar7yNtcVYEnDCJQDhjNyqw/dAkYTKneOi3YK2PvY
	 7GEdeG4ngb/nHisDmoURhqx54CoGMyZScchVRYB+WBu6x7cZVwC8JCU2UB6toZhqvo
	 rkBq/Ic1oj2cg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8136217E0117;
	Tue, 27 Jan 2026 13:07:23 +0100 (CET)
Message-ID: <8f1fcdbe-c3fe-4e1b-baa6-cda7006c2863@collabora.com>
Date: Tue, 27 Jan 2026 13:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/10] media: mediatek: vcodec: Fix media device node
 number
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Yilong Zhou <yilong.zhou@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
 <20260127024248.18406-9-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260127024248.18406-9-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_040729_410706_288FFE96 
X-CRM114-Status: UNSURE (   7.92  )
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

Il 27/01/26 03:42, Kyrie Wu ha scritto:
> change media register device node number to a correct value.
> The vfd minor is used to record the number of registered
> video device nodes. The mdev_dec.devnode minor counter is
> used to record the number of registered media device nodes.
> 
> Fixes: 41f03c673cb7b ("media: mediatek: vcodec: replace pr_* with dev_* for v4l2 debug message")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



