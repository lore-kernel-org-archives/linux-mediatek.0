Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AB3ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 10:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbPr3vI9ZppPBTzwlWkbgUT9piHJTSwWNkOYeSYsnYc=; b=yAbc4sYq3Y68STiHm3uwoLPbff
	fySmn0XxY/ENoZjbH5CFCTySfzMybxDh9ZAHXuIhpoTc3QGNqNsEevWhwsBiGkTP3A9cKKtYMrPR1
	iRv1T2hOjRK+Jg6d5DSgkVaun0v++Xk5Tkzffsa8hHYTBpVvWi4BK5Y8S3uyUm/8iHmufrN49+t18
	/5TZVfbtLeKo0Df8rSCRihpUP6av5i7b8tTf/I7Iz9k3JuKZ/SrbXkNRzg9n5uWldn++OSeNmixNO
	N4NH5xz3PZU8/YIeZ28uE4Jk9+9/nxAZspEsAhV3pJlkBHwvcjSK8skTE5/Jk5n7zdArxNPF5EVfX
	CKI+vcrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYmA5-006p2j-9f; Thu, 15 Sep 2022 10:32:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYm9k-006oXX-F7; Thu, 15 Sep 2022 10:31:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 709E76601DA4;
	Thu, 15 Sep 2022 11:31:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663237899;
	bh=cw5utiGORthyeJlMeh2OqxvWGrsBK/NlZJEzrppZ6R0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OLpV6alBN8hdQ9TNr7vdOPIVGnlYEZD+qYoPEHgvObkIQOJ/nyRFde7jI1kHFtSlC
	 LMewm2YgVgwoROWlg7d1dOU6dWy0ow83BZHAyYHJJljZY3mcd9PQqK0A94amaSzpcG
	 zsn3Smb+3/FitO1oFa0iALsReszrPsNhIPoSBPpXc9fm5KqwgQQwJP7Ih/ZUNyaIYT
	 H/xi64row2bgdYsF4kJ+iw4Wa9RnPiTeZVf8BjzeFJS8PGdvDhk6W4q1OE3Pk37cWn
	 s3Mml/XdCbj/QYEwRBrPlPd3sXjC9jJWX0to8yq2MfTPalGlYfROlfidDPqOeo1Oec
	 E2cqDzzrh/TVg==
Message-ID: <abe4254b-cb81-8a79-9039-36e4c47bc059@collabora.com>
Date: Thu, 15 Sep 2022 12:31:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/3] drm/mediatek: dp: Remove unused register definitions
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie
Cc: matthias.bgg@gmail.com, granquet@baylibre.com, daniel@ffwll.ch,
 jitao.shi@mediatek.com, ck.hu@mediatek.com, liangxu.xu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220915075028.644-1-rex-bc.chen@mediatek.com>
 <20220915075028.644-3-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915075028.644-3-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_033140_700779_101F8CD2 
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

Il 15/09/22 09:50, Bo-Chen Chen ha scritto:
> Some definitions in mtk_dp_reg.h are not used, so remove these
> redundant codes.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



