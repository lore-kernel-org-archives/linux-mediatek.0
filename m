Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A363C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 01:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PP++1yptzcHC6G8Bb2ynd8Cxm876Mj4V54pJHkxkdvs=; b=UwsCSiE5l5MbumFCEqcfbAU5C4
	FAngPWidCdqOZNfJ6Xfg6/iIF3EbDSvzI63jR3+NtaTVM2XuX+6rMqH76q9QctkInm0XQCuhX9fL5
	LwhwypexVOagDbrrX+7+oO4C1ps8TzjmcvoaEZ0Y90Z7hgR4u1APSzsYVydNDaW1jKJRCiP9g61tV
	DlbxyFLakQbZpvjlPmfBWC0ig408IVHsUFZBCrEYhAbUsjD0QQIUGWDI5qAO/hiCbLRLx6e1C+eY5
	B5JhIk06g3kHfF3ZT6Kvf847wJOLFbPO2kMn/OcgWLVXoz3U9CS4drqK2I7+dqQeqIqg2BYSIJqjA
	UTmhtaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ejf-00HUpV-Jg; Thu, 16 Jun 2022 01:55:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ehB-00HTMv-0p; Thu, 16 Jun 2022 01:53:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 80904B8216C;
	Thu, 16 Jun 2022 01:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C237C3411A;
	Thu, 16 Jun 2022 01:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344394;
	bh=PP++1yptzcHC6G8Bb2ynd8Cxm876Mj4V54pJHkxkdvs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=p9cuLWny81mknKSw2Y/PCHv2O3KMHrMot4HMkwVUGATsCkGHLqaXE7CPKeiwvBtZD
	 +uoGxvPiOEgANVq6zLDwd0ndpsoO2J5nysB1sQBJ8KcRZNx0GLsWFIRv8ubWg6RcU4
	 gwUKqeLzoQApBlffJnGk+iee62mQOVRslQv+x5NdEGgqASKuZI5h4URq/wUWIP6BVx
	 srrafaj2UBCsMAupTxwq7h9Uog1ZNBxGa7inRWbKQLSvHEaw3+wXkf7C41psd6dcLQ
	 Aucvtd1sUqDwpWBG0zoaMALEkaxxLwQoFqwdutG3vbabsrhujMyRxndxO7jjs6eKCO
	 Gu+bBBDw1O8bw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-12-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-12-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 11/19] clk: mediatek: reset: Add reset support for simple probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:53:10 -0700
User-Agent: alot/0.10
Message-Id: <20220616015314.1C237C3411A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185317_278318_B0499350 
X-CRM114-Status: UNSURE (   7.27  )
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

Quoting Rex-BC Chen (2022-05-23 02:33:38)
> - Add a pointer of "mtk_clk_rst_desc" to "mtk_clk_desc".
> - Add register reset with device function in mtk_clk_simple_probe().
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Applied to clk-next

