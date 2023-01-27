Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C506FC38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahTPIvNoGLx5rHnfbzBWuMSFpDkm5Kzs442yNpqblFM=; b=DG04KhU+lF4tWswLkGKUtt7BNU
	xm+dHRM9/CccI0jPzQaorLAFTF8LYUG8QRpNnxMfbVH0t0xc8DE/sqKjHLGJ+AFnsDBOVVXnjgRbw
	IjH6yPGyxOr46pZoCLKopO2VNp1+KVM22gXH4Mmuity8V/YAbEsNZ/E5aqfaZHnwGqQaiHXp9SSS0
	s/6Muxr4q5Ay6S+SWDfV+hX3QIkfvWooL+WnTwwVK8V1fYCNy0rlWivJ6hau4Xx9MwnKnBNzy1zEy
	lRUAlILydv+H47SDy0nn5VW6prx//YuliM452MWMNQTmwlxpDTKFh/ogoOdoNmB5N9zvjVy0yvnMb
	x2Q7uvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPs9-00FKFg-6m; Fri, 27 Jan 2023 14:38:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPrv-00FKBX-HC; Fri, 27 Jan 2023 14:38:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 192A8B82126;
	Fri, 27 Jan 2023 14:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39A1C433D2;
	Fri, 27 Jan 2023 14:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674830296;
	bh=bTSW7NmUsG8tgCcNy2Sa9snhAmKGyq9mToBUWqqSejs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tPljhGE8A8JrC03p17PQpzYPtj3u75TC2O/cCxPLGk7/Pmz5E/ImwxNSE8X1ldeAo
	 tTr7Y5V6jtLpeG/wzh6dpC6F4GtN0gucg5gzrvT7JOmJ++JYoUyGHXibvBBnZqorVM
	 hB9wqE7Vg9ddwFl+Ux8p5/6zmkVBUM0MMt36rd2+Yg5qcg/OsOFCTEIGxMX8F8SfEf
	 y36NhgZyoLpyXnJixgHK1oB/FMExUaFyk3A7kqqZKO1LrmDjqJA/SSBRw51/tNYBY9
	 5jPeHU6lRheS1fMNKS8pl8HJeTIyXFJz8MzJhdNhcfsqkRB9gOjLofn8lhEOsvOcZM
	 mHWz3+n54xWzw==
Date: Fri, 27 Jan 2023 14:38:08 +0000
From: Lee Jones <lee@kernel.org>
To: Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de,
	maz@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
	chunfeng.yun@mediatek.com, angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com, nfraprado@collabora.com,
	andrew@lunn.ch, gtk3@inbox.ru, sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: Re: [PATCH v8 3/9] dt-bindings: mfd: syscon: Add mt8365-syscfg
Message-ID: <Y9Ph0E09GycQ20J4@google.com>
References: <20230123163833.1007181-1-bero@baylibre.com>
 <20230123163833.1007181-4-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230123163833.1007181-4-bero@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_063819_748980_287A3A62 
X-CRM114-Status: UNSURE (   9.15  )
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

On Mon, 23 Jan 2023, Bernhard Rosenkränzer wrote:

> Document Mediatek mt8365-syscfg
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks

-- 
Lee Jones [李琼斯]

