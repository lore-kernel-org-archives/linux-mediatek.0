Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFA5C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0p9uhkLrkMrOJ93YgzWjPNs477TJpAGodqOIkg4CxU=; b=bRb5eLwpj4yeFmR/mugUnUaMhg
	5wuoV1cCH98vJOuWj1lXOVMJgYTuKq+PiYhSkMd7TgwDIXPrvugAP928Bs71xtsBy33r2tzjMALTq
	4OibtFgXjCKj6m0l6Bd/q7U/Wz7KzDiFQcidR66pO5TrbujV0hd2eYIw8c7N6IWAIHVoI+k81/YU0
	+tPJ34LbxJx4HA9qSVIgeOOq5M6SOMMHr+fwhLxYkxQsqeMi9IJnK4BvnE8umdUFJHKla3F67qISL
	2bma08qgpjv8C+oLQxHsdR7HscXYy1fahUA2Nnz9JLQNu9020ihEHyJgDuXYGNNFSwDR2CECcrMfw
	mvuemTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgvA-0000000C1vS-15ab;
	Tue, 02 Apr 2024 16:23:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgv6-0000000C1um-3Ujt
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 16:23:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9AE86CE1D11;
	Tue,  2 Apr 2024 16:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32B4C433F1;
	Tue,  2 Apr 2024 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712075009;
	bh=xYB/qZ9RTNhXxTESYZVU46lsLKaPjJLvUgmdS58ycBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqv3ImhLq1PgJ337brrNrEBxR9qJmf0FXnJXgOwaUAud1wrbeWwQovWfLmtSArZ2+
	 VbM4zi4pse5vhiYygB9CjlyJJ0mHVFk+wigK7NKMAwIqWhy34Preatizf9IbJsoMuM
	 NrTu9SiLT+m+NLCX+TDYDzYVRGoscwGHlIwN/NjkJhthUtEHu7YP5s5akZtTH8DkoO
	 g/JZd0YhqkZnUdgbzcOApXE+eHPjirScuH2VQdLL6SbWCjb0qCyl1Rg0a/3O3wod3O
	 pUcayin0xsm6XXbBOtuir9EqntzT4Fe7UBt2Du9k6n/vvs5Enh70tHTxHj+5wNUwW+
	 LI52eLRN3Y+tg==
Date: Tue, 2 Apr 2024 11:23:27 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Nicolas Pitre <npitre@baylibre.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 12/15] dt-bindings: thermal: mediatek: Add LVTS
 thermal controller definition for MT8188
Message-ID: <171207500517.249957.12484282062174711386.robh@kernel.org>
References: <20240402032729.2736685-1-nico@fluxnic.net>
 <20240402032729.2736685-13-nico@fluxnic.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402032729.2736685-13-nico@fluxnic.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_092333_093271_129B3A76 
X-CRM114-Status: UNSURE (   8.44  )
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


On Mon, 01 Apr 2024 23:25:46 -0400, Nicolas Pitre wrote:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> Add LVTS thermal controller definition for MT8188.
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> ---
>  .../bindings/thermal/mediatek,lvts-thermal.yaml  |  4 ++++
>  .../dt-bindings/thermal/mediatek,lvts-thermal.h  | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


