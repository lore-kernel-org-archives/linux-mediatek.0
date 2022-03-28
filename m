Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C708FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaFl7avm83SuGArmF0JCN/QeWJ3qbHVQySUdZ1bgco0=; b=nMfa2YcO4inifm
	RRXLBEFSocgS4keVSsThkYGLrPl4B0iHb+PIJDyG4L6cRZ+4v78i10qNqzo/HzlHocOZt+51arHjn
	TJLu3X/p8H6y4/Bqk826WWtGZqzaB3KsvHreJoBj4LevnlJfo+rzyof+HjrovnsxJCc2yzXOrFMNH
	G3IYP7LZVtyOtCMTfAzNKwV4DkVQ9ETrxjCAtbcBQqnsnTFrNP0qaiKzEeQntUSiyRMZ8zTuQX2wC
	/y4Nqtxgf//MhxLRTWycke2oWsGlQ6WKVTP9J96Drtvzz4GT3ooei1Jmvig5qnFQdn1yeW9+hkHyl
	QyXMM2eJzrGaXO/C5/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYprA-008x9g-N8; Mon, 28 Mar 2022 13:56:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYpku-008uTU-92; Mon, 28 Mar 2022 13:50:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1E9201F42944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648475398;
 bh=hg3oHnVb2aNV/xfm3ZfDnsU2X0UESM8DZiscH969YFw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b1hpgtnTbLEuojlhgucjiRgpuCGUCcBscK8sB6vhysmpHx/yRSVWKMNT8uPJi5jck
 gtW0HASATGgqyIoqf3+HohoMt6eTVjcYS8Vrrm6e6mbgoY/qPsf8a+B+rp1GT6CkSC
 lXLdC/+CLoTsWRMTIPmpmXxIQEdZRd2LLxokH6BfMK8mUXfIr15LYPZUZDKCA+8rIE
 bOkwTRYoNzpvMWKa28q68TAaMj/W3JNOin6gxMEeQixOEmYAYxC862PN6QIP1qB4+y
 ja2IgOpipC8DVDIhWGtenATqCID0++s3l9zuJZC8bbqMKgwXa0QiT4qNRXIPHbyq01
 3VGbjpz1//b6w==
Message-ID: <e0264594-7f53-f7b8-349a-e75a0b6706c7@collabora.com>
Date: Mon, 28 Mar 2022 15:49:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] pinctrl: mediatek: mt8195: enable driver on mtk platforms
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220327160813.2978637-1-fparent@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220327160813.2978637-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_065000_512135_1660F755 
X-CRM114-Status: UNSURE (   7.54  )
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

Il 27/03/22 18:08, Fabien Parent ha scritto:
> Set the pinctrl driver as built-in by default if
> ARM64 and ARCH_MEDIATEK are enabled.
> 
> Fixes: 6cf5e9ef362a ("pinctrl: add pinctrl driver on mt8195")
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Since this is boot-critical....

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
