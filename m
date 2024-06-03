Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C241C25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itRSbnLivBQUHj6k8cpuuwCj/HhQ5FsuEMevJKAj58c=; b=eJghVxRuHXZUYo6HCm3sbe0S7N
	EuDS5fMoQPgglWLZU2lgHmOMTZ1SyeP/Xc6IR+CFPGaEDL4q7vSyJs/NhBCgTMKmhccsFnrzJ3n3W
	RBnvW6bvX2HT3jRr0m4PbUL2DOYng6Y6T3A4VhgK96dmZUQmHesqHaCe+1fQjs8KF3xtOZZ6ruCSn
	dFP2U/cxzaZqRV6XgT+J0QgJnVdXLUv921oHtexN14KBAoQ55Yz5iyONuAPEvRUlmhL3rU2f41cZC
	hwhQDxAuajR8JjsolTo7uhEMIYfrdjYZZRcTmkizeWQP3RAj6wAJR42AESbeo/RGXXpF07yngXE0F
	vMFTGLGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE981-0000000HAb1-4AWQ;
	Mon, 03 Jun 2024 14:57:42 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE97y-0000000HAYq-1NLS;
	Mon, 03 Jun 2024 14:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717426651;
	bh=XxQOFTFoETaApC1cOL3VI9vHYDh/3zcRncz7EKtboyY=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=puVrGSraQ2BTNhqJXtmrCAtWWnWOGs84SAif9IB6w1H/VwBBhw/C4RSdSUgieT69D
	 01D2VwK9btyiIcmFQf8JJXJhfjbG2hvER1bSnGGkcCNpOW0ELhoXJVFtNThvFriwO5
	 QqzoVl7/NLPubt7e4aOfJ4pIMtIdbAx3wbZgttEiYyVA/RnIgAjoIwnRkrjvvXgpnD
	 wvyelex7+9RYkhUsct/ljpH1GhEsh6mBG8vvYZgyw+tMsNsAPF7XYNTkdeWu7fO+2v
	 d8lJ8mpP6kQ3SVOw3OcI0OmJGCELXtbiPfTfgPJ3Kst3MUcMuT6VukeGLJLHCtMpBC
	 Z/8yk2gSEh8sA==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1539B378216D;
	Mon,  3 Jun 2024 14:57:28 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] media: mediatek: jpeg: support 34bits
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20240327040145.7155-1-jianhua.lin@mediatek.com>
Date: Mon, 3 Jun 2024 11:57:15 -0300
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 matthias.bgg@gmail.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <D76FE1CB-1EF9-4F38-8D73-F3E0D7942A6C@collabora.com>
References: <20240327040145.7155-1-jianhua.lin@mediatek.com>
To: Jianhua Lin <jianhua.lin@mediatek.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_075738_697372_4FF9FA27 
X-CRM114-Status: GOOD (  14.41  )
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

Hi Jianhua,


> + ret =3D of_property_read_u32(pdev->dev.of_node, "mediatek,34bits",
> + &jpeg->support_34bit);
> + if (ret !=3D 0) {
> + dev_info(&pdev->dev, "default for 32bits");
> + jpeg->support_34bit =3D 0;
> + }
> + dev_info(&pdev->dev, "use 34bits: %d", jpeg->support_34bit);
> +

Please use of_property_read_bool instead.


> enc_get_file_size(void __iomem *base, u32 support_34bit)
> {
> - return readl(base + JPEG_ENC_DMA_ADDR0) -
> + u32 value =3D 1;
> +
> + if (support_34bit)
> + value =3D 4;
> +
> + return readl(base + JPEG_ENC_DMA_ADDR0) * value -
>       readl(base + JPEG_ENC_DST_ADDR0);
> }

Please use the ternary operator instead, there=E2=80=99s no need for two =
assignments.

Can you please add a comment inline to explain why this multiplier is =
needed?


> EXPORT_SYMBOL_GPL(mtk_jpeg_enc_get_file_size);
> @@ -75,6 +80,9 @@ void mtk_jpeg_enc_start(void __iomem *base)
>=20
> value =3D readl(base + JPEG_ENC_CTRL);
> value |=3D JPEG_ENC_CTRL_INT_EN_BIT | JPEG_ENC_CTRL_ENABLE_BIT;
> + value |=3D JPEG_ENC_CTRL_RDMA_PADDING_EN;
> + value |=3D JPEG_ENC_CTRL_RDMA_RIGHT_PADDING_EN;
> + value &=3D ~JPEG_ENC_CTRL_RDMA_PADDING_0_EN;
> writel(value, base + JPEG_ENC_CTRL);
> }

These do not have to be gated by =E2=80=9Csupport_34bit=E2=80=9D ?

=E2=80=94 Daniel=

