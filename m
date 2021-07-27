Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D897C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:56:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EF6D600CD
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 17:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EF6D600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oa9TIL37t7Nq/2er5+POp4aCvvYfeMIvcH+qeAchKs8=; b=BAVUOvnXQWy/2o
	X/BpYZ4zJ41y6PEtOtmtqGrWQyOxlyzfldvYL4FX91CNIkyQLeip8e5ZeZObhJH9X5qi7kwVoExFz
	oPu284qSf7QG/IIKcEHt84JJknkL0a6fJcCsJsp83lPCJZdP+mqFDP1HaqzKhE7mphzU/d6gcOBvy
	LuvdGhlVd/WjEPG9meRqOfRumM+BQYf//zLiEls4cAtkS3F7DtQlHFBmdDwTjAOxWzhk6qswAGHqY
	mdsQIIWOD0r8F50j+QaGJbuReD9GWCfqcmtf+woyxtWcXExYGU4U0DfV6t8NczURlKUpCibAn2ecJ
	N0RI4Re9EvRBYugNwBcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RJ4-00FdQb-3Q; Tue, 27 Jul 2021 17:55:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RHh-00Fcj2-Gq; Tue, 27 Jul 2021 17:54:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20DD260F91;
 Tue, 27 Jul 2021 17:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408469;
 bh=kDiVzdc+UAyPE1obrWI2EA3dFVaL4d8che9242Zhkys=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=gjAqadbmhB9+AO6X0JU/qcLeg40yy93Xkh3kGJO4stxPHQtOZYBHJbUr4g5aCLnS2
 gucdesdfcDgRUixP+JCQJcWNUj3K0Cw97DKXQDiYKb6POs9b+gc7j3MlpIPI3oA+EE
 4KPPaUzcMu8Hz4Z3KuUS7o+3C5483ouVHPBVV4WP1c1ITYM/xrvnAtZFgBYlxwEFGy
 6KZDImArgbKTCxKpQO8H14R1FxGeiIxm5RGlvL0F7AAKzw4HIION2oHIMRpHUtzE28
 6MEHgmmHM9kEIQVwLF1zLPCJufGdiWgNW9gKRmlTWeMqcw4rqOCa5Jsd67hD+hw0vo
 hcL561s+4HYVA==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-6-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-6-chun-jie.chen@mediatek.com>
Subject: Re: [v14 05/21] clk: mediatek: Get regmap without syscon compatible
 check
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:54:27 -0700
Message-ID: <162740846702.2368309.32443659644468726@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105429_607471_CC9D3894 
X-CRM114-Status: UNSURE (   6.06  )
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

Quoting Chun-Jie Chen (2021-07-26 03:57:03)
> Not all clock providers need to be marked compatible with "syscon"
> for system configuration usage, so use device_node_to_regmap() to
> skip "syscon" check.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
