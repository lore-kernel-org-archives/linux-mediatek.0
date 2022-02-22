Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0820C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 21:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAAFwCQqM8tWW9oW7+UZMMhpBSjcn+WLPJfzepNJSOw=; b=vp5HmAxmf3ArsC
	996zdZrvM4HC5aY7mqNRtvEFuBC9mCiP6p8VH14LC57OXe/zVwOZfk7W9MAqjjhll2bYe8pb9uqEp
	LH+P03pGaJjpkQfDQrqAZh4qmGPYuTCax+3DjRqw7Go9iPidteDNM4xdVrExQgpKaicDV71ddUS41
	MSM2tidKxhJFUlwRE7iWU4y5lXZSeR+N9UhEBKU8Pak3A1P5iGud0SZMrZEeQ3EoxaZgAJZp42SsY
	CqQ9eDv/AohnBezBR14w7Op/R52HVzU1+OCr8nIElLZEb8XEOGPC/YF4X+gUr7DpyYAmt5xppQ2VZ
	w9R2eXeBdzKsFJGTVlHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMd1W-00Bha4-DI; Tue, 22 Feb 2022 21:48:42 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMd1K-00BhXw-EA; Tue, 22 Feb 2022 21:48:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id A00891F42DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645566507;
 bh=AgYGHjexhKTkzbHlv7iW5IsUbYss5lL+060iqAyLlvA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FIcY+qfugfCKqmY96XmKSLJ8t3CWTMJ04f9BSGhLdx2wGJr8JiSFHIHYA+tNV9itK
 i/lz5Ll63lB5o3lxPPk3RvoQTBXgOg/EjyC4GcwRdCJifG37P3idfDtjIShLhOq7Ac
 WYjA7pOBmBLQ5t2aKEw57Z6Ab4oYlz4Vyr5pQBWAxDc9/RSDzzZpWcuITE4ZCS3X3s
 tmEu8wJuuydJhI29smm3Kyfrk6Ct8CGGcCuSptf5iLMZddoGdJJM3ozqOr+L6kNbc/
 TnDglFIW/hiw9+lPlZ0LPlnFU5dBKCpI2CqfKFI0LqCJ3nfYEfenJ+ejqZniSQdTDC
 hwK5I6SeWFLNw==
Date: Tue, 22 Feb 2022 16:48:22 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH v2 15/23] arm64: dts: mt8192: Add m4u and smi nodes
Message-ID: <20220222214822.3sxsbjrtm6ild6rx@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-16-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218091633.9368-16-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_134830_689504_118A5B87 
X-CRM114-Status: UNSURE (   8.57  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 18, 2022 at 05:16:25PM +0800, Allen-KH Cheng wrote:
> +		larb16: larb@1a00f000 {
> +			compatible =3D "mediatek,mt8192-smi-larb";
> +			reg =3D <0 0x1a00f000 0 0x1000>;
> +			mediatek,larb-id =3D <16>;
> +			mediatek,smi =3D <&smi_common>;
> +			clocks =3D <&camsys_rawa CLK_CAM_RAWA_CAM>,
> +				 <&camsys_rawa CLK_CAM_RAWA_LARBX>;
> +			clock-names =3D "apb", "smi";
> +			mediatek,smi-id =3D <16>;

This mediatek,smi-id property isn't handled in the driver or mentioned in t=
he
dt-binding, and seems redundant to mediatek,larb-id. So just drop it.

Other than that,

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
