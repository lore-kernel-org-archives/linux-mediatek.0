Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6714DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:31:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3588D61178
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3588D61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcvFnK2biTr9nbhcsF/Bbdh5H4LwgOYEUHv7dLysur0=; b=cbsb8+grCVJI+Q
	r2sS8AX38JjKhh3CcHbTU//DIeYXVe+0mas+nKCbeO2KqAciVEV+ICopIFQMLTV4oZhptlK7QleNA
	Zl7TSqRcvw2zTPDPKvSHQZ/nW0wCh0ppjb62mvSBdOeSUMGsUJet7v+u6DkldTF9SV1yFNBPFUI+y
	zjh2UZTl8nuODoYPrb+hAiBIJAC+N9O8aWF06Qt8o4YGSZF+pWqq2cN2LQ0X2jvh831rgXWrOX3yt
	dgkZ0A3e+nGYysl1cn/oHaIJ4uEnMi7CjSatva3Ll+CiGZJ37oum6tfvT2i/Jjfwhivt6gxs7UpjV
	dKUJECtCdI/MaK0TQb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGxE-007OyA-R3; Tue, 14 Sep 2021 22:31:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGmF-007JcA-Aa; Tue, 14 Sep 2021 22:19:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDAC16115B;
 Tue, 14 Sep 2021 22:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657982;
 bh=+TVInzl/V3fHoee3tGRz68u6q/KN9a2igaTZb8TWSGk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=nvDtMqJiPKsqtMV7h0kuh7TJNAalAi5BMO5Y0luq6mbxHywv2aiQTQDQQJZMc4H3k
 n+mVhXSj/QMPxcp6rV93nQLrJnUh4AXQLRlx6T4zMU50Jg2l4b2efX5QH2iI33MM6d
 AXf5QdIsWkMRnwC6/COU2xbdtkDExkgd/tf9eRuJPhRbPHq0Xld0HAV7+7dcWJKCtn
 0Ez0M+7YvwSVWFtYBnRpfDY+uUNkETRART3e6sSqZ8A2xY81Hi0P7Vh2gbGMOMavQB
 y7Ca61yFautNTNEwB6FtwRgfKshKFtY75BGyBuMV3bN1Etq66l9QhHL16kPrXVUpZy
 7uc9Cf1PG6v9A==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-19-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-19-chun-jie.chen@mediatek.com>
Subject: Re: [v3 18/24] clk: mediatek: Add MT8195 vdosys1 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:19:41 -0700
Message-ID: <163165798165.763609.11608984682123876228@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151943_478592_CDE16E84 
X-CRM114-Status: UNSURE (   6.12  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:27)
> Add MT8195 vdosys1 clock controller which provides clock gate
> control in video system. This is integrated with mtk-mmsys
> driver which will populate device by platform_device_register_data
> to start vdosys clock driver.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
