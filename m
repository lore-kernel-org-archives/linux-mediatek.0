Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27487CA5FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tloYHaVbYNU0rRAf4/HuoJhNrp+JOWU7kTTUF5xT1v0=; b=Pz6QsMuvfUofzuwNF0tBsRyF0o
	tJsMrqYxqkK9jkYiJfSJkwL1VER5UZOI7EOiH6T19042UfBPaVJ2wJkdTWf9s6TSuz/6VvJYYErcn
	qsVRGYIBjJj4n1BGH3wgrneBd9zOHjivBDeomUc+gJU/0RQsJC0hdvnf0KhO/bsLWaS3mDnodBCcL
	xWVklHp0HcmTk7Suj39PRXP6P1UVrq/U1mSQhDW+z0rX77v6GZv4/GEQLp7fy7jXysOVG1u4wR/k7
	FZsXhpLqgaVomOSt0PTXxjGE3uwhQamGbVScG4gzlKr0udcCs7lX98M8i0Hvv8ZXWUpZlXNPVOphX
	LIohg58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1tD-00000000QyR-0Sl1;
	Tue, 06 Oct 2026 09:55:15 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1tA-00000000Qxl-41xU
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 09:55:14 +0000
X-UUID: 022d4f88c16c11f1afed4741b24580c9-20261006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=tloYHaVbYNU0rRAf4/HuoJhNrp+JOWU7kTTUF5xT1v0=;
	b=m9c9hcc0s17okh7Ck/7RJruZyLI/v/3fxQZ8Bti9xWMalm7xQl0BWWA+brCXSdmv27vCHdZbvxGb19bUhkcCPRKfPCfCipvkIW6QzGOZlcg0kNYqmsk1v5GCXt29VNLV1PeQNX/i+c7DNretKj1d7yLGVWZVPLiRpSCAiAB7yus=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:b47803f0-ab1e-45af-babb-77b4318013a9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:21b76856-66df-4ed9-ba9a-e32623d07625,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|836|865|888|898,TC:-5,Content:
	0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 022d4f88c16c11f1afed4741b24580c9-20261006
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <alice.chao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 242151255; Tue, 06 Oct 2026 02:55:06 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Oct 2026 17:55:03 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Tue, 6 Oct 2026 17:55:03 +0800
Message-ID: <ac1b17147198b189e606083e181db8802b72fac1.camel@mediatek.com>
Subject: Re: [PATCH 6.18.y] scsi: ufs: core: Re-arm the device command
 completion before submitting
From: Alice Chao <alice.chao@mediatek.com>
To: Bean Huo <beanhuo@iokpp.de>, <stable@vger.kernel.org>
CC: <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<martin.petersen@oracle.com>, <James.Bottomley@HansenPartnership.com>,
	<bvanassche@acm.org>, <avri.altman@sandisk.com>, <alim.akhtar@samsung.com>,
	<wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>
Date: Tue, 6 Oct 2026 17:55:03 +0800
In-Reply-To: <1912caf84d99bc2388960c907184f06689806ee6.camel@iokpp.de>
References: <20260915052638.459390-1-alice.chao@mediatek.com>
	 <1912caf84d99bc2388960c907184f06689806ee6.camel@iokpp.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_025513_026153_D7EEABCE 
X-CRM114-Status: GOOD (  17.48  )
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

On Mon, 2026-10-05 at 13:54 +0200, Bean Huo wrote:
> The late CQE can come after the re-arm:
>=20
> timeout -> cleanup -> retry B -> re-arm -> send B -> A's CQE arrives,
> and then B
> is woken up early and fails, if B's own CQE in turn comes after C's
> re-arm, C
> fails the same way, and C may even read B's response as its own.
>=20
> Whether this stops depends on device latency against our retry path,
> not on the
> patch.
>=20

You are right. Re-arming only covers a late CQE that arrives while no
device command is in flight. The query retry wrappers resubmit right
away, so the next re-arm will usually happen before the previous CQE
lands, and the skew can cascade exactly as you describe. It is also
worse than an early wakeup: every device command shares the reserved
slot's response UPIU, so C can parse B's response as its own and
return a wrong value rather than an error.

> The root cause is that all device commands share hba->reserved_slot
> and the CQE
> carries only the tag. Since a successful SQ cleanup must post an
> ABORTED CQE,
> could the MCQ timeout path wait for and consume that CQE before
> returning -
> EAGAIN?
>=20

Agreed, that closes the window instead of narrowing it. In v2 the MCQ
timeout path will:

 - after the SQ cleanup, wait (bounded) for the reserved slot's CQE -
   the ABORTED one, or the regular one if the command completed
   anyway - before returning;
 - if no CQE shows up in time (e.g. cleanup failed, or
   UFSHCD_QUIRK_MCQ_BROKEN_RTC), force a host reset and refuse device
   commands outside the error handler until it has happened, so the
   slot is not reused while that CQE can still arrive;
 - keep reinit_completion() at submission time as a safety net.

> does this patch only covers a late CQE arriving while no device
> command is in
> flight. Did you test it with injected timeouts to see whether it
> recovers?
>=20

Yes, v1 only covers that case. And no, I have not tested it with
injected timeouts yet.

Before posting v2 I will run it with injected device command timeouts
in MCQ mode: periodic fake timeouts under a descriptor/attribute read
loop, with the values checked against known-good ones, and the case
where the CQE never arrives, to check that the host gets reset and
device commands recover. This will also show whether our controller
actually posts the ABORTED CQE after the SQ cleanup. I will run the
same injection on v1 and on the unpatched kernel for comparison and
put the results in the v2 changelog.

Thanks for the careful review.

Alice


