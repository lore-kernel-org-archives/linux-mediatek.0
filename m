Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7ABC4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 01:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoSO9lCcr1WGFQ3qpQ8hPbZPOyeuTvk2QeXaFvbAZp4=; b=xfGcaXjeattAzlMZMA//fJOvD2
	DObjqNvHZ4lytJvB33YA2mfbGzk1/D9i9NQ7/nQYyQanC5EtD9THhQolxe2MkZ2MYttnW2wYAXktz
	RgLLuMiglMAlrnb9E7zQmug3Gojtzbr4hQ81N2qeoIRerVymbRy9TpD7tM1M9pRi6mpnudsX2kntu
	1fbXu2eCs+ztBWEwf4a5/OnvpQkmZA6a2Dz8r8FLBcFxUryqriYpaWR7ARSYwgL13ahPElAPBn+4w
	rhGOVPotplXb+VxNnQnDkmWup8E0BeEX5EtZM4S4BV5Zm/EdrdJ/fbcxRcSqwl2ig8hMZevvTENVm
	Miz/cqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzpy-00000007XVo-35dy;
	Sat, 20 Apr 2024 01:48:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzpr-00000007XRZ-3qxi;
	Sat, 20 Apr 2024 01:48:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C60A61A8B;
	Sat, 20 Apr 2024 01:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30CFC2BD10;
	Sat, 20 Apr 2024 01:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713577690;
	bh=JoSO9lCcr1WGFQ3qpQ8hPbZPOyeuTvk2QeXaFvbAZp4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uHDftXS8Omw6VttWWXD3YU6Tn2SLiDMC6gvGKkLk6xvgRqL1vlU4jYWW34jrkkIzj
	 lduW7CbIOfVQxAcKFbIiLFydYa2L0uzj2OSMVCZi3wQrTlUfRhGRyRBnUFiy6l5z9/
	 lpx5AztNQgxEAx4zq84lwGG7BD1dWjbS/wTQA4RXiwmYQa1lYOUCekGFAmIfjnMoro
	 pkdH9dJCOplwRMlywxUSEahWvM7ExrNBJQOBnoGfxcVorbDyC+Q6Znwn3ai4DslBhI
	 CMuOiXhx+wk2mEuHQGe4CiGPFSwNxXIXzsbQhSxW1u99mhoU2vpCazjrh6HvlGcWwk
	 /JGXMzjCfJ6cQ==
Message-ID: <d5cd2bf8a6f2e12d5e3cb6bf68ccdaf8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240417-spmi-multi-master-support-v10-6-5bc6d322e266@linaro.org>
References: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org> <20240417-spmi-multi-master-support-v10-6-5bc6d322e266@linaro.org>
Subject: Re: [PATCH v10 6/7] spmi: pmic-arb: Register controller for bus instead of arbiter
From: Stephen Boyd <sboyd@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Date: Fri, 19 Apr 2024 18:48:08 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_184812_074127_3FECECCA 
X-CRM114-Status: UNSURE (   6.71  )
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

Quoting Abel Vesa (2024-04-17 13:00:58)
> Introduce the bus object in order to decouple the resources
> that are bus specific from the arbiter. This way the SPMI controller
> is registered with the generic framework at a bus level rather than
> arbiter. This is needed in order to prepare for multi bus support.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Applied to spmi-next

