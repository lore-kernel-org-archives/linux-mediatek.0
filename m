Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE33C04FF6
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 01:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5CmRS8HiH3kJSMeFtEZR5LQApr/dDvkmDH/E2gNETA=; b=4nxJgCPCospu5we8Qu2CMNI6sa
	2cunJWsfyDxHs1xCUipho7XoHm0nRb9oaLisnVg206+JneAcDxJXQ8zyfgRZ64eUCd6J0q/GgX1i4
	Dl6gujQ58AyYka5wNwddZ2ph9eTN3SYk5ARjnq4t+3lX8sxikwDVJZTb5hfFPXV+M5/PXUIVO2d4t
	qAhVB5LT3AEbpUVMIVyG9vcKUDJhKO2D3Dxhi6ZAoQoiDYJnRBCRK5TDTTy5wJW8FaEYxbQb46dVf
	R7AVgOBmWOHrAcQwRr5wrkCUdIj77KWa859c29GTKSh7SbSb2hHban8q0XRW9Fvu3Ze1RMqIcb/oM
	f1Zrmqwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzpm-00000007XPP-47Rq;
	Sat, 20 Apr 2024 01:48:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzpg-00000007XLF-1PzO;
	Sat, 20 Apr 2024 01:48:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B201F61B4C;
	Sat, 20 Apr 2024 01:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E53BC32781;
	Sat, 20 Apr 2024 01:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713577679;
	bh=/5CmRS8HiH3kJSMeFtEZR5LQApr/dDvkmDH/E2gNETA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Q0i0Ls0lPJ8FBbPIewbSPyGgnNRLZOjN9bvMpeDX4Apw2MgROEB6JeIQlomfK2wpj
	 O4NBJX0/Xwu+Ap7bQsaWwGvidYUzi2viBS8owbo2GWwH6Hw8AIS2FtnNi2nAXRCcZh
	 zIs/IcowzC2T2FXDr2qzw7lTiLJ6DwXtcZdcm+Lkljqnzj5rihEFyhZV/TFmnxk7Bv
	 8LnZXHcWv/JkZKdUhxxwim2k7PndfRho1epxkEzkNtdmak/uhZhZzYDNYwhXDsYNTV
	 Lwbg/HMRATn284Gq70sSdeqwMP/r3/xlcpUsiF9lg9ucFRP9l/L9C5PtHvdZ72ldHK
	 7KikMiUH1y16Q==
Message-ID: <492aa42a333063a4d148d1ce9398b106.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240417-spmi-multi-master-support-v10-5-5bc6d322e266@linaro.org>
References: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org> <20240417-spmi-multi-master-support-v10-5-5bc6d322e266@linaro.org>
Subject: Re: [PATCH v10 5/7] spmi: pmic-arb: Make core resources acquiring a version operation
From: Stephen Boyd <sboyd@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Date: Fri, 19 Apr 2024 18:47:57 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_184800_458581_85127A18 
X-CRM114-Status: UNSURE (   9.66  )
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

Quoting Abel Vesa (2024-04-17 13:00:57)
> Rather than setting up the core, obsrv and chnls in probe by using
> version specific conditionals, add a dedicated "get_core_resources"
> version specific op and move the acquiring in there. Since there are
> no current users of the second bus yet, drop the comment about why
> devm_platform_ioremap_resource can't be used in case of "core",
> as it is not applicable anymore.
> Don't switch to devm_platform_ioremap_resource though as we need
> to keep track of core size.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Applied to spmi-next

