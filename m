Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4591FECAAD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 01:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B8IWmkM0+7QLuDYaM3ko8v98YVHZlmNYJmHuQm3tY2I=; b=Hi+Wk7oNfV0E48cEvjWrB8ILd5
	Sd5p4Cr5eYqgrVdok2iQWbCHoo1xCZvhe3W4bGEBjcMUzee38XeHZMlVTnbAnCndS/pTiSYHFKu+a
	ibO28brXkFPnyNt/h0D8s7hPQq1GjT5uHiJT/Sj1ngrutV+kun8kgKmqXk0ySJXC0hty13RsND1XQ
	FFwcq7K4MyYTqGHSAOgi04P/9DTTpwdGd2LDdVdRsKU+tHxmTTwazRdmF1SGwkv34lIeYs3M7M2z5
	iMrlfiGonAqhs6+sf/YXFeUJqL/QIgYIc4Iw3ZxC1/zooH3t53I/QBpk1SK8qlNmOE8SuyWSaujke
	b35VOFpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obAtR-00D3pz-18; Thu, 22 Sep 2022 01:20:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obAtE-00D3nh-V4; Thu, 22 Sep 2022 01:20:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3099FB81A97;
	Thu, 22 Sep 2022 01:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46437C433C1;
	Thu, 22 Sep 2022 01:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663809627;
	bh=S0pYd9pePfNLzzjVw6IuGapX4viErIn2aDKs7zQI7sk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pIz2g6kZKroSipINZM8ZZQRKYDYMbEa3HrRUVklPcOxwUrcJZ7hzQeu+9kSW+AvgT
	 SpMhMWc2HAJgDVKl76WXRmU1dZhSIMpESDAJLtbNETL/UkeQhTnqks+Ee34pzkb49x
	 jSRuDwCggPqsQwK/s1fvTyNIzlTnvmEPghRtB5NSTU+iRGaaTHNbCTGq30O+4uvU2A
	 DVplYGsjtJVRU6uGaWKVDJmYiPVulw71rZQJ15MakJuHmZZBpzecA+2gQo8aCSaTCp
	 SoBg8Syd2YXIn5pNG3Ny0DzBJKr7NoStjWn/fxNfq7HwRE3F6tz0SCSaFGskxJdHqW
	 mwb7gZLS4Ttzw==
Date: Wed, 21 Sep 2022 18:20:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Alexander Couzens <lynxis@fe80.eu>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] net: mt7531: pll & reset fixes
Message-ID: <20220921182024.27e33b09@kernel.org>
In-Reply-To: <20220917000734.520253-1-lynxis@fe80.eu>
References: <20220917000734.520253-1-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_182033_175074_C89AE0B9 
X-CRM114-Status: UNSURE (   8.84  )
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

On Sat, 17 Sep 2022 02:07:32 +0200 Alexander Couzens wrote:
> v1 -> v2:
>  - commit message: add Fixes: tag
>  - add missing target branch in subject

Landen, DENG, Sean - please review.

