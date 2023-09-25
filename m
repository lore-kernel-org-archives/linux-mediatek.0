Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0061CE7A81
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 09:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EMyY5icWOUKHmM/HD5jhz25I/xMaeIP7LGCoBAqU8Y=; b=07NERrowg+dJvLSAmGxFXpWe2U
	dpMuWnQeb9RStDz0ZDenVNUErhDdxS5NSAJI7sxnVqJtfTnI0FkrU7aEmRXpgx6Nyzit+yxmkSWWK
	gxbLxfq1wP1wF9Ja1lyGgWhLK3eEcQtN2VHJKajBZ7+RXB5kYgUbxrNtt7uQ3oTIIYq0JzSTlWB/E
	h9AdNsP8oEd8ZL2/iPaysYAGyhn12JfaARSO0yaN7ZG6KXpmzFU2C7ufqKQZ1MfMmBVRea1jI9mdW
	MYXqkcMT+CfqaqUQ3+eOyaoAVDFw/102SEO9hnrV38LI3PKBz3xvC3ySzU6fb4g4R2PwbuVPvuwxC
	kKQOveNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhz3-00DrjC-27;
	Mon, 25 Sep 2023 09:34:29 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhz0-00Dri3-1L;
	Mon, 25 Sep 2023 09:34:27 +0000
Received: from 8bytes.org (pd9fe9df8.dip0.t-ipconnect.de [217.254.157.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 2EB521A21D7;
	Mon, 25 Sep 2023 11:34:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1695634461;
	bh=9EMyY5icWOUKHmM/HD5jhz25I/xMaeIP7LGCoBAqU8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JW1bTEQAtzolhcJGyMSk1JJnGTGMWrJX4VGRLsq5dTl1tsTR03PS7GztOG4tbEzOW
	 Pw0SmIVNYwNPPGr9T55Kp4Oaep6qXraD5GyxV2tDLNsQGL0urE7VQrGLjJM7Ap4nC/
	 UNmMZfEtSzxJ5sviUkTnlUGb8TN7B1efPJ7SlPzQg59WRj5cy5DawrWDm5QLp9OOGG
	 g7Dz3mX9dGtXKBgLwUSI0aBSdAnFLIin0giZHumTz4HI0MdfW0B9tEy1mJaRuz/URj
	 zDKlPht2f0us41XvDllABOdgN/Gr8EF2iDMZzJtmDIZNFEHVVCpqqcl/L+0sdtoEJy
	 O6CN1E8E/RP4Q==
Date: Mon, 25 Sep 2023 11:34:19 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Laura Nao <laura.nao@collabora.com>
Subject: Re: [PATCH] iommu/mediatek: Fix share pgtable for iova over 4GB
Message-ID: <ZRFUGxCJZdExznBz@8bytes.org>
References: <20230819081443.8333-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230819081443.8333-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_023426_697262_A47DFF7D 
X-CRM114-Status: UNSURE (   7.82  )
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

On Sat, Aug 19, 2023 at 04:14:43PM +0800, Yong Wu wrote:
> Fixes: cf69ef46dbd9 ("iommu/mediatek: Fix two IOMMU share pagetable issue")
> Reported-by: Laura Nao <laura.nao@collabora.com>
> Closes: https://lore.kernel.org/linux-iommu/20230818154156.314742-1-laura.nao@collabora.com/
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> Base on next-20230818.
> ---

Applied for v6.6, thanks.

