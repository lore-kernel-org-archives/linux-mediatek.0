Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014C8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2CxAdfw8ZU9qPNOUlxNKOl+qTpEV/6652zMVA8upMU=; b=kcf99MtDdlh5hl
	ktP+d1ZVajuCxKnWqnkaH2R1jMSjgupl/ZOjdPEYLdT7l1B+mW6UEbf7ge5wJ7oJfHCNx+lnqHo+3
	gLkOIb6XGGaCLol4nEPi4F/FHWLi3xVCU4BZGRHYMBU38h4b9nyh0PrzqqrCasX/0ClIDbBrM0hVb
	yOdyrXGSikDmSQjOBUyak8QUf2y7ivCQoEmPkOhor0+wPzvlNbDCXCiRq770xUMG8U91goV6hBzYc
	Xz/fH0oHpCCvb08xryDGrd9oHALI6QTrdphJwb7jNTqivHsT5GwBOEH1Ax/zpUVK8ooBrsoIUPZY+
	gkfSgL5AN1oMld78hmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnd4-00CCh3-CL; Thu, 17 Feb 2022 20:43:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnPU-00C62b-TK; Thu, 17 Feb 2022 20:29:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 08879CE303E;
 Thu, 17 Feb 2022 20:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59261C340E8;
 Thu, 17 Feb 2022 20:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129789;
 bh=XXqMZtSNGb7B64MKmIWBCf7B/pkwBDck0M+zvZtALmg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=WOl8ePxv3hWUcb2vS3LVT477iQaDwhvsSrWjsOawxI+MhejodeVMDS9icSWSh/5v1
 SLSio65WaZhq414KvSZ7z2s6RKHmeqnJRJoKRq509ShKsUDAwJa28B7TL6THRBbEqk
 zwFhk34wAO36kyjjn07u4tsZWcZ6ot+MtVHDvdROdzGE5KQRb0/Zvx5JD1dUEf2E95
 6j526oI1c6Uf4+/LzNOmOdy5Yx4hipw/4Z4YBhd2sg5uE5DxWx5TYQ6ovmThwHR6i8
 B4elaX7Ih9jNN8y8ot/7zTyfZeUZ9/a3FFifCb3cZIOwET2w9pYffm+Z2OdZFHdrch
 UfYPWgnRzBIyw==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-31-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-31-wenst@chromium.org>
Subject: Re: [PATCH v3 30/31] clk: mediatek: mt8195: Implement remove functions
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 17 Feb 2022 12:29:47 -0800
User-Agent: alot/0.10
Message-Id: <20220217202949.59261C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122953_176785_FC56BAFE 
X-CRM114-Status: GOOD (  10.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Chen-Yu Tsai (2022-02-08 04:40:33)
> Until now the mediatek clk driver library did not have any way to
> unregister clks, and so none of the drivers implemented remove
> functions.
> 
> Now that the library does have APIs to unregister clks, use them
> to implement remove functions for the mt8195 clk drivers.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
