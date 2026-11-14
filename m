Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7A1606A887
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 18:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ABl2dYci;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dqN2USbo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PJNfcwrmAFaUkaLd1UPZ4/LzkLaozmIFNhW+jQqUEGE=; b=ABl2dYciAJAIEJj7qPHqWYQcpU
	MVXhQ2P6PvrNgTzO2xOJbaST/DNTG40329NwhHVFUsMzjEaNtBH2Ist5d7Ofy1RB0iVK1H9YU6wnZ
	LDPpgvClYpvyws8AKn14rq/Sk+gmTKDAiyKdHdjyzI3DKT7ZLsKkph9A2uUrABv3aVMS/Yhl2umP+
	w5Nui4onLQqgwo/n9AuUHGsUpEj5ucpcoYm96FSM0LkJ2DztukvLHfhMCxZ8hRRTxXHLqQdLgTumf
	IeOVWubO2NlBmzECqJCk4AsIK6E3nJBos6M18OzTiT1ocALJ0OeJHnXlHS0mp/9Id/VqJ8dHPNJrM
	Hn02Sg1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSI55-0000000GZZf-2tgs;
	Sat, 14 Nov 2026 18:02:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSI54-0000000GZZ6-0Vkd;
	Sat, 14 Nov 2026 18:02:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 13F3340470;
	Sat, 14 Nov 2026 18:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF93C1F000C4;
	Sat, 14 Nov 2026 18:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794679344;
	bh=PJNfcwrmAFaUkaLd1UPZ4/LzkLaozmIFNhW+jQqUEGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dqN2USboTzOzrNRYfuknBDbIGM+WednylywbFoxzO+rydYId6eNepPZMnLMljFcpR
	 wqjXPG17jtHMep2fDXZicEbi2PTd3N48I1T0VTZbeGmnlXXMfBYNg0SElL9MFRhPOL
	 YvkDFszNDfz2FvAFcYh68KKbCkNnam7sWhLKhBONb0g4LzxraizJ8GBLCAjlJzg3WR
	 8WHVRH5yXWckSDUqRu5HmTOT0/5xABq/intI/8hU+nAEpzn7VMl7oMathspL55vMuv
	 3HaeCliXXbmZFZNz0/sdWLJBbelyfuCNV1ZH0O6G09BGqsWW02uKMTjWAnghHZrGEf
	 XEXZgb76kPnog==
Date: Sat, 14 Nov 2026 19:02:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>
Cc: "Martin K. Petersen" <mkp@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	devicetree@vger.kernel.org, Ajay Neeli <ajay.neeli@amd.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-arm-msm@vger.kernel.org, 
	Peter Wang <peter.wang@mediatek.com>, linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Asutosh Das <quic_asutoshd@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
	Stanley Jhu <stanleyjhu@google.com>, Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev, 
	linux-scsi@vger.kernel.org, Bean Huo <beanhuo@micron.com>, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Pedro Sousa <pedrom.sousa@synopsys.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, eballetb@redhat.com, 
	Peter Griffin <peter.griffin@linaro.org>, echanude@redhat.com, Chaotian Jing <chaotian.jing@mediatek.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-rockchip@lists.infradead.org, clizzi@redhat.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, Orson Zhai <orsonzhai@gmail.com>, aruizrui@redhat.com, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v11 12/14] dt-bindings: ufs: Add NXP S32N79 UFS host
 controller
Message-ID: <20261114-bouncy-emotional-mushroom-fcaf2e@quoll>
References: <20261114-b4-ufs-s32n7-v11-0-dc36e11919d5@oss.nxp.com>
 <20261114-b4-ufs-s32n7-v11-12-dc36e11919d5@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261114-b4-ufs-s32n7-v11-12-dc36e11919d5@oss.nxp.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 12:55:44PM +0100, Larisa Grigore wrote:
> +  clock-names:
> +    items:
> +      - const: core
> +
> +  lanes-per-direction:
> +    const: 2

Drop, this is implied by the compatible.

This makes sense only if UFS device is on the board thus the actual
lanes differ for one SoC.

Best regards,
Krzysztof


