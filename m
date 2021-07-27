Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD118C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:54:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A710260F8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A710260F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G483AgdxAK+L3zfMnjCY0+TgPbFJ94XZBFUtUYDn4W0=; b=r/ZwLZw9qyeu9p
	3xuqLJc0BfIA1u+e73a0wvzZScmokil7FMaikY9yI7m1ALcV8YLqp2AIrMJqTejpI6cXzECWWTyGf
	CANm5Iespgh+2/eyz9xjqMHgFyOjeYg+IkSahECDaQdNTRP/FLknGYGyk5rW43BVzPFqEF1YIG6w6
	bM5FAte9RdQ7tx30eUxaDN4UslXNTkxyfF8wyTekI0+Zpyhr9J1ruz8jPd6ZxWTDiUaoEts9PL1G7
	GCIwS6jFOB8VQhTJok9on+x42xYVV/yPAKHEqQnQIf9Uy3uIPXipL8Y3GHcAkgEGrBVM1gw0P9d3V
	/Gk8hS2j99ZCcFyTFJiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RHu-00FcoL-G4; Tue, 27 Jul 2021 17:54:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RHL-00Fcbt-CF; Tue, 27 Jul 2021 17:54:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D609860F4F;
 Tue, 27 Jul 2021 17:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408447;
 bh=l1K3ExWTjBH/JcKEEvkRPwTiN653mDX9zd4H/Pyf+es=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=QfKB2KoHClq8tsBASVnA2L9bil+MLDevGv780bz9PwwwxGNikFJIaz9zDEiW1el+K
 lUSdKGz4b8WRowFI+UHB/n9cX4+klmMZWONFxsstUB3/Ln5Am1JfUmVhYHRqa+DrrK
 pL8FVQgKdeH6roeA4knginqp0xqZ9MmO3CrOyuPyz/TwJ2H68KBFmmOHIJTMqogVo+
 520R3e+Jw0YSHpmt0WO0UyVzJCNH95KEnXH2CBziVoQ1uNhegHZ99+ICefvKDQgTVw
 PH5CqTY2urk9V5yFe/ZRWNPrdA2IyNLsVPBHFgycbXDLFgZm3kB7Ftu1TzSlf53vYB
 zVYolPklxRTBA==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-4-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-4-chun-jie.chen@mediatek.com>
Subject: Re: [v14 03/21] dt-bindings: ARM: Mediatek: Add audsys document
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
Date: Tue, 27 Jul 2021 10:54:04 -0700
Message-ID: <162740844465.2368309.1019968952456714373@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105407_501914_1B5F00D1 
X-CRM114-Status: UNSURE (   5.79  )
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

Quoting Chun-Jie Chen (2021-07-26 03:57:01)
> This patch adds the audsys document binding for MT8192 SoC.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
