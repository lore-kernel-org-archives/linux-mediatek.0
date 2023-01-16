Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C051C54EBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 15:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwC531K/PpKwSkNg0Cbd/bjsXw4JI2VqixI6vDHamf8=; b=C2211aEy4xctJFLpTkTtlxraXk
	A0oj+JAq7CopJA44PNM6LN64x9qhcUw+SliyIyPsRTEZcHINGa9Z0N2rhweb0/YqTU6ngWp/0pjnd
	68gxMupSV0LjgVTPXpg/IMLSI+P0/DU+DsourWUBbTdcTavJI/6PbOyqzzTI16ibg2XfEwY2RQ3SS
	yn+25+Juvj/kY2b88bzmPnWKA+YxyuN4sA30r9VG/t/DVIIEqizqMVcozBZBYM7g5fxtgeoHMp2ZF
	LbSCfLUTpkFi1Ue+9nOZ5b8JHVkAIrQUQoEC6PkIRHYxYHazPBLpty7Sf0flvv7oo0DtwTUs4EIrE
	v7c4fO3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHRcW-00B9De-LA; Mon, 16 Jan 2023 15:42:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHRcL-00B9BJ-DM; Mon, 16 Jan 2023 15:41:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C1601CE122F;
	Mon, 16 Jan 2023 15:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A60DDC433F0;
	Mon, 16 Jan 2023 15:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673883706;
	bh=ZAViVdWgWJF2xmiwYZ5ME7mFHym9Ugm2BLe34iIjMPk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=dMH7mLuDJED385miiPcmZui2MMipffpOYZLVMFlgYt+J0LHn4x7BzYXP0IJp0U+Mi
	 3+pKG3Xsy7QGTiGDR8PRnbQtFNx7TgjO7fGywaiQn6NjspzxIgB+NTgcSJaZRo0NHv
	 AfgY2todl2oUgYybgRXTpRStH8kEUTGAdeN41W+cgDgIq22exEafl1n2IEmGgRZiVh
	 7z4ZHQG93HkzDjMa7GXOiVe7UWlUdyqG9jr1+QD4hMo+yQ2E5XjgjcpuV1zl5yJzJr
	 gIOX4OVbd6BjkxhqtNIZjr3NZN4RDtDG91Be6RjDAXRysW3IbqHXslLWJrmQ7myoUI
	 08VguV/vAOl+w==
From: Kalle Valo <kvalo@kernel.org>
To: Aaron Ma <aaron.ma@canonical.com>
Cc: nbd@nbd.name,  lorenzo@kernel.org,  ryder.lee@mediatek.com,  shayne.chen@mediatek.com,  sean.wang@mediatek.com,  davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,  pabeni@redhat.com,  matthias.bgg@gmail.com,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt7921: fix error code of return in mt7921_acpi_read
References: <20230116152235.1433484-1-aaron.ma@canonical.com>
Date: Mon, 16 Jan 2023 17:41:39 +0200
In-Reply-To: <20230116152235.1433484-1-aaron.ma@canonical.com> (Aaron Ma's
	message of "Mon, 16 Jan 2023 23:22:35 +0800")
Message-ID: <87tu0qxz9o.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_074149_635419_E74C05B2 
X-CRM114-Status: GOOD (  11.79  )
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

Aaron Ma <aaron.ma@canonical.com> writes:

> Kernel NULL pointer dereference when ACPI SAR table isn't implemented well.
> Fix the error code of return to mark the ACPI SAR table as invalid.
>
> [    5.077128] mt7921e 0000:06:00.0: sar cnt = 0
> [    5.077381] BUG: kernel NULL pointer dereference, address:
> 0000000000000004
> [    5.077630] #PF: supervisor read access in kernel mode
> [    5.077883] #PF: error_code(0x0000) - not-present page
> [    5.078138] PGD 0 P4D 0
> [    5.078398] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [    5.079202] RIP: 0010:mt7921_init_acpi_sar+0x106/0x220
> [mt7921_common]
> ...
> [    5.080786] Call Trace:
> [    5.080786]  <TASK>
> [    5.080786]  mt7921_register_device+0x37d/0x490 [mt7921_common]
> [    5.080786]  mt7921_pci_probe.part.0+0x2ee/0x310 [mt7921e]
> [    5.080786]  mt7921_pci_probe+0x52/0x70 [mt7921e]
> [    5.080786]  local_pci_probe+0x47/0x90
> [    5.080786]  pci_call_probe+0x55/0x190
> [    5.080786]  pci_device_probe+0x84/0x120
>
> Fixes: f965333e491e ("mt76: mt7921: introduce ACPI SAR support")
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>

Felix, if this is ok should this go to v6.2?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

