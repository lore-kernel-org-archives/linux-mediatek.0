Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AE7606A321
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 18:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yg6p0EGi;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=VXmBLnO5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g4XjkTeEPorowL6TGZItvt/dW091Sbnkdr9qWSWKFsw=; b=yg6p0EGivti7i5
	a49XgeO/2qKhYB7Eia1rwEX2bVGU0eJxsJP0YB7xgAjt5y2HFAy9uPW9DQOvcNMFvlhvET50/709f
	H1QIN/091xQpjXJ0n2cKJXTGSnozcHoZyN5B3rQVf/IB49JFnseAuQYcx8cs1bnFNRqitPZJKU7Yw
	0MHyiCCzIalBIjiDd9CtELMqjl5OQm/e6d7eK8M+ff/v+A0ieVqtriLOd3nUY58wBTiySjQmHtS/n
	6XxE5ic6nE8znGJtpKdVvkeJL4G8vl3MJxqG/KphC1dTgsUAVtfkp0fs1fwYXujOGfoVaajmKL3xL
	Cgjcf60aVu859fxWEmrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0RF-0000000HNjo-400t;
	Fri, 27 Nov 2026 18:12:49 +0000
Received: from mail-10629.protonmail.ch ([79.135.106.29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0RB-0000000HNgy-3JVk
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 18:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795803158; x=1796062358;
	bh=g4XjkTeEPorowL6TGZItvt/dW091Sbnkdr9qWSWKFsw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VXmBLnO5/cti5FpDWa6tnZ0X0x1Uo6/ihGFibv4xMx/41pfr1ie0ISxHu+0gP94o8
	 LiDJfqNHSmIpgRB97B1Fzar0fBtj/yHtfvvBKzGlzLQjaDdreYaNJVgj5gtbp8+LUm
	 BK1CaB3s16sypcJxjB9e6SgMB9EFiPXsK+zz/Ni5S5DMvHHbQHSb8G0DBQ8honoKvf
	 5Gw+GBswRwU5Nkh/lgsTNVOusr2i6oGQ8f21tH3PqgSElJSlgUHK2B9ezzsxMe7Wt3
	 WYaboM+HqUTnszU/8wVad7bggWCEgsljt1jNNXiUWy+MHw71jdAn0jTeLraem1BzOs
	 fGnj1iaeRA+rA==
Date: Fri, 27 Nov 2026 18:12:33 +0000
To: iasnezhkov@gmail.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, amergnat@baylibre.com, me@adomerle.pw, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
Message-ID: <czEp-CqZIp301roqRSqIALy9ubTnOg7uHv75zRifEAuhIS0f1zSU45eKzIC3fZfiUnaahQK6yVuQvthvHZOt267Mpt13X55ERh2A6HJRTic=@protonmail.com>
In-Reply-To: <20261127030009.10572-4-iasnezhkov@gmail.com>
References: <20261127030009.10572-1-iasnezhkov@gmail.com> <20261127030009.10572-4-iasnezhkov@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: a252025cd58c9cc04ec8fb1af0e63707bf4d7bfb
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_101245_991115_8DFB87F9 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Friday, November 27th, 2026 at 5:00 AM, Ilia Snezhkov via B4 Relay <devn=
ull+iasnezhkov.gmail.com@kernel.org> wrote:

> From: Arseniy Velikanov <me@adomerle.pw>
>=20
> Add PMIC-Wrapper support for the MediaTek MT6789 (Helio G99) SoC.
>=20
> MT6789 uses the PMIF-SPI arbiter interface with bank 3 interrupt
> registers (INT_EN at 0x450, INT_FLG at 0x458, INT_CLR at 0x45C, mask
> 0x180000) and WACS2 software interface at 0x880..0x8A8. Register offsets
> and wrapper parameters are verified on live MT6789 hardware (iKKO
> MindOne, MT6366 PMIC).
>=20
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
> ---
> Changes since v2:
> - Added PWRAP_INT_FLG (0x458) and PWRAP_INT_CLR (0x45C) matching bank 3
>   PWRAP_INT_EN (0x450).

I don't see INT_FLG and INT_CLR in the 5.10 kernel [1]. Where did you
find them?

Also, the series doesn't apply on next-20261125. It might be due to
recent mt6572 changes. Please rebase.

[1] https://github.com/xiaomi-mt6789-devs/kernel_xiaomi-yunluo/blob/d92da04=
1e3ad824c273877abeeeb07c145c37d02/drivers/soc/mediatek/mtk-pmic-wrap.c#L667

Best regards,
Roman

