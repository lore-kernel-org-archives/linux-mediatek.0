Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACCEC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 11:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBT8EGa4OdoPcaFxZzwBfXD7QAI1zilaTZ78SNfT1rs=; b=fGhSW11Z5ONNPlWCN7Nu/tS/Z1
	jwRHo/lHOWymNT7gcyf/9YIVIFylWAbbQZof8FVfzO53dSy3tHRvaFkXsYnd8AhGdA3zX2JdHNN4h
	iKb/FgwyDljRJ5rmTIZ3osusJfh3/HDNrn6uHYSokO7R5r1BC4B/ZwNGHEb/ssm/hotpWFpeoZQTB
	1CElYc3KQ62rQyo+LwEM/3la3jo5Q2PbGmKkLOOHp482FRgoPWGcx6n/rCfHngkoCeHM+fAQQgvHL
	NfkQhFcfiYEGpFzuriSt3megx3+zlIkP2EZjlY2YE4OlawFN2wzVOMxitZheSsbXDO9aPm0BOr16P
	abk2Pt5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4geG-00E0Dh-Rn; Mon, 12 Dec 2022 11:07:04 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4gdw-00Dzd3-Gc
	for linux-mediatek@lists.infradead.org; Mon, 12 Dec 2022 11:07:04 +0000
Received: from 8bytes.org (p4ff2b8a9.dip0.t-ipconnect.de [79.242.184.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 47E902208DD;
	Mon, 12 Dec 2022 12:06:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1670843200;
	bh=Wx/FQOa0twYM0J5vE2YN6rDdN+so7uRjoO2kTY5Jbi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dW4pqcZewOZIBby4X/JgUMfAZGaEUzvnd6vMsAkbBHkhFy+Ob6GJzF0jf7dAi/rpk
	 NFHRYkUI7faJCB7GChDJX3aCOGeNFuDgOyEqsKieXlFO2M0gzpTn5NI+POC0fhZASL
	 auv0ddRDic9vhY9c4mqkpM1JfvccQUCTCArArvyfsVgAmAK74J3/eQlQRXuIBtaQHd
	 Y667DXckjktnMd9xO172C3U4nEDHIOl7BoIQcr5eHtceKXgt6FmGj/QfdJPpLP/rUs
	 28pCd9MX2lyZOOaUlGzDAWw6Wls7GKT5enuhfaJ48OeHc4otRH7bjYgbtHNh2xud6X
	 DKhQ/4Wxp4jRQ==
Date: Mon, 12 Dec 2022 12:06:39 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/mediatek: Fix forever loop in error handling
Message-ID: <Y5cLPzaQzMadY4Yk@8bytes.org>
References: <Y5C3mTam2nkbaz6o@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5C3mTam2nkbaz6o@kili>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_030655_373802_07B8F503 
X-CRM114-Status: GOOD (  10.61  )
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

On Wed, Dec 07, 2022 at 06:56:09PM +0300, Dan Carpenter wrote:
> There is a typo so this loop does i++ where i-- was intended.  It will
> result in looping until the kernel crashes.
> 
> Fixes: 26593928564c ("iommu/mediatek: Add error path for loop of mm_dts_parse")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/iommu/mtk_iommu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

