Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035F3C76196
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxWWY55ABU1iec/PI/FGeYou+ZE5zGAdR4kl6YGOORw=; b=KsAmNcSJS8wEnBLsZuQtFFAJxm
	bfnHgPfmd9ctuww48d0GD29oX6Kyp4ySFjxAHGOsN6LNIaJdSaRLEmxvnZLPyy43no7lb3XC9mHJf
	H/eLrGMI5wLIQ9kY1hqyiuc2yAy8n1W7urG82vlUFwoUJSjYuvNqLAlq4g9aeo8u4dKgYLpQr1FwE
	eMBeeHfO4lqYQ4uQEFsGkDA0ZD/tA+1HQCzHUDbSOEY+p6L62lBKpJGA0ysnB6J1a8G2NwqxlPwXA
	ZdQLl2CsPMoVY+fD4cBLyvT5pZ3RVc0CCt/kpt66m71h82Yg+k/obXZAJVHNUWveicIBeJRBHvJOl
	lmU15hhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOjO-009Fxg-0F;
	Sat, 01 Apr 2023 00:04:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOiz-009FgV-20;
	Sat, 01 Apr 2023 00:04:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE85F62CAD;
	Sat,  1 Apr 2023 00:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDACC4339C;
	Sat,  1 Apr 2023 00:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307444;
	bh=BxWWY55ABU1iec/PI/FGeYou+ZE5zGAdR4kl6YGOORw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=t+q3K1prIqaJB1yNiPI4PFmanwBArjnsUXFySksJw05WU7AG2Mingh4lcRB/g3DJ6
	 pusYWG1WAaX+kjRJxcisq7tts1svZLIzqsIZOzPVDBntZz0qin1+CvqcH13Mw4LW8A
	 SZenoX9RJTuE590I7sj4Pl7uflnOBIluQgLuwy540N086LEAv2RytUcwN3wgKbNPKM
	 Jsy1owcRZHKewsGZtYaQy1xo0j5oRWTgDlZ6CEnn7dghbMoOIC70bRaAVz2wqlbRD9
	 ApULbyq3fVajevT504JZYnxw9JkNQnqDvt32ZffHRs8R2+cj5t5QCBVvcn2dgJUehx
	 2BCaVsRMK3VYg==
Message-ID: <d32682c77df65e11ec63ffcde20dacba.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-13-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-13-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 12/19] clk: mediatek: Add MT8188 vdosys0 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:04:02 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170405_709400_308D4C7C 
X-CRM114-Status: UNSURE (   8.38  )
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

Quoting Garmin.Chang (2023-03-31 05:36:14)
> Add MT8188 vdosys0 clock controller which provides clock gate
> control in video system. This is integrated with mtk-mmsys
> driver which will populate device by platform_device_register_data
> to start vdosys clock driver.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

