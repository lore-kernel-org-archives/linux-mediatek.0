Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DF2CDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 09:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+NLBJ9DFd8e08h5g4a1pEGWL++sSVAGQPRaJ4MTrD8=; b=A183KyJ1TmxtYz
	olu17WU3oMkMQ2++OJE7BwO2IAiBpULRcTKZ+NCQ/UuKg04wJwQqP+oPUJbinmrEFa5HDZLuXN/Ax
	urC7VaX5UTExwI/nwzW2uNQPgu6Wiqlc1uaG3AZOm2algqv90CvLxzVZPSNP5DEJfKM0OQk+LBA+1
	lSYueTiKZLq5J9PFI/yejPIiGLBvLAixYDGepW68Q2KH2i9IUyE9oj/+pKM8tDBQK5Lbq6BpDlFzv
	mD4UjckjZYo6xteU9HHrb/fO3hs5MnkNge5NxBy+s2VbHagKTQ8DxgfvYiukI6UPQk8cAnB6RNCdQ
	3bShycXGoOTL19eYb79Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsgPy-00BprX-0J;
	Tue, 17 Oct 2023 09:31:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsgPv-00Bpqw-1x;
	Tue, 17 Oct 2023 09:31:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 443AF660708F;
	Tue, 17 Oct 2023 10:31:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697535070;
	bh=yclhv5bNfaPgDABNL7/yKJhsmK65OQZKd8eMmUCP7vU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lxB2NUS92oqNdrf5koDvdwu2AxCcuyyVTvYP+0hkbH4c/78+vfniPgdubc1yHR9M1
	 nsihBQXez0ItJ+zCfBc19YQyecoWu68x8m0ZFDlxI6g14llG79/elFjJrKjXb0OFwV
	 3Yowjhmr3a59UsiyOcfr7ht1ea+3xeHhRAcT+kA0s484pAatdI/u9IqmQxc127w6VI
	 qAVJGCivxeqPiNh0qoPaznrBaeeejJSp4nzN1y4drcJyLOr2yEVphepxgG75ffKtCH
	 rXNHdwA8R/Nf2x+nZ66XBLMK1kn6kNsiyxQlWlhe+6CBRMdtAGswmE1RDR4Mx3FOG5
	 aMl9frjlLvjLQ==
Message-ID: <4ca36dba-25a1-4494-a666-e5e57fbbbebd@collabora.com>
Date: Tue, 17 Oct 2023 11:31:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/23] dt-bindings: display: mediatek: padding: Add
 MT8188
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
 <20231016104010.3270-5-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231016104010.3270-5-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_023111_783419_0852E089 
X-CRM114-Status: UNSURE (   6.88  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/10/23 12:39, Hsiao Chien Sung ha scritto:
> Padding is a new hardware module on MediaTek MT8188,
> add dt-bindings for it.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



