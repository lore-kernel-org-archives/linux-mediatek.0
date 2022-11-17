Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC25C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 12:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSMwL5TAEkn9jaJ+pXOgkAOzUQuw+IhPLPDwZK0fs8w=; b=kjPsI7C8+6yksvisTohUCMahMR
	hqbxdusha4kIDPxKuk0AF3NwzpLYFba+yLVSZhNUiiPGEmMtVgJUPHfaSaWpwhCTVlNsaDZa5OqP5
	8D8xzFniEu1EzLeOkRs/AnxwfgYpUSdkPW+txyVC46pC6RJMfoO8KZOio2O7kUKHwk+D5hUa0scTN
	ScJ3DQXKSastDJq/msu1OMzWuEqk+pVancAVtKk7mxW0HtnZfd2g1MqzkMwkgglDfeMKhE+A0QyB4
	9zm0HFIsgyxWtus5Olp3JwmPlKOgGcP1DnKxNJ4cEucwSRv5TIdyz3zK281PnwEgRLOIVnlRoKR0/
	XNRISH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovdfH-00Dfgh-BH; Thu, 17 Nov 2022 12:06:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovdfE-00Dfeg-3A
	for linux-mediatek@lists.infradead.org; Thu, 17 Nov 2022 12:06:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9ABFB61503;
	Thu, 17 Nov 2022 12:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00A3C433C1;
	Thu, 17 Nov 2022 12:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668686799;
	bh=DZ5U+Y/bMNLErZT7zR7UCQD8u/fakXriCnn+jYFVtYE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=iaAxqQeB8FQQwZ57uTQbszkV4dUo9TT+zp90ROO7JDd3ncb4OLPf+ZUMoASKV5nrV
	 A7x9Zsvlq0hqL5WZvoLodjs8zQeA9d5uvUVXURCF/I9SRqMl+wC7ldGc/OCLaDXcVg
	 jIwdUjcHB7PJcqMsvAflQfWpAg60AfsOMB+ZVNSXuBBeBx8P2H2SX04CCPIxqNHBJG
	 1tO5fueaITlArmBRSNMWXyKbWXzSBxga84x6R0mY6AvME3+1m9MIHK/BrQ8XhQ64bR
	 yY/OEJqe7n6F+/o2vGVQmtWVcyZHcIlLeLryV7j6IKjw0ERFhYLTTa0vVUOlFPw6QY
	 MDJ7eC3C3lV2w==
From: Kalle Valo <kvalo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  <linux-wireless@vger.kernel.org>,  Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 4/4] wifi: mt76: mt7915: enable coredump support
References: <3e6ef9fb1d2e09d415b4c489cc9c62134a05b3c1.1668024217.git.ryder.lee@mediatek.com>
	<b65f419a0c7319a6f661e07af7778fecb6cc7547.1668024217.git.ryder.lee@mediatek.com>
Date: Thu, 17 Nov 2022 14:06:35 +0200
In-Reply-To: <b65f419a0c7319a6f661e07af7778fecb6cc7547.1668024217.git.ryder.lee@mediatek.com>
	(Ryder Lee's message of "Thu, 10 Nov 2022 04:36:34 +0800")
Message-ID: <87iljdrdis.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_040640_187638_B732BD9F 
X-CRM114-Status: UNSURE (   7.64  )
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

Ryder Lee <ryder.lee@mediatek.com> writes:

> Host triggered and catastrophic event triggered firmware core dumping
> for basic firmware issues triage, including state reporting, task/irq
> info, function calltrace and MCU memory dump.
>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

I missed that there was v3, please check my comments from v1.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

