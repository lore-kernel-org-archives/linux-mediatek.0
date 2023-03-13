Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE16FC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 18:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiUKSAfl3Bq/CEF6Ggysu8vzc21Hp4EjeRcfJXKVHVk=; b=AeH3NtlpLhng9wAJl19jzl16sf
	k7Ksz55cSYsB58Y8G8oC2lDHbxMEn173oN0WIpNGbmp2J4klmrPNANlo3k8W+MOLbE34KiD9YkExn
	0OFdbmQhLIUDvJ2iOH29QMZvG5PpUKMaxrcMgS03sLEOPRZumFK9x9GhSFRZmVQtTkqltYCCUcKDI
	mbuja5xeEDVbmvaeLDAJ5O9lz9QiRaP9fJzp1YMDEI2BULFEg5drAj0pYMbQmFxb4MvuFeTrHm0R/
	E/BUvcrNHrUVQ5xq0LaUbgmFw9U6DYLlrCQphpULYtRG1ij6HLX7fDdg9jSx0hMQZC2qO4Ft/BEIc
	W7B71UgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnCX-007MAU-I4; Mon, 13 Mar 2023 18:47:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnCN-007M9L-Bw; Mon, 13 Mar 2023 18:47:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 64CE1CE113E;
	Mon, 13 Mar 2023 18:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850DFC433D2;
	Mon, 13 Mar 2023 18:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678733222;
	bh=DiUKSAfl3Bq/CEF6Ggysu8vzc21Hp4EjeRcfJXKVHVk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JeIWMLUI8z05oQMUViwuPijU2MIyMYfUpE465mjwrbBPI0VNUxW+dSTyUhtvNaXT3
	 fyViynHPh24shmEkKCL9bX8RwUZKCAaWLteqmpCKbtK+bEUEGslIMulmQadWRW8Twq
	 OxvwSlvaX4zEJn4zj8iJslRWdVtdr/fU5L1Ssca882Vqf/EfV2FxIpSebabZntj/ya
	 KMbnwbZYnhJI4uMzXDCFvP53SKLOI/YRwFw0GgGN0wen99enBaHUShAlgzCsFhw9Lm
	 R+jOdAPpEQ+SUFRDzZPzQixOsyqHMoDnOhr2QTJakb0dvqLD1VikMPsdu0ZJWpa6uQ
	 VLhc1PkC47h6A==
Message-ID: <e1b513dac9d291423c3b5a193b3acaa4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230206100105.861720-2-angelogioacchino.delregno@collabora.com>
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com> <20230206100105.861720-2-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/7] clk: mediatek: fhctl: Add support for older fhctl register layout
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, edward-jw.yang@mediatek.com, johnson.wang@mediatek.com, wenst@chromium.org, miles.chen@mediatek.com, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, jose.exposito89@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Mon, 13 Mar 2023 11:47:00 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_114707_637210_D41AB3BB 
X-CRM114-Status: GOOD (  10.28  )
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

Quoting AngeloGioacchino Del Regno (2023-02-06 02:00:59)
> The Frequency Hopping Controller (FHCTL) seems to have different
> versions, as it has a slightly different register layout on some
> older SoCs like MT6795, MT8173, MT8183 (and others).
>=20
> This driver is indeed compatible with at least some of those older
> IP revisions, so all we need to do is to add a way to select the
> right register layout at registration time.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

