Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9917CE732D0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 13:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYxrx0V3P+9k21bFcpVf60TM14gULi5xrats+vg2ZvY=; b=EWawl2/j2hu8pvkgasVQXxL7hW
	c0ItN3VeS8JLgl41dmtLndn+70tJpXS94NSQyB1O1+iUjpuOJyFharFqT6kybeTX0kCzNhbUyDTPC
	uW6dLQA7iWPFyQplB2ShdHu6AU/wFgsRLSJQBbKB0SCGYndbI83yQjoJ2jHkLIgUhM76y5L+xDVcN
	zka5zydZh73OfkLNR+shRXL3Ry6te+UDmZSxGSCG/lbJmtTAlzK9txUX6E10/ZLI0PQHvlzYcplcl
	bgNcQodb/VMVGnOVkiYxfQTmAvilh3tDfAuKUoM0b0ObeH4cxrMTi4Ra7pkHR+3DMWKE7NPUYB2GW
	/xQTfXfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlrSh-004YyJ-0G;
	Thu, 28 Sep 2023 13:53:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlrSc-004YtY-0O;
	Thu, 28 Sep 2023 13:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7A175CE1F13;
	Thu, 28 Sep 2023 13:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749F9C433C7;
	Thu, 28 Sep 2023 13:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695909222;
	bh=iSo3Vv83opeDiMziiEr9meXPXAR2jmotAhidSIfYl6w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PqnkxzaG+HrT5zGQTiwMcCeLp7HVQWUgvpP+JNa+GImZP+vSiQ6/YdVZCnkWr6pdo
	 CkKk9dcvct1QPopVq/V5gAFiOfjnLLr+kDpu+cM9gejtIaC1TG8ssKutPr1OdqCD7M
	 4OgBzFnnrKWOpgZ39TOvPRlMuaAxENgP5Tk4l1iLqXx3iTAM90j7LGZhHqwEc+oYHa
	 OaGLotqMvA6Wa+TbZnIRno5Tx2OXdaMhHwNlT2+eO/Zrtovq7KisCD0uv5VC9qBNSg
	 fr399/rR8vboIG6uNxQ/35Giy7c6fNGdpJbV4QBgPztLYVXDFWLiTXk8/aTrm0llZH
	 SCcckzyFs6aag==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
 Chris Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>, 
 - Keerthy <j-keerthy@ti.com>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20230925212729.1976117-1-robh@kernel.org>
References: <20230925212729.1976117-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: Add missing
 unevaluatedProperties on child node schemas
Message-Id: <169590921918.1613753.10940861151886567899.b4-ty@kernel.org>
Date: Thu, 28 Sep 2023 14:53:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_065346_433624_B563F997 
X-CRM114-Status: UNSURE (   7.88  )
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

On Mon, 25 Sep 2023 16:27:24 -0500, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> Add unevaluatedProperties as needed, and then add any missing properties
> flagged by the addition.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: Add missing unevaluatedProperties on child node schemas
      commit: c7d1263be9396582f86024dc33f336d974496b83

--
Lee Jones [李琼斯]


