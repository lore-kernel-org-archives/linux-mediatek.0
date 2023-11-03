Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2845AC001B5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Nov 2023 08:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCxGXm0F16nwo7sE5SAOu7sGWuvohp4MMJgQ8O5GeME=; b=MtSkHUVOMyzu/vOHez4yttNalY
	/JZyeaOWWUH+T2E2FG/PLXUCGtIQKsZBUvCJJgvHPZWYbsyr0TVolOPxex4qHBqWfXR0YQKZaCs78
	bBnmASvRf4SfZxu4hdJowxs/0BGMJMEECnYgm2O00aFBCnDKUoLMOSBkz5CYjDVUjfl+s7C/ZH6rD
	FyxSEFW0TjAfrIxR62et9Qw3+PhMP5b5Dm386APYULA8MCBU2QxcHKuatusEyut1f6aughf3zai9Y
	hqDKlTIDkXmvbAzq7qv320hrtaDiinnY64N4IyeJeu+s0qngPlTr5LSAYA5xlkQh1UvlTp4pYjt+c
	eA4C/aPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qypYl-00Az3G-0g;
	Fri, 03 Nov 2023 08:29:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qypYd-00AyzT-1E;
	Fri, 03 Nov 2023 08:29:39 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B04B666073D3;
	Fri,  3 Nov 2023 08:29:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699000173;
	bh=vw7myPhnnW0WrXXxGdi2VzjrGJrgjwsfmjuxhDjlJmM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MsEQPBNZ6B6fZyusPxl6Xyf+z0o8US9v+qNtEd9jc3P1L4Nx/CWVQ+OjTKiSijAiR
	 qj87cSx2+zFeSp9KRwNd2rehyVZKMQiU6bfbOjuN3I3ceqa5/A4FhRn0DhlRUqs4HX
	 eLnLkI2+828N4pPPJm3EZKTgzsX6ArmqN5k/UZfQ3hP3xNpBHD1xM9PquaUvhZrnTl
	 Dn13LK3qgh26JxGE2sJAhu1KqfDqMgV6wJHWpm6SDodfDLZyEHH+wpTlIcjQSJQT2S
	 l6hGBMCh1PgGJFrT0S/rkUsYgGS9/Nyvs4feFRuzkLvyGBr9B0/KiF94pVOZsP3ngW
	 vC62ZbNI7T07w==
Message-ID: <9abc1dfe-c379-4370-9f3b-c432eafc9837@collabora.com>
Date: Fri, 3 Nov 2023 09:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/16] dt-bindings: media: mediatek: mdp3: add
 component STITCH for MT8195
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
 <20231031083357.13775-9-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231031083357.13775-9-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_012935_571860_5938C506 
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
> Add the fundamental hardware configuration of component STITCH,
> which is controlled by MDP3 on MT8195.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



