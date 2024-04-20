Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674C7C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 01:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fi1gfxDGU9DyDoYCAwmnKrsw+kK2oGoPULKWkCn/ByY=; b=p+/2Ehv2o/dQzZxVPiBRhMwrwu
	mL0QA2zRkbw4V9R5CqOQUQudlMERuv0qwc/wJEfGq1dbyO1XerU4LK2j6PRMIRnWPx8SaDeznGGlS
	f0dnWaxwnwI6vq3VRG5Gntgvc4JakiwxxP+1ZlF78fRaVexAcL4fi53ETj+hDBnwtS1j4PylCQKXX
	Wql140OpoBB5XiUucKJ74SicHPGPcdLdwxBzUf/LV/+C2/IF/zvsM5BThNWhFYJ+X30Jg+/U1x5p/
	n3LrrmqcoBAULKSkqNpjHQQeLPaqI3m7lFxQ4kgjbvjLEtG0MFh/o1ciQBE2oP1QrPi8NAOuRsn7x
	YU8QWxYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzp3-00000007X2P-0JSA;
	Sat, 20 Apr 2024 01:47:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxzoy-00000007X0Q-3y1R;
	Sat, 20 Apr 2024 01:47:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 129A461A8B;
	Sat, 20 Apr 2024 01:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D85C072AA;
	Sat, 20 Apr 2024 01:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713577635;
	bh=fi1gfxDGU9DyDoYCAwmnKrsw+kK2oGoPULKWkCn/ByY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Twj8UPeZIGO8BeDUMG89gTomLhjnAhfSpvSO9YNlQMkvsbHwfvAF6EuhZKcl1lJb+
	 3DXM5qjlZ5jLIGCyEf21qwfbxRAKHqDtNAl1zGcq6qno8+AFdQlY1YuNhMua+3U4G2
	 dshDA59ztPHseB6v0VqK4NT94RzKipL/OwzxcaYJK4lN1bS6RZXfWJB/9V7w1O3XuH
	 bmhCjsEdUALj4rh0xfExqE/AEvu5AMTBHnWmLIx0qjUg3Z+TPLYYFDn0VOXOiV/yxZ
	 I1BzaYElbqQcUTSXqRLw/qZchERmjBN4ZFwVEPaUDYjVR2cl/p8B3RXMjpqUIf59Z9
	 8LrYtcUdmRYaw==
Message-ID: <094dde0105acb1fb1644ae14930065e8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240417-spmi-multi-master-support-v10-2-5bc6d322e266@linaro.org>
References: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org> <20240417-spmi-multi-master-support-v10-2-5bc6d322e266@linaro.org>
Subject: Re: [PATCH v10 2/7] dt-bindings: spmi: Deprecate qcom,bus-id
From: Stephen Boyd <sboyd@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Date: Fri, 19 Apr 2024 18:47:13 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_184717_079122_6F44A167 
X-CRM114-Status: UNSURE (   6.39  )
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

Quoting Abel Vesa (2024-04-17 13:00:54)
> As it is optional and no platform is actually using the secondary bus,
> deprecate the qcom,bus-id property. For newer platforms that implement
> SPMI PMIC ARB v7 in HW, the X1E80100 approach should be used.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Applied to spmi-next

