Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1AAC25B6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 02:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drRK/K0tV/cY86qTeIdR104T/cEoID88FbbQZTchtNY=; b=dE8PHhP31ciAnDLFJiiD8kM8O0
	HTJ+BPEzSigbWpaLZRM1EyQub1bVTIjPCMp1tih9lcf4Qpstv33ot4JiUkNFwS41fTS/p4mMrGr8v
	CXHdj1Zqt+oitdOTCFlNLyqbXZ/z13mBkCWeCtM0hvEthSue1289DWNqmJI4NsydwI4tDRiK50P/2
	DAX93hg2UaiRrx1h4NfuC6TuDUOyeRTwkBo3i/XYzRaK1pkA0o5QQClSzC1c2eSG8cRwn0ckVV4CT
	v4cdL6HQFjrHxQAg11ZiUK8xJLCCaTrw45c4RX8brXJwxDeyM2jjIq9XC+4Qq8lWWCQasO+NvY5o2
	sfg8BajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv6kP-008cds-1J;
	Tue, 24 Oct 2023 02:02:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv6kF-008cbw-1F;
	Tue, 24 Oct 2023 02:02:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4003DCE2ACC;
	Tue, 24 Oct 2023 02:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B32C433C8;
	Tue, 24 Oct 2023 02:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698112928;
	bh=Y0IDUpPqy/a+gLZUhsDxolAh0A7iBwDaXATelPs27XY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=d81FuffP6LqRV0kD+T0iDlD7x/fGhw4AWhfKsjzDya9/E4MnNhBxSRuiXEgzNkC/n
	 JiamCuc72hAVx3awQat3slnb68K6UbKEjhmwtTZyzGLJR9yj2pV0/VCIfKIC2/I2Q8
	 pyt5iJlJ7NYb9OsJ8DSl9NbRnUo2ePemjwHf8aX1pB2710sTQL/fL8uPhW5qRSQ25T
	 hAj555k8fiuXyA34+s+BOVrMk/uWkXxVMn+h2OljuJW7ARz3MQ1Q1tfisLdZlSMq1R
	 +Swis2ZYVIXvchTWHtG9/fOsNe/UflxFkJZvTGGEauvao6dQmAN3VXVqKeGUB+Gk7O
	 sUiqjNnAE+RHQ==
Message-ID: <b94f70395de969227b814f45b0907b86.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230824104101.4083400-1-fshao@chromium.org>
References: <20230824104101.4083400-1-fshao@chromium.org>
Subject: Re: [PATCH 0/5] spmi: Add and use managed resource helpers
From: Stephen Boyd <sboyd@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>, Fei Shao <fshao@chromium.org>
Date: Mon, 23 Oct 2023 19:02:06 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_190211_596075_D5C89A37 
X-CRM114-Status: GOOD (  12.19  )
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
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Fei Shao (2023-08-24 03:40:07)
> Hi,
>=20
> This series adds and converts to the devm_* helpers in the SPMI driver,
> based on the suggestion in [1].
>=20
> While at it, I have some patches fixing other minor issues as well, like
> reordering the remove sequence in spmi-mtk-pmif and using proper error
> return code etc.
>=20
> This patch is based on next-20230824 and [2] which is not yet applied,
> in order to avoid potential conflicts.
>=20
> [1]: https://lore.kernel.org/all/20230821033532.GA21555@google.com/
> [2]: https://lore.kernel.org/all/20230717173934.1.If004a6e055a189c7f2d072=
4fa814422c26789839@changeid/
>=20
>=20
> Fei Shao (5):
>   spmi: Introduce device-managed functions
>   spmi: Use devm_spmi_controller_alloc()
>   spmi: mtk-pmif: Reorder driver remove sequence
>   spmi: hisi-spmi-controller: Use devm_spmi_controller_add()
>   spmi: Return meaningful errors in spmi_controller_alloc()
>=20
>  drivers/spmi/Makefile               |  2 +-
>  drivers/spmi/devres.c               | 61 ++++++++++++++++++++
>  drivers/spmi/hisi-spmi-controller.c | 32 +++--------

Applied the series to spmi-next.

