Return-Path: <SRS0=NTS1=G2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B178C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 23:43:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86EAB22B2D
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 23:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86EAB22B2D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wsRRWXyu1CxWZtTHd8oD8XNI1QbnfaLMEjYllfa9aY4=; b=2W+eCV4hV3Fpq5HQP6DQFc/a0
	6SYMMcUOZG+fXn9T27/DGn3ike0qdHQXE1OftvTQndSeRBNO7SjyzpfWQQw3WOStoiM0ikwZcUhIh
	DIWW2NuJcCYgYpSIS0J1NrezH5xX1+yintO74fACYtcDDtow1FHFF4uHscbFt1IqG6A9JowUIeO1Y
	zcy3dw4c6dhDuadczW2ZVaEzN7XX2HuFoVOv4CiXf2kGF/uDKebTqUSEGMyY1QT8Xal60qc1SWazt
	oAwFmRbYg4OJOQk/sRoDT17ZG6yu4fnkz6QoVEwziWzbvw/FxuzVHBWldetXi/+uzj1ZpMMSOVOiX
	KVTu2gc1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3SYX-0001Q0-GJ; Sat, 23 Jan 2021 23:43:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3SYT-0001PU-OK
 for linux-mediatek@lists.infradead.org; Sat, 23 Jan 2021 23:42:59 +0000
X-UUID: 825ce83eeafc450687412b472f481af7-20210123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RmcVveeIefgDUgOwS+Ih+AHcK2gejgiXviQUCSu/0RI=; 
 b=C+hs7af7OZ/zY/WW9Ipr/O6irl48fLqHhIkK8yUH9eVZwIjGHYT2tb9Nroymj2A90c0HEBoYWbl1UT83gvH600nLWiK4VNM7Adf09MEA/oQ3zc72YhERAgoNyFy4p0w2erXJsGIHV8RAOTdYwYCKQP+0ysb11od1nc/b4d8CEKo=;
X-UUID: 825ce83eeafc450687412b472f481af7-20210123
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 647776979; Sat, 23 Jan 2021 15:42:50 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 15:42:48 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Jan 2021 07:42:35 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 24 Jan 2021 07:42:34 +0800
Message-ID: <1611445355.17464.1.camel@mtkswgap22>
Subject: Re: [PATCH -next v7 22/22] mt76: mt7921: add sta statistics
From: Ryder Lee <ryder.lee@mediatek.com>
To: <sean.wang@mediatek.com>
Date: Sun, 24 Jan 2021 07:42:35 +0800
In-Reply-To: <8885b6803848b5a4302b523d9cf7430c05478280.1611389300.git.objelf@gmail.com>
References: <cover.1611389300.git.objelf@gmail.com>
 <8885b6803848b5a4302b523d9cf7430c05478280.1611389300.git.objelf@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_184258_572225_89AC32B9 
X-CRM114-Status: UNSURE (   7.86  )
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
Cc: robin.chiu@mediatek.com, ch.yeh@mediatek.com, Eric.Liang@mediatek.com,
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 Soul.Huang@mediatek.com, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2021-01-23 at 16:35 +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add sta statistics support to query current tx bitrate
> 
> Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
> Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7921/main.c  | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)


why didn't you just merge this into [-next,v7,05/22] mt76: mt7921: add
ieee80211_ops?

Ryder
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
