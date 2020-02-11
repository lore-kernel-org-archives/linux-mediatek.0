Return-Path: <SRS0=52uS=37=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CAFEC352A4
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2020 02:06:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21B5F2070A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2020 02:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MmWVB0xu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nrqRBlx0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21B5F2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ul89fSA8QCzHrlG1JhZzLunBNbbo8FYvCrRPiUR1hNo=; b=MmWVB0xuktCzEI
	rfaFEYMKvAY2Gcs9b5Oiu8iwGKzWdu5XWCVTwVFIu3I2SgUmT49Rg6TNTJ64XJ1X21wKe3JLrgyS5
	6ql3h+oxkEoe0H7l8MWAwvU2umnzB9LnqD6o7yVSIP4kEf8Zkm29B/QMFzc7LzgJYCCOK3yohY+xp
	G1xAYLfK/PX2fl+/qrwilfQPPgzfuvP0+7aPkwBVr4iU0CUrSjW9JksPkjpeh4lhRvFoySHtBrsUu
	6dyGQcFPuJV3G23xvibDRuMHlai19up7I1q+UZexkbXibYyxqYJYAKFQTlha38UQrn0sV3zt+aCSR
	PvtnKYCXodW0PxUH16/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1Kvt-0007tB-9e; Tue, 11 Feb 2020 02:05:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1Kvi-0007jY-NE; Tue, 11 Feb 2020 02:05:40 +0000
X-UUID: e1d35294f99c4f52b464beb93db06c69-20200210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7HU7BQfuPmn02GSFJASjaoD7BKMApKdh/cGvp+sXr44=; 
 b=nrqRBlx0ozXuRVDyhHs4yA8NY0l02AmCGaqxUwMyL9fTH+LeB96UJvLUBcdVL2WGcZHgK76VIh+JyKPgwmt3nUn7Cm7P0066ObU8DvU1oBk+DXfpUbJ7R625KJsXMR+pmU/oVQN/l6iWNoua0LOachtZOJGSrU1mZsUN/XDiI4s=;
X-UUID: e1d35294f99c4f52b464beb93db06c69-20200210
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 958903313; Mon, 10 Feb 2020 18:05:36 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 10 Feb 2020 18:06:11 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Feb 2020 10:04:51 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 11 Feb 2020 10:04:39 +0800
Message-ID: <1581386733.31005.6.camel@mtksdccf07>
Subject: Re: [PATCH v3,2/8] arm64: dts: mt8183: add/update dynamic power
 coefficients
From: Michael Kao <michael.kao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 11 Feb 2020 10:05:33 +0800
In-Reply-To: <963f6a16-152f-f3b0-56fc-4edb3f1023f3@gmail.com>
References: <20200103064407.19861-1-michael.kao@mediatek.com>
 <20200103064407.19861-3-michael.kao@mediatek.com>
 <963f6a16-152f-f3b0-56fc-4edb3f1023f3@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_180538_762472_9E8655DC 
X-CRM114-Status: UNSURE (   9.03  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-01-10 at 15:40 +0100, Matthias Brugger wrote:
> I suppose it need rewording.

Hi Matthias,

This patch was resent following with the patch series,Add Mediatek
thermal driver and dtsi.
I have write all the changes in the cover letter.
There is no change in this patch.

Do you mean that I need to add some word to commit message or
change the dynamic power coefficients?

Best Regards,
Michael Kao
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
