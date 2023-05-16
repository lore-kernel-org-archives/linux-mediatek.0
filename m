Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF66C77B7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 14:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFBJrZSt292mze71LgRS/Nqh8lZUKgHG3TxE5jXqWxk=; b=uCYwzXwD5MXNXcy+k/LP0UbHcY
	9uM0DAF+XYr6RzIG/r2+RDReJLjudwiHRY5wXRNZ2TnNM6c3ZKo9Cj0Bm7Sa2sutxc6xZireyEykE
	vJVtZVMhhYmcn1XTfL8756qDd1tRAhWd3UIOgfvxNK9+V3BZD0wK9QfDfo2gQWVn+KrbjUWJ0i2gt
	bJU1ZKW6EEuGRO858iUJJmdHI0cPViKrjVxNQ7gfF0UeZSD7S+Ic5Q7vQZzEVMtO1fRpuftxfxj3Z
	ifrNbp45J40Hk37uQrWOzgNo9fNXlu6kd7WwmyrqhnqWXlovpVIEwuKEk6mBTMPgjJOesvHQEPAKF
	yBjCrxcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyvVW-0063VR-1e;
	Tue, 16 May 2023 14:18:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyvVT-0063UZ-22;
	Tue, 16 May 2023 14:18:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0886E63018;
	Tue, 16 May 2023 14:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7AB6C4339C;
	Tue, 16 May 2023 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684246706;
	bh=YXhBO9eG7UWbqzuiSK1fn6Kv4L06SYxCu/Poh/mJHwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T5Z7Rp6T/k00U4NfiIA60xzvdndp67Bi9eF0AXmi1sA/kR32HdVQVykmsjg7jpBY3
	 hrl4quu7TpWXEaSdRD0/00cH3TVaDAnwl2GzwGDu/KBVuCWG4cHEfGl4PnPaqHFV23
	 LLvsveTXCqPOThx9ey11JL9f2wLczR0XpLfjr4NIsqGSxKDVbXUhbEyRLLeeqQbetu
	 jR3zKAFkY1IEEACvliEdA3dTw7DcVNYSPZ4BsYy80UReKX36g/7iAKu+ooov0hPAi8
	 HeuJcT7z/GMYo4dw+9UmllPbFYrEXcAXcQmm/Q7XXFNwa16RX/sKMXFVOM8q+BiSVI
	 cbMpIcnnQaU5w==
Date: Tue, 16 May 2023 19:48:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
	chunfeng.yun@mediatek.com, kishon@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: mediatek: rework the floating point comparisons
 to fixed point
Message-ID: <ZGOQroo9KB0IKeu1@matsya>
References: <20230502145005.2927101-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230502145005.2927101-1-trix@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_071827_710187_B74FDB73 
X-CRM114-Status: UNSURE (   9.29  )
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

On 02-05-23, 10:50, Tom Rix wrote:
> gcc on aarch64 reports
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c: In function ‘mtk_hdmi_pll_set_rate’:
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:240:52: error: ‘-mgeneral-regs-only’
>   is incompatible with the use of floating-point types
>   240 |         else if (tmds_clk >= 54 * MEGA && tmds_clk < 148.35 * MEGA)
> 
> Floating point should not be used, so rework the floating point comparisons
> to fixed point.

Applied, thanks

-- 
~Vinod

