Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1B0C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 01:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sUZLTG+t90yoU9i3sUGvWL7wWsSrAjylIw68RYc+Zo=; b=E3K1nkUvgg2rL5NaG7g22SqiW4
	Og5hsKQI5OEfDM3wf+eSbKb74mLiseWykmrygNKDQdJmKXfd0IXj+F3uDAvSzuDie9F+T26vHtQ53
	h7ePGczPtaT0YGJgv7RK4uiVm7DH/ap7/TkmgA0kc3GFdSdsaFmnogZ1VtJ6b5VVLUni/QfgBg7bS
	UhWlf1MoSM2Q+kl6c4XNZYJrg+AMv3PKVSP4YmJoglC6MCS6NV6nAv9kK/L9cgW8WTLrjNCOJKRPL
	uuXPizVBoxZq69i1xSlNtAwHnadTFMew3VQJIPyA12A+Bj83lFdZ5Mbcqln77GX0ZLXAv98Qi/MMf
	gR17QRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzoq-00000007Wxg-3tp7;
	Sat, 20 Apr 2024 01:47:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzom-00000007Wx8-3ddl;
	Sat, 20 Apr 2024 01:47:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D816861A8B;
	Sat, 20 Apr 2024 01:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4F2C072AA;
	Sat, 20 Apr 2024 01:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713577622;
	bh=+sUZLTG+t90yoU9i3sUGvWL7wWsSrAjylIw68RYc+Zo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oS+NQhODQ20kg1MTtN8clw9/2/QFBDeTfyYuWD041J5m14038RxMFNyAaphbRqjC8
	 STAqCxd8ff67DIVjH2IoU8a5TBN1Fwk6SWLT1TtJpATFNE6F75Wkgz9ac6eS2/JZd9
	 FE+oBKJkAlgdDunqbkvtn2PT6uNbezuHlqy8OmrTW4Uinohk7hVXD4tllJzG8MkpqB
	 TkzvRyy+9rlWxo/qrJ7hWbDsq5zcNb1vSpLx7Jv94KwGqnRfolTNa92/sV67b4YDYm
	 BJhKRei5NGEUEEUd+27gM04Rr22OYw5ey3921IxO8jwGF8Gvj/cthjTMGaGHVFgrHX
	 wGdzNAydXfLDQ==
Message-ID: <ca6611df78c2518dac607ab2241d1556.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240417-spmi-multi-master-support-v10-1-5bc6d322e266@linaro.org>
References: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org> <20240417-spmi-multi-master-support-v10-1-5bc6d322e266@linaro.org>
Subject: Re: [PATCH v10 1/7] dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Date: Fri, 19 Apr 2024 18:47:00 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_184704_972542_54DD8BB6 
X-CRM114-Status: UNSURE (   8.92  )
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

Quoting Abel Vesa (2024-04-17 13:00:53)
> Add dedicated schema for X1E80100 PMIC ARB. This is not the first
> platform to introduce multiple buses. In fact, all platforms that
> implement the version 7 for the SPMI PMIC arbiter have multiple buses.
> Since the compatible should not be version based, the platform specific
> one is used. The X1E80100 platform is the first platform to really need
> the second master, as all the available boards have the PMICs that
> provide the eUSB2 repeater on the second bus.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Applied to spmi-next

