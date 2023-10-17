Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C490CCDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qRpfANk1H0rAcfrgOLMuEJw6Z3mFDp7Ke5p43z51V1E=; b=ml0wId5AWfgSn6
	5Zla6dUKtHgKDTgGIyNal8GFO4CvMsW8MXTcqLC01qKVwZRPBxWd5T93ctGK8tDfCdFW5A+/FYwQn
	mMt5qavOLwhxrWDXF5NxkEUrM5/Bms6Vu5yTZTR+1BV2pw8bP+e4Z3TyUQ0ztSnmoMQCti/qK3fiO
	cFXC3X2KuBx+jLRkvQoyvPktb1kXvSCAadfFRuw2jd/5CJgA2Nx9o0j300wuqA7cM/jLA3wcJ9FSV
	dwE08rHPirGN/14xzoor2KhqTbyO230kMbbYrCfzUIC6z1aoTxJseKH+Ga2iGazTr5qoRrevCsKLf
	ZqzSV2LPfzE44B5Pudfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsgZN-00BrCo-2V;
	Tue, 17 Oct 2023 09:40:57 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsgZC-00Br4H-2o;
	Tue, 17 Oct 2023 09:40:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9C82B66072E4;
	Tue, 17 Oct 2023 10:40:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697535645;
	bh=kQjVqLeOdH5gvp8jQXQYvEd1JANbPVPSLolmO2+nCgo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kVMdTuZagYBRQxpcTop35Qkgjl1sUajVunDREHQ6z4fdpTPwNJC3+uSRRQ4h/ysCt
	 TIojBxd9RCuvI/5ImWj5y12pOQ4Yl7eJ4rrR0Tpf4w0roEAV5oD48+qJSSCXXSjUp0
	 0hx96f9d+6IyVSr3otvGOOecTnul2C4d93Y6K8+eQ8Pf+fzi40WTnSHr5pHDjVLl3j
	 IYJvpXeSRw06xcBUW9TtKlycTzUQCux8euU40tKaQFXuwatZTxSwynmjLpuxl2IF23
	 IkamX/4NMPLdzu5UUXst29p59XJ8uvg/IdhJMOwhpEzj9vj1Q+AtwOqF16zseIMjv8
	 hxu+jfHuDJjYQ==
Message-ID: <8312722e-92b6-4f58-b808-6f1deedf5809@collabora.com>
Date: Tue, 17 Oct 2023 11:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 14/23] drm/mediatek: Add component ID to component
 match structure
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
 <20231016104010.3270-15-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231016104010.3270-15-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_024047_035710_ECC895BD 
X-CRM114-Status: GOOD (  11.54  )
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

Il 16/10/23 12:40, Hsiao Chien Sung ha scritto:
> Add component ID to component match structure so we can
> configure them with a for-loop.
> 
> The main reason we do such code refactoring is that
> there is a new hardware component called "Padding" since
> MT8188, while MT8195 doesn't have this module, we can't
> use the original logic to manage the components.
> 
> While MT8195 does not define Padding in the device tree,
> the corresponding components will be NULL and being skipped
> by the functions.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


