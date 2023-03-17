Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C71C74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 19:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6I4zaJWeXHuTHctz9grpTrdUNl5lczn9OJW2lI57m1Q=; b=YK+iI49HfRWMs3GAd8srwxyiCE
	/Dh0HPdp3GDn0VY/fxCN11U95Sy2hJcAqsLcchnZjLDLaUiNxAFjLJhOyANXxJjtbLu/ZMFaFJllm
	+RNLpT3naVW/R3nwItZJm8z1GKBykwMdtXpZoBmPGAxQx0PMzhSoWMcBU8tA9azjw7p7Gcbl1laMT
	afMB/Ie04Mk9O0E1OvJ/ZucacZ41hBZCDPonKqbJqU0BLYqLMxgZDLcxhMEKeL8qSHZX3cPoMsadP
	VkZYJVDMth5y7tzKVCi0jKEeLpvXYhYFHg8TnQoPXQ1Qn5a3FbijjcsAwNQ2NWausuNkXvPcaiq7E
	3FcLg2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdGAN-003Egj-2t;
	Fri, 17 Mar 2023 19:55:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdGAI-003Ee6-2k;
	Fri, 17 Mar 2023 19:55:04 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C1AF066030C4;
	Fri, 17 Mar 2023 19:54:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679082898;
	bh=xUkcVXnyTuTsmAI0NLMHRHqskyN4MCp0kwSVC7VaIMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j1GA1r2CQzoOUARFqEqGeWG95yccuewWR/wmYs+KK6oUouC4k+KOCz+ZZzpTeKExy
	 wRXD2cUWmenfH1PbHLYezgOmBy/fpYKgzCRxIhesaVKXnWCyYyGbMsqNDme2HYjYmX
	 Oq7hYyr/jmpTiPwa09MFeg2U5icaF0MQn/1YHUp+2qmlY6wcHIJs1Qd1i5seHj02se
	 PS9HTYyqLwVD3E+G+yO5Zlkbpveq39VAltdpcoLmBLMeza9Si0Ogn9fs0pCIUHv+6U
	 qASBE6rjOmNuo6uaBt7LbNfPNdfGyXBzq5ZJnB7xxq0Vo1fBrXRhz7SQ1hArmBMvYx
	 rb0oDKZxxgnig==
Date: Fri, 17 Mar 2023 15:54:53 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] arm64: dts: mediatek: Add cpufreq nodes for MT8192
Message-ID: <20230317195453.lpymxjk7oqvbxkq5@notapiano>
References: <20230317061944.15434-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230317061944.15434-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_125503_025656_715A25BB 
X-CRM114-Status: UNSURE (   7.85  )
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

On Fri, Mar 17, 2023 at 02:19:44PM +0800, Allen-KH Cheng wrote:
> Add the cpufreq nodes for MT8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Tested on Asurada Spherion Chromebook as well. In particular, verified that
applying this commit makes suspend/resume work. Before, it would hang during
resume:

	Enabling non-boot CPUs ...
	Detected VIPT I-cache on CPU1
	GICv3: CPU1: found redistributor 100 region 0:0x000000000c060000
	CPU1: Booted secondary processor 0x0000000100 [0x412fd050]

But with this commit applied the machine is able to proceed bringing up the
secondary processors and complete resume.

Thanks,
Nícolas

