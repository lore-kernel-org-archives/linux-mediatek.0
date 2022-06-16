Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA1BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 01:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPSyEz7jwxaaqfl7m+qcI+j3w1QFjgDJFn1+SuVg/fE=; b=OQAMbtWAkGWt9wFByE494vgJ4J
	g+sWyMoi3EWH0w3SSCPytKgXvu0nG7oEwmSx7UAlHJT/ezYFxMtArac+TptAr+BKcAoiOeBNZ6axO
	4nM/k6rN1JzmOZj363A0jzI0WXze+QYY9J9nlcrOqilDE/OBFVb1TJwt/Et6vnsSbFV3H+K1eQW+s
	k1w29c4Zv2B7xVSn7WyaJKkl3uHnpvhqCCYgm5pbJaQzWdvdEbvVDP9fUV8w53AoXPZpglfK11Ti5
	AgnLM+5B59JusYnfSo23vWtVXWxUBYw8lZp2sTmkmCJ8OsYwkwu1rph9ifI5sueALvhB52umpzA7N
	GcDE3rjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1egu-00HTCy-TR; Thu, 16 Jun 2022 01:53:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1efg-00HST5-4b; Thu, 16 Jun 2022 01:51:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 875EA61C31;
	Thu, 16 Jun 2022 01:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6B9C3411A;
	Thu, 16 Jun 2022 01:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344303;
	bh=hjN2r08/Oq7KGlqc8uknY5gQep3L96XqgvBKskBTPlE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dU/ISs4d4Ack/I6FjYr0aw/jfP3YLcgMhOr4ndQcbUXGsZwhf42pungTuY/GpMgid
	 UHG4f5wabbidmEZ4n56Vy0GA24aztj6iRmWJQ4eY638Mt4GgfpfepDmx2Rny2ZOenN
	 MctBeWc3VGj3SiEShC2UMBG5Z8BP77T+DB9oU4ey97jdco28ZwWtbvcgPWYQxK7Y46
	 kiU4QdAQZ83KiNBwzZNs/2iAWb7ktrBEqLv5e8q+Zk5X3hw0nMBAQRdqAMSWbIsbnf
	 9xWydgjdbBnLBRMk/GOXwT8RuGNcb/UlEdtKAc4CTFtEpJYN+mYiXj9c4PyXKExE8P
	 dRU9HdJICqZ9w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-7-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-7-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 06/19] clk: mediatek: reset: Revise structure to control reset register
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:51:40 -0700
User-Agent: alot/0.10
Message-Id: <20220616015142.DC6B9C3411A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185144_237657_ADE6152B 
X-CRM114-Status: GOOD (  10.81  )
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

Quoting Rex-BC Chen (2022-05-23 02:33:33)
> To declare the reset data easier, we add a strucure to do this instead
> of using many input variables to mtk_register_reset_controller().
>=20
> - Add mtk_clk_rst_desc to define the reset description when registering
>   the reset controller.
> - Rename "mtk_reset" to "mtk_clk_rst_data". We use it to store data of
>   reset controller.
> - Document mtk_clk_rst_desc and mtk_clk_rst_data.
> - Modify the documentation of mtk_register_reset_controller.
> - Extract container_of in update functions to to_mtk_clk_rst_data().
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Applied to clk-next

