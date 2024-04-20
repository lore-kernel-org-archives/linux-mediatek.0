Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE3EC04FF6
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 01:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWMroMMkLbwhg0gSs8q2CbxK/P5KZ4bNvKuihB+CO8w=; b=4TdEbWZyRRantgZD70VJPwBK2u
	us/HrrITXeAsedOwwjg4CjqShJ4+7YOAhZhFqsFfYFrKNDGhPdoFnDaeI2kuauzbYbVjlMFNcKAO/
	nNHVePH/+nqx8WTMTn4mX0aQpMk0rQe3ib5xrnKl1NU2fepF5KWvRf88cuPJKIwMlnck7msAgvrO+
	o16n+VZ8FgqlVVlw/A8El4xZ2aCaP6ssV/h9DeR7w6h+3AVqGLAIkrJzGlTUrdoGMp7o9kbhSByFz
	R5xQZd2/xnqGdmJrgfpbMaEmK8b1JI4Z06knodi1YMCGAcuujo50EJsjUCUe/jSfRhj7mgOmVntgf
	WDunaWhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzpZ-00000007XI9-1o3V;
	Sat, 20 Apr 2024 01:47:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzpT-00000007XEy-2mdV;
	Sat, 20 Apr 2024 01:47:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D6A8161B59;
	Sat, 20 Apr 2024 01:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB8BC072AA;
	Sat, 20 Apr 2024 01:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713577666;
	bh=cWMroMMkLbwhg0gSs8q2CbxK/P5KZ4bNvKuihB+CO8w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GvB7CbpwrgLe+19HALfFpWAblKKATYyBaO+VbWrsY+zQva+CXF92UhJTlaHuT3ktn
	 XKgZc3N0k2ujq+jUTyDeNxZDNl5g8DRdgQwC4whH/6K+L0PQI9QeTdzBw7c16qfK3M
	 x+6k39438SwPQhHbE1AXu3LeUmSYo4JsE0wBQAd85FBzGdiru3cmtgBU7EtTyIK+RI
	 FJHGwbOxnplGExwNqqdRxfQIjo+nLD/TTkN0+LY1vlRCbOguAdp04zvAGmcWMxaQb/
	 w3Gc33XonrJyYZBXP+bhebdBuvaHCFuFY0DQQuzxh3PBLWPTrwmDvloak1sCLu9XzW
	 Fja6e5FBHPZ4Q==
Message-ID: <729d8422f7ecd601019d015f53bd7cd5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240417-spmi-multi-master-support-v10-4-5bc6d322e266@linaro.org>
References: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org> <20240417-spmi-multi-master-support-v10-4-5bc6d322e266@linaro.org>
Subject: Re: [PATCH v10 4/7] spmi: pmic-arb: Make the APID init a version operation
From: Stephen Boyd <sboyd@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Date: Fri, 19 Apr 2024 18:47:44 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_184747_817019_0565D142 
X-CRM114-Status: UNSURE (   7.21  )
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

Quoting Abel Vesa (2024-04-17 13:00:56)
> Rather than using conditionals in probe function, add the APID init
> as a version specific operation. Due to v7, which supports multiple
> buses, pass on the bus index to be used for sorting out the apid base
> and count.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Applied to spmi-next

