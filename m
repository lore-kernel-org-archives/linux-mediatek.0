Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EB0C54E5D
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 09:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQki1eI8SVL7vuknmmrJsXB51tDn6Ie+ozgQSfZSEjw=; b=B5SrR+9nWlkXlxaIzlVnOI4oP9
	nJDBfR1aCsYOS4PzjIObrmlNmHblGG9XNte7TdCDrEfJPVBi9g6aQcejhFzh7kvIrEvBu7SiVmlpC
	jJZPqMedwm30hjaHb3NPq3x6J/qTfD/wZICN4NyRAqKAc0MA/aETjyRYMtx07KgmOeDrBuIyZar+p
	MnJ7bGhHSW2H61UG5LaXd3L7Pp+Nlg1EtH/CFGJZt/4uO0q25j22e3b5GMlhnemoh0q/4z+mPkfMw
	KbaEYybXnFcLahc4y0oXVCtaUMZwVmb+aGXQXpPeujGqAa3Oil6iHmsXgjsj21S7N9l3Ay6xR1II/
	rr3GI8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmVox-0000000C60F-2Gpb;
	Tue, 19 Mar 2024 09:31:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmVot-0000000C5yU-2uqM;
	Tue, 19 Mar 2024 09:31:44 +0000
X-UUID: 7bd7b4bce5d311ee9aa9374d6d45775a-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VQki1eI8SVL7vuknmmrJsXB51tDn6Ie+ozgQSfZSEjw=;
	b=lYIHsT0V9fBsEoJX7/h7vSysOBHnUiQ3MGSiKFaIyaULp3g2ClQzTPNq4ld9dl39Or2Zw8Ki5Tlh5n2F3eMCO5cd+HRH8NdVJZIg/DEHce/yCsjQYmV3XjJvn86h8w9SxKuRLYKJVfHKVXzT4KE4zWyplE0UAOc7/Vcaq95NzeY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:7d073d12-21c0-458c-ba20-a015cf691c05,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-4
X-CID-META: VersionHash:6f543d0,CLOUDID:7dd12c85-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 50,UGT
X-CID-BAS: 50,UGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7bd7b4bce5d311ee9aa9374d6d45775a-20240319
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <guoyong.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 943933184; Tue, 19 Mar 2024 02:31:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Mar 2024 17:31:10 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Mar 2024 17:31:09 +0800
From: Guoyong Wang <guoyong.wang@mediatek.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, "Guoyong
 Wang" <guoyong.wang@mediatek.com>
Subject: Re: [PATCH] random: Fix the issue of '_might_sleep' function running in an atomic contex
Date: Tue, 19 Mar 2024 17:30:55 +0800
Message-ID: <20240319093055.3252-1-guoyong.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <Zfidal8CEZStp3R7@zx2c4.com>
References: <Zfidal8CEZStp3R7@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.984400-8.000000
X-TMASE-MatchedRID: scwq2vQP8OFq0U6EhO9EE97SWiiWSV/1jLOy13Cgb4+qvcIF1TcLYHG3
	IDkkj7AXYYnmnL3l3X94CDdDyzWksYoNUbXqhOogEdFsavUQKAeVq+okl1rYD4m3+evajL3wMTM
	ELdGCO1o7+AqDyYkkE7zhRZbj1fFhMRXV8lvz/l2GuzokAQvW7hLXa2P1m93zpbyIsT/ya8HwgB
	OtAk1RzXjz1W+ftiuwTkPoEKaGtfHN81HPMxpUIJ4CIKY/Hg3AGdQnQSTrKGPZs3HUcS/scCq2r
	l3dzGQ1rmN9FZqI8KahkbtarVEBrUNxfO5fJyW5aZTIZgj8uzW+tXmB1d47djB5zPBa/PuxMGNP
	4LoAdn2LY5R/XxIRza5kCR6qopRbE1GeEHxFMW90BNB20+SxH7f8mJY57oZddJaBDYald1mHO0t
	VYDV4T0MMprcbiest
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.984400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D8CB58CF87B07B83D4FF05979176682EBF85968089EDCB2E320408EFDFA00B6C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_023143_785217_3DDFEE61 
X-CRM114-Status: GOOD (  11.35  )
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

On Mon, 18 Mar 2024 21:00:42 +0100, Jason A. Donenfeld wrote:
> I'm wondering, though, rather than introducing a second function, maybe
> execute_in_process_context() should just gain a `&& !in_atomic()`.
> That'd make things a bit simpler.  

> However, I'm pretty sure in_atomic() isn't actually a reliable way of
> determining that, depending on config. So maybe this should just call
> the worker always (if system_wq isn't null).

> Alternatively, any chance the call to add_input_randomness() could be
> moved outside the spinlock, or does this not look possible?

Hi Jason,

Thanks for your suggestions. 

I am inclined to accept your second suggestion. My reluctance to accept 
the first is due to the concern that "&& !in_atomic()" could potentially 
alter the original meaning of the 'execute_in_process_context' interface. 
Regarding the third suggestion, modifying the logic associated with 'input' 
is not recommended.

