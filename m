Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57866C4320A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:07:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 241EF60F57
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 241EF60F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRXzs3y6lmvh9dEw5if3L9qpLh09Nq8FEyjCl7k7aJ4=; b=Y9CHliypI8I1q6
	JzTU9U/BtSK0/bp7opeKiPInujuczljC37bvoR40wKzGHuix9y9atR0yYBTB77wrhRJOHZx1YjuAS
	j/uuClNNlSYUGnlHH31nYgHdORJ5yy1Qj5/bwpeoHC6Ab1SnGm7QBlw+kxfjnteD2Fy61VjoIWahe
	aq0XKT5UqrUVUs0OEwvq6NVI5QQ4DlZNJoTS5SqY0ZMkAM/buyVGF1PU84uwPRL5VNQdOMW4P5dF4
	+QAajMDLbB18tgRflc8hNlwwvoiOZWlzMKEnnTXErY9um1tyo3wZ3TmAZH76YHVMpxXclKGOkMvcI
	NJqn9/M5a5ZppojNA8RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RUO-00FirL-W8; Tue, 27 Jul 2021 18:07:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RJt-00FdrD-8G; Tue, 27 Jul 2021 17:56:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C8646056B;
 Tue, 27 Jul 2021 17:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408604;
 bh=ZF8wgQL8ya5hJrdbE7ElZ+y/AC2fEVAzKC0WCAIOM8g=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Id2UwbcXa69DeFUAt19RScuQ+/V175vPfIsktNnDwVrVGz+IEVUN2TLckNFVSq26N
 EaG6KWN7dK5+Bi4kKKv5U9T/tXZvXubi2fSZUwY1yljOQT4QE+b3cNIgsUCAtOm/EC
 +lm+q1lJrgowUyl0XBHeBPV6ksQblupj++I27MJDHPtaUHYUjB6kaw5rQbmPch43Vk
 6G1rUZv7ae2uqdI1LM8BwXK98c3qqPZTE7EI84mAXv5UjviKcR73COfInDxqtPBhg9
 6FlmSKbXtfS1VyKA71MLRSfLAz5XH0WhiKsfGeRLCiAX+y97ZqzTY0+xJq7NMOJtBI
 TkKrpnDiI19lw==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-16-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-16-chun-jie.chen@mediatek.com>
Subject: Re: [v14 15/21] clk: mediatek: Add MT8192 mdpsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:56:42 -0700
Message-ID: <162740860259.2368309.5808478569910109438@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105645_347110_564F3479 
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

Quoting Chun-Jie Chen (2021-07-26 03:57:13)
> Add MT8192 mdpsys clock provider
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
