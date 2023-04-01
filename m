Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAABFC761A6
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ak3UV1DUMcss7e8ouEcPBiwapgasy1IK2elTbnIAk1E=; b=17cNN6cgckXTD5W0Ceew4dzJo2
	4AzW6NPSeP/wrryrr/Mw/NykmG5Qp+E7rf1B3nESnQ9AzKHssuJ3QKsJsDS9prWdY9hSI5tuwE/h1
	AAjWdfQyXvzF1JajvlaODJ4uWs7RUrfu2Zx6UHYthWJPIvsH+zheui4Kg/cX7s3nB8FLYmcvhX60V
	8aYN07nLTxLJgLs54oEYtZ1JXsNAM/cH2yRk/cs/a91KRZP82nPZY86R1wsmc/xBJtUmX5tlRhCtd
	8IIDqCa9Gm+0Rg3m64jUWTapPjxWjfIqI82tSzSdm4j7COXMtQCqnu3J4oUu21WKnOIcLInYbslMn
	dzq3JCWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOjB-009Fnp-0Q;
	Sat, 01 Apr 2023 00:04:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOiq-009FaM-0O;
	Sat, 01 Apr 2023 00:03:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A5BB262CB3;
	Sat,  1 Apr 2023 00:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032FFC4339C;
	Sat,  1 Apr 2023 00:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307435;
	bh=Ak3UV1DUMcss7e8ouEcPBiwapgasy1IK2elTbnIAk1E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Cuik9iBUiRV8uKiTfIy+w+Mj8/y4rKehZNMhOE+B0If4MyFl1ZV9l1JVAzQkMxSak
	 /lhCiJ5QqULvNrRvY6A1++SfKR1NEIx8Xz8dAofEB70PE9vmdFdVokhzwPlXw5l9hV
	 s/QKIl6kGnkH1Wdu1eMVSz233xfFscLaUj+JdwbB6N2H9waBBhdytkR/TYIZRk67th
	 px/sFEsemO14X3SubO3hf3ZPoleN76/PBdraraRMQI0EoPs6tkIKOksiQB0n1xLlPu
	 XTSoFpr2goAXscbSsdKFfbuLS71+NS6MbpzvZQyb6X476hnfDjyD4xdWrJGJBQmqNn
	 ktEJI4BsE9BUQ==
Message-ID: <c5259bd1298cbd8785fdcdb85405d4f8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-12-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-12-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 11/19] clk: mediatek: Add MT8188 vdecsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:03:52 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170356_199489_61823272 
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

Quoting Garmin.Chang (2023-03-31 05:36:13)
> Add MT8188 vdec clock controllers which provide clock gate
> control for video decoder.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

