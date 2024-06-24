Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16E5C2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfvECMuClkdd2xYhGiO4NC/HKlapaUmfmo0JJt3dr6M=; b=IfKu/EOU1ZAOz4EOn33osoe3ob
	x1YDZ6FgDresaEaQiEgH/CwsNESydhoOvAF8euDsLyUX/zllrHySX5Zcf8gTL/2paa3dOkfs5Qpi+
	PXBqz3/2Ww0a7YiFTVGPeGFCq+32JI9uv/s4rJVM+M0AQCDKoArZyPmYc3/qYC+/JhVKGg66hJbBp
	cgmhVBn8kfy3GPuAc6Qcyez0La8q83xI80ufxNCetdvyBAFH1BIpb+iuNn+2+1/BobeLE3WXe+yWB
	VGARqgnhNp8L4aUA1TqeCJazK48TuS2bk3OrcHJyKLgSSFSGNn/7dZYGo1vaVCrbHSGKGWdD0PMY/
	eOppOp4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhE5-0000000GU43-207i;
	Mon, 24 Jun 2024 10:47:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLhDw-0000000GTwX-0Ry0;
	Mon, 24 Jun 2024 10:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719226018;
	bh=N7etgN4r7YuHpbryZAGdUzymvIiOw4YteMinJ/UaOK4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=3VUGTKELcesK7vW3Vfh9zckFAGkd1lPhlvMXAzyUaUP2SpDveHFMeXilidTM6mXux
	 YlCDs1eIqQCfD3+Q9a8T0FB/n7ayVJ4Vf/j7JNmAXJ1M/1u27jWiFCrWGgy0iCfcPK
	 TJotqDfSaL8F1zuzbf6T7iVgBj6EbC4CSQ7Q1w4mzLHjkRqcdSPW3ytbdPdaYNYQ8T
	 gPvTlrbbqmsa/wpSbIt0VkgydO49vXCw9BQmEkl5zJCCRWNFOO1HLm6J9Nvwfqe187
	 TaAyMu+na7LRWI3kXWMoMnrazYAaGLjugbgi6cAe5xBc4gJIHewb7jieqmhkiaP80o
	 d+vsdCy46/nQQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2D54C37804C6;
	Mon, 24 Jun 2024 10:46:57 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk+dt@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, jassisinghbrar@gmail.com, 
 garmin.chang@mediatek.com, houlong.wei@mediatek.com, 
 Jason-ch.Chen@mediatek.com, amergnat@baylibre.com, Elvis.Wang@mediatek.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
References: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH 1/3] arm64: dts: mediatek: mt8188: Fix
 VPPSYS0/1 node name/compatibles
Message-Id: <171922601711.121709.12074465182183603791.b4-ty@collabora.com>
Date: Mon, 24 Jun 2024 12:46:57 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_034700_591194_8C17FF10 
X-CRM114-Status: UNSURE (   5.71  )
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

On Wed, 19 Jun 2024 10:53:20 +0200, AngeloGioacchino Del Regno wrote:
> Like VDOSYS0/1, the VPPSYS0 and VPPSYS1 are syscon nodes, as
> described by the mediatek,mmsys binding: fix the node name to
> be syscon@address and add "syscon" to the list of compatible
> strings for both VPPSYS0 and VPPSYS1.
> 
> 

Applied to for-next, thanks!

[1/3] arm64: dts: mediatek: mt8188: Fix VPPSYS0/1 node name/compatibles
      commit: 013b7ab4080af0dccae16c6ea8a1e88ad530114c

Cheers,
Angelo



