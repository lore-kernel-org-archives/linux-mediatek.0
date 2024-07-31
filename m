Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA24FC3DA64
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 15:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnkbqciUGgGleCuCAfFD9uqA1Fdcf0cCaY55Wz2pnBg=; b=DxXeGE09bn27xSAck0QCQC22DI
	lrJRs5L9sqNUeervXSqON+f9tVtka82Mrc9IHqvYkSyY8FUz3+L5hMEHlfgBdRljwnGOMms0/BAjF
	ETTtFHZ1xfDmiMMxuRHw6NsZv2o7Xs238/a/GhIAiGcz7gEcQbzeB1RkBV+yMewORJWcXLNCQgGK6
	j53pVfjukkji2keXLq0zGKcmjZCJuFOKLqcSymP5XxPGoOQ7mYF5qcXoqW2gwuW15NbC9a4YC26aF
	8sBgBegSDxTeN7tXKaV8t9DPpDUzCGRYdp9T3nODGRWB2BZgUVi6dZchlXGaHVfwjVowC7r33bfqp
	E3hLry6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBA8-00000001hK5-2UBz;
	Wed, 31 Jul 2024 15:22:48 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZB9Y-00000001h5B-1OqW;
	Wed, 31 Jul 2024 15:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722439329;
	bh=YzEa6FGT7ABDZ3+gWE/js4cARAJAN6TZ1fzD+Z4N4uc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EA3BU7LzdrSaqzYT9gSMJ7IyGj4nHujPOtkgcDenrn8eZWpLWaAvzO9Jd+xEiA0zM
	 NRSkn1IMiGP8Uh4DwkkEbzQ/AsoJ99drqw1dixRMAXeufcWoAP2v93uvgHePcqKEMI
	 GZV9HkAfPPAaYpc9jJZPPR9W8/E3ft2SbnIJCVT65xfw+uvVI3eLP8siCx6uZOIK64
	 QyQFdx0XV45IATyvotdiTFgS71Ev2m9dSH8L7Aw2xSPuDn9WJhuxYmvAOzrmChJXOD
	 3oduXZJyehDxJgyonhGi51R2/ZeNzEsT9LXY6LTEX0WAANDR+PMcRkfLmjBH4EMR+I
	 GDqIqcR8u1pIw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9A72D3782039;
	Wed, 31 Jul 2024 15:22:08 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240731-jacuzzi_dt-v3-0-1c4314e8962f@chromium.org>
References: <20240731-jacuzzi_dt-v3-0-1c4314e8962f@chromium.org>
Subject: Re: [PATCH v3 0/2] Add kukui-jacuzzi-cerise and
 kukui-jacuzzi-stern DT and dt-binding
Message-Id: <172243932855.488108.1466847928167694223.b4-ty@collabora.com>
Date: Wed, 31 Jul 2024 17:22:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_082212_634136_7B7A943B 
X-CRM114-Status: UNSURE (   8.58  )
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

On Wed, 31 Jul 2024 10:47:24 +0000, Hsin-Te Yuan wrote:
> Cerise is known as ASUS Chromebook CZ1.
> Stern is known as ASUS Chromebook Flip CZ1.
> 
> They are almost identical. The only difference is that Cerise is a
> clamshell device without touchscreen and Stern is a convertible device.
> 
> 
> [...]

Applied to v6.11-next/dts64, thanks!

[1/2] arm64: dts: mt8183: Add kukui-jacuzzi-cerise series boards
      commit: 4ba6d1539fdd709ea8e8478c37b014e663cd6894
[2/2] dt-bindings: arm64: mediatek: Add kukui-jacuzzi-cerise board
      commit: ac90896833b52ff58c81727f57ed3cf9ffb9db86

Cheers,
Angelo



