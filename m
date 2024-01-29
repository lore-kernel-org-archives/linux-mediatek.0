Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312B1C47422
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 10:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqK0WnyJy5LBXEYYRMJ4XkWkMi4gQ3q69YggkSn9ETE=; b=YKzpkbgwhsCNUHzKVxyD8haXok
	kQVeKfWY6HXiukNOLN77OSZgKDGqoXFP71sDZaedB8LSsnEjBGmsDOTqU+YoB+hXc7PUE2wUQgZGr
	tnxmrwOofskRQK/4vKqX8IDdweUQJ5AOLLLweVPI32edsXSV4CfkzGjoIHg/aCi1+etrMHB4h9aPN
	LgW1zAXHJOwK9HWbatInyVmZCzOfupckpUHnF7BMUT46Z0FtPvv3E12E3outxk6BMt0UKZgv20xQ1
	MPnPRc17y6uAfDIhihbyOb28brdSh+b8TMX9u0LGDZ6ZEkWK+jVPLGFSu+sNJ3wK1RePfRAQbToCF
	xVj4MANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUP5q-0000000CGUT-25iP;
	Mon, 29 Jan 2024 10:42:22 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUP5R-0000000CGCe-2XsN;
	Mon, 29 Jan 2024 10:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706524916;
	bh=5K42SYeoC+w5voAFjka3K8jssH6MUMzwzzlFjaiWuq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yK5IHEboSYgBsJWcg4lNpZ967zp4zSh/slm5W1q3/zwtHYkIgcg4uRsYolaG0RrdK
	 UStPmhONTOaXD0lRVaPU3a7iKj5PJxnvsZ745SC/y2glJXs9b2kIgQFNIcS5PGbwDv
	 PFGI1i/OR/tSmfBPQiGOO/ZdjUTHjVomzGujPGZwA2m2QA8IIAWKHa2yocCWwci1Yc
	 8nFiJrPbQBdo7vzncgUpmRXDN81n6lo1+naHigyBstytHFUlxkrrIdgu91XYzTTq2S
	 QaRBclMsX+69vJef3gAPCXWEz+RRp6lqK9ZkdbMswGHWOheDMfAkmpj4M8VEi5VrbZ
	 lW4drTZb2qySg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8B9153781FCF;
	Mon, 29 Jan 2024 10:41:55 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	Eugen Hristev <eugen.hristev@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	kernel@collabora.com
Subject: Re: (subset) [PATCH v3 0/6] video encoder on mt8186
Date: Mon, 29 Jan 2024 11:41:42 +0100
Message-ID: <170652472371.127352.1415914611175058375.b4-ty@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228113245.174706-1-eugen.hristev@collabora.com>
References: <20231228113245.174706-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_024157_914215_6EBDAD1F 
X-CRM114-Status: GOOD (  11.51  )
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


On Thu, 28 Dec 2023 13:32:39 +0200, Eugen Hristev wrote:
> This series adds support for the video encoder on mt8186.
> 
> Few patches fix the binding, there is a patch for the DT node,
> and one patch for the driver that fixes an imbalance.
> 
> Changes in v3:
> - removed the patch to add dma-ranges, because this was intentionally
> removed (e.g. https://patchwork.kernel.org/project/linux-media/patch/20230303013842.23259-3-allen-kh.cheng@mediatek.com/ )
> also removed dma-ranges and cells from the DT node
> 
> [...]

Applied to v6.4-next/dts64, thanks!

[2/6] dt-bindings: media: mtk-vcodec-encoder: fix non-vp8 clock name
      commit: b8248c4831787f0854e2e856fa83da68ad5afcde
[3/6] arm64: dts: mediatek: mt8192: fix vencoder clock name
      commit: 0157de54920b556d575ffc82ae5d16f2b4cb9494
[4/6] dt-bindings: media: mtk-vcodec-encoder: add compatible for mt8186
      commit: 178eaba322868a75c2e0ad078fcf91c3a6f5abba
[5/6] arm64: dts: mediatek: mt8186: fix VENC power domain clocks
      commit: 2a08dba6bf6637295175f48ad870a24833955cd4
[6/6] arm64: dts: mediatek: mt8186: Add venc node
      commit: f971c7ee301bbd423e06f82bcae768223a4dd602

Best regards,
-- 
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

