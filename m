Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEA8C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:54:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BDF060F6C
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BDF060F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDfl3DbyN9xaAlWhOjFOMCMgetgGSwS8W8UJuhU1gMc=; b=RVTMbVvproRfA7
	gO0ACBrtQUjpcQpKziHAuxQHHysSeHuBJsO6HwbFHOeQ+XOMhahqgh+9MzmznI3RcnrahsJKbAZRN
	9f/aSSOOXGhpMC3x00sAA0B7hAJprRpeiKwre69WcWEcU/PuQKKokd6bIyyYVd33t9b8zA8KI1y0N
	QTXVx6g4NJOyjGO1hMDhDlsKhL5Zp40LleykxGmn4ebuk1fJCXCCFQnUzAVCS5f7+KmqAdaMWhrCu
	GFGAcPfEgOgYTzI333gT1+xFcjRPRfSbpGtjloe2p/HCTa3WesKBZRB1PPcum9xz6G9vKxv2wrQ83
	Dd9YKvrErarpI7Guo5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RHH-00FcaN-Vu; Tue, 27 Jul 2021 17:54:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RH1-00FcWE-7L; Tue, 27 Jul 2021 17:53:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB2DD60F59;
 Tue, 27 Jul 2021 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408426;
 bh=BY/TXrvnkbGZ01/1AG98R06TzvddjiYo8uxzL+mIFsQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Nzlokk7MHArfhr6WtCArBQCmH6G65YWq35WF7bunTLrd8/SjYwgU/+XUvEVGYvp7m
 fI3wYPI0Y+fL3YFyFUXogY0WByB9W8OCXhXxl0D60YBWG21SI9VLdxNPtIER+kSni8
 cFF8aI7DF0L0U7kOHdbxsXbIY1Fqm+ii+LJ1SKPgGBp4BsArP73Ih/o4IkpL5Ww3aQ
 PXYeOgO3QJF6ZNv9SXpm5K5Ul4efcnyj+fsxZamzlzbVBwBWWRFL9mll3MqsTcW8sl
 TPbzcfTPdOrSpZQ00EdbRc2TaDak0188IvTVFMoWY5iHj9YI6mf6iCjimDqepyORYC
 2SbqArN/de/+Q==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-2-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-2-chun-jie.chen@mediatek.com>
Subject: Re: [v14 01/21] dt-bindings: ARM: Mediatek: Add new document bindings
 of MT8192 clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:53:44 -0700
Message-ID: <162740842455.2368309.639019751189620294@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105347_325095_F720DAEA 
X-CRM114-Status: UNSURE (   6.68  )
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

Quoting Chun-Jie Chen (2021-07-26 03:56:59)
> This patch adds the new binding documentation for system clock
> and functional clock on Mediatek MT8192.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
