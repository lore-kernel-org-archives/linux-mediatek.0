Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4930C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 20:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmeb5OIZFFTpAnQkIp6Czor4ZQMa9GLTThCflAS8aXA=; b=FQWc5bkgtSDOb/
	Hl7JzqHPCK96XmPbN0X2Fo9uItRA+AaTCcB61Yc2JO5DO+ehkDIs4JkVsjraAENEYbPkj2chQeJgp
	Ak5EXhLH1h1zC8r2V0zwyWrCyN0my7I7DLiS0hAZLQrhpz1RM5biixuS9IrR0ygq4N4eilLeViLph
	LDE2DLiIvySY6PuLj0dkMdUsv/+aq0jtISX5Np9xeltcTSpF22/xmijSMHAP5o3zivhYgEmbf1yN1
	pdJqIMGACXDrwzXr0T6V+IJ4Oq+JvzP9cj3GOVB3ac7c4h4CUi4Q+qh7+AU5NgdRLEwxXBqnu0EWg
	Xfr2icfzJfwVvDhwY1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIcB5-008ecg-FS; Fri, 11 Feb 2022 20:05:59 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIcAs-008eXH-Ff; Fri, 11 Feb 2022 20:05:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 72E661F47303
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644609942;
 bh=o4MNnjz0g9MzLgF7YAjio5nz9ZeVzPRdWcJ/3ixks5U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n1bDNZ3+pFlYzR86aNw+bDkYHR6gTj+C/KjVGpnoZxktcBwYndQ87DLKvA/mgnshA
 zfQFwtGYjvKqiSQ3vut/WG29G2SvZPwL1OoSEdrQMFCwKY0LRcAvn9204z+S0d+bku
 QLrH8HnD7E4ritTGBPAXh0mwxhP0vQWgtNnMiajq2PrDjWOQt7J1T9OOu9WkA8s7K+
 qGWzg8NF1NecangLtK5PM5eEmLqCSw3CFZiIzjDHqxMTIrJ+Rc+4S4s5JNQjZhwmr1
 VVhZHfCf/g9Cc4ZF8Gl25Bv/grgDqE2NaZVoXSMLXG6W+yC+Mydesl9oOHjQBfii7P
 zKScceZDto1fQ==
Date: Fri, 11 Feb 2022 15:05:35 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>,
 Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH] arm64: dts: mt8192: Add watchdog node
Message-ID: <20220211200535.yt7nco3c4awweih4@notapiano>
References: <20220207094024.22674-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220207094024.22674-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_120546_699667_F35A8C31 
X-CRM114-Status: GOOD (  15.31  )
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

Hi Allen,

thanks for the patch.

On Mon, Feb 07, 2022 at 05:40:24PM +0800, Allen-KH Cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> =

> Add watchdog device node to MT8192 SoC.
> =

> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Reviewed-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8192.dtsi
> index cc3953df0153..c1d4030e7e4b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -301,6 +301,12 @@
>  			#interrupt-cells =3D <2>;
>  		};
>  =

> +		watchdog: watchdog@10007000 {
> +			compatible =3D "mediatek,mt8192-wdt";
> +			reg =3D <0 0x10007000 0 0x100>;
> +			#reset-cells =3D <1>;
> +		};
> +
>  		apmixedsys: syscon@1000c000 {
>  			compatible =3D "mediatek,mt8192-apmixedsys", "syscon";
>  			reg =3D <0 0x1000c000 0 0x1000>;
> -- =

> 2.18.0
> =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
