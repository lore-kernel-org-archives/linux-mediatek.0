Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3556EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pq5oDmkvAwZHZVZmoaSp4OM7smApr1zkIH5dkKDyu8=; b=DyMZWaoWrNfQSGdlGk+LynMNGm
	IXSJcmqXi6edGjdAET3FHEjlIY1dyLnZGx+6IQnXWGz+2ExTAI2LyQpfkZtLDT3UYkitZVdanYbMm
	Fi2nOm2/I8hmuuSLzTOwNjt0ZfWJmNwfrh4ZGmhm5GlXBz80HjM+hJITke7O9pZ/FyJakJqFvBaKG
	N8i/GEO5mSG+RJzLaVtClh6wsY7s0U2uVme2nKVdMwZR6QJL1fSLTC/o+k8fu/mePCMEJPy1yJdLu
	PC7LYzhSRM/E6XIuJipNAGAALZJB1E3Q82cyICskU9PlBse9MDGuzjJXtYlFK2FT2cA76bZL5jQiA
	/Py7eLiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6bRJ-00DBgX-6w; Wed, 29 Jun 2022 17:25:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6bRG-00DBfk-5N
	for linux-mediatek@lists.infradead.org; Wed, 29 Jun 2022 17:25:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 15C2D61E16;
	Wed, 29 Jun 2022 17:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F91C34114;
	Wed, 29 Jun 2022 17:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656523514;
	bh=QgmluVoFXSlkEquZxV35J0nPPvF64+8WTO/UHudGnBM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZUaXzKsrBU81RMS8IJX07fLGUJjq1EBc1yzn8VMohQlqosN+Si5DZfYKqCawWZi5Y
	 kgTfXPU+UaqRoZ9pdmh9mmGp5OGQpReGPQ+ioXkXh9PpX+qSOPDGHym6wB56VqkmoN
	 3wui9fLizj7RJMeOWJLtx4jo20ajlykPIICLG6+gjIRwprnOyFuZeufHDuF1LBT6n/
	 6XybWwfcqavJpWYiqlYwpA+nHrQKJwbCRZIbBi3rC5lH91DlTzKIEmUyH7x9JPoa8J
	 +54yefAAAlM1vSvVfwE7lcT7JDZ61DMSVrX77LsitW25alOODuN910I+GVUAJDfNwI
	 Q0dKOogm4xonw==
From: Kalle Valo <kvalo@kernel.org>
To: Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,  Ryder Lee <ryder.Lee@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  <linux-wireless@vger.kernel.org>,  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/2] mt76: mt7915: update mpdu density in 6g capability
References: <20220622012449.17797-1-chui-hao.chiu@mediatek.com>
Date: Wed, 29 Jun 2022 20:25:10 +0300
In-Reply-To: <20220622012449.17797-1-chui-hao.chiu@mediatek.com> (Peter Chiu's
	message of "Wed, 22 Jun 2022 09:24:48 +0800")
Message-ID: <875ykjpekp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_102518_277365_A481DBFE 
X-CRM114-Status: UNSURE (   7.56  )
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

Peter Chiu <chui-hao.chiu@mediatek.com> writes:

> Set mpdu density to 2 usec in 6g capability.
>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>

Why? The commit log should explain that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

