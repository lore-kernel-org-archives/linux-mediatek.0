Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302A2C761A6
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTGYHNuuAZO6haFQSFEZ55WmDZn9648bnu1Ejih/pt0=; b=ZolVRYYpavqckk8Afey8zQx2C/
	E/7UluwQHmxs67Eu4C0eq5gtJYZdY6Jb5jikFH7wQ4A+RLlIrVHr2oVwKpw4VTEnX8xZf6gJSnk0Z
	TzTeWHnbzIMKP4Gbk3tHXNysfOAsV1r2Obg5LJ2yIo2aaqed1iqRUfQNqWUF72RKmUFObVQfp2K+1
	2SRdOgIHS2/OvoNROrLSAINJTjcZHKPVTC8tPQ4oc0iCbMqLW1jr4saTQACg/1Xpr86aPTC6ZmAsQ
	WdKoowMImd7XGczQ0qMQKvTcw1vDlqx5MtOfyGXpL8LTWervWKxx4UmyepdkFjd5SPobkEI8uhOLF
	V6QrYZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOiw-009Fec-1e;
	Sat, 01 Apr 2023 00:04:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOif-009FTC-2X;
	Sat, 01 Apr 2023 00:03:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4AE2862CAD;
	Sat,  1 Apr 2023 00:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C253C433D2;
	Sat,  1 Apr 2023 00:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307424;
	bh=FTGYHNuuAZO6haFQSFEZ55WmDZn9648bnu1Ejih/pt0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YqmmcM1xGngmFEu8DSpAZPDQKEJ68cvzlhyz9V2cG2c2LosxqDA6tMXf0+F8k8EIR
	 pNOKZgi7KuFVZHG7gVa045jLVdVYuNTQfsBWDEV+YpC3RXCtA3QcHOnsNtbooBrdkx
	 NumkI+jrPsH4cLDAz4LfsESitogeWu/x4jMwAUKx9GVirQtVhbyrSmuRZS5Pq7i3Ho
	 e9T2/Cjceuf5A3jmBFjvpJeQNZDPfdvgRc7P+mRDy4w5R2ymTBL2+qQim4XYPwL2Mm
	 1UOvAsQ/TMMm5g7/k0YJ6iKP7uZqS+lVfjdh3n14AeHcHG94h8RQEBPHVdSAW3HaM6
	 +ayy+zx5gYXNQ==
Message-ID: <cb85d26d5daaa04202c011b8b137074b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-11-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-11-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 10/19] clk: mediatek: Add MT8188 mfgcfg clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:03:42 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170345_897070_8C3CFE12 
X-CRM114-Status: UNSURE (   7.45  )
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

Quoting Garmin.Chang (2023-03-31 05:36:12)
> Add MT8188 mfg clock controller which provides clock gate
> control for GPU.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

