Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B08D1CDC8
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vL81PyVFTDqFgfPYSQ7m4cRF8giW3+jIrqZUboM+8uQ=; b=j7s2i6PvfDKuJTI6piNfuIX+67
	8SznEF4KahXZ3oarLyXwEChLwzL4uoDfTPLjFp7CqZpoXdqkO9k63wda623VDDx20rRRtsi49Sfns
	e9QpA5+R5QIGh+PoKmbTXH33BUIzET9EikVXFZ1KXK2FSvhwt33k8WG4GrwOoCURn6KnuSNagOd+R
	drRBKRvmpBTGmzembrQRT17u1LWjdBqJGKyS8iGg3z7H9+Rhna55klHK7W6M8n2cTXGuPm6IpXFE+
	FnTl0VVddFzq3W76PrQ/tLrDVCRh1/V79UM2QXssbscThXSFDxI0hwn32nJy2k/ge4VBKevSpISTe
	J5GtDURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3B2s-0000000AKJt-2Vbc;
	Tue, 22 Oct 2024 09:19:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Azu-0000000AIx9-15FT;
	Tue, 22 Oct 2024 09:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729588572;
	bh=sl0NtYtcnPuoIwLlUEcbG1AzVTC9P2SfOFUZ4Si+h4s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YDK4Tc4b3cbrC/8wT8ngke1EKB5BDI3v0oHI7opwJdaKSdCaFbqUuWzuKgqNrFjPC
	 sTU64CYHkcFnjyYWsa/JZyQKYny/yUtslvXedOMrlxQhrbE4LzKIkjL2EVgYknucRp
	 ZQ1MMq2dWkoAfujcU5eVaTs4Yn+nI18lTrgk9sYLodduY03VqUws1sOeXIbZEHhee5
	 EJOzhR47JJUKmm+KV9s9gRux1EJRXugZTekdIy76/BN62dEa2wAECe2QAqT+RD2bK0
	 B4jp7qGJREcrIljO9HOEzLlJ8T47jEYBoR0fmCpbHB44g5dlYQxzfwby9tMIhsKz1+
	 MP8ZIjfZcc3eA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4EFFD17E1395;
	Tue, 22 Oct 2024 11:16:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20241021140537.3049232-1-wenst@chromium.org>
References: <20241021140537.3049232-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186-corsola: Fix GPU supply
 coupling max-spread
Message-Id: <172958857228.72613.9158406663277512408.b4-ty@collabora.com>
Date: Tue, 22 Oct 2024 11:16:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_021614_501178_366096AB 
X-CRM114-Status: UNSURE (   7.08  )
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

On Mon, 21 Oct 2024 22:05:36 +0800, Chen-Yu Tsai wrote:
> The GPU SRAM supply is supposed to be always at least 0.1V higher than
> the GPU supply. However when the DT was upstreamed, the spread was
> incorrectly set to 0.01V.
> 
> 

Applied to v6.12-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8186-corsola: Fix GPU supply coupling max-spread
      commit: 2f1aab0cb0661d533f008e4975325080351cdfc8

Cheers,
Angelo



