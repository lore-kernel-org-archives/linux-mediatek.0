Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE640C54E49
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 10:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLGQlYX+Cg/84wHjKtrG3T4mSqh3CePE+HXOtMprDuY=; b=MeaxfeBN2+Ek17d0TEp9QCKWub
	G5PaHsnYnsVdNXBaznANauigzsMh+BtG1uc7QSO2817/rx8Waie5lBCQNJOp5biSVMIv13ZI8WHkF
	fXyVTR486Xe8iyXs29xsXCgMoeZqeB1FZ4wETNUGfQdcfawevZXTWAl34C26aeO/NckKyXfKhFt2f
	jXhlKENxVYj1nI0xsrR+QNw67xHlP1PCiXIxj3P3JXS8nvXhcWG2yv5V611HqocHxyN78dGQYcfJZ
	h5wt8eRNkCWJCQc4sX3hByW/0vLHYZJPMxKwEc091rhtln8thgW1gNKhL2VSZcFwIhjM2pRkS6+v7
	B/KbdBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSqk-00000008w5n-166e;
	Fri, 23 Feb 2024 10:32:18 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSot-00000008vcZ-3UXd;
	Fri, 23 Feb 2024 10:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708684211;
	bh=oksfU+fjc/xYMcDn3tKuSUAuIA25aWOSa7trmb9oheE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tU/pwnqtf19cXHHYt1duEeCMAfVyO//g1/TgqsTYB9Ebx++6plCrQCDjvstojhAf5
	 v0ukIqQhDkyu7HyZQflSangDQJCtC/Ey+OqWJiwsAc6s8uowzyP1mv9npoCgUC7Vd1
	 2VbYQVbaQvZL1Y0mxRy9+VSh4SoEFHDnOySXbHTbcKcjvg0fBw7uWUG9xFjy0ddhbW
	 YJJLWBlqzX2QFtOrFB0Y/+sIv83593pRK/y/aeFVWIrsqFvCtByXlaSGP4C9WbCX7A
	 +sU/xobO40rWRVkhw2q+wWX04YQr6hnsF4KXBp5TbfYr6eZ3lgRSnEtQshhnBWpyA+
	 w4PfC7SSPL6sA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 25C5637820DC;
	Fri, 23 Feb 2024 10:30:11 +0000 (UTC)
Message-ID: <0a09cbe4-3a36-4d44-a826-5b1dbab6dd49@collabora.com>
Date: Fri, 23 Feb 2024 11:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] soc: mediatek: cmdq: Add cmdq_pkt_jump_rel()
 helper function
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho
 <moudy.ho@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
 <20240222154120.16959-5-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240222154120.16959-5-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_023023_391852_B063D832 
X-CRM114-Status: UNSURE (   5.76  )
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

Il 22/02/24 16:41, Chun-Kuang Hu ha scritto:
> cmdq_pkt_jump_rel() append relative jump command to the packet.
> Relative jump change PC to the target address with offset from
> current PC.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


