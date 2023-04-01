Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A79C77B61
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXeoGkEVjRSN/MwxpdxmOvcKGV6vuv6XHpFzGRosFck=; b=2j2RnHNfM2VPz2066ZlbsryQFf
	m4q2LKeKxYJdCpFnLsBuJmCPtrl1d5DLhoIRXWS9zJfiQrXwwGJ0TiGsLPLljLypeWd5uIU+G+UX5
	nWd2/eaUS7DCrv4L/Z/Rk830aNj2qXyc4H+cddU16i6sI3xjhUAY50a/hAXvLgLaoWUgCf5Mtox1g
	NrEwRwKtL4X5NnODl3rGvbTTpy1hzwhhfeg6wKhLAv8YbyNEuo3dscvpdGPdqWsIyoj1fznGgWTZ9
	j+k1Q3IBGMQvEx6cfYlc/TVzUK2KYJq8+Ew2AltyBmBrARjDdaXDmG266o0n0EFSFe+AlgoqZ79iG
	k/v5+X7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOjv-009GLy-2D;
	Sat, 01 Apr 2023 00:05:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOjU-009G1o-0b;
	Sat, 01 Apr 2023 00:04:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C8361B832B0;
	Sat,  1 Apr 2023 00:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C3CC4339B;
	Sat,  1 Apr 2023 00:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307473;
	bh=aXeoGkEVjRSN/MwxpdxmOvcKGV6vuv6XHpFzGRosFck=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MfvYGBbWCpAbk3yv3d7wJh9OT5sVTEEsdljx2lix5Dm3J2K5jd5gHsUaIuaXdczp6
	 F78t+ZWKdqXAPloXQZ7eRhkFz6Be+Jic1dp31e89eqTrPc9GCL2BjmFvYj8k5IAJDl
	 IDHl7rFEA8SLUXkk4hbOmH8bVzajVzHnbo108XHzpm8ymHNpO0bRcdrLh3ThoWrW4t
	 iSXgTFlab26SvhKtRupK0TlrnVEjOT6My6/9PfDrjpeft35Xtmksu27WR//YExNsQ/
	 h8qasZie0/8gVcNjlZ0Y7zOFgIKeISEtube5qyytstx9EaB5bggwrXwozGLWuPF/Eb
	 FfPkdQghgp5iw==
Message-ID: <ddef61e4e515007d97668bca290bf2e9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-16-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-16-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 15/19] clk: mediatek: Add MT8188 vppsys0 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:04:31 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170436_464020_FA2C3931 
X-CRM114-Status: UNSURE (   7.18  )
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

Quoting Garmin.Chang (2023-03-31 05:36:17)
> Add MT8188 vppsys0 clock controller which provides clock gate
> controller for Video Processor Pipe.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

