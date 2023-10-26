Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE83C25B48
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 13:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/E2rGA/v3rpY5I3VGxpN2pFTdEWIE/a4R5EeimnTx0=; b=KokiFfqB7BkO31ytwbBKP01TRC
	GHjdnrZ/P2TdEWhoWjt0bPzUFT8A8cpoPxeOjebDfy9ZCuiqtJLkGK6TktFVZF/FlA2zIxuN27fx2
	0qNDy1I+UDLRi2hvTOLHjfWL08KenBHcmtAQdldakjNPWVvnnrHIiBYYCBdph7kj6jYNkES34MxBq
	6Bgx9JlT6LlxQRXE9jCKl0Nc20LdRaG33pUlFnO6A6Na4aboUGGs0AHkoPTLqqTyMqwCYkAj9R1w0
	RqujPSyNNISiOsJLa4xzckdcKBLhOGEw7mfLfirnHcd0cbe2yWUFl7DHx1PewOwqvdPD8n1qOXr6A
	y7YsJxNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw0NT-00EYZn-3C;
	Thu, 26 Oct 2023 13:26:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw0NQ-00EYYj-2N;
	Thu, 26 Oct 2023 13:26:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 96575CE3F62;
	Thu, 26 Oct 2023 13:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8E9C433C8;
	Thu, 26 Oct 2023 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698326776;
	bh=EkEQs9N23jDDNdbmrMAfm/n0wa1XEFhc3nFLxMLQBfk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=phCC8uNydBc6FI51+5GxUnplh0W6pHKM/k1kCBdgKGdSLVRB25tPZzMSM5b9CSEi6
	 NnDL+8L6rdKgTWVvBT/NBBIj0EfltwYqA99WgClIVDgnKFQTa5pKv5sHghnpJ6iH2L
	 a1Dz1GENta9hCJTNryRzvDwV+Ex5MzGGjK22BdAgwJwpcbcrXqx+zZ2otAAu/7NPZe
	 y1m71EsEfiDdLlwmTX0xT8jkN/b+wKmE7vvRFfWoJIgWZ2xPFy7gBBBGAqFAEw8MkG
	 rKx97y13DM1ZB7pbH/QFsTr7zFLVbyFrDGPF9dKYp0U4R2ckI7QXWHf+yEJ8U2aqn9
	 uWfObGYv/9nUg==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Helen Koike <helen.koike@collabora.com>
Cc: robdclark@chromium.org, dmitry.baryshkov@linaro.org, 
 vignesh.raman@collabora.com, sergi.blanch.torne@collabora.com, 
 guilherme.gallo@collabora.com, david.heidelberg@collabora.com, 
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, daniels@collabora.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20231024004525.169002-1-helen.koike@collabora.com>
References: <20231024004525.169002-1-helen.koike@collabora.com>
Subject: Re: [PATCH v3 00/10] drm/ci: fixes and improvements
Message-Id: <169832677439.958223.17998130799046222765.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 15:26:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_062620_954511_944BFF8C 
X-CRM114-Status: UNSURE (   6.24  )
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

On Mon, 23 Oct 2023 21:45:15 -0300, Helen Koike wrote:
> This series contains the several fixes, making drm/ci much
> more reliable and useful.
> 
> Highlights:
> 
> * Current DRM/CI in drm-misc is broken, this series fixes it with mesa
>   uprev (commit 1/9).
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime


