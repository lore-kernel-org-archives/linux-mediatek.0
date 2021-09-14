Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3AFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:36:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 592EF6115B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 592EF6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDBc1pAmekzLLhdXbHzy5dsXDd79QWJd84R6a9rnWLQ=; b=M51og9Pl7X882E
	cWFYa7+p0EqZhv1Rc4fmNJ1+C4mBR/ZhGitBb5fWFOY/8lUUVqWw2sqQYpICVO6QG4HFMW32AarYb
	8oRDx+WfKCrYaA6ZO+c+HYXwUBjxj1wZE9tj1D86Gx+THAk4UGjASA8Qt7jpvHoKw48dqxMrSJENO
	tcYEsCzPg0FQN4MQNwPO//6lMZt104+RqgCNxnZKxuhSKHMZI9/oB1sk3UZwk2Oss9qjL1QdQSRAs
	eWG0GWaK4DqnrsHYCb7M2Yu26IHQNnB+X65yThdzTaXOKVchafzZEdvCNQkIBBaRaiMpdlJq05/k9
	xiOwhO7YAOxOXxAzYjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQH2C-007RBh-Av; Tue, 14 Sep 2021 22:36:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGml-007JtJ-2b; Tue, 14 Sep 2021 22:20:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A2DB6115B;
 Tue, 14 Sep 2021 22:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631658014;
 bh=jvI12QmPpCnTZnWtnOHFRAXmDQ1Q9jJWv5MmuR9s6xA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=YPiP+CmmWIY/o1SC9RXyQws8EPOPFD4OGHj1ZdWlnVpBykQ2cpfjoQdRPQYQVnCLL
 IWxSwF6lt3gOXyAP+KdLTF7F1IoGhTDe2M97AzVSly9tdr2ie4R0y6CdyamZkB1rbV
 jDAj6sq99Jk9QBwDPqfKjM9hFuPMKm7cy9dypCpL2oKlpnLSirL/TlvwIPbv03LzxW
 ViFAYDbnSARuIizeHPRIRaWFYBbg/9qH+zPwcdgzwrey4RbUIO8KZ/FbWN9nv0lTHi
 PqqXeg48MtOxNUxua+jFcPWS2V0IVCJWi22NOpHaORG57QPm1tNTtaMscy3bAFRgom
 rpZK3hkQJ4LuQ==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-24-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-24-chun-jie.chen@mediatek.com>
Subject: Re: [v3 23/24] clk: mediatek: Add MT8195 imp i2c wrapper clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:20:13 -0700
Message-ID: <163165801346.763609.12185791472817481426@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_152015_205241_77FDB0A4 
X-CRM114-Status: UNSURE (   5.02  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:32)
> Add MT8195 imp i2c wrapper clock controllers which provide clock gate
> control in I2C IP blocks.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
