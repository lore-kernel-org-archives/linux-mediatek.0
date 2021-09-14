Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9300CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:25:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F9BA61164
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F9BA61164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuTXnK2yoJH7LiW/ENI1W3eYs86r9gALSvuOXIbLST0=; b=tj9CCf8Ad651Jd
	ZRzPY8gHT5pKNqqfrWil+j/itfW2ascSaqPEWXTbCMVlsNy+Uzle6pnZGpGRNpNd55typAA8ELufv
	odfsim9QMw8N9JfwCwQSs4MC52AOhIPwoeDbg3B1+ma1qWjGd8O9FVySJtKf/4LYvWdPUdFCvunmi
	4241rtEEn5sczwcNWIzOl0wc1sEpN0oZBVCBywMX+fDfBov5QgfuQgq8pPTLTR+AfPbVG7eMKlra+
	KX/QEWFm0XYCYyl+MdkjycMXyo/nO46k8gTg/+lqT4tw30MtQUwJZHF8I9TtoKpDcdAjFmwe0FXm3
	yfNQgMRSGiGPl2ISAYAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGrn-007MeS-6A; Tue, 14 Sep 2021 22:25:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGlh-007JJs-11; Tue, 14 Sep 2021 22:19:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C34461184;
 Tue, 14 Sep 2021 22:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657948;
 bh=Og5YvxQccboDxIRsLntpmDoc7Q6eiSITMlpYoczGtoo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=bWETerniKb5tuPkPE7bpUkYOagEPA6o1o4KNm4DIewQlLt9J0BCLP1anYqECg9Ae/
 V5nrpC0tJtNMfccalUPhOebBTa7zluDvCIWefRdbbYgmjTHeDU4f4Bdi7qeoG4dGFQ
 t1HArTkPsAapUdL78IfWU9JDndBcJcvtgv0qB0C0nUykgI8UAERcX2VlfayZxwhHBs
 Bo7/janhMGqd0bhWqfoaAWnVwamJTlV1E+ZdXfvjr9En8F1oiqBnd2Tgn4G/K14kDa
 QFPioGQ/0B5P8CutqEie5NfzHoNpWYh1JB/YX+LqrxaLO8TxUAmW2K5cbu5sj/uqV9
 kD5picvJNjrbQ==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-14-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-14-chun-jie.chen@mediatek.com>
Subject: Re: [v3 13/24] clk: mediatek: Add MT8195 ipesys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:19:07 -0700
Message-ID: <163165794746.763609.13448883456440776494@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151909_124080_BCEDAB99 
X-CRM114-Status: UNSURE (   4.82  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:22)
> Add MT8195 ipesys clock controller which provides clock gate
> control for Image Process Engine.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
