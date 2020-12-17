Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2696C4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 09:19:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 724AB2388E
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 09:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 724AB2388E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j5y7ymE7whoUg/C26u0dsTHZQ0uIfCmuUChnr9G1AN0=; b=06wy7GjajGO0FmmfYfTjHzN/8
	9Ro4u/cTWMHT2NSmm2J9adtAYoxhXmn0E9zeXRR0vlYRFPsHKIbjLJ9GRKcSpOj3c9mg0R13ynRLZ
	dVCE4D7jfyZ7hDZCN3l5O31zIZKN5w3nkl3Ut4+sXO6fNUh1jFqhwPrmvfleFO1CrREcxtSiYALoF
	Sg3CzdALyc2kZ3T8Y5J6/id8z8pY8BiCS4LIpqxAStc3EKpCLY59L2jxkRVKmkW4Ca5yWbW9VCc0k
	+5viJljpl1Ed4VIuEuRFFUxqohdLE6OKUsMAnykB70yiDRmOwCOy/sFreavmv4tHVjIbjn8fK/9Wj
	gKfdJVHkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kppRs-0000u1-2C; Thu, 17 Dec 2020 09:19:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kppRn-0000sW-74; Thu, 17 Dec 2020 09:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608196781;
 bh=H90ALHr0RB53R1hF6/W/t+UgKZ2JnM4ogJ0fJrlcTnM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=N81ughe7GO/utaVFeWmOcvXcM6tPTYYmgG7Rqmw53NG6UgbHXj2kh7yhmiRN+TGGf
 83Uvtp5eaFx4oYP8LhNc+S0eEl1eC6chtUm/RaamHAFrnAvzFayebFKVSdhvs6b1ny
 uC+NbxBbPo2BMKBLTmuUgOXGwzewzagbibEr5D9NaWkyddwFN0Br88QeAwCJhYPEWi
 Kg/R4vAa9vWDXM9LFDFnXIJzILwDGyVt6MA5P++pV4nHRku8baXr1cCGkKrDu+bcpi
 zIBa7SXni5POUFjLMhj4uDM0qEfvCGh1Zk9EmFT1MXyua2HOLoFFFOAdLLzNbPU4ir
 nC5kqR1x69dZw==
MIME-Version: 1.0
In-Reply-To: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
Subject: Re: [PATCH v5 00/24] Mediatek MT8192 clock support
From: Stephen Boyd <sboyd@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>,
 Weiyi Lu <weiyi.lu@mediatek.com>
Date: Thu, 17 Dec 2020 01:19:40 -0800
Message-ID: <160819678048.1580929.17802518526715179114@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_041943_348876_A47EF187 
X-CRM114-Status: UNSURE (   7.16  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Weiyi Lu (2020-11-08 18:03:25)
> This series is based on v5.10-rc1 and MT8192 dts v6[1].
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20201030092207.26488-2-seiya.wang@mediatek.com/

This series doesn't apply for me to clk tree. Please resend. Also,
please remove the dts patches from the series as they're not relevant to
clk tree and please get someone to review the patches on the list. I'm
only looking now because nobody has said anything in over a month.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
