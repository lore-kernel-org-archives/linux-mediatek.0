Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4699DC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 10:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlcEqE0ke2FCaouRpi3dpA3z8DfmtsgAf0plYIvm8xk=; b=YhYLVNAK8D6IoO3CeT7LxFwQYB
	mNWY2aixmVpmGEiwr4Cf/dG+VgN4XsMEoXLHDG+jWqgpkI1r8rsxkNfIuAAXwc7WXktbnOwIjwpHo
	2OET6Jec8WOmIJRyBXg92lUE70XupY7trAL9V8fovfKJ8ynztzolXQqE3nuGxWuCP6b4vjsv88wYU
	0lk8n4rbzJdwhqPQsGx1VjurhKWpQuqo2ydd0VcWjzTq0JCpnUIsvNo8jDYu0FRG7+ObPv45quEno
	TOC+aFE71SUIammUh8Bw+ItatHgrtIbx/G9S4iZxJUeYwEU+l3D/ZPxfTvm0ULwZiommpv+u5Dff1
	drVziMQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovylY-003Ppj-Pr; Fri, 18 Nov 2022 10:38:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovylW-003PoP-HR
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 10:38:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B6DE66601639;
	Fri, 18 Nov 2022 10:38:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668767913;
	bh=Q9cDNMUrZzaaoL8GfB/cLKhDVomk3bjfsVkS+dBopu8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=edY2m/6dcmzj22RlipFIaeO9mO84SReGq0zRskP7/cd0WHWU+EDIT4mTNPrQkWrlL
	 d6menzinaCQz0Xx6zhtwS0vlRWT24HKTXobwmIPISibVhSgD9uVpB71D8wfPvN30g7
	 a4ekSd3NWzAKKHVO5Wba20LmwuNhTCPlb4RFjE6I7SycNH9omosuVuH+xXCAfoBPr4
	 3tat8HR8sOXm7X9a42d8lUSyU8hHXP0h5LY+GYcC/3LNZQJrcfkwrBiGMmFY4mN7jR
	 9SqWUMTGG3LZiYUOBV2/amgltL97ggBbQCZ02DiH2oQil4nSsft72Tx7zvVvzDA2PT
	 u9FuN/6x1oPvA==
Message-ID: <21582859-513e-953e-37f5-49b6cc0941a6@collabora.com>
Date: Fri, 18 Nov 2022 11:38:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: Remove unneeded code
Content-Language: en-US
To: Chanwoo Lee <cw9316.lee@samsung.com>, stanley.chu@mediatek.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, matthias.bgg@gmail.com,
 linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <CGME20221118044223epcas1p12eab9a6fb08ec382625b3fb43f401e07@epcas1p1.samsung.com>
 <20221118044136.921-1-cw9316.lee@samsung.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221118044136.921-1-cw9316.lee@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_023834_733784_04B99163 
X-CRM114-Status: UNSURE (   5.36  )
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

Il 18/11/22 05:41, Chanwoo Lee ha scritto:
> From: ChanWoo Lee <cw9316.lee@samsung.com>
> 
> Remove unnecessary if/goto code.
> 
> Signed-off-by: ChanWoo Lee <cw9316.lee@samsung.com>
> Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



