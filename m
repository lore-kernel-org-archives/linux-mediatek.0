Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7550CA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 10:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQTzJqZMnYxaerKGUxm5zno/oxgmLUADNsxHpkBjIpk=; b=uzvLAu74+0+13XGLQeHyP445NI
	CqYFCYvA1ZRDWRJaKBvXF+U73thp+s152inIsl5cFnbo+XRj6QYF7ktiH5CiKpd80nHutUwuvo1Bk
	dN2+r73WbHzhADx618r1KGLzzeYprGsyYRq/ksi5kwSZzg4gXwgeVkXLneK7zD2jXfSN7XJV3rPHD
	uW67sNew+kTThIEoy4SqfYEHo6kOxsMKAgDVduSoMRCvCKMIoPF+/gg72ApbZLYk+ViSosktZK0q7
	2FfxhnBq7qZr9xHqfU9lrfUtcgBfPESmqECmF6/9zcX5c6VCLPsB9WbXbMDa3gVper5c8bsD8C2x+
	pMEtILxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0Eg-002qo2-0p;
	Tue, 12 Sep 2023 10:03:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0Ed-002qmd-2r;
	Tue, 12 Sep 2023 10:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cQTzJqZMnYxaerKGUxm5zno/oxgmLUADNsxHpkBjIpk=; b=f+IpEEQOP0+2VEQrCp7+UR2bGA
	ZGn1F3FyF7F6JK4PNYD89KD9agSMMEpTVrhp9NJS5TtkLhKNm4vpr1B8n1WtwJAQ+ngaGzbcnJCTe
	glxoYhlm+x0Qf4vJqMDR9JfB8chWdkY4llyI6iMYPVv/xp1umTDQdlJ7PFfu7Rt/fNyw8M51avOMM
	xbbjXdH82+QIDrJXjP85CpQpgRBXsBqw/o/BnET43R17MJgpR6+bFgG+B94oe6qBmz3R6FA6W1CNh
	82v8nmIDX4FnWIKrZ7FTHkeO0UhWsg99MzHGTrtUHjhRk3+tZHOvJaEgVnVcAgpCYEDU30CaUSDTQ
	bPE+1NQA==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0ET-006111-33;
	Tue, 12 Sep 2023 10:03:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 06D516607321;
	Tue, 12 Sep 2023 11:02:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694512974;
	bh=9w8C1A352AuElc/pOzF1lPILdDSxHTkOpqu5jgnNssQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VwX0lnzJntgotJhhkzx+NR2cMwrzIYn72iWaYEmKcVpJOj+WDBA1RsE5TnyBErCKm
	 lgugCZixc2LenshfZeSw5rvALmGLDQ2s3wuE7jI6g0A+5wDViRMKWOf30ruWE0EqbF
	 Kfn3+8d8W+wzIgZcVY6biRV1G5XOMFAfLzecZP6xf/1tigGpSeJHrdoJUcPoaI2DGa
	 HqqBafzGbyl2K7PN3s5n1iThP5x08Zm3vS1r1htp8XIyHfT3UmqrYTTiH3yc8WTpB8
	 dgv0CC4NiZMM8N2tS7vInsJ8vV2yHZy0o5g9dmTp5XhDHgU7CublAvIQsiMs96wWHl
	 MrmSvBxjebbgQ==
Message-ID: <1e049cee-a921-a6e4-f6a0-d39c6fbf2a24@collabora.com>
Date: Tue, 12 Sep 2023 12:02:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/5] clk: mediatek: clk-mt6797: Add check for
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
 <20230912093407.21505-3-jiasheng@iscas.ac.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230912093407.21505-3-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_110259_680304_A80B6A2E 
X-CRM114-Status: UNSURE (   9.12  )
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
> Fixes: 96596aa06628 ("clk: mediatek: add clk support for MT6797")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



