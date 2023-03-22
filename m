Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB17C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 14:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7AgKoJnO2+2bVoshsROXsVuqb9F0QlAUXldRn0p6nQ=; b=yKVGnHpHfxwfIqB3afn4FUv38H
	FQ3G9h23CTZukpiL6U4S7M3xRrPW2B1LAxpPbflYZnEx9RLI/1cw8H377MNf/FF3lvfWo45jLRMoU
	0xi1J8e6xGYhjHht83BQwiqzWgah+tDylPRmzJePgBQGJGk45gL2w9J7addwkqoJHowMi6tdZdgRK
	8L8qL4xdyocbGtlTmJSo/Xqsjkj8TYAX/aO28sL0Sa002untAh3ihANrrqvTodLSkpH0H3YZo+gWW
	H4JYRHeeXLbdRViSijTTdNbaCYnPzuMMn4ej7iktG9HAjTdaAKwr3zsjVa7z9Q8J9aZy84toDv0iG
	Gkc1AIAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pezWQ-00GJVu-38;
	Wed, 22 Mar 2023 14:33:03 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pezWN-00GJTv-0M;
	Wed, 22 Mar 2023 14:33:00 +0000
Received: from 8bytes.org (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 04EBB242DAB;
	Wed, 22 Mar 2023 15:32:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1679495576;
	bh=s+7L1226YGyniLAi3NdgOJRlQwqK8vojAHQR+OJMYgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nVWbu39TgEVIkf1MTfy1XuN0hh1A1na6gS1U0J6iVKoQUF7uU07Zr1of28uFtY1+d
	 WvyfbQYwXPDgb5muU+fC7s5E9YcDmIR1J3Ers8UwCTG8lZowgEByQbLcaKUD6SDY+8
	 6NYPgN1f04qsGnFY7D7u9mvj4V9w5fvZAYU47NB9XJDKlax5lRKK1kkFWcW6UzHHTl
	 j9WNaRENM3jIi7ZM+V6fmhERmgeReKMuGA8V+oGXQbiIKB75ec1IntqW6Y9d7bRCVB
	 JEQj70Gnh6O5eWX7GGzhk37bbL4sAIv0pO+opbRT/rYKFXAFrrS4Ql0lstIveQoRKR
	 dERQot6cbraMg==
Date: Wed, 22 Mar 2023 15:32:54 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
	Yunfei Wang <yf.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jianjiao.zeng@mediatek.com,
	chengci.xu@mediatek.com
Subject: Re: [PATCH v2] iommu/mediatek: Set dma_mask for PGTABLE_PA_35_EN
Message-ID: <ZBsRlgJIaQieIbzU@8bytes.org>
References: <20230316064251.7346-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316064251.7346-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_073259_373942_3756A150 
X-CRM114-Status: UNSURE (   8.24  )
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

On Thu, Mar 16, 2023 at 02:42:51PM +0800, Yong Wu wrote:
>  drivers/iommu/mtk_iommu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied, thanks.

