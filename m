Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D35C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 15:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NhAxDf8GppUeQ5WhtNztM3l2gmysTUwnuVxRcm/SIg=; b=RFKWq8I4Z6HhwW3dYX0Pvh6hXe
	PzZcLF8OUy0/7RxB4kt053xed7AN0yzwAs9QKJD+FSUW6Kt51R705m3K5gnxoH4SekQszZCbGDhOc
	TDLKL7kYIa8IRUHoTl166SrqCpSVd8KMSrGPnzoa6Md/m8GcvMm7MaMAEua9zCUOuOwNaAfXAp03U
	B6mWWHTLV5MB/MAoQzHsNwPJOYb5qtTptAtJfvzyhgsQS07KfyGBlMP2ZIxBSs2Hlxoj9w0Y6SYGq
	hvKG0MLiKUWph+Zps/1LQaq/rh23fiUYSZUv6EFxoGqEtWkFWcUkZiqb3+Pl4LlyHSAYfCKmH4D6c
	oe2uYBGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4lFm-002s6S-6u; Fri, 24 Jun 2022 15:29:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4lFV-002s0c-5i; Fri, 24 Jun 2022 15:29:35 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6632866017FA;
	Fri, 24 Jun 2022 16:29:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656084570;
	bh=QLIJRVIptCHxe8YA2obqLBI5SkwO2iKvXB+7BviNrXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R7Cbtu6iwOlYUJNrtTEjjeuyVABZb58IsLv6iv4aHnEjAV7+4X9OKEFgcpkT6JESk
	 i/2VCZsY7/cbMsRcgf4dOTxx/3PSzWYVUP8jMMMQ4yyf7RCvrr+nWbUjSg7OhBBD4M
	 Nc6GoM0YFzIqCElY4ata+my5gludPw2FJB1ZUA/coPcI/L9qfb9fjHRA22aqsTfUNA
	 s4VQqHzTeL4lhivXY7A2kZQiaXKiXwNHDI19/JvInN+pjKDLjCqMbGOEJ2OSc5c92q
	 uCZayN2p8ztKQ0BpwAbAbzBDwdw8Ze4K4XnBxRpsyOVsWmHb1H+SsfGgFBbv8nK9g4
	 lEY+rGj9GpJ4A==
Date: Fri, 24 Jun 2022 11:29:26 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 3/5] pinctrl: mediatek: add rsel setting on mt8192
Message-ID: <20220624152926.76hvymguryhfv4sq@notapiano>
References: <20220624133700.15487-1-guodong.liu@mediatek.com>
 <20220624133700.15487-4-guodong.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220624133700.15487-4-guodong.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_082933_484675_61EBC36A 
X-CRM114-Status: GOOD (  14.79  )
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

Hi Guodong,

thanks for the patch. Please see comments below.

On Fri, Jun 24, 2022 at 09:36:58PM +0800, Guodong Liu wrote:
> 1. I2C pins's resistance value can be controlled by rsel register.
> This patch provides rsel (resistance selection) setting on mt8192.
> 2. Also add the missing pull type array for mt8192 to document the
> pull type of each pin and prevent invalid pull type settings.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mt8192.c | 136 ++++++++++++++++++++++
>  1 file changed, 136 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8192.c b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
> index efabeb422aea..ffb0b04f0e3c 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8192.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8192.c

<snip>

> +	MTK_PULL_PU_PD_TYPE,/*100* MTK_PULL_PU_PD_TYPE,/*101*/
> +	MTK_PULL_PU_PD_TYPE,/*102* MTK_PULL_PU_PD_TYPE,/*103*/
> +	MTK_PULL_PU_PD_TYPE,/*104* MTK_PULL_PU_PD_TYPE,/*105*/
> +	MTK_PULL_PU_PD_TYPE,/*106* MTK_PULL_PU_PD_TYPE,/*107*/
> +	MTK_PULL_PU_PD_TYPE,/*108* MTK_PULL_PU_PD_TYPE,/*109*/
> +	MTK_PULL_PU_PD_TYPE,/*110* MTK_PULL_PU_PD_TYPE,/*111*/
> +	MTK_PULL_PU_PD_TYPE,/*112* MTK_PULL_PU_PD_TYPE,/*113*/
> +	MTK_PULL_PU_PD_TYPE,/*114* MTK_PULL_PU_PD_TYPE,/*115*/
> +	MTK_PULL_PU_PD_TYPE,/*116* MTK_PULL_PU_PD_TYPE,/*117*/

The comments on pins 100 - 116 are missing the closing '/', effectively
commenting out pins 101 - 117 and leading to errors. Please fix this.

Other than that,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

