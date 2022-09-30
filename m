Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AFEC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 22:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FOBauGLSRI6nRQGji3Nik9GE2yRR+ndKDzxdKAeRKs=; b=wTEozLVL3U5ruE5CA1wQ09y+p3
	E2O0DTzqxfh5HZNpwOrxWt9iFmsBM/4Tb2TzEsH2i367FzvWiRXQ7GVIf6niLJ3X+9o3aM58Z8xcM
	RSU+LKzNoFITzycoaU5b/R+5J/Edz5zZfyFl2mtrfwvWblkXKwfgan0U5n4WtHpEHb6T2kcTjx7qY
	dsyFR7PWExmgti+OzrQ1nPUexqJto/AkVcN0m8dwx/HfVbWVRi274FpQR9FKnvIGPuU55lBxMkE/9
	P99Y1NjY7hHJbyHTuqAFx62ulVnNcea8O8EDDT+Wo/d0wvxjd+w409tyPABum69m4ym0wIcUyBLqp
	jJIW/zgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeOF4-00BpBJ-32; Fri, 30 Sep 2022 22:12:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeOEj-00Bowi-0w; Fri, 30 Sep 2022 22:12:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B4BB62541;
	Fri, 30 Sep 2022 22:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347A1C43149;
	Fri, 30 Sep 2022 22:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664575920;
	bh=5FOBauGLSRI6nRQGji3Nik9GE2yRR+ndKDzxdKAeRKs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VQI8DvnFx2T3AOKXu1uJsb0qvHn3DPqndnUi7Odq3Imeyrr//G6ZB1FKxz3gpOd1L
	 c/UsF7Vm9XNCvff2CxnYvNoHahfqrlOnyEDcXsVQ7on1J+soVK8fvpyLPTBfehEIfX
	 mrZwZO3ySFpMfU2UGjba1dXC09YcWolpg0Y0ta3neV7pxgornf9Ic7E3wwA394f/m8
	 fYgff7bneV2314Ee4R/P+hn5t1EOGNzf17WP5lFf6bbp5if2vXwKuheQJXTNaFRMJ/
	 P2O8tCE1OjOTp31R4I+QybrCVRKXmQvJ8gEJkPsXSV3I+MCGi6nr84vSLUKR5VGLlq
	 CWc1P/nDMcGxw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220822152652.3499972-4-msp@baylibre.com>
References: <20220822152652.3499972-1-msp@baylibre.com> <20220822152652.3499972-4-msp@baylibre.com>
Subject: Re: [PATCH v4 3/4] clk: mediatek: Export required common code symbols
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <parent.f@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Markus Schneider-Pargmann <msp@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 30 Sep 2022 15:11:58 -0700
User-Agent: alot/0.10
Message-Id: <20220930221200.347A1C43149@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_151201_149357_3D2C30D9 
X-CRM114-Status: UNSURE (   9.35  )
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

Quoting Markus Schneider-Pargmann (2022-08-22 08:26:51)
> To make clk-mt8365 compilable as a module there are a few function
> symbols missing. This patch adds the required EXPORT_SYMBOL_GPL to the
> functions.
>=20
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---

Applied to clk-next

