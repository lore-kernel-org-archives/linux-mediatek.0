Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C86CDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 09:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHf60gm4a3CUHqUNPAb4s9a8KQhYUasnJkCT3DKyq8Y=; b=xqAPtgr17JQ+Ha
	xhUtNAMZeBJ3mSnID9EPC9HzuV77ctdMdEHsyYOpISzRJboRM1zfR7vmsWkMz/DxgX2hNHbx6beEa
	sVL7U6RGBqdOw0SwYIPZHhAOgD2wqQ+1BfeBNq3YVbxnHRt9jD2N2gymhrR2hIob9OCCunWsZ4wH7
	DFJFu1yv2B+6hSk1QJjRfmE0qlfpvXD2uQl+19Rf+sIf6IhlUiBXhb5pmWJFi7IrqjzuM1dMZHOon
	jvwnP0AvZJnA0reaRUD2rwxIzq8HarWHi+YwnnkKihz1ZmU8GtGgsFGDd21muSMWjOFbLWKCq8Xjk
	BRgwQgqbenG81wMVOjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsgZH-00Br94-39;
	Tue, 17 Oct 2023 09:40:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsgZ9-00Br1o-0d;
	Tue, 17 Oct 2023 09:40:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D7B60660576A;
	Tue, 17 Oct 2023 10:40:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697535641;
	bh=YNxdx1JX6Wev/TGy3jL1BgcQS1i/ioxhm2DBSYzCyX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=csZF6v/cKJcyuUUOWWUlca3a1V5NiRdoMM1GWRrp0CyE7ix0PvXAilp40bPWptKR4
	 7fdD/+fmGB4+jzL7/7DVEdA7oRWhNu4hEgZaXOUJM2skNIa9Z3TgCT74Oah8CvK/La
	 xBJWii/Pf3N2HKZ1xfiapACiBBshIBUOM1YXXHraZXqtZ1hQVGS9WPeV0ctEgKEwW7
	 qCEHipHA/GOE/T5Zfk/d7U3j2DVWLQmS14fgEHMMKrNaTW4Ivlhw4L2SDJF4Vqq+vr
	 HkOeDkBF+csJibC3qUsy3xUqfruIbp8hpDjj/P9ifUR5NfNEPEj6W56OMHIwZPNNqe
	 zCgtV9QxdgEBg==
Message-ID: <05d093f8-688f-4469-9bd5-0a0062b27db3@collabora.com>
Date: Tue, 17 Oct 2023 11:40:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/23] drm/mediatek: Sort OVL adaptor components
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
 <20231016104010.3270-14-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231016104010.3270-14-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_024043_367378_9016974C 
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/10/23 12:40, Hsiao Chien Sung ha scritto:
> Sort OVL adaptor components' names in alphabetical order.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



