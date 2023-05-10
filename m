Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006A0C77B7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 20:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27KIjq7CBSBhNB7+NHDWhRflDTQlTyuk3TbNQR93QOE=; b=1D4WMnVHPMxZ9o91OqX6MK05Xv
	5wsitFB6IjCg40Tu4Tm5fqYPn3cWXUrVOnOYRvI0PidAG+brHHNqbMNDe+zKPnJAW3vI3A50Y4nYw
	47KlJMRQFxzt8t76Om0S+nUpe56QyV0OmDjyDC6QIufs2wvcw6Ps2KuaHFaeIDVveFRwWdSrZWxJ+
	27ANoJpcmXBfq+bLhPaPCM34VncX/rhC2JPHPygv//WrCzuS5RUYB4X4ynUjupJR8K0NO2UkNN/cM
	JBvL4dtD4VtY4v3BBH9hFvZIitrPYzYl7jy8l14cWGIsqImKWbZAmzh7cANNC0T01mn7zw7R2h5gf
	54qRW62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqek-006xjF-1U;
	Wed, 10 May 2023 20:43:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqeh-006xiE-2P;
	Wed, 10 May 2023 20:43:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B3716401A;
	Wed, 10 May 2023 20:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4783C433EF;
	Wed, 10 May 2023 20:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683751402;
	bh=27KIjq7CBSBhNB7+NHDWhRflDTQlTyuk3TbNQR93QOE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ra0A8gvZWpxO3dV57jJxQtcMtBgqHhbMsedx0sWbyAAxUv0Nfz+zpPbgUQhXfdR77
	 38jkUQpcXSNKBlaoBMeHbp5u6EGQMvTU2y8VG2UFoCt3+hz90Ede6PsCBUxetrIMhJ
	 3JT+Z6G+FcotxuVEtMjVQqnIcxDf4lmA95JIr44ZrwmF9PNzGSrUNjJT46doVBVoX5
	 vsLdPU78WeShn5LmJmdC30NBIPtbmFeSbUpA+EwCNOmW0ghEboMtJGKCCJmTLTCM6O
	 bMhN83SiHyokHJn0GhcBIHVzAvJ8jxPIQ7kSDObLnEd3uLbREtAprnXxHVwFq6G/ww
	 D1CJkHxDTjOEA==
Message-ID: <59316f19892d2e7505b95500eaee25d6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230430190233.878921-3-u.kleine-koenig@pengutronix.de>
References: <20230430190233.878921-1-u.kleine-koenig@pengutronix.de> <20230430190233.878921-3-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 2/3] clk: mediatek: Make mtk_clk_pdev_remove() return void
From: Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@pengutronix.de
To: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Wed, 10 May 2023 13:43:20 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_134323_831498_AFEE8274 
X-CRM114-Status: UNSURE (   9.96  )
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

Quoting Uwe Kleine-K=C3=B6nig (2023-04-30 12:02:32)
> This function returns 0 unconditionally. Make it return no value instead
> and convert the drivers making use of it to platform_driver's
> .remove_new().
>=20
> This makes the semantics in the callers of mtk_clk_simple_remove() clearer
> and prepares for the quest to make platform driver's remove function retu=
rn
> void. There is no semantic change.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next

