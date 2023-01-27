Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ED5C54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 07:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qQs4So+pSypev1LlviOz0ME3iJZwchILd33pvxmPv4=; b=uMy/LAcL+qEXiqwkJ/de4+KHnM
	eDNP1OgYm1ondaGyE1ufn2Ypxi7YyCf85HwhHhjd+H5yvQLDlrTgUz5WDL1C04zX/B9cXkWB4O0z7
	/cadYBx8aJiKRQn2NLMwcIfh925LaOiFtYeCByz3dXfoK2dFY+rJIuDA7uy1cCQZvMp6NMHlpOsaV
	S6qJMxw+ETU6Ltxd0YWfIWbql4qIKjsAp6DT98nd4+vprqEjVvY/1UXodGgRg5XQBVtMvApqWsCUN
	fKtzlof22aP8XLLlIdnNn/T4cnesWRUxWB0rpime/4qOKSpVTCMTLM4XNzoddt32i7AF0EGkLIQvz
	Zetia5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLJGV-00DRUm-EN; Fri, 27 Jan 2023 07:35:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLJGS-00DRTi-4E
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 07:35:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 44E96B81F98;
	Fri, 27 Jan 2023 07:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7235BC433EF;
	Fri, 27 Jan 2023 07:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674804905;
	bh=70plA/u/jZ1FXvVzCBcMxvArW3LDXt8FKc9u4FfzeTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mjrUiFDEhSSm6WnLsbbOFlsBXUe5PkjgkqHD/+VLjkB1U6XUglWWxPZsAOvWZv2rt
	 sw3VTPQtAZ1y+ew+a+qme5Hu6M1d6ojLRuSEPR2QfWCG1D7ZKMG35+Oe2hJtvTzlzv
	 jqtqbd2WzZirahnNJw+YlH/aES82j3+KLiwX5Jmo=
Date: Fri, 27 Jan 2023 08:35:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: stable@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10 0/1] mt76: move mt76_init_tx_queue in common code
Message-ID: <Y9N+ptDV4QKj8h2C@kroah.com>
References: <20230112115850.9208-2-n.zhandarovich@fintech.ru>
 <20230122155910.32635-1-n.zhandarovich@fintech.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230122155910.32635-1-n.zhandarovich@fintech.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_233512_333027_38C69F08 
X-CRM114-Status: UNSURE (   7.95  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jan 22, 2023 at 07:59:10AM -0800, Nikita Zhandarovich wrote:
> My apologies, I should've have explained my reasoning for the patch better (and sooner).

I'm sorry, but I have no context here at all.  Always properly quote the
email you are referring to.  Remember, some of us get 1000+ emails a day
and can't remember anything we wrote in response an hour later, let
alone days or weeks.

confused,

greg k-h

