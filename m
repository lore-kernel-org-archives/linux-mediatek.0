Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D612DC83F3E
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 16:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kcca4FlEDI5ESHoCWuK4T6U6/hTjj30tWOt0JkRTJZo=; b=wM9FJtj3i1aiA9wgCe2rQb3Ru/
	dbEL/iU7YDjlCgddy9kxbmjmhKgD+WEVo4R2qDnQW0VLsSCLYTxIMrW4d8hoEt0zJoYeWDzjjfmU8
	Mzj9ZcMH5iNg9KdFvZ50dZ2EVdXAj/ZPznk/k07JWeRr83rK3D9rAH6pCLrTUYP4vGFFZQ7DOYsbE
	ckpeTjY3RfFQ6BF2tUzEdmfeB5YmhViKwVzuTgrtwkRSGU6uvES71wDeCEb9YPRZDDC35eqJbKKQy
	G+5wWetPZbWMbdQcvlGoTaq88si5r1w1tdHwLEnDRKH+A9tYXlsXu4q5zC7GrvnsuCr/WS9sW83Fz
	HRyxoWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdZ7B-006NyQ-1z;
	Tue, 05 Sep 2023 16:41:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdZ78-006Nxl-0l;
	Tue, 05 Sep 2023 16:41:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5D0A3B81110;
	Tue,  5 Sep 2023 16:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81B1C433C7;
	Tue,  5 Sep 2023 16:41:13 +0000 (UTC)
Date: Tue, 5 Sep 2023 12:41:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
Cc: <mhiramat@kernel.org>, <bobule.chang@mediatek.com>,
 <wsd_upstream@mediatek.com>, <cheng-jui.wang@mediatek.com>,
 <stable@vger.kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] ring-buffer: Do not read at &event->array[0] if it
 across the page
Message-ID: <20230905124132.672be4c0@gandalf.local.home>
In-Reply-To: <20230905142319.32582-1-Tze-nan.Wu@mediatek.com>
References: <20230905142319.32582-1-Tze-nan.Wu@mediatek.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_094118_427428_DB46B2E7 
X-CRM114-Status: GOOD (  10.82  )
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

On Tue, 5 Sep 2023 22:23:15 +0800
Tze-nan Wu <Tze-nan.Wu@mediatek.com> wrote:

> resend again due to forget cc stable@vger.kernel.org

You don't need to Cc' stable. I'll add the Cc if I feel it is the right
patch for the solution.

-- Steve

