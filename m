Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAF8C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 01:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqCqxKjM3qLROE2N3brERnq9h6gXK+FVJVzNjPZ2BbQ=; b=A7/T0dm93hPiKlnOveNy+HBtHU
	pf0R6wRNzsiNd737dmSgQkzfk8F5/YByBbWKxTM8fnno9zkF2tV9v1NVNu3f8CbwTneMsu7H5z603
	tKAwLhz3oMNv3i6ODQT3FXpR/oR8lFH0d9YDx3VM+CS6lz1NXIgWR+IwhZWg5p6efigneymA5Vbs7
	Mv27VSxXSM1+YCdt3RyuZlAV7MnPu3x/NXKw3iXT/YiVia5gTwEZZ7NgWimAhvAhHB66M0ISNXNuW
	1mHP0esW2x0fVCgg3/mL2vTvDLpKP0ddWdmCbtd8AB5iBvXe4frdTQ3m4P/14i4A5t6R0gckv0USG
	70+7Ym2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzpG-00000007X8R-2nDb;
	Sat, 20 Apr 2024 01:47:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzpC-00000007X5M-3QHj;
	Sat, 20 Apr 2024 01:47:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3B0E3CE1B96;
	Sat, 20 Apr 2024 01:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8D0C2BD11;
	Sat, 20 Apr 2024 01:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713577647;
	bh=Wkq9R/fdbk//Bx9s705zg1J5qQkoukUR/Zgkx33AMOA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=R9qEJZHaUguTYgNNIQJiSoa5EVzoriJOd+Pv/Nk46WJj1JJd0mcuwpJZTvUqi/SyW
	 hZej278gvBLV5Cf7Amwfn0KsbSAW4Hb6Bzib0A5OJqxRDNihNxrHCNdtFU2iAZfXtU
	 lELwxiCYg05XFFYQdo1pVHIuHapEyxHpBJluLgrkaMGmTbs9zEp5y+Iv1dpnPyvHZ5
	 LdVSIfvB4hVn4dZPkCOg4upsM7ybWqYjTTMYv1jFGBSniXTyTPy/vcJ9aVt2ivR+Sq
	 /9RCuSe4HGbSCzBHv7ZQxUMPo3gZCmLMnvnA9PBp1tFMSN2wQxcUYtcxoq/flw6zTQ
	 iNy1EUA7TqGvw==
Message-ID: <97594c7ca4b53b5c94097b72c412c3ac.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240417-spmi-multi-master-support-v10-3-5bc6d322e266@linaro.org>
References: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org> <20240417-spmi-multi-master-support-v10-3-5bc6d322e266@linaro.org>
Subject: Re: [PATCH v10 3/7] spmi: pmic-arb: Fix some compile warnings about members not being described
From: Stephen Boyd <sboyd@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Date: Fri, 19 Apr 2024 18:47:25 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_184731_207202_25BA52F7 
X-CRM114-Status: UNSURE (   5.61  )
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

Quoting Abel Vesa (2024-04-17 13:00:55)
> Fix the following compile warnings:
>=20
>  warning: Function parameter or struct member 'core' not described in 'sp=
mi_pmic_arb'
>  warning: Function parameter or struct member 'core_size' not described i=
n 'spmi_pmic_arb'
>  warning: Function parameter or struct member 'mapping_table_valid' not d=
escribed in 'spmi_pmic_arb'
>  warning: Function parameter or struct member 'pmic_arb' not described in=
 'pmic_arb_read_data'
>  warning: Function parameter or struct member 'pmic_arb' not described in=
 'pmic_arb_write_data'
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Applied to spmi-next

