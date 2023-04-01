Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0F5C76196
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 00:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KtISPS2ZInTA1GsgzTeaUIC7U5mlUYTpk+mcJ78ZTo8=; b=tp1w2CHrnlvIt9F3JCK9TZg9GD
	Ruu4mGzbA9QjZF5GKhxru/imJ6YdqzWp7O2cNp1KKBicZvc78P+0gDEfj4lAcaUuxq0qRzEIs/5In
	9Eb5p0bNL5Xa6VzqB4NRggpdHHHhlZ8kF3dqJkc/wNhDvz2kSOu2oMaRwCqFY2YIvCYIm8ZHOwO70
	lnTq2E0SwrNewan/fcY5jwFaawrSDfUS/N5EUSVvUGlOELqCHQWgf91b23SE6TU2JW9T/wnHMaI/1
	mghN6XWEaHlSasfOt/zxaxXSBRx/+LW/fCsLnaC2QcX0iBHKhb48VieSFAahbrNbJql15jClwcgM6
	Y5IOr4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piOfj-009EAc-0D;
	Sat, 01 Apr 2023 00:00:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piOff-009E9C-2g;
	Sat, 01 Apr 2023 00:00:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8D1862CAD;
	Sat,  1 Apr 2023 00:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A67DC433D2;
	Sat,  1 Apr 2023 00:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680307238;
	bh=KtISPS2ZInTA1GsgzTeaUIC7U5mlUYTpk+mcJ78ZTo8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kUE/WV8P+t4VpCBk46eGEckcOp2IBdG0VQ5LayVsxNeDil8jCnru2zWRrzUoWox3F
	 7yo4W9Ak/cpcsjsyQY++0dod6966qcXv2v85fwFCi2425AnvAGvFEcb2WkZ0zyxLMi
	 k+a5ryiVGqDCKbord0Nq40e9SYzxtV8saGxP6K54yGTMvJlH6EswFhOMFBY9Z9XHzs
	 2p8pgVT+VTMZ5xzSKgYS75wCrJeW8XjqySLeF1uKIYF1K2vfGqN3i1XDm4v2W/kC1m
	 rJLY+1/xeWUcazB2+Bg48CD5cXKqlLxAY0bzsBKukjJbyIFXNIHKm45FrdIqHGR9hi
	 JO5H4gRbdXt3w==
Message-ID: <2b4d94bb6a6b88235a4578e30270f4ad.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230331123621.16167-2-Garmin.Chang@mediatek.com>
References: <20230331123621.16167-1-Garmin.Chang@mediatek.com> <20230331123621.16167-2-Garmin.Chang@mediatek.com>
Subject: Re: [PATCH v8 01/19] dt-bindings: clock: mediatek: Add new MT8188 clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, netdev@vger.kernel.org, Garmin.Chang <Garmin.Chang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Garmin.Chang <Garmin.Chang@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 31 Mar 2023 17:00:35 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_170039_909679_2DEE9754 
X-CRM114-Status: UNSURE (   7.65  )
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

Quoting Garmin.Chang (2023-03-31 05:36:03)
> Add the new binding documentation for system clock
> and functional clock on MediaTek MT8188.
>=20
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next

