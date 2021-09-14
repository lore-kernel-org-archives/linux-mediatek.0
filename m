Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551B0C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:22:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD3A610A2
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 22:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DD3A610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omH0SUA+Ge5a9y+CUCk3zrt+Kf9dlvYoIx4v1VYgF6c=; b=fHN2k4SiHG7Ie0
	/n4GKyc5bhN174foRvW2nEMl60O/9ss6ohPEPN42ruJC+Z8f5RV14lRLQ/8Ig0g4kDxT2BqudaQTj
	ExGIcbp1EqejSXQMf+rRVaEjEbxo0ET65Of0JmE/+qq6WSLduvzWcLF+o6+WIINCHhWRTaoJzhD09
	gufxpAvH6td1w6S/bcWimdD0rY7VwdnAZ6SnLEdfRu38nTr6K9Wx/K6qVF00fXQuMjq4+ARHEO6df
	h7CODYuWBxC7FGJv7D43PbuEexf+IY12pCjjcke5K7MYRBrlvQUgCbzHXooImqtY1rHP7LPopjYvU
	u69dNMeAIa1a5FSkuk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQGon-007L6e-Nm; Tue, 14 Sep 2021 22:22:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQGlC-007J3q-OU; Tue, 14 Sep 2021 22:18:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 59E7461166;
 Tue, 14 Sep 2021 22:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631657918;
 bh=yuT49ZLUiStwMqFdlVDdUjhjOeQGsFjtU3vuUb4EGQA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Zv7UQHk4FDcueCVQo4VCCWXtyn0FEuCnIcGqorlBxea15HBgA+bJ/QosbjB+ICGSO
 FH8TE2KcySein8v3dp12NWAB/GJsjbXvsZcFAPUXMXT8oWn5DaqDd36cJy+F25tze8
 AxpFZFYACuvfNDFEJ1joCBB1RTgz1MITi3pNvkl6NNbbuXZoWEswV9j4c3zU+2h+UF
 OA6burT8fd7sYHtaA/Z+7YPHkJH67oDO74buZvjTaje+RYgzVLLwKPAc/oqKaWCKnM
 mp7/o4pdNCzd7/Yla5F4wG4w37exL6UdwEj7plz91w+Rbr6UlAfvKN3hHFeEeTGcs1
 CJHIO0H1RZS4w==
MIME-Version: 1.0
In-Reply-To: <20210914021633.26377-9-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-9-chun-jie.chen@mediatek.com>
Subject: Re: [v3 08/24] clk: mediatek: Add MT8195 peripheral clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Sep 2021 15:18:37 -0700
Message-ID: <163165791714.763609.4217812173195120259@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_151838_870935_F9FBCEB4 
X-CRM114-Status: UNSURE (   5.57  )
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

Quoting Chun-Jie Chen (2021-09-13 19:16:17)
> Add MT8195 peripheral clock controller which provides clock
> gate control for ethernet/flashif/pcie/ssusb.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
