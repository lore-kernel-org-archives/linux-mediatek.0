Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5860FCCA473
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 01:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVHzH8ThSfXVJWs0q0dKfI6L7DtD6iD1vochxBLpPPo=; b=en5pyzwoFfwjgk27GQxMYB3YD/
	a98ImmEgDzWfFnSUPQhV9JB1FV+zJw9m9KNYSbtGZ5geAuCt/aOyPwLXGZohJDifuvefr1vAAqG8V
	HdCC7DN3/LINqAD2O3G+RLEOvoB33CdjGQ5P/20ZCSlnsAAQfNi5+8jPkP4K2bKwRsHR6bXH541d3
	MmNGyWKY6Vvt0DOTxV3B0xYhREFLwwVvjVBKEs4lkZdjzWJzaN3cEYwtkJOFMViRU+qzIs1TLFhWU
	7czjM/K1xYvPqOGW6QHUczman/Acavbb3cNLAUWpdM7PV2h8a/EJbjPx9akBkDz13Wgt+9JcTvCzj
	/gVrWD0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ehU-00HTWZ-DE; Thu, 16 Jun 2022 01:53:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1efq-00HSYe-Ka; Thu, 16 Jun 2022 01:51:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4EB1FB8216F;
	Thu, 16 Jun 2022 01:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4729C3411A;
	Thu, 16 Jun 2022 01:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655344311;
	bh=yy6FP82JvrA88f4HpGfB5WIAhBe2yJmZ1L6j/1ZUcTI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=gOUzU4BTqgL5SlQT2sTlJMVWB+jaQpbckylBTz9Atv4GBRu++FURvZJtJ+8MdRoUW
	 w1LkahtE1kVdXeXrqjuCzpDSki4LclTG6z8qk76PB20Op4/bawin0KKOT9cgllOThl
	 Byki1+fWqBmWYSgJDCJ+79Yc43M1xO/wMmHy/1v/6hC4I3h4ZNOwypJFsNMukbv4VE
	 qu+vkHHZ7w7vzKKW95n3vw/c9I5LzwW1APWhRPxbKAayHDy7jQiBcskc5/2kUX4HZd
	 ydtGem+O7nU5PcQHIo4sxER/iIwZsaVEPVBHXP7wkZNsoZn1mh0NCDgJsDigVN4XQv
	 ZjDmsk5sp4NLA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-8-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-8-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 07/19] clk: mediatek: reset: Support nonsequence base offsets of reset registers
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org
Date: Wed, 15 Jun 2022 18:51:49 -0700
User-Agent: alot/0.10
Message-Id: <20220616015151.B4729C3411A@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_185154_849130_D6363B5C 
X-CRM114-Status: UNSURE (   9.51  )
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

Quoting Rex-BC Chen (2022-05-23 02:33:34)
> The bank offsets are not serial for all reset registers.
> For example, there are five infra reset banks for MT8192: 0x120, 0x130,
> 0x140, 0x150 and 0x730.
>=20
> To support this,
> - Change reg_ofs to rst_bank_ofs which is a pointer to base offsets of
>   the reset register.
> - Add a new define RST_NR_PER_BANK to define reset number for each
>   reset bank.
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Applied to clk-next

