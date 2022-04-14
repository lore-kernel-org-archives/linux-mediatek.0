Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9257C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 11:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYlxzd1LqmLsJHgLIiYhfOYP4iCCcGg1pGErmQwHe2Y=; b=TqwoEXNX+GKqBk
	VP4yH4qpS0YFUv/rrkec0M6sAmOW5krH9MdQilxYkNQb8IITgPV/n9X/cEepBrl205aSVBj8gUlaq
	pgJt2JgM+jfA3BqQqOL0NLgIzFVyY1QRynO0M/qzmQGU9/Kf5SmZlh8bAJkYgi1ZglkAHby9KaZLn
	nQ/1hqqjP9YEXSdPOoPSzQSNnGOmpgSHOziiG6NgpbzVQZFNZ3O03BxcVujyHzg5ecWluAEfnrszf
	xw+B1Pvltkm8ZW4tanI/jYSUVxL4W/aRqP0npFCp5NDNkiUyTyqQIbF3oYz/IE40BQH3s1PnmfJw+
	bBSozrUdHUhGYytG3HCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ney0V-005KXs-EC; Thu, 14 Apr 2022 11:51:27 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ney0J-005KTE-Kd; Thu, 14 Apr 2022 11:51:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1EEEC1F47996
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649937067;
 bh=FQo3+DfDK/439bMdjsIJSbbQW7m+3RsLgRDDfki4H+U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YtZBD7RNl720F69+xtlmXyfdDxjpi1ksA1V3yHN1HBA6AEH5w+VeB7DI9ibavjKHp
 ZjGwaDwxN6p4gy8x8MbJRnoAamqkn+diH9XzFHyDYHLNqyUhI5IkEXRuv1V9yIzUDU
 AYKcVdlaGGJYKVZd0ruW3n8o5eHJ/KA0XifmgbWE0Zi+B8mz0QSBmBpFmHyQTnPCGV
 qiWeXeq4ZGX5n+lMeRiDzj4II7gDE09xt+ks3FgMSN1jDl1LJ5P3bgAvEVMRBgwHdA
 5FFEZ0UDm6uyqdjercTqlpjz0C2WX369JjI3QCtFbS/aax9x7MO9bYwmNdz+pG65OE
 re3ANfGXiXIIA==
Message-ID: <ee2f0819-8c9e-4160-c4ae-fb4ad0da3f3b@collabora.com>
Date: Thu, 14 Apr 2022 13:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 1/2] dt-bindings: Add DT schema for Arm Mali Valhall GPU
Content-Language: en-US
To: Nick Fan <Nick.Fan@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 Daniel Vetter <daniel@ffwll.ch>, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
References: <20220414025023.11516-1-Nick.Fan@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220414025023.11516-1-Nick.Fan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_045115_835324_EE27C2C2 
X-CRM114-Status: UNSURE (   8.90  )
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

Il 14/04/22 04:50, Nick Fan ha scritto:
> Add devicetree schema for Arm Mali Valhall GPU
> 
> Define a compatible string for the Mali Valhall GPU
> for MediaTek's SoC platform.
> 
> Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>

Hello Nick,
Unfortunately, this binding is completely wrong.

First of all, there's no arm,mali-valhall driver upstream - this will be managed
by panfrost later, yes, but right now there's no support.
Then, you're also setting opp-microvolt in a way that will never (or, at least,
not anytime soon) be supported by the upstream driver, as it manages only one
supply for devfreq scaling.

Besides, please don't push bindings that have no upstream driver, especially if
these are for downstream drivers requiring proprietary components, while a
completely open source implementation is in the works.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
