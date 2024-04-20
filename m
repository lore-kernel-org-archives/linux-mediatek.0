Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90195C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 01:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdQRmHFWyDLfIm6MfdCH9hirTy/VGkixvTbfYmty+0w=; b=gvuQi4VOEy2fdY/4cU6pB+nwJj
	BYEPGkUefbZ6tgdix24Q3zWcv5PNasQY0OjmIWE6GSUMhnlwwWRf74A2GF5/17ETwCvOqJ7vwXDX5
	ldpMF36fk5sqaOQRpClKwApZlEv15sJt6dg+loiz3Qn863sCXB1TeG1xlCVse27zedfXICZE15GSA
	Vo6+3JVKGkIMvLk1DCvoMiGrSurg/8f0ItUaKMEsT/fK0IzIIwydOtaTYn4yF8Bz9cP+eSbVcP5lI
	9wveI/GNuD1vyy0kjZ6y9t3qmFTBmNCnro22Yf7WbhleAEMwHjr1/hQWuejHjH6LAiYsE7uH2JTlg
	iPFQ3V7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzqE-00000007XeZ-08tu;
	Sat, 20 Apr 2024 01:48:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzq3-00000007XXn-0sho;
	Sat, 20 Apr 2024 01:48:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A70661A8B;
	Sat, 20 Apr 2024 01:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AA9C072AA;
	Sat, 20 Apr 2024 01:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713577701;
	bh=qdQRmHFWyDLfIm6MfdCH9hirTy/VGkixvTbfYmty+0w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GKvc2O9QBA4/T6kSbPGpakPMu2OFRctBdEKKtXVlckvR38b6wNQ+cyWl09AhVFUDY
	 0AUb9wSdWxAPwE0ihhOTjLCCvAKdvWXNc9UbTWG4qkOYf/9BS8GGJf46TbaWWWgj5k
	 Glk9M3jch2/6vJlNnJIVuOZE7YJ2XtlzTYKB6h/Ol5tef9HzwOLgU1HK8RrB0wjFo+
	 lzpcO5MirgXg8BIyXdDVh/rtfthJzijnYyafPTU8Y1GrtA7EOX4FpjcstTgJTI3RG8
	 so41t3+pXXHDO+qzGWP1gUH4IWxyCkfq25pnRJNu9AbmmzXgf2XaB/5rKXMLa406fm
	 6FdN3tmO4wacA==
Message-ID: <135367b4b04dbfd9600372c92d8669db.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240417-spmi-multi-master-support-v10-7-5bc6d322e266@linaro.org>
References: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org> <20240417-spmi-multi-master-support-v10-7-5bc6d322e266@linaro.org>
Subject: Re: [PATCH v10 7/7] spmi: pmic-arb: Add multi bus support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Date: Fri, 19 Apr 2024 18:48:19 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_184823_972074_6FB5DEA1 
X-CRM114-Status: UNSURE (   7.82  )
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

Quoting Abel Vesa (2024-04-17 13:00:59)
> Starting with HW version 7, there are actually two separate buses
> (with two separate sets of wires). So add support for the second bus.
> The first platform that needs this support for the second bus is the
> Qualcomm X1 Elite, so add the compatible for it as well.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Applied to spmi-next

