Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79528C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 09:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zp2/c1bqO3CAkhfr2iH3wmTOLQZSXP4Qz6uaiBdkdxk=; b=odm8XbXt2jRWiC
	dzvViaUF9YhAmKfABEzDkVg8RvYnpyi9TWm4av9OC+NdF6oauM/4w7PQGq4nAwZ2z2Sup3Q1F18n3
	64WaWqsPVru6q7ph8mDT+HbDp1wNgfVKKhKEhgBsnrTzqgicgTVpqcHl2G6mXBpmEYnBXncNinUf1
	WGC3xjuxUZ4GuJCZ5YfuiLEnRKFBDYZ1RDHcaVBG1J58Ri1s5hfwG97SOT3/Ah0uKLV0PGVwSFqmY
	kPw6klBBtBiHFWSZJkkUVa3mDCpHPwCSSbDIzD4qxq2uZYUylTENE6H16W3sWCbw2pb6o79kO8Nmk
	Ly+kPpxk9zERe7VwJQpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMRSj-008kbn-Se; Tue, 22 Feb 2022 09:28:01 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMRSN-008kQy-4o; Tue, 22 Feb 2022 09:27:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 503761F43FA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645522057;
 bh=cayn+auikT0w9IULKbpp2mswVEEC/k7IazdXdcM/Ni0=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=Bkgsw53ODr8XaXUD17PcC5FRHbvo+Hj9oUoU7c63dJOdmDp/EnqzSGAMkk0hdiKOd
 E4xPF4Jdbd3EbB6LoB6ThzJkrRnunN5btutCoHYM6AOvroVM9f2DA7AGsBRUNSh0Hd
 VK0/S6+hUKS5DyOJQzlpsaiHqMC8iyCiJGXyuBRPaqbv5dd8WMaBdv/dSkfpQEaJAm
 b4Fg3auh6B5taY7kmlsmJHtfbXbXYYXffBzHmc6C2O1OK3b77+RDaF6R84qLa2zJTD
 F+hATlco0LtV1KUJZuAPURjFkXSRy7w8Hpgq2f6yRqL1XByhg5RxiLir1LuEx8eWgJ
 IORlWxq5oudHg==
Message-ID: <2992a565-7ec4-3714-5e78-8374f7f12d4e@collabora.com>
Date: Tue, 22 Feb 2022 10:27:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v23 2/7] arm64: dts: mt8183: add svs device information
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Guenter Roeck <linux@roeck-us.net>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>
References: <20220221063939.14969-1-roger.lu@mediatek.com>
 <20220221063939.14969-3-roger.lu@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220221063939.14969-3-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_012739_359766_48F56F6B 
X-CRM114-Status: UNSURE (   6.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 21/02/22 07:39, Roger Lu ha scritto:
> Add compatible/reg/irq/clock/efuse setting in svs node.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Sorry, there was a mistake in the tag (my bad!) - I didn't mean Acked-by, but:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
