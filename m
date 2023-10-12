Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1307CCDB484
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 10:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8AIoOmJfS/mBnRQO+je9FEkT9ZSWUOpdDmnsJ1H9+w=; b=VtBXTIsaWDB6CKXf0gKdMNdOoF
	/peFNoZeEh7PcRule8RJ3zWuH/ug+aGVcXBYPS5uUdsdtKWB2O/xcGPTvsHF4GbdxUhgqaBNkEctm
	We0/PTMB8ss7vTO2uT2gCeUTyVDIHpFG+x0Tl0eS9lwiAZd6QvDlwfBCKvowMSi1sVQBtVVEneWOa
	gpbHAG5HYUjUFmwcG5pf7dQHA9TEtT9bKNDmY6XatvV+JIKaamxcaCPGfUrnRfitQqcvoRW/R+aK9
	E/BYGmGhOoxhxszz7FxhOzvpMZfXvcJGcLKrTSYny1Hxh8KEixFyYhhmMf2iewC+YmknhqO1+d7L/
	HJm29TFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqseK-000YR4-1r;
	Thu, 12 Oct 2023 10:10:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqseH-000YNM-1K;
	Thu, 12 Oct 2023 10:10:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 187BE6607341;
	Thu, 12 Oct 2023 11:10:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697105431;
	bh=bOVsBp/GYCnnxUwNLIqNBQpgkKjP3xcUOyT6AhRFAeE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WVVm7ISlCZxqkXFh4ijyyMA+1xQz5Q1FNii0p+fN/3crKTCe9r6PaaU/MyC4gADSP
	 XuX9XhYsxeXz7290WaFUGcs0H//wFp6UDr2fN6CDeUdPhOU+mQkD4m1v7fZRRiDAfA
	 U1PSjjEJBhbNILg2eIjrwP/crH+Px05F+Fby3F3yLQxqME90kv+1ngk4t+UOaYz1rV
	 aMIdaCD43ywi7qLUj/BJPRH2Wx/qJJl+/34U023pUQeYm0v3mBNgSor3ZRg0h3K8S9
	 F+ktZCU4xX9H41YGznJLkZiSKn9zpraEqvDvej5i/uQzIOchwJ+QCv8LNMzO9mP7yW
	 iFfoDE6o1mB2Q==
Message-ID: <5e2854c9-f248-ea8e-02e4-f94cddc28e5a@collabora.com>
Date: Thu, 12 Oct 2023 12:10:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 13/16] dt-bindings: display: mediatek: merge: add
 compatible for MT8195
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-14-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231012084037.19376-14-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_031033_578657_72E79B20 
X-CRM114-Status: UNSURE (   8.44  )
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

Il 12/10/23 10:40, Moudy Ho ha scritto:
> Add a compatible string for the MERGE block in MediaTek MT8195 that
> is controlled by MDP3.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


