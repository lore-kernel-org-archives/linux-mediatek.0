Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576B1C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpCb4xA/Xo6OygtX4UXIQ7xkUou7+ClTnuwwDRI9VTM=; b=3SudjLhDGxGaFxVZrWbfjpXHY0
	M6Tr/bt6P8733ChZcUnt+trPSuN2m51pFf8AWP1zbvXj6ARbzZ0x2KigffZWKa2w9CtDGnqM5C7p9
	jrUtD8QbTV5iHh55efT0Gg/RibfBSRNPYdhngp2/WF7f+kY4mAkwh+FngbZMtnFlbZ4FvyNtCmpI+
	teOD/8U4yVAOVFNWbfriga9EFBN2hGG9QBQ55e3cjWhQJAcXH1LPir7KCNUBRKmHAuxesI/YUpp+8
	9iU51xCvyniQLcSVAGx26jZX85g5P/y2HNzlPBm5/2C+a2mFDi6ac88Xlcd1sRHnmHenpL+qSWY6l
	YXZ7Q55A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8SqT-009PuR-0R;
	Wed, 29 Nov 2023 22:15:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8SqP-009Ptl-37;
	Wed, 29 Nov 2023 22:15:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B89561D05;
	Wed, 29 Nov 2023 22:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57631C433C7;
	Wed, 29 Nov 2023 22:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701296143;
	bh=plgOXsBw6Cgzi7c+sOMbPbteFDD/cEFFdXdKvhv6+P4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zexjm4Co0EhbtqVufBP3QVY5t/FKctGeVJLCxYNrdXXGByHewpU1LSj2DZ412YRXs
	 mT6+LLpxo81J1C8HyW3PRtesuArvpT+ocnvARABWCODRJ+D/rCMN1X+4Mh339MGFjK
	 GgEFdo6cTQWzLyo7bLsyjdcIN75ceQHfteCUres8=
Date: Wed, 29 Nov 2023 14:15:42 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>, Jan Kiszka
 <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, casper.li@mediatek.com,
 chinwen.chang@mediatek.com, qun-wei.lin@mediatek.com, linux-mm@kvack.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/3] scripts/gdb/tasks: Fix lx-ps command error
Message-Id: <20231129141542.56d76170d38f2f6ee6b9ece3@linux-foundation.org>
In-Reply-To: <20231129081009.GF22743@redhat.com>
References: <20231129065142.13375-1-Kuan-Ying.Lee@mediatek.com>
	<20231129065142.13375-2-Kuan-Ying.Lee@mediatek.com>
	<20231129081009.GF22743@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_141546_073368_1CEF1C16 
X-CRM114-Status: GOOD (  10.17  )
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

On Wed, 29 Nov 2023 09:10:09 +0100 Oleg Nesterov <oleg@redhat.com> wrote:

> > Fixes: 8e1f385104ac ("kill task_struct->thread_group")
> > Cc: stable@vger.kernel.org
> 
> Is it possible to merge this simple change before v6.7 ?
> Then "cc: stable" can be removed.

Yes, I shall do all that.

