Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB243C46CCD
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Dec 2023 10:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4UJQE9NuIwWdDqQpcclO73Oxt0YNU2cQaVI//PQN3g=; b=DJjmYvUBuwi+wKKtCrkQ66J2ZX
	MFewDP4CEGcHz9k+9M2bD/GPNf6rJksnh5TzQ2U1J5LuGzoWZROBtY2aQOy4pPbEpyeshAEvW8PwY
	kdxJjtrqctyIubGKRZuTYIYqQR/0m8TmjhXv5FW7dBsUDNh9YZISFeD0BmuXGLihXZ7pr/v5WWs4Y
	AfPJ5ExEOrgEtioN6wGZj1pcfqqM2KWR4yJmiJT6HE7lQpcTGdKL2DGPqNEPHymmy68Zyrt+MdV/n
	jnkh/Soye+J0NGeeludmvFMgtD6Ainl1oF25YB+cTaoisdbw2QBIXAeksc0RxCdVLj0caavXaOJ9q
	6AhRZj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFXlB-00Dcdk-2R;
	Tue, 19 Dec 2023 10:55:37 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFXl7-00DcdB-2V;
	Tue, 19 Dec 2023 10:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702983332;
	bh=iOGS8KTi6FaODnR4ZId4OaEZT91XmT9apSzLGmTKjtU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X+Km4emorWJJEvkdcSuMCT1aKHzTK9HTmAPLP6D8PPautMVen+tfGNA5449kO29Zv
	 U8+OyfhxoPdJj2TLana6gHOcnYRwCed7T/tPKBrDARAkDmxyFZ/QxQXPl659/sx53l
	 I3MonnRDfPfSZR0kgUX55RPbSMN4/gnR0/NGhjr0XivWpemyINp9NYTR1VaFroyb6e
	 Q3J7s/BM3639dqZrztTJo8Scp1Q15fmWKJDRsEjRrAKmengZ3J4Hyv7JhpOqVIOrKI
	 0yege23FjUthwxZrSV4NyXOO/hvGaiIWBk9GkCLVQ0Dw6FvzsDE0OfRZNGHzBFezF0
	 M13iyvff5cCzw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5875A3781476;
	Tue, 19 Dec 2023 10:55:31 +0000 (UTC)
Message-ID: <716db737-940a-4a28-bd54-b1dce76174d2@collabora.com>
Date: Tue, 19 Dec 2023 11:55:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mmc: add wp_grp_size node
Content-Language: en-US
To: Bo Ye <bo.ye@mediatek.com>, avri.altman@wdc.com,
 dominique.martinet@atmark-techno.com, rafael.beims@toradex.com,
 vincent.whitchurch@axis.com, Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: yongdong.zhang@mediatek.com, "lin.gui" <lin.gui@mediatek.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231218224832.81347-1-bo.ye@mediatek.com>
 <20231218230532.82427-1-bo.ye@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231218230532.82427-1-bo.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_025533_971524_8762DF78 
X-CRM114-Status: UNSURE (   9.76  )
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

Il 19/12/23 00:05, Bo Ye ha scritto:
> From: "lin.gui" <lin.gui@mediatek.com>
> 
> Detail:
> Add node "wp_grp_size", corresponding to WP_GRP_SIZE
> (write protect group size) of eMMC's CSD register.
> 
> Scenario:
> The eMMC card can be set into write-protected mode to
> prevent data from being accidentally modified or deleted.
> Wp_grp_size (Write Protect Group Size) refers to an
> attribute of the eMMC card, used to manage write protection,
> and is the CSD register  [36:32] of the eMMC device.
> Wp_grp_size (Write Protect Group Size) indicates how many
> eMMC blocks are contained in each write protection group on the eMMC card.
> 
> Final rendered file:
> "/sys/class/mmc_host/mmc0/mmc0:0001/wp_grp_size"
> 
> Signed-off-by: Lin Gui <lin.gui@mediatek.com>
> Signed-off-by: Bo Ye <bo.ye@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



