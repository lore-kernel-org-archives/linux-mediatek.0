Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68C8C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:54:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A23DE60F4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A23DE60F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJzOIR1eJZCCmd1yjBMnkkvHi8iZB2g/zsoNqKzexEI=; b=PTfOJhaASjQ3uo
	BSN+ehO03Lw6WH18eIrQwxXQblqo5VGfmR03pXhpiNGDiAyo3ET4LMYqBAUhIOXU8tVwWzvpuJ2yL
	z0zLnDxAcz2NNsZTAFy9dJA7QizksckTPDKr5pxfJHcxXphKvPfsXL5lK2MPDeOtOub7HElteV+Y1
	4AUL/t+b24sgQTLB1dXHddLhDB5BALc7cIaWn81qBmbGtM4pgBsLDeAEGNJLdhL3bEOq8nqDU0WnA
	x5qGTqiOoSaJm5JIKl4N1sTvqkrDKsT2kv7tEOcOPvqs8CuQkJSsCDcXKB3b+3AHjsf6pe7Xy9WhL
	o4112wg/zKanVGHQrznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RHZ-00FcgL-Go; Tue, 27 Jul 2021 17:54:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RHB-00FcYm-2f; Tue, 27 Jul 2021 17:53:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5E9360F6C;
 Tue, 27 Jul 2021 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408436;
 bh=i1c5TttSwSevX6xNBu5xODSh9Wk6yPIXqWvUpmumCsI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=R4psZNpHJy5zZ9pFYdN0ofLOFbt8u0Wnz490suFLF/51SKek2yg7Trh3vZmF1+w0a
 /+nz3Ah+qJRX8aDk1XuIXR7rkBTmIteZgLLWwtjpy1aI4QvKLUBPBM5S9iNOngUPVt
 d7poUNL0PeIha3Z/5DBE2OPVJ8MG9NqXVOEEOqNRb+3NtNrFnlUdroEx8rB90RGz4k
 Da2xvzTCAd8scLQlRRC7uQHh3zTuJhfzVWP+cdh9CEZe98hrEQVFJoktvbm/xBoIir
 WL8bLRZ3DwBd0DIJCMPa7NM3cOaQmp0kPsiNZNESYuUu9gekFH+vUPCooxoIBIY4rg
 /CFnm4YzaD5NA==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-3-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-3-chun-jie.chen@mediatek.com>
Subject: Re: [v14 02/21] dt-bindings: ARM: Mediatek: Add mmsys document
 binding for MT8192
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:53:54 -0700
Message-ID: <162740843452.2368309.13157283201271440368@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105357_205516_F0E1EBB5 
X-CRM114-Status: UNSURE (   5.90  )
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

Quoting Chun-Jie Chen (2021-07-26 03:57:00)
> This patch adds the mmsys document binding for MT8192 SoC.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
