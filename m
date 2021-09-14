Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A07CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:29:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D515261178
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D515261178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HbNhs9lfaKruRykSD1z3BZsESrHrIL/e7ktwesuQEBk=; b=3QSiGpQxYrCxB4
	8zqvJuQdtQOSaqX4Hab/3OzeMLVmQ7E508r+4gE2M99yW5kwSDfb8o28ocR5Q0nVpLN+Yib/H/C3U
	mUnnQOgn9TOwibaiz2GpVFeC8QYucYqVOjPv88+RjHvaX5KtrQv4v4fgJdKAhR8JYih1raqtd8hKM
	NeBfAm4bPjJZKL9CwDFDEPhjHIFsZEbOoWNot3OaN5taM24skmhsNFW464mo0hFIr8KJ/Y1paDavY
	B6qh7Vig/2/w7NTsk5nCag+dUYaGOP/IInh+EpKRIUM66T8wqZnFtBx82WvXUc6aQ1K1yu3lHPSuF
	HfkF7PZsTBL0BFTzP3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGvB-007O8f-LR; Tue, 14 Sep 2021 22:28:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGm3-007JVr-JR; Tue, 14 Sep 2021 22:19:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34E546115B;
 Tue, 14 Sep 2021 22:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657971;
 bh=q+mdlni/Lc4QXtv6o/C+t7RnY907X+7s3l2g53w6MvY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=KDH6uBsMjp02Wma+DztUUPddGxrj1eWwDVD9Bmyul4zmCS2hUBb+PMOzutqfSbcxj
 IN61vHZcM4Y/OJdwHxWFrgnUy+To48Mmvpu3a+Df/SVvXJ1skKybALTvdMf0noHpcE
 x1rKppBM32vhHlC83/nsiE2kNuaqFSRnHwk10s8+q5kHZgEhagaTTiMqxuQKQD+F0S
 ppCHFbKLKRTxi8OZOW3T/jMw6mTG41IhmfH9iTLfTgYB+Fxt7EzGHiXbX4ipXy3bpk
 x62gQponqJCRa+lOTAY2OFMHsAb0j3WotBud+ajknniFL7MwpCRzs+zJEXe25BGTMt
 W370uzyg8KH5Q==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-17-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-17-chun-jie.chen@mediatek.com>
Subject: Re: [v3 16/24] clk: mediatek: Add MT8195 vdecsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:19:30 -0700
Message-ID: <163165797007.763609.1710818190993007147@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151931_694538_172A3F14 
X-CRM114-Status: UNSURE (   5.22  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:25)
> Add MT8195 vdec clock controllers which provide clock gate
> control for video decoder.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
