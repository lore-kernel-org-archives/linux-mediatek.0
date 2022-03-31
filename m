Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A68C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 14:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WwnlGqZ0Yc4EmwMa2cHMcgPMihMuVEZORz9l7pWZbXA=; b=Djzdm5qex4GwRm
	4DhQM/xTaZMF/8WMrAIEcAFtTxvGwi7Iyt0Qo6oB4dPvz+I9tvjb0O0KZeWtqL1r5nOvYO6R2zp1C
	HrLSmTk9P9355a1zqo7gx1vmHP/aK2blDNtxp58uxeIi794yjgGl1kCbCYbIGs/WQYfOnHyy9QbCo
	sf2k5G9FS2hF/IjkSa6j+ziO6ldXuTGwROo2YjPAZQ6D/CgBNNmvButRyvWsxkwsqhmsJp8tha8Qk
	V4IYeZ6gFcDC81d9/RaMc2ldX4skSjECu5s5PmxVUoYen95iLWemI/dcOLCNjql8QSTACyocPoMnf
	XH5UceKufvUj4nDDpYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZvPd-002Ssp-0v; Thu, 31 Mar 2022 14:04:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZvP2-002ScJ-Cc; Thu, 31 Mar 2022 14:03:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DC55C1F468AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648735434;
 bh=sivL6T4oFKnuk83kIObvJYCqlfog9aKpWYyLs3NeVcA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BWYjqZter5P3ZUkhRWSZ7OewhqABcvUBRcH9UPnE8rWtT4+bc0U6BhwBVwh5b1vQq
 5jc/31tnq6AHvwgbIDDEQPdPqzHIfb+DFiUFGZfDCe9Zo+07voiLw8LKtvvaBn55HU
 PcSf28Bue1KM67juNGvjvJO8gO59KdK/ATAvBpxunPRxZNejHVb13b1Qc82OirkHzY
 ygTr6lVLS1Q54RXknXUQG6NQPIrVEsuNhHM1DQ+zwi1mdGLHWN4UzmH9apDNFM6pD9
 3m8cIMZDLPSKsRsMzd9o0ukW2/lBb8IW9mw75tsWmq6GvcArAdEoP//+bHfsk/ew8u
 77yt4E1RS0QbA==
Message-ID: <b2d5d1a5-9b0e-1a70-a18e-819ae1354e0c@collabora.com>
Date: Thu, 31 Mar 2022 16:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 4/4] dt-bindings: pwm: Add compatible for MediaTek
 MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 jitao.shi@mediatek.com
References: <1648730873-18505-1-git-send-email-xinlei.lee@mediatek.com>
 <1648730873-18505-5-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1648730873-18505-5-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_070356_624441_263C18F6 
X-CRM114-Status: UNSURE (   5.72  )
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

Il 31/03/22 14:47, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of pwm for MediaTek MT8186 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
