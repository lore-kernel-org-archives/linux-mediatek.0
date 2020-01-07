Return-Path: <SRS0=GJVM=24=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69802C32771
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 02:56:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1979920656
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 02:56:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B48Q6SP7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sF1kFZXt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1979920656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3xHEpuSipnP+QFuUUM5mztI74kqHB54iHAKGntQU/is=; b=B48Q6SP7fRolVt
	t8aaMkkHW74zQ/2vSepD1fpLqNO+6C2e2h/npmDeleOldsDp6ExTV1Ur6/NK8m27dToulRUzm6F5V
	wBtnfp3LSN0/QOMgOTQDPGNFCLp4Kxu4cnq98oPUkvTjZbK8iswrJvLdvRoqtS7/xObv65IQEtwxt
	f+y/tuJTNnMY6wTsiEw7JNyeoaLVMDWCjDxJAWcaBAU4KvTosZkQkVBbomdO52EYdH4t4ygXR+4Pr
	CVLgOmMPZJLbPjp7KJ8FR3yLeCd7ppEJORXsNSzFyP8Z+bex0aM/OBFUlbqVq2B6ACNpR8RRzdzyq
	B0iGpNM7AoNzKFP66AbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iof2t-0003lz-DB; Tue, 07 Jan 2020 02:56:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iof2q-0003lL-3C
 for linux-mediatek@lists.infradead.org; Tue, 07 Jan 2020 02:56:38 +0000
X-UUID: 7d582e8614b94330bda6231b3d711262-20200106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:To:From:Subject:Message-ID;
 bh=WvLYzmY4ueg2Fb5nUQMyGzQBFOIPCUF9ozekNaAJI0w=; 
 b=sF1kFZXt2IYCWEg2gsZH0wChmxMBqEYOiPXtxsYHfvIRYRFmITBjArmOj2GU5/uJDRvct4b+6AV54lgzEueZZgez9Iwgo/KpCEMWhRY3iZU7Wsvjbuh3Tk3q0n3+uDEbeldTLhR9I/85M1oyXY69y2CYTCAzoQ9S8a1gQlsC/oo=;
X-UUID: 7d582e8614b94330bda6231b3d711262-20200106
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 580940863; Mon, 06 Jan 2020 18:56:33 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 6 Jan 2020 18:57:03 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 Jan 2020 10:56:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 7 Jan 2020 10:54:59 +0800
Message-ID: <1578365790.28495.13.camel@mtksdaap41>
Subject: Process identical patches in different tree
From: CK Hu <ck.hu@mediatek.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, 
 MatthiasBrugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>
Date: Tue, 7 Jan 2020 10:56:30 +0800
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200106_185636_269185_2F79B989 
X-CRM114-Status: UNSURE (   3.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Hi, Dave, Daniel, Matthias:

In mediatek-drm-next-5.6 [1], I've cherry-pick 3 patches from
v5.5-next/soc [2] because some drm patches depend on these cmdq patches.
So these cmdq patches exist in both tree now. I want to know how to
process this case. I think we could choose one of below way:

1. Because these cmdq patches are identical in both tree, so each tree
could do its own upstream and the there would be nothing happen when
merge.
2. Let soc upstream first, and mediatek drm rebase on the latest
mainline then upstream.

Which one do you prefer?

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.5-next/soc

Regards,
CK
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
