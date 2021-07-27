Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EA6C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:13:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF77160F59
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF77160F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LphIuMnLl7frHupxIYa/qcY6uFwx1zqvdy5LqbUpeFM=; b=vopgfc1lPJTq51
	FkfrMvTEe/LXZKCftjPYd6vfTVDvW3DU3bBfaxVjuuYBjW/q3aOMeWuayoVy1p1SQM/niq7v5j4Ix
	yZRrUmmHY1h6Ei+0484k9aCStzV69V57Kw71d0ZJ2y1k9Sb7WIz0tY3BrLdPYDm7YaIxbOqhVNUDB
	oi9Aaz6432M3b6EArA9KE9zsX37uG0o+LVn+a1se+bsNyD5Vn+5J5q60AyX1BnQ0JH/SjOdHaUQXO
	s4Ut1z+YU140gqMiexGf1uk/i5BKc4MWeeXbGH3T4JtASK8y7j3SXjo6hpxw3tp4FG9yEPKmM7IRw
	lSJ/hAJZXh8pAd5HXnAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RaA-00FlaQ-HK; Tue, 27 Jul 2021 18:13:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RL4-00FeUh-4r; Tue, 27 Jul 2021 17:57:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A42906056B;
 Tue, 27 Jul 2021 17:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408677;
 bh=NApySyNNkHtOVvBftwxAyibsqZWM7xqG2gsVMaN0Rlw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=YNieRNQGb5tD8D3X9F4qWchot+fVqvWWBgGSvQWNYq9O3VRx6VutzOiTRDFhwIoYQ
 1aFaIaTW3hTUK/dKj7kD6/6JwEQUlnjDtJe/ZjopjoiNQCZ2+/n6JCjl1e80UorCr6
 Wmdd9GxawdHh2idWaMywtkkhAeR50W5CmHT4gzD9kCxrwTNJ/PGjCY2fvfvEAAFD3H
 WoUQiDFOzs8+XasFOeO1pVTYpM9WOMzY+FllvfX7CsFDCcW6APFgVNnn1c8OZNJckw
 SRozZWpib/DI59OhrD8G0anP7ICrXUaMJnZdyJLEC6jD1Tj6TJpVh7tGL+rNcieWUb
 TcUKIZE9YAjeA==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-22-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-22-chun-jie.chen@mediatek.com>
Subject: Re: [v14 21/21] clk: mediatek: Add MT8192 vencsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:57:55 -0700
Message-ID: <162740867556.2368309.6510644230868732963@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105758_329565_2FA76931 
X-CRM114-Status: UNSURE (   4.84  )
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

Quoting Chun-Jie Chen (2021-07-26 03:57:19)
> Add MT8192 vencsys clock provider
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
