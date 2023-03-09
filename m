Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C6EC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 09:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2Y+lndMZvPCQFgYhF0b5tZdi1oGwpOpzR4P4QFlUvU=; b=0k3D2F2ShOSUhNnV1hIqpWTsk7
	SU8QYo4CQxmPD1u5iZd2XjJ4UTrogGxpJ/Bn+5hGf6tnsCY4U9ANj68przCTX134mVIjNAlbNxmBn
	ea7tHK9LldCXD8x8GPfxR2rUma/ycDtx2QVGrm7QQr3SnFNQ5uX45OFi3NGhr4TvwDAUh1KzprRXk
	V5nrWHf9hJ7x7ne+ac2ohR6MVgQcD51I0Ufmm4pbBuNZrUeraHNHUuwgg0Phw4muhXlk6eiyqlwOm
	lFraOTBhUo6yVMgyRYWD9o9myUtFEl9NoRzPZiiZBQZrVy2m+EwM5Mnz/3ZxfYI0sxktoGiCTIKAa
	wCOutrbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCTq-008ljx-EC; Thu, 09 Mar 2023 09:22:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCTo-008lj2-Lo; Thu, 09 Mar 2023 09:22:33 +0000
X-UUID: e0a6135cbe5b11edbbe3f76fe852e059-20230309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=u2Y+lndMZvPCQFgYhF0b5tZdi1oGwpOpzR4P4QFlUvU=;
	b=BnDhUGjzF8CCzeA3lNqrcX1LrXqVy9KEB7JxDMAy+kevwMJ404aguWjTCCmL6YPQIPnUBF46LMYNLUpCP6RD1Kypvg3/+kLXo/hbyVFF2NEsHatZ3s0uqBMgkUr6oJ/A3/VrnFSD0rM//qGO9/pkOfwoeDmrVgMzu1OSrcDdKLM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:55a1f89e-d598-464f-81fe-cad8ff422930,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.20,REQID:55a1f89e-d598-464f-81fe-cad8ff422930,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:25b5999,CLOUDID:14b2d727-564d-42d9-9875-7c868ee415ec,B
	ulkID:230308155434OUYWJX05,BulkQuantity:37,Recheck:0,SF:29|28|17|19|48|102
	,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0
X-CID-BVR: 1,FCT|NGT
X-UUID: e0a6135cbe5b11edbbe3f76fe852e059-20230309
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2065328900; Thu, 09 Mar 2023 02:22:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 9 Mar 2023 17:21:36 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 9 Mar 2023 17:21:36 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <elver@google.com>
CC: <angelogioacchino.delregno@collabora.com>, <dvyukov@google.com>,
	<haibo.li@mediatek.com>, <kasan-dev@googlegroups.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <mark.rutland@arm.com>,
	<matthias.bgg@gmail.com>, <will@kernel.org>, <xiaoming.yu@mediatek.com>
Subject: Re: [PATCH] kcsan:fix alignment_fault when read unaligned instrumented memory
Date: Thu, 9 Mar 2023 17:21:36 +0800
Message-ID: <20230309092136.35799-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CANpmjNNw6utf5ozpwu1keDG92Ew_vL6B=LZoRw12p48eVJeNnw@mail.gmail.com>
References: <CANpmjNNw6utf5ozpwu1keDG92Ew_vL6B=LZoRw12p48eVJeNnw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_012232_730655_17DAEE3C 
X-CRM114-Status: UNSURE (   7.24  )
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

> =0D
> On Thu, 9 Mar 2023 at 01:58, 'Haibo Li' via kasan-dev=0D
> <kasan-dev@googlegroups.com> wrote:=0D
> [...]=0D
> >=0D
> > The below patch works well on linux-5.15+arm64.=0D
> =0D
> Thank you, glad to hear - may I add your Tested-by?=0D
=0D
Sure.Appreciated.=0D

