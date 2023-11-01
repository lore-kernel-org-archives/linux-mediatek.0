Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD09C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Nov 2023 13:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGSBVuEbXiVvic5sWNycRxfBXSuhCnG5cgMxmkautXQ=; b=Ry1iByg2Vs36knNCW/f+kTeDyl
	e4+pJL49OagRUpxt8/7dmyU1axxjA/Qd15bg9KTwDt08aORu/42ZMhL1P50TolqJKjM9GwJT18i5B
	S34kXJ12nDD1Zbjepv4vVlOUheYBTSws1TTlbNSRPSGv2xfha8XPXpLGD02+wk56byL9hVx96HWpa
	5lBK4vwNR8eTeXbRgDhTlISq0vILgW1k8ifTp0b56PR9UFt1rNMbSdqR8Si56kYmF4ZiC0qJ6nUe/
	SnXaLJh4m4XOgNH7y0IyaNe70KYiwSQaLjM5ruNpklXkeAEJCd7bYA3ex06amNMsXDMYPROgiI5CL
	Os0WDq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyB8Z-007ZLd-0f;
	Wed, 01 Nov 2023 13:19:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyB8W-007ZKq-1Z;
	Wed, 01 Nov 2023 13:19:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B950160B98;
	Wed,  1 Nov 2023 13:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A34FC433C9;
	Wed,  1 Nov 2023 13:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698844794;
	bh=wMsbiq8mxqi0Aabju/Zt8NFoQfuizV+q9reXZUKkN6E=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=EXWkWN6Fk7+PdfzDVy32SEf56gXKxDiiv4aANU0kF4uSc6SCEhF2mLHMzSkI1d9L8
	 iSy5CpimTCetbBXXNaXOqOPcToCfK+C2tPwLJyKY7HJnRa+DRFDI6YQC4dNPVDRp8A
	 /T8/E95IUhq+DwMNoJxDGO03dhzoz0z/4yzk4+FTDpWlgnW+iRqrEHtbwREOhhQTYe
	 2wUJKw9YfqCz6CEJzgLWMRmgApmDAQHFF90p/b8Lses1IgF3pSM3c1mnoeGMhipd8n
	 +P4TQnJCjH99VO6tmncCPN926QGM6zw4PBsJPkSSz6e8lhB0iXyZLMYNPR/ES+Lz+j
	 /mFgicj2XqzSA==
From: Kalle Valo <kvalo@kernel.org>
To: Tom Waldron <tom@baremetal.dev>
Cc: linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] wifi: mt76: mt7921: Add a new VID/PID 0b48/7922 for
 MT7922
References: <20231101095533.45258-1-tom@baremetal.dev>
Date: Wed, 01 Nov 2023 15:19:51 +0200
In-Reply-To: <20231101095533.45258-1-tom@baremetal.dev> (Tom Waldron's message
	of "Wed, 1 Nov 2023 09:55:33 +0000")
Message-ID: <87o7gdbog8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_061956_584393_D434A067 
X-CRM114-Status: UNSURE (   7.77  )
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

Tom Waldron <tom@baremetal.dev> writes:

> Add VID/PID 0b48/7922 for MediaTek MT7922 wifi chip.
> Change tested on Redmi Book Pro 15 2023 (Fedora 38).
>
> Signed-off-by: Tom Waldron <tom@baremetal.dev>

Should I take this to wireless? Felix&Lorenzo, ack?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

