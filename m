Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31393C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 11:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZb54CRLiIwomBO7dp9NgPy+sCsz2w42CgfEnYCaPjg=; b=zkVt6I5oXvlYbvs5nWvcJ4lw6h
	34gZhFTujTJ37WnliHAn7fzjxMm6DY+1HEnjWKz1+qdwMTjSeQ4fqAy1nvjN255x+xX82RhshnHn+
	wIYPYXnPYD/0kzH6m9RMYx3LKscMYFh6cLwv62yzKrTvik/yCPYeDuOBAZsIKR4ziJVqCKy+6mhin
	7+TLdr/kk4ez6GR5BoEfncO5FR9IEQFN2/ZZ8QAfGTxBU2Qs0NwuxvYJPQ4wL0KtV1GKTADH9IrLm
	J6lDrfLaEFY8uPsqniWB0wWFoaBO5tYwz0NgEdOscTHk8iJmGTEGlXHXENHoIgSbOSSSG87JCPU8a
	iKehWIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6V4f-001Tul-15;
	Tue, 06 Jun 2023 11:42:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6V4c-001TtU-01;
	Tue, 06 Jun 2023 11:42:03 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9CEAA6606E97;
	Tue,  6 Jun 2023 12:41:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686051718;
	bh=GW+DvE4vtnoebxP8kfMeV8thnfGpbViwiHIrEXXP98s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JeAuN3ekhZhjUz9QB+rbJxCDecQl3k3FnM8P7dW/awY/UiUugXjx4E6/veOnZMJsz
	 ZTmjDHuzoWFzCh3a+0EGYcLDv6pacglXfwiD4DO0PlLqW5HnbKKH52HwqDa5KAIu6S
	 9a6sFzAfJ9YW3IDzk9dEAC3BML384bLfGA11IBP5LLMydJJYdR+WTVKuhDzpq8nBxR
	 nn0U9NEiZXl9y+e4+NRmKaoeSI3yAmR2qpVfHmbB68bSGQc4sJyhKw0iKIuLH1NfTv
	 LjYWCfYICF03k0OEVTHeQvMxHCAgqS0IZ1/bcx5RlIzdZ6SJ+JqOSHQZSXhcmGf2ki
	 P6TP7jTBWO4eA==
Message-ID: <a8d1f20c-9ff0-2796-d31f-7ef6f11ee6a4@collabora.com>
Date: Tue, 6 Jun 2023 13:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 1/1] mmc: mtk-sd: reduce CIT for better performance
Content-Language: en-US
To: Wenbin Mei <wenbin.mei@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ritesh Harjani <riteshh@codeaurora.org>,
 Asutosh Das <asutoshd@codeaurora.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel test robot <lkp@intel.com>
References: <20230606113249.28057-1-wenbin.mei@mediatek.com>
 <20230606113249.28057-2-wenbin.mei@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230606113249.28057-2-wenbin.mei@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_044202_175399_1A063F30 
X-CRM114-Status: UNSURE (   9.46  )
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

Il 06/06/23 13:32, Wenbin Mei ha scritto:
> CQHCI_SSC1 indicates to CQE the polling period to use when using periodic
> SEND_QUEUE_STATUS(CMD13) polling.
> Since MSDC CQE uses msdc_hclk as ITCFVAL, so driver should use hclk
> frequency to get the actual time.
> The default value 0x1000 that corresponds to 150us for MediaTek SoCs, let's
> decrease it to 0x40 that corresponds to 2.35us, which can improve the
> performance of some eMMC devices.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


