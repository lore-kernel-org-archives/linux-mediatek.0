Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14C8C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 09:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fcdn47qnpy7jQA2VAKVti6I2T8CJD+Ev7B3cm0FYmC8=; b=yQhN/UCfoH9IGH8c2TU7B21TDK
	rA2gsCai82PGmDYFpfTb/snrGUy3asM2iphyN+TNiiF8U8Ui7quW/tWa5qob0G9CwPqqckn1S8Jdu
	vXLwTK/nSxEkGlwAA1udCWuyUXKqfBjq2KUYC9i8hOWvhnKQtQj5pC6gAtyeyw0aQQg5Fyd6afPF+
	CWjeUWcsKF8flaO379KjxGX71RXvxzpl/owDlPMv7gruPjM1H+SuwqF+IZOa968yJVljrhGozkHqF
	pkftCdNA07LjvbC/KkJcxtk7vTnLBDENEqL7CMwTTciXUJcMT8pKNuM2nedIO8urAKcRais/iEa6I
	rYqDe5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0hIF-00E3dU-2p; Fri, 24 Dec 2021 09:55:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0hI3-00E3bC-UC; Fri, 24 Dec 2021 09:55:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0FB081F40AF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1640339705;
 bh=g/qrKxbq81374OPNyBlN5b0Uw2S7uiZ13C5P82NahIA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XD9uQAp0iU8aU0GqQ/lNnkmvJNxU383e2Yc/NoWpqgEgWtz7InHOogu4bzmkWBmeE
 Zv0AUV3njiViMoqEIJxm7Yi2TDvE5vn2s0jMlZ21Nv8iRQcjvZALBP+DljqbrEs7jc
 /BtqdCo8dWLYheyk9rw6E3xMnUh0OKATLitRDINxJnvomKWzBQa+GXfO5lPEa7Juz7
 3eahIa7UqFFd1PMGGRU5x0IHymST1gnfE+ZAhfwxk0nxZ40ZG11/hoQ45Wxn5Ck2id
 F53JT34LitY7UVJVR3z7hf1qnp54N7/adwr1LBN8WjXLLePm8iKVPaAaxR4oFqehSK
 WnU9EONoPKT9w==
Subject: Re: [PATCH] phy: mediatek: Fix missing check in mtk_mipi_tx_probe
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211224082103.7658-1-linmq006@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <badadf88-f912-9794-774f-ec344f2303c0@collabora.com>
Date: Fri, 24 Dec 2021 10:55:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211224082103.7658-1-linmq006@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_015508_186959_0DFF7ECF 
X-CRM114-Status: UNSURE (   6.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 24/12/21 09:21, Miaoqian Lin ha scritto:
> The of_device_get_match_data() function may return NULL.
> Add check to prevent potential null dereference.
> 
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
