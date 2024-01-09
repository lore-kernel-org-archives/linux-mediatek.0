Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B175C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 04:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owivcdP07mzuhnpVWM/fmPbu2IxGCcXV3VFsqlFs0yg=; b=KJUFzifvcZuh2NUAyvyLJGaLzW
	3vSp6shqTRJNDp+6Tlh1Vs3+8H9DO+iZR5/AJoKWpqCqSAHwHReI2BtIJkmdyGsst6Fr9ixRnTJar
	8Cqjx/IVnEtrghDBBOlPMC7+221mp8eOp15neGcLy8nvAMnsb9nPWqmV3IziwWEbBpBH/DMQV1h4g
	ZZ6RwZ/mV0aWl0OssA1PMgm7LJkXCHGQl+fslPZt/AzguokvT83ZagIA/HiQbBkRBkZJ6FBJOoXtH
	YgSkvIVRKigssnMihVqh4XGwfL/Rpt4HtvoaKa/CrCRso/mzMGjpYb9c6fekp+ATDnhD6Kc8L6vuC
	YcwjhSFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN3gt-006tyC-2w;
	Tue, 09 Jan 2024 04:26:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN3gr-006txH-0i;
	Tue, 09 Jan 2024 04:26:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B0B261267;
	Tue,  9 Jan 2024 04:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D5BC433F1;
	Tue,  9 Jan 2024 04:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704774372;
	bh=GWPRSMVrTIfaejeLXiQ3VtmTLpLVgn3fwHTcRjXc5cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCaOt8O0OOJypkFpR61MI0MWns1cypJUED72AdaD0wHnt7aRD9hqdB7F5SFrprpdM
	 KSnc5GxrTk6HKfSmu/RAhOVlY9SzoofJDshoHm3rdUc/nrQrFL+CCvILEzSUSvd70w
	 Nb5e0wYmUNTpjTXAlZ43rIQ2GDTTC7Sz7+uUud7y24woUmE4PWhP7rufbaOp9MRfcQ
	 gMiLDUuSTtgtORgbQXtCpUsedOndqqGiaR5QUUpkq1vn0RhafCjLHat7+rYanyUYhL
	 1engzUKjHE4H5rJR17kT/uEAHwLmZa8yhRcHloUal6ebN+UEpw7ejaGRpS6+v2C3EE
	 IjwC+Nz98Wf3A==
Received: (nullmailer pid 2647220 invoked by uid 1000);
	Tue, 09 Jan 2024 04:26:10 -0000
Date: Mon, 8 Jan 2024 21:26:10 -0700
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J . Wysocki" <rafael@kernel.org>, kernel@collabora.com, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Hector Yuan <hector.yuan@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: cpufreq: Add big CPU supply
Message-ID: <20240109042610.GA2644078-robh@kernel.org>
References: <20231229212853.277334-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231229212853.277334-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_202613_328620_A303A194 
X-CRM114-Status: GOOD (  14.26  )
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

On Fri, Dec 29, 2023 at 06:28:39PM -0300, Nícolas F. R. A. Prado wrote:
> The performance-controller hardware block on MediaTek SoCs is
> responsible for controlling the frequency of the CPUs. As such, it needs
> any CPU regulator to have been configured prior to initializing. Add a
> phandle in the binding so this dependency can be described.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> 
>  .../devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> index d0aecde2b89b..d75b01d04998 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> @@ -33,6 +33,8 @@ properties:
>        performance domains.
>      const: 1
>  
> +  big-cpus-supply: true
> +

A CPU's supply belongs in the respective CPU nodes.

Rob

