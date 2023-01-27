Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B654C38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 23:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kKS9aT1WtS/XkkjtRynsbEGmOvV+3XOpGI2Q+vU2ic=; b=J8haJ0gaqESHDC/rR0EThZ7K0Z
	8PRMXwznxtUb9Itmq6R83q05BiUwN23qdsC+ia/rM2EiCwN/f7CPPK8vimq4ArDjlvf5TluLtLXcw
	HnZCEsYiDG3gM7bhSF+yx+PvY5Or3xj1Liqaqf5jQeQVY4oyW7lMUGlvi0QtNO8lrI62NHK+2z7Ii
	xtNZYT6EMCI/N/8m0LItNeLiB/Is/HdgiRrE/whOYFkpbmR+/SsoLEVvrllpu+Nx/6S+drjtFL7Sp
	ZTxzspNHROz+9HcnS+L2jddhqyXp5ecoi15Tt1eZVZ1BGu76CIAsjuk5ou6mKjJ6qVFReM7nTIWUl
	gCb0ypjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLXyi-00GoTA-Us; Fri, 27 Jan 2023 23:17:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLXyS-00GoMc-Ox; Fri, 27 Jan 2023 23:17:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3BAB9B82208;
	Fri, 27 Jan 2023 23:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D319EC433EF;
	Fri, 27 Jan 2023 23:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674861454;
	bh=UFxjpIbYoFQ6NbJOkP2MqtpAr04UPlyKiZQ82r5f//I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Y3wvr9+Px6TzEMg2qb2Tnx8CpTdh/FgDt/QyyShHIASvUX7iEr1W5YIPxSCkEu5jO
	 nUuKHNnx4FQk3Aet8xQYf2RZZdVOt4mZXt0m2BaDs/cS3WJaMYsX1qagZUF9Mzqesu
	 eBNVd5EhUeQXjEFzF+mW0RfcNxC55QdDPmkO3btpP4+WnC9ojXjjKGsadzAig0HSaZ
	 fS9AHqOvz9u83b6dtU1Z4gaO1DKYOskZW0rtLBU2c87MKSpPKNBhrRdWPQlR6vsbrH
	 zvRaYKmZp3WoduEtLh+Og/muuK4moYdkjgzzj/M1024sU0xoGAIDHZlb+bLPN7wF4H
	 mq16XN6lK8xsQ==
Message-ID: <bba37b76bc7fbd8ad45e8c7a0b3c8dd0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cc85ee470c781ff4013f6c21c92c0a21574b12b2.1674703830.git.daniel@makrotopia.org>
References: <cover.1674703830.git.daniel@makrotopia.org> <cc85ee470c781ff4013f6c21c92c0a21574b12b2.1674703830.git.daniel@makrotopia.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: clock: Add compatibles for MT7981
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jianhui Zhao <zhaojh329@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>, Chen-Yu Tsai <wenst@chromium.org>, Edward-JW Yang <edward-jw.yang@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Miles Chen <miles.chen@mediatek.com>
To: Daniel Golle <daniel@makrotopia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Fri, 27 Jan 2023 15:17:32 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_151737_826347_6B7F8A5E 
X-CRM114-Status: UNSURE (   9.30  )
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

Quoting Daniel Golle (2023-01-25 19:33:46)
> Add compatible string for MT7981 to existing bindings at
>  - mediatek,apmixedsys.yaml
>  - mediatek,topckgen.yaml
>  - mediatek,ethsys.txt
>  - mediatek,infracfg.yaml
>  - mediatek,sgmiisys.txt
>=20
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

