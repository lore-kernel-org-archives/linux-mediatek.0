Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC04C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:24:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F32C661164
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F32C661164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Z9N3NfkwRmz2Q3olj/1YIPYvBUvucNa96KeJ7wWLCs=; b=T2ti6/KqyiaYNc
	J6cHo1TCT4hh+32m8sCT4uvzM5Rt8+sVj3DY3zofnBLudc4hQSl9hBMKlvv/6JUg7TL4LyfAneC06
	MmLVuAiK/9pqG2KEPyq8ysJED8jN27R4oCkUnNv4WgKnTmnhnJXOzYprbxk/qTgaZ/B+n94wZMg7o
	rFN1TprQcT4N79o7T5Oiy5EgvimOhQ75B+uMIOI2meMM/hjSlhbPjGnuhKTENnqEQ2wKektRQasAs
	9sfF0ud3UFGLeODe5BY0WLL+RP8KTO+GJMmwphRBJFy7LHR4GRVDGXptdn7N+L+KOydH/GKuoNS1+
	fVeXdqYoM4QHuGKCtybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGqN-007LyM-WB; Tue, 14 Sep 2021 22:24:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGlV-007JE8-Qz; Tue, 14 Sep 2021 22:18:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69D2A61164;
 Tue, 14 Sep 2021 22:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657937;
 bh=tIdO8AvfEw7TMRf2V6g/vWLh8elNlsAu49gIboFy68U=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=MSikHtQdLObbGYYkdEBkHoeG7GG4u+lU/qRMPrpaQhFTkFjU6CTPN9grOzFAYHPeQ
 8bqEo3ZFrTp+cgpbRbd4dftGQ8eaXsek8dzMmHELctkXndryIP9RFnBOi9CLBR6pFm
 Q+Tv0HChF0g3nCROodCKkho97hnQj0U4Qol63Stm+8B7GIrHWIw+KFxpqqEpI8rbJY
 xinqlsd/7oIXDqXJDCetapkyOn/ReUg3rdXVOSsFO9bwAcg1Msihb7G484OBvqxCTm
 pxPAJY2r6o0+gjERNmBHOmvF/icmLddQzbH/k7jeYBEN7KgF4xPZlvWPjYyS0zL9OI
 Ywni7JgCyFdJA==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-12-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-12-chun-jie.chen@mediatek.com>
Subject: Re: [v3 11/24] clk: mediatek: Add MT8195 ccusys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:18:56 -0700
Message-ID: <163165793627.763609.7958043375772890349@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151857_930801_FB777BA2 
X-CRM114-Status: UNSURE (   5.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Chun-Jie Chen (2021-09-13 19:16:20)
> Add MT8195 ccusys clock controller which provides clock gate
> control in Camera Computing Unit.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
