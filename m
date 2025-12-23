Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F1FE6F086
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Dec 2025 17:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKgwtAjht++HIpBsfV4YQ7SC1JAhcOfRGl0OElK1t5w=; b=v18GFNEuTyqk3KD2OV9ETx/UX7
	bwj+oy4fsUl6NxS2Gec696NTxFncDB2HVhKrW9bIyZMfAmrdnu4yY6nSqS64Jzjx8iKAXrvTH+ii6
	iAgx6BGkXOlpwZOMH08yMsHK2vk1XKYFyJd//ZO7h4XKCfwNEAizTMcltjaXAnN+PfcGF4u2H/OcT
	vq5XVde0RtenfCaJOJ6bcgjNqLV3hFBEhBxLqVMAlmYbCtQoZfK8gVo+kgYv0m/OV9bGOlB+4ISUs
	8srulY+13ZOmPeeAwl8MPascnG1qpYypAjqZAxs+UitV7FZgpi7rD9DeE4/eWAIALgJ93y17dSxPR
	C5abBPbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6Me-0000000FqVv-1wsu;
	Tue, 23 Dec 2025 17:40:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6Mb-0000000FqUI-2TWs;
	Tue, 23 Dec 2025 17:40:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 22F0A42E23;
	Tue, 23 Dec 2025 17:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F96C113D0;
	Tue, 23 Dec 2025 17:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511601;
	bh=mg+xr84GsG3acMHvsNiCgu+mhovC0ULkrlsg5Zc0wB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gnjDSgeDpiEOWDb0Q/UicZgdmWitjgbpqA77fEs4NCvPTov7e9DMj7XG3yTGE/oRD
	 CZzhhz3V2RlTMW7+G6ML23B0q0Zz4CV1MfDhzyhV8ncLMHn+ys3+V1xMjbgB6YUZvF
	 PIHBoR9SeHN0oBp1Ej7yv9uswRlcwNWAvT/Q4M9s2axotPD5dRzW5e3bgxAQJFgYq/
	 8OMFVId6FsiNJWamlE8wMRlnBmw0JTDQJ2Mszs4dShfOyJQr015/v/DcZemF64bwTK
	 1AgoFL1SPYlDQ7sR62eMK0ZNoiDMuJVwSoEABjDjUXWXMVYZWO0OlQAU7BDeTtAgVk
	 RnezgJuAWnqOQ==
Date: Tue, 23 Dec 2025 23:09:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Chaotian Jing <Chaotian.Jing@mediatek.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	kernel@collabora.com, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 05/25] phy: mediatek: ufs: Add support for resets
Message-ID: <aUrT7R41XJk07Esf@vaman>
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
 <20251218-mt8196-ufs-v4-5-ddec7a369dd2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-mt8196-ufs-v4-5-ddec7a369dd2@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_094001_658348_AEBC1BB4 
X-CRM114-Status: GOOD (  12.90  )
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

On 18-12-25, 13:54, Nicolas Frattaroli wrote:
> The MediaTek UFS PHY supports PHY resets. Until now, they've been
> implemented in the UFS host driver. Since they were never documented in
> the UFS HCI node's DT bindings, and no mainline DT uses it, it's fine if
> it's moved to the correct location, which is the PHY driver.
> 
> Implement the MPHY reset logic in this driver and expose it through the
> phy subsystem's reset op. The reset itself is optional, as judging by
> other mainline devices that use this hardware, it's not required for the
> device to function.
> 
> If no reset is present, the reset op returns -EOPNOTSUPP, which means
> that the ufshci driver can detect it's present and not double sleep in
> its own reset function, where it will call the phy reset.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod

