Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E834CA5FFD
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 02:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:References:Message-ID:In-Reply-To:From:Subject:Cc:To:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqSzphL/B2G51xbd5d08UxQzg64DGWrIWeuZEENfUTw=; b=tAit0m5uu8vxZogSp1ZVNrLoN0
	flc7tVyoAGABvc7Z8UiXfqsEmkllge7DFAKQdCy7qNR19rvCKGvkq2bsTtluxXtoYfj5WyQg313RW
	UQKQhSSsDBH6O8XBIEo+jIUkLqlcmC3P3zEE9FhTQGWFdHLZQabLoce0yrVV8UlE6bbHFc7hIgcUE
	tgpbqJWDN5HL3PgwvbntQFZ+bZJybWNPUgylofPT7uOC/sOh65VmLP6s3Zhe8y/OGAzpcLpGY+KEX
	1h+MFkug1i8E30qCm+Cxbxm1ujNsouwMLmye9NV6hDIamExHgEQFVBdZku5WGg/ll53mlLfX1BztA
	QLiVE8zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDv8Y-0000000HW8g-2q1l;
	Tue, 06 Oct 2026 02:42:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDv8W-0000000HW8P-3f6V
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 02:42:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E7574601F1;
	Tue,  6 Oct 2026 02:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4A81F000FF;
	Tue,  6 Oct 2026 02:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791254555;
	bh=UqSzphL/B2G51xbd5d08UxQzg64DGWrIWeuZEENfUTw=;
	h=To:Cc:Subject:From:In-Reply-To:References:Date;
	b=E0BdGj6aJh9tiWoTLbiFqMbcg5GEYafztt1so8p4/pLaVhu9HtF95zhrYK0qeSOgB
	 1uvahyvdMkunLGE60mo2AyEYGWY+kG7L6GL5iuxht4Z4lzzlDPkphaH7oAIkeENjM4
	 3O0f1pyu1SZzdXbcHKSfBAb/0pKg87DXuz9KmelH356Tzskmc/zQ1I8p7McKVLPThy
	 2hc+TRIyhCMROLMbLQCfRmtMfqJvkGxRvqb8JNZVmZpREEies96QPbw0vq2tGTV+Mo
	 LY52zBJhFnHo4/LXwc4Gn8BluKmrJiseKaeJgfYXXux6UADPJmIhISHd6RlrO6+qUL
	 WCes/LhH626kg==
To: Sandeep Dhavale <dhavale@google.com>
Cc: "Martin K. Petersen (Oracle)" <mkp@kernel.org>,
  peter.wang@mediatek.com,  linux-scsi@vger.kernel.org,
  martin.petersen@oracle.com,  avri.altman@sandisk.com,
  alim.akhtar@samsung.com,  bvanassche@acm.org,  santosh.sy@samsung.com,
  h.vinayak@samsung.com,  wsd_upstream@mediatek.com,
  linux-mediatek@lists.infradead.org,  chun-hung.wu@mediatek.com,
  alice.chao@mediatek.com,  cc.chou@mediatek.com,
  chaotian.jing@mediatek.com,  tun-yu.yu@mediatek.com,
  naomi.chu@mediatek.com,  ed.tsai@mediatek.com
Subject: Re: [PATCH v2 0/2] ufs: fix POST_CHANGE pairing and AHIT race
 condition
From: "Martin K. Petersen" <mkp@kernel.org>
In-Reply-To: <CAB=BE-QT1oy=XD_MFWaR+VvKG_Kpk3jszDpAtUy=EyK9uU5fbQ@mail.gmail.com>
Message-ID: <yq1se2jim7z.fsf@mail.kernel.org>
References: <20260914085148.136429-1-peter.wang@mediatek.com>
	<yq1jyo8pwwc.fsf@mail.kernel.org>
	<CAB=BE-QT1oy=XD_MFWaR+VvKG_Kpk3jszDpAtUy=EyK9uU5fbQ@mail.gmail.com>
Date: Mon, 05 Oct 2026 22:42:34 -0400
MIME-Version: 1.0
Content-Type: text/plain
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


Sandeep,

> I don't see this series in in 7.4/scsi-staging at [1], or perhaps just
> push is missing?

Just pushed.

-- 
Martin K. Petersen

