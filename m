Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5675D15D90
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 13:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CR5ulO+WCsIf1F3taKOvKcOMGbJ7G31ZnsePKMPGYw=; b=Iy/qqv2CglD5i5EiGTIcUgKtzP
	QCybSMpKLxMaLJ++nEAlJaklIpo16/P4jy7ASMTjCTQ009Nejjasdk2Z+7jG8qKBU3OOglOp2uXun
	hfdD+04R2dFSgnw58D+P1131g09uOqAHo99eyLjkFVm/RR+WiljG8u5mnT9i/2JujR+tI8yCb8qc9
	pJ+xZW3N79LtKmd158xAyXKLdElqYi/WhbiTZxmYLJm9WQJxvKYKc7De6Gr1OvCeJtMncGm/eetbk
	Rqhgo/+d68PW9FP0HQpZeUdPbCvlA2MIXmln5lbRJvvoQR8PKEt6gsVG5peDztXbHTaQi1zT7qDEU
	9zca6ODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sag-00000007RLr-3rVc;
	Mon, 21 Oct 2024 13:36:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sP0-00000007PRQ-16dO;
	Mon, 21 Oct 2024 13:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729517091;
	bh=rV80u/k3jOFu4yEbtYLRmEDMmculFGX04fxA7xDWrDo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QkH5yNv+zWr45ie1/RbYl8VSty1fYMUxHfvI3d1i9SQ9926R/L36aSBkdIXw+mpZC
	 eA/QXlfzhA7ultJn5U6zlHtjjmYFrsxa0Go7qZjWy9hQNKON0U9wfsH1JHXWVWrrAO
	 Nioy0UR6Nhdc9StYFcim4XfxkKkFe+m90OmLf8c2V0yq3Bwf5zajynwQWLE2uJ3HfH
	 qmDazi7CK/KErpIAaG/5Ow61Mz8nB1qdyGa2feF2j5iou7z6xPmnDBicPZJj9Qz3Td
	 DMMAiBs1eoKllORIYdCSor0tljhNmCl0968vTNR1f1wMGgQ1w7s1Wm5IPRXsW3TSAh
	 oXWGMDKL2AubA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9EE1017E3616;
	Mon, 21 Oct 2024 15:24:50 +0200 (CEST)
Message-ID: <88b78bd6-2333-494b-909b-9fa73cffff75@collabora.com>
Date: Mon, 21 Oct 2024 15:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] Input: mtk-pmic-keys - Add support for MT6328
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 jason-ch chen <Jason-ch.Chen@mediatek.com>,
 Chen Zhong <chen.zhong@mediatek.com>, Flora Fu <flora.fu@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
 <20241018081050.23592-7-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241018081050.23592-7-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_062454_511781_70D199DA 
X-CRM114-Status: UNSURE (   7.53  )
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

Il 18/10/24 10:10, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add a compatible string and related data for the PMIC keys on the
> MT6328 PMIC.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



