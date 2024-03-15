Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4571DC54E58
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 12:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbhiVHqUqPqhhQvlrK1h7ZZMUviga9XIJRMzz3SCWbw=; b=J/p+FcviRA2q+LkWl4JYrY1q6K
	GhTbIZzxpocR9RcgnwgI6+gCImQ1nrTFU08IyMOwmbtSytMd989xFbAF6q/wOLFbQRSF4phSlNrCn
	3xAOOug7rTFMLq0MV1x3pZ2IgLaxi/X53bWoJWiu0yAjQM9ARJwGliQoUXAtrNysCQjMMqJ+Amwqv
	lMD3oHRroL80oxe/rr0b8s2VgBMuixtfcILt0+UfyWMIs1BVqEfgWriu3NcrveIgehk9ul3r4B9eT
	QZAPBrtL1ejz1U0Z9T4ijK1X8psbWt5k9RgVdLM9pvz4DQjh5rqTSRs6G3wlI40t7JWRZpyTMY/fI
	soKxlNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6nc-00000000CvD-2OxZ;
	Fri, 15 Mar 2024 12:36:36 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl6nJ-00000000Ciz-0Xtz;
	Fri, 15 Mar 2024 12:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710506173;
	bh=sXn9cci0I3XE9mhMDSKLJPy3XLYVgxwVNOfzPtLZ40s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JPKBtvqk5Arybk7fguYZcRKl4lYEBL3MWjC0s4UviIK22yLAs7PIxUiyuZ8pQKIdr
	 vM63+fz9RRJqV47y65Dnozt+TLXwlfNZWf/xfeVact55QokzcqauCDnDKnY4doS64R
	 ZGCQuLWOm0SvXU8TwrzP/gCkQGpfo6GeE8YLNFdm1V+1V4uX6fF1o7Sz0Rt5gsEVRp
	 90/wMjqeL6xQujavatRdpxO/gCF8TS4n+gEyaq8JR6KYFv2d0rquAmHAD1+h1DGAu/
	 c6MLCiaEw9kHKztbh98H/bAnjKihh+WQ0/2q1ovamV4ff6nvKEDMfABAwbpyfSvT42
	 My8sz8Jj4INvQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C2A2B3782112;
	Fri, 15 Mar 2024 12:36:12 +0000 (UTC)
Message-ID: <9fe9354e-e2ef-40a4-a86e-aaa590ccd4c1@collabora.com>
Date: Fri, 15 Mar 2024 13:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: mediatek: mt8192-asurada: Update min
 voltage constraint for MT6315
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 linux-mediatek@lists.infradead.org
References: <20240315111621.2263159-1-treapking@chromium.org>
 <20240315111621.2263159-2-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240315111621.2263159-2-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_053617_335294_1CBAE5F8 
X-CRM114-Status: UNSURE (   8.22  )
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

Il 15/03/24 12:16, Pin-yen Lin ha scritto:
> Update the minimum voltage from 300000 uV to 400000 uV so it matches
> the MT6315 datasheet.
> 
> Also update the minimum voltage for Vgpu regulator from 606250 uV to
> 400000 uV because the requested voltage could be lower than the minimum
> voltage on the GPU OPP table when the MTK Smart Voltage Scaling (SVS)
> driver is enabled.
> 
> Fixes: 3183cb62b033 ("arm64: dts: mediatek: asurada: Add SPMI regulators")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



