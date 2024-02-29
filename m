Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F69C54798
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 20:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGWdIP2mIoJvYT7QfXJMrtb4MB0ryzQCZUOiLrpwBvU=; b=n7McNo0Kz389koHnIT/evfmrEA
	izFhgRI561fMGTRC4Gnr4U4hABiyPgg/jVRXeDjdRb7noxTSK+KC7Ciada4rMZHHPC+DrgebpDIOt
	ZBdXSw+2ZtP/ZtaswIrRNZU9b0+5bSF5Ni3T6T1ysLRv/VUuL+m0hExh0BcqTNiWG0e2wb1U3fEXu
	pLitl3GccceusEou/WJvaOV1yAJid+agkSvj5SMDtBWwWG9Ib9RCybr4IVTMyjbppNu2ljPKOecWG
	a8RaZbrM47Ktxyj5sNLQCZlAfSrbO89fHlmGaxwRqrpiV8WiQzamjuoR5b1C0YK1f5P1wboUfOMMG
	LIZ6jvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfmw3-0000000F3Xz-2HqV;
	Thu, 29 Feb 2024 20:23:19 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfmw0-0000000F3X1-30wS;
	Thu, 29 Feb 2024 20:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709238195;
	bh=eypfRWduOTtxVcXy1CeP9vCXIlJPyx+8mSFU5oBXO/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Caz0h/CLWd1f0XuHIlATCpzDZQEDROu3iAqJPbZ/Bm3Zal5kqJIikrrCn/kgFWaLX
	 R5o7GDzqLG7Ec5TZkZgMdkVxoFNyUPSNq/TRjXjB7d8IcZw6V85PCu8uhtW1EALC0j
	 rP2BYIZFgPihSOd2AbuLKoc34DnoUN2Ppd6QdjS+Iun67N9R9/gx3UBBGkGN4pkFp4
	 hce4IgmCsFQ9K0HhYqygEfZF4NKUVjejOPmjTkQJjN8bXEkMTlBZi9ZyIFKbkacjGd
	 B3wa78mo2zvkbDownlHap21AYbvmNR7RKO0y9R2FZEW5sGNrEESL+HQBFBfV/uGiQS
	 rpuMK96Cj+TDg==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4153137820E4;
	Thu, 29 Feb 2024 20:23:12 +0000 (UTC)
Date: Thu, 29 Feb 2024 15:23:09 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: cherry: Describe CPU
 supplies
Message-ID: <8a45151a-1d51-4001-b0f9-9cfb0027232a@notapiano>
References: <20240110142305.755367-1-nfraprado@collabora.com>
 <20240110142305.755367-2-nfraprado@collabora.com>
 <e325a4d4-0df7-499c-9d55-7da093b744ea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e325a4d4-0df7-499c-9d55-7da093b744ea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_122317_015576_6BF7805E 
X-CRM114-Status: GOOD (  10.53  )
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

On Wed, Jan 10, 2024 at 03:32:02PM +0100, AngeloGioacchino Del Regno wrote:
> Il 10/01/24 15:23, Nícolas F. R. A. Prado ha scritto:
> > Describe in each CPU node the regulator supplying it.
> > 
> > Fixes: 260c04d425eb ("arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus")
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hello,

looks like this patch was never picked up, while the cpufreq part has been
merged for a while, so I'm still getting the mentioned hangs on linux-next.
Could this be queued? :)

Thanks,
Nícolas

