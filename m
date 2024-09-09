Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4EFECE589
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 20:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZrQ5VHLk1tA7kiaeGofa3flE1g1BnftMlLoittxaRY=; b=2yOO9W3z4HR8sSBckLS9+8hxUR
	Iqo3DYb9nsnAM2i49t5SCvG8wpL0D5zXIs9UIg3A9vCAcPGkBrjZr+DxJg8rZso1xZYzFdqkP6ZT0
	Luo4DbS5E7SwJlAevCCtdWluD8vw03w5VR6CS+tiTqnorDrrlAfbbvg6S9cwHQ87IIUGlDCauQNxz
	H9sFOKh8LLH4WeXaEtWdh/oxqEBYBwfjQCg9eojH0VbpziGp3O5inowM1hJAaEv+/nAofPx5hWc4i
	4Qifp1+L8jQW/jg4Jt2y7HgZmJFDTbtHU3Vca8D2DSUPqkRkQROtU2zyPVA8b7PEkZG1uDQmiGVaZ
	2ngL18zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snlPc-00000003ISv-1KgL;
	Mon, 09 Sep 2024 20:55:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snlOZ-00000003IHM-33sj;
	Mon, 09 Sep 2024 20:54:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 264AC5C0606;
	Mon,  9 Sep 2024 20:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF9BC4CEC5;
	Mon,  9 Sep 2024 20:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725915238;
	bh=OZrQ5VHLk1tA7kiaeGofa3flE1g1BnftMlLoittxaRY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CnWzYTxb3ULUB5oKpi2o0X+AFl3YFhfqZj+cUBeuMgyr3rv3rIkwOj9yTmTVupqPR
	 UzSJ+Izh8+MJDvTWhumOp1ej67K1nR5qMxiIORNLzX24nXIvOIkLmIIUscMBncKitT
	 gRob3Qvvg5vWOkhYcbHQeJsj5QnpR9MV+yR6f+AgFGPJ8TRQ7BI98tYbP4fvdJNQSF
	 yFymuKDN83jz+UwO8oMJzmXT15mp/oU2Ekv8eCz5XcntQvYYblYhTYH4nVN+uF+kCY
	 TzidZjAWNAE4efHOOUoeZ3F0NszCj9e80+aGjO3+QFo+Xkhnb36QO2iSbM1Kuxp+LW
	 crwNROQK4p3Gw==
Message-ID: <702f0a6c2a7529eee53681239056ffef.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240909111535.528624-11-fshao@chromium.org>
References: <20240909111535.528624-1-fshao@chromium.org> <20240909111535.528624-11-fshao@chromium.org>
Subject: Re: [PATCH 10/13] dt-bindings: spmi: spmi-mtk-pmif: Add compatible for MT8188
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 09 Sep 2024 13:53:56 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_135359_828181_6E32EC11 
X-CRM114-Status: UNSURE (   7.39  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Fei Shao (2024-09-09 04:14:23)
> Add compatible string for the SPMI block on MT8188 SoC, which is
> compatible with the one used on MT8195.
>=20
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

