Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78531C4167D
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Nov 2023 08:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BHe2s7N7UhQ9NmzGa2wDSUEXqpKKDYqivq/lG1viq8=; b=o6THlEgftS+//d4ujb+CYSQmpd
	n3AsbKg2y2kLBKM6MbkIVAKeOqd7XpXZqIK6ur1q3zi1GfceTzsVImk46zZg48iv6XiDIitRsvULq
	+unAy2qppCKPHckQEDHA25LnC/Q9Z5NguFFNwNm/RagbTzLYspzWpBPzX9tVKeECmOUjnY69BZ1Ca
	7SJCi8sygl3uNDiw/kSQLO2O9Z/yyPgyZVRTLdIjvL5YCFFL992OER5SlSHs6CoRgo49Ilw+yV+a/
	z+JM66M24gTNf4WNfCVv7Q5TCvZ3DhDxMT7XisAxSaWWTIdJNkwsrmMJoPnf1dVdxPNJgdYXLowNW
	Mh57lufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qypYl-00Az3u-1q;
	Fri, 03 Nov 2023 08:29:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qypYd-00AyzI-1E;
	Fri, 03 Nov 2023 08:29:39 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9519766073C9;
	Fri,  3 Nov 2023 08:29:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699000169;
	bh=q4V0vl8FcNqNu5vvhmKxKcxZeSyilVA3JCvbYjamE9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fvdq8wmmEZnOBlTfvKFXOGmpAeMPZuAJB0VxJE3RAVD+Ih5D7v0lLz07ZmeDYqG/6
	 7rNCheJwwFTcojv0iTsKlgGiYHff9nZ07LaQIdOmK3NaZDw6dXTRaMQuJNlmgB8woZ
	 CJSZTBXWMyCInVOCw0JcDqqCiAO6H7vmkkwme0F1f+E2obLyJfYT+apgyOyzin+4Yr
	 Hm0WzUX1dEvPqPNKOYg2RgydqpoGszAXyAW1FMBcbOeLhQDyqqr/7kGNQaRAFMCEeY
	 +9otrifu1eh45r7DS4d5hWINSZm1S4EHSMoUqyUVbvANHaWUhxAhSbYjHLji/yQU/h
	 p87gxM8CxTBFA==
Message-ID: <78bb92ac-3732-49e2-a33b-b01b59965b2e@collabora.com>
Date: Fri, 3 Nov 2023 09:29:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/16] dt-bindings: display: mediatek: padding: add
 compatible for MT8195
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231031083357.13775-1-moudy.ho@mediatek.com>
 <20231031083357.13775-17-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231031083357.13775-17-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_012935_572230_C1652A79 
X-CRM114-Status: UNSURE (   6.49  )
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

Il 31/10/23 09:33, Moudy Ho ha scritto:
> Add a compatible string for the PADDING block in MediaTek MT8195 that
> is controlled by MDP3.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


