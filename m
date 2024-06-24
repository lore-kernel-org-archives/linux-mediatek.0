Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34318C2BD05
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 11:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRb9halcNusVc353DR6y8O5fnAYc75AIUippHXQ9hzY=; b=249biedlymfG8cUENV1cgkXPGi
	LO9xvAp6OpRa9xjJZB8dFQlSLW+J5C8KUpt8hYX542e7EEWJBIhdguQZW6K7HpTA3589J6fKi/rci
	RH5hjnlI8Yp0jPZ6gyFNzCaW1BsNjJvrWMwQjKj/lFA1h8rYjkOx71Gymx7Of6vTnHGbP0KrFX4uZ
	fwwtStWnXSr5EAn5cQxHSjdQMm7+GeXVug1zln9zpPN2KFcy0ljfOkS9NSRFeh/52VfUVkGC73Cim
	7l6HxpvVcpGDw41V+KO4r47k3E3S+5stKa+rqO5Lxw++spATKXgisilwoa19pIAoPX69dBlVaXzLh
	0x4Cawvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhXz-0000000GWmy-0N8B;
	Mon, 24 Jun 2024 11:07:43 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhXt-0000000GWm4-0YGn;
	Mon, 24 Jun 2024 11:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719227254;
	bh=jUkxCNENgUVPd8pyabJPEJxAF35Fp5C1O7HiFYerqNA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SALgaivYlIrfxj08ago5VvJUTF4htQ5pmRgto/x/GkTs/b8oeZqIjF1WIuHIQLLP9
	 l4MS89h/TCjv2w0WkTqR65wYkRUv6kiUKhqlZ8UHn8G3/vX3MIhvAnQzcHkhy6f7Oh
	 Lz6cvU7n0E5UB0DOgCyeX1iPoaRCMXXJgF/dpw1c5xEFlqEvA2ciXQzAx1Ay6fTJZI
	 QF88Guc0phqiWCo4LM7uvsBK33m+iv+NyssATyEfFp17E0Wh/rQIKsYaLGAAp0adCV
	 qYeN2MP1MyXe1n1Z9NJ52lFO7MmJN9c6oacgrnWiF6CbPzvxCjXrUJZ+i2eYA1vGXM
	 pz+v0vmAPiGFA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 87CA737804C6;
	Mon, 24 Jun 2024 11:07:34 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240620-9bit_alpha-v1-1-13c69daaf29f@mediatek.com>
References: <20240620-9bit_alpha-v1-1-13c69daaf29f@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: Disable 9-bit alpha in ETHDR
Message-Id: <171922725447.131974.17550647418404472695.b4-ty@collabora.com>
Date: Mon, 24 Jun 2024 13:07:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_040737_344671_F23DA290 
X-CRM114-Status: UNSURE (   6.72  )
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

On Thu, 20 Jun 2024 00:50:24 +0800, Hsiao Chien Sung wrote:
> When 9-bit alpha is enabled, its value will be converted from 0-255 to
> 0-256 (255 = not defined). This is designed for special HDR related
> calculation, which should be disabled by default, otherwise, alpha
> blending will not work correctly.
> 
> 

Applied to v6.10-next/soc, thanks!

[1/1] soc: mediatek: Disable 9-bit alpha in ETHDR
      commit: eb36ad096818e11d54256570d7d49e26565daf5c

Cheers,
Angelo



