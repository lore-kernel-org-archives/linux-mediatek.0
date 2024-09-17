Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C81CCAC593
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Sep 2024 17:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VvxXMxcafFA0iLzl+qK+B8NzFkMQKxHmtwIhDsRZPXo=; b=i1uTuSJWm+00vJQ+13qPPJpTnZ
	u5zBVToA9hmyUG52WiFDmYRklcFp5+RQ/Lti9WBg69OYkCwEgeanAZLsxFMSjRsVeEBBAppYp+XOP
	TY1Xy4snWccjAiJP/Cwm5Hs1Zq4je5qo3mZlFA8LkZYqbJKAXgemaPjKzvcT0Rj5+BhCvmgKZU2wr
	TWN7a1W7fxq+bCmnY8dLjw2XIWZhkO8JN6V4uejj07Hd21o094w1QRaSHh6rDC+MT8Vjn4jvNXevs
	seYm4Yn8MgPaCVROJWGndHZzPXsdwnZeEOVMj/GbogbB38a9ZJvD9OpEMxtmkhc8ktKPbt+jVxRMi
	LCI7XOEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqc5v-00000006c7X-2PVE;
	Tue, 17 Sep 2024 17:34:31 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqc5s-00000006c52-0KoN;
	Tue, 17 Sep 2024 17:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1726594447; x=1727199247; i=markus.elfring@web.de;
	bh=VvxXMxcafFA0iLzl+qK+B8NzFkMQKxHmtwIhDsRZPXo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gBEzK9qi8UyIR092liEla+QBpZq0Ub7l2RhydbPCxF4mOLHJKtCl+2oqWdjWeeEC
	 zDiyqiGUCJnt9NAacejtUubzfwZDTKus1i3IbB07JL3lxn/sScsNMZfmVJcsFqDK+
	 G9QKcxcSUjqTHUWfml7bo/WRodevMTywyA10wilp2IOU0807AdoYjg2vPD4JYlW0e
	 1yr2hWqcbApFFDo51w3PLnFGcCfvqUsCKL344dWbpSEh3Ip0br510ELJMvBRIR1u2
	 Fr0eXZP0w/V3EyfaISAj5TjdoAcf1mZeeNPegbwBB9JjlQHL6Gje2Wnhr5Q4DfYsn
	 +uWe6cm8lHIla9adHQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M59iy-1sri151XV6-00FyQ9; Tue, 17
 Sep 2024 19:34:07 +0200
Message-ID: <254d16d9-d56a-4f26-9914-db75e7aa4287@web.de>
Date: Tue, 17 Sep 2024 19:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Alexandre Mergnat <amergnat@baylibre.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH 0/2] drm/mediatek: Adjustments for mtk_gem_prime_vmap()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jv+5loKG9MPWnWE+0Bw5fMhaNdpSXHI8EOSzOuaZT4ehxYInQxj
 7c6Xgp9F+toHHG67l/6roH+nG6fFLgJMjqCbRlGtsDTIWblY7w6Feuju5nNwPbuqmV9qgyY
 huhUYjgAeEtyqwWqgF71riV05jqgOOLF3CNlpISn0YAniREiQ+vsCt6BhmpYuCGl2CSa1Ca
 75wXNYkbm/Wi6VT/gnjhg==
UI-OutboundReport: notjunk:1;M01:P0:gJl61uCuOo0=;bfzP37UybJyqlZzICuvPdQFk1d8
 Ot9IuSNEXn1l5q56UfyK45AaxmXH2CuvIzBLMT6/OKcxICUwr0BblBrf429mQL6zQMIK/CkCI
 WXywfOmZYZ1GlZLnXJuw9owGD79v4/pxClkhNRnbAymTZpenkjcWiRmf9Sv8TDGceDOIeXEt6
 7LaUecWTUxqFI1U74KI6wIavFXAWn9vNMGBnFUy0pRml0Ete/hc0j/9Axpoq4M6HYGdHvgRMp
 laylo31IlmAmL26oH4lfTy3z+4lPGfvJtlF4A0sm9RD7CBrfj1OXU0Xx+9JflFN801xJNWGKb
 h4OskiRy+DX7tbsb2stt7tRJTxaJ/fgtSpaBcMWszdHc1GUJx2CTLDp5Sgg6DFZ34q34rALlR
 MFVCe4jwu5yO2se3BODmoos/cdaACr8e3NCMlyHNDuMpOJRPTb27JhnldY851MFsjkq7KxoP/
 hLxkA83ZEOSkx/1dttShIClxEqBgvklgJ++2SL+4RvUTtfkfsPqmWeelFv52Yig7x7ajSN1km
 YfKuiHy37thJ3B7W73Xr34PYEJb/vIFpuVVdnJsOHid0UijBrVI3jOVX4D65fKewkIcEgnaAH
 bnzJOBe0848ijaOd3tk0ZZg/cORfN2Nt7K4bV4R7/tnuQUY85Wv5NxHMgt9wTUgnvJKJm2auw
 vd0HKfL2SfusoZHyKf41KPkeblnsPFCqfiLJiAlr5koxhKwad01l19EXfKS78RaniIvkzexIU
 SqDx1juO9LeGmZNxCiyb80al4GHSSzQaA0aoCxw6uD0P3TjOxSpRqFlECVZhcKtpCio58G7lB
 McgTmXRJUMSz1kIWiwkzJBBg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_103428_412135_756E676E 
X-CRM114-Status: UNSURE (   4.68  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 17 Sep 2024 19:16:45 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Avoid duplicate sg_free_table(sgt) call
  Use common error handling code

 drivers/gpu/drm/mediatek/mtk_gem.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

=2D-
2.46.0


